Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp2583476lfk;
        Sat, 11 Dec 2021 11:11:53 -0800 (PST)
X-Received: by 2002:a05:600c:4108:: with SMTP id j8mr25372088wmi.139.1639249913868;
        Sat, 11 Dec 2021 11:11:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639249913; cv=none;
        d=google.com; s=arc-20160816;
        b=Pw9cwS+J9JurzMiLSOsp6qRYMJSNs73YLOeoY6H+pAJmoII5jYVtEA8JmTCH5M7IAm
         KMcSIhZ5tUf5V9MKoLQlyvEhO+7acmjXCQUXNqjVEWLCo4Qu00QsTPjjZJb4nABSYnfw
         UUrCQiDfuJStxWAzsvwXpGJtVYSeMkOS9CvfAUhVSID49YtJXHW81iQNMyYNxNKkSg0q
         nJocNHjNJTdaL4UPdMcVs1OlwyCDdGRFRflNd91zbvahipXUOkYAyM0g29EwuzFXaBa/
         YwaIQartBjqoFR/Js2ngTRjwPs9VChvAd1NglUZRf+uKM9HPnDLsmJ3llaMdXVPbUB7H
         /tgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=d84nUQsl/62yYA2cXx0hg5Dh0WRkFm1Ipdz1tRw31fY=;
        b=cZb1XJ4FQ91zV6roYmMCLzHHoZGt7HzCaEo5+VRS8fyoyH58e3lRGjkZNTyXAQUQHx
         3snFs2sGaLKfvf0E7lrMdFI/iLfk/Ag8sG9vpASsVy5XsXptyxkz2VQOOkYPkMOUKa3p
         IUugvQsRp3jilLdE7DiC22O8KrMeQuUm7QthxO6l1qZWCHb1GNmBfxuvZMEYz3PFE7CI
         QVrRn/vsGRQh1F2IJGFkn0fVbbc7KCmPRCAxWUQbTJo4F2QcnP4eHwPbiPouisHFYlHu
         fjPjnf0Je+3igCEAVrpwRUmWjlJu9z8c/Q8mcnOruBkkcDSZHkbF+5XYXFLl5+S3Peoh
         /xug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W7IUKAOC;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x18sor4212883wro.7.2021.12.11.11.11.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 11 Dec 2021 11:11:53 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=W7IUKAOC;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=d84nUQsl/62yYA2cXx0hg5Dh0WRkFm1Ipdz1tRw31fY=;
        b=W7IUKAOCffWvViOo6v5jZDt5IChO+9DVIRpAECDEVFgrB1nWjlwk5b/2hxy7vSN3D6
         9Rdxhq22/vWdSH4H3xmBc4lJ2/TUtJAOjx1Rjcz2q/zSYc0KIDueD8MoOAwb8lUgxA8Y
         pXPIKPG5QRx53UJBFMHofxBjjmVwjw8UGoifgsdkGsksV9LCgjJqzC9akhlJ738jmFk3
         RijDdIZ8wLmhwegILDUVdMfXVB+dEEbPj6yfRa8Y+gnlgFrsRhXDjLhUMG1Joc6KAw/M
         bz8NiN8X25j6u4PjTW40VfvWPsPu9+L3SO68Heynp+aHQhEJbjC+OZGIgxoS3TZNi/JQ
         SZ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=d84nUQsl/62yYA2cXx0hg5Dh0WRkFm1Ipdz1tRw31fY=;
        b=yD6g0rnqmPHgVeCPCdTX8OGeieuMLttETeyUl7tYofhLWGsr1xeeBs1LeHWKLTBldJ
         YXvU3IIxmpjH3RMyrsY2LFng8MnXkd0WGTvcEsHxnZE4rluZ/+D8rGGqxf6+5ENwoo8q
         IsOPzBs5jm9kNNAYsoO/uvTCAQDH8PeAJKp140U265D6FXEGhC51Gf59A2enGPTZK0lY
         lfTmB4z5HYZTvCTVTeExgdfe+hkaEYeW7oVmOfeeBvMjfC0WJ/gQ2zhIl8ynBA8yXP1t
         Hqril0c9QsemUkHmBTqsOHD/hGu2Se6Szy445GZmflxISbJek4Ecp4hYsbuX5DKQCAsk
         1IPw==
X-Gm-Message-State: AOAM5313vWfwVr5NVG3NBbmI1KVhE72QoP7BIV/HBGytcWuVwYqB2OAu
	gvoHNaf661MwVpU9dQuUdFZtN7xo
X-Google-Smtp-Source: ABdhPJzFztVZlkEeS6hGjDwKl4qArczseJvfehNrB3n67btltUOUr7a+2QOadOh0xcYV+4WMUlQeyA==
X-Received: by 2002:a05:6000:15c6:: with SMTP id y6mr22015266wry.422.1639249913517;
        Sat, 11 Dec 2021 11:11:53 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id m20sm2205300wmq.11.2021.12.11.11.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Dec 2021 11:11:53 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Shashi Mallela <shashi.mallela@linaro.org>
Subject: [PATCH 21/26] hw/intc/arm_gicv3_its: Fix return codes in process_its_cmd()
Date: Sat, 11 Dec 2021 19:11:30 +0000
Message-Id: <20211211191135.1764649-22-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211211191135.1764649-1-peter.maydell@linaro.org>
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: YGIu855MYtl/

Fix process_its_cmd() to consistently return CMD_STALL for
memory errors and CMD_CONTINUE for parameter errors, as
we claim in the comments that we do.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 59dd564d91c..3a2254ea7c7 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -248,7 +248,6 @@ static ItsCmdResult process_its_cmd(GICv3ITSState *s, uint64_t value,
     bool ite_valid = false;
     uint64_t cte = 0;
     bool cte_valid = false;
-    ItsCmdResult result = CMD_STALL;
     uint64_t rdbase;
 
     if (cmd == NONE) {
@@ -262,7 +261,7 @@ static ItsCmdResult process_its_cmd(GICv3ITSState *s, uint64_t value,
     }
 
     if (res != MEMTX_OK) {
-        return result;
+        return CMD_STALL;
     }
 
     eventid = (value & EVENTID_MASK);
@@ -270,7 +269,7 @@ static ItsCmdResult process_its_cmd(GICv3ITSState *s, uint64_t value,
     dte = get_dte(s, devid, &res);
 
     if (res != MEMTX_OK) {
-        return result;
+        return CMD_STALL;
     }
     dte_valid = FIELD_EX64(dte, DTE, VALID);
 
@@ -280,7 +279,7 @@ static ItsCmdResult process_its_cmd(GICv3ITSState *s, uint64_t value,
         ite_valid = get_ite(s, eventid, dte, &icid, &pIntid, &res);
 
         if (res != MEMTX_OK) {
-            return result;
+            return CMD_STALL;
         }
 
         if (ite_valid) {
@@ -288,14 +287,14 @@ static ItsCmdResult process_its_cmd(GICv3ITSState *s, uint64_t value,
         }
 
         if (res != MEMTX_OK) {
-            return result;
+            return CMD_STALL;
         }
     } else {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid command attributes: "
                       "invalid dte: %"PRIx64" for %d (MEM_TX: %d)\n",
                       __func__, dte, devid, res);
-        return result;
+        return CMD_CONTINUE;
     }
 
 
@@ -307,7 +306,7 @@ static ItsCmdResult process_its_cmd(GICv3ITSState *s, uint64_t value,
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid command attributes: devid %d>=%d",
                       __func__, devid, s->dt.num_ids);
-
+        return CMD_CONTINUE;
     } else if (!dte_valid || !ite_valid || !cte_valid) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid command attributes: "
@@ -316,10 +315,12 @@ static ItsCmdResult process_its_cmd(GICv3ITSState *s, uint64_t value,
                       dte_valid ? "valid" : "invalid",
                       ite_valid ? "valid" : "invalid",
                       cte_valid ? "valid" : "invalid");
+        return CMD_CONTINUE;
     } else if (eventid >= num_eventids) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid command attributes: eventid %d > %d\n",
                       __func__, eventid, num_eventids);
+        return CMD_CONTINUE;
     } else {
         /*
          * Current implementation only supports rdbase == procnum
@@ -328,7 +329,7 @@ static ItsCmdResult process_its_cmd(GICv3ITSState *s, uint64_t value,
         rdbase = FIELD_EX64(cte, CTE, RDBASE);
 
         if (rdbase >= s->gicv3->num_cpu) {
-            return result;
+            return CMD_CONTINUE;
         }
 
         if ((cmd == CLEAR) || (cmd == DISCARD)) {
@@ -340,11 +341,10 @@ static ItsCmdResult process_its_cmd(GICv3ITSState *s, uint64_t value,
         if (cmd == DISCARD) {
             IteEntry ite = {};
             /* remove mapping from interrupt translation table */
-            result = update_ite(s, eventid, dte, ite) ? CMD_CONTINUE : CMD_STALL;
+            return update_ite(s, eventid, dte, ite) ? CMD_CONTINUE : CMD_STALL;
         }
+        return CMD_CONTINUE;
     }
-
-    return result;
 }
 
 static ItsCmdResult process_mapti(GICv3ITSState *s, uint64_t value,
-- 
2.25.1
