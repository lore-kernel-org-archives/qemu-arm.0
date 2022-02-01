Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp660890lfk;
        Tue, 1 Feb 2022 11:32:21 -0800 (PST)
X-Received: by 2002:adf:f80a:: with SMTP id s10mr22061167wrp.440.1643743940983;
        Tue, 01 Feb 2022 11:32:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643743940; cv=none;
        d=google.com; s=arc-20160816;
        b=vJtZpBMkLYsLOSUS7L84OBOrra8hXvSdR1dGqjP3N1nUFOjda0HT6jSBITGvEfQXaB
         j5rMslhFIqGgbrWZfuRLoTjS8g3LtNnAUFqihu6pfAY0VwYR4u2ucNvnlGO6f5lGFMcW
         wb3GYfduBAixAZlTF5dDAYpD1lNI98xnZQLD+yVDgKDj8MYiKG5aqWZt9jA6Xg68z+34
         F38mP63TbVbWL6tarb+oUNTPhLkliMYzBhS6IecSX/XLPqPD335ke9+q+yTBavPyN9ve
         MX2fRF1tgA68qh9vq8wOgi3nysYBpyoOYxUcZB8dmSbox3hvhmJrEnRLHSxIXF1SDH18
         gSMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=blUi2JCgQAd+TDFPkf/imnCCaFxJVC4UZRRy+Dtpxxo=;
        b=jLhF9zC5jhsSF9aASx0M8uI2GVJKY6c34diBxhPUfHpAqa2VDPGzoud2iZu9VU4pnX
         JX0dTC0dSP+aoowa/a2JV0DvOCIJvfqNBJQ0xEAAxvycLxooCT7gYGfaDuCU9N7YwwTZ
         9Ix2bcHue3aEeBdypm0t6V71l5FH9nTOnxkBtDcRAL1KGWkgpR9sxF3tUrmhny9xvQSw
         hvHJJ8TdHNg097zLhDWbx2Y27i4YmI6uwU+J8ce40SErhaUMn13bai918zP0biLD5Ohq
         sL1ZluiozzZ5A09UAG/71+QdDMUI6nEnqtvyNLVvX3pAUN/jX7yWGwDJP4nDm2UitxP/
         H9fg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Epm9qyHD;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id r5sor6049890wrn.10.2022.02.01.11.32.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 01 Feb 2022 11:32:20 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Epm9qyHD;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=blUi2JCgQAd+TDFPkf/imnCCaFxJVC4UZRRy+Dtpxxo=;
        b=Epm9qyHDdpnxH7Z88f8KwOkgSGjMCXSRBY8G7Lyr47NzN3KxePExIUIVWbAZ7SF8bj
         /PNHB2KTLr9oDsVDwdJWr1br25bG7uwEy3BvXZi70O/O3GpnYMVn7JbI+3SM1bFkE81Q
         k8HBdrHI6zk7o9ccNbeX9HsOm8ToLGb5VB1o9S9VoNhwMEUPMGLV+gz0bAYQa1MesyBh
         xrV7UA71TrFqV/eOFOKI6VxXOEDTqkX17io4Y+wT/78lEnwHkzApHNheuK2zt9On4sKp
         MvY1rrZK4z1m9xKc+hw0iW2ipU8xyreBglUkqqE+Hp4b6RyEBUIrLtW7StW3UHp1NcIS
         6SPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=blUi2JCgQAd+TDFPkf/imnCCaFxJVC4UZRRy+Dtpxxo=;
        b=YgwqUN57l5g+2wgckgZutFhj1EkKQP8ejsIYBKxS9gmChzkwL48Qyfvyyh4YIujsr2
         IfOWx5WIRsKVE+n84zaaIBuNP3o5wgHoEhhfj613SnIwS1QxJ+eq9XuxPMJ9KTerYCiS
         YXeHhD1q2nzVTAT8WKz6FuXmMqRTIpn9gXlOqLH9UTPWtwZLpQ9LEA6O8cN+G/GKKoqB
         FlZuVHRhn37eAL96UivXosindGJvNt73gW23eGSUx6iQoabwWQstvttkKoDR7JMU/NpF
         9zb4mEQ7N3FaZRn4+HjocVpP+3QBk7J3eLfJT+2erA+GnZsRyccCwhqfp3JWbEqsWhWl
         Mb4g==
X-Gm-Message-State: AOAM532SW5TtgsB09UtX59ve4MA8RHKDF0NArvLAzVxG2CKVL2r3tqDL
	kWkKsLYF5BAVA5x3OgbvDEgijpkc
X-Google-Smtp-Source: ABdhPJztY4hlw7tj2DNUREwQ9koDN1FczEpkO004+Rp5PdYypWIq8PJrI5JiBzH2L6wT0ueOY5XGKQ==
X-Received: by 2002:adf:d1e9:: with SMTP id g9mr17579790wrd.645.1643743940740;
        Tue, 01 Feb 2022 11:32:20 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id z5sm3491265wmp.10.2022.02.01.11.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Feb 2022 11:32:20 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Shashi Mallela <shashi.mallela@linaro.org>
Subject: [PATCH 13/13] hw/intc/arm_gicv3_its: Split error checks
Date: Tue,  1 Feb 2022 19:32:07 +0000
Message-Id: <20220201193207.2771604-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220201193207.2771604-1-peter.maydell@linaro.org>
References: <20220201193207.2771604-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: w8f7HLT4ff4V

In most of the ITS command processing, we check different error
possibilities one at a time and log them appropriately. In
process_mapti() and process_mapd() we have code which checks
multiple error cases at once, which means the logging is less
specific than it could be. Split those cases up.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 52 ++++++++++++++++++++++++-----------------
 1 file changed, 31 insertions(+), 21 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index 8dade9440ac..4f598d3c14f 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -404,19 +404,29 @@ static ItsCmdResult process_mapti(GICv3ITSState *s, const uint64_t *cmdpkt,
     num_eventids = 1ULL << (dte.size + 1);
     num_intids = 1ULL << (GICD_TYPER_IDBITS + 1);
 
-    if ((icid >= s->ct.num_entries)
-            || !dte.valid || (eventid >= num_eventids) ||
-            (((pIntid < GICV3_LPI_INTID_START) || (pIntid >= num_intids)))) {
+    if (icid >= s->ct.num_entries) {
         qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: invalid command attributes "
-                      "icid %d or eventid %d or pIntid %d or"
-                      "unmapped dte %d\n", __func__, icid, eventid,
-                      pIntid, dte.valid);
-        /*
-         * in this implementation, in case of error
-         * we ignore this command and move onto the next
-         * command in the queue
-         */
+                      "%s: invalid ICID 0x%x >= 0x%x\n",
+                      __func__, icid, s->ct.num_entries);
+        return CMD_CONTINUE;
+    }
+
+    if (!dte.valid) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: no valid DTE for devid 0x%x\n", __func__, devid);
+        return CMD_CONTINUE;
+    }
+
+    if (eventid >= num_eventids) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid event ID 0x%x >= 0x%" PRIx64 "\n",
+                      __func__, eventid, num_eventids);
+        return CMD_CONTINUE;
+    }
+
+    if (pIntid < GICV3_LPI_INTID_START || pIntid >= num_intids) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid interrupt ID 0x%x\n", __func__, pIntid);
         return CMD_CONTINUE;
     }
 
@@ -529,16 +539,16 @@ static ItsCmdResult process_mapd(GICv3ITSState *s, const uint64_t *cmdpkt)
     dte.ittaddr = (cmdpkt[2] & ITTADDR_MASK) >> ITTADDR_SHIFT;
     dte.valid = cmdpkt[2] & CMD_FIELD_VALID_MASK;
 
-    if ((devid >= s->dt.num_entries) ||
-        (dte.size > FIELD_EX64(s->typer, GITS_TYPER, IDBITS))) {
+    if (devid >= s->dt.num_entries) {
         qemu_log_mask(LOG_GUEST_ERROR,
-                      "ITS MAPD: invalid device table attributes "
-                      "devid %d or size %d\n", devid, dte.size);
-        /*
-         * in this implementation, in case of error
-         * we ignore this command and move onto the next
-         * command in the queue
-         */
+                      "ITS MAPD: invalid device ID field 0x%x >= 0x%x\n",
+                      devid, s->dt.num_entries);
+        return CMD_CONTINUE;
+    }
+
+    if (dte.size > FIELD_EX64(s->typer, GITS_TYPER, IDBITS)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "ITS MAPD: invalid size %d\n", dte.size);
         return CMD_CONTINUE;
     }
 
-- 
2.25.1
