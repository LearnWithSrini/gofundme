; ModuleID = 'probe9.938fb6848a500066-cgu.0'
source_filename = "probe9.938fb6848a500066-cgu.0"
target datalayout = "e-m:e-p:64:64-i64:64-n32:64-S128"
target triple = "sbf"

; core::f64::<impl f64>::to_ne_bytes
; Function Attrs: inlinehint nounwind
define internal i64 @"_ZN4core3f6421_$LT$impl$u20$f64$GT$11to_ne_bytes17h26bb007c9b48040bE"(double %self) unnamed_addr #0 {
start:
  %_3 = alloca double, align 8
  %0 = alloca [8 x i8], align 1
  store double %self, ptr %_3, align 8
  %rt = load double, ptr %_3, align 8, !noundef !1
  %self1 = bitcast double %rt to i64
  store i64 %self1, ptr %0, align 1
  %1 = load i64, ptr %0, align 1
  ret i64 %1
}

; probe9::probe
; Function Attrs: nounwind
define hidden void @_ZN6probe95probe17h2a15b2d255d741ecE() unnamed_addr #1 {
start:
  %0 = alloca i64, align 8
  %_1 = alloca [8 x i8], align 1
; call core::f64::<impl f64>::to_ne_bytes
  %1 = call i64 @"_ZN4core3f6421_$LT$impl$u20$f64$GT$11to_ne_bytes17h26bb007c9b48040bE"(double 3.140000e+00) #3
  store i64 %1, ptr %0, align 8
  call void @llvm.memcpy.p0.p0.i64(ptr align 1 %_1, ptr align 8 %0, i64 8, i1 false)
  ret void
}

; Function Attrs: nocallback nofree nounwind willreturn memory(argmem: readwrite)
declare void @llvm.memcpy.p0.p0.i64(ptr noalias nocapture writeonly, ptr noalias nocapture readonly, i64, i1 immarg) #2

attributes #0 = { inlinehint nounwind "target-cpu"="generic" "target-features"="+solana" }
attributes #1 = { nounwind "target-cpu"="generic" "target-features"="+solana" }
attributes #2 = { nocallback nofree nounwind willreturn memory(argmem: readwrite) }
attributes #3 = { nounwind }

!llvm.module.flags = !{!0}

!0 = !{i32 8, !"PIC Level", i32 2}
!1 = !{}