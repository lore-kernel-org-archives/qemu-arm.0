Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp2513910ejb;
        Wed, 4 Oct 2023 02:07:03 -0700 (PDT)
X-Received: by 2002:ac2:5f4b:0:b0:503:ed9:58e3 with SMTP id 11-20020ac25f4b000000b005030ed958e3mr1133207lfz.8.1696410423158;
        Wed, 04 Oct 2023 02:07:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696410423; cv=none;
        d=google.com; s=arc-20160816;
        b=c9x9neaPBp5mKhmx45VAKzVP6fqEKnc9zroB1feWn5iwPLx6VULqTnnVlMri+uxSMV
         mxqTCSlW3ba9ylVqWdlQjTZmlrD8ApKWQrmjNKR0z5pjz1g+1cUj8u0lb+ruJWJ7/8hx
         UZmORn5TTNNQYUr//yZdTliq41OzQdpAADZ4uvytxNZfw7eailPq8tzO/XF7jvx+cFEf
         L6J27t3ErHcJLCtCY0AFPhFsVbvq8DcjfmYecrsOGeGyYRJcV7A0vyPjneLaEiitVCRj
         NbnGN+QsI10TNKtX0EgHVv3KRd91nmQOOt2rxpTbX8F9tgoJmfzQZncsq9ynXPwZMpod
         NH6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=oCwg9zMksR6Ea4BVbNCmYloYQgyJHlYXWWLT+R8LDFM=;
        fh=HGme51/D/lnfTQ9gvmBdMMGytaV6+J3NY1xYS4aQW9I=;
        b=GhVNa4YwnT/NYMXzTkwOcr78TPxwPUOhV7UgnsS2sJOnalC87KKvKx0Ns3y88/kKq4
         k9wNdwT3mUK6lT/10r2cEWBdUNzMduk4j3qpD4Gr3Pqb+x4i1zBKnQCG67NNe8PX7tQ0
         RKXg/HuWE3d9Jd7zo8KnQv5gL/PZlp4hxg359PXSrLP6F56MQv7ZMm6JOf8BveCxI0ti
         +KjRSTgMI66yvfYBdC/AAlaNnEkBHlZAw0wD2x+39CtLaYJruYFMIQbWU4fD5QtMxSOY
         M3MbKY/VB49LM64XXZP9v/4jJ9v1d+206UsrSUYWxi6FiYOG5JR/Y5pU6Iv4rOGncWOR
         OjRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NOVNbS1B;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id y23-20020a1c4b17000000b00404ff5a8fb6sor1283289wma.3.2023.10.04.02.07.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 04 Oct 2023 02:07:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NOVNbS1B;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696410423; x=1697015223; darn=linaro.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oCwg9zMksR6Ea4BVbNCmYloYQgyJHlYXWWLT+R8LDFM=;
        b=NOVNbS1BJfZHuRXc2v8j+12UXtWF/W0YvH+j4TxDxnw8P+29lanqrClTSlsVLL+DHW
         KKRPp2eaWSTBIK8Sw2VtDll0PdG8pvhnQxw4+bNdeK55wkSflHwocmYRQ/eauT2dXVyg
         PZrlUcDy9wJ0wlxGSVAnkWgPb+agBiQMUCeqdlmfyHY/Q6McsOmgnS7Ihq0y+msqSzhK
         POsY7SDqXWsEQRkohkCNz9x6dgerLCbHkvW6NxD3ppmc7akdGPNV6bC4q/+01oZzmf68
         BYSJG8OafnPkpGhzU0DGmV69+fakCxfV+65YD4MAfBx5zcEziXVB/EXTL1Nq/SSY3i83
         EZSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696410423; x=1697015223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oCwg9zMksR6Ea4BVbNCmYloYQgyJHlYXWWLT+R8LDFM=;
        b=KDYhEc0meMc8BPUIuOGxfDGGwExeTUqmVsVVQBn1h+TmEhlHJdUhXKVf3a1m5hmi5t
         1R6qWH+S6Yg89xoiJZALnAHL76hpdc4dyPk+EPFmEd1ainTi/sK2GNlzDUevLyhmBmAA
         /71vJbJe3FnOCwvb9P0mmtGotSOlY6E0mVOC/j2WjQ4IZWqfeSNoCNDYjEei0k6Xo6zJ
         qhDU/AotvGv2opEV1Ohjjo/T31GmzSPGiC2uXXA0wOL2AsC7cbMbOUG0GG3K6xcLmiJq
         sbtv+1FZ+NUo1jDwWFbYbo1aVuMPUWn6p0xJQ9QdQv2QOF+VLY33uiWKO6zmf4jL8SFl
         oZZw==
X-Gm-Message-State: AOJu0YxvLT580ex1KdDVoHZdLy8BSExmxbhlTPf8ycOyDBR/Q6A2PVQF
	29dufThq0ZLjo3vO1xX505FO9h1u
X-Google-Smtp-Source: AGHT+IH1y6VSEGKqAtiDto4tPkOzuYvb9lf9+kqoIuEyloMg3eigwoYrAfk3KpyR43bA487kJwWJig==
X-Received: by 2002:a05:600c:211:b0:401:bf56:8ba6 with SMTP id 17-20020a05600c021100b00401bf568ba6mr1695947wmi.28.1696410422399;
        Wed, 04 Oct 2023 02:07:02 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from m1x-phil.lan (5ep85-h01-176-173-163-52.dslam.bbox.fr. [176.173.163.52])
        by smtp.gmail.com with ESMTPSA id z15-20020a1c4c0f000000b003fee6e170f9sm970414wmf.45.2023.10.04.02.06.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Oct 2023 02:07:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	qemu-ppc@nongnu.org,
	qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Riku Voipio <riku.voipio@iki.fi>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	Bin Meng <bin.meng@windriver.com>,
	Weiwei Li <liweiwei@iscas.ac.cn>,
	Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
	Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
	WANG Xuerui <git@xen0n.name>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
	David Hildenbrand <david@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Max Filippov <jcmvbkbc@gmail.com>
Subject: [PATCH 05/13] tcg: Correct invalid mentions of 'softmmu' by 'system-mode'
Date: Wed,  4 Oct 2023 11:06:20 +0200
Message-ID: <20231004090629.37473-6-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231004090629.37473-1-philmd@linaro.org>
References: <20231004090629.37473-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: QJhHQL1aVbLc

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 docs/devel/testing.rst                      |  2 +-
 tests/tcg/s390x/pgm-specification.mak       |  2 +-
 include/qemu/atomic128.h                    |  4 ++--
 include/tcg/tcg-op-common.h                 |  2 +-
 accel/tcg/user-exec.c                       |  2 +-
 target/riscv/vector_helper.c                |  2 +-
 tcg/region.c                                |  4 ++--
 tcg/tcg.c                                   | 11 ++++++-----
 tests/tcg/multiarch/system/memory.c         |  4 ++--
 tcg/aarch64/tcg-target.c.inc                |  4 ++--
 tcg/arm/tcg-target.c.inc                    |  2 +-
 tcg/i386/tcg-target.c.inc                   |  2 +-
 tcg/loongarch64/tcg-target.c.inc            |  4 ++--
 tcg/mips/tcg-target.c.inc                   |  4 ++--
 tcg/ppc/tcg-target.c.inc                    |  4 ++--
 tcg/riscv/tcg-target.c.inc                  |  4 ++--
 tcg/s390x/tcg-target.c.inc                  |  4 ++--
 tcg/sparc64/tcg-target.c.inc                |  4 ++--
 tcg/meson.build                             |  6 +++---
 tests/tcg/Makefile.target                   |  2 +-
 tests/tcg/multiarch/gdbstub/interrupt.py    |  2 +-
 tests/tcg/multiarch/gdbstub/memory.py       |  2 +-
 tests/tcg/s390x/pgm-specification-softmmu.S |  2 +-
 tests/tcg/s390x/softmmu.ld                  |  2 +-
 tests/tcg/xtensa/Makefile.softmmu-target    |  2 +-
 tests/tcg/xtensaeb/Makefile.softmmu-target  |  2 +-
 26 files changed, 43 insertions(+), 42 deletions(-)

diff --git a/docs/devel/testing.rst b/docs/devel/testing.rst
index 5d1fc0aa95..f3e2472189 100644
--- a/docs/devel/testing.rst
+++ b/docs/devel/testing.rst
@@ -1458,7 +1458,7 @@ TCG test dependencies
 ~~~~~~~~~~~~~~~~~~~~~
 
 The TCG tests are deliberately very light on dependencies and are
-either totally bare with minimal gcc lib support (for softmmu tests)
+either totally bare with minimal gcc lib support (for system-mode tests)
 or just glibc (for linux-user tests). This is because getting a cross
 compiler to work with additional libraries can be challenging.
 
diff --git a/tests/tcg/s390x/pgm-specification.mak b/tests/tcg/s390x/pgm-specification.mak
index 2999aee26e..73dc47af0d 100644
--- a/tests/tcg/s390x/pgm-specification.mak
+++ b/tests/tcg/s390x/pgm-specification.mak
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
 # List of specification exception tests.
-# Shared between the softmmu and the user makefiles.
+# Shared between the system and the user makefiles.
 PGM_SPECIFICATION_TESTS = \
 	br-odd \
 	cgrl-unaligned \
diff --git a/include/qemu/atomic128.h b/include/qemu/atomic128.h
index 34554bf0ac..88af6d4ea3 100644
--- a/include/qemu/atomic128.h
+++ b/include/qemu/atomic128.h
@@ -43,8 +43,8 @@
  * See https://gcc.gnu.org/bugzilla/show_bug.cgi?id=80878
  *
  * This interpretation is not especially helpful for QEMU.
- * For softmmu, all RAM is always read/write from the hypervisor.
- * For user-only, if the guest doesn't implement such an __atomic_read
+ * For system-mode, all RAM is always read/write from the hypervisor.
+ * For user-mode, if the guest doesn't implement such an __atomic_read
  * then the host need not worry about it either.
  *
  * Moreover, using libatomic is not an option, because its interface is
diff --git a/include/tcg/tcg-op-common.h b/include/tcg/tcg-op-common.h
index a53b15933b..2048f92b5e 100644
--- a/include/tcg/tcg-op-common.h
+++ b/include/tcg/tcg-op-common.h
@@ -265,7 +265,7 @@ void tcg_gen_exit_tb(const TranslationBlock *tb, unsigned idx);
  *
  * See tcg/README for more info about this TCG operation.
  *
- * NOTE: In softmmu emulation, direct jumps with goto_tb are only safe within
+ * NOTE: In system emulation, direct jumps with goto_tb are only safe within
  * the pages this TB resides in because we don't take care of direct jumps when
  * address mapping changes, e.g. in tlb_flush(). In user mode, there's only a
  * static address translation, so the destination address is always valid, TBs
diff --git a/accel/tcg/user-exec.c b/accel/tcg/user-exec.c
index ab48cb41e4..6c1e8ec5a5 100644
--- a/accel/tcg/user-exec.c
+++ b/accel/tcg/user-exec.c
@@ -939,7 +939,7 @@ void *page_get_target_data(target_ulong address)
 void page_reset_target_data(target_ulong start, target_ulong last) { }
 #endif /* TARGET_PAGE_DATA_SIZE */
 
-/* The softmmu versions of these helpers are in cputlb.c.  */
+/* The system-mode versions of these helpers are in cputlb.c.  */
 
 static void *cpu_mmu_lookup(CPUArchState *env, vaddr addr,
                             MemOp mop, uintptr_t ra, MMUAccessType type)
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index cba02c1320..c9b39fb67f 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -100,7 +100,7 @@ static inline target_ulong adjust_addr(CPURISCVState *env, target_ulong addr)
 /*
  * This function checks watchpoint before real load operation.
  *
- * In softmmu mode, the TLB API probe_access is enough for watchpoint check.
+ * In system mode, the TLB API probe_access is enough for watchpoint check.
  * In user mode, there is no watchpoint support now.
  *
  * It will trigger an exception if there is no mapping in TLB
diff --git a/tcg/region.c b/tcg/region.c
index a078899096..86692455c0 100644
--- a/tcg/region.c
+++ b/tcg/region.c
@@ -733,7 +733,7 @@ static int alloc_code_gen_buffer(size_t size, int splitwx, Error **errp)
  * and then assigning regions to TCG threads so that the threads can translate
  * code in parallel without synchronization.
  *
- * In softmmu the number of TCG threads is bounded by max_cpus, so we use at
+ * In system-mode the number of TCG threads is bounded by max_cpus, so we use at
  * least max_cpus regions in MTTCG. In !MTTCG we use a single region.
  * Note that the TCG options from the command-line (i.e. -accel accel=tcg,[...])
  * must have been parsed before calling this function, since it calls
@@ -749,7 +749,7 @@ static int alloc_code_gen_buffer(size_t size, int splitwx, Error **errp)
  *
  * However, this user-mode limitation is unlikely to be a significant problem
  * in practice. Multi-threaded guests share most if not all of their translated
- * code, which makes parallel code generation less appealing than in softmmu.
+ * code, which makes parallel code generation less appealing than in system-mode
  */
 void tcg_region_init(size_t tb_size, int splitwx, unsigned max_cpus)
 {
diff --git a/tcg/tcg.c b/tcg/tcg.c
index ea94d0fbff..2f56456b25 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -751,12 +751,13 @@ static void alloc_tcg_plugin_context(TCGContext *s)
  * In user-mode we just point tcg_ctx to tcg_init_ctx. See the documentation
  * of tcg_region_init() for the reasoning behind this.
  *
- * In softmmu each caller registers its context in tcg_ctxs[]. Note that in
- * softmmu tcg_ctxs[] does not track tcg_ctx_init, since the initial context
+ * In system-mode each caller registers its context in tcg_ctxs[]. Note that in
+ * system-mode tcg_ctxs[] does not track tcg_ctx_init, since the initial context
  * is not used anymore for translation once this function is called.
  *
- * Not tracking tcg_init_ctx in tcg_ctxs[] in softmmu keeps code that iterates
- * over the array (e.g. tcg_code_size() the same for both softmmu and user-mode.
+ * Not tracking tcg_init_ctx in tcg_ctxs[] in system-mode keeps code that
+ * iterates over the array (e.g. tcg_code_size() the same for both system/user
+ * modes.
  */
 #ifdef CONFIG_USER_ONLY
 void tcg_register_thread(void)
@@ -1340,7 +1341,7 @@ static void tcg_context_init(unsigned max_cpus)
      * In user-mode we simply share the init context among threads, since we
      * use a single region. See the documentation tcg_region_init() for the
      * reasoning behind this.
-     * In softmmu we will have at most max_cpus TCG threads.
+     * In system-mode we will have at most max_cpus TCG threads.
      */
 #ifdef CONFIG_USER_ONLY
     tcg_ctxs = &tcg_ctx;
diff --git a/tests/tcg/multiarch/system/memory.c b/tests/tcg/multiarch/system/memory.c
index e29786ae55..6eb2eb16f7 100644
--- a/tests/tcg/multiarch/system/memory.c
+++ b/tests/tcg/multiarch/system/memory.c
@@ -1,14 +1,14 @@
 /*
  * Memory Test
  *
- * This is intended to test the softmmu code and ensure we properly
+ * This is intended to test the system-mode code and ensure we properly
  * behave across normal and unaligned accesses across several pages.
  * We are not replicating memory tests for stuck bits and other
  * hardware level failures but looking for issues with different size
  * accesses when access is:
  *
  *   - unaligned at various sizes (if -DCHECK_UNALIGNED set)
- *   - spanning a (softmmu) page
+ *   - spanning a (system) page
  *   - sign extension when loading
  */
 
diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
index 06ea3c7652..88a243a310 100644
--- a/tcg/aarch64/tcg-target.c.inc
+++ b/tcg/aarch64/tcg-target.c.inc
@@ -1643,8 +1643,8 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 #define MIN_TLB_MASK_TABLE_OFS  -512
 
 /*
- * For softmmu, perform the TLB load and compare.
- * For useronly, perform any required alignment tests.
+ * For system-mode, perform the TLB load and compare.
+ * For user-mode, perform any required alignment tests.
  * In both cases, return a TCGLabelQemuLdst structure if the slow path
  * is required and fill in @h with the host address for the fast path.
  */
diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
index b1d56362a7..ec3f9250c2 100644
--- a/tcg/arm/tcg-target.c.inc
+++ b/tcg/arm/tcg-target.c.inc
@@ -353,7 +353,7 @@ static bool patch_reloc(tcg_insn_unit *code_ptr, int type,
 #define ALL_VECTOR_REGS   0xffff0000u
 
 /*
- * r0-r3 will be overwritten when reading the tlb entry (softmmu only);
+ * r0-r3 will be overwritten when reading the tlb entry (system-mode only);
  * r14 will be overwritten by the BLNE branching to the slow path.
  */
 #ifdef CONFIG_SOFTMMU
diff --git a/tcg/i386/tcg-target.c.inc b/tcg/i386/tcg-target.c.inc
index 4e47151241..788d608150 100644
--- a/tcg/i386/tcg-target.c.inc
+++ b/tcg/i386/tcg-target.c.inc
@@ -2276,7 +2276,7 @@ static void tcg_out_qemu_st_direct(TCGContext *s, TCGReg datalo, TCGReg datahi,
     int movop = OPC_MOVL_EvGv;
 
     /*
-     * Do big-endian stores with movbe or softmmu.
+     * Do big-endian stores with movbe or system-mode.
      * User-only without movbe will have its swapping done generically.
      */
     if (memop & MO_BSWAP) {
diff --git a/tcg/loongarch64/tcg-target.c.inc b/tcg/loongarch64/tcg-target.c.inc
index b701df50db..879a05ace4 100644
--- a/tcg/loongarch64/tcg-target.c.inc
+++ b/tcg/loongarch64/tcg-target.c.inc
@@ -891,8 +891,8 @@ bool tcg_target_has_memory_bswap(MemOp memop)
 #define MIN_TLB_MASK_TABLE_OFS  -(1 << 11)
 
 /*
- * For softmmu, perform the TLB load and compare.
- * For useronly, perform any required alignment tests.
+ * For system-mode, perform the TLB load and compare.
+ * For user-mode, perform any required alignment tests.
  * In both cases, return a TCGLabelQemuLdst structure if the slow path
  * is required and fill in @h with the host address for the fast path.
  */
diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
index f52bda4828..e2892edc6a 100644
--- a/tcg/mips/tcg-target.c.inc
+++ b/tcg/mips/tcg-target.c.inc
@@ -1258,8 +1258,8 @@ bool tcg_target_has_memory_bswap(MemOp memop)
 #define MIN_TLB_MASK_TABLE_OFS  -32768
 
 /*
- * For softmmu, perform the TLB load and compare.
- * For useronly, perform any required alignment tests.
+ * For system-mode, perform the TLB load and compare.
+ * For user-mode, perform any required alignment tests.
  * In both cases, return a TCGLabelQemuLdst structure if the slow path
  * is required and fill in @h with the host address for the fast path.
  */
diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
index 90d76c2c2c..5c873b2161 100644
--- a/tcg/ppc/tcg-target.c.inc
+++ b/tcg/ppc/tcg-target.c.inc
@@ -2091,8 +2091,8 @@ bool tcg_target_has_memory_bswap(MemOp memop)
 #define MIN_TLB_MASK_TABLE_OFS  -32768
 
 /*
- * For softmmu, perform the TLB load and compare.
- * For useronly, perform any required alignment tests.
+ * For system-mode, perform the TLB load and compare.
+ * For user-mode, perform any required alignment tests.
  * In both cases, return a TCGLabelQemuLdst structure if the slow path
  * is required and fill in @h with the host address for the fast path.
  */
diff --git a/tcg/riscv/tcg-target.c.inc b/tcg/riscv/tcg-target.c.inc
index c2bcdea33f..d6dbcaf3cb 100644
--- a/tcg/riscv/tcg-target.c.inc
+++ b/tcg/riscv/tcg-target.c.inc
@@ -1227,8 +1227,8 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
 #define MIN_TLB_MASK_TABLE_OFS  -(1 << 11)
 
 /*
- * For softmmu, perform the TLB load and compare.
- * For useronly, perform any required alignment tests.
+ * For system-mode, perform the TLB load and compare.
+ * For user-mode, perform any required alignment tests.
  * In both cases, return a TCGLabelQemuLdst structure if the slow path
  * is required and fill in @h with the host address for the fast path.
  */
diff --git a/tcg/s390x/tcg-target.c.inc b/tcg/s390x/tcg-target.c.inc
index 7552f63a05..4ef9ac3d5b 100644
--- a/tcg/s390x/tcg-target.c.inc
+++ b/tcg/s390x/tcg-target.c.inc
@@ -1750,8 +1750,8 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *lb)
 #define MIN_TLB_MASK_TABLE_OFS  -(1 << 19)
 
 /*
- * For softmmu, perform the TLB load and compare.
- * For useronly, perform any required alignment tests.
+ * For system-mode, perform the TLB load and compare.
+ * For user-mode, perform any required alignment tests.
  * In both cases, return a TCGLabelQemuLdst structure if the slow path
  * is required and fill in @h with the host address for the fast path.
  */
diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index 01ac26c192..19d9df4a09 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -1033,8 +1033,8 @@ bool tcg_target_has_memory_bswap(MemOp memop)
 #define MIN_TLB_MASK_TABLE_OFS  -(1 << 12)
 
 /*
- * For softmmu, perform the TLB load and compare.
- * For useronly, perform any required alignment tests.
+ * For system-mode, perform the TLB load and compare.
+ * For user-mode, perform any required alignment tests.
  * In both cases, return a TCGLabelQemuLdst structure if the slow path
  * is required and fill in @h with the host address for the fast path.
  */
diff --git a/tcg/meson.build b/tcg/meson.build
index 4be4a616ca..895a11d3fa 100644
--- a/tcg/meson.build
+++ b/tcg/meson.build
@@ -34,12 +34,12 @@ tcg_user = declare_dependency(link_with: libtcg_user,
                               dependencies: tcg_ss.dependencies())
 user_ss.add(tcg_user)
 
-libtcg_softmmu = static_library('tcg_softmmu',
+libtcg_system = static_library('tcg_system',
                                 tcg_ss.sources() + genh,
                                 name_suffix: 'fa',
                                 c_args: '-DCONFIG_SOFTMMU',
                                 build_by_default: false)
 
-tcg_softmmu = declare_dependency(link_with: libtcg_softmmu,
+tcg_system = declare_dependency(link_with: libtcg_system,
                                  dependencies: tcg_ss.dependencies())
-system_ss.add(tcg_softmmu)
+system_ss.add(tcg_system)
diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
index 462289f47c..f3a189c9d4 100644
--- a/tests/tcg/Makefile.target
+++ b/tests/tcg/Makefile.target
@@ -120,7 +120,7 @@ endif
 %: %.S
 	$(CC) $(CFLAGS) $(EXTRA_CFLAGS) $< -o $@ $(LDFLAGS)
 else
-# For softmmu targets we include a different Makefile fragment as the
+# For system targets we include a different Makefile fragment as the
 # build options for bare programs are usually pretty different. They
 # are expected to provide their own build recipes.
 EXTRA_CFLAGS += -ffreestanding
diff --git a/tests/tcg/multiarch/gdbstub/interrupt.py b/tests/tcg/multiarch/gdbstub/interrupt.py
index e222ac94c5..c016e7afbb 100644
--- a/tests/tcg/multiarch/gdbstub/interrupt.py
+++ b/tests/tcg/multiarch/gdbstub/interrupt.py
@@ -1,6 +1,6 @@
 from __future__ import print_function
 #
-# Test some of the softmmu debug features with the multiarch memory
+# Test some of the system debug features with the multiarch memory
 # test. It is a port of the original vmlinux focused test case but
 # using the "memory" test instead.
 #
diff --git a/tests/tcg/multiarch/gdbstub/memory.py b/tests/tcg/multiarch/gdbstub/memory.py
index dd25e72281..fb1d06b7bb 100644
--- a/tests/tcg/multiarch/gdbstub/memory.py
+++ b/tests/tcg/multiarch/gdbstub/memory.py
@@ -1,6 +1,6 @@
 from __future__ import print_function
 #
-# Test some of the softmmu debug features with the multiarch memory
+# Test some of the system debug features with the multiarch memory
 # test. It is a port of the original vmlinux focused test case but
 # using the "memory" test instead.
 #
diff --git a/tests/tcg/s390x/pgm-specification-softmmu.S b/tests/tcg/s390x/pgm-specification-softmmu.S
index d534f4e505..86c340aeef 100644
--- a/tests/tcg/s390x/pgm-specification-softmmu.S
+++ b/tests/tcg/s390x/pgm-specification-softmmu.S
@@ -1,5 +1,5 @@
 /*
- * Common softmmu code for specification exception testing.
+ * Common system code for specification exception testing.
  *
  * SPDX-License-Identifier: GPL-2.0-or-later
  */
diff --git a/tests/tcg/s390x/softmmu.ld b/tests/tcg/s390x/softmmu.ld
index ea944eaa3c..c7a8864407 100644
--- a/tests/tcg/s390x/softmmu.ld
+++ b/tests/tcg/s390x/softmmu.ld
@@ -1,5 +1,5 @@
 /*
- * Linker script for the softmmu test kernels.
+ * Linker script for the system test kernels.
  *
  * SPDX-License-Identifier: GPL-2.0-or-later
  */
diff --git a/tests/tcg/xtensa/Makefile.softmmu-target b/tests/tcg/xtensa/Makefile.softmmu-target
index 78bf72dfaa..a29571b367 100644
--- a/tests/tcg/xtensa/Makefile.softmmu-target
+++ b/tests/tcg/xtensa/Makefile.softmmu-target
@@ -1,5 +1,5 @@
 #
-# Xtensa softmmu tests
+# Xtensa system tests
 #
 
 CORE=dc232b
diff --git a/tests/tcg/xtensaeb/Makefile.softmmu-target b/tests/tcg/xtensaeb/Makefile.softmmu-target
index 4204a96d53..95d0528c37 100644
--- a/tests/tcg/xtensaeb/Makefile.softmmu-target
+++ b/tests/tcg/xtensaeb/Makefile.softmmu-target
@@ -1,5 +1,5 @@
 #
-# Xtensa softmmu tests
+# Xtensa system tests
 #
 
 include $(SRC_PATH)/tests/tcg/xtensa/Makefile.softmmu-target
-- 
2.41.0
