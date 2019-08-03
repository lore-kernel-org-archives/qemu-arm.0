Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp2200831wrv;
        Sat, 3 Aug 2019 11:48:04 -0700 (PDT)
X-Received: by 2002:a17:902:8696:: with SMTP id g22mr133517170plo.249.1564858084777;
        Sat, 03 Aug 2019 11:48:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564858084; cv=none;
        d=google.com; s=arc-20160816;
        b=AZCVBLUNwUOeXZ7ljFQCU8CJQv+pKtbE/dtwIuXTAofUCLgl+t86au3ecXQgAfv6dZ
         D2GSnoPi9OCzqZ3HY8B7MeCipdn6x7NwFrMdQfp763wJhL5l9Ix9lN7gsU/CJ11SHmAX
         XOd/QSTk/r/4I//Bw1nc1z0WK05FsBLLBp3ztdDcKZo3b5MBub55EbKOnqbp5oJuBsbF
         BRQ1AQh8tTz6OtPh8IePO2nyMroHjZuEhCSNs/8/ON1jJUKyBi8hfLKYIpXR6GkEBSm8
         jU1bZBSambs5HwRAhDRgv5Zzm3rY2HWhMYmvpPbe8tDW7b8zSyrBrkWWb1QcNAKpWroV
         fFhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=3Vv1PJfuLW2Q3y6jhZwS+VA5WdsiwenJEhdiHqcPU8E=;
        b=a+xp11jOEo1pNC341rdtHkDYReum+2xPTa4bBnBeJboE2ERVDyxdTuVrPjXPUD4z+a
         7q7pvx1hjoULBdOTzJuI7SCxCDSoR3JhWUjU8vyrGUiLiIvV/ST+HXGCTez21LhvwV8i
         6IIYdlD3qtK9fzPjajzZVW0EXIgTtN0fAeqSPo/6Cbk10FdpfDTefKN6KRalmR4TBXDI
         BSfCk3wyo/u6JxQRHyRzrdhDDQqEbIZPBRRWsWPpRJpu/4rrHsO4G2YoDv4CEPY1Y+b1
         nUKtc2CWet7pHCtjgaA9Wj7z8P8xxGweDmUcXJJ1fsLuBmLxl/UG1uW8j66JEXwOcn4Q
         VLtA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y6m4R1Ug;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id h3sor94778028pld.23.2019.08.03.11.48.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 Aug 2019 11:48:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Y6m4R1Ug;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3Vv1PJfuLW2Q3y6jhZwS+VA5WdsiwenJEhdiHqcPU8E=;
        b=Y6m4R1UgmbocM8caPBMrteJtERSrOeJiLGnM3FPGwmGvHF1A8Jb61r+XJbxj43PlWF
         B5y6PhvJZrCKursx25LMzydByDVTzhvucAfy446c2Q4hxyNzGTI8d8WiqCWUdberr7Kj
         XkF89KpMLlQBNygZxWlYdoksgbNQP0iXwFpIz+R4zrGbvRErBodIME22Cm1l62poJiTx
         qc6O0x1PhiJGWaM6/owU9OxUYbJU6znzRCJNW9CYcJz2fWPj0HeIH0BnErk4XUS4pGCl
         pH7HGPzyFuuQ/6bX9YtBHNn4C6+JGOb6+kj8V1s07E3xuoVEJ7tmN814k5Qex7Knr9cr
         6kTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3Vv1PJfuLW2Q3y6jhZwS+VA5WdsiwenJEhdiHqcPU8E=;
        b=ZkBmYq5QA6+DUjgcDQPhWEerAhWKHR7wVtfh2VVBTJz4x6NKjBuIlPBqX9MEVJaXDx
         YHK8JkXNua0+M4rlYmnhdk6KwIqZXkrwBFNsxOjpay9LS1yxID46Js7XPI/7Fz41p12j
         pAgmv/jOtnJ5qh7NhwH4Tw2F5n/U4IBI69nltNtZmdB4hXBYOI3AYdMJB+6R413qaM0i
         JORVeG3ReAcoLdqaWAWQXUjyAcgruxeR3hkxaRky6o62MSNY6bjwuzjzsRTYbhVNXzMX
         sAafjtIG9nF+65t7wOpdJF2xTV2UxlyU6jh6/RKDivKfUpzFERSpfYLHaqqzin0+bbB3
         nuww==
X-Gm-Message-State: APjAAAXnE1IlbCb3RbpIA5KdQhOyOLBMgyZVOzvmgb2xFGuYQ65BF5rk
	H+9XZK/QFA+Cee5E29dfbj4iyjXBPysXPA==
X-Google-Smtp-Source: APXvYqwElKJuSKp+zFrcUjqRod6t4pk2yXi5P8txvmjGa8EcrsWx5h0RSCHbx4q4R95sSU+q8ZKxgQ==
X-Received: by 2002:a17:902:f082:: with SMTP id go2mr143791348plb.25.1564858084208;
        Sat, 03 Aug 2019 11:48:04 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id q69sm15405454pjb.0.2019.08.03.11.48.03
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sat, 03 Aug 2019 11:48:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 01/34] cputlb: Add tlb_set_asid_for_mmuidx
Date: Sat,  3 Aug 2019 11:47:27 -0700
Message-Id: <20190803184800.8221-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190803184800.8221-1-richard.henderson@linaro.org>
References: <20190803184800.8221-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 2Fg4CxO/oIP8

Although we can't do much with ASIDs except remember them, this
will allow cleanups within target/ that should make things clearer.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v2: Assert cpu_is_self; only flush idx w/ asid mismatch.
v3: Improve asid comment.
---
 include/exec/cpu-all.h  | 11 +++++++++++
 include/exec/cpu-defs.h |  2 ++
 include/exec/exec-all.h | 19 +++++++++++++++++++
 accel/tcg/cputlb.c      | 26 ++++++++++++++++++++++++++
 4 files changed, 58 insertions(+)

diff --git a/include/exec/cpu-all.h b/include/exec/cpu-all.h
index 536ea58f81..40b140cbba 100644
--- a/include/exec/cpu-all.h
+++ b/include/exec/cpu-all.h
@@ -439,4 +439,15 @@ static inline CPUTLB *env_tlb(CPUArchState *env)
     return &env_neg(env)->tlb;
 }
 
+/**
+ * cpu_tlb(env)
+ * @cpu: The generic CPUState
+ *
+ * Return the CPUTLB state associated with the cpu.
+ */
+static inline CPUTLB *cpu_tlb(CPUState *cpu)
+{
+    return &cpu_neg(cpu)->tlb;
+}
+
 #endif /* CPU_ALL_H */
diff --git a/include/exec/cpu-defs.h b/include/exec/cpu-defs.h
index 9bc713a70b..b42986d822 100644
--- a/include/exec/cpu-defs.h
+++ b/include/exec/cpu-defs.h
@@ -169,6 +169,8 @@ typedef struct CPUTLBDesc {
     size_t n_used_entries;
     /* The next index to use in the tlb victim table.  */
     size_t vindex;
+    /* The current ASID for this tlb, if used; otherwise ignored.  */
+    uint32_t asid;
     /* The tlb victim table, in two parts.  */
     CPUTLBEntry vtable[CPU_VTLB_SIZE];
     CPUIOTLBEntry viotlb[CPU_VTLB_SIZE];
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 16034ee651..9c77aa5bf9 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -225,6 +225,21 @@ void tlb_flush_by_mmuidx_all_cpus(CPUState *cpu, uint16_t idxmap);
  * depend on when the guests translation ends the TB.
  */
 void tlb_flush_by_mmuidx_all_cpus_synced(CPUState *cpu, uint16_t idxmap);
+/**
+ * tlb_set_asid_for_mmuidx:
+ * @cpu: Originating cpu
+ * @asid: Address Space Identifier
+ * @idxmap: bitmap of MMU indexes to set to @asid
+ * @depmap: bitmap of dependent MMU indexes
+ *
+ * Set an ASID for all of @idxmap.  If any previous ASID was different,
+ * then we will flush the mmu idx.  If a flush is required, then also flush
+ * all dependent mmu indicies in @depmap.  This latter is typically used
+ * for secondary page resolution, for implementing virtualization within
+ * the guest.
+ */
+void tlb_set_asid_for_mmuidx(CPUState *cpu, uint32_t asid,
+                             uint16_t idxmap, uint16_t dep_idxmap);
 /**
  * tlb_set_page_with_attrs:
  * @cpu: CPU to add this TLB entry for
@@ -310,6 +325,10 @@ static inline void tlb_flush_by_mmuidx_all_cpus_synced(CPUState *cpu,
                                                        uint16_t idxmap)
 {
 }
+static inline void tlb_set_asid_for_mmuidx(CPUState *cpu, uint32_t asid,
+                                           uint16_t idxmap, uint16_t depmap)
+{
+}
 #endif
 
 #define CODE_GEN_ALIGN           16 /* must be >= of the size of a icache line */
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index bb9897b25a..c68f57755b 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -540,6 +540,32 @@ void tlb_flush_page_all_cpus_synced(CPUState *src, target_ulong addr)
     tlb_flush_page_by_mmuidx_all_cpus_synced(src, addr, ALL_MMUIDX_BITS);
 }
 
+void tlb_set_asid_for_mmuidx(CPUState *cpu, uint32_t asid, uint16_t idxmap,
+                             uint16_t depmap)
+{
+    CPUTLB *tlb = cpu_tlb(cpu);
+    uint16_t work, to_flush = 0;
+
+    /* It doesn't make sense to set context across cpus.  */
+    assert_cpu_is_self(cpu);
+
+    /*
+     * We don't support ASIDs except for trivially.
+     * If there is any change, then we must flush the TLB.
+     */
+    for (work = idxmap; work != 0; work &= work - 1) {
+        int mmu_idx = ctz32(work);
+        if (tlb->d[mmu_idx].asid != asid) {
+            tlb->d[mmu_idx].asid = asid;
+            to_flush |= 1 << mmu_idx;
+        }
+    }
+    if (to_flush) {
+        to_flush |= depmap;
+        tlb_flush_by_mmuidx_async_work(cpu, RUN_ON_CPU_HOST_INT(to_flush));
+    }
+}
+
 /* update the TLBs so that writes to code in the virtual page 'addr'
    can be detected */
 void tlb_protect_code(ram_addr_t ram_addr)
-- 
2.17.1
