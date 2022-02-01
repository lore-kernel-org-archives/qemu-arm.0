Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp660873lfk;
        Tue, 1 Feb 2022 11:32:19 -0800 (PST)
X-Received: by 2002:adf:9dd0:: with SMTP id q16mr21915308wre.469.1643743939433;
        Tue, 01 Feb 2022 11:32:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643743939; cv=none;
        d=google.com; s=arc-20160816;
        b=qMjkIkJX314qMAHHybsvlvWDhOYLfWPY5eEgP754LvVItgEwytMInroWPBilYDyebw
         jvNOolh9bLxtOcuUYA7++gHG5V+D3CLvqLtsvWAC3f/u8dPuZlbU4NDf3I5Ec1Ux6a/w
         +1wDjKDOUj/V3uLSYc6zwmG8aHaziNNmJoLO7sKggrL+fp8BLIbMUb6sXTjwPulM7HqM
         6ZVf/VYGxgu45Ap9oF3fGm5udkITsWOdhU7seLwvS/csfjQs+vzb/e6pFSI+zj1GpBO+
         TRq3mglpMhB7vfMlpKmGcOynQ18wyuVfHyiIh2aXoeRfdquWwkGfaQsJkqeiforuaaNX
         9kiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=nPzzTIMjX8+LmKQr0pPoJuhI0Z54vBV3jrfkNEOyMpQ=;
        b=t3orodD2HQrEjek55cT/FoyjUVdamOncBp4b/9RPHdJMQBp60pLglE7H5RNsiEU1zo
         3FCZuIeM4Fz+0CjzItKj7TRbQjZg2HDwsqwuZDvu0XpTCTrGspW4M0MuIAgQCIHwKtwD
         T4eW+DRUmOMe5SzkfdLTpfUvY8aWOWtfk9H2JzMbRN2ROogXWuu38a4JBiACsSaj2Md3
         ub/vjaR1TZ18TgmkvHG9KcUkTg5nj5+0yW4HOLeCab0xxDVeKbgEkiz1c1UT0hqWAUWF
         ethqjq7JbZRY9N8r1J3bKq3z714Z64nvbwzAKWnIlxrHBEBd6GhOfbBeoYO3mNYyJ+Qz
         gG3g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Oojr49pt;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id p21sor1783432wmq.28.2022.02.01.11.32.19
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 01 Feb 2022 11:32:19 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Oojr49pt;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nPzzTIMjX8+LmKQr0pPoJuhI0Z54vBV3jrfkNEOyMpQ=;
        b=Oojr49ptSEYDc2UEYTipQgMfjRt/UNcm4OqFRkXC6pQb6P7JNCwP/oYdgDsjNOBtCr
         CPTiMNNDlEfoD4p2idxWxqn0mWR1q6iK+D+wjtfd8AqHfUJnv3iJmqVQJS3hN8LVGp1R
         AV2pstxjV0bIyRMuFlp9hAXXoJdYX5VqL/T1h5xr2TsV42uLGQSouuArdKPjRJmVZR8V
         q7aUnAo+QSRFeCi0ZjsSyZIsGPfrtr/jdLJ5bU6ccb0a3AAHb/mRJ9/zoG4JwbBEMOp4
         Y6XtXrpBIh/6qtlt2RRa/oOxw6txvdnZ8j6xBSFel1Lnv5C0K2X1QXysMKrk2IcMKEbP
         TUFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nPzzTIMjX8+LmKQr0pPoJuhI0Z54vBV3jrfkNEOyMpQ=;
        b=8A6RSF+zr4PZD6SdXCtqYos8fasA+fpDndBoF0yEhpYMTjuKkoYTlSxOogMxqZnrhE
         tBqRaN6/83e7eyqWx/E8JMfuJKzKg4cCJw6NwDJsJO4X7wzZ98nmGT9bBjjoG9Aeh5ZQ
         mTMjhZqfgXWob3EECbZdtSrHuO1AcXJvVsYEdMKYfnMW3hhLIXCbUOcFU0/u2fN3k4C6
         anVRG4Njtvqtuz1GpGISkXLFYlk4QM/OFgWPWCszko19BI23fhcuZF/Khe3bg8DfREtM
         7+dOazmUZ/cmxTVIhV1K1gHNAAja0uusZE5DeakASXjacytN/yP+FOPctxnFjJpr2Gbd
         9UYA==
X-Gm-Message-State: AOAM530p89rIbMx+CQzfT2SghCP/JJzeTpiA8YVgyAjP2H4TNsMhPXWH
	59i3bUKoisvgMS4baLt9APPGEYuo
X-Google-Smtp-Source: ABdhPJwLvw482/QHDjdabL6RHWYokOnjB7qshV5QFlECJVTiwabJPRSt3eU5JIF8Fy5n90WTBeFMqw==
X-Received: by 2002:a05:600c:ac7:: with SMTP id c7mr3128130wmr.61.1643743939232;
        Tue, 01 Feb 2022 11:32:19 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id z5sm3491265wmp.10.2022.02.01.11.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Feb 2022 11:32:18 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Shashi Mallela <shashi.mallela@linaro.org>
Subject: [PATCH 11/13] hw/intc/arm_gicv3_its: In MAPC with V=0, don't check rdbase field
Date: Tue,  1 Feb 2022 19:32:05 +0000
Message-Id: <20220201193207.2771604-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220201193207.2771604-1-peter.maydell@linaro.org>
References: <20220201193207.2771604-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: IMPgwtdrOagI

In the MAPC command, if V=0 this is a request to delete a collection
table entry and the rdbase field of the command packet will not be
used.  In particular, the specification says that the "UNPREDICTABLE
if rdbase is not valid" only applies for V=1.

We were doing a check-and-log-guest-error on rdbase regardless of
whether the V bit was set, and also (harmlessly but confusingly)
storing the contents of the rdbase field into the updated collection
table entry.  Update the code so that if V=0 we don't check or use
the rdbase field value.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 9735d609df2..069991f7f36 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -468,21 +468,21 @@ static ItsCmdResult process_mapc(GICv3ITSState *s, const uint64_t *cmdpkt)
     CTEntry cte;
 
     icid = cmdpkt[2] & ICID_MASK;
-
-    cte.rdbase = (cmdpkt[2] & R_MAPC_RDBASE_MASK) >> R_MAPC_RDBASE_SHIFT;
-    cte.rdbase &= RDBASE_PROCNUM_MASK;
-
     cte.valid = cmdpkt[2] & CMD_FIELD_VALID_MASK;
+    if (cte.valid) {
+        cte.rdbase = (cmdpkt[2] & R_MAPC_RDBASE_MASK) >> R_MAPC_RDBASE_SHIFT;
+        cte.rdbase &= RDBASE_PROCNUM_MASK;
+    } else {
+        cte.rdbase = 0;
+    }
 
-    if ((icid >= s->ct.num_entries) || (cte.rdbase >= s->gicv3->num_cpu)) {
+    if (icid >= s->ct.num_entries) {
+        qemu_log_mask(LOG_GUEST_ERROR, "ITS MAPC: invalid ICID 0x%d", icid);
+        return CMD_CONTINUE;
+    }
+    if (cte.valid && cte.rdbase >= s->gicv3->num_cpu) {
         qemu_log_mask(LOG_GUEST_ERROR,
-                      "ITS MAPC: invalid collection table attributes "
-                      "icid %d rdbase %u\n",  icid, cte.rdbase);
-        /*
-         * in this implementation, in case of error
-         * we ignore this command and move onto the next
-         * command in the queue
-         */
+                      "ITS MAPC: invalid RDBASE %u ", cte.rdbase);
         return CMD_CONTINUE;
     }
 
-- 
2.25.1
