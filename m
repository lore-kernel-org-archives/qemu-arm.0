Received: by 2002:a19:ca48:0:0:0:0:0 with SMTP id h8csp1800926lfj;
        Tue, 11 Jan 2022 09:10:55 -0800 (PST)
X-Received: by 2002:a05:6000:18a5:: with SMTP id b5mr4766811wri.267.1641921055379;
        Tue, 11 Jan 2022 09:10:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641921055; cv=none;
        d=google.com; s=arc-20160816;
        b=0WhB+NH3G4aQ2QGdYSj70Rc5dVydTGa8JIk+ESDRR90aSNnHdTtt5lfboQF1dtrrkb
         SM639VsCbDIYebJWmbWQW1Qg61dEGAiPHSZufLg0/VSWm7wfoZrSgPYl4Y8/lpCGEB1p
         lirdw+6hlXSP/ZAW3AAPTWndo3amwSYxetss8WcpGH2dKu2yl0t0lCK3lu2Kh1zJzayK
         W+o4RLtKL7/APVo6C7ciUSukJxw0cHW9xZC3WgzV0Y2swheUK0uphDHKbuozHkWwfJJK
         953s4SJ8bp/w32MIQ90vrAQNMizcNQNxwA4EECJfcoaEr2qStoaabwIdLRvBrxHlOIPH
         rmHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=77Xvvb93kRuq0kwxqLtAzTJqRqACUWX5HzdBepSqjy8=;
        b=NzL+EM1n64v9MUDjvSiXeFx/BMs7U6O/OxziQzjhJR/Up6hasIlujEw/Rf4/1m98Ok
         bCEf3VwTT9VSkxw7kWPkLf9pSpwZuMar/IoqUC6ukRoxTbluh0UhFcRrC2FisFAExSN5
         iHqwV3PFP5+xj33wT/00iXvK32vfgYMjGYN1xtUSnSx/9ZAUBXV3RAkVYpFXajGhLP+K
         LxwA3LHsSLYvtA0PWqeMOaTxEAVEdrjM8XAgNfcNNSSDAV0K1aPdUzQ1WC+XxgsT8grZ
         cL/Gv7Mk7S2Kwi+Qk9fZ4oRnM8qlYHgeQpJDK53qa3LjWGTfxl+hLHaRcqvweMjsyQ60
         he8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fB1udekk;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id v2sor6004114wra.57.2022.01.11.09.10.55
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 11 Jan 2022 09:10:55 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fB1udekk;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=77Xvvb93kRuq0kwxqLtAzTJqRqACUWX5HzdBepSqjy8=;
        b=fB1udekkew8p9fl1lMj8nTubohB41kthGpHkzhz96ijoAwJs56H5h7fvkBXnS86AGS
         dlVSZUn8jhIT1uHjjiZUR41Y0RgYtWE5xpufZbOyDnYt+j9aYtfQ677xzgKcR0BRgus8
         dexklcYGB1CHJTIfXtPkR2mMaBK83LeHfPMU5PE5Tz+CmCrmuhBHX7qIT2ymJdJtJxbe
         nVLxbXlqGkL360D6GUzWrYMOn60gbnxJpOj46fP1Y1WzoIL1CGIEElNldKRZgHeKwW15
         bfTm3W2brplHZ6ar3WA2NrxdntReNkCFkUfMNwE9YVS8wUnpxd51IcNCLKvnB70UeaAd
         YtGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=77Xvvb93kRuq0kwxqLtAzTJqRqACUWX5HzdBepSqjy8=;
        b=Rlt/Q5r75DS7p7Mz4dBfORDQQTWZsXMfG80N1/3dgTQrIkO6JEEdiIjME1QNu1DUWC
         wq8z907kkFv6WabAW56pY+g6V3ao+zt46et27Vw5PMhrlenQ6/dIH11lDhjxT4V/Z6nK
         4PNQeiYOruWzeiHvlIveYrCaI8ZbZMG8JbN9ZcxCUie/PULlk51dV7274CKbV7OOpc/1
         a3XQ7etKqQqj5/6aoO/TgvQJX4jS9Z1W1nvNNbxxrTZWUd4OXVCa5eOGwAkUvmhObs60
         UaNVepClG4BcNhsP3mokFnsEDsp9Ct+Ea6zN/MvRCSE4jA7HFCEROTvd4X5lRyaEGFum
         LM9Q==
X-Gm-Message-State: AOAM530BMMCn76LI6Y7lSooCYkVAa5yp6Cy4YTnaFEYNRinTh4hj8FCp
	SGnI5r6tORXYj0cW+edRqE8bO/QSXc4sjt+6
X-Google-Smtp-Source: ABdhPJznJ9+oka+YpbyoUZdjte7wkJrizD1mRILeW9z63s3EIZofOzDGmCeYJUH4ZWWHeoUnyMXnNw==
X-Received: by 2002:adf:dd88:: with SMTP id x8mr4719929wrl.586.1641921055060;
        Tue, 11 Jan 2022 09:10:55 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id c7sm11157941wri.21.2022.01.11.09.10.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 09:10:54 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Shashi Mallela <shashi.mallela@linaro.org>
Subject: [PATCH v2 06/13] hw/intc/arm_gicv3_its: Fix return codes in process_its_cmd()
Date: Tue, 11 Jan 2022 17:10:41 +0000
Message-Id: <20220111171048.3545974-7-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220111171048.3545974-1-peter.maydell@linaro.org>
References: <20220111171048.3545974-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 0O88txAZKqF0

Fix process_its_cmd() to consistently return CMD_STALL for
memory errors and CMD_CONTINUE for parameter errors, as
we claim in the comments that we do.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 10901a5e709..0929116c0fe 100644
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
@@ -316,11 +315,13 @@ static ItsCmdResult process_its_cmd(GICv3ITSState *s, uint64_t value,
                       dte_valid ? "valid" : "invalid",
                       ite_valid ? "valid" : "invalid",
                       cte_valid ? "valid" : "invalid");
+        return CMD_CONTINUE;
     } else if (eventid >= num_eventids) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid command attributes: eventid %d >= %"
                       PRId64 "\n",
                       __func__, eventid, num_eventids);
+        return CMD_CONTINUE;
     } else {
         /*
          * Current implementation only supports rdbase == procnum
@@ -329,7 +330,7 @@ static ItsCmdResult process_its_cmd(GICv3ITSState *s, uint64_t value,
         rdbase = FIELD_EX64(cte, CTE, RDBASE);
 
         if (rdbase >= s->gicv3->num_cpu) {
-            return result;
+            return CMD_CONTINUE;
         }
 
         if ((cmd == CLEAR) || (cmd == DISCARD)) {
@@ -341,11 +342,10 @@ static ItsCmdResult process_its_cmd(GICv3ITSState *s, uint64_t value,
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
