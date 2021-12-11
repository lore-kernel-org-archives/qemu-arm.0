Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp2583263lfk;
        Sat, 11 Dec 2021 11:11:38 -0800 (PST)
X-Received: by 2002:a05:600c:4f55:: with SMTP id m21mr26191530wmq.68.1639249898169;
        Sat, 11 Dec 2021 11:11:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639249898; cv=none;
        d=google.com; s=arc-20160816;
        b=My+060hFEzZFzB/cBFGxmfrwlE1PcaP2O208wAtmAvRhTXLHL2lXdfH0FJvxN0QCsc
         Ez+XZ5AkTLQaqDrfSgMYIHG4wOq2fvVTVV96HyilqNnBMFlX6RoWuJA1yFcwn8pDuuU3
         j88cRsmrfIoCC/fwRJh1GWPOnnhX4t3Vfw/L1nwvIZ/frXtZquivKKoB1wsVDbRVUg9t
         ud50Ct1qVwdE8snQ2qah6FOKj5UKWzDfgEDOzFkULGa0cjOS5kqMYTHKvFIJOMW6f/3H
         l3NqHBV9BEkynBnWgmy3etXn2h78MU7Y8p2wVY6WaKid2Lhi3x7Fw5GrpAK58oIuzRTP
         djFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=xCxczYnF9ENjygSdEdbIw8X3a8w7yrOW7vR3UKB8V04=;
        b=Kb5ci37Aug0Y1EXPDdllQ6pnC61D1CtNVoY/tfJx4mI0h2RMKsa73TeCRZaXMZlt4y
         OHZ6hQPMAZ/yVJE8SgdWamNnD7LtJSLIY03fUhXEs8rY0gp2U/jWJxq8N0BN5ftrXmoP
         LgJllRfMyH73WHV5CwRo+D8+TltTthl1VxK+iB2KFSJqfS1+GsGv0ijKNHWxTX5fElVM
         GSMQsj1frTVdxpzFhhF8WpQrEPXZTFuOdcp3rC+O5U5GDbICkQtFp4qw5TRPrc/Hyppi
         SNXTt5KME5cw7QJDFUr8v7fFsVEkoETvJkxbBkZ86Wts9p5rsLkJO9ytmDfWWam3zDji
         ThJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZNPLTguM;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k17sor4379423wrw.31.2021.12.11.11.11.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 11 Dec 2021 11:11:38 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZNPLTguM;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xCxczYnF9ENjygSdEdbIw8X3a8w7yrOW7vR3UKB8V04=;
        b=ZNPLTguMsjyMtt/U2jDu3AuCfHr6fLpsRayXnhFsJMoXzGrmxwapNyVwYferI0C8zg
         8Cj52vWdqsqFw05QtRWGN2AK2ZquQIb8xQo90ZgwV00XvUTDi5AZnQqz22Tk7re9u519
         mUzntddDebSKieWIyDa5yZ2l436kugWftRak3bx39XNVwa4BsGIJJXgyUBU/am6jx53F
         w3wDYijsZhQUpJWvxsmqchgoPx/pPll1WwQQA0o7xVPHHeAIU1N2n6avMLgcnMiqKN3Q
         6Fn0S2oWWvP31K3RcbLNgriW8eErOsChMIsFGQK9eKpaoCR1Si8ZHHGzFOHXF7KCPXqU
         ZVmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xCxczYnF9ENjygSdEdbIw8X3a8w7yrOW7vR3UKB8V04=;
        b=FOsOU7fQmdV7TE2op3/xnFQIlXSqmM2z70roIw2aXmXP4rLNkA3haUljBdZdTx+OHY
         8TEisw/WQpcUXoUY9DT0Q+D8OpcUEm4Um1yEhQ9b2s0q9r7nNUavJ6sio7a3eiHOM4Op
         W5acwX923W43dE5Nxyr6pq9bhY+c7VDgBLZjS/fWb5gOg+qNOLRGkkRIZcy9unTcQUAd
         ENXaqhH95Qm6OE4VGgjoXjPfp1ojF1WEFc0l8k/MzMMmjBVC5k/3XNylvWPD0dWiyUJA
         YyFlVwcGYYsPieceHNSilVCQkwOxfCAGKAT0XcndySK3tC0q+QV72S+kHIvEp1DZfXkQ
         8S7A==
X-Gm-Message-State: AOAM532FfYcfh5md4eoZ/PY4jhc24FYOD9M36y1DWDd9FZ3kjGShIt3F
	2LdS+KnuSSt0FjPhaKZazwUImw7c7kyfOZMZ
X-Google-Smtp-Source: ABdhPJzuUrId9CT2bbs1t1vU0clOXJx3/BjVoK+FMs1rL4YzQZhsc5TI0oA3nYnmcCThumNseX4kXA==
X-Received: by 2002:a05:6000:1a48:: with SMTP id t8mr21586049wry.66.1639249897800;
        Sat, 11 Dec 2021 11:11:37 -0800 (PST)
Return-Path: <peter.maydell@linaro.org>
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
        by smtp.gmail.com with ESMTPSA id m20sm2205300wmq.11.2021.12.11.11.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Dec 2021 11:11:37 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Shashi Mallela <shashi.mallela@linaro.org>
Subject: [PATCH 01/26] hw/intc: clean-up error reporting for failed ITS cmd
Date: Sat, 11 Dec 2021 19:11:10 +0000
Message-Id: <20211211191135.1764649-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211211191135.1764649-1-peter.maydell@linaro.org>
References: <20211211191135.1764649-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 7yuYG+NeHHdk

From: Alex Bennée <alex.bennee@linaro.org>

While trying to debug a GIC ITS failure I saw some guest errors that
had poor formatting as well as leaving me confused as to what failed.
As most of the checks aren't possible without a valid dte split that
check apart and then check the other conditions in steps. This avoids
us relying on undefined data.

I still get a failure with the current kvm-unit-tests but at least I
know (partially) why now:

  Exception return from AArch64 EL1 to AArch64 EL1 PC 0x40080588
  PASS: gicv3: its-trigger: inv/invall: dev2/eventid=20 now triggers an LPI
  ITS: MAPD devid=2 size = 0x8 itt=0x40430000 valid=0
  INT dev_id=2 event_id=20
  process_its_cmd: invalid command attributes: invalid dte: 0 for 2 (MEM_TX: 0)
  PASS: gicv3: its-trigger: mapd valid=false: no LPI after device unmap
  SUMMARY: 6 tests, 1 unexpected failures

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Cc: Shashi Mallela <shashi.mallela@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/intc/arm_gicv3_its.c | 39 +++++++++++++++++++++++++++------------
 1 file changed, 27 insertions(+), 12 deletions(-)

diff --git a/hw/intc/arm_gicv3_its.c b/hw/intc/arm_gicv3_its.c
index c929a9cb5c3..b99e63d58f7 100644
--- a/hw/intc/arm_gicv3_its.c
+++ b/hw/intc/arm_gicv3_its.c
@@ -274,21 +274,36 @@ static bool process_its_cmd(GICv3ITSState *s, uint64_t value, uint32_t offset,
         if (res != MEMTX_OK) {
             return result;
         }
+    } else {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid command attributes: "
+                      "invalid dte: %"PRIx64" for %d (MEM_TX: %d)\n",
+                      __func__, dte, devid, res);
+        return result;
     }
 
-    if ((devid > s->dt.maxids.max_devids) || !dte_valid || !ite_valid ||
-            !cte_valid || (eventid > max_eventid)) {
+
+    /*
+     * In this implementation, in case of guest errors we ignore the
+     * command and move onto the next command in the queue.
+     */
+    if (devid > s->dt.maxids.max_devids) {
         qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: invalid command attributes "
-                      "devid %d or eventid %d or invalid dte %d or"
-                      "invalid cte %d or invalid ite %d\n",
-                      __func__, devid, eventid, dte_valid, cte_valid,
-                      ite_valid);
-        /*
-         * in this implementation, in case of error
-         * we ignore this command and move onto the next
-         * command in the queue
-         */
+                      "%s: invalid command attributes: devid %d>%d",
+                      __func__, devid, s->dt.maxids.max_devids);
+
+    } else if (!dte_valid || !ite_valid || !cte_valid) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid command attributes: "
+                      "dte: %s, ite: %s, cte: %s\n",
+                      __func__,
+                      dte_valid ? "valid" : "invalid",
+                      ite_valid ? "valid" : "invalid",
+                      cte_valid ? "valid" : "invalid");
+    } else if (eventid > max_eventid) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: invalid command attributes: eventid %d > %d\n",
+                      __func__, eventid, max_eventid);
     } else {
         /*
          * Current implementation only supports rdbase == procnum
-- 
2.25.1
