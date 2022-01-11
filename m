Received: by 2002:a19:ca48:0:0:0:0:0 with SMTP id h8csp1800983lfj;
        Tue, 11 Jan 2022 09:10:59 -0800 (PST)
X-Received: by 2002:a1c:4b12:: with SMTP id y18mr3262308wma.171.1641921058899;
        Tue, 11 Jan 2022 09:10:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641921058; cv=none;
        d=google.com; s=arc-20160816;
        b=uEmYRb031bp/T6PhSCEiZa/UBIG6vKFSi9rDPabGMTpT4jK7FIS5a2QkGO/R3hQBLt
         bHuCL9hxmeUo/9CDXumQliXUgPL0SoiGN6FT8yWNI+nlbUDVflTzZrnbkY7k067ieqPw
         rPR6hnWYKDoGlMjaNyKmm889j5oaCqTxzIm4Ykb6tGefJxk9UgGU9FZYyvYFIZkzmUhl
         yckFi+68+JbjCqSCLLcEubT6LBsor1+GaxrEvG8sK3xQpqTH08mMpti5TyaidLYAt7NF
         WbvoSsNMO7LDYsZ5kffGEQxpHlAzD7OGEhkrTboY9qkt2R3M9Z4Kpoms8HyDyDe3eJtO
         aQgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=TcSrMUtkOV3RqL4wrKJvnNxFBlAibhPM/vlIAuMO/t8=;
        b=rSNUuKuj5dPc6jrMZZBAfyQqEn1hs4PfJCrNFs0LNb3D5pCNfxOYfMV1h4v1dqI4RU
         ScFkDcetBqsInBDgW36n7KQElNtVSEjaDYTAo1ez1JgQTDdhPH7pghnC/MDP9JRd8QvT
         12pGczk7F7Q4AMdjpB/g55hIlEl2o2LCMxdOJH8sHi3PSSWyEuXtL3A7wpK/FB3wqxBE
         Xj7GCT4cULjBhvgQBTb0Kqw/uI6DzUen4G+9eS0Ck6r3r8Xcsn9BuTtiXbLuKHS1oO+0
         G2e1VhixMeTkRA8+XdAxK6zLAjpIZvfxhwDVju5WtDDTOy2Z5tGmwb5t0l4yp3clr/Q9
         CGuw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eMxTpkGa;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id r13sor503549wru.46.2022.01.11.09.10.58
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 11 Jan 2022 09:10:58 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eMxTpkGa;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TcSrMUtkOV3RqL4wrKJvnNxFBlAibhPM/vlIAuMO/t8=;
        b=eMxTpkGafOaw4kNWdf91zhPvqeDcGg1njaCz5KvGL/1V5iT9kaTCRI5B+5SwRNjHVn
         kraY2s4m+UXxmHHqqvpuOSuMji5VIGYsP2SIwOHSk22JXZ06YEFB/pNrb7x7kyPfb+8K
         xTkN0npX9l72q8y/xlOFUMDyRllegkm4jpctWhWJe1jtp2ddxWRW21QqULDICFz27t/n
         UJnpLKKkuzvGY3yC0VQFbLmH77mVC0v3IJWRD30p3k+TwLDRzds0LYrZB3Gqv64RppXV
         tLOfI2H+U3//5mAnjEC4osscEEb/8ZrMY6IBFTvnZK9uLkFzswnreIMLEW9qFvY71YeX
         jHOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TcSrMUtkOV3RqL4wrKJvnNxFBlAibhPM/vlIAuMO/t8=;
        b=L5lFHpJhAdDxNQ1oMzuYlKJ5L38LuyNZlqCToPv9bL8G8r+NiZGlAHBqw8+dJV7sd0
         R7vT4JBg6pWDiZVMPatiUS8mFxTtHz9+rTfqYLUsIUG3hLI3hwWIon20gv3WO0W67gh9
         /JQj6kDyG6Fjmntpwk6UPlYJHE3KwTtKlHztWwYelEvtgAyXeOMFRccljW3NZGztOTbc
         JmlzzPpZKcWkDeI2MlZyWtjZMQ20H4mEHYuQRb32q3q8hZ0gtshX/VZMfuWFdF+OAP7g
         +dmcQx2bj6SiVQbycyMIG0yw3fyrNCArD8zvWTW43p6+t/Yqpgc6u/ViBhbTo8qVhlSd
         QF0g==
X-Gm-Message-State: AOAM532rsreL90AKSO9hLV8ATHtpJaMeKAJDXOjR6QKBCTJ51hhmBmf4
	ETLKvRGrTS6PJUebEuCHc1jwq+5p5afWJ6ah
X-Google-Smtp-Source: ABdhPJyw/7nC+Raev98J0T5dd0gsb7RAfBPHSDDDoWkqTqQ/IBD50FsZ0hzrVVYmtxRdyw7L0jAdww==
X-Received: by 2002:a5d:63d1:: with SMTP id c17mr4680181wrw.522.1641921058519;
        Tue, 11 Jan 2022 09:10:58 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id c7sm11157941wri.21.2022.01.11.09.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 09:10:58 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Shashi Mallela <shashi.mallela@linaro.org>
Subject: [PATCH v2 11/13] hw/intc/arm_gicv3_its: Factor out "find address of table entry" code
Date: Tue, 11 Jan 2022 17:10:46 +0000
Message-Id: <20220111171048.3545974-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220111171048.3545974-1-peter.maydell@linaro.org>
References: <20220111171048.3545974-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: xOXtOc9ZnoW3

The ITS has several tables which all share a similar format,
described by the TableDesc struct: the guest may configure them
to be a single-level table or a two-level table. Currently we
open-code the process of finding the table entry in all the
functions which read or write the device table or the collection
table. Factor out the "get the address of the table entry"
logic into a new function, so that the code which needs to
read or write a table entry only needs to call table_entry_addr()
and then perform a suitable load or store to that address.

Note that the error handling is slightly complicated because
we want to handle two cases differently:
 * failure to read the L1 table entry should end up causing
   a command stall, like other kinds of DMA error
 * an L1 table entry that says there is no L2 table for this
   index (ie whose valid bit is 0) must result in us treating
   the table entry as not-valid on read, and discarding
   writes (this is mandated by the spec)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
This is a worthwhile refactoring on its own, but still more
so given that GICv4 adds another table in this format.
---
 hw/intc/arm_gicv3_its.c | 212 +++++++++++++---------------------------
 1 file changed, 70 insertions(+), 142 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 917201c148f..985e316eda9 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -83,44 +83,62 @@ static uint64_t baser_base_addr(uint64_t value, uint32_t page_sz)
     return result;
 }
 
+static uint64_t table_entry_addr(GICv3ITSState *s, TableDesc *td,
+                                 uint32_t idx, MemTxResult *res)
+{
+    /*
+     * Given a TableDesc describing one of the ITS in-guest-memory
+     * tables and an index into it, return the guest address
+     * corresponding to that table entry.
+     * If there was a memory error reading the L1 table of an
+     * indirect table, *res is set accordingly, and we return -1.
+     * If the L1 table entry is marked not valid, we return -1 with
+     * *res set to MEMTX_OK.
+     *
+     * The specification defines the format of level 1 entries of a
+     * 2-level table, but the format of level 2 entries and the format
+     * of flat-mapped tables is IMPDEF.
+     */
+    AddressSpace *as = &s->gicv3->dma_as;
+    uint32_t l2idx;
+    uint64_t l2;
+    uint32_t num_l2_entries;
+
+    *res = MEMTX_OK;
+
+    if (!td->indirect) {
+        /* Single level table */
+        return td->base_addr + idx * td->entry_sz;
+    }
+
+    /* Two level table */
+    l2idx = idx / (td->page_sz / L1TABLE_ENTRY_SIZE);
+
+    l2 = address_space_ldq_le(as,
+                              td->base_addr + (l2idx * L1TABLE_ENTRY_SIZE),
+                              MEMTXATTRS_UNSPECIFIED, res);
+    if (*res != MEMTX_OK) {
+        return -1;
+    }
+    if (!(l2 & L2_TABLE_VALID_MASK)) {
+        return -1;
+    }
+
+    num_l2_entries = td->page_sz / td->entry_sz;
+    return (l2 & ((1ULL << 51) - 1)) + (idx % num_l2_entries) * td->entry_sz;
+}
+
 static bool get_cte(GICv3ITSState *s, uint16_t icid, uint64_t *cte,
                     MemTxResult *res)
 {
     AddressSpace *as = &s->gicv3->dma_as;
-    uint64_t l2t_addr;
-    uint64_t value;
-    bool valid_l2t;
-    uint32_t l2t_id;
-    uint32_t num_l2_entries;
+    uint64_t entry_addr = table_entry_addr(s, &s->ct, icid, res);
 
-    if (s->ct.indirect) {
-        l2t_id = icid / (s->ct.page_sz / L1TABLE_ENTRY_SIZE);
-
-        value = address_space_ldq_le(as,
-                                     s->ct.base_addr +
-                                     (l2t_id * L1TABLE_ENTRY_SIZE),
-                                     MEMTXATTRS_UNSPECIFIED, res);
-
-        if (*res == MEMTX_OK) {
-            valid_l2t = (value & L2_TABLE_VALID_MASK) != 0;
-
-            if (valid_l2t) {
-                num_l2_entries = s->ct.page_sz / s->ct.entry_sz;
-
-                l2t_addr = value & ((1ULL << 51) - 1);
-
-                *cte =  address_space_ldq_le(as, l2t_addr +
-                                    ((icid % num_l2_entries) * GITS_CTE_SIZE),
-                                    MEMTXATTRS_UNSPECIFIED, res);
-           }
-       }
-    } else {
-        /* Flat level table */
-        *cte =  address_space_ldq_le(as, s->ct.base_addr +
-                                     (icid * GITS_CTE_SIZE),
-                                      MEMTXATTRS_UNSPECIFIED, res);
+    if (entry_addr == -1) {
+        return false; /* not valid */
     }
 
+    *cte = address_space_ldq_le(as, entry_addr, MEMTXATTRS_UNSPECIFIED, res);
     return FIELD_EX64(*cte, CTE, VALID);
 }
 
@@ -189,41 +207,12 @@ static bool get_ite(GICv3ITSState *s, uint32_t eventid, uint64_t dte,
 static uint64_t get_dte(GICv3ITSState *s, uint32_t devid, MemTxResult *res)
 {
     AddressSpace *as = &s->gicv3->dma_as;
-    uint64_t l2t_addr;
-    uint64_t value;
-    bool valid_l2t;
-    uint32_t l2t_id;
-    uint32_t num_l2_entries;
+    uint64_t entry_addr = table_entry_addr(s, &s->dt, devid, res);
 
-    if (s->dt.indirect) {
-        l2t_id = devid / (s->dt.page_sz / L1TABLE_ENTRY_SIZE);
-
-        value = address_space_ldq_le(as,
-                                     s->dt.base_addr +
-                                     (l2t_id * L1TABLE_ENTRY_SIZE),
-                                     MEMTXATTRS_UNSPECIFIED, res);
-
-        if (*res == MEMTX_OK) {
-            valid_l2t = (value & L2_TABLE_VALID_MASK) != 0;
-
-            if (valid_l2t) {
-                num_l2_entries = s->dt.page_sz / s->dt.entry_sz;
-
-                l2t_addr = value & ((1ULL << 51) - 1);
-
-                value =  address_space_ldq_le(as, l2t_addr +
-                                   ((devid % num_l2_entries) * GITS_DTE_SIZE),
-                                   MEMTXATTRS_UNSPECIFIED, res);
-            }
-        }
-    } else {
-        /* Flat level table */
-        value = address_space_ldq_le(as, s->dt.base_addr +
-                                     (devid * GITS_DTE_SIZE),
-                                     MEMTXATTRS_UNSPECIFIED, res);
+    if (entry_addr == -1) {
+        return 0; /* a DTE entry with the Valid bit clear */
     }
-
-    return value;
+    return address_space_ldq_le(as, entry_addr, MEMTXATTRS_UNSPECIFIED, res);
 }
 
 /*
@@ -426,11 +415,7 @@ static bool update_cte(GICv3ITSState *s, uint16_t icid, bool valid,
                        uint64_t rdbase)
 {
     AddressSpace *as = &s->gicv3->dma_as;
-    uint64_t value;
-    uint64_t l2t_addr;
-    bool valid_l2t;
-    uint32_t l2t_id;
-    uint32_t num_l2_entries;
+    uint64_t entry_addr;
     uint64_t cte = 0;
     MemTxResult res = MEMTX_OK;
 
@@ -444,44 +429,18 @@ static bool update_cte(GICv3ITSState *s, uint16_t icid, bool valid,
         cte = FIELD_DP64(cte, CTE, RDBASE, rdbase);
     }
 
-    /*
-     * The specification defines the format of level 1 entries of a
-     * 2-level table, but the format of level 2 entries and the format
-     * of flat-mapped tables is IMPDEF.
-     */
-    if (s->ct.indirect) {
-        l2t_id = icid / (s->ct.page_sz / L1TABLE_ENTRY_SIZE);
-
-        value = address_space_ldq_le(as,
-                                     s->ct.base_addr +
-                                     (l2t_id * L1TABLE_ENTRY_SIZE),
-                                     MEMTXATTRS_UNSPECIFIED, &res);
-
-        if (res != MEMTX_OK) {
-            return false;
-        }
-
-        valid_l2t = (value & L2_TABLE_VALID_MASK) != 0;
-
-        if (valid_l2t) {
-            num_l2_entries = s->ct.page_sz / s->ct.entry_sz;
-
-            l2t_addr = value & ((1ULL << 51) - 1);
-
-            address_space_stq_le(as, l2t_addr +
-                                 ((icid % num_l2_entries) * GITS_CTE_SIZE),
-                                 cte, MEMTXATTRS_UNSPECIFIED, &res);
-        }
-    } else {
-        /* Flat level table */
-        address_space_stq_le(as, s->ct.base_addr + (icid * GITS_CTE_SIZE),
-                             cte, MEMTXATTRS_UNSPECIFIED, &res);
-    }
+    entry_addr = table_entry_addr(s, &s->ct, icid, &res);
     if (res != MEMTX_OK) {
+        /* memory access error: stall */
         return false;
-    } else {
+    }
+    if (entry_addr == -1) {
+        /* No L2 table for this index: discard write and continue */
         return true;
     }
+
+    address_space_stq_le(as, entry_addr, cte, MEMTXATTRS_UNSPECIFIED, &res);
+    return res == MEMTX_OK;
 }
 
 static ItsCmdResult process_mapc(GICv3ITSState *s, uint32_t offset)
@@ -529,11 +488,7 @@ static bool update_dte(GICv3ITSState *s, uint32_t devid, bool valid,
                        uint8_t size, uint64_t itt_addr)
 {
     AddressSpace *as = &s->gicv3->dma_as;
-    uint64_t value;
-    uint64_t l2t_addr;
-    bool valid_l2t;
-    uint32_t l2t_id;
-    uint32_t num_l2_entries;
+    uint64_t entry_addr;
     uint64_t dte = 0;
     MemTxResult res = MEMTX_OK;
 
@@ -548,44 +503,17 @@ static bool update_dte(GICv3ITSState *s, uint32_t devid, bool valid,
         return true;
     }
 
-    /*
-     * The specification defines the format of level 1 entries of a
-     * 2-level table, but the format of level 2 entries and the format
-     * of flat-mapped tables is IMPDEF.
-     */
-    if (s->dt.indirect) {
-        l2t_id = devid / (s->dt.page_sz / L1TABLE_ENTRY_SIZE);
-
-        value = address_space_ldq_le(as,
-                                     s->dt.base_addr +
-                                     (l2t_id * L1TABLE_ENTRY_SIZE),
-                                     MEMTXATTRS_UNSPECIFIED, &res);
-
-        if (res != MEMTX_OK) {
-            return false;
-        }
-
-        valid_l2t = (value & L2_TABLE_VALID_MASK) != 0;
-
-        if (valid_l2t) {
-            num_l2_entries = s->dt.page_sz / s->dt.entry_sz;
-
-            l2t_addr = value & ((1ULL << 51) - 1);
-
-            address_space_stq_le(as, l2t_addr +
-                                 ((devid % num_l2_entries) * GITS_DTE_SIZE),
-                                 dte, MEMTXATTRS_UNSPECIFIED, &res);
-        }
-    } else {
-        /* Flat level table */
-        address_space_stq_le(as, s->dt.base_addr + (devid * GITS_DTE_SIZE),
-                             dte, MEMTXATTRS_UNSPECIFIED, &res);
-    }
+    entry_addr = table_entry_addr(s, &s->dt, devid, &res);
     if (res != MEMTX_OK) {
+        /* memory access error: stall */
         return false;
-    } else {
+    }
+    if (entry_addr == -1) {
+        /* No L2 table for this index: discard write and continue */
         return true;
     }
+    address_space_stq_le(as, entry_addr, dte, MEMTXATTRS_UNSPECIFIED, &res);
+    return res == MEMTX_OK;
 }
 
 static ItsCmdResult process_mapd(GICv3ITSState *s, uint64_t value,
-- 
2.25.1
