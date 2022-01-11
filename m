Received: by 2002:a19:ca48:0:0:0:0:0 with SMTP id h8csp1800935lfj;
        Tue, 11 Jan 2022 09:10:56 -0800 (PST)
X-Received: by 2002:a05:6000:1c1d:: with SMTP id ba29mr4520818wrb.235.1641921056086;
        Tue, 11 Jan 2022 09:10:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1641921056; cv=none;
        d=google.com; s=arc-20160816;
        b=kLcHk4MSDlB/hOlIwGtzODtiHaonH9dMsCIkI4760PTCBXnKvro4j66CdkuuuNmGfg
         GwCEZB3RQxlz7MyKnuke6L7rwt/n42OQImKsJZJ5BLqju6Aa4jXdirS7f6Zk7GWxEdg2
         GtpDKicjyHoE1EIkAHADzYuJCbiIClnUYgmDZuOj3SaZXYzo9hsiGLeJtgks/UVCWDYr
         nE0MUuz9Q5gFBevC5Nt92uyrXYVQMwi68CtSI5RG1iO2x19+lwCO8BFYFPb5vD4+lmNa
         GTxEVBbvIMe2miXWf4mIkVvW+tAhHgfOInaHWDpYNNDJWWlV4eMAhYnNRyswkJKVxEiU
         adGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=w59aiHtlS+UEJYF8KG6CIWjpdLxn3MFz4XhHlwys/7I=;
        b=HOs2pw6jTK0lZFZPEEgV9CgKnzx5F/NNhVa+s67ze122eyfPOieIS+4/u4eOehzdPc
         in2VMXn7sEoUz0mpewGHOEsg4um9La50+xln707ptMFyiReyy6DGCh/geurZrd1xndRA
         OkN+w2g+MlXrWdStR7ZvIUNMcHGZq4vPihlJLBrhvJ035rAc8nIrQpu8Gcmf8focD3h1
         fDrOTMrhewaOIujlmm7NfjWT7Cgkw1CwyGFZjcfd6E4cHVBx7xpNSVYGnOAGCSJrus1g
         /GM6WPW+0E6KbwP5rfef3/7nciVvVV/fcRgF8I5DO7j3CktUY9gnnnUGKr/tsvRcVA28
         FUWw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EQ+Haxxk;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o38sor1277265wms.26.2022.01.11.09.10.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 11 Jan 2022 09:10:56 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EQ+Haxxk;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=w59aiHtlS+UEJYF8KG6CIWjpdLxn3MFz4XhHlwys/7I=;
        b=EQ+HaxxkduJVaWIsuKcg1SxL4RTwBCXV5plq9SlbUL8ohC0krpLXg8Pssj6yfstU4R
         d1y5kPTVwGPB496iu9MYGoHNLGk4zryoSeQrXasNnUWX9toiE/IweRudNA3Kxp77J/Pw
         f13f3brJUkyddCOISRQtigWmSz1LKed5T74MHVG/lDEMDhmdKhb7h2Z+kOUs4HVq4tgc
         i7ftvRhC2o1wcC9JPRiObFVUEXKlZaoXv7gRHR53I1BCCGFFyhN0YJ0jpO5ce8LGB5h5
         6yD9387mHQKh0lb/MKM2XZWwnZcN4tqnkU9QUrmIskjadylTs3Jy7j0ZTKePiBHeu5n+
         MPKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w59aiHtlS+UEJYF8KG6CIWjpdLxn3MFz4XhHlwys/7I=;
        b=yuM148wSy75qkT9paFW8mBDpy7IpQhb79iNrJ+ziUiSXSe+vJKKTvm/6oHZQwO5yec
         p2OLEDcrFUw6toGttFL314iIUERng+sAGne770E4J23STcvP39+NpsEP9XM/uMuRHOFu
         3i2UMT8CaVZidJb+1HPoU75eG5PY+nD5vhAPEgP+MwBcBf9gZiO8VwzrNwg54Y01W28t
         IoHSn76vvRSNr+dxXYY0+9aIeYK5MDVp63CYqyg/GMH0f3H1xqCldt7LFOaVvch3KCV5
         as/QRnjZ3DPxLgOZZ2TBx4+T+yktfLKMT8CSDFRw6IyP/EoCfI2c5SKN4//MyhvNjBgm
         r2Hg==
X-Gm-Message-State: AOAM5332fzWbE3Npnuzx2gEBgeM0/XR2F6vDid89O93C5lGEJkR8+DjY
	GvmRFBkiDTmehzYovJmHxQgMzx1g
X-Google-Smtp-Source: ABdhPJy5wwNA5pen3pENXQDKZ4eHqaBzBw5BvpAxZLTBze0RV666OtoGDfexZe/ZNC1IJcMCm3Kn4w==
X-Received: by 2002:a1c:9803:: with SMTP id a3mr3251538wme.47.1641921055800;
        Tue, 11 Jan 2022 09:10:55 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id c7sm11157941wri.21.2022.01.11.09.10.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 09:10:55 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Shashi Mallela <shashi.mallela@linaro.org>
Subject: [PATCH v2 07/13] hw/intc/arm_gicv3_its: Refactor process_its_cmd() to reduce nesting
Date: Tue, 11 Jan 2022 17:10:42 +0000
Message-Id: <20220111171048.3545974-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220111171048.3545974-1-peter.maydell@linaro.org>
References: <20220111171048.3545974-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: gOtwxyOk3D7s

Refactor process_its_cmd() so that it consistently uses
the structure
  do thing;
  if (error condition) {
      return early;
  }
  do next thing;

rather than doing some of the work nested inside if (not error)
code blocks.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 103 +++++++++++++++++++---------------------
 1 file changed, 50 insertions(+), 53 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 0929116c0fe..5dc6846fe3f 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -273,79 +273,76 @@ static ItsCmdResult process_its_cmd(GICv3ITSState *s, uint64_t value,
     }
     dte_valid = FIELD_EX64(dte, DTE, VALID);
 
-    if (dte_valid) {
-        num_eventids = 1ULL << (FIELD_EX64(dte, DTE, SIZE) + 1);
-
-        ite_valid = get_ite(s, eventid, dte, &icid, &pIntid, &res);
-
-        if (res != MEMTX_OK) {
-            return CMD_STALL;
-        }
-
-        if (ite_valid) {
-            cte_valid = get_cte(s, icid, &cte, &res);
-        }
-
-        if (res != MEMTX_OK) {
-            return CMD_STALL;
-        }
-    } else {
+    if (!dte_valid) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid command attributes: "
-                      "invalid dte: %"PRIx64" for %d (MEM_TX: %d)\n",
-                      __func__, dte, devid, res);
+                      "invalid dte: %"PRIx64" for %d\n",
+                      __func__, dte, devid);
         return CMD_CONTINUE;
     }
 
+    num_eventids = 1ULL << (FIELD_EX64(dte, DTE, SIZE) + 1);
+
+    ite_valid = get_ite(s, eventid, dte, &icid, &pIntid, &res);
+    if (res != MEMTX_OK) {
+        return CMD_STALL;
+    }
+
+    if (!ite_valid) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid command attributes: invalid ITE\n",
+                      __func__);
+        return CMD_CONTINUE;
+    }
+
+    cte_valid = get_cte(s, icid, &cte, &res);
+    if (res != MEMTX_OK) {
+        return CMD_STALL;
+    }
+    if (!cte_valid) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid command attributes: "
+                      "invalid cte: %"PRIx64"\n",
+                      __func__, cte);
+        return CMD_CONTINUE;
+    }
 
-    /*
-     * In this implementation, in case of guest errors we ignore the
-     * command and move onto the next command in the queue.
-     */
     if (devid >= s->dt.num_ids) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid command attributes: devid %d>=%d",
                       __func__, devid, s->dt.num_ids);
         return CMD_CONTINUE;
-    } else if (!dte_valid || !ite_valid || !cte_valid) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: invalid command attributes: "
-                      "dte: %s, ite: %s, cte: %s\n",
-                      __func__,
-                      dte_valid ? "valid" : "invalid",
-                      ite_valid ? "valid" : "invalid",
-                      cte_valid ? "valid" : "invalid");
-        return CMD_CONTINUE;
-    } else if (eventid >= num_eventids) {
+    }
+    if (eventid >= num_eventids) {
         qemu_log_mask(LOG_GUEST_ERROR,
                       "%s: invalid command attributes: eventid %d >= %"
                       PRId64 "\n",
                       __func__, eventid, num_eventids);
         return CMD_CONTINUE;
-    } else {
-        /*
-         * Current implementation only supports rdbase == procnum
-         * Hence rdbase physical address is ignored
-         */
-        rdbase = FIELD_EX64(cte, CTE, RDBASE);
+    }
 
-        if (rdbase >= s->gicv3->num_cpu) {
-            return CMD_CONTINUE;
-        }
+    /*
+     * Current implementation only supports rdbase == procnum
+     * Hence rdbase physical address is ignored
+     */
+    rdbase = FIELD_EX64(cte, CTE, RDBASE);
 
-        if ((cmd == CLEAR) || (cmd == DISCARD)) {
-            gicv3_redist_process_lpi(&s->gicv3->cpu[rdbase], pIntid, 0);
-        } else {
-            gicv3_redist_process_lpi(&s->gicv3->cpu[rdbase], pIntid, 1);
-        }
-
-        if (cmd == DISCARD) {
-            IteEntry ite = {};
-            /* remove mapping from interrupt translation table */
-            return update_ite(s, eventid, dte, ite) ? CMD_CONTINUE : CMD_STALL;
-        }
+    if (rdbase >= s->gicv3->num_cpu) {
         return CMD_CONTINUE;
     }
+
+    if ((cmd == CLEAR) || (cmd == DISCARD)) {
+        gicv3_redist_process_lpi(&s->gicv3->cpu[rdbase], pIntid, 0);
+    } else {
+        gicv3_redist_process_lpi(&s->gicv3->cpu[rdbase], pIntid, 1);
+    }
+
+    if (cmd == DISCARD) {
+        IteEntry ite = {};
+        /* remove mapping from interrupt translation table */
+        return update_ite(s, eventid, dte, ite) ? CMD_CONTINUE : CMD_STALL;
+    }
+    return CMD_CONTINUE;
 }
 
 static ItsCmdResult process_mapti(GICv3ITSState *s, uint64_t value,
-- 
2.25.1
