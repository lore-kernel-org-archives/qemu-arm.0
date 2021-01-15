Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp673113lfq;
        Fri, 15 Jan 2021 14:47:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzmq+3O6TUpCxkmiaTE7cpJanQ9b4PVnjeq+vQVOwOvLU/itfU7hXBzPkFvW1qVigxsmgwT
X-Received: by 2002:a25:b685:: with SMTP id s5mr20283032ybj.264.1610750861573;
        Fri, 15 Jan 2021 14:47:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610750861; cv=none;
        d=google.com; s=arc-20160816;
        b=vQwcMDfQBWWmRnuVFAjf7auVQUdLu72XdGIawj541JhOBbsr4cZ4VZBq8xb7yrp18H
         E1FEp08DajZD4smtk/05ryzSVKHVydbR0WzBu2FfshuJEZnR10Kmu2lMKeMeUr6ZU4Om
         Yl86x+Hd1bnUn9SEXPkLq39rAcTHrtqrvHnkyHb9ZKB2pnDfbMaLvwq5C+aze6a+cuo+
         mQNifSGgAECwfbubjntp2si6UpsBbOmwSx4MqwDU11mjKVrfM4Z6KW9E+eEbntMw9Fpz
         6ey9bq9Q0Eo001WhwvzWMLs2G3K5Fd/ZpACEI4m2jHlKbzS2/eWXqhMzP52EbIDKNq4s
         OjZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=OL7icxJH7P33DCDYfdrnfsZF+7Y7OOSJvgMIHgzmTZ8=;
        b=XvfHPO4QV7XdSBn8F7ZRF2k+ZBkmCYDIbYARjPHf08cMOOLaxH+/zP91W9dGjmPMny
         TajyqL/xzUyCAgicse70ugLv2y2FCDDxXVjuPMG/r+tHVyA5yFvDe4HRF24b5q5Moyqv
         PVxRp6UB3uGGmCea9mroe6k2vhIXnRNo8O6bBuRyv//LYjjp3b6be4qOr6okSeglQxNe
         YhRKeZIwZQ9mfM8R6oMY+RnyGyEv48vvwKpIR3oXW3yAhuv4jUEpQZdEMr2/e0tH/sQX
         GINBpeVH2up8Y1nmMGk4gm6y5UHX1S9VSERGcxu68YmEW4rG7zN1yurK9oHABxu1qfxi
         n3jw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jfhX8Er1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x63si10804704ybc.14.2021.01.15.14.47.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 15 Jan 2021 14:47:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jfhX8Er1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l0Xsa-0003W4-RJ
	for alex.bennee@linaro.org; Fri, 15 Jan 2021 17:47:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0Xrq-0003Ux-2f
 for qemu-arm@nongnu.org; Fri, 15 Jan 2021 17:46:54 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:35061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l0Xro-0005B8-39
 for qemu-arm@nongnu.org; Fri, 15 Jan 2021 17:46:53 -0500
Received: by mail-pj1-x1030.google.com with SMTP id b5so6071169pjl.0
 for <qemu-arm@nongnu.org>; Fri, 15 Jan 2021 14:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OL7icxJH7P33DCDYfdrnfsZF+7Y7OOSJvgMIHgzmTZ8=;
 b=jfhX8Er1j525ffIEGeAZal2XJ2s/DSGXZ3KjBXMu+cR25Y3x/ptmmMeLvvDtT+VKT1
 uqIm1oYCV2S0EZh6qcOD402YHPUjhpdTqDua5dk5S/9KP9BBt5OUsqisC9AJD4TeLe2H
 v+mD/pBfuQljEbfuSHu711Zrmoo7WiVzWw6+4hbk//XciT/3qXBOvmAdCL/zyFtQcE28
 Q8hyyEgdQ6JGizj+5zvboJ+GoIO9E/i8vh+l9L8lOl9FVo95k8jD8GM4Ce/SKfOECJWD
 hNGZi0Id2DNLgWRA7WsdwuoUvAz3rzmaS3eV8JFF8WpYr16PPjTpOXHiJHqgV0K06s4p
 RvYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OL7icxJH7P33DCDYfdrnfsZF+7Y7OOSJvgMIHgzmTZ8=;
 b=WOAGKF0UJoE1uaFIkB5eZrNBZALEfkT6csTZxaNXH4ZYqggHHxvFsiyUrNsy5pzgZf
 UtXXWRk5k1YqoKAcCKu1kwXONu0uZcZnoi5E4H1ck2C8zmtcq3cRV6QVhb4f3B0jafC+
 tp4cZHrNftMGGFGie2bIG/8bNJ0rxIlHlIwlh6GuVITvgcOHUFmn73Cupsyz4C+p3VRe
 ErATr+Ae/oRkTR5nG0GAhgbM8YD7jEE7vWyLWmqLSARf4aPapjDCHyIVt9jnZDFn+EMg
 7r1qzZKAc/6dtQAbvtz8jLn9fREMLjxzVy19T4mHZKdJ/3Eunn4ux3+eT6vJVEKa4+Pd
 2E7Q==
X-Gm-Message-State: AOAM532UbdL39QlGqTAj9iZHj2csphswg6PSqpuzn1wZqStxx6t7bpYG
 E9E7w+EB55fMrSWLNdje5sUPLQ==
X-Received: by 2002:a17:90a:fb92:: with SMTP id
 cp18mr12694500pjb.203.1610750810645; 
 Fri, 15 Jan 2021 14:46:50 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id s13sm9521700pfd.99.2021.01.15.14.46.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 14:46:50 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 01/21] tcg: Introduce target-specific page data for
 user-only
Date: Fri, 15 Jan 2021 12:46:25 -1000
Message-Id: <20210115224645.1196742-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115224645.1196742-1-richard.henderson@linaro.org>
References: <20210115224645.1196742-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 562l6nUp5vmR

This data can be allocated by page_alloc_target_data() and
released by page_set_flags(start, end, prot | PAGE_RESET).

This data will be used to hold tag memory for AArch64 MTE.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v3: Add doc comments; tweak alloc so that the !PAGE_VALID case is clear.
---
 include/exec/cpu-all.h    | 42 +++++++++++++++++++++++++++++++++------
 accel/tcg/translate-all.c | 28 ++++++++++++++++++++++++++
 linux-user/mmap.c         |  4 +++-
 linux-user/syscall.c      |  4 ++--
 4 files changed, 69 insertions(+), 9 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 4b5408c341..99a09ee137 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -264,15 +264,21 @@ extern intptr_t qemu_host_page_mask;
 #define PAGE_EXEC      0x0004
 #define PAGE_BITS      (PAGE_READ | PAGE_WRITE | PAGE_EXEC)
 #define PAGE_VALID     0x0008
-/* original state of the write flag (used when tracking self-modifying
-   code */
+/*
+ * Original state of the write flag (used when tracking self-modifying code)
+ */
 #define PAGE_WRITE_ORG 0x0010
-/* Invalidate the TLB entry immediately, helpful for s390x
- * Low-Address-Protection. Used with PAGE_WRITE in tlb_set_page_with_attrs() */
-#define PAGE_WRITE_INV 0x0040
+/*
+ * Invalidate the TLB entry immediately, helpful for s390x
+ * Low-Address-Protection. Used with PAGE_WRITE in tlb_set_page_with_attrs()
+ */
+#define PAGE_WRITE_INV 0x0020
+/* For use with page_set_flags: page is being replaced; target_data cleared. */
+#define PAGE_RESET     0x0040
+
 #if defined(CONFIG_BSD) && defined(CONFIG_USER_ONLY)
 /* FIXME: Code that sets/uses this is broken and needs to go away.  */
-#define PAGE_RESERVED  0x0020
+#define PAGE_RESERVED  0x0100
 #endif
 /* Target-specific bits that will be used via page_get_flags().  */
 #define PAGE_TARGET_1  0x0080
@@ -287,6 +293,30 @@ int walk_memory_regions(void *, walk_memory_regions_fn);
 int page_get_flags(target_ulong address);
 void page_set_flags(target_ulong start, target_ulong end, int flags);
 int page_check_range(target_ulong start, target_ulong len, int flags);
+
+/**
+ * page_alloc_target_data(address, size)
+ * @address: guest virtual address
+ * @size: size of data to allocate
+ *
+ * Allocate @size bytes of out-of-band data to associate with the
+ * guest page at @address.  If the page is not mapped, NULL will
+ * be returned.  If there is existing data associated with @address,
+ * no new memory will be allocated.
+ *
+ * The memory will be freed when the guest page is deallocated,
+ * e.g. with the munmap system call.
+ */
+void *page_alloc_target_data(target_ulong address, size_t size);
+
+/**
+ * page_get_target_data(address)
+ * @address: guest virtual address
+ *
+ * Return any out-of-bound memory assocated with the guest page
+ * at @address, as per page_alloc_target_data.
+ */
+void *page_get_target_data(target_ulong address);
 #endif
 
 CPUArchState *cpu_copy(CPUArchState *env);
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index e9de6ff9dd..7bcb6663f1 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -113,6 +113,7 @@ typedef struct PageDesc {
     unsigned int code_write_count;
 #else
     unsigned long flags;
+    void *target_data;
 #endif
 #ifndef CONFIG_USER_ONLY
     QemuSpin lock;
@@ -2740,6 +2741,7 @@ int page_get_flags(target_ulong address)
 void page_set_flags(target_ulong start, target_ulong end, int flags)
 {
     target_ulong addr, len;
+    bool reset_target_data;
 
     /* This function should never be called with addresses outside the
        guest address space.  If this assert fires, it probably indicates
@@ -2754,6 +2756,8 @@ void page_set_flags(target_ulong start, target_ulong end, int flags)
     if (flags & PAGE_WRITE) {
         flags |= PAGE_WRITE_ORG;
     }
+    reset_target_data = !(flags & PAGE_VALID) || (flags & PAGE_RESET);
+    flags &= ~PAGE_RESET;
 
     for (addr = start, len = end - start;
          len != 0;
@@ -2767,10 +2771,34 @@ void page_set_flags(target_ulong start, target_ulong end, int flags)
             p->first_tb) {
             tb_invalidate_phys_page(addr, 0);
         }
+        if (reset_target_data && p->target_data) {
+            g_free(p->target_data);
+            p->target_data = NULL;
+        }
         p->flags = flags;
     }
 }
 
+void *page_get_target_data(target_ulong address)
+{
+    PageDesc *p = page_find(address >> TARGET_PAGE_BITS);
+    return p ? p->target_data : NULL;
+}
+
+void *page_alloc_target_data(target_ulong address, size_t size)
+{
+    PageDesc *p = page_find(address >> TARGET_PAGE_BITS);
+    void *ret = NULL;
+
+    if (p->flags & PAGE_VALID) {
+        ret = p->target_data;
+        if (!ret) {
+            p->target_data = ret = g_malloc0(size);
+        }
+    }
+    return ret;
+}
+
 int page_check_range(target_ulong start, target_ulong len, int flags)
 {
     PageDesc *p;
diff --git a/linux-user/mmap.c b/linux-user/mmap.c
index 810653c503..c693505b60 100644
--- a/linux-user/mmap.c
+++ b/linux-user/mmap.c
@@ -599,6 +599,7 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int target_prot,
         }
     }
  the_end1:
+    page_flags |= PAGE_RESET;
     page_set_flags(start, start + len, page_flags);
  the_end:
     trace_target_mmap_complete(start);
@@ -792,7 +793,8 @@ abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
         new_addr = h2g(host_addr);
         prot = page_get_flags(old_addr);
         page_set_flags(old_addr, old_addr + old_size, 0);
-        page_set_flags(new_addr, new_addr + new_size, prot | PAGE_VALID);
+        page_set_flags(new_addr, new_addr + new_size,
+                       prot | PAGE_VALID | PAGE_RESET);
     }
     tb_invalidate_phys_range(new_addr, new_addr + new_size);
     mmap_unlock();
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index d182890ff0..bec2ab7769 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -4625,8 +4625,8 @@ static inline abi_ulong do_shmat(CPUArchState *cpu_env,
     raddr=h2g((unsigned long)host_raddr);
 
     page_set_flags(raddr, raddr + shm_info.shm_segsz,
-                   PAGE_VALID | PAGE_READ |
-                   ((shmflg & SHM_RDONLY)? 0 : PAGE_WRITE));
+                   PAGE_VALID | PAGE_RESET | PAGE_READ |
+                   (shmflg & SHM_RDONLY ? 0 : PAGE_WRITE));
 
     for (i = 0; i < N_SHM_REGIONS; i++) {
         if (!shm_regions[i].in_use) {
-- 
2.25.1

