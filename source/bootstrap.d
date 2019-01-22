module Bootstrap;

import hunt.imf;
import core.thread;
import source.SpanController;

int main(string[] argv)
{
    auto app = new Application();
    auto server = app.createServer("0.0.0.0" , 3004);
    app.run();
    if(argv.length >= 2)
        HOST = argv[1];
    while(1)
        Thread.sleep(dur!"seconds"(10));

}