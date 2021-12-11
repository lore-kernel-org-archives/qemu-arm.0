Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp2583524lfk;
        Sat, 11 Dec 2021 11:11:57 -0800 (PST)
X-Received: by 2002:adf:cd04:: with SMTP id w4mr21959556wrm.406.1639249917627;
        Sat, 11 Dec 2021 11:11:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639249917; cv=none;
        d=google.com; s=arc-20160816;
        b=NywCxTgNoT1MWUkx10YfWx67tqeaWbKGnnbk6YeaPV/W0HcAnnIUuS1c0IXdIVRLAN
         XD8EXGLtJ35LGVs04a1cGukXEF39hxQfDxxIb+TTN2jiQRhnCizx3g62PzstuRMA2yeD
         X1MUY4jko0D0Kxp+R7tmQxSDpTdGh0zPTMuigqP3qK+gjQH9RTIkXe0dfQvnqKy0PIIa
         SVSQfkbziiV4UwS0vFPDoKj5vjz4OFRnaO2i7B2Q7LWN7dViWQIo4FSNHARzXgrJ36qp
         bVQbGidcFTsyiSr/7ZdDOQ2jKLrrt3Lrs3GNnP+OY/qjdBmxg6tA2scrGUpjG1D49L8L
         lA7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=FiPtBXS/9wev8s0ZT0mbwmcHwHHqvxjF8Ntnd/Pa1Ac=;
        b=QYsAPoSgFOP6KoFJ6aTSNlldcakAh6WH7EHqzuz9PdjbzA+KZsAIehtURJRTR9msP1
         D4OID+Eyj/6dpz3sn/m/HAPY3nNCRL1EaHrqhP4TF29t4wALJI/QUyZlKamnhNipsS66
         +i5xKCE0suK1EPeVYufQlECUkFmg4n3vrhiuUUWOCWDYnx7G8CHVpBm4sLl7gNN9WGUS
         TfDbf1EIeZAolThybmMQQXMj2jhTKFuLFUii205d+2gCaxuZ1iZnCV1g+eIbRFlMCHib
         npP6Zc3ca60Ql0HY1f0EMnoZX1LbSsOWhx3Y09oUMVSMJJ8dh7RZVkBPTix+arKOPHo2
         SDyg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BZnCuqAL;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n1sor1039569wmq.12.2021.12.11.11.11.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 11 Dec 2021 11:11:57 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=BZnCuqAL;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FiPtBXS/9wev8s0ZT0mbwmcHwHHqvxjF8Ntnd/Pa1Ac=;
        b=BZnCuqAL7dJJcgheWCX06yDSdWcsRyZKyRaQXehwC22MSU2D2WBMyUxOAO+brSMPJl
         FAhlo7ELrsnoTH8hPlnD76LqOtIbmXKVTvMNaDjy/J0KdPg9hFrHIhcIqDpsjxVqAcAs
         2r+QrCvYvq6TuLs8yerQKRGy1uPrOA9hwedMY2/2q0kVYH+4xRiciwOL6ykliDRzNOPS
         rCFKFacYVNqqaXt4TvRfuTpvGURjIFqiSuZ2sGmN9TnZhiZbb5uqFNAkNq5QzqHrypP7
         dvZeLboId2MCmNFSPvKrT7pVM6ORu9Ekouipl25byjUYz6k9EUi+hbEXg+o39ZmXIRhX
         E40g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FiPtBXS/9wev8s0ZT0mbwmcHwHHqvxjF8Ntnd/Pa1Ac=;
        b=QR7v7lAeGbLxp8UjyGzNUNG8H/fMQjNObdTboGdsW5s8UAQioHo7a4ZLjQQvp0nYRp
         DivdYJwRy0w4fkoVPBheR81b9wjvNa26NEnHxC/6SDv2/BgwdSW7jhXguY1rjzp4MFb7
         xFNdVeGXGTIyg8LpQlnBKdZ4CMHpm0GQkRI+wzK6db+C03cCJeITAJs6MktD4LsuNIuH
         ROP9+HgV2FxA81pHTk2l860whWBKrlttK309wsROhJgEcD6zjv2JoZdirrYxqccyBDzA
         zn1zUWeerN74BBQ2p6L26VdxwIOoqXLmX7ifewH1xPQlaZSUPuNJM+HNst/uRy3YVWUY
         wyGA==
X-Gm-Message-State: AOAM530CknJhZdRGBB0j3sj0vZwCgybOCtiQIjLklLGug7vWnSkwI7ii
	asZYZYoQnmcnPc7tQ6S0l9nTNPRyOfKlhBRZ
X-Google-Smtp-Source: ABdhPJx7Dtx9WUFSoEpQ0HZSJmu3JQU77QU5QZkV1Rrpsjz6a66Kkee/jbsCh+bdqaXXr7qF1xBdmQ==
X-Received: by 2002:a05:600c:35d2:: with SMTP id r18mr25526050wmq.166.1639249917292;
        Sat, 11 Dec 2021 11:11:57 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id m20sm2205300wmq.11.2021.12.11.11.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Dec 2021 11:11:57 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Shashi Mallela <shashi.mallela@linaro.org>
Subject: [PATCH 26/26] hw/intc/arm_gicv3_its: Factor out "find address of table entry" code
Date: Sat, 11 Dec 2021 19:11:35 +0000
Message-Id: <20211211191135.1764649-27-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211211191135.1764649-1-peter.maydell@linaro.org>
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 46ToLfCRsbVx

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
---
This is a worthwhile refactoring on its own, but still more
so given that GICv4 adds another table in this format.
---
 hw/intc/arm_gicv3_its.c | 212 +++++++++++++---------------------------
 1 file changed, 70 insertions(+), 142 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 3bcc4c3db85..90a9fd3b3d4 100644
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
@@ -424,11 +413,7 @@ static bool update_cte(GICv3ITSState *s, uint16_t icid, bool valid,
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
 
@@ -442,44 +427,18 @@ static bool update_cte(GICv3ITSState *s, uint16_t icid, bool valid,
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
@@ -527,11 +486,7 @@ static bool update_dte(GICv3ITSState *s, uint32_t devid, bool valid,
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
 
@@ -546,44 +501,17 @@ static bool update_dte(GICv3ITSState *s, uint32_t devid, bool valid,
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
