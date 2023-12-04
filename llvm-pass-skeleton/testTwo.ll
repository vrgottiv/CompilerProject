; ModuleID = 'testTwo.c'
source_filename = "testTwo.c"
target datalayout = "e-m:o-i64:64-i128:128-n32:64-S128"
target triple = "arm64-apple-macosx12.0.0"

@.str = private unnamed_addr constant [9 x i8] c"file.txt\00", align 1, !dbg !0
@.str.1 = private unnamed_addr constant [2 x i8] c"r\00", align 1, !dbg !7
@.str.2 = private unnamed_addr constant [19 x i8] c"Error opening file\00", align 1, !dbg !12
@.str.3 = private unnamed_addr constant [4 x i8] c"%s\0A\00", align 1, !dbg !17

; Function Attrs: noinline nounwind optnone ssp uwtable(sync)
define i32 @main() #0 !dbg !33 {
entry:
  %retval = alloca i32, align 4
  %str1 = alloca [1000 x i8], align 1
  %name = alloca ptr, align 8
  %c = alloca i32, align 4
  %len = alloca i32, align 4
  store i32 0, ptr %retval, align 4
  call void @llvm.dbg.declare(metadata ptr %str1, metadata !38, metadata !DIExpression()), !dbg !42
  call void @llvm.dbg.declare(metadata ptr %name, metadata !43, metadata !DIExpression()), !dbg !105
  %call = call ptr @"\01_fopen"(ptr noundef @.str, ptr noundef @.str.1), !dbg !106
  store ptr %call, ptr %name, align 8, !dbg !105
  call void @llvm.dbg.declare(metadata ptr %c, metadata !107, metadata !DIExpression()), !dbg !108
  call void @llvm.dbg.declare(metadata ptr %len, metadata !109, metadata !DIExpression()), !dbg !110
  store i32 0, ptr %len, align 4, !dbg !110
  %0 = load ptr, ptr %name, align 8, !dbg !111
  %cmp = icmp eq ptr %0, null, !dbg !113
  br i1 %cmp, label %if.then, label %if.end, !dbg !114

if.then:                                          ; preds = %entry
  call void @perror(ptr noundef @.str.2) #4, !dbg !115
  store i32 -1, ptr %retval, align 4, !dbg !117
  br label %return, !dbg !117

if.end:                                           ; preds = %entry
  br label %while.body, !dbg !118

while.body:                                       ; preds = %if.end, %if.end8
  %1 = load ptr, ptr %name, align 8, !dbg !119
  %call1 = call i32 @getc(ptr noundef %1), !dbg !121
  store i32 %call1, ptr %c, align 4, !dbg !122
  %2 = load i32, ptr %c, align 4, !dbg !123
  %cmp2 = icmp eq i32 %2, -1, !dbg !125
  br i1 %cmp2, label %if.then3, label %if.end4, !dbg !126

if.then3:                                         ; preds = %while.body
  br label %while.end, !dbg !127

if.end4:                                          ; preds = %while.body
  %3 = load i32, ptr %c, align 4, !dbg !128
  %conv = trunc i32 %3 to i8, !dbg !128
  %4 = load i32, ptr %len, align 4, !dbg !129
  %inc = add nsw i32 %4, 1, !dbg !129
  store i32 %inc, ptr %len, align 4, !dbg !129
  %idxprom = sext i32 %4 to i64, !dbg !130
  %arrayidx = getelementptr inbounds [1000 x i8], ptr %str1, i64 0, i64 %idxprom, !dbg !130
  store i8 %conv, ptr %arrayidx, align 1, !dbg !131
  %5 = load i32, ptr %len, align 4, !dbg !132
  %cmp5 = icmp sge i32 %5, 999, !dbg !134
  br i1 %cmp5, label %if.then7, label %if.end8, !dbg !135

if.then7:                                         ; preds = %if.end4
  br label %while.end, !dbg !136

if.end8:                                          ; preds = %if.end4
  br label %while.body, !dbg !118, !llvm.loop !137

while.end:                                        ; preds = %if.then7, %if.then3
  %6 = load i32, ptr %len, align 4, !dbg !139
  %idxprom9 = sext i32 %6 to i64, !dbg !140
  %arrayidx10 = getelementptr inbounds [1000 x i8], ptr %str1, i64 0, i64 %idxprom9, !dbg !140
  store i8 0, ptr %arrayidx10, align 1, !dbg !141
  %arraydecay = getelementptr inbounds [1000 x i8], ptr %str1, i64 0, i64 0, !dbg !142
  %call11 = call i32 (ptr, ...) @printf(ptr noundef @.str.3, ptr noundef %arraydecay), !dbg !143
  %7 = load ptr, ptr %name, align 8, !dbg !144
  %call12 = call i32 @fclose(ptr noundef %7), !dbg !145
  store i32 0, ptr %retval, align 4, !dbg !146
  br label %return, !dbg !146

return:                                           ; preds = %while.end, %if.then
  %8 = load i32, ptr %retval, align 4, !dbg !147
  ret i32 %8, !dbg !147
}

; Function Attrs: nocallback nofree nosync nounwind speculatable willreturn memory(none)
declare void @llvm.dbg.declare(metadata, metadata, metadata) #1

declare ptr @"\01_fopen"(ptr noundef, ptr noundef) #2

; Function Attrs: cold
declare void @perror(ptr noundef) #3

declare i32 @getc(ptr noundef) #2

declare i32 @printf(ptr noundef, ...) #2

declare i32 @fclose(ptr noundef) #2

attributes #0 = { noinline nounwind optnone ssp uwtable(sync) "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #1 = { nocallback nofree nosync nounwind speculatable willreturn memory(none) }
attributes #2 = { "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #3 = { cold "frame-pointer"="non-leaf" "no-trapping-math"="true" "stack-protector-buffer-size"="8" "target-cpu"="apple-m1" "target-features"="+aes,+crc,+dotprod,+fp-armv8,+fp16fml,+fullfp16,+lse,+neon,+ras,+rcpc,+rdm,+sha2,+sha3,+v8.1a,+v8.2a,+v8.3a,+v8.4a,+v8.5a,+v8a,+zcm,+zcz" }
attributes #4 = { cold }

!llvm.dbg.cu = !{!22}
!llvm.module.flags = !{!26, !27, !28, !29, !30, !31}
!llvm.ident = !{!32}

!0 = !DIGlobalVariableExpression(var: !1, expr: !DIExpression())
!1 = distinct !DIGlobalVariable(scope: null, file: !2, line: 6, type: !3, isLocal: true, isDefinition: true)
!2 = !DIFile(filename: "testTwo.c", directory: "/Users/veerendragottiveeti/Desktop/llvm-pass-skeleton")
!3 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 72, elements: !5)
!4 = !DIBasicType(name: "char", size: 8, encoding: DW_ATE_signed_char)
!5 = !{!6}
!6 = !DISubrange(count: 9)
!7 = !DIGlobalVariableExpression(var: !8, expr: !DIExpression())
!8 = distinct !DIGlobalVariable(scope: null, file: !2, line: 6, type: !9, isLocal: true, isDefinition: true)
!9 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 16, elements: !10)
!10 = !{!11}
!11 = !DISubrange(count: 2)
!12 = !DIGlobalVariableExpression(var: !13, expr: !DIExpression())
!13 = distinct !DIGlobalVariable(scope: null, file: !2, line: 10, type: !14, isLocal: true, isDefinition: true)
!14 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 152, elements: !15)
!15 = !{!16}
!16 = !DISubrange(count: 19)
!17 = !DIGlobalVariableExpression(var: !18, expr: !DIExpression())
!18 = distinct !DIGlobalVariable(scope: null, file: !2, line: 20, type: !19, isLocal: true, isDefinition: true)
!19 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 32, elements: !20)
!20 = !{!21}
!21 = !DISubrange(count: 4)
!22 = distinct !DICompileUnit(language: DW_LANG_C11, file: !2, producer: "Homebrew clang version 17.0.6", isOptimized: false, runtimeVersion: 0, emissionKind: FullDebug, retainedTypes: !23, globals: !25, splitDebugInlining: false, nameTableKind: Apple, sysroot: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk", sdk: "MacOSX12.sdk")
!23 = !{!24}
!24 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: null, size: 64)
!25 = !{!0, !7, !12, !17}
!26 = !{i32 7, !"Dwarf Version", i32 4}
!27 = !{i32 2, !"Debug Info Version", i32 3}
!28 = !{i32 1, !"wchar_size", i32 4}
!29 = !{i32 8, !"PIC Level", i32 2}
!30 = !{i32 7, !"uwtable", i32 1}
!31 = !{i32 7, !"frame-pointer", i32 1}
!32 = !{!"Homebrew clang version 17.0.6"}
!33 = distinct !DISubprogram(name: "main", scope: !2, file: !2, line: 4, type: !34, scopeLine: 4, spFlags: DISPFlagDefinition, unit: !22, retainedNodes: !37)
!34 = !DISubroutineType(types: !35)
!35 = !{!36}
!36 = !DIBasicType(name: "int", size: 32, encoding: DW_ATE_signed)
!37 = !{}
!38 = !DILocalVariable(name: "str1", scope: !33, file: !2, line: 5, type: !39)
!39 = !DICompositeType(tag: DW_TAG_array_type, baseType: !4, size: 8000, elements: !40)
!40 = !{!41}
!41 = !DISubrange(count: 1000)
!42 = !DILocation(line: 5, column: 10, scope: !33)
!43 = !DILocalVariable(name: "name", scope: !33, file: !2, line: 6, type: !44)
!44 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !45, size: 64)
!45 = !DIDerivedType(tag: DW_TAG_typedef, name: "FILE", file: !46, line: 157, baseType: !47)
!46 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/_stdio.h", directory: "")
!47 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__sFILE", file: !46, line: 126, size: 1216, elements: !48)
!48 = !{!49, !52, !53, !54, !56, !57, !62, !63, !64, !68, !73, !83, !89, !90, !93, !94, !98, !102, !103, !104}
!49 = !DIDerivedType(tag: DW_TAG_member, name: "_p", scope: !47, file: !46, line: 127, baseType: !50, size: 64)
!50 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !51, size: 64)
!51 = !DIBasicType(name: "unsigned char", size: 8, encoding: DW_ATE_unsigned_char)
!52 = !DIDerivedType(tag: DW_TAG_member, name: "_r", scope: !47, file: !46, line: 128, baseType: !36, size: 32, offset: 64)
!53 = !DIDerivedType(tag: DW_TAG_member, name: "_w", scope: !47, file: !46, line: 129, baseType: !36, size: 32, offset: 96)
!54 = !DIDerivedType(tag: DW_TAG_member, name: "_flags", scope: !47, file: !46, line: 130, baseType: !55, size: 16, offset: 128)
!55 = !DIBasicType(name: "short", size: 16, encoding: DW_ATE_signed)
!56 = !DIDerivedType(tag: DW_TAG_member, name: "_file", scope: !47, file: !46, line: 131, baseType: !55, size: 16, offset: 144)
!57 = !DIDerivedType(tag: DW_TAG_member, name: "_bf", scope: !47, file: !46, line: 132, baseType: !58, size: 128, offset: 192)
!58 = distinct !DICompositeType(tag: DW_TAG_structure_type, name: "__sbuf", file: !46, line: 92, size: 128, elements: !59)
!59 = !{!60, !61}
!60 = !DIDerivedType(tag: DW_TAG_member, name: "_base", scope: !58, file: !46, line: 93, baseType: !50, size: 64)
!61 = !DIDerivedType(tag: DW_TAG_member, name: "_size", scope: !58, file: !46, line: 94, baseType: !36, size: 32, offset: 64)
!62 = !DIDerivedType(tag: DW_TAG_member, name: "_lbfsize", scope: !47, file: !46, line: 133, baseType: !36, size: 32, offset: 320)
!63 = !DIDerivedType(tag: DW_TAG_member, name: "_cookie", scope: !47, file: !46, line: 136, baseType: !24, size: 64, offset: 384)
!64 = !DIDerivedType(tag: DW_TAG_member, name: "_close", scope: !47, file: !46, line: 137, baseType: !65, size: 64, offset: 448)
!65 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !66, size: 64)
!66 = !DISubroutineType(types: !67)
!67 = !{!36, !24}
!68 = !DIDerivedType(tag: DW_TAG_member, name: "_read", scope: !47, file: !46, line: 138, baseType: !69, size: 64, offset: 512)
!69 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !70, size: 64)
!70 = !DISubroutineType(types: !71)
!71 = !{!36, !24, !72, !36}
!72 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !4, size: 64)
!73 = !DIDerivedType(tag: DW_TAG_member, name: "_seek", scope: !47, file: !46, line: 139, baseType: !74, size: 64, offset: 576)
!74 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !75, size: 64)
!75 = !DISubroutineType(types: !76)
!76 = !{!77, !24, !77, !36}
!77 = !DIDerivedType(tag: DW_TAG_typedef, name: "fpos_t", file: !46, line: 81, baseType: !78)
!78 = !DIDerivedType(tag: DW_TAG_typedef, name: "__darwin_off_t", file: !79, line: 71, baseType: !80)
!79 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/sys/_types.h", directory: "")
!80 = !DIDerivedType(tag: DW_TAG_typedef, name: "__int64_t", file: !81, line: 24, baseType: !82)
!81 = !DIFile(filename: "/Library/Developer/CommandLineTools/SDKs/MacOSX12.sdk/usr/include/arm/_types.h", directory: "")
!82 = !DIBasicType(name: "long long", size: 64, encoding: DW_ATE_signed)
!83 = !DIDerivedType(tag: DW_TAG_member, name: "_write", scope: !47, file: !46, line: 140, baseType: !84, size: 64, offset: 640)
!84 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !85, size: 64)
!85 = !DISubroutineType(types: !86)
!86 = !{!36, !24, !87, !36}
!87 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !88, size: 64)
!88 = !DIDerivedType(tag: DW_TAG_const_type, baseType: !4)
!89 = !DIDerivedType(tag: DW_TAG_member, name: "_ub", scope: !47, file: !46, line: 143, baseType: !58, size: 128, offset: 704)
!90 = !DIDerivedType(tag: DW_TAG_member, name: "_extra", scope: !47, file: !46, line: 144, baseType: !91, size: 64, offset: 832)
!91 = !DIDerivedType(tag: DW_TAG_pointer_type, baseType: !92, size: 64)
!92 = !DICompositeType(tag: DW_TAG_structure_type, name: "__sFILEX", file: !46, line: 98, flags: DIFlagFwdDecl)
!93 = !DIDerivedType(tag: DW_TAG_member, name: "_ur", scope: !47, file: !46, line: 145, baseType: !36, size: 32, offset: 896)
!94 = !DIDerivedType(tag: DW_TAG_member, name: "_ubuf", scope: !47, file: !46, line: 148, baseType: !95, size: 24, offset: 928)
!95 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 24, elements: !96)
!96 = !{!97}
!97 = !DISubrange(count: 3)
!98 = !DIDerivedType(tag: DW_TAG_member, name: "_nbuf", scope: !47, file: !46, line: 149, baseType: !99, size: 8, offset: 952)
!99 = !DICompositeType(tag: DW_TAG_array_type, baseType: !51, size: 8, elements: !100)
!100 = !{!101}
!101 = !DISubrange(count: 1)
!102 = !DIDerivedType(tag: DW_TAG_member, name: "_lb", scope: !47, file: !46, line: 152, baseType: !58, size: 128, offset: 960)
!103 = !DIDerivedType(tag: DW_TAG_member, name: "_blksize", scope: !47, file: !46, line: 155, baseType: !36, size: 32, offset: 1088)
!104 = !DIDerivedType(tag: DW_TAG_member, name: "_offset", scope: !47, file: !46, line: 156, baseType: !77, size: 64, offset: 1152)
!105 = !DILocation(line: 6, column: 11, scope: !33)
!106 = !DILocation(line: 6, column: 18, scope: !33)
!107 = !DILocalVariable(name: "c", scope: !33, file: !2, line: 7, type: !36)
!108 = !DILocation(line: 7, column: 9, scope: !33)
!109 = !DILocalVariable(name: "len", scope: !33, file: !2, line: 8, type: !36)
!110 = !DILocation(line: 8, column: 9, scope: !33)
!111 = !DILocation(line: 9, column: 9, scope: !112)
!112 = distinct !DILexicalBlock(scope: !33, file: !2, line: 9, column: 9)
!113 = !DILocation(line: 9, column: 14, scope: !112)
!114 = !DILocation(line: 9, column: 9, scope: !33)
!115 = !DILocation(line: 10, column: 9, scope: !116)
!116 = distinct !DILexicalBlock(scope: !112, file: !2, line: 9, column: 23)
!117 = !DILocation(line: 11, column: 9, scope: !116)
!118 = !DILocation(line: 13, column: 5, scope: !33)
!119 = !DILocation(line: 14, column: 18, scope: !120)
!120 = distinct !DILexicalBlock(scope: !33, file: !2, line: 13, column: 15)
!121 = !DILocation(line: 14, column: 13, scope: !120)
!122 = !DILocation(line: 14, column: 11, scope: !120)
!123 = !DILocation(line: 15, column: 13, scope: !124)
!124 = distinct !DILexicalBlock(scope: !120, file: !2, line: 15, column: 13)
!125 = !DILocation(line: 15, column: 15, scope: !124)
!126 = !DILocation(line: 15, column: 13, scope: !120)
!127 = !DILocation(line: 15, column: 23, scope: !124)
!128 = !DILocation(line: 16, column: 23, scope: !120)
!129 = !DILocation(line: 16, column: 17, scope: !120)
!130 = !DILocation(line: 16, column: 9, scope: !120)
!131 = !DILocation(line: 16, column: 21, scope: !120)
!132 = !DILocation(line: 17, column: 13, scope: !133)
!133 = distinct !DILexicalBlock(scope: !120, file: !2, line: 17, column: 13)
!134 = !DILocation(line: 17, column: 17, scope: !133)
!135 = !DILocation(line: 17, column: 13, scope: !120)
!136 = !DILocation(line: 17, column: 25, scope: !133)
!137 = distinct !{!137, !118, !138}
!138 = !DILocation(line: 18, column: 5, scope: !33)
!139 = !DILocation(line: 19, column: 10, scope: !33)
!140 = !DILocation(line: 19, column: 5, scope: !33)
!141 = !DILocation(line: 19, column: 15, scope: !33)
!142 = !DILocation(line: 20, column: 20, scope: !33)
!143 = !DILocation(line: 20, column: 5, scope: !33)
!144 = !DILocation(line: 21, column: 12, scope: !33)
!145 = !DILocation(line: 21, column: 5, scope: !33)
!146 = !DILocation(line: 22, column: 5, scope: !33)
!147 = !DILocation(line: 23, column: 1, scope: !33)
