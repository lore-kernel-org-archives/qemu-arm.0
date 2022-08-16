Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp2008982ejf;
        Tue, 16 Aug 2022 13:34:32 -0700 (PDT)
X-Received: by 2002:a4a:33d8:0:b0:435:476c:ad98 with SMTP id q207-20020a4a33d8000000b00435476cad98mr6939984ooq.33.1660682072821;
        Tue, 16 Aug 2022 13:34:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660682072; cv=none;
        d=google.com; s=arc-20160816;
        b=FA0dmnj9dVVN2h+J6+8zVxzZnH2u8BemRWfZvki0+K/wM4pnxvx4EzO8qhAOmNZ3M4
         sMhjXsEZe/FCy1CiWiAPAbIu1k/lzKcnE9GWvmHsZlWJ4OmoXQrPgC5GZWJvTcUXKwYz
         4sShji9cGxpIEo8CSwvh0zY6fl834WxaYoZobJqN8ros90oChY80drcQCft8F1KXIE7f
         08Hkk+XHV/FD568v/1K0CxqTsghMWZezFn7cwfRZQKL9zqtgRZEss8dUTfX7hoJk9GFY
         H142FbiuHgjqE1tedUX76yRHdXryGKxXtj3dPuapNk90dSUT21N/9SRXhP+1zSNk/axJ
         peNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=xG7LkxSPgE8989MOfr7x1M7HWGz1uhuKkBsNsQ7qQC0=;
        b=URRG5DLfdMQb2Rf3XDuZThoeR7fS9JBZtabkqA3FB+JGpvWHT68qoADVLzXxAClrbU
         LYpZBWHYgqMUSDI2k6NRFlToZae3sTSXpBhHCAngSCxPoJ30uFK/l9T8UmSKBuokjtKJ
         y7D7PqkJbT7EaejrepUOfUI+Q9NEhbIP7l+cvwvpFDPetDRZZriNlGNgeg0qGxWAKOAx
         m+rFROjf+2/DQ03zc4qmBZbd5Aa8DcVShffEh6IZvrEi7+dOLO6ZT5EoBQDiJickrRCd
         hdP/KNAoYnMfYu0g7gRBCPtNXafMwn1GmA/A9C9IgU9JLI6B0m64RjlggNaVv4jz38XE
         y+Rg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l3o9QSKT;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 25-20020a056870119900b001167e133288sor2239645oau.169.2022.08.16.13.34.32
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 16 Aug 2022 13:34:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=l3o9QSKT;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=xG7LkxSPgE8989MOfr7x1M7HWGz1uhuKkBsNsQ7qQC0=;
        b=l3o9QSKTTKry/OppmEvbfuMu3KtZ/i0MjHa5S66pt3qt3PX8gfq8v4/Qhl+Q9ijLAK
         5Y53i0b6MJNyB5Ob9NrWq0wV34dvfmbq4+yCL5syvAHISEYL3ysOtPTOks+S8Yh5qGji
         J/Eyh7AbafKGEp9PYMyZl99w0GhRD92anwTtsTFNlRqPThJ4hhpjQEu2hDdAr7JCEKVn
         76VjRzYeXf46ToEiAi1PYNPDSIUpoCi9dVj/Kq4PUwAeTdqKArPIcwpwF6obD7QnVWy1
         /ctYkXcIQWMMb8KX/mD2+7aOUlYaqS1NWvhNHBb/pYK7mWHYBuztTaWuQypay9VfupwL
         gfyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=xG7LkxSPgE8989MOfr7x1M7HWGz1uhuKkBsNsQ7qQC0=;
        b=3sLOXhQq/zZHm8vDmZUmJjQuP1Ev9EjpDltCk5tGVo7XaUR+u/geapRKGDxx1ScOG0
         NTg4rIvPgi/zQ4j4Bwwwqg3RLA1SvAMO7S9Lod4ah5t9/n+2gwzWWjf1qej8qv+E0AFr
         GZmrSDylp+9cCB6F6WIjzep83IOuYeOJPVDEJYNzCYicjuFB8joiDRnqAp2Cs2tH8Mh/
         CfuQRP+TPBZpcqDYXF9V5CD7uWmPe06iCP+EhhwWj4S6jHN56ROMz7itRRU1mjwM1Hyd
         bMLM/OVx3ejKr2MyUKGu6JJZbpf9nCbgq216SzpWLYSuFBOyXB0KGBdWT371D6XL9TCO
         e9eg==
X-Gm-Message-State: ACgBeo00CasDJg9lI3zhcB+49i82pV7VguoXsKP20oacUP8hmqRnv5uP
	PV5c7T02dyd+4WZ2sVfT4Um1zLBR
X-Google-Smtp-Source: AA6agR6ZfHfiomgq5b5h0aXV9yFsqWEPn6z0CAr4JT7bhlzgFhfk8J9pn2rhH9i7xgZ8bW4+YxUfpQ==
X-Received: by 2002:a05:6870:b52c:b0:10e:e9e2:81b2 with SMTP id v44-20020a056870b52c00b0010ee9e281b2mr142766oap.75.1660682072397;
        Tue, 16 Aug 2022 13:34:32 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from stoup.. ([2605:ef80:80f6:61fa:9bc2:5095:d612:5e22])
        by smtp.gmail.com with ESMTPSA id y23-20020a056870b01700b0010ef8ccde67sm2285220oae.13.2022.08.16.13.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 13:34:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	iii@linux.ibm.com
Subject: [PATCH v2 11/33] accel/tcg: Use probe_access_internal for softmmu get_page_addr_code_hostp
Date: Tue, 16 Aug 2022 15:33:38 -0500
Message-Id: <20220816203400.161187-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220816203400.161187-1-richard.henderson@linaro.org>
References: <20220816203400.161187-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: t0XBPpP+W8UR

Simplify the implementation of get_page_addr_code_hostp
by reusing the existing probe_access infrastructure.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cputlb.c | 76 ++++++++++++++++------------------------------
 1 file changed, 26 insertions(+), 50 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 80a3eb4f1c..2dc2affa12 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1482,56 +1482,6 @@ static bool victim_tlb_hit(CPUArchState *env, size_t mmu_idx, size_t index,
   victim_tlb_hit(env, mmu_idx, index, offsetof(CPUTLBEntry, TY), \
                  (ADDR) & TARGET_PAGE_MASK)
 
-/*
- * Return a ram_addr_t for the virtual address for execution.
- *
- * Return -1 if we can't translate and execute from an entire page
- * of RAM.  This will force us to execute by loading and translating
- * one insn at a time, without caching.
- *
- * NOTE: This function will trigger an exception if the page is
- * not executable.
- */
-tb_page_addr_t get_page_addr_code_hostp(CPUArchState *env, target_ulong addr,
-                                        void **hostp)
-{
-    uintptr_t mmu_idx = cpu_mmu_index(env, true);
-    uintptr_t index = tlb_index(env, mmu_idx, addr);
-    CPUTLBEntry *entry = tlb_entry(env, mmu_idx, addr);
-    void *p;
-
-    if (unlikely(!tlb_hit(entry->addr_code, addr))) {
-        if (!VICTIM_TLB_HIT(addr_code, addr)) {
-            tlb_fill(env_cpu(env), addr, 0, MMU_INST_FETCH, mmu_idx, 0);
-            index = tlb_index(env, mmu_idx, addr);
-            entry = tlb_entry(env, mmu_idx, addr);
-
-            if (unlikely(entry->addr_code & TLB_INVALID_MASK)) {
-                /*
-                 * The MMU protection covers a smaller range than a target
-                 * page, so we must redo the MMU check for every insn.
-                 */
-                return -1;
-            }
-        }
-        assert(tlb_hit(entry->addr_code, addr));
-    }
-
-    if (unlikely(entry->addr_code & TLB_MMIO)) {
-        /* The region is not backed by RAM.  */
-        if (hostp) {
-            *hostp = NULL;
-        }
-        return -1;
-    }
-
-    p = (void *)((uintptr_t)addr + entry->addend);
-    if (hostp) {
-        *hostp = p;
-    }
-    return qemu_ram_addr_from_host_nofail(p);
-}
-
 static void notdirty_write(CPUState *cpu, vaddr mem_vaddr, unsigned size,
                            CPUIOTLBEntry *iotlbentry, uintptr_t retaddr)
 {
@@ -1687,6 +1637,32 @@ void *tlb_vaddr_to_host(CPUArchState *env, abi_ptr addr,
     return flags ? NULL : host;
 }
 
+/*
+ * Return a ram_addr_t for the virtual address for execution.
+ *
+ * Return -1 if we can't translate and execute from an entire page
+ * of RAM.  This will force us to execute by loading and translating
+ * one insn at a time, without caching.
+ *
+ * NOTE: This function will trigger an exception if the page is
+ * not executable.
+ */
+tb_page_addr_t get_page_addr_code_hostp(CPUArchState *env, target_ulong addr,
+                                        void **hostp)
+{
+    void *p;
+
+    (void)probe_access_internal(env, addr, 1, MMU_INST_FETCH,
+                                cpu_mmu_index(env, true), true, &p, 0);
+    if (p == NULL) {
+        return -1;
+    }
+    if (hostp) {
+        *hostp = p;
+    }
+    return qemu_ram_addr_from_host_nofail(p);
+}
+
 #ifdef CONFIG_PLUGIN
 /*
  * Perform a TLB lookup and populate the qemu_plugin_hwaddr structure.
-- 
2.34.1
