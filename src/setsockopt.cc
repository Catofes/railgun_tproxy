#include <node.h>
#include <iostream>
#include <sys/socket.h>
#include <arpa/inet.h>
#include <fcntl.h>
#include <errno.h>
using namespace v8;

void SetSockopt(const FunctionCallbackInfo<Value>& args) 
{
	Isolate* isolate = Isolate::GetCurrent();
	HandleScope scope(isolate);

	if (args.Length() < 1) {
		isolate->ThrowException(Exception::TypeError(
						String::NewFromUtf8(isolate, "Wrong number of arguments")));
		return;
	}

	if (!args[0]->IsNumber()) {
		isolate->ThrowException(Exception::TypeError(
						String::NewFromUtf8(isolate, "Wrong arguments")));
		return;
	}

	int sockid = args[0]->NumberValue();
	int on = 1;
	Local<Number> num = Number::New(isolate,setsockopt( sockid, SOL_IP, IP_TRANSPARENT, &on, sizeof on));
	args.GetReturnValue().Set(num);
}

void init(Handle<Object> target) {
	NODE_SET_METHOD(target, "setsockopt", SetSockopt);
}

NODE_MODULE(setsockopt, init);
