module source.SpanController;

import hunt.imf;
import zipkin.proto3.zipkin;
import zipkin.imf.client;
import zipkin;

__gshared string HOST = "http://10.1.11.34:9411/api/v2/spans";

class SpanController
{
    mixin MakeRouter;

    @route(0)
    void receiveSpan(ListOfSpans list)
    {
        zipkin.span.Span[] cspans;
        foreach(s ; list.spans)
        {
            cspans ~= toCSpan(s);
        }

        upload(HOST , cspans);
    }
}