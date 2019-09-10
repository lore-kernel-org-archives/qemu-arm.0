Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id b194sm925871wmg.46.2019.09.10.12.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2019 12:34:11 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 6B4941FF91;
	Tue, 10 Sep 2019 20:34:09 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Riku Voipio <riku.voipio@iki.fi>,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH  v1 4/4] elf: move ELF_ARCH definition to elf-arch.h
Date: Tue, 10 Sep 2019 20:34:08 +0100
Message-Id: <20190910193408.28917-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190910193408.28917-1-alex.bennee@linaro.org>
References: <20190910193408.28917-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: oLEQ3s46CoHV

This is preparatory for plugins which will want to report the
architecture to plugins. Move the ELF_ARCH definition out of the
loader and into its own header.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 bsd-user/elfload.c     |  13 +----
 include/elf/elf-arch.h | 109 +++++++++++++++++++++++++++++++++++++++++
 linux-user/elfload.c   |  27 ++--------
 3 files changed, 115 insertions(+), 34 deletions(-)
 create mode 100644 include/elf/elf-arch.h

diff --git a/bsd-user/elfload.c b/bsd-user/elfload.c
index 321ee98b86b..adaae0e0dca 100644
--- a/bsd-user/elfload.c
+++ b/bsd-user/elfload.c
@@ -5,6 +5,7 @@
 #include "qemu.h"
 #include "disas/disas.h"
 #include "qemu/path.h"
+#include "elf/elf-arch.h"
 
 #ifdef _ARCH_PPC64
 #undef ARCH_DLINFO
@@ -12,7 +13,6 @@
 #undef ELF_HWCAP
 #undef ELF_CLASS
 #undef ELF_DATA
-#undef ELF_ARCH
 #endif
 
 /* from personality.h */
@@ -115,7 +115,6 @@ static uint32_t get_elf_hwcap(void)
 
 #define ELF_CLASS      ELFCLASS64
 #define ELF_DATA       ELFDATA2LSB
-#define ELF_ARCH       EM_X86_64
 
 static inline void init_thread(struct target_pt_regs *regs, struct image_info *infop)
 {
@@ -141,7 +140,6 @@ static inline void init_thread(struct target_pt_regs *regs, struct image_info *i
  */
 #define ELF_CLASS       ELFCLASS32
 #define ELF_DATA        ELFDATA2LSB
-#define ELF_ARCH        EM_386
 
 static inline void init_thread(struct target_pt_regs *regs, struct image_info *infop)
 {
@@ -176,7 +174,6 @@ static inline void init_thread(struct target_pt_regs *regs, struct image_info *i
 #else
 #define ELF_DATA        ELFDATA2LSB
 #endif
-#define ELF_ARCH        EM_ARM
 
 static inline void init_thread(struct target_pt_regs *regs, struct image_info *infop)
 {
@@ -231,7 +228,6 @@ enum
 
 #define ELF_CLASS   ELFCLASS64
 #define ELF_DATA    ELFDATA2MSB
-#define ELF_ARCH    EM_SPARCV9
 
 #define STACK_BIAS              2047
 
@@ -265,7 +261,6 @@ static inline void init_thread(struct target_pt_regs *regs, struct image_info *i
 
 #define ELF_CLASS   ELFCLASS32
 #define ELF_DATA    ELFDATA2MSB
-#define ELF_ARCH    EM_SPARC
 
 static inline void init_thread(struct target_pt_regs *regs, struct image_info *infop)
 {
@@ -302,7 +297,6 @@ static inline void init_thread(struct target_pt_regs *regs, struct image_info *i
 #else
 #define ELF_DATA        ELFDATA2LSB
 #endif
-#define ELF_ARCH        EM_PPC
 
 /*
  * We need to put in some extra aux table entries to tell glibc what
@@ -388,7 +382,6 @@ static inline void init_thread(struct target_pt_regs *_regs, struct image_info *
 #else
 #define ELF_DATA        ELFDATA2LSB
 #endif
-#define ELF_ARCH    EM_MIPS
 
 static inline void init_thread(struct target_pt_regs *regs, struct image_info *infop)
 {
@@ -410,7 +403,6 @@ static inline void init_thread(struct target_pt_regs *regs, struct image_info *i
 
 #define ELF_CLASS ELFCLASS32
 #define ELF_DATA  ELFDATA2LSB
-#define ELF_ARCH  EM_SH
 
 static inline void init_thread(struct target_pt_regs *regs, struct image_info *infop)
 {
@@ -432,7 +424,6 @@ static inline void init_thread(struct target_pt_regs *regs, struct image_info *i
 
 #define ELF_CLASS ELFCLASS32
 #define ELF_DATA  ELFDATA2LSB
-#define ELF_ARCH  EM_CRIS
 
 static inline void init_thread(struct target_pt_regs *regs, struct image_info *infop)
 {
@@ -452,7 +443,6 @@ static inline void init_thread(struct target_pt_regs *regs, struct image_info *i
 
 #define ELF_CLASS       ELFCLASS32
 #define ELF_DATA        ELFDATA2MSB
-#define ELF_ARCH        EM_68K
 
 /* ??? Does this need to do anything?
 #define ELF_PLAT_INIT(_r) */
@@ -477,7 +467,6 @@ static inline void init_thread(struct target_pt_regs *regs, struct image_info *i
 
 #define ELF_CLASS      ELFCLASS64
 #define ELF_DATA       ELFDATA2MSB
-#define ELF_ARCH       EM_ALPHA
 
 static inline void init_thread(struct target_pt_regs *regs, struct image_info *infop)
 {
diff --git a/include/elf/elf-arch.h b/include/elf/elf-arch.h
new file mode 100644
index 00000000000..9e052543c51
--- /dev/null
+++ b/include/elf/elf-arch.h
@@ -0,0 +1,109 @@
+/*
+ * Elf Architecture Definition
+ *
+ * This is a simple expansion to define common Elf types for the
+ * various machines for the various places it's needed in the source
+ * tree.
+ *
+ * Copyright (c) 2019 Alex Bennée <alex.bennee@linaro.org>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef _ELF_ARCH_H_
+#define _ELF_ARCH_H_
+
+#include "elf/elf.h"
+
+#ifndef NEED_CPU_H
+#error Needs an target definition
+#endif
+
+#ifdef ELF_ARCH
+#error ELF_ARCH should only be defined once in this file
+#endif
+
+#ifdef TARGET_I386
+#ifdef TARGET_X86_64
+#define ELF_ARCH EM_X86_64
+#else
+#define ELF_ARCH EM_386
+#endif
+#endif
+
+#ifdef TARGET_ARM
+#ifndef TARGET_AARCH64
+#define ELF_ARCH EM_ARM
+#else
+#define ELF_ARCH EM_AARCH64
+#endif
+#endif
+
+#ifdef TARGET_SPARC
+#ifdef TARGET_SPARC64
+#define ELF_ARCH EM_SPARCV9
+#else
+#define ELF_ARCH EM_SPARC
+#endif
+#endif
+
+#ifdef TARGET_PPC
+#define ELF_ARCH EM_PPC
+#endif
+
+#ifdef TARGET_MIPS
+#define ELF_ARCH EM_MIPS
+#endif
+
+#ifdef TARGET_MICROBLAZE
+#define ELF_ARCH EM_MICROBLAZE
+#endif
+
+#ifdef TARGET_NIOS2
+#define ELF_ARCH EM_ALTERA_NIOS2
+#endif
+
+#ifdef TARGET_OPENRISC
+#define ELF_ARCH EM_OPENRISC
+#endif
+
+#ifdef TARGET_SH4
+#define ELF_ARCH EM_SH
+#endif
+
+#ifdef TARGET_CRIS
+#define ELF_ARCH EM_CRIS
+#endif
+
+#ifdef TARGET_M68K
+#define ELF_ARCH EM_68K
+#endif
+
+#ifdef TARGET_ALPHA
+#define ELF_ARCH EM_ALPHA
+#endif
+
+#ifdef TARGET_S390X
+#define ELF_ARCH EM_S390
+#endif
+
+#ifdef TARGET_TILEGX
+#define ELF_ARCH EM_TILEGX
+#endif
+
+#ifdef TARGET_RISCV
+#define ELF_ARCH EM_RISCV
+#endif
+
+#ifdef TARGET_HPPA
+#define ELF_ARCH EM_PARISC
+#endif
+
+#ifdef TARGET_XTENSA
+#define ELF_ARCH EM_XTENSA
+#endif
+
+#endif /* _ELF_ARCH_H_ */
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 59a0d21c6f1..3ac7016a7e3 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -8,10 +8,15 @@
 #include "qemu.h"
 #include "disas/disas.h"
 #include "elf/elf.h"
+#include "elf/elf-arch.h"
 #include "qemu/path.h"
 #include "qemu/queue.h"
 #include "qemu/guest-random.h"
 
+#ifndef ELF_ARCH
+#error something got missed
+#endif
+
 #ifdef _ARCH_PPC64
 #undef ARCH_DLINFO
 #undef ELF_PLATFORM
@@ -19,7 +24,6 @@
 #undef ELF_HWCAP2
 #undef ELF_CLASS
 #undef ELF_DATA
-#undef ELF_ARCH
 #endif
 
 #define ELF_OSABI   ELFOSABI_SYSV
@@ -148,7 +152,6 @@ static uint32_t get_elf_hwcap(void)
 #define ELF_START_MMAP 0x2aaaaab000ULL
 
 #define ELF_CLASS      ELFCLASS64
-#define ELF_ARCH       EM_X86_64
 
 static inline void init_thread(struct target_pt_regs *regs, struct image_info *infop)
 {
@@ -211,7 +214,6 @@ static void elf_core_copy_regs(target_elf_gregset_t *regs, const CPUX86State *en
  * These are used to set parameters in the core dumps.
  */
 #define ELF_CLASS       ELFCLASS32
-#define ELF_ARCH        EM_386
 
 static inline void init_thread(struct target_pt_regs *regs,
                                struct image_info *infop)
@@ -273,7 +275,6 @@ static void elf_core_copy_regs(target_elf_gregset_t *regs, const CPUX86State *en
 
 #define ELF_START_MMAP 0x80000000
 
-#define ELF_ARCH        EM_ARM
 #define ELF_CLASS       ELFCLASS32
 
 static inline void init_thread(struct target_pt_regs *regs,
@@ -539,7 +540,6 @@ static const char *get_elf_platform(void)
 /* 64 bit ARM definitions */
 #define ELF_START_MMAP 0x80000000
 
-#define ELF_ARCH        EM_AARCH64
 #define ELF_CLASS       ELFCLASS64
 #ifdef TARGET_WORDS_BIGENDIAN
 # define ELF_PLATFORM    "aarch64_be"
@@ -667,7 +667,6 @@ static uint32_t get_elf_hwcap(void)
 #endif
 
 #define ELF_CLASS   ELFCLASS64
-#define ELF_ARCH    EM_SPARCV9
 
 #define STACK_BIAS              2047
 
@@ -696,7 +695,6 @@ static inline void init_thread(struct target_pt_regs *regs,
                     | HWCAP_SPARC_MULDIV)
 
 #define ELF_CLASS   ELFCLASS32
-#define ELF_ARCH    EM_SPARC
 
 static inline void init_thread(struct target_pt_regs *regs,
                                struct image_info *infop)
@@ -728,8 +726,6 @@ static inline void init_thread(struct target_pt_regs *regs,
 
 #endif
 
-#define ELF_ARCH        EM_PPC
-
 /* Feature masks for the Aux Vector Hardware Capabilities (AT_HWCAP).
    See arch/powerpc/include/asm/cputable.h.  */
 enum {
@@ -921,7 +917,6 @@ static void elf_core_copy_regs(target_elf_gregset_t *regs, const CPUPPCState *en
 #else
 #define ELF_CLASS   ELFCLASS32
 #endif
-#define ELF_ARCH    EM_MIPS
 
 #define elf_check_arch(x) ((x) == EM_MIPS || (x) == EM_NANOMIPS)
 
@@ -1014,7 +1009,6 @@ static uint32_t get_elf_hwcap(void)
 #define elf_check_arch(x) ( (x) == EM_MICROBLAZE || (x) == EM_MICROBLAZE_OLD)
 
 #define ELF_CLASS   ELFCLASS32
-#define ELF_ARCH    EM_MICROBLAZE
 
 static inline void init_thread(struct target_pt_regs *regs,
                                struct image_info *infop)
@@ -1053,7 +1047,6 @@ static void elf_core_copy_regs(target_elf_gregset_t *regs, const CPUMBState *env
 #define elf_check_arch(x) ((x) == EM_ALTERA_NIOS2)
 
 #define ELF_CLASS   ELFCLASS32
-#define ELF_ARCH    EM_ALTERA_NIOS2
 
 static void init_thread(struct target_pt_regs *regs, struct image_info *infop)
 {
@@ -1107,7 +1100,6 @@ static void elf_core_copy_regs(target_elf_gregset_t *regs,
 
 #define ELF_START_MMAP 0x08000000
 
-#define ELF_ARCH EM_OPENRISC
 #define ELF_CLASS ELFCLASS32
 #define ELF_DATA  ELFDATA2MSB
 
@@ -1146,7 +1138,6 @@ static void elf_core_copy_regs(target_elf_gregset_t *regs,
 #define ELF_START_MMAP 0x80000000
 
 #define ELF_CLASS ELFCLASS32
-#define ELF_ARCH  EM_SH
 
 static inline void init_thread(struct target_pt_regs *regs,
                                struct image_info *infop)
@@ -1228,7 +1219,6 @@ static uint32_t get_elf_hwcap(void)
 #define ELF_START_MMAP 0x80000000
 
 #define ELF_CLASS ELFCLASS32
-#define ELF_ARCH  EM_CRIS
 
 static inline void init_thread(struct target_pt_regs *regs,
                                struct image_info *infop)
@@ -1245,7 +1235,6 @@ static inline void init_thread(struct target_pt_regs *regs,
 #define ELF_START_MMAP 0x80000000
 
 #define ELF_CLASS       ELFCLASS32
-#define ELF_ARCH        EM_68K
 
 /* ??? Does this need to do anything?
    #define ELF_PLAT_INIT(_r) */
@@ -1296,7 +1285,6 @@ static void elf_core_copy_regs(target_elf_gregset_t *regs, const CPUM68KState *e
 #define ELF_START_MMAP (0x30000000000ULL)
 
 #define ELF_CLASS      ELFCLASS64
-#define ELF_ARCH       EM_ALPHA
 
 static inline void init_thread(struct target_pt_regs *regs,
                                struct image_info *infop)
@@ -1316,7 +1304,6 @@ static inline void init_thread(struct target_pt_regs *regs,
 
 #define ELF_CLASS	ELFCLASS64
 #define ELF_DATA	ELFDATA2MSB
-#define ELF_ARCH	EM_S390
 
 #define ELF_HWCAP get_elf_hwcap()
 
@@ -1362,7 +1349,6 @@ static inline void init_thread(struct target_pt_regs *regs, struct image_info *i
 
 #define ELF_CLASS   ELFCLASS64
 #define ELF_DATA    ELFDATA2LSB
-#define ELF_ARCH    EM_TILEGX
 
 static inline void init_thread(struct target_pt_regs *regs,
                                struct image_info *infop)
@@ -1379,7 +1365,6 @@ static inline void init_thread(struct target_pt_regs *regs,
 #ifdef TARGET_RISCV
 
 #define ELF_START_MMAP 0x80000000
-#define ELF_ARCH  EM_RISCV
 
 #ifdef TARGET_RISCV32
 #define ELF_CLASS ELFCLASS32
@@ -1402,7 +1387,6 @@ static inline void init_thread(struct target_pt_regs *regs,
 
 #define ELF_START_MMAP  0x80000000
 #define ELF_CLASS       ELFCLASS32
-#define ELF_ARCH        EM_PARISC
 #define ELF_PLATFORM    "PARISC"
 #define STACK_GROWS_DOWN 0
 #define STACK_ALIGNMENT  64
@@ -1427,7 +1411,6 @@ static inline void init_thread(struct target_pt_regs *regs,
 #define ELF_START_MMAP 0x20000000
 
 #define ELF_CLASS       ELFCLASS32
-#define ELF_ARCH        EM_XTENSA
 
 static inline void init_thread(struct target_pt_regs *regs,
                                struct image_info *infop)
-- 
2.20.1
