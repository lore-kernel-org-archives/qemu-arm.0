Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp660848lfk;
        Tue, 1 Feb 2022 11:32:17 -0800 (PST)
X-Received: by 2002:a7b:c3c8:: with SMTP id t8mr3145475wmj.189.1643743937158;
        Tue, 01 Feb 2022 11:32:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643743937; cv=none;
        d=google.com; s=arc-20160816;
        b=fXlru79Xfr61E2FFUZcACqd/vs5uLKdpHaDU9HCOD+zmCkUIK4c/wIuVk50FZ9QBAq
         CREK8Zq2a+QCiCRSIqIc9qOHMzMSXzs2yMYx2TkrZiGiPY831d5R06GT/hnd/BLz/zXn
         XZs7nNJpZPwJn5mO+jh4/QjlBaHoR9twc4mxlj/DhIbfkJKDTkofprbCo4HGgxP/ZLzm
         XACzVc5yAH6AnZo3GLMQd1656/fO/f/vgKRaolHPsO/SeXbEXKjLM3MHBdo0V3y/Gpi1
         oUj100qkTrSost+8tuNt66e3LegippFxMFKIHUGMMnQSxlagRL+Bhgc8OA2MhxEei6Mc
         MlMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=nPLPb9l/Buw26NK1shfWRC6uzupfDfIm6yLALRPCcoU=;
        b=knw6yL5fNhCpaBLr7+RupV/YbrHOD09qb1BEfAKm1PXC1leXsWb0e5uuiQLWo3BAsX
         FDQsqxxexN3zIsIhzRpwpeBXFF78Jmg9eaAmWsf+1zUaFguFpveIQOUi835hwurVmD5y
         zw6FPWnaACU3yVXZ447TqId9WXcMAT+RazfyaidoRwC6hFVM1rhUDqDy0aS2/78uF5ZT
         JPLnsRtzm3a0FxE12Qj8NXuN+lQyWKK4zh52tKNJtqpaAPNE34YywHKQTutZyMiNyxa5
         NRS7VyDowtsLRwv6rTLyVIvc7pCXLLoLVrZlUzHFivqZOQSDDT7LnlQKRMzA6a2AGK9t
         JzqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oVklytxs;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d14sor1798281wmq.22.2022.02.01.11.32.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 01 Feb 2022 11:32:17 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oVklytxs;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nPLPb9l/Buw26NK1shfWRC6uzupfDfIm6yLALRPCcoU=;
        b=oVklytxsIcBPVPSk81GXVHKEb2LwBcUq6jZNSI9RAHQneo55Cu2zNhblndu3GoP7XJ
         lulqBf8ezODJOrz66L7/MWRgcqgN1IDdt6dYeReJt4zBeJZ6FwLCZBDqZgadeykwHd/C
         Y0Nrvhz0jQP7AZPP3OZfDT83ay6Z8mspZ1aF/RvW8ze3V6Oy32KErMPEZnDK41A408Gp
         NpRxalOlPT09ACSISHsyO0UbZeUq66b9x564yLlFxXLqirHzpIBLrs0YIEBRo2t6MPCa
         VmQzjIx00/0zkNftmD7skwZfNaVAsc07TycyhBPfLT/6EnaTzjJCHX+CfavXUKPG017z
         ZDPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nPLPb9l/Buw26NK1shfWRC6uzupfDfIm6yLALRPCcoU=;
        b=4YP8hW0RwvO8rGBTNvEhi7yy8wk8Jk7+G/TYOJEKyH3j/juLkCGWaSorVb+GgQD7y5
         ChRIoCw0hkOOx1TDWtsI9c4TDWoDgfDGmjY12sZy8nLoiimU3ETQig6N7K1orzuBHf9B
         l1sY29LBtKtLrHXkPA36agHAfaPymYQI2jOxOfNwXEtzPf5jKE6XghXkMDzj+K09XbaR
         b/tvD5q2n2x5rareufvVoeC99HevwsL5j2uykUimYQ2we8fX0UpLFR/WV/kWJmc3kkV0
         iAx+Cygwmjk7PC3t75u6LIT5zqaOWWdurzO/GhSbEtmOtQSucQQN+ol7Rl8IOhKAWHak
         EfNw==
X-Gm-Message-State: AOAM532avDgL16D1P2WAWUA/Kq0IKeSflZ0k4PLGcN55vDgCQIUsYRd9
	sPfzedG0K747cOHYhMhZa1I/PbMBCUth8PgI
X-Google-Smtp-Source: ABdhPJxqQy5vu706DcQRJcyx1r6/CeXi6uhuv0kPH70T0tQE2Z+fzw9hUDr7N4i/cusiiWod5U7cYg==
X-Received: by 2002:a05:600c:2741:: with SMTP id 1mr3177734wmw.50.1643743936764;
        Tue, 01 Feb 2022 11:32:16 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id z5sm3491265wmp.10.2022.02.01.11.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Feb 2022 11:32:16 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Shashi Mallela <shashi.mallela@linaro.org>
Subject: [PATCH 08/13] hw/intc/arm_gicv3_its: Pass ITE values back from get_ite() via a struct
Date: Tue,  1 Feb 2022 19:32:02 +0000
Message-Id: <20220201193207.2771604-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220201193207.2771604-1-peter.maydell@linaro.org>
References: <20220201193207.2771604-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: iuT8clzDSMsY

In get_ite() we currently return the caller some of the fields of an
Interrupt Table Entry via a set of pointer arguments, and validate
some of them internally (interrupt type and valid bit) to return a
simple true/false 'valid' indication. Define a new ITEntry struct
which has all the fields that the in-memory ITE has, and bring the
get_ite() function in to line with get_dte() and get_cte().

This paves the way for handling virtual interrupts, which will want
a different subset of the fields in the ITE. Handling them under
the old "lots of pointer arguments" scheme would have meant a
confusingly large set of arguments for this function.

The new struct ITEntry is obviously confusably similar to the
existing IteEntry struct, whose fields are the raw 12 bytes
of the in-memory ITE. In the next commit we will make update_ite()
use ITEntry instead of IteEntry, which will allow us to delete
the IteEntry struct and remove the confusion.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 102 ++++++++++++++++++++++------------------
 1 file changed, 55 insertions(+), 47 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 6975a349f62..bd741085022 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -57,6 +57,16 @@ typedef struct CTEntry {
     uint32_t rdbase;
 } CTEntry;
 
+typedef struct ITEntry {
+    bool valid;
+    int inttype;
+    uint32_t intid;
+    uint32_t doorbell;
+    uint32_t icid;
+    uint32_t vpeid;
+} ITEntry;
+
+
 /*
  * The ITS spec permits a range of CONSTRAINED UNPREDICTABLE options
  * if a command parameter is not correct. These include both "stall
@@ -188,34 +198,38 @@ static bool update_ite(GICv3ITSState *s, uint32_t eventid, const DTEntry *dte,
     }
 }
 
-static bool get_ite(GICv3ITSState *s, uint32_t eventid, const DTEntry *dte,
-                    uint16_t *icid, uint32_t *pIntid, MemTxResult *res)
+/*
+ * Read the Interrupt Table entry at index @eventid from the table specified
+ * by the DTE @dte. On success, we return MEMTX_OK and populate the ITEntry
+ * struct @ite accordingly. If there is an error reading memory then we return
+ * the error code.
+ */
+static MemTxResult get_ite(GICv3ITSState *s, uint32_t eventid,
+                           const DTEntry *dte, ITEntry *ite)
 {
     AddressSpace *as = &s->gicv3->dma_as;
-    bool status = false;
-    IteEntry ite = {};
+    MemTxResult res = MEMTX_OK;
+    uint64_t itel;
+    uint32_t iteh;
     hwaddr iteaddr = dte->ittaddr + eventid * ITS_ITT_ENTRY_SIZE;
 
-    ite.itel = address_space_ldq_le(as, iteaddr, MEMTXATTRS_UNSPECIFIED, res);
-    if (*res != MEMTX_OK) {
-        return false;
+    itel = address_space_ldq_le(as, iteaddr, MEMTXATTRS_UNSPECIFIED, &res);
+    if (res != MEMTX_OK) {
+        return res;
     }
 
-    ite.iteh = address_space_ldl_le(as, iteaddr + 8,
-                                    MEMTXATTRS_UNSPECIFIED, res);
-    if (*res != MEMTX_OK) {
-        return false;
+    iteh = address_space_ldl_le(as, iteaddr + 8, MEMTXATTRS_UNSPECIFIED, &res);
+    if (res != MEMTX_OK) {
+        return res;
     }
 
-    if (FIELD_EX64(ite.itel, ITE_L, VALID)) {
-        int inttype = FIELD_EX64(ite.itel, ITE_L, INTTYPE);
-        if (inttype == ITE_INTTYPE_PHYSICAL) {
-            *pIntid = FIELD_EX64(ite.itel, ITE_L, INTID);
-            *icid = FIELD_EX64(ite.itel, ITE_L, ICID);
-            status = true;
-        }
-    }
-    return status;
+    ite->valid = FIELD_EX64(itel, ITE_L, VALID);
+    ite->inttype = FIELD_EX64(itel, ITE_L, INTTYPE);
+    ite->intid = FIELD_EX64(itel, ITE_L, INTID);
+    ite->icid = FIELD_EX64(itel, ITE_L, ICID);
+    ite->vpeid = FIELD_EX64(itel, ITE_L, VPEID);
+    ite->doorbell = FIELD_EX64(iteh, ITE_H, DOORBELL);
+    return MEMTX_OK;
 }
 
 /*
@@ -258,13 +272,10 @@ static MemTxResult get_dte(GICv3ITSState *s, uint32_t devid, DTEntry *dte)
 static ItsCmdResult do_process_its_cmd(GICv3ITSState *s, uint32_t devid,
                                        uint32_t eventid, ItsCmdType cmd)
 {
-    MemTxResult res = MEMTX_OK;
     uint64_t num_eventids;
-    uint16_t icid = 0;
-    uint32_t pIntid = 0;
-    bool ite_valid = false;
     DTEntry dte;
     CTEntry cte;
+    ITEntry ite;
 
     if (devid >= s->dt.num_entries) {
         qemu_log_mask(LOG_GUEST_ERROR,
@@ -292,26 +303,25 @@ static ItsCmdResult do_process_its_cmd(GICv3ITSState *s, uint32_t devid,
         return CMD_CONTINUE;
     }
 
-    ite_valid = get_ite(s, eventid, &dte, &icid, &pIntid, &res);
-    if (res != MEMTX_OK) {
+    if (get_ite(s, eventid, &dte, &ite) != MEMTX_OK) {
         return CMD_STALL;
     }
 
-    if (!ite_valid) {
+    if (!ite.valid || ite.inttype != ITE_INTTYPE_PHYSICAL) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid command attributes: invalid ITE\n",
                       __func__);
         return CMD_CONTINUE;
     }
 
-    if (icid >= s->ct.num_entries) {
+    if (ite.icid >= s->ct.num_entries) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid ICID 0x%x in ITE (table corrupted?)\n",
-                      __func__, icid);
+                      __func__, ite.icid);
         return CMD_CONTINUE;
     }
 
-    if (get_cte(s, icid, &cte) != MEMTX_OK) {
+    if (get_cte(s, ite.icid, &cte) != MEMTX_OK) {
         return CMD_STALL;
     }
     if (!cte.valid) {
@@ -330,15 +340,15 @@ static ItsCmdResult do_process_its_cmd(GICv3ITSState *s, uint32_t devid,
     }
 
     if ((cmd == CLEAR) || (cmd == DISCARD)) {
-        gicv3_redist_process_lpi(&s->gicv3->cpu[cte.rdbase], pIntid, 0);
+        gicv3_redist_process_lpi(&s->gicv3->cpu[cte.rdbase], ite.intid, 0);
     } else {
-        gicv3_redist_process_lpi(&s->gicv3->cpu[cte.rdbase], pIntid, 1);
+        gicv3_redist_process_lpi(&s->gicv3->cpu[cte.rdbase], ite.intid, 1);
     }
 
     if (cmd == DISCARD) {
-        IteEntry ite = {};
+        IteEntry itee = {};
         /* remove mapping from interrupt translation table */
-        return update_ite(s, eventid, &dte, ite) ? CMD_CONTINUE : CMD_STALL;
+        return update_ite(s, eventid, &dte, itee) ? CMD_CONTINUE : CMD_STALL;
     }
     return CMD_CONTINUE;
 }
@@ -572,14 +582,13 @@ static ItsCmdResult process_movall(GICv3ITSState *s, const uint64_t *cmdpkt)
 
 static ItsCmdResult process_movi(GICv3ITSState *s, const uint64_t *cmdpkt)
 {
-    MemTxResult res = MEMTX_OK;
-    uint32_t devid, eventid, intid;
-    uint16_t old_icid, new_icid;
-    bool ite_valid;
+    uint32_t devid, eventid;
+    uint16_t new_icid;
     uint64_t num_eventids;
     IteEntry ite = {};
     DTEntry dte;
     CTEntry old_cte, new_cte;
+    ITEntry old_ite;
 
     devid = FIELD_EX64(cmdpkt[0], MOVI_0, DEVICEID);
     eventid = FIELD_EX64(cmdpkt[1], MOVI_1, EVENTID);
@@ -611,22 +620,21 @@ static ItsCmdResult process_movi(GICv3ITSState *s, const uint64_t *cmdpkt)
         return CMD_CONTINUE;
     }
 
-    ite_valid = get_ite(s, eventid, &dte, &old_icid, &intid, &res);
-    if (res != MEMTX_OK) {
+    if (get_ite(s, eventid, &dte, &old_ite) != MEMTX_OK) {
         return CMD_STALL;
     }
 
-    if (!ite_valid) {
+    if (!old_ite.valid || old_ite.inttype != ITE_INTTYPE_PHYSICAL) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid command attributes: invalid ITE\n",
                       __func__);
         return CMD_CONTINUE;
     }
 
-    if (old_icid >= s->ct.num_entries) {
+    if (old_ite.icid >= s->ct.num_entries) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid ICID 0x%x in ITE (table corrupted?)\n",
-                      __func__, old_icid);
+                      __func__, old_ite.icid);
         return CMD_CONTINUE;
     }
 
@@ -637,14 +645,14 @@ static ItsCmdResult process_movi(GICv3ITSState *s, const uint64_t *cmdpkt)
         return CMD_CONTINUE;
     }
 
-    if (get_cte(s, old_icid, &old_cte) != MEMTX_OK) {
+    if (get_cte(s, old_ite.icid, &old_cte) != MEMTX_OK) {
         return CMD_STALL;
     }
     if (!old_cte.valid) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid command attributes: "
                       "invalid CTE for old ICID 0x%x\n",
-                      __func__, old_icid);
+                      __func__, old_ite.icid);
         return CMD_CONTINUE;
     }
 
@@ -677,13 +685,13 @@ static ItsCmdResult process_movi(GICv3ITSState *s, const uint64_t *cmdpkt)
         /* Move the LPI from the old redistributor to the new one */
         gicv3_redist_mov_lpi(&s->gicv3->cpu[old_cte.rdbase],
                              &s->gicv3->cpu[new_cte.rdbase],
-                             intid);
+                             old_ite.intid);
     }
 
     /* Update the ICID field in the interrupt translation table entry */
     ite.itel = FIELD_DP64(ite.itel, ITE_L, VALID, 1);
     ite.itel = FIELD_DP64(ite.itel, ITE_L, INTTYPE, ITE_INTTYPE_PHYSICAL);
-    ite.itel = FIELD_DP64(ite.itel, ITE_L, INTID, intid);
+    ite.itel = FIELD_DP64(ite.itel, ITE_L, INTID, old_ite.intid);
     ite.itel = FIELD_DP64(ite.itel, ITE_L, ICID, new_icid);
     ite.iteh = FIELD_DP32(ite.iteh, ITE_H, DOORBELL, INTID_SPURIOUS);
     return update_ite(s, eventid, &dte, ite) ? CMD_CONTINUE : CMD_STALL;
-- 
2.25.1
