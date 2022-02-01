Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp660772lfk;
        Tue, 1 Feb 2022 11:32:12 -0800 (PST)
X-Received: by 2002:a5d:5283:: with SMTP id c3mr22545452wrv.554.1643743931862;
        Tue, 01 Feb 2022 11:32:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643743931; cv=none;
        d=google.com; s=arc-20160816;
        b=gcM76dj/vgHSsXLy/o+KAq1l7sFfaThQdnCH7hmUWbFyolWmvpTB2B2hvkkOLzkdJ+
         33TZrB5hM1mNbVwxIcVcqAN7haCVvpNSXQC/82VjB3mqN9JoNtc7F9wvIn9gLcvVCpwr
         UPxv4yBuFHFSpvPKrGi8RIGyS/ff7JxcM1miXcSGqr+9w6HhK/aPVEX50J5kgEvYIdaV
         KZu8K99j3gNf1Fn/55RzFTcPf/kmKZHKSwtIRnajACkKGqwINT8cCizzWKAGmWb2FXG+
         vUX+khOvzzmx2F0nXuNNX5pfWjmUn0nTFuLsu1eVeXwx5ZcDUbDVAi0uyY54vjNsflT1
         9yVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=NxK8OvGxGH00I1nCeizxtHY1cDOj4tKxyxRC6N9cwrs=;
        b=nMJgNZCayj/OW6EZnTwpZAQw1SaTWOR/716XQDehEv3d5SMbIswMdvv4WySfVr74fM
         /tweeYsb1z5xEuIDIIKDXHzlANVfyFfH+9mQTFuyfpI6adBVIka+nokbfU3AEO9VrdVy
         ypKbh6uiHr/4euVbD+KDeTRbtpU9iVh2KLWVN8D6mLfkFdN6fCNR2EpkZBwVT0AcmOhL
         gElfijTQRQzh05t5uVIDcWiem/nUxQxs61QzZ9MA69y3e1PfkURMcya/PSb3qrCtuVO6
         Em0DMvUSypqs1x6zIkxd0gueGI+nMVD+GhyBCNJFBNWsX2Dl5w8U5nZbqVf3qyD3lQCz
         7Hug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PMeEC+I+;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id g3sor16981423wrd.41.2022.02.01.11.32.11
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 01 Feb 2022 11:32:11 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PMeEC+I+;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NxK8OvGxGH00I1nCeizxtHY1cDOj4tKxyxRC6N9cwrs=;
        b=PMeEC+I+ugyZEQEV27lnZrmbZ76VND0PdLDlzHOfuRwYWcMmaNRvhQKIDyrBiMhk3w
         lMiNOO2RxgNa03n4tKfxHdtffUEcdeIbmqtGuZW9F9vq/7d/ZvbqWdSrPsGn3G80GfSC
         dg3fURPRTMtqe5LQST0GoKDnNDHroHtwdpqgQVAeEk20jB9LgicmCjZCiLPTHv06GNh+
         X+7V5685dLtc53G9d8GC9jkyPNTNzTeMsJdhoQmmEWQIejF6+2OcCClBRjXAIDCaLJYd
         jp++ZKaopSHUV08jGLiID6rRa8UGhsHZieUVnk8+o74njcKmks27oKCVJYyDvn78ptW5
         eaWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NxK8OvGxGH00I1nCeizxtHY1cDOj4tKxyxRC6N9cwrs=;
        b=VX6N+zmCDnS7MEk1ugLZ4ArfWvuXAyhSXpoMH3C+QZvbk5W+z7F2shnEVV/fCMGIgv
         VOk58js2fkG/5JQ7JcHWUH38rOwTfIthzMMg+2VI7d2Wp7OR9QKqJ83FyhzRFaWo3gb+
         Zf5wGvqD3t5txci3M1C7O/EpbcvIBefQLQGwo/NLf9iS1eHuoHpns6mBKHbDrEYu4JG4
         t8R91F/k7L7CTGynr5QjMRLxlGHlVcTPfFXovJ0PnmkCXOGLUM2dKvMHUVltU8+F1WK5
         3/T5n99ui/8ICOQks9RDTOAZX1fpBh9VEwM4Q/DqkSF6EKjQ++ND/v87eoUrQgDRt2jo
         0o0w==
X-Gm-Message-State: AOAM530zNEh5BErZM0VuJ4TUfxRlVUT99NTXlYbgMxnWKOH0IMau2RPZ
	xMvg3hJ1pOuiOlvyQAq4ddw7R27UqzyUE6qv
X-Google-Smtp-Source: ABdhPJxj8ouVmnS/vE68FbqaFM3IGrZiLTP6LQ/4NtJBGZFS8utmCmnBx1vLUsqowBiyh46p5z8JVA==
X-Received: by 2002:a5d:64c4:: with SMTP id f4mr23479351wri.278.1643743931524;
        Tue, 01 Feb 2022 11:32:11 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id z5sm3491265wmp.10.2022.02.01.11.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Feb 2022 11:32:11 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Shashi Mallela <shashi.mallela@linaro.org>
Subject: [PATCH 02/13] hw/intc/arm_gicv3_its: Keep DTEs as a struct, not a raw uint64_t
Date: Tue,  1 Feb 2022 19:31:56 +0000
Message-Id: <20220201193207.2771604-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220201193207.2771604-1-peter.maydell@linaro.org>
References: <20220201193207.2771604-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: vrGiCDmXUvsb

In the ITS, a DTE is an entry in the device table, which contains
multiple fields. Currently the function get_dte() which reads one
entry from the device table returns it as a raw 64-bit integer,
which we then pass around in that form, only extracting fields
from it as we need them.

Create a real C struct with the same fields as the DTE, and
populate it in get_dte(), so that that function and update_dte()
are the only ones that need to care about the in-guest-memory
format of the DTE.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
This isn't a massive gain for the DTE, though I do think it
looks a bit nicer. The real benefit is in aligning all the
get_{cte,dte,ite} functions to have the same shaped API:
currently get_ite() is different from all the rest.
---
 hw/intc/arm_gicv3_its.c | 111 ++++++++++++++++++++--------------------
 1 file changed, 56 insertions(+), 55 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index b74753fb8fe..6d70d7d59e2 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -46,6 +46,12 @@ typedef struct {
     uint64_t itel;
 } IteEntry;
 
+typedef struct DTEntry {
+    bool valid;
+    unsigned size;
+    uint64_t ittaddr;
+} DTEntry;
+
 /*
  * The ITS spec permits a range of CONSTRAINED UNPREDICTABLE options
  * if a command parameter is not correct. These include both "stall
@@ -143,22 +149,18 @@ static bool get_cte(GICv3ITSState *s, uint16_t icid, uint64_t *cte,
     return FIELD_EX64(*cte, CTE, VALID);
 }
 
-static bool update_ite(GICv3ITSState *s, uint32_t eventid, uint64_t dte,
+static bool update_ite(GICv3ITSState *s, uint32_t eventid, const DTEntry *dte,
                        IteEntry ite)
 {
     AddressSpace *as = &s->gicv3->dma_as;
-    uint64_t itt_addr;
     MemTxResult res = MEMTX_OK;
 
-    itt_addr = FIELD_EX64(dte, DTE, ITTADDR);
-    itt_addr <<= ITTADDR_SHIFT; /* 256 byte aligned */
-
-    address_space_stq_le(as, itt_addr + (eventid * (sizeof(uint64_t) +
+    address_space_stq_le(as, dte->ittaddr + (eventid * (sizeof(uint64_t) +
                          sizeof(uint32_t))), ite.itel, MEMTXATTRS_UNSPECIFIED,
                          &res);
 
     if (res == MEMTX_OK) {
-        address_space_stl_le(as, itt_addr + (eventid * (sizeof(uint64_t) +
+        address_space_stl_le(as, dte->ittaddr + (eventid * (sizeof(uint64_t) +
                              sizeof(uint32_t))) + sizeof(uint32_t), ite.iteh,
                              MEMTXATTRS_UNSPECIFIED, &res);
     }
@@ -169,24 +171,20 @@ static bool update_ite(GICv3ITSState *s, uint32_t eventid, uint64_t dte,
     }
 }
 
-static bool get_ite(GICv3ITSState *s, uint32_t eventid, uint64_t dte,
+static bool get_ite(GICv3ITSState *s, uint32_t eventid, const DTEntry *dte,
                     uint16_t *icid, uint32_t *pIntid, MemTxResult *res)
 {
     AddressSpace *as = &s->gicv3->dma_as;
-    uint64_t itt_addr;
     bool status = false;
     IteEntry ite = {};
 
-    itt_addr = FIELD_EX64(dte, DTE, ITTADDR);
-    itt_addr <<= ITTADDR_SHIFT; /* 256 byte aligned */
-
-    ite.itel = address_space_ldq_le(as, itt_addr +
+    ite.itel = address_space_ldq_le(as, dte->ittaddr +
                                     (eventid * (sizeof(uint64_t) +
                                     sizeof(uint32_t))), MEMTXATTRS_UNSPECIFIED,
                                     res);
 
     if (*res == MEMTX_OK) {
-        ite.iteh = address_space_ldl_le(as, itt_addr +
+        ite.iteh = address_space_ldl_le(as, dte->ittaddr +
                                         (eventid * (sizeof(uint64_t) +
                                         sizeof(uint32_t))) + sizeof(uint32_t),
                                         MEMTXATTRS_UNSPECIFIED, res);
@@ -205,15 +203,33 @@ static bool get_ite(GICv3ITSState *s, uint32_t eventid, uint64_t dte,
     return status;
 }
 
-static uint64_t get_dte(GICv3ITSState *s, uint32_t devid, MemTxResult *res)
+/*
+ * Read the Device Table entry at index @devid. On success (including
+ * successfully determining that there is no valid DTE for this index),
+ * we return MEMTX_OK and populate the DTEntry struct accordingly.
+ * If there is an error reading memory then we return the error code.
+ */
+static MemTxResult get_dte(GICv3ITSState *s, uint32_t devid, DTEntry *dte)
 {
+    MemTxResult res = MEMTX_OK;
     AddressSpace *as = &s->gicv3->dma_as;
-    uint64_t entry_addr = table_entry_addr(s, &s->dt, devid, res);
+    uint64_t entry_addr = table_entry_addr(s, &s->dt, devid, &res);
+    uint64_t dteval;
 
     if (entry_addr == -1) {
-        return 0; /* a DTE entry with the Valid bit clear */
+        /* No L2 table entry, i.e. no valid DTE, or a memory error */
+        dte->valid = false;
+        return res;
     }
-    return address_space_ldq_le(as, entry_addr, MEMTXATTRS_UNSPECIFIED, res);
+    dteval = address_space_ldq_le(as, entry_addr, MEMTXATTRS_UNSPECIFIED, &res);
+    if (res != MEMTX_OK) {
+        return res;
+    }
+    dte->valid = FIELD_EX64(dteval, DTE, VALID);
+    dte->size = FIELD_EX64(dteval, DTE, SIZE);
+    /* DTE word field stores bits [51:8] of the ITT address */
+    dte->ittaddr = FIELD_EX64(dteval, DTE, ITTADDR) << ITTADDR_SHIFT;
+    return MEMTX_OK;
 }
 
 /*
@@ -228,8 +244,6 @@ static ItsCmdResult do_process_its_cmd(GICv3ITSState *s, uint32_t devid,
                                        uint32_t eventid, ItsCmdType cmd)
 {
     MemTxResult res = MEMTX_OK;
-    bool dte_valid;
-    uint64_t dte = 0;
     uint64_t num_eventids;
     uint16_t icid = 0;
     uint32_t pIntid = 0;
@@ -237,6 +251,7 @@ static ItsCmdResult do_process_its_cmd(GICv3ITSState *s, uint32_t devid,
     uint64_t cte = 0;
     bool cte_valid = false;
     uint64_t rdbase;
+    DTEntry dte;
 
     if (devid >= s->dt.num_entries) {
         qemu_log_mask(LOG_GUEST_ERROR,
@@ -245,23 +260,17 @@ static ItsCmdResult do_process_its_cmd(GICv3ITSState *s, uint32_t devid,
         return CMD_CONTINUE;
     }
 
-    dte = get_dte(s, devid, &res);
-
-    if (res != MEMTX_OK) {
+    if (get_dte(s, devid, &dte) != MEMTX_OK) {
         return CMD_STALL;
     }
-    dte_valid = FIELD_EX64(dte, DTE, VALID);
-
-    if (!dte_valid) {
+    if (!dte.valid) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid command attributes: "
-                      "invalid dte: %"PRIx64" for %d\n",
-                      __func__, dte, devid);
+                      "invalid dte for %d\n", __func__, devid);
         return CMD_CONTINUE;
     }
 
-    num_eventids = 1ULL << (FIELD_EX64(dte, DTE, SIZE) + 1);
-
+    num_eventids = 1ULL << (dte.size + 1);
     if (eventid >= num_eventids) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid command attributes: eventid %d >= %"
@@ -270,7 +279,7 @@ static ItsCmdResult do_process_its_cmd(GICv3ITSState *s, uint32_t devid,
         return CMD_CONTINUE;
     }
 
-    ite_valid = get_ite(s, eventid, dte, &icid, &pIntid, &res);
+    ite_valid = get_ite(s, eventid, &dte, &icid, &pIntid, &res);
     if (res != MEMTX_OK) {
         return CMD_STALL;
     }
@@ -320,7 +329,7 @@ static ItsCmdResult do_process_its_cmd(GICv3ITSState *s, uint32_t devid,
     if (cmd == DISCARD) {
         IteEntry ite = {};
         /* remove mapping from interrupt translation table */
-        return update_ite(s, eventid, dte, ite) ? CMD_CONTINUE : CMD_STALL;
+        return update_ite(s, eventid, &dte, ite) ? CMD_CONTINUE : CMD_STALL;
     }
     return CMD_CONTINUE;
 }
@@ -341,11 +350,9 @@ static ItsCmdResult process_mapti(GICv3ITSState *s, const uint64_t *cmdpkt,
     uint32_t pIntid = 0;
     uint64_t num_eventids;
     uint32_t num_intids;
-    bool dte_valid;
-    MemTxResult res = MEMTX_OK;
     uint16_t icid = 0;
-    uint64_t dte = 0;
     IteEntry ite = {};
+    DTEntry dte;
 
     devid = (cmdpkt[0] & DEVID_MASK) >> DEVID_SHIFT;
     eventid = cmdpkt[1] & EVENTID_MASK;
@@ -365,24 +372,21 @@ static ItsCmdResult process_mapti(GICv3ITSState *s, const uint64_t *cmdpkt,
         return CMD_CONTINUE;
     }
 
-    dte = get_dte(s, devid, &res);
-
-    if (res != MEMTX_OK) {
+    if (get_dte(s, devid, &dte) != MEMTX_OK) {
         return CMD_STALL;
     }
-    dte_valid = FIELD_EX64(dte, DTE, VALID);
-    num_eventids = 1ULL << (FIELD_EX64(dte, DTE, SIZE) + 1);
+    num_eventids = 1ULL << (dte.size + 1);
     num_intids = 1ULL << (GICD_TYPER_IDBITS + 1);
 
     if ((icid >= s->ct.num_entries)
-            || !dte_valid || (eventid >= num_eventids) ||
+            || !dte.valid || (eventid >= num_eventids) ||
             (((pIntid < GICV3_LPI_INTID_START) || (pIntid >= num_intids)) &&
              (pIntid != INTID_SPURIOUS))) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid command attributes "
                       "icid %d or eventid %d or pIntid %d or"
                       "unmapped dte %d\n", __func__, icid, eventid,
-                      pIntid, dte_valid);
+                      pIntid, dte.valid);
         /*
          * in this implementation, in case of error
          * we ignore this command and move onto the next
@@ -392,13 +396,13 @@ static ItsCmdResult process_mapti(GICv3ITSState *s, const uint64_t *cmdpkt,
     }
 
     /* add ite entry to interrupt translation table */
-    ite.itel = FIELD_DP64(ite.itel, ITE_L, VALID, dte_valid);
+    ite.itel = FIELD_DP64(ite.itel, ITE_L, VALID, true);
     ite.itel = FIELD_DP64(ite.itel, ITE_L, INTTYPE, ITE_INTTYPE_PHYSICAL);
     ite.itel = FIELD_DP64(ite.itel, ITE_L, INTID, pIntid);
     ite.itel = FIELD_DP64(ite.itel, ITE_L, DOORBELL, INTID_SPURIOUS);
     ite.iteh = FIELD_DP32(ite.iteh, ITE_H, ICID, icid);
 
-    return update_ite(s, eventid, dte, ite) ? CMD_CONTINUE : CMD_STALL;
+    return update_ite(s, eventid, &dte, ite) ? CMD_CONTINUE : CMD_STALL;
 }
 
 static bool update_cte(GICv3ITSState *s, uint16_t icid, bool valid,
@@ -561,10 +565,10 @@ static ItsCmdResult process_movi(GICv3ITSState *s, const uint64_t *cmdpkt)
     uint16_t old_icid, new_icid;
     uint64_t old_cte, new_cte;
     uint64_t old_rdbase, new_rdbase;
-    uint64_t dte;
-    bool dte_valid, ite_valid, cte_valid;
+    bool ite_valid, cte_valid;
     uint64_t num_eventids;
     IteEntry ite = {};
+    DTEntry dte;
 
     devid = FIELD_EX64(cmdpkt[0], MOVI_0, DEVICEID);
     eventid = FIELD_EX64(cmdpkt[1], MOVI_1, EVENTID);
@@ -576,21 +580,18 @@ static ItsCmdResult process_movi(GICv3ITSState *s, const uint64_t *cmdpkt)
                       __func__, devid, s->dt.num_entries);
         return CMD_CONTINUE;
     }
-    dte = get_dte(s, devid, &res);
-    if (res != MEMTX_OK) {
+    if (get_dte(s, devid, &dte) != MEMTX_OK) {
         return CMD_STALL;
     }
 
-    dte_valid = FIELD_EX64(dte, DTE, VALID);
-    if (!dte_valid) {
+    if (!dte.valid) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid command attributes: "
-                      "invalid dte: %"PRIx64" for %d\n",
-                      __func__, dte, devid);
+                      "invalid dte for %d\n", __func__, devid);
         return CMD_CONTINUE;
     }
 
-    num_eventids = 1ULL << (FIELD_EX64(dte, DTE, SIZE) + 1);
+    num_eventids = 1ULL << (dte.size + 1);
     if (eventid >= num_eventids) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid command attributes: eventid %d >= %"
@@ -599,7 +600,7 @@ static ItsCmdResult process_movi(GICv3ITSState *s, const uint64_t *cmdpkt)
         return CMD_CONTINUE;
     }
 
-    ite_valid = get_ite(s, eventid, dte, &old_icid, &intid, &res);
+    ite_valid = get_ite(s, eventid, &dte, &old_icid, &intid, &res);
     if (res != MEMTX_OK) {
         return CMD_STALL;
     }
@@ -678,7 +679,7 @@ static ItsCmdResult process_movi(GICv3ITSState *s, const uint64_t *cmdpkt)
     ite.itel = FIELD_DP64(ite.itel, ITE_L, INTID, intid);
     ite.itel = FIELD_DP64(ite.itel, ITE_L, DOORBELL, INTID_SPURIOUS);
     ite.iteh = FIELD_DP32(ite.iteh, ITE_H, ICID, new_icid);
-    return update_ite(s, eventid, dte, ite) ? CMD_CONTINUE : CMD_STALL;
+    return update_ite(s, eventid, &dte, ite) ? CMD_CONTINUE : CMD_STALL;
 }
 
 /*
-- 
2.25.1
