Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp6071124wrv;
        Wed, 31 Jul 2019 13:38:17 -0700 (PDT)
X-Received: by 2002:a63:f91c:: with SMTP id h28mr23415534pgi.397.1564605497294;
        Wed, 31 Jul 2019 13:38:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564605497; cv=none;
        d=google.com; s=arc-20160816;
        b=TAglcnm7jCMiA7UgkDuRPQHXjwskpQQpVWz8KHYyF8We684f7kHzqmlrdslkOY1yD0
         uCy1LRO3zqI1cAJDFZXWuspkRtCECv3PIls4pOnNTADRqauWTiah38UNCp8OBD07YjGz
         g8J+WHdJQgKBddiPRdEV9kxp4O2PPx0rQCGefr7ehHUycEMelp7IsHTaGjV///OOrMiD
         k2HEopNZUpuRbzKbB+edkJy5zS6NL88dh5vKEEToXQMX+TPEPT428URCsP08L2Zj37Ko
         9tWXlEex7Qi4pmvRPEno34hx9ltAeHqJUgPI/JjxA4yHpf7/tkJoLVKq7yRmUnhQvVyA
         jtNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=3Vv1PJfuLW2Q3y6jhZwS+VA5WdsiwenJEhdiHqcPU8E=;
        b=vLGBG4ElxNz8h+zddykPnfrwHKZ/KG1h7kk8pkanlLE3DXJz/lL4jxGdyCiRBSytlG
         +jkD24BNb6ykyhisD2Y0RDDrxQWLW7DnutkDiSTfvG36Huwdh7KZFpE/kNvpoZBVlx6m
         axZiTNHDlGNVFZ2q/ZjGSko9u+qdMS0cVGm3OdUda1J3xMAzAqr4n5lOshbScrC2vMvL
         EHEdR6XfRywzVA0W3sL/8xj4+MjsQiTkmnGsHoRP+s9vS5pnQE6ZoL74clmMof2wqJrZ
         x8LXNGJ1DysWTue+Jpx+ZZUekHqr6F4BY+OJlkarcchGTrcu49OMIurLkcmxb+TzQMgO
         MkdA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UHN9Ri7I;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id r27sor51099213pfg.42.2019.07.31.13.38.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 31 Jul 2019 13:38:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UHN9Ri7I;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3Vv1PJfuLW2Q3y6jhZwS+VA5WdsiwenJEhdiHqcPU8E=;
        b=UHN9Ri7INF29P80/b9NdjhxTy8SPM+M2VMwY0AJl5Igm1w4JA4pRaa4rdxWtUTls8r
         BwBAmwaWQPRpHk1JrvnweqW3TC0WT0YHKSW7omxdpNQh/LwLT74ok9c1Km9b2mVMcGFi
         aWmjsqG3OHPDlcbNnhfoN8JrogF0ucwsmaGTOAW63L3ZnrEXsOnKkQrJ56frq2ZdALFb
         VXQUldBYkUlfdJOpwj03UWgXB502/M6IRQ7eSzEFgbhjopCyE27+kaQm5vfACBaP7AnK
         wxMZbi0gmdttuWpCUmZx7r+5W5awZxidi4a/V9KCDsoQLbsOOwXuHGnV6M37q9xf0JjU
         szig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3Vv1PJfuLW2Q3y6jhZwS+VA5WdsiwenJEhdiHqcPU8E=;
        b=eKkP2ODmblj4oB89cnYMqlDixH3r0CeXZee+FvaiiqBR31yfdKcGveTNEXjwwqWLRD
         WW85zuUw6qXkBYQ1Pn5oVy5+Qu/xHzwol8HYLUp0GkfuGKEtCIu/+t4xzT17LOi1Y9F9
         SQMHy+fu+OK8dtOyjKI5KtoJW39Rnp6JXW9qizw9J7b6+f+hUthqn2Bd9ckS4RU9cfHb
         wr8fb8fvVfS0t32ZW5Pbs8G0n+7+j2fQVZwgSVxyEq+Qm1yc3YTXsmLOwvgWMaIhKwpH
         V+garMKA7razugAbYwVfGNDB+gwUsYtqkFm3NG/HLOZyps45bIxQZ3eobA8sMufppYP4
         LysQ==
X-Gm-Message-State: APjAAAVEk7FdCI9W04VyAv9QwRCGqs+E1dnxQp/LArrbhDCJpHCrSKSd
	C/EOXrdDYqawkBMfhU6zineqqqnusH98XA==
X-Google-Smtp-Source: APXvYqwDPcKf+ZZvl6tAtuy9oiYCe6HiatU4e0VHY/ab6pwUF4w0YU3MEqjLGb59jIR95iuJ8fFEjw==
X-Received: by 2002:a62:764d:: with SMTP id r74mr51255602pfc.110.1564605496727;
        Wed, 31 Jul 2019 13:38:16 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id g4sm84054164pfo.93.2019.07.31.13.38.15
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Wed, 31 Jul 2019 13:38:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	peter.maydell@linaro.org
Subject: [PATCH v2 01/32] cputlb: Add tlb_set_asid_for_mmuidx
Date: Wed, 31 Jul 2019 13:37:42 -0700
Message-Id: <20190731203813.30765-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190731203813.30765-1-richard.henderson@linaro.org>
References: <20190731203813.30765-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Z8XfAHvPQUiw

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
