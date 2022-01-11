Received: by 2002:a19:ca48:0:0:0:0:0 with SMTP id h8csp1800892lfj;
        Tue, 11 Jan 2022 09:10:52 -0800 (PST)
X-Received: by 2002:adf:fd46:: with SMTP id h6mr4632538wrs.192.1641921052623;
        Tue, 11 Jan 2022 09:10:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641921052; cv=none;
        d=google.com; s=arc-20160816;
        b=Xrq7b1ddJhjyM8LoyMrWI+wwKMAz6Jt8WHO5ycYPlF6aUysHl8iG1GOQ48V55xNovL
         65XGK04Raoiqr171OTkmyMHxBvhRFZmB/25LnyMRLX4yGf3y/UtJFCOY/pKv1IezcStW
         RxqJ49F2Tt7Umyio8LI3HlPeMXCekjmYGSVMp7JNkXmAnsplX7YkwnaSZds6BVe5t5z6
         5OLd3Eb0zSNQPRHW6SeCXh/flroDnjNebafr0hj1OW3pqqSidIa1++q2RadDgg81+kPo
         a+tAN6jIvyjopi605qESRNBAhYEYZ9mbyJvZafr/vlbK6mGxS2VLIHaONpgZGot8xqUR
         hPlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=wHSwNCH5vyw/b88YEepKg5paQSwMAnG4i0aTBoYVuiw=;
        b=LdwBxLvLaNuJV11jeOg2daJZhTf2AXtripiuQT4VZ1/TmzqGk93NQE2rOs8LSoGB2u
         HPKTLMzRhuMRB4p1C5F7qSG0nomrcwGjSAwjzkWLeMsKP3ithXItmoTrIsDfANkvwu6l
         qTrlZMHeNMvFj3dTrZU8bJ+NcXVrEV60FFOEx4a8ldNQhvCPcgC/40aPCCu5w9ln6V7o
         ja85rpGHy1VVTGx/R5ps/QgE+e7qb7/la7aLFNO3OFPHybJGmUQMLtj0B5YqgX5F0VTx
         704DIHloTttpQVO/XyTH0/tydmF3AVjNE/maYTz6WbMcPMuwFsN+LJpm6P3IpN8HxTwM
         gicA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZTvx+Hz7;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id az40sor1247203wmb.23.2022.01.11.09.10.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 11 Jan 2022 09:10:52 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZTvx+Hz7;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wHSwNCH5vyw/b88YEepKg5paQSwMAnG4i0aTBoYVuiw=;
        b=ZTvx+Hz7MBeBL22NrZgMLVo//79SaBUYmYIgtrMR2m9UHU9/QoyB2O64wyjw0UKSIg
         vK+2bEOoi5LKg6n0PrVNucArdssVVmWfZgHU4Zb0TVd7WM6U7q7iEmAjqoIXpmJJIr/5
         7KOTlCo7iw+pwYM7MgGa3oz0f5KDOytZu9l91LIm6VNWTTFyzMVAHJ4McfVY0+Pmbh56
         cnvF8ZSUYXhfO/ZJD3eCw4tgyynJxUORNkAE4sOxTSH0LjAj6GR4ic+z1mUrhhRSe5nH
         JDHcg19K4UKhK1Xoe+FJtPpeguoDIYTxYbuLP2Jdi0rwFveWeVelooIk7Hps9bqZGwj2
         aPCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wHSwNCH5vyw/b88YEepKg5paQSwMAnG4i0aTBoYVuiw=;
        b=xnqj8DouEw5lWjO73w5d1a0MrVRuWVyrbBuGdUBSsKGyujdGpiX4H9P2dSulXkQMT+
         GqnV5ZmDLh+xUD9CwbLDyC+QRCFkc7Wbu5uALOHPH4VCsb97f5bpkI+4mfzfv8suCOsB
         gICQaV8I3CEY3QJMvbUlYDfetjKct1CeMwrQ5wSuWgBDvdJKjGTOUJ9q+2J6L8YiR1s+
         7V/Bu1jSgiN21qBUJUkMJfy7gtoIMrEjizGTaRZ24e8Lm9lMcR7fYfrbFEKaPi/GBx90
         HyC0cF/PY/d6/cKOrNBtJ+P01XkVLaFpA0+9QLz9GV8jM0AevFgy4gQ3Y0ROb3wqkwln
         rT3Q==
X-Gm-Message-State: AOAM5339q9DPbGv7wIHK4shHOEcyWnSa0qIwEydlkWyT2/K0ijForwvN
	MW59r6M3lMuCI46Ddvam4wSZg4lf3ngxjoHU
X-Google-Smtp-Source: ABdhPJw5qVogQuV2jfl44pTTyWdbG8j5iw5wsCvNEMk6lgEECGetxx6byLLluFpVWtvh92+0sOOf8g==
X-Received: by 2002:a05:600c:22da:: with SMTP id 26mr3292021wmg.121.1641921052374;
        Tue, 11 Jan 2022 09:10:52 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id c7sm11157941wri.21.2022.01.11.09.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 09:10:52 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Shashi Mallela <shashi.mallela@linaro.org>
Subject: [PATCH v2 02/13] hw/intc/arm_gicv3_its: Convert int ID check to num_intids convention
Date: Tue, 11 Jan 2022 17:10:37 +0000
Message-Id: <20220111171048.3545974-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220111171048.3545974-1-peter.maydell@linaro.org>
References: <20220111171048.3545974-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: kSRJWs5eYkgt

The bounds check on the number of interrupt IDs is correct, but
doesn't match our convention; change the variable name, initialize it
to the 2^n value rather than (2^n)-1, and use >= instead of > in the
comparison.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 6d11fa02040..5919b1a3b7f 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -338,7 +338,7 @@ static bool process_mapti(GICv3ITSState *s, uint64_t value, uint32_t offset,
     uint32_t devid, eventid;
     uint32_t pIntid = 0;
     uint64_t num_eventids;
-    uint32_t max_Intid;
+    uint32_t num_intids;
     bool dte_valid;
     MemTxResult res = MEMTX_OK;
     uint16_t icid = 0;
@@ -379,11 +379,11 @@ static bool process_mapti(GICv3ITSState *s, uint64_t value, uint32_t offset,
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
