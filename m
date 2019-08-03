Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp2200839wrv;
        Sat, 3 Aug 2019 11:48:05 -0700 (PDT)
X-Received: by 2002:a17:90a:2525:: with SMTP id j34mr10665902pje.11.1564858085799;
        Sat, 03 Aug 2019 11:48:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564858085; cv=none;
        d=google.com; s=arc-20160816;
        b=ju1Qq17gWROM1qM4bioAEajYStHtgGwraFKhR7urQsoxmi0npgJGh1gdEF29Q2CPs7
         AlPP0220x+CWuB42UkrtJefszYrG+i6BUlSnBfgE/xwJ7rg31l6+mirKgs+81obF4nCY
         H6vb3t+HDLG9F+GVfHzp4wXFaLQA27tGXd14eGl5c9FTOLKNcMbUSdHuYRBPFiPTsQyC
         Zzn+YBsu0QBnfMHegB5FiX/IMJsNhhvop7vgDfxNApXQG7r7hxvRJDRwEK3GNmZn8sOF
         rBeg1h+yk6oy4JE83fyFuEjg8P0XQR8OwkpbZtf0jQOiSJQokxAcoc5RWOYUl29aiJ9p
         YhKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=OzH9oAANiLbbz3MZqOd0740wSKDkRIpOzsZLTONmMZs=;
        b=olsqv2i9foAlN6NApaKOQCCzK9Y9q83raxLi/ofTHQpvpXOLuLipefnmzaEHz/uZaT
         KUy8AX8T+tm7PEKULCTaDlXDdB7W0JaoGvSTOjejNOsJSYcidNEyDzFFuodGPYQ5vc9g
         pEpB0hUEFSSvJ8i4gb3GaSMB0IBAJScVJOoOiqFtwkjQI2V5powLiuwsgBeqhE9I0ud1
         FbPQWgyeO9+FBYLmRWLy7uVlv1ePQQ+bDAhxnr3qy+aUUFSySbMGgNGBPWWt2jTVtp8m
         fq8DcLf1728NyQrlbtiTfVD9zG4YAtT7GFnYoYc5E0ZAdDEk72n7qPq16d1X4y5eSGIy
         47tw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=POoyQ7p+;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 123sor60684282pfu.0.2019.08.03.11.48.05
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 Aug 2019 11:48:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=POoyQ7p+;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OzH9oAANiLbbz3MZqOd0740wSKDkRIpOzsZLTONmMZs=;
        b=POoyQ7p+raLFWdXdMAzpyzaP2JaDBIv6nyVaZb9BfgIy2h7Mrrv6IJN3cSSEJntlw5
         fyjBeZs76EWn/Or6CbrU6PLJ1BCKSmRURYCh4ha3iDIM+5H4TlNZPQdCdwiX5W9Fp0Ee
         aswnR4wlqWtWQXx2paH4aGQY1c09aAtCPGHlqIQFNTe5xZgzADjy6HMgjLbaiCAlDmRs
         hhe/82vasY2whCT2XBPfo/RsXzWAh3RH9J/ywRIinWZ58/xgy3dkpNzVgCKgV8FvkYcC
         4iXcMs8vs3kMvuW0wVWCymak7Ouftt5En+eVh42Dr1EM1IHppVJKxWULZeme/RoHJKWT
         a2uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OzH9oAANiLbbz3MZqOd0740wSKDkRIpOzsZLTONmMZs=;
        b=pvdnIZVHymvvkgflIuDOM3rRTaaJw00Zo25UBgfKHZdYdfl0yBmbGTuQOd7ABJfvSy
         FuAtcw3W3s2rytBsY0J6hq2g5D8f4O7sLl4gGYI7BQxSWWlQl8znj7O5Bo0WdOS5xl/l
         XamJicqGxrJwijufhmR5CPLHJFmhu4GtS7/lDNuVoqu2OzEThafK0wyl1aYL+PQvcA9H
         BCVBBz1uv66101LDyvO8xKadWI/377w678A/ltE7KLGrQq8uEF0lGqFX+vqBHc8CRsEZ
         cbZurCOtPysuefZ7rtua0/qh0fAStsBRTVqXYXQxpLjKWZOb2s4YB4JkaUSSj7YkX9wq
         jrow==
X-Gm-Message-State: APjAAAXXMuSbqSzlQ+H1t7oAH2hQf9vOYI1+5YMqPnVAdT9bRz9jX+G4
	dmrmqBhNQMVyyi1vt54U443/KGlh
X-Google-Smtp-Source: APXvYqwTLu7ABi2FWZUOwwgpSILNwSA+C/RSS5DD/SvL/tVWU2hv+DPvqD1M9Ws27BnCjY9yntlgyw==
X-Received: by 2002:a63:8a49:: with SMTP id y70mr35691142pgd.271.1564858085297;
        Sat, 03 Aug 2019 11:48:05 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id q69sm15405454pjb.0.2019.08.03.11.48.04
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 03 Aug 2019 11:48:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 02/34] cputlb: Add tlb_flush_asid_by_mmuidx and friends
Date: Sat,  3 Aug 2019 11:47:28 -0700
Message-Id: <20190803184800.8221-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190803184800.8221-1-richard.henderson@linaro.org>
References: <20190803184800.8221-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 9Ru3iW62q0nv

Since we have remembered ASIDs, we can further minimize flushing
by comparing against the one we want to flush.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/exec/exec-all.h | 16 ++++++++++++
 include/qom/cpu.h       |  2 ++
 accel/tcg/cputlb.c      | 55 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 73 insertions(+)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 9c77aa5bf9..0d890e1e60 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -240,6 +240,22 @@ void tlb_flush_by_mmuidx_all_cpus_synced(CPUState *cpu, uint16_t idxmap);
  */
 void tlb_set_asid_for_mmuidx(CPUState *cpu, uint32_t asid,
                              uint16_t idxmap, uint16_t dep_idxmap);
+/**
+ * tlb_flush_asid_by_mmuidx:
+ * @cpu: Originating CPU of the flush
+ * @asid: Address Space Identifier
+ * @idxmap: bitmap of MMU indexes to flush if asid matches
+ *
+ * For each mmu index, if @asid matches the value previously saved via
+ * tlb_set_asid_for_mmuidx, flush the index.
+ */
+void tlb_flush_asid_by_mmuidx(CPUState *cpu, uint32_t asid, uint16_t idxmap);
+/* Similarly, broadcasting to all cpus. */
+void tlb_flush_asid_by_mmuidx_all_cpus(CPUState *cpu, uint32_t asid,
+                                       uint16_t idxmap);
+/* Similarly, waiting for the broadcast to complete.  */
+void tlb_flush_asid_by_mmuidx_all_cpus_synced(CPUState *cpu, uint32_t asid,
+                                              uint16_t idxmap);
 /**
  * tlb_set_page_with_attrs:
  * @cpu: CPU to add this TLB entry for
diff --git a/include/qom/cpu.h b/include/qom/cpu.h
index 5ee0046b62..c072dd4c47 100644
--- a/include/qom/cpu.h
+++ b/include/qom/cpu.h
@@ -285,12 +285,14 @@ typedef union {
     unsigned long host_ulong;
     void         *host_ptr;
     vaddr         target_ptr;
+    uint64_t      uint64;
 } run_on_cpu_data;
 
 #define RUN_ON_CPU_HOST_PTR(p)    ((run_on_cpu_data){.host_ptr = (p)})
 #define RUN_ON_CPU_HOST_INT(i)    ((run_on_cpu_data){.host_int = (i)})
 #define RUN_ON_CPU_HOST_ULONG(ul) ((run_on_cpu_data){.host_ulong = (ul)})
 #define RUN_ON_CPU_TARGET_PTR(v)  ((run_on_cpu_data){.target_ptr = (v)})
+#define RUN_ON_CPU_UINT64(i)      ((run_on_cpu_data){.uint64 = (i)})
 #define RUN_ON_CPU_NULL           RUN_ON_CPU_HOST_PTR(NULL)
 
 typedef void (*run_on_cpu_func)(CPUState *cpu, run_on_cpu_data data);
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index c68f57755b..62baaa9ca6 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -540,6 +540,61 @@ void tlb_flush_page_all_cpus_synced(CPUState *src, target_ulong addr)
     tlb_flush_page_by_mmuidx_all_cpus_synced(src, addr, ALL_MMUIDX_BITS);
 }
 
+static void tlb_flush_asid_by_mmuidx_async_work(CPUState *cpu,
+                                                run_on_cpu_data data)
+{
+    CPUTLB *tlb = cpu_tlb(cpu);
+    uint32_t asid = data.uint64;
+    uint16_t idxmap = data.uint64 >> 32;
+    uint16_t to_flush = 0, work;
+
+    assert_cpu_is_self(cpu);
+
+    for (work = idxmap; work != 0; work &= work - 1) {
+        int mmu_idx = ctz32(work);
+        if (tlb->d[mmu_idx].asid == asid) {
+            to_flush |= 1 << mmu_idx;
+        }
+    }
+
+    if (to_flush) {
+        tlb_flush_by_mmuidx_async_work(cpu, RUN_ON_CPU_HOST_INT(to_flush));
+    }
+}
+
+void tlb_flush_asid_by_mmuidx(CPUState *cpu, uint32_t asid, uint16_t idxmap)
+{
+    uint64_t asid_idx = deposit64(asid, 32, 32, idxmap);
+
+    if (cpu->created && !qemu_cpu_is_self(cpu)) {
+        async_run_on_cpu(cpu, tlb_flush_asid_by_mmuidx_async_work,
+                         RUN_ON_CPU_UINT64(asid_idx));
+    } else {
+        tlb_flush_asid_by_mmuidx_async_work(cpu, RUN_ON_CPU_UINT64(asid_idx));
+    }
+}
+
+void tlb_flush_asid_by_mmuidx_all_cpus(CPUState *src_cpu,
+                                       uint32_t asid, uint16_t idxmap)
+{
+    uint64_t asid_idx = deposit64(asid, 32, 32, idxmap);
+
+    flush_all_helper(src_cpu, tlb_flush_asid_by_mmuidx_async_work,
+                     RUN_ON_CPU_UINT64(asid_idx));
+    tlb_flush_asid_by_mmuidx_async_work(src_cpu, RUN_ON_CPU_UINT64(asid_idx));
+}
+
+void tlb_flush_asid_by_mmuidx_all_cpus_synced(CPUState *src_cpu,
+                                              uint32_t asid, uint16_t idxmap)
+{
+    uint64_t asid_idx = deposit64(asid, 32, 32, idxmap);
+
+    flush_all_helper(src_cpu, tlb_flush_asid_by_mmuidx_async_work,
+                     RUN_ON_CPU_UINT64(asid_idx));
+    async_safe_run_on_cpu(src_cpu, tlb_flush_asid_by_mmuidx_async_work,
+                          RUN_ON_CPU_UINT64(asid_idx));
+}
+
 void tlb_set_asid_for_mmuidx(CPUState *cpu, uint32_t asid, uint16_t idxmap,
                              uint16_t depmap)
 {
-- 
2.17.1
