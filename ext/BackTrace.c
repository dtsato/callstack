#include "ruby.h"
#include "env.h"
#include "node.h"

static VALUE
custom_backtrace(int argc, VALUE *args, VALUE self)
{
  struct FRAME *frame = ruby_frame;
  VALUE ary;
  NODE *n;
  VALUE level;
  VALUE klass;
  int depth = argc > 0 ? NUM2INT(args[0]) : -1;

  ary = rb_ary_new();
  if (frame->last_func == ID_ALLOCATOR) {
          frame = frame->prev;
  }
  for (; frame && (n = frame->node); frame = frame->prev) {
          if (frame->prev && frame->prev->last_func) {
                  if (frame->prev->node == n) continue;
                  level = rb_ary_new();
                  klass = frame->prev->last_class ? frame->prev->last_class : Qnil;
                  if(TYPE(klass) == T_ICLASS) {
                          klass = CLASS_OF(klass);
                  }
                  rb_ary_push(level, klass);
                  rb_ary_push(level, ID2SYM(frame->prev->last_func));
                  rb_ary_push(level, rb_str_new2(n->nd_file));
                  rb_ary_push(level, INT2NUM(nd_line(n)));
          }
          else {
                  level = rb_ary_new();
                  rb_ary_push(level, Qnil);
                  rb_ary_push(level, Qnil);
                  rb_ary_push(level, rb_str_new2(n->nd_file));
                  rb_ary_push(level, INT2NUM(nd_line(n)));
          }
          rb_ary_push(ary, level);
          if(--depth == 0)
                  break;
  }
  
  return ary;
}

void Init_backtrace() {
	rb_define_method(rb_cObject, "backtrace", custom_backtrace, -1);
}
