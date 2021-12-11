Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp2583379lfk;
        Sat, 11 Dec 2021 11:11:47 -0800 (PST)
X-Received: by 2002:a05:6000:1885:: with SMTP id a5mr21972886wri.258.1639249907203;
        Sat, 11 Dec 2021 11:11:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639249907; cv=none;
        d=google.com; s=arc-20160816;
        b=R3gtzG+H5VigSvLODyBYI/4O5MH+3REDCqXKpv3OIBoc8x/YUE8J9fU3ABSzkkRB/m
         00vtPS8IyB4QtHspAgCxJ+uCC3h7mTbH6dDiDuA4ekDeBsE3g8nZ13pk+DzzpDfEw6zR
         DSsAQigvlT1S+x0XN9G6jsP4I/H8CbVJke5V5ediBKvCcXjt3pqaTeiWkpFlYlLPo/4e
         UHVkSfkSEsqVTPDA3GEWuMNG0UvOrv8Tw10wVsGy3M85IGDX28BYL7BR8yLJqX6gbHiX
         NNYmC9TzAtJpmSvDIsDS1gSjvlytsltKtveD/VbZrqYeyp+2qm+EoFtUbffbZEulWf58
         lSNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=RWB1PQojSKR8xBPhbTN8F3p44SE2K4q7LWJViYpI6Y0=;
        b=MbHqHOMEs3f+vCwR3e6a6zq7QGuvtl1kBKZomI/YVn4r0U1x5cVTlUqPmMpfC28caH
         ve3Czm3mGxE2GR8pXHci7QzPLwqEY1paV5MEOkpzXeGDEpBL3gIU1XsLHWdSYVBeQLy8
         zfiDo87uDvfmlP5sMYaOva20HcDdHKsxyPfUufIj0VicJ1qZqwB4zJ4TYqvjVthOAP29
         euxVgXfBLxO/BB9dQeH46IhpsLHcT/NGhpyGitNQAw2+av6dmLwUkRMhlWLsGDmfabfl
         Q94UD1vkt4O3ZiU6N2SE2EZQ2mgoJF+Dkn63JDdQLGjQommTpa3+G9Djf3dOrmd1zwLK
         KqmQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ilCG5Jqi;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l16sor994916wrc.78.2021.12.11.11.11.47
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 11 Dec 2021 11:11:47 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ilCG5Jqi;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RWB1PQojSKR8xBPhbTN8F3p44SE2K4q7LWJViYpI6Y0=;
        b=ilCG5Jqiv8nW1ERNw5WJjav37DfZ8KG623Qr+kFFFfkuKJbmZ52UudOtqX9V5cUyP/
         wUPGwNZUo8iATtL+heOSI+Y+QlTNZRwiY/S8EKBeNa5yD5coUOVKdT98SpiYXDuPfvcG
         SlWd4qHtlgq0ZG50gpkgq1jtuyEWdOXLCfnBSMAKoaBVnNZAE8u9NCdTqm4Td2BMnTBJ
         GOTZTo9FzeRdnmOTjsi/3iuubD24QWLkWq7yLVh3dwnH7OHq9QrgvS6NYDtrw/fhiLsV
         mYxYUwHcff03f8FUnCWVBW6tXtcDYuiplod4n9NbtSiFVbXbWHP3wcQu9LRjN2+M35vO
         1s2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RWB1PQojSKR8xBPhbTN8F3p44SE2K4q7LWJViYpI6Y0=;
        b=x367gDFNRHLsDrtYQQsKlhNyJBZ2YbCz3h0tTdqfBa98rmBblhsbK4gRvN0x1+TA2D
         2es7abPNzwVnuiTSYsok2PdAkPuoeNcbDrqiVv0rGTJmWRrrTXjcDJyc4qC9qNUpp9Dr
         /rx9IS6/pxrKUtykvn+lRpIpAfDno3/pFdLykoMNOBYiTj0ChhAvq6gg1SiGqGdt2Nkz
         gkwFwn41p5YjsPt4ENN4PIBgwiwHAbUxgKzisez6fPxws67BGZPpPNvWNCDMh/27gBhW
         1X6VSlQX0Kir/Sc78jgWnR/PRiYU7HOoFwxqKZ5GkwoZ9TQ7ZV4kCq1rqChd7WKC8MnM
         Ewbg==
X-Gm-Message-State: AOAM533MlfPB+hRGdYpTcZryYMd8k3lAPz/VA4y48PagLG6SOtFJRpY9
	GyPLO2/npmlxWWAyRo2a8ug85+wy
X-Google-Smtp-Source: ABdhPJxMbH1FvBAz8V67EMwQ3Soj3F4w4TKJq9mgE9+lPSeHXfdW6sVTXtM7+nG2I5nQ0wXIhMvCzA==
X-Received: by 2002:adf:c3cf:: with SMTP id d15mr6249900wrg.689.1639249906986;
        Sat, 11 Dec 2021 11:11:46 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id m20sm2205300wmq.11.2021.12.11.11.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Dec 2021 11:11:46 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Shashi Mallela <shashi.mallela@linaro.org>
Subject: [PATCH 11/26] hw/intc/arm_gicv3_its: Use 1ULL when shifting by (DTE.SIZE + 1)
Date: Sat, 11 Dec 2021 19:11:20 +0000
Message-Id: <20211211191135.1764649-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211211191135.1764649-1-peter.maydell@linaro.org>
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: qyGHG+mgW/Iw

The DTE.SIZE field is 5 bits, which means that DTE.SIZE + 1
might in theory be 32. When calculating 1 << (DTE.SIZE + 1)
use 1ULL to ensure that we don't do this arithmetic at 32 bits
and shift the 1 off the end in this case.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 7a217b00f89..d6637229479 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -258,7 +258,7 @@ static bool process_its_cmd(GICv3ITSState *s, uint64_t value, uint32_t offset,
     dte_valid = FIELD_EX64(dte, DTE, VALID);
 
     if (dte_valid) {
-        max_eventid = 1UL << (FIELD_EX64(dte, DTE, SIZE) + 1);
+        max_eventid = 1ULL << (FIELD_EX64(dte, DTE, SIZE) + 1);
 
         ite_valid = get_ite(s, eventid, dte, &icid, &pIntid, &res);
 
@@ -376,7 +376,7 @@ static bool process_mapti(GICv3ITSState *s, uint64_t value, uint32_t offset,
         return result;
     }
     dte_valid = FIELD_EX64(dte, DTE, VALID);
-    max_eventid = 1UL << (FIELD_EX64(dte, DTE, SIZE) + 1);
+    max_eventid = 1ULL << (FIELD_EX64(dte, DTE, SIZE) + 1);
     max_Intid = (1ULL << (GICD_TYPER_IDBITS + 1)) - 1;
 
     if ((devid > s->dt.max_ids) || (icid > s->ct.max_ids)
-- 
2.25.1
