module source.SpanController;

import hunt.imf;
import hunt.trace;
import zipkin.proto3.zipkin;
import hunt.logging;

__gshared string HOST = "http://10.1.11.34:9411/api/v2/spans";

class SpanController
{
    mixin MakeRouter;

    @route(0)
    void receiveSpan(ListOfSpans list)
    {
        hunt.trace.Span.Span[] cspans;
        foreach(s ; list.spans)
        {
            cspans ~= toCSpan(s);
        }

        upload(HOST , cspans);
    }

    @route(1)
    void heart()
    {
        context.sendMessage(1);
    }
}