Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id k5sm7410470wrv.85.2021.06.04.08.53.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 08:53:31 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 2B8701FFE8;
	Fri,  4 Jun 2021 16:53:22 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Claudio Fontana <cfontana@suse.de>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH  v16 77/99] target/arm: arch_dump: restrict ELFCLASS64 to AArch64
Date: Fri,  4 Jun 2021 16:52:50 +0100
Message-Id: <20210604155312.15902-78-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210604155312.15902-1-alex.bennee@linaro.org>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 2PYS3s8HMOm1

From: Claudio Fontana <cfontana@suse.de>

this will allow us to restrict more code to TARGET_AARCH64

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

---
v16
  - fix conflict now notes in arm_sysemu_ops
---
 target/arm/arch_dump.c | 12 +++++++-----
 target/arm/cpu.c       |  2 ++
 roms/u-boot            |  2 +-
 3 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/target/arm/arch_dump.c b/target/arm/arch_dump.c
index 0184845310..9cc75a6fda 100644
--- a/target/arm/arch_dump.c
+++ b/target/arm/arch_dump.c
@@ -23,6 +23,8 @@
 #include "elf.h"
 #include "sysemu/dump.h"
 
+#ifdef TARGET_AARCH64
+
 /* struct user_pt_regs from arch/arm64/include/uapi/asm/ptrace.h */
 struct aarch64_user_regs {
     uint64_t regs[31];
@@ -141,7 +143,6 @@ static int aarch64_write_elf64_prfpreg(WriteCoreDumpFunction f,
     return 0;
 }
 
-#ifdef TARGET_AARCH64
 static off_t sve_zreg_offset(uint32_t vq, int n)
 {
     off_t off = sizeof(struct aarch64_user_sve_header);
@@ -229,7 +230,6 @@ static int aarch64_write_elf64_sve(WriteCoreDumpFunction f,
 
     return 0;
 }
-#endif
 
 int arm_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
                              int cpuid, void *opaque)
@@ -272,15 +272,15 @@ int arm_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
         return ret;
     }
 
-#ifdef TARGET_AARCH64
     if (cpu_isar_feature(aa64_sve, cpu)) {
         ret = aarch64_write_elf64_sve(f, env, cpuid, s);
     }
-#endif
 
     return ret;
 }
 
+#endif /* TARGET_AARCH64 */
+
 /* struct pt_regs from arch/arm/include/asm/ptrace.h */
 struct arm_user_regs {
     uint32_t regs[17];
@@ -449,12 +449,14 @@ ssize_t cpu_get_note_size(int class, int machine, int nr_cpus)
     size_t note_size;
 
     if (class == ELFCLASS64) {
+#ifdef TARGET_AARCH64
         note_size = AARCH64_PRSTATUS_NOTE_SIZE;
         note_size += AARCH64_PRFPREG_NOTE_SIZE;
-#ifdef TARGET_AARCH64
         if (cpu_isar_feature(aa64_sve, cpu)) {
             note_size += AARCH64_SVE_NOTE_SIZE(&cpu->env);
         }
+#else
+        return -1; /* unsupported */
 #endif
     } else {
         note_size = ARM_PRSTATUS_NOTE_SIZE;
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 0b20faaca0..b297d0e6aa 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -1380,7 +1380,9 @@ static const struct SysemuCPUOps arm_sysemu_ops = {
     .get_phys_page_attrs_debug = arm_cpu_get_phys_page_attrs_debug,
     .asidx_from_attrs = arm_asidx_from_attrs,
     .write_elf32_note = arm_cpu_write_elf32_note,
+#ifdef TARGET_AARCH64
     .write_elf64_note = arm_cpu_write_elf64_note,
+#endif
     .virtio_is_big_endian = arm_cpu_virtio_is_big_endian,
     .legacy_vmsd = &vmstate_arm_cpu,
 };
diff --git a/roms/u-boot b/roms/u-boot
index b46dd116ce..d3689267f9 160000
--- a/roms/u-boot
+++ b/roms/u-boot
@@ -1 +1 @@
-Subproject commit b46dd116ce03e235f2a7d4843c6278e1da44b5e1
+Subproject commit d3689267f92c5956e09cc7d1baa4700141662bff
-- 
2.20.1
