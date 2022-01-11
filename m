Received: by 2002:a19:ca48:0:0:0:0:0 with SMTP id h8csp1800945lfj;
        Tue, 11 Jan 2022 09:10:56 -0800 (PST)
X-Received: by 2002:adf:f809:: with SMTP id s9mr4779766wrp.230.1641921056775;
        Tue, 11 Jan 2022 09:10:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641921056; cv=none;
        d=google.com; s=arc-20160816;
        b=NWKcyWiIKzDda/mSS6ZeQkSVKTbP4SyHG/I61oCtFWf8XdDtgBH9ru0pMyxZHoKjjT
         v+yv2PzhXY8Iw7cPQpPZD0wlHDiKCOUhQH6z+cOGx5fxZWuaSWMiz9Z9IcWcaSuyd6xY
         +vfqPzw2HeLUizfEUPoBftH5uuJzZzBTvDmXzQBLAOkhdkE4VxmGQNNue5PQ4fcRoZpI
         Nrt788eBcot7PNPlw5L9w+nhVjXaUZVfe2MAlUsbYq8DFsH9zhtOTCTH6GQiMuS3Cq6d
         HvbMJihgYXjZ4gihhw9+7GBPqT1/Rc8GowxQaQFmDYccSB90CRLmpZ8CHLm2utslInlu
         MGkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=dMGaDtUlyJEJ3dvWwIKR4xUcpNypUeqgEu0z6OQaSkc=;
        b=CxiH5NVycwpoq8jOTyn/KWsV6G+oZLnzZv/ZurnUU7pauRhTPS9ZId0C5dI4mkNBmK
         n0cOCxiyeaIva6yKdD3w0o62Vj+jJSOvERBZnXEJIdbkQKicng2sF9IV/DDrZNcXIs1x
         zKFjkWPcPiMyB7p5f0gNpX1wSmvkLhCrx1QyYu6KbeqtxeQpPXl53T0iLRvA5LXi7muA
         uck44I13c2NSngHHmALMVPiIyokdsbq2/xSJeUBp0YclCZDxHPjwdjK5C+muebH4NHz3
         QQOENfX20mDcglKVexWpZrgD8hlQW/z4yuEK+3Gy0mJvnvtA/Ceku0LHtPPARVrIlc1O
         UcCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F1l2anL8;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l17sor1274554wmq.20.2022.01.11.09.10.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 11 Jan 2022 09:10:56 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F1l2anL8;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dMGaDtUlyJEJ3dvWwIKR4xUcpNypUeqgEu0z6OQaSkc=;
        b=F1l2anL8f77Vvt7h8eVK7CskwcxalUSFMqfDWrXQosjsMABIWsCe3xh84tk2HjE8qY
         SIlrlne48Qb4jz5TpxR8L5PbdZFvLQ6Ro2h01DxBTbPMwu+RXgcNx7cxzET/727ome6d
         gGQCUMb+ih3xNUkuxC9zKiGauScd3Rrvud/byoTLpRKn5b7ouE5QLndtHU0jqce6jaKZ
         Ng+whuiPwvmQr2R1DQfZcI7CLaC9nIjUY7hseo+bBsm1bB9Zmeq3R3ucgc6DOEWyDZcc
         rjHBrGJ9bjVwpOs7gCkgvuQy7etUq1KAo2HhIAbq89qr22eixdJ9wCX34u6buEqedzO8
         K+cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dMGaDtUlyJEJ3dvWwIKR4xUcpNypUeqgEu0z6OQaSkc=;
        b=k2Yt8PMLCR3/IU7eDSTKmXB3MV27ApK4mV3VMYN782CPOpGTZDWbSs+U29iGs4oCB0
         Dg8Lznbn4yGLIHwxLmTRy7hOu5d2+WaWok9iLJYrg2VGP4BdNGUTEyYObYF0OKRwXnb8
         5xbWXCFKoJ38T6kGxXAed+E2gaUDgfqCvAy3U2/uX0N9JZlkaOsa9tQjohGzBErMK1YQ
         S1Q6W9bM78ToEBU+pIFyV5CqvcsgsWIY2Ls3Y/X71opAdIZSmw5ssp5QnEadcoWirzz4
         lLU5uKN7UM2WZPoMeMsGQmvz1xGr07/Y3d+sHQ36ZAjyj/Y2cXLExczryUL6kssK/aCG
         gHog==
X-Gm-Message-State: AOAM53147N9q70MYuPqga6iuHEpfkCSYME7dbysjMSO08Ft61euJQmkh
	tLPTyxLPegND7XSok4WU/iRpiIMO
X-Google-Smtp-Source: ABdhPJw5FCGHS7+hLkLNRSMtOGkoTY8eqPRfCKpwshyaDQrD9tFOlyA66/s4N79zb7D4hjfoXslJhQ==
X-Received: by 2002:a05:600c:5025:: with SMTP id n37mr3315436wmr.18.1641921056521;
        Tue, 11 Jan 2022 09:10:56 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id c7sm11157941wri.21.2022.01.11.09.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 09:10:56 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Shashi Mallela <shashi.mallela@linaro.org>
Subject: [PATCH v2 08/13] hw/intc/arm_gicv3_its: Fix return codes in process_mapti()
Date: Tue, 11 Jan 2022 17:10:43 +0000
Message-Id: <20220111171048.3545974-9-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220111171048.3545974-1-peter.maydell@linaro.org>
References: <20220111171048.3545974-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ErGoyMl1wdwh

Fix process_mapti() to consistently return CMD_STALL for memory
errors and CMD_CONTINUE for parameter errors, as we claim in the
comments that we do.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 5dc6846fe3f..010779a9fdc 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -357,7 +357,7 @@ static ItsCmdResult process_mapti(GICv3ITSState *s, uint64_t value,
     MemTxResult res = MEMTX_OK;
     uint16_t icid = 0;
     uint64_t dte = 0;
-    ItsCmdResult result = CMD_STALL;
+    IteEntry ite = {};
 
     devid = ((value & DEVID_MASK) >> DEVID_SHIFT);
     offset += NUM_BYTES_IN_DW;
@@ -365,7 +365,7 @@ static ItsCmdResult process_mapti(GICv3ITSState *s, uint64_t value,
                                  MEMTXATTRS_UNSPECIFIED, &res);
 
     if (res != MEMTX_OK) {
-        return result;
+        return CMD_STALL;
     }
 
     eventid = (value & EVENTID_MASK);
@@ -381,7 +381,7 @@ static ItsCmdResult process_mapti(GICv3ITSState *s, uint64_t value,
                                  MEMTXATTRS_UNSPECIFIED, &res);
 
     if (res != MEMTX_OK) {
-        return result;
+        return CMD_STALL;
     }
 
     icid = value & ICID_MASK;
@@ -389,7 +389,7 @@ static ItsCmdResult process_mapti(GICv3ITSState *s, uint64_t value,
     dte = get_dte(s, devid, &res);
 
     if (res != MEMTX_OK) {
-        return result;
+        return CMD_STALL;
     }
     dte_valid = FIELD_EX64(dte, DTE, VALID);
     num_eventids = 1ULL << (FIELD_EX64(dte, DTE, SIZE) + 1);
@@ -409,19 +409,17 @@ static ItsCmdResult process_mapti(GICv3ITSState *s, uint64_t value,
          * we ignore this command and move onto the next
          * command in the queue
          */
-    } else {
-        /* add ite entry to interrupt translation table */
-        IteEntry ite = {};
-        ite.itel = FIELD_DP64(ite.itel, ITE_L, VALID, dte_valid);
-        ite.itel = FIELD_DP64(ite.itel, ITE_L, INTTYPE, ITE_INTTYPE_PHYSICAL);
-        ite.itel = FIELD_DP64(ite.itel, ITE_L, INTID, pIntid);
-        ite.itel = FIELD_DP64(ite.itel, ITE_L, DOORBELL, INTID_SPURIOUS);
-        ite.iteh = FIELD_DP32(ite.iteh, ITE_H, ICID, icid);
-
-        result = update_ite(s, eventid, dte, ite) ? CMD_CONTINUE : CMD_STALL;
+        return CMD_CONTINUE;
     }
 
-    return result;
+    /* add ite entry to interrupt translation table */
+    ite.itel = FIELD_DP64(ite.itel, ITE_L, VALID, dte_valid);
+    ite.itel = FIELD_DP64(ite.itel, ITE_L, INTTYPE, ITE_INTTYPE_PHYSICAL);
+    ite.itel = FIELD_DP64(ite.itel, ITE_L, INTID, pIntid);
+    ite.itel = FIELD_DP64(ite.itel, ITE_L, DOORBELL, INTID_SPURIOUS);
+    ite.iteh = FIELD_DP32(ite.iteh, ITE_H, ICID, icid);
+
+    return update_ite(s, eventid, dte, ite) ? CMD_CONTINUE : CMD_STALL;
 }
 
 static bool update_cte(GICv3ITSState *s, uint16_t icid, bool valid,
-- 
2.25.1
