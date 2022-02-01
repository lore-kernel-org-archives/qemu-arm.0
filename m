Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp660793lfk;
        Tue, 1 Feb 2022 11:32:13 -0800 (PST)
X-Received: by 2002:a05:6000:1569:: with SMTP id 9mr22984033wrz.512.1643743933567;
        Tue, 01 Feb 2022 11:32:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643743933; cv=none;
        d=google.com; s=arc-20160816;
        b=paPOQXZEUyl2jkUMTefoThW4GV9dcmU0TwlcT753XwPjavxvgP0Nkn8oIlpvSAHxSH
         Ir8dJSNggiwY3KhDdpP7b74dbHdfCw3/sNREDRAcLmfqy/FYWy5W3uaypzjEbSkH26QF
         iG32qDsA37RnTj6AYemTOzGj6C0rXgLKjGOWdmoAQlAOMX1/+gPKlA9ZkKJNDdiX4OCu
         X+YXjEDAG6hSpLYDrnKXba/yUmFbHwoRTJnry7HyQCCSG69dFs+IFX+yiGQA0Q5A86XG
         ABEby0noX0HZNCtQ74i7vb/JbD86+tIh2v6zKgdOgyrTTK7jBOn6io3Fj/jQKf+FvmIg
         6I8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=Y92dO/2qMOMRqobpIK/3O4HIwg33Qdc8PfDszoLNeew=;
        b=bXhU70D8W0shZzhC45Sor4DcGz/PEowvzGDJbpG9vd3r0JcgySygYk8nuQCeSRzb5V
         ZH0cD0A/RtevYU2FLDlkFc4qy0VXHIMJdWzRGUiYehh/0PdguDme0IzT0SGnY2KYOWkg
         211pRZKB5oaARN8qluHQ7CgORcjF3XB2zUUj0G60wX5nbTWpxHIYemdrGLm87RNdlHig
         STaBj6WhATUTayGJox3F8UAwhiiZX9wDCEjJ2e6LvL5JHkFv6v3XlOctd6uMpCmNfbA4
         16Vk9nkrk9FLDP3TzEgOFPG6HloGQIQgIm4v7+7NeSJvNv9uWDpnMGoksQCb+v7oanev
         ctAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SRVznH70;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a9sor18532097wrp.8.2022.02.01.11.32.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 01 Feb 2022 11:32:13 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SRVznH70;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Y92dO/2qMOMRqobpIK/3O4HIwg33Qdc8PfDszoLNeew=;
        b=SRVznH70KXATmN7v5CVFoP4wpBd9IfMtU0fFdASyBKxshGKJSr24xLbKYevPxp7KdZ
         Wdeshziw0Vxi3dSKAYmDOn4EJ8AfvnSEPHBeZ3qIlcIJhbX5S9hCillp7IH2Tdv4hheO
         8Y1B4oriulZip7IZcOse2R8cFmb3hfUlhuksKiSJgNrS47C27T6KUfMzdYEV2BTC97Yw
         pAKBbXXC5Abza61qKhuue3vifX1kOMt0jR7ljMKGgtkqI4ajLs49cxLl4b4eGqUVk8Vp
         TV1NNUnq6aKfJozjnqTnCyEmMr5vzyPPatCP0S+RxxyRRkmGibWfrRYmLUbTurrSV1ku
         O3rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Y92dO/2qMOMRqobpIK/3O4HIwg33Qdc8PfDszoLNeew=;
        b=CvpsNJkBdRsvPKfGD0/NN6iV2s/aB0Rj1W916rFHKO1piQRv6MubJTbtjXXkyig5Un
         2MZ50vTrT+vSUSQWXR0QxVrpr17qonkFS1H2Y4JktfS5KVjnhz2jrK+9VL9x4BtIowpk
         9WMg0sHaFrUnkcZ8+tNKeOVjDCjHslgzWBO9FmRKRe1G9nKvqKx+h34iumyLcsp9ay9T
         daRSATbPmspI3vPjTxouhVfnXQcWUdTE4meBplMfxTkaH+wMbodEdOmyY8LnAp3uADBn
         RkclVM5jxb4WApCVLXSin7MaAFCeLomutN9w5F37K2688QNnL3irwxo0ilwzZGto4q58
         V4oQ==
X-Gm-Message-State: AOAM531bLTtB0pP9Dnx3tz4fj8vlUqDXQ+6ttWKkM0EnakzB1iDh4vRA
	c2dUUlPfE1r5QOTg7U47g8TiR15f5YecqQEg
X-Google-Smtp-Source: ABdhPJyzofkHHi5BotAKzEi0x5EMXk0zoZVBAQoH6VhuGICOxXtLPbhHd6aLiVxtpjIsGmdPwfKMww==
X-Received: by 2002:adf:f80a:: with SMTP id s10mr22060827wrp.440.1643743933234;
        Tue, 01 Feb 2022 11:32:13 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id z5sm3491265wmp.10.2022.02.01.11.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Feb 2022 11:32:12 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Shashi Mallela <shashi.mallela@linaro.org>
Subject: [PATCH 04/13] hw/intc/arm_gicv3_its: Keep CTEs as a struct, not a raw uint64_t
Date: Tue,  1 Feb 2022 19:31:58 +0000
Message-Id: <20220201193207.2771604-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220201193207.2771604-1-peter.maydell@linaro.org>
References: <20220201193207.2771604-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: 0h12ZDPcPLof

In the ITS, a CTE is an entry in the collection table, which contains
multiple fields. Currently the function get_cte() which reads one
entry from the device table returns a success/failure boolean and
passes back the raw 64-bit integer CTE value via a pointer argument.
We then extract fields from the CTE as we need them.

Create a real C struct with the same fields as the CTE, and
populate it in get_cte(), so that that function and update_cte()
are the only ones which need to care about the in-guest-memory
format of the CTE.

This brings get_cte()'s API into line with get_dte().

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 96 ++++++++++++++++++++++-------------------
 1 file changed, 52 insertions(+), 44 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 1856210e79a..482a71ba73c 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -52,6 +52,11 @@ typedef struct DTEntry {
     uint64_t ittaddr;
 } DTEntry;
 
+typedef struct CTEntry {
+    bool valid;
+    uint32_t rdbase;
+} CTEntry;
+
 /*
  * The ITS spec permits a range of CONSTRAINED UNPREDICTABLE options
  * if a command parameter is not correct. These include both "stall
@@ -135,18 +140,32 @@ static uint64_t table_entry_addr(GICv3ITSState *s, TableDesc *td,
     return (l2 & ((1ULL << 51) - 1)) + (idx % num_l2_entries) * td->entry_sz;
 }
 
-static bool get_cte(GICv3ITSState *s, uint16_t icid, uint64_t *cte,
-                    MemTxResult *res)
+/*
+ * Read the Collection Table entry at index @icid. On success (including
+ * successfully determining that there is no valid CTE for this index),
+ * we return MEMTX_OK and populate the CTEntry struct @cte accordingly.
+ * If there is an error reading memory then we return the error code.
+ */
+static MemTxResult get_cte(GICv3ITSState *s, uint16_t icid, CTEntry *cte)
 {
     AddressSpace *as = &s->gicv3->dma_as;
-    uint64_t entry_addr = table_entry_addr(s, &s->ct, icid, res);
+    MemTxResult res = MEMTX_OK;
+    uint64_t entry_addr = table_entry_addr(s, &s->ct, icid, &res);
+    uint64_t cteval;
 
     if (entry_addr == -1) {
-        return false; /* not valid */
+        /* No L2 table entry, i.e. no valid CTE, or a memory error */
+        cte->valid = false;
+        return res;
     }
 
-    *cte = address_space_ldq_le(as, entry_addr, MEMTXATTRS_UNSPECIFIED, res);
-    return FIELD_EX64(*cte, CTE, VALID);
+    cteval = address_space_ldq_le(as, entry_addr, MEMTXATTRS_UNSPECIFIED, &res);
+    if (res != MEMTX_OK) {
+        return res;
+    }
+    cte->valid = FIELD_EX64(cteval, CTE, VALID);
+    cte->rdbase = FIELD_EX64(cteval, CTE, RDBASE);
+    return MEMTX_OK;
 }
 
 static bool update_ite(GICv3ITSState *s, uint32_t eventid, const DTEntry *dte,
@@ -248,10 +267,8 @@ static ItsCmdResult do_process_its_cmd(GICv3ITSState *s, uint32_t devid,
     uint16_t icid = 0;
     uint32_t pIntid = 0;
     bool ite_valid = false;
-    uint64_t cte = 0;
-    bool cte_valid = false;
-    uint64_t rdbase;
     DTEntry dte;
+    CTEntry cte;
 
     if (devid >= s->dt.num_entries) {
         qemu_log_mask(LOG_GUEST_ERROR,
@@ -298,15 +315,13 @@ static ItsCmdResult do_process_its_cmd(GICv3ITSState *s, uint32_t devid,
         return CMD_CONTINUE;
     }
 
-    cte_valid = get_cte(s, icid, &cte, &res);
-    if (res != MEMTX_OK) {
+    if (get_cte(s, icid, &cte) != MEMTX_OK) {
         return CMD_STALL;
     }
-    if (!cte_valid) {
+    if (!cte.valid) {
         qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: invalid command attributes: "
-                      "invalid cte: %"PRIx64"\n",
-                      __func__, cte);
+                      "%s: invalid command attributes: invalid CTE\n",
+                      __func__);
         return CMD_CONTINUE;
     }
 
@@ -314,16 +329,14 @@ static ItsCmdResult do_process_its_cmd(GICv3ITSState *s, uint32_t devid,
      * Current implementation only supports rdbase == procnum
      * Hence rdbase physical address is ignored
      */
-    rdbase = FIELD_EX64(cte, CTE, RDBASE);
-
-    if (rdbase >= s->gicv3->num_cpu) {
+    if (cte.rdbase >= s->gicv3->num_cpu) {
         return CMD_CONTINUE;
     }
 
     if ((cmd == CLEAR) || (cmd == DISCARD)) {
-        gicv3_redist_process_lpi(&s->gicv3->cpu[rdbase], pIntid, 0);
+        gicv3_redist_process_lpi(&s->gicv3->cpu[cte.rdbase], pIntid, 0);
     } else {
-        gicv3_redist_process_lpi(&s->gicv3->cpu[rdbase], pIntid, 1);
+        gicv3_redist_process_lpi(&s->gicv3->cpu[cte.rdbase], pIntid, 1);
     }
 
     if (cmd == DISCARD) {
@@ -564,12 +577,11 @@ static ItsCmdResult process_movi(GICv3ITSState *s, const uint64_t *cmdpkt)
     MemTxResult res = MEMTX_OK;
     uint32_t devid, eventid, intid;
     uint16_t old_icid, new_icid;
-    uint64_t old_cte, new_cte;
-    uint64_t old_rdbase, new_rdbase;
-    bool ite_valid, cte_valid;
+    bool ite_valid;
     uint64_t num_eventids;
     IteEntry ite = {};
     DTEntry dte;
+    CTEntry old_cte, new_cte;
 
     devid = FIELD_EX64(cmdpkt[0], MOVI_0, DEVICEID);
     eventid = FIELD_EX64(cmdpkt[1], MOVI_1, EVENTID);
@@ -627,50 +639,46 @@ static ItsCmdResult process_movi(GICv3ITSState *s, const uint64_t *cmdpkt)
         return CMD_CONTINUE;
     }
 
-    cte_valid = get_cte(s, old_icid, &old_cte, &res);
-    if (res != MEMTX_OK) {
+    if (get_cte(s, old_icid, &old_cte) != MEMTX_OK) {
         return CMD_STALL;
     }
-    if (!cte_valid) {
+    if (!old_cte.valid) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid command attributes: "
-                      "invalid cte: %"PRIx64"\n",
-                      __func__, old_cte);
+                      "invalid CTE for old ICID 0x%x\n",
+                      __func__, old_icid);
         return CMD_CONTINUE;
     }
 
-    cte_valid = get_cte(s, new_icid, &new_cte, &res);
-    if (res != MEMTX_OK) {
+    if (get_cte(s, new_icid, &new_cte) != MEMTX_OK) {
         return CMD_STALL;
     }
-    if (!cte_valid) {
+    if (!new_cte.valid) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid command attributes: "
-                      "invalid cte: %"PRIx64"\n",
-                      __func__, new_cte);
+                      "invalid CTE for new ICID 0x%x\n",
+                      __func__, new_icid);
         return CMD_CONTINUE;
     }
 
-    old_rdbase = FIELD_EX64(old_cte, CTE, RDBASE);
-    if (old_rdbase >= s->gicv3->num_cpu) {
+    if (old_cte.rdbase >= s->gicv3->num_cpu) {
         qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: CTE has invalid rdbase 0x%"PRIx64"\n",
-                      __func__, old_rdbase);
+                      "%s: CTE has invalid rdbase 0x%x\n",
+                      __func__, old_cte.rdbase);
         return CMD_CONTINUE;
     }
 
-    new_rdbase = FIELD_EX64(new_cte, CTE, RDBASE);
-    if (new_rdbase >= s->gicv3->num_cpu) {
+    if (new_cte.rdbase >= s->gicv3->num_cpu) {
         qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: CTE has invalid rdbase 0x%"PRIx64"\n",
-                      __func__, new_rdbase);
+                      "%s: CTE has invalid rdbase 0x%x\n",
+                      __func__, new_cte.rdbase);
         return CMD_CONTINUE;
     }
 
-    if (old_rdbase != new_rdbase) {
+    if (old_cte.rdbase != new_cte.rdbase) {
         /* Move the LPI from the old redistributor to the new one */
-        gicv3_redist_mov_lpi(&s->gicv3->cpu[old_rdbase],
-                             &s->gicv3->cpu[new_rdbase],
+        gicv3_redist_mov_lpi(&s->gicv3->cpu[old_cte.rdbase],
+                             &s->gicv3->cpu[new_cte.rdbase],
                              intid);
     }
 
-- 
2.25.1
