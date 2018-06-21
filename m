Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2279502wrq;
        Thu, 21 Jun 2018 10:37:10 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKVA/299Go/WenZtIxYI6LeXxbQhd1esRtYHAzSlRVRe6EAABtKETaJsdF0nSj8sHO8f5G+
X-Received: by 2002:a0c:b3d5:: with SMTP id b21-v6mr23298487qvf.80.1529602630063;
        Thu, 21 Jun 2018 10:37:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529602630; cv=none;
        d=google.com; s=arc-20160816;
        b=zAgp+Jy/Lmrnbl8dkzbe2VdvdRkIk6K58owUAh5K+c4JtVlXUX1P05LUNRrZXOUkzq
         /C6EHKAL339MkBbmEFHVZkRdermaGKxk0Udln9XrfsOemF1Ghmf2Y5VQvc0Si4NuYHT7
         BnceBtSaD6xDgmzDJw+Jm4u4896y0Z18zn8wup8Bn2nBsVz+KXG90KE5PRsnEgpTLD4l
         wQZdsXKxjedsQfqKKS2fuuBUAyT6BE7AFOkbO9l1yXgf9N+Xega4/jWXq/qmMs1lncYN
         7pTk6J3a3pSKpkc7Q+MtaIRDZWVP7hQc3YyxZxmW6EEkCzCgziz2NvZoaeW0wO3OebTY
         FJ9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=dymgG+Lj6AEEhFfH5KrDyexbVF7WGuf7sAlMRIoBv8U=;
        b=va1PzRnysLw8ClKYqeGiKzdEuyaASw7BKHiMbJHxO5mI7N0obsf/EV5Md98aBTLuDD
         7+nVC7ceu8N3B2IGvrt7JJFpKUC0hSC0o1TlzsJMarzTZX8s6+gXJv4OYW5tDWR8oPX3
         XYp9vPZWj3eQMMLv+eYIoEf32izx+K/gHlKvNWUbKTeepNu3rVd26vcfbNpOMki+H2eD
         5uXDv0JBBFHhVFelRI/ZaMRr95wewTLlnpShY2iSM/wKdFFZC7KBF6Ua5cPom7Ql/Sct
         HxL386sROEXLPdmbjko7yT3Ic6kMeK8FmtBrOCSrvFfZbR70p+gv9TVqj1XfXh1SKVTB
         A9vg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=W2fDl7Lx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c18-v6si5288894qtc.33.2018.06.21.10.37.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Jun 2018 10:37:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=W2fDl7Lx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56911 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fW3W9-00012z-CZ
	for alex.bennee@linaro.org; Thu, 21 Jun 2018 13:37:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54954)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fW3Vm-0000r6-KZ
	for qemu-arm@nongnu.org; Thu, 21 Jun 2018 13:36:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fW3Vk-0004Mb-9M
	for qemu-arm@nongnu.org; Thu, 21 Jun 2018 13:36:46 -0400
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:40089)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fW3Vk-0004LZ-18
	for qemu-arm@nongnu.org; Thu, 21 Jun 2018 13:36:44 -0400
Received: by mail-pf0-x241.google.com with SMTP id z24-v6so1869317pfe.7
	for <qemu-arm@nongnu.org>; Thu, 21 Jun 2018 10:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=dymgG+Lj6AEEhFfH5KrDyexbVF7WGuf7sAlMRIoBv8U=;
	b=W2fDl7LxG844Of4dfpnPOaZPkrQzilaQxgdf4ZNnOCsZGtL0MpTTOt/RbckoFP7Xf5
	FC2yPrACcpUcIUdiqAAvVb/RhY8tXrc2Zyf/OidHqZr3M6wmxS7wKxOk7+qS/Ghmqqw0
	eA+zztoMoh9BJ5iJtCqGyL/xxrMikzTLvtzpo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=dymgG+Lj6AEEhFfH5KrDyexbVF7WGuf7sAlMRIoBv8U=;
	b=iapnrD80bLsqbMpAXJn9j21byXIyXm2BzmGWXqDUvF5eMHwNnba7FOk9bejWV7s7SY
	tsDlS+oyNQpPdsdBJablETTVVurRmMvi0hgJDCkpA9EFv5E4zSD9lZ/X3HL2wYU6njyn
	OVRf01i2jHyXMI1Lfq2nlcGsIYgyVFFZe9V1ISq0JbxJxlzIycz7BsNxGqXnoSf39pag
	nhFS0YhQoemS9t0wI8D/wQ794AGzKO9kQ/tcK3tPke6Hq4+Wl1JNkUYYYSgkm5YQXd6d
	aBD0GpuuM8TxhVPrglwQ3LVIKrg+GXr1lJpoTmZw97m81uMM7iKlOvakVJYWZS5/I1zP
	przw==
X-Gm-Message-State: APt69E1QU4DxD0FbDXv7FP2fJ53GJtUi+rdhydnYT4JF2XsBWHhwPOZ0
	o7QD3FQGq5tkfPG2Xkpd3/BzEg==
X-Received: by 2002:a65:4b46:: with SMTP id
	k6-v6mr23619171pgt.113.1529602602891; 
	Thu, 21 Jun 2018 10:36:42 -0700 (PDT)
Received: from cloudburst.twiddle.net (mta-98-147-121-51.hawaii.rr.com.
	[98.147.121.51]) by smtp.gmail.com with ESMTPSA id
	e192-v6sm9642897pfg.187.2018.06.21.10.36.40
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 21 Jun 2018 10:36:42 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu, 21 Jun 2018 07:36:34 -1000
Message-Id: <20180621173635.21537-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180621173635.21537-1-richard.henderson@linaro.org>
References: <20180621173635.21537-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::241
Subject: [Qemu-arm] [PATCH 1/2] exec: Split mmap_lock to
 mmap_rdlock/mmap_wrlock
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: cota@braap.org, laurent@vivier.eu, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kNEd1fDeBhSR

Do not yet change the backing implementation, but split intent
of users for reading or modification of the memory map.

Uses within accel/tcg/ and exec.c are expecting exclusivity
while manipulating TranslationBlock data structures, so consider
those writers.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/exec-all.h    |  6 ++++--
 accel/tcg/cpu-exec.c       |  8 ++++----
 accel/tcg/translate-all.c  |  4 ++--
 bsd-user/mmap.c            | 18 ++++++++++++++----
 exec.c                     |  6 +++---
 linux-user/elfload.c       |  2 +-
 linux-user/mips/cpu_loop.c |  2 +-
 linux-user/mmap.c          | 22 ++++++++++++++++------
 linux-user/ppc/cpu_loop.c  |  2 +-
 linux-user/syscall.c       |  4 ++--
 target/arm/sve_helper.c    | 10 +++-------
 target/xtensa/op_helper.c  |  2 +-
 12 files changed, 52 insertions(+), 34 deletions(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 25a6f28ab8..a57764b693 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -468,7 +468,8 @@ void tlb_fill(CPUState *cpu, target_ulong addr, int size,
 #endif
 
 #if defined(CONFIG_USER_ONLY)
-void mmap_lock(void);
+void mmap_rdlock(void);
+void mmap_wrlock(void);
 void mmap_unlock(void);
 bool have_mmap_lock(void);
 
@@ -477,7 +478,8 @@ static inline tb_page_addr_t get_page_addr_code(CPUArchState *env1, target_ulong
     return addr;
 }
 #else
-static inline void mmap_lock(void) {}
+static inline void mmap_rdlock(void) {}
+static inline void mmap_wrlock(void) {}
 static inline void mmap_unlock(void) {}
 
 /* cputlb.c */
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index c738b7f7d6..59bdedb6c7 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -212,7 +212,7 @@ static void cpu_exec_nocache(CPUState *cpu, int max_cycles,
        We only end up here when an existing TB is too long.  */
     cflags |= MIN(max_cycles, CF_COUNT_MASK);
 
-    mmap_lock();
+    mmap_wrlock();
     tb = tb_gen_code(cpu, orig_tb->pc, orig_tb->cs_base,
                      orig_tb->flags, cflags);
     tb->orig_tb = orig_tb;
@@ -222,7 +222,7 @@ static void cpu_exec_nocache(CPUState *cpu, int max_cycles,
     trace_exec_tb_nocache(tb, tb->pc);
     cpu_tb_exec(cpu, tb);
 
-    mmap_lock();
+    mmap_wrlock();
     tb_phys_invalidate(tb, -1);
     mmap_unlock();
     tcg_tb_remove(tb);
@@ -243,7 +243,7 @@ void cpu_exec_step_atomic(CPUState *cpu)
     if (sigsetjmp(cpu->jmp_env, 0) == 0) {
         tb = tb_lookup__cpu_state(cpu, &pc, &cs_base, &flags, cf_mask);
         if (tb == NULL) {
-            mmap_lock();
+            mmap_wrlock();
             tb = tb_gen_code(cpu, pc, cs_base, flags, cflags);
             mmap_unlock();
         }
@@ -397,7 +397,7 @@ static inline TranslationBlock *tb_find(CPUState *cpu,
 
     tb = tb_lookup__cpu_state(cpu, &pc, &cs_base, &flags, cf_mask);
     if (tb == NULL) {
-        mmap_lock();
+        mmap_wrlock();
         tb = tb_gen_code(cpu, pc, cs_base, flags, cf_mask);
         mmap_unlock();
         /* We add the TB in the virtual pc hash table for the fast lookup */
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index f0c3fd4d03..48a71af392 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -1214,7 +1214,7 @@ static gboolean tb_host_size_iter(gpointer key, gpointer value, gpointer data)
 /* flush all the translation blocks */
 static void do_tb_flush(CPUState *cpu, run_on_cpu_data tb_flush_count)
 {
-    mmap_lock();
+    mmap_wrlock();
     /* If it is already been done on request of another CPU,
      * just retry.
      */
@@ -2563,7 +2563,7 @@ int page_unprotect(target_ulong address, uintptr_t pc)
     /* Technically this isn't safe inside a signal handler.  However we
        know this only ever happens in a synchronous SEGV handler, so in
        practice it seems to be ok.  */
-    mmap_lock();
+    mmap_wrlock();
 
     p = page_find(address >> TARGET_PAGE_BITS);
     if (!p) {
diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c
index 17f4cd80aa..4f6fe3cf4e 100644
--- a/bsd-user/mmap.c
+++ b/bsd-user/mmap.c
@@ -28,13 +28,23 @@
 static pthread_mutex_t mmap_mutex = PTHREAD_MUTEX_INITIALIZER;
 static __thread int mmap_lock_count;
 
-void mmap_lock(void)
+static void mmap_lock_internal(void)
 {
     if (mmap_lock_count++ == 0) {
         pthread_mutex_lock(&mmap_mutex);
     }
 }
 
+void mmap_rdlock(void)
+{
+    mmap_lock_internal();
+}
+
+void mmap_wrlock(void)
+{
+    mmap_lock_internal();
+}
+
 void mmap_unlock(void)
 {
     if (--mmap_lock_count == 0) {
@@ -87,7 +97,7 @@ int target_mprotect(abi_ulong start, abi_ulong len, int prot)
     if (len == 0)
         return 0;
 
-    mmap_lock();
+    mmap_wrlock();
     host_start = start & qemu_host_page_mask;
     host_end = HOST_PAGE_ALIGN(end);
     if (start > host_start) {
@@ -248,7 +258,7 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
     abi_ulong ret, end, real_start, real_end, retaddr, host_offset, host_len;
     unsigned long host_start;
 
-    mmap_lock();
+    mmap_wrlock();
 #ifdef DEBUG_MMAP
     {
         printf("mmap: start=0x" TARGET_FMT_lx
@@ -424,7 +434,7 @@ int target_munmap(abi_ulong start, abi_ulong len)
     len = TARGET_PAGE_ALIGN(len);
     if (len == 0)
         return -EINVAL;
-    mmap_lock();
+    mmap_wrlock();
     end = start + len;
     real_start = start & qemu_host_page_mask;
     real_end = HOST_PAGE_ALIGN(end);
diff --git a/exec.c b/exec.c
index 28f9bdcbf9..27d9c2ab0c 100644
--- a/exec.c
+++ b/exec.c
@@ -1030,7 +1030,7 @@ const char *parse_cpu_model(const char *cpu_model)
 #if defined(CONFIG_USER_ONLY)
 static void breakpoint_invalidate(CPUState *cpu, target_ulong pc)
 {
-    mmap_lock();
+    mmap_wrlock();
     tb_invalidate_phys_page_range(pc, pc + 1, 0);
     mmap_unlock();
 }
@@ -2743,7 +2743,7 @@ static void check_watchpoint(int offset, int len, MemTxAttrs attrs, int flags)
                 }
                 cpu->watchpoint_hit = wp;
 
-                mmap_lock();
+                mmap_wrlock();
                 tb_check_watchpoint(cpu);
                 if (wp->flags & BP_STOP_BEFORE_ACCESS) {
                     cpu->exception_index = EXCP_DEBUG;
@@ -3143,7 +3143,7 @@ static void invalidate_and_set_dirty(MemoryRegion *mr, hwaddr addr,
     }
     if (dirty_log_mask & (1 << DIRTY_MEMORY_CODE)) {
         assert(tcg_enabled());
-        mmap_lock();
+        mmap_wrlock();
         tb_invalidate_phys_range(addr, addr + length);
         mmap_unlock();
         dirty_log_mask &= ~(1 << DIRTY_MEMORY_CODE);
diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index bdb023b477..9ef8ab972a 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -2196,7 +2196,7 @@ static void load_elf_image(const char *image_name, int image_fd,
     info->nsegs = 0;
     info->pt_dynamic_addr = 0;
 
-    mmap_lock();
+    mmap_wrlock();
 
     /* Find the maximum size of the image and allocate an appropriate
        amount of memory to handle that.  */
diff --git a/linux-user/mips/cpu_loop.c b/linux-user/mips/cpu_loop.c
index 084ad6a041..9d7399c6d1 100644
--- a/linux-user/mips/cpu_loop.c
+++ b/linux-user/mips/cpu_loop.c
@@ -405,7 +405,7 @@ static int do_store_exclusive(CPUMIPSState *env)
     addr = env->lladdr;
     page_addr = addr & TARGET_PAGE_MASK;
     start_exclusive();
-    mmap_lock();
+    mmap_rdlock();
     flags = page_get_flags(page_addr);
     if ((flags & PAGE_READ) == 0) {
         segv = 1;
diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index 9168a2051c..71b6bed5e2 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -27,13 +27,23 @@
 static pthread_mutex_t mmap_mutex = PTHREAD_MUTEX_INITIALIZER;
 static __thread int mmap_lock_count;
 
-void mmap_lock(void)
+static void mmap_lock_internal(void)
 {
     if (mmap_lock_count++ == 0) {
         pthread_mutex_lock(&mmap_mutex);
     }
 }
 
+void mmap_rdlock(void)
+{
+    mmap_lock_internal();
+}
+
+void mmap_wrlock(void)
+{
+    mmap_lock_internal();
+}
+
 void mmap_unlock(void)
 {
     if (--mmap_lock_count == 0) {
@@ -87,7 +97,7 @@ int target_mprotect(abi_ulong start, abi_ulong len, int prot)
     if (len == 0)
         return 0;
 
-    mmap_lock();
+    mmap_wrlock();
     host_start = start & qemu_host_page_mask;
     host_end = HOST_PAGE_ALIGN(end);
     if (start > host_start) {
@@ -251,7 +261,7 @@ static abi_ulong mmap_find_vma_reserved(abi_ulong start, abi_ulong size)
 /*
  * Find and reserve a free memory area of size 'size'. The search
  * starts at 'start'.
- * It must be called with mmap_lock() held.
+ * It must be called with mmap_wrlock() held.
  * Return -1 if error.
  */
 abi_ulong mmap_find_vma(abi_ulong start, abi_ulong size)
@@ -364,7 +374,7 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
 {
     abi_ulong ret, end, real_start, real_end, retaddr, host_offset, host_len;
 
-    mmap_lock();
+    mmap_wrlock();
 #ifdef DEBUG_MMAP
     {
         printf("mmap: start=0x" TARGET_ABI_FMT_lx
@@ -627,7 +637,7 @@ int target_munmap(abi_ulong start, abi_ulong len)
         return -TARGET_EINVAL;
     }
 
-    mmap_lock();
+    mmap_wrlock();
     end = start + len;
     real_start = start & qemu_host_page_mask;
     real_end = HOST_PAGE_ALIGN(end);
@@ -688,7 +698,7 @@ abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
         return -1;
     }
 
-    mmap_lock();
+    mmap_wrlock();
 
     if (flags & MREMAP_FIXED) {
         host_addr = mremap(g2h(old_addr), old_size, new_size,
diff --git a/linux-user/ppc/cpu_loop.c b/linux-user/ppc/cpu_loop.c
index 2fb516cb00..d7cd5f4a50 100644
--- a/linux-user/ppc/cpu_loop.c
+++ b/linux-user/ppc/cpu_loop.c
@@ -76,7 +76,7 @@ static int do_store_exclusive(CPUPPCState *env)
     addr = env->reserve_ea;
     page_addr = addr & TARGET_PAGE_MASK;
     start_exclusive();
-    mmap_lock();
+    mmap_rdlock();
     flags = page_get_flags(page_addr);
     if ((flags & PAGE_READ) == 0) {
         segv = 1;
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 2117fb13b4..4104444764 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -4989,7 +4989,7 @@ static inline abi_ulong do_shmat(CPUArchState *cpu_env,
         return -TARGET_EINVAL;
     }
 
-    mmap_lock();
+    mmap_wrlock();
 
     if (shmaddr)
         host_raddr = shmat(shmid, (void *)g2h(shmaddr), shmflg);
@@ -5034,7 +5034,7 @@ static inline abi_long do_shmdt(abi_ulong shmaddr)
     int i;
     abi_long rv;
 
-    mmap_lock();
+    mmap_wrlock();
 
     for (i = 0; i < N_SHM_REGIONS; ++i) {
         if (shm_regions[i].in_use && shm_regions[i].start == shmaddr) {
diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
index cd3dfc8b26..086547c7e5 100644
--- a/target/arm/sve_helper.c
+++ b/target/arm/sve_helper.c
@@ -4071,10 +4071,6 @@ record_fault(CPUARMState *env, intptr_t i, intptr_t oprsz)
  * between page_check_range and the load operation.  We expect the
  * usual case to have no faults at all, so we check the whole range
  * first and if successful defer to the normal load operation.
- *
- * TODO: Change mmap_lock to a rwlock so that multiple readers
- * can run simultaneously.  This will probably help other uses
- * within QEMU as well.
  */
 #define DO_LDFF1(PART, FN, TYPEE, TYPEM, H)                             \
 static void do_sve_ldff1##PART(CPUARMState *env, void *vd, void *vg,    \
@@ -4107,7 +4103,7 @@ void HELPER(sve_ldff1##PART)(CPUARMState *env, void *vg,                \
     intptr_t oprsz = simd_oprsz(desc);                                  \
     unsigned rd = simd_data(desc);                                      \
     void *vd = &env->vfp.zregs[rd];                                     \
-    mmap_lock();                                                        \
+    mmap_rdlock();                                                      \
     if (likely(page_check_range(addr, oprsz, PAGE_READ) == 0)) {        \
         do_sve_ld1##PART(env, vd, vg, addr, oprsz, GETPC());            \
     } else {                                                            \
@@ -4126,7 +4122,7 @@ void HELPER(sve_ldnf1##PART)(CPUARMState *env, void *vg,                \
     intptr_t oprsz = simd_oprsz(desc);                                  \
     unsigned rd = simd_data(desc);                                      \
     void *vd = &env->vfp.zregs[rd];                                     \
-    mmap_lock();                                                        \
+    mmap_rdlock();                                                      \
     if (likely(page_check_range(addr, oprsz, PAGE_READ) == 0)) {        \
         do_sve_ld1##PART(env, vd, vg, addr, oprsz, GETPC());            \
     } else {                                                            \
@@ -4500,7 +4496,7 @@ void HELPER(NAME)(CPUARMState *env, void *vd, void *vg, void *vm,       \
     unsigned scale = simd_data(desc);                                   \
     uintptr_t ra = GETPC();                                             \
     bool first = true;                                                  \
-    mmap_lock();                                                        \
+    mmap_rdlock();                                                      \
     for (i = 0; i < oprsz; i++) {                                       \
         uint16_t pg = *(uint16_t *)(vg + H1_2(i >> 3));                 \
         do {                                                            \
diff --git a/target/xtensa/op_helper.c b/target/xtensa/op_helper.c
index 8a8c763c63..251fa27d43 100644
--- a/target/xtensa/op_helper.c
+++ b/target/xtensa/op_helper.c
@@ -114,7 +114,7 @@ static void tb_invalidate_virtual_addr(CPUXtensaState *env, uint32_t vaddr)
 
 static void tb_invalidate_virtual_addr(CPUXtensaState *env, uint32_t vaddr)
 {
-    mmap_lock();
+    mmap_wrlock();
     tb_invalidate_phys_range(vaddr, vaddr + 1);
     mmap_unlock();
 }
-- 
2.17.1

