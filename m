Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp660852lfk;
        Tue, 1 Feb 2022 11:32:18 -0800 (PST)
X-Received: by 2002:a05:600c:198f:: with SMTP id t15mr3091443wmq.162.1643743937977;
        Tue, 01 Feb 2022 11:32:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643743937; cv=none;
        d=google.com; s=arc-20160816;
        b=Dc8ZHAKkvMEULbL0KZFUbKjJx4QOXJq5ORfEg2NZPEUopGQDxSlw5+JYKspvJSkIdh
         VsYLaGiMSFPEvZZYBLT3UNKmQppa8pwzFVHHab0RLmm5eQdZ5xQBDIU7s3HImbqOO3it
         VBSz7g9o/tWVf1H3Sl4VuiEUhOTNFOZuPkIAzo9IWFXce/j/6IVtLoN5guZgRIfSeP5d
         Uy3TxbM9z6CZxxoJ6FcLVYkAnjUKPs7MAspHRTyTr/8NnbvSln2U71tu4YYfpK0rEcx3
         LoMfWSHPFyybaBMCdtDCLtShyuLxragIJtPHYpMN9slZph376jwc0wG9UAZfW0QqmgD8
         LTYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=ySqmSUe+pqKU2/8QTA7TiGVv/mwkYf9L8c4E7rJVGHU=;
        b=LI6uh9b7uZ48RcBYNqm+B+uUlzGeLiQFWMXDq1usCxeGfUe39vVasRaYnVzKFVHWnY
         rAeZNMNr3Pc26RUpqufJGGZrnQdcg24NHyzqSyE+6VwPcQ4G3php55A2Y74PUqG3g1mO
         qTYM2KP7+n0dIWquakBh4oQIXJ8mbViJwXBNtMJmLA03F2lYr7GlRTHP7a+LVu+x/waN
         e2pJ9c3nEWg0MosT0pLNAw0nUTs8WfeJWWqUzo4MllXYyx0+/X/j7AtcpYpPtJAPplWT
         WUIrE4GMvUqTXRdUG5FkaBkhaWTU0wMlK2FPctWhhmooe3rlSEiBPm5beMyaN8Ohvgv6
         tkdw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KQY7SNl1;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o35sor1794064wms.7.2022.02.01.11.32.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 01 Feb 2022 11:32:17 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KQY7SNl1;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ySqmSUe+pqKU2/8QTA7TiGVv/mwkYf9L8c4E7rJVGHU=;
        b=KQY7SNl1o+xanxUO64cGKa1UnOuHrm3wcbHPJvPZbdQ3/7ua6uc1rNbxWlFI64JhQG
         HHmbKViSBImkww+wAhE55CFfn4Z2S6UVjBle1HbwmcM85S4LmjXuSFI6L3Zb+WNv3UDo
         V9CdTmr00y2w3V7/jEQXjqDwf08ppbQh29fVnZQYDMLx4vwVGRex0U2PSl++EuxPdOBM
         xacUUdpES+Qszy70qpAGwnSjpbj76doIzasn+wy+iA1lWHGYQAOICrR+NLcdeQ09sDMq
         KLHCRxM/eQNRDH93Deym2CLicSBXnk6q/iGuQ0/J7UyTzvN0KbSrpfM5FAnue/PxljOQ
         tDrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ySqmSUe+pqKU2/8QTA7TiGVv/mwkYf9L8c4E7rJVGHU=;
        b=wIikijCRXj7yJOvL0K4flzWqH7TDn3OMqIR7jTbMEImPiSz63ax+JFhAamRnv+Q8Ju
         nuGvANo33EAwo7LxPrpt4MIzxU7UnZ4Co73Q44rD+jS0brONKb6fWk4+r5ap9Ju93+nc
         KYk2qLBFvf/sYD8z6QIVUwowhSZHd02dy/INDZ9jY7wW8znW+4KjooRQukqaEfU9Y81s
         7S124xK5bE0AzJQ9DKCrWrMqMdcXiGauVrI+CwQCUDknfqcBadlNEOPTEPCz+Oo/5Po9
         JqyYy5Og6rdDpQYlEzefNzyEdMBVQHNC51ibjZVkQ0OqjITkM+k0ySTfkipATu/ZrlQE
         w+Uw==
X-Gm-Message-State: AOAM5309CFlGlC97pksso43/UmPRj3806Ei6LsgVyutQeLXQVf4bUvd+
	ELd2Ktgxw5wjbA+Oo6YyJfaVXWD2
X-Google-Smtp-Source: ABdhPJzj2V6ZlqMCK/7AHfhygOHgX9l+HPSCUuk9mwLtaxccpWHU9DGWglMkuTCS6R2l82IHPhfgYQ==
X-Received: by 2002:a05:600c:25a:: with SMTP id 26mr3060727wmj.184.1643743937597;
        Tue, 01 Feb 2022 11:32:17 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id z5sm3491265wmp.10.2022.02.01.11.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Feb 2022 11:32:17 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Shashi Mallela <shashi.mallela@linaro.org>
Subject: [PATCH 09/13] hw/intc/arm_gicv3_its: Make update_ite() use ITEntry
Date: Tue,  1 Feb 2022 19:32:03 +0000
Message-Id: <20220201193207.2771604-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220201193207.2771604-1-peter.maydell@linaro.org>
References: <20220201193207.2771604-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: WYee3+06nc4c

Make the update_ite() struct use the new ITEntry struct, so that
callers don't need to assemble the in-memory ITE data themselves, and
only get_ite() and update_ite() need to care about that in-memory
layout.  We can then drop the no-longer-used IteEntry struct
definition.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 62 +++++++++++++++++++++--------------------
 1 file changed, 32 insertions(+), 30 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index bd741085022..e3b63efddcc 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -41,11 +41,6 @@ typedef enum ItsCmdType {
     INTERRUPT = 3,
 } ItsCmdType;
 
-typedef struct {
-    uint32_t iteh;
-    uint64_t itel;
-} IteEntry;
-
 typedef struct DTEntry {
     bool valid;
     unsigned size;
@@ -178,24 +173,35 @@ static MemTxResult get_cte(GICv3ITSState *s, uint16_t icid, CTEntry *cte)
     return MEMTX_OK;
 }
 
+/*
+ * Update the Interrupt Table entry at index @evinted in the table specified
+ * by the dte @dte. Returns true on success, false if there was a memory
+ * access error.
+ */
 static bool update_ite(GICv3ITSState *s, uint32_t eventid, const DTEntry *dte,
-                       IteEntry ite)
+                       const ITEntry *ite)
 {
     AddressSpace *as = &s->gicv3->dma_as;
     MemTxResult res = MEMTX_OK;
     hwaddr iteaddr = dte->ittaddr + eventid * ITS_ITT_ENTRY_SIZE;
+    uint64_t itel = 0;
+    uint32_t iteh = 0;
 
-    address_space_stq_le(as, iteaddr, ite.itel, MEMTXATTRS_UNSPECIFIED, &res);
-
-    if (res == MEMTX_OK) {
-        address_space_stl_le(as, iteaddr + 8, ite.iteh,
-                             MEMTXATTRS_UNSPECIFIED, &res);
+    if (ite->valid) {
+        itel = FIELD_DP64(itel, ITE_L, VALID, 1);
+        itel = FIELD_DP64(itel, ITE_L, INTTYPE, ite->inttype);
+        itel = FIELD_DP64(itel, ITE_L, INTID, ite->intid);
+        itel = FIELD_DP64(itel, ITE_L, ICID, ite->icid);
+        itel = FIELD_DP64(itel, ITE_L, VPEID, ite->vpeid);
+        iteh = FIELD_DP32(iteh, ITE_H, DOORBELL, ite->doorbell);
     }
+
+    address_space_stq_le(as, iteaddr, itel, MEMTXATTRS_UNSPECIFIED, &res);
     if (res != MEMTX_OK) {
         return false;
-    } else {
-        return true;
     }
+    address_space_stl_le(as, iteaddr + 8, iteh, MEMTXATTRS_UNSPECIFIED, &res);
+    return res == MEMTX_OK;
 }
 
 /*
@@ -346,9 +352,10 @@ static ItsCmdResult do_process_its_cmd(GICv3ITSState *s, uint32_t devid,
     }
 
     if (cmd == DISCARD) {
-        IteEntry itee = {};
+        ITEntry ite = {};
         /* remove mapping from interrupt translation table */
-        return update_ite(s, eventid, &dte, itee) ? CMD_CONTINUE : CMD_STALL;
+        ite.valid = false;
+        return update_ite(s, eventid, &dte, &ite) ? CMD_CONTINUE : CMD_STALL;
     }
     return CMD_CONTINUE;
 }
@@ -370,8 +377,8 @@ static ItsCmdResult process_mapti(GICv3ITSState *s, const uint64_t *cmdpkt,
     uint64_t num_eventids;
     uint32_t num_intids;
     uint16_t icid = 0;
-    IteEntry ite = {};
     DTEntry dte;
+    ITEntry ite;
 
     devid = (cmdpkt[0] & DEVID_MASK) >> DEVID_SHIFT;
     eventid = cmdpkt[1] & EVENTID_MASK;
@@ -415,13 +422,13 @@ static ItsCmdResult process_mapti(GICv3ITSState *s, const uint64_t *cmdpkt,
     }
 
     /* add ite entry to interrupt translation table */
-    ite.itel = FIELD_DP64(ite.itel, ITE_L, VALID, true);
-    ite.itel = FIELD_DP64(ite.itel, ITE_L, INTTYPE, ITE_INTTYPE_PHYSICAL);
-    ite.itel = FIELD_DP64(ite.itel, ITE_L, INTID, pIntid);
-    ite.itel = FIELD_DP64(ite.itel, ITE_L, ICID, icid);
-    ite.iteh = FIELD_DP32(ite.iteh, ITE_H, DOORBELL, INTID_SPURIOUS);
-
-    return update_ite(s, eventid, &dte, ite) ? CMD_CONTINUE : CMD_STALL;
+    ite.valid = true;
+    ite.inttype = ITE_INTTYPE_PHYSICAL;
+    ite.intid = pIntid;
+    ite.icid = icid;
+    ite.doorbell = INTID_SPURIOUS;
+    ite.vpeid = 0;
+    return update_ite(s, eventid, &dte, &ite) ? CMD_CONTINUE : CMD_STALL;
 }
 
 /*
@@ -585,7 +592,6 @@ static ItsCmdResult process_movi(GICv3ITSState *s, const uint64_t *cmdpkt)
     uint32_t devid, eventid;
     uint16_t new_icid;
     uint64_t num_eventids;
-    IteEntry ite = {};
     DTEntry dte;
     CTEntry old_cte, new_cte;
     ITEntry old_ite;
@@ -689,12 +695,8 @@ static ItsCmdResult process_movi(GICv3ITSState *s, const uint64_t *cmdpkt)
     }
 
     /* Update the ICID field in the interrupt translation table entry */
-    ite.itel = FIELD_DP64(ite.itel, ITE_L, VALID, 1);
-    ite.itel = FIELD_DP64(ite.itel, ITE_L, INTTYPE, ITE_INTTYPE_PHYSICAL);
-    ite.itel = FIELD_DP64(ite.itel, ITE_L, INTID, old_ite.intid);
-    ite.itel = FIELD_DP64(ite.itel, ITE_L, ICID, new_icid);
-    ite.iteh = FIELD_DP32(ite.iteh, ITE_H, DOORBELL, INTID_SPURIOUS);
-    return update_ite(s, eventid, &dte, ite) ? CMD_CONTINUE : CMD_STALL;
+    old_ite.icid = new_icid;
+    return update_ite(s, eventid, &dte, &old_ite) ? CMD_CONTINUE : CMD_STALL;
 }
 
 /*
-- 
2.25.1
