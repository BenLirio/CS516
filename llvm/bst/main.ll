%node = type { i64, %node*, %node*, i1 }


define void @node_set(%node* %n, i64 %v) {
  %v_ptr = getelementptr %node, %node* %n, i32 0, i32 0
  store i64 %v, i64* %v_ptr
  ret void
}

define void @node_make_leaf(%node* %n) {
  %leaf_ptr = getelementptr %node, %node* %n, i32 0, i32 3
  store i1 1, i1* %leaf_ptr
  ret void
}

define i1 @node_is_leaf(%node* %n) {
  %leaf_ptr = getelementptr %node, %node* %n, i32 0, i32 3
  %out = load i1, i1* %leaf_ptr
  ret i1 %out

}

define i64 @node_get(%node* %n) {
  %v_ptr = getelementptr %node, %node* %n, i32 0, i32 0
  %v = load i64, i64* %v_ptr
  ret i64 %v
}


define void @node_init(%node* %n) {
  call void @node_set(%node* %n, i64 0)
  call void @node_make_leaf(%node* %n)
  ret void
}

define void @node_insert(%node* %n, i64 %v) {
  %cur_v = call i64 @node_get(%node* %n)
  %cmp = icmp slt i64 %v, %cur_v
  br i1 %cmp, label %left_ins, label %right_ins
left_ins:
  %left_ptr = getelementptr %node, %node* %n, i32 0, i32 1
  %left = load %node*, %node** %left_ptr
  %is_leaf = call i1 @node_is_leaf(%node* %left)
  %on_leaf = icmp eq i1 1, %is_leaf
  br i1 %on_leaf, label %left_is_leaf, label %left_recurse
left_is_leaf:
  ret void
left_recurse:
  ret void
right_ins:
  %right = getelementptr %node, %node* %n, i32 0, i32 2
  ret void
}

define i64 @main(i64 %argc, i8** %argv) {
  %r = alloca %node
  call void @node_set(%node* %r, i64 3)
  call void @node_insert(%node* %r, i64 6)

  %out = call i64 @node_get(%node* %r)
  ret i64 %out
}
