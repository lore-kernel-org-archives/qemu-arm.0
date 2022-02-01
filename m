Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp660800lfk;
        Tue, 1 Feb 2022 11:32:14 -0800 (PST)
X-Received: by 2002:a5d:6d03:: with SMTP id e3mr22362701wrq.41.1643743934515;
        Tue, 01 Feb 2022 11:32:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643743934; cv=none;
        d=google.com; s=arc-20160816;
        b=moA2CKQMjda6vsHWRWegObRrJuH0qyyiIGfoxtAKQM072/0c59T0E536RQzIGoY0RU
         q828BoEvinDP1vGkyt+cgPkw82CLgyeIHFXxWygKS633cwMLq/q1KnsVQAFNt0CzNH5f
         L4Z7L/nSidpqjkojiHj51uhjxCjeSAAy50h/QNnCdASUq4KrfFn9Bij/2+sA2r24h4qR
         N8C/vpuGObAWeJmiwEj0ag6RnH9ICltkWyPYa2XaBWs4v/JuRFMG2O0/P6mwpdh4Z3NE
         LCUHdWftJZviPCO5198f6eWZGOqXZjDOz69pFq7HI3/K50s65H4JQtwEtnppMsbuOk0Q
         0SRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=K0nLPSuvZhVnaozrSckCXHtamDQkkON8hOQuG5n7HiU=;
        b=OHCb4eoXhj1uwGtMQoqZOdZfsbPkikoKhiqfc0RTXT2hSJsUO/SAxptWuuUiIpmKOV
         Mb5GPfB9IDMhZvTnlJaZjMRvUhJbKMZD2aTdMe0+ZG1a2PK9mab2ZXjXAMjKfVrH4N5Z
         L6evk24WHRMmEuioSJNDSCmJtr2L4BpNDuwMOxNiPMbFCbFk+ndckxvDflMJWK4Ppue2
         pHMzIfslxUb+geHiPulZ6rWOFLvKfAb6yMoEUjNb5IxF/VKSROAEtDrd/1Vgp1nkeEES
         3xZOSt9DKpfr1wlePGbdz3P+Z9evYObSUwymBvm47FDdq6edZaKsV+YVtFUCxPd3gJuT
         KdzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yIbPQlnf;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id r12sor13236266wrz.29.2022.02.01.11.32.14
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 01 Feb 2022 11:32:14 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yIbPQlnf;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=K0nLPSuvZhVnaozrSckCXHtamDQkkON8hOQuG5n7HiU=;
        b=yIbPQlnf8scHcROhpf5AY1WQ0ehLAqmw9oatx2UqtJN4Nu0/1VCkOjPQDSomDN3eSE
         LukTVVBtpaG4DD/tZEZZepIyD10g9eYyesHo+AnlybNeEMIuRuzXx4870Gu4YOLlvA3a
         xP1EWxcDheqzHevu+kQwBFNKhGTH98d9UziCrBiDQ+hGlO1zrdH6YVKLW4CDo7crwEfY
         GoZFawtSlm91L9x62E2DXLlgZHG5SCX88Cy50LM4vXL61IM/1+5l7d3o5Z4EgB26sWyd
         e0BnUmpuAtRDcIRmC34MCBbOVC7DXbSuKE42g26quCKYiMb3TeeJRpSVwqihSckOdR74
         5E6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K0nLPSuvZhVnaozrSckCXHtamDQkkON8hOQuG5n7HiU=;
        b=GZQBWW8f8kqs3nt7Sfd+B/QwxD8YGEqZawHOsDpZy1aTfRww9nR3UEYu2tNBctmHzk
         MsXmySFU4ETjKIMupvwS72LgrpE+QaOtEFGxR/iil2HS1m55Os1VJm+WLTEMOZz57sTH
         eBiLc5IVUlWaEASWySdxXrSLo5evczJqb+PLeFRsl3my5SWd+IWhUK1g7xrvlt+ByEOC
         3tUV9a4++7Q2dNSYbZfViMPD0js2I51x3hOKF/we05wpqiCKhDWBHhOELLWUm+oVdu1I
         C+yMWBhriLluPzIC+1/htBLbr8xo1f+AXl6EOhPm4ubWR6zfCi3PD7SfIyU2UMbmH7sX
         HIAQ==
X-Gm-Message-State: AOAM530J5Bw6jT9sfM1/DLBTiNRXgNftHCEMHFEwRUBRti8h3rSbEK1T
	B0R81DsLFJWnCE6OGmI4reArkkBE
X-Google-Smtp-Source: ABdhPJzd7vSWsocdk98qnrgohzJj18Z9UsL34ykboMedi9sr4hR2TeXaeE7/5/6ZyLzEObWW5BbxkA==
X-Received: by 2002:a05:6000:10c:: with SMTP id o12mr22533087wrx.299.1643743934027;
        Tue, 01 Feb 2022 11:32:14 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id z5sm3491265wmp.10.2022.02.01.11.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Feb 2022 11:32:13 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Shashi Mallela <shashi.mallela@linaro.org>
Subject: [PATCH 05/13] hw/intc/arm_gicv3_its: Pass CTEntry to update_cte()
Date: Tue,  1 Feb 2022 19:31:59 +0000
Message-Id: <20220201193207.2771604-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220201193207.2771604-1-peter.maydell@linaro.org>
References: <20220201193207.2771604-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: WIWB6FN9sMCn

Make update_cte() take a CTEntry struct rather than all the fields
of the new CTE as separate arguments.

This brings it into line with the update_dte() API.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 32 +++++++++++++++++---------------
 1 file changed, 17 insertions(+), 15 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 482a71ba73c..b94775fd379 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -418,22 +418,25 @@ static ItsCmdResult process_mapti(GICv3ITSState *s, const uint64_t *cmdpkt,
     return update_ite(s, eventid, &dte, ite) ? CMD_CONTINUE : CMD_STALL;
 }
 
-static bool update_cte(GICv3ITSState *s, uint16_t icid, bool valid,
-                       uint64_t rdbase)
+/*
+ * Update the Collection Table entry for @icid to @cte. Returns true
+ * on success, false if there was a memory access error.
+ */
+static bool update_cte(GICv3ITSState *s, uint16_t icid, const CTEntry *cte)
 {
     AddressSpace *as = &s->gicv3->dma_as;
     uint64_t entry_addr;
-    uint64_t cte = 0;
+    uint64_t cteval = 0;
     MemTxResult res = MEMTX_OK;
 
     if (!s->ct.valid) {
         return true;
     }
 
-    if (valid) {
+    if (cte->valid) {
         /* add mapping entry to collection table */
-        cte = FIELD_DP64(cte, CTE, VALID, 1);
-        cte = FIELD_DP64(cte, CTE, RDBASE, rdbase);
+        cteval = FIELD_DP64(cteval, CTE, VALID, 1);
+        cteval = FIELD_DP64(cteval, CTE, RDBASE, cte->rdbase);
     }
 
     entry_addr = table_entry_addr(s, &s->ct, icid, &res);
@@ -446,27 +449,26 @@ static bool update_cte(GICv3ITSState *s, uint16_t icid, bool valid,
         return true;
     }
 
-    address_space_stq_le(as, entry_addr, cte, MEMTXATTRS_UNSPECIFIED, &res);
+    address_space_stq_le(as, entry_addr, cteval, MEMTXATTRS_UNSPECIFIED, &res);
     return res == MEMTX_OK;
 }
 
 static ItsCmdResult process_mapc(GICv3ITSState *s, const uint64_t *cmdpkt)
 {
     uint16_t icid;
-    uint64_t rdbase;
-    bool valid;
+    CTEntry cte;
 
     icid = cmdpkt[2] & ICID_MASK;
 
-    rdbase = (cmdpkt[2] & R_MAPC_RDBASE_MASK) >> R_MAPC_RDBASE_SHIFT;
-    rdbase &= RDBASE_PROCNUM_MASK;
+    cte.rdbase = (cmdpkt[2] & R_MAPC_RDBASE_MASK) >> R_MAPC_RDBASE_SHIFT;
+    cte.rdbase &= RDBASE_PROCNUM_MASK;
 
-    valid = cmdpkt[2] & CMD_FIELD_VALID_MASK;
+    cte.valid = cmdpkt[2] & CMD_FIELD_VALID_MASK;
 
-    if ((icid >= s->ct.num_entries) || (rdbase >= s->gicv3->num_cpu)) {
+    if ((icid >= s->ct.num_entries) || (cte.rdbase >= s->gicv3->num_cpu)) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "ITS MAPC: invalid collection table attributes "
-                      "icid %d rdbase %" PRIu64 "\n",  icid, rdbase);
+                      "icid %d rdbase %u\n",  icid, cte.rdbase);
         /*
          * in this implementation, in case of error
          * we ignore this command and move onto the next
@@ -475,7 +477,7 @@ static ItsCmdResult process_mapc(GICv3ITSState *s, const uint64_t *cmdpkt)
         return CMD_CONTINUE;
     }
 
-    return update_cte(s, icid, valid, rdbase) ? CMD_CONTINUE : CMD_STALL;
+    return update_cte(s, icid, &cte) ? CMD_CONTINUE : CMD_STALL;
 }
 
 /*
-- 
2.25.1
