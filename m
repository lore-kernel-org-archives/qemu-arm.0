Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp2072020lfc;
        Thu, 4 Jun 2020 21:17:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/srX6JOqzgI6oLgfRIZRjQD/MlpPCsfSoj3IpTP89ECoPt7b7AEMOHuo2bs/tSa+WaLgK
X-Received: by 2002:a25:b90a:: with SMTP id x10mr13629141ybj.334.1591330668602;
        Thu, 04 Jun 2020 21:17:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591330668; cv=none;
        d=google.com; s=arc-20160816;
        b=UOJ0kOUdztUMOaQBAmJ41yO/WGhZvwFWDOzT1Z4xqqHBH+DqzUOTIcByUlivHnBF1l
         uHNY+hpeC2v79ite4+XPCZ3hJP/GhBrM7TlGxui+b96b3Tke6Uwj4YeARiBq5WYYzQqL
         sHEehYS6LAKotF/6oSlu870InfZA5q7+c88Bs1clrKcaoNqbHJL+EF38ydaIgaDC2VkM
         6egqIQwNYSa0PGp1nPEDmt4MevLG4fHKNPKD/WV+UDfLxlqUOM4CpwT44IYeEbnlVPoj
         t4wZiNsmfRBMQqy7HGs7W/9tzW/sX2C1KTkT8D/BRpIlroq02jiOj811DV6x93zrrr29
         MhFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=afqYJRs0BdUykWHYLxRC5+OCKgvwuuB1J/PoMsnkMLE=;
        b=mjzm3DONMcBwKZsaLtZETBZVSc0P4XaFX1ojE3rsGhz4poa663tADF/W0n9dvPsf8t
         PRjGAwjcyyfReETJHcb5XNbsNyNse+2kyPF9aXeQhRcqMHuumXLGnFeUOl39hDdc8Hy6
         dBbJn+692gPACiKSq/SI2sbROTNSZ2aKdZUd1m+RO60kydXPmA6WnZ05/bhSGiP5Klha
         amUCsTCwzYQatoITnuO6Swf7/CzY2Vb9lrHpSFEs3vptuiTPGqGyJAE/kMQi1luryMNx
         vOGo/NT0zr+JK29psGGqGoTRNeC8HNZvOjylBilWZy60xZ3EaotWkQ6QRiLp+kEj9gvK
         gtvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wIWshM2E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s88si6830774ybi.345.2020.06.04.21.17.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jun 2020 21:17:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=wIWshM2E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jh3nf-00049z-Rc
	for alex.bennee@linaro.org; Fri, 05 Jun 2020 00:17:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jh3nX-00049X-4H
 for qemu-arm@nongnu.org; Fri, 05 Jun 2020 00:17:39 -0400
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043]:50427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jh3nW-0000hb-4A
 for qemu-arm@nongnu.org; Fri, 05 Jun 2020 00:17:38 -0400
Received: by mail-pj1-x1043.google.com with SMTP id jz3so2056802pjb.0
 for <qemu-arm@nongnu.org>; Thu, 04 Jun 2020 21:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=afqYJRs0BdUykWHYLxRC5+OCKgvwuuB1J/PoMsnkMLE=;
 b=wIWshM2EpGYLAAiKmopR5JOwhnbU+IQ4C7bWf0uxoIXdg2ql5/sDM1P/2CKTNyOqeH
 5whdNrOC3htm0ppzpk2UtRR6Y1dHlCT74NRaWWl1c3nqwgFr1G23kFa+dnV9SYdYWTjB
 XpGcuQIpLPphA1Fco4Pk8BJw17dtAd1vjIjp6I9vxyAyOSXkv+UoqCoZBWdAnTgKaa/z
 nYLUCUU3ZfMKNiZCTjqKTdPix6hQrMuW3P2pqtfm+ZtuvSypY2FDFmpcP+HMouSC0quD
 GXxOvJayZqW9TyKUY0E9RkUdw5W0wjTgpuwFrYcPtFVZbDTD7WPMQBMwPVEjixD+qfap
 fqqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=afqYJRs0BdUykWHYLxRC5+OCKgvwuuB1J/PoMsnkMLE=;
 b=QDr92aJKqxM/Koa9h2MTo2qOEhgn1Ad79ZueTe1ikg3X9EwDZ0QOoa/kzidbygH2+1
 EFtPP1Qm+VFDV823d0m9G+ScuQxOAswiDRgmd39302FmpllbJFShU+5dMMmuhLw7hq+d
 OjYeRRh4FhvcHrtoF3Uw8ICZU1IAeb5uKJfluFdGbD9ICzCZehVSgPMhcq3x2tSJX679
 l9Z8tXS1daqzshf/+odVnG3Azn9KPCK0GM5m8HHlEJRG2CWfgCcyzaS8JAQOKelrdPnh
 vlncj0LLyOaQu504jessFk98tikrmJD6dN0JM4oRAr2qFng8wPHP1TsuTB7pkWjUxFjS
 oABw==
X-Gm-Message-State: AOAM530rkTSpd9KSbMiv9PumDqACfOL1XTDlkC3M/Wtx9/gGZfy5W7/b
 ZB2Yq4M9toQ8XYdyFUZKocaePA==
X-Received: by 2002:a17:90a:2306:: with SMTP id
 f6mr752232pje.231.1591330656597; 
 Thu, 04 Jun 2020 21:17:36 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id h15sm5440902pgl.12.2020.06.04.21.17.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2020 21:17:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/17] tcg: Introduce target-specific page data for
 user-only
Date: Thu,  4 Jun 2020 21:17:17 -0700
Message-Id: <20200605041733.415188-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200605041733.415188-1-richard.henderson@linaro.org>
References: <20200605041733.415188-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1043;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1043.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2QeEFGG/wjru

This data can be allocated by page_alloc_target_data() and
released by page_set_flags(start, end, prot | PAGE_RESET).

This data will be used to hold tag memory for AArch64 MTE.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/cpu-all.h    | 20 ++++++++++++++------
 accel/tcg/translate-all.c | 28 ++++++++++++++++++++++++++++
 linux-user/mmap.c         |  5 ++++-
 linux-user/syscall.c      |  4 ++--
 4 files changed, 48 insertions(+), 9 deletions(-)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 2bd023d692..e5f564fa1f 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -266,15 +266,21 @@ extern intptr_t qemu_host_page_mask;
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
@@ -289,6 +295,8 @@ int walk_memory_regions(void *, walk_memory_regions_fn);
 int page_get_flags(target_ulong address);
 void page_set_flags(target_ulong start, target_ulong end, int flags);
 int page_check_range(target_ulong start, target_ulong len, int flags);
+void *page_get_target_data(target_ulong address);
+void *page_alloc_target_data(target_ulong address, size_t size);
 #endif
 
 CPUArchState *cpu_copy(CPUArchState *env);
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 42ce1dfcff..a65bc1d4c2 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -111,6 +111,7 @@ typedef struct PageDesc {
     unsigned int code_write_count;
 #else
     unsigned long flags;
+    void *target_data;
 #endif
 #ifndef CONFIG_USER_ONLY
     QemuSpin lock;
@@ -2525,6 +2526,7 @@ int page_get_flags(target_ulong address)
 void page_set_flags(target_ulong start, target_ulong end, int flags)
 {
     target_ulong addr, len;
+    bool reset_target_data;
 
     /* This function should never be called with addresses outside the
        guest address space.  If this assert fires, it probably indicates
@@ -2539,6 +2541,8 @@ void page_set_flags(target_ulong start, target_ulong end, int flags)
     if (flags & PAGE_WRITE) {
         flags |= PAGE_WRITE_ORG;
     }
+    reset_target_data = !(flags & PAGE_VALID) || (flags & PAGE_RESET);
+    flags &= ~PAGE_RESET;
 
     for (addr = start, len = end - start;
          len != 0;
@@ -2552,10 +2556,34 @@ void page_set_flags(target_ulong start, target_ulong end, int flags)
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
+    if (p) {
+        ret = p->target_data;
+        if (!ret && (p->flags & PAGE_VALID)) {
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
index 40f03e3174..f9832609b0 100644
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
@@ -787,9 +788,11 @@ abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
         new_addr = -1;
     } else {
         new_addr = h2g(host_addr);
+        /* FIXME: Move page flags and target_data for each page.  */
         prot = page_get_flags(old_addr);
         page_set_flags(old_addr, old_addr + old_size, 0);
-        page_set_flags(new_addr, new_addr + new_size, prot | PAGE_VALID);
+        page_set_flags(new_addr, new_addr + new_size,
+                       prot | PAGE_VALID | PAGE_RESET);
     }
     tb_invalidate_phys_range(new_addr, new_addr + new_size);
     mmap_unlock();
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 7f6700c54e..d190fb1122 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -4315,8 +4315,8 @@ static inline abi_ulong do_shmat(CPUArchState *cpu_env,
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

