Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6071138wrv;
        Wed, 31 Jul 2019 13:38:18 -0700 (PDT)
X-Received: by 2002:a17:902:467:: with SMTP id 94mr121208397ple.131.1564605498440;
        Wed, 31 Jul 2019 13:38:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564605498; cv=none;
        d=google.com; s=arc-20160816;
        b=rHyp+ZEhgw6IA/rXmKex+EjTekqAQFMFPwjCwig23LTGfR8e1XzRu4K80auxR3cyeD
         EOrYtlpBdv+ncCyUhLKah5OGkj808y7ZM1+mqkf89tdVbK8BWLRrNbqT4owHlxkRrTnD
         mav6ZH2fUTp9mXze/z1aC05FPyA7yDTKK0wD68G4p5zDzP6wwRgHPlOr+BXgWnrKfoeV
         STW9jSnRB58tdpQS4Y3fVe5VL4M3Cp/5B1Q78bsO0FXQRhUesQ4JEeLefYNni+jA/Orp
         cj5Rx38gl4smisu79Eoj1m/CpWQOTAKv7djdAtSKggrTg4aA4IJCGIahtrrYA2SxWpY1
         9+cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=OzH9oAANiLbbz3MZqOd0740wSKDkRIpOzsZLTONmMZs=;
        b=z9mUbrHcJguqUTk35pWQ3/GM2Y5UkW95z8X4UtnGjeaREdBYQENoS4f7kscgEU2e+T
         tdYu2IgEBgsFfVOAkfU/jxoM7YN4kSS15DYM6frEazDGP3R2QCNh6gEPBPmlRRFufI2a
         bBtaKtZyuP4Fo5EZOdAC0qvky2tn+pAEpOLcFyt/Nfuh/xskrOpVgliXGO4JgRYkFojT
         c+/9cOUOrz3RbYCfLCVBJAYMlV0OTN7q5wXJDmxrscxxfcBFhFFPFsMyeTh+e+bxCVS2
         gYwIzU6mgYnWOmLG9hWOmMmfDW9mrx5Qxl8AOHdgFRmLb4dnduBXbB2EuiVajcKIngKw
         UOwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mkHD3+iY;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id s16sor51136789pfd.52.2019.07.31.13.38.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 31 Jul 2019 13:38:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mkHD3+iY;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OzH9oAANiLbbz3MZqOd0740wSKDkRIpOzsZLTONmMZs=;
        b=mkHD3+iYsbWab5cdVZchcSsYztaDNDugjO/BYtRQhaR9lWwuMtKJO1MOfTOMi+41tK
         vt6UkLW3JTiyThN3STPBnqE59TUW11RxDLiQ/biaUh2aO84jV77b/5fX8jYTq7pxU97z
         Ozu8J/5z66NiObuOQTlQzV6OEwh+egQSop9TErhKiE6aCHisL/bVRc4pTuIcb3++LkLT
         QlYOucEUVqXBkN7zQQoQMB62P06LSBvG8N2aZ8KN1Ipc6icCZMvXpNGcjCOT1DYMm8Xo
         hltZZ27joq3NsBo6CUCTa2HdLvkgt5I96hCt3h50ndDp11BSX9caNWf0FVB1+EsgxVd5
         Pb8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OzH9oAANiLbbz3MZqOd0740wSKDkRIpOzsZLTONmMZs=;
        b=NRRNSzwDrW+p3PA3F8xT4/0RFhGXkrkcaABHPuioEDrQiuGg9OKU8az7H/uP9nkLE6
         nV+Y5B7fym85kb/dwcWQv8eotrOR+NLc8xYynGWMNdFsH/auKE57xnTJRWde66QGeqkG
         jBYdziBfcfb8T8PdnZj6HHeKPXX/sedZoAseTsIc8VP4sWbrrE+d7qPNi42PN/EeCmjV
         9jBUMHWDViKElX5VE8msbQ31bug2tcnwNwqqg3eubZOlkgaE4Y8Dq5Gm1MZdHHSNn8m0
         OGJDb6zQZ6BDrDu3zzIx7C0509xMOAaWD1EmVFj9tGX3sD9ZWbXJntUaXwkw/jWm78/h
         AKvQ==
X-Gm-Message-State: APjAAAXpcpl42PkBgbkqpXRZta43tVjVBkx/pavP8eBOYflJob0eDV9u
	V0ICDiov8hH4d/hBiPm9jPytmuVQ
X-Google-Smtp-Source: APXvYqyCh4czqu5MPOguqi5mN0IkCbCArQrhKl2imbG1TB/cUQHFz0tm3E1i7kVM2Hu07hZ8yC7ShQ==
X-Received: by 2002:aa7:9407:: with SMTP id x7mr51015581pfo.163.1564605497999;
        Wed, 31 Jul 2019 13:38:17 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id g4sm84054164pfo.93.2019.07.31.13.38.16
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 31 Jul 2019 13:38:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	peter.maydell@linaro.org
Subject: [PATCH v2 02/32] cputlb: Add tlb_flush_asid_by_mmuidx and friends
Date: Wed, 31 Jul 2019 13:37:43 -0700
Message-Id: <20190731203813.30765-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190731203813.30765-1-richard.henderson@linaro.org>
References: <20190731203813.30765-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Akn8Pz1dct1j

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
