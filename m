Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp2583444lfk;
        Sat, 11 Dec 2021 11:11:51 -0800 (PST)
X-Received: by 2002:a5d:5646:: with SMTP id j6mr21164657wrw.401.1639249911012;
        Sat, 11 Dec 2021 11:11:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639249911; cv=none;
        d=google.com; s=arc-20160816;
        b=0+VHyF5Gmz8QtbqPO7CUtWn0fArEpxeTYmCUMtCCMPP+OjMb00S4nLsuIYbuXhowcb
         2hxMjXHpTcV4o1koWLIIS0jQ2xRakKfvZnEhpQ4Kvq5zoKjWXxEhiHvE5DeFdEh83vyX
         hQhCj8ATS5+uitAlPt8ETfowS409Cq/EbWLLbotmqn1FAMUO2+HwFa60xSnvetjBll2x
         JI/VWfE24o/3+xDx10Y0JwAwiupyJwjsDkLBrqKTOl3YGTkp+t/hc+lA3r4IdrP8NLii
         AZ3MU1Dwsto94LPc5iLoH5ckVmTG+HTpxufIgJYX4sDDbAXFncslPmwoqV6jchCMviLn
         Q/YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=73xR2Mq0ouF8QlBPepTZ6f4sM3isCU/HqwwjiWFia2k=;
        b=jOqIA/Fg8A+Mx4+rMA46K31azTHLSDrJF1bolc1oCw85hz1YwYgtOj7Kx+zFwEWqQt
         pp9+Aw32oQnTCiExW0K36FDhMuiPTtTuWQn21w9GHpoKkbtoLrIJstuXQFS0gKn2VbX6
         t6BSlfvDDsZC5FJwHBw8ZflJFLRA2OXu14PQT1lpBw/zI+eIZxyzUsboTsehh1UHvQOy
         rGXc4HW1MWQVRsuLSJs0OYYoPdBThn4Kh4k9T10HWRfZZwVws0tBWeoTibA/MP2StttW
         peeO7zQobqPkoqyvSFq8qvqo+bgcj0ba3VmpV0XgyJP+GRCUXcWcJf2WoZV2K8dMEaXJ
         f/sg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=suenabLV;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id n30sor1052614wms.2.2021.12.11.11.11.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 11 Dec 2021 11:11:51 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=suenabLV;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=73xR2Mq0ouF8QlBPepTZ6f4sM3isCU/HqwwjiWFia2k=;
        b=suenabLVdPNySF14MKiYlG9tyeo/aKiBXQh4rRjIh9E5yB9EI8gTV2kVeuetlKdzSR
         Rr9sLo40wbt+5D4PO+6yUz+jtHb+ZCktawFFaSDiDUW/gnBTUadNe/lFEKqrWmNqy5tF
         sMMpSD5oyrayAjhZaVXYl2r+FWFvspKoNIPKmCn6QhNLIwFxFm6k1U1epahTw3+YTHX6
         SpGNVoRyIRrSzd22yuLySzJAoG8ofuZAVS0AgZKeOhsWQb4vYUgkwszcpJ639xzR/vRv
         LQxb3o4dmkT4FCEZs3y1xQ9oRORiiv+6jYZsjMetjKzGL9xv3WBhRN3VshLRp7BNMYPJ
         iknw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=73xR2Mq0ouF8QlBPepTZ6f4sM3isCU/HqwwjiWFia2k=;
        b=EBguuak0fPfZZH8rx0s3+E4ynYR6+755yusYGBZm9cT2q0Vd/H1OMtdHgtr/hUk9GW
         rQPoA6TAGv/URdkz9CCMy45rquGOQwBhwy1Dgi2YXEslTDAu4fBs8W5LTxmZWCi70hG+
         zbBh6U1WsLrZmmvnNaoFjWU/hXOxKN0iuTOzoXGdYmkwt3FtROiKNqwyFqDrqRHq8uWS
         57BB8yQSOaAA9gBkgjaNFIqZeNqRPtw4HYD3BtcBWv+6zc2fO+CXkP3ZZmoLtX6PUMh/
         ul+NAWLBxHsrUhqY/HsT8kyHhUNeSxcdjct4L9Ct1WoShdiv9cm4jG/PCqwotxQH7Nr3
         qASA==
X-Gm-Message-State: AOAM5324C9eBy4nzPXgztKeh8X7jyC6zmR6OYKB7U3bxhAajc5kQt4hS
	m0qP9CCFwiB7OjRDWifTUPUgUTpS
X-Google-Smtp-Source: ABdhPJzOVnlWH2U55UDj0xbUF3xNLIvldIgRqlJCfjNA+/DbA8h1/Djtr9yMidWdDEpo/q1AEOy7ag==
X-Received: by 2002:a05:600c:19c8:: with SMTP id u8mr25057905wmq.155.1639249910713;
        Sat, 11 Dec 2021 11:11:50 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id m20sm2205300wmq.11.2021.12.11.11.11.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Dec 2021 11:11:50 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Shashi Mallela <shashi.mallela@linaro.org>
Subject: [PATCH 17/26] hw/intc/arm_gicv3_its: Convert int ID check to num_intids convention
Date: Sat, 11 Dec 2021 19:11:26 +0000
Message-Id: <20211211191135.1764649-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211211191135.1764649-1-peter.maydell@linaro.org>
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: u/Mrj8PhhWjP

The bounds check on the number of interrupt IDs is correct, but
doesn't match our convention; change the variable name, initialize it
to the 2^n value rather than (2^n)-1, and use >= instead of > in the
comparison.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 8561392fdbe..e6b380f663c 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -336,7 +336,7 @@ static bool process_mapti(GICv3ITSState *s, uint64_t value, uint32_t offset,
     AddressSpace *as = &s->gicv3->dma_as;
     uint32_t devid, eventid;
     uint32_t pIntid = 0;
-    uint32_t num_eventids, max_Intid;
+    uint32_t num_eventids, num_intids;
     bool dte_valid;
     MemTxResult res = MEMTX_OK;
     uint16_t icid = 0;
@@ -377,11 +377,11 @@ static bool process_mapti(GICv3ITSState *s, uint64_t value, uint32_t offset,
     }
     dte_valid = FIELD_EX64(dte, DTE, VALID);
     num_eventids = 1ULL << (FIELD_EX64(dte, DTE, SIZE) + 1);
-    max_Intid = (1ULL << (GICD_TYPER_IDBITS + 1)) - 1;
+    num_intids = 1ULL << (GICD_TYPER_IDBITS + 1);
 
     if ((devid >= s->dt.num_ids) || (icid >= s->ct.num_ids)
             || !dte_valid || (eventid >= num_eventids) ||
-            (((pIntid < GICV3_LPI_INTID_START) || (pIntid > max_Intid)) &&
+            (((pIntid < GICV3_LPI_INTID_START) || (pIntid >= num_intids)) &&
              (pIntid != INTID_SPURIOUS))) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid command attributes "
-- 
2.25.1
