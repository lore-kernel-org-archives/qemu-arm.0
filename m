Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp2583438lfk;
        Sat, 11 Dec 2021 11:11:50 -0800 (PST)
X-Received: by 2002:adf:d190:: with SMTP id v16mr21032149wrc.381.1639249910418;
        Sat, 11 Dec 2021 11:11:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639249910; cv=none;
        d=google.com; s=arc-20160816;
        b=0ImiVDMFVByXGDxI5V7wvtjC0zEDAmoVB+Q7XFR/rRgjZmP83YJrnCJpA6P8XUp18C
         Ob+zq4a3+qyA2crSTEDjs0md8t9Pd8zlCnE2ujRNZBofR0MeEWU649xUg+XW4xyoNURC
         GJIsYunN2g1rTCYHEajcHeN8L8iZJ0BVTL7GnXLLukM7IfxGJDwDsSSZMM3khEcmx9KZ
         BMkxUjEJgJbhwclDofksuk7GxM/HirA3w3JI1LyX0YQ3ZtNd4ksmUmK87hBaDXLOlI7D
         wqLlfi98bsz5aDN9g4z9sy1H7Dy7zJ0ir7NCZq2me1dtTo9FF6TuTSx+rQfi6De5PGca
         GG7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=I3wAglRq0v7J28qeq3AcCdmuBqd8GqSly1K8jDYrRM4=;
        b=kTVutShM7Ao5mkFWRfllgi3q8u7cT+GvvnQKb+npXt9oSUZQV0zJdZBd/ETwDUV924
         YeCRUj9nuLkKBAZFBPV23bFbWr6E5U8Le3d/ZsRZ0FqrNhfXi6MwLlElV8KzPXIbNooI
         vCLC9CDmci9DyqwDFfEMwXumnujmpQzv3fx2IFmRgChhAj4piwsm1HA/5517EWj6BCOU
         PjrFQFEEkgVNvfEtV6da/C8ihfajapHN3lPadHv8Yjp7o82rJ4lzvoJYqMBnzKRNRp7f
         onXMdFiAn8vkIZLEb/dhU1YhsVDcDEkMw4fciNfQSvTx6VH0je8u2H2yW1ZT4WOpi6g+
         Ejgw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OBC8biFB;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id u15sor1058137wmq.7.2021.12.11.11.11.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 11 Dec 2021 11:11:50 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OBC8biFB;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I3wAglRq0v7J28qeq3AcCdmuBqd8GqSly1K8jDYrRM4=;
        b=OBC8biFBeuU/siCqS1vhHI4uu4XzgzQg3UVG/lR+TlCYPM3dCHp1duFU46iiJSWcD8
         ucOjXIKtSwnqS1YAaIW0ogbTAz1gcu3lLbLviIdEY1JgYAgRgqvAKSkhAGBH8mOI/D7n
         cSnXIBawCds1F8TL+8tjyIsC+QCs8opIz1IppZcElySH3MQ/f5s+wIZxWJsx1AQk8a5C
         LFGFLr6LlTJTa8Zv0jYJWo0zRkhDG4aZm+JbelywUnqmftCDSkqRBkuHnwxcPXtI/pq+
         VHL/IzTQ1WZstYPTPV+DLA5rM5vcRWH5vZc5cyRlOoyhdW/VrCCAB88v858IzJBN4gly
         isVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I3wAglRq0v7J28qeq3AcCdmuBqd8GqSly1K8jDYrRM4=;
        b=DLiVhyFR0MJKuDlDcSsIKOxZ3chVWVlxpR7NhwOmRup+fEk6Jim6Xdo8rLvZqCwWUo
         MWGnyCJ98+GDQHITaQ/KSBgKv+TnFWF0u2tT49YZoivFoccI8Y9S6NQ1HaUdaiM/6vVG
         H1FAY3eZWks5L6jIaDByMKj9unb7VMKDULE+8IyJJkwQN/Ycl/40YvFrOvo1eomknWkn
         9O3FaGETXbDRdCBQryB4nCze4Qxobes11k7bfMAcsfGtREB2Tf8Vs++ymRDZxNRUb1UO
         gz1NrA+elwA8NOZEbFIaFJBvN1z8RX3Y3O27RbHV/rCDqvLbI63VV/Txn+tkX8FbmJAA
         tx5w==
X-Gm-Message-State: AOAM5313wumZUp4OBaDK4keVPokkGTM5+8e2U7pBggGhD9STcKhuIN6x
	1KKaoWCt82gp9zQ7NEf5+moL3LA2
X-Google-Smtp-Source: ABdhPJz49mMIsEzltdJe9rgj8tddo8bntoycyyVCNFq225zVlpjVt6tXbyTCdAEyii8POyDE8lTsUw==
X-Received: by 2002:a7b:cc94:: with SMTP id p20mr25310546wma.162.1639249910150;
        Sat, 11 Dec 2021 11:11:50 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id m20sm2205300wmq.11.2021.12.11.11.11.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Dec 2021 11:11:49 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Shashi Mallela <shashi.mallela@linaro.org>
Subject: [PATCH 16/26] hw/intc/arm_gicv3_its: Fix event ID bounds checks
Date: Sat, 11 Dec 2021 19:11:25 +0000
Message-Id: <20211211191135.1764649-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211211191135.1764649-1-peter.maydell@linaro.org>
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: KEHzYWLWjnew

In process_its_cmd() and process_mapti() we must check the
event ID against a limit defined by the size field in the DTE,
which specifies the number of ID bits minus one. Convert
this code to our num_foo convention, fixing the off-by-one error.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index e4105282b57..8561392fdbe 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -225,7 +225,7 @@ static bool process_its_cmd(GICv3ITSState *s, uint64_t value, uint32_t offset,
     MemTxResult res = MEMTX_OK;
     bool dte_valid;
     uint64_t dte = 0;
-    uint32_t max_eventid;
+    uint32_t num_eventids;
     uint16_t icid = 0;
     uint32_t pIntid = 0;
     bool ite_valid = false;
@@ -258,7 +258,7 @@ static bool process_its_cmd(GICv3ITSState *s, uint64_t value, uint32_t offset,
     dte_valid = FIELD_EX64(dte, DTE, VALID);
 
     if (dte_valid) {
-        max_eventid = 1ULL << (FIELD_EX64(dte, DTE, SIZE) + 1);
+        num_eventids = 1ULL << (FIELD_EX64(dte, DTE, SIZE) + 1);
 
         ite_valid = get_ite(s, eventid, dte, &icid, &pIntid, &res);
 
@@ -299,10 +299,10 @@ static bool process_its_cmd(GICv3ITSState *s, uint64_t value, uint32_t offset,
                       dte_valid ? "valid" : "invalid",
                       ite_valid ? "valid" : "invalid",
                       cte_valid ? "valid" : "invalid");
-    } else if (eventid > max_eventid) {
+    } else if (eventid >= num_eventids) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid command attributes: eventid %d > %d\n",
-                      __func__, eventid, max_eventid);
+                      __func__, eventid, num_eventids);
     } else {
         /*
          * Current implementation only supports rdbase == procnum
@@ -336,7 +336,7 @@ static bool process_mapti(GICv3ITSState *s, uint64_t value, uint32_t offset,
     AddressSpace *as = &s->gicv3->dma_as;
     uint32_t devid, eventid;
     uint32_t pIntid = 0;
-    uint32_t max_eventid, max_Intid;
+    uint32_t num_eventids, max_Intid;
     bool dte_valid;
     MemTxResult res = MEMTX_OK;
     uint16_t icid = 0;
@@ -376,11 +376,11 @@ static bool process_mapti(GICv3ITSState *s, uint64_t value, uint32_t offset,
         return result;
     }
     dte_valid = FIELD_EX64(dte, DTE, VALID);
-    max_eventid = 1ULL << (FIELD_EX64(dte, DTE, SIZE) + 1);
+    num_eventids = 1ULL << (FIELD_EX64(dte, DTE, SIZE) + 1);
     max_Intid = (1ULL << (GICD_TYPER_IDBITS + 1)) - 1;
 
     if ((devid >= s->dt.num_ids) || (icid >= s->ct.num_ids)
-            || !dte_valid || (eventid > max_eventid) ||
+            || !dte_valid || (eventid >= num_eventids) ||
             (((pIntid < GICV3_LPI_INTID_START) || (pIntid > max_Intid)) &&
              (pIntid != INTID_SPURIOUS))) {
         qemu_log_mask(LOG_GUEST_ERROR,
-- 
2.25.1
