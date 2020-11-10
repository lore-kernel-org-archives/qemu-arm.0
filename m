Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp4657227lfb;
        Tue, 10 Nov 2020 07:03:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxvLKT8HxBLURZ+Vju6TMKTzNpqOj5KYTYYTyS7jUzi23p/tKbvSzXysDqwFdRxIrkH+99A
X-Received: by 2002:a17:902:7283:b029:d7:e4f5:adc7 with SMTP id d3-20020a1709027283b02900d7e4f5adc7mr8336663pll.20.1605020581641;
        Tue, 10 Nov 2020 07:03:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605020581; cv=none;
        d=google.com; s=arc-20160816;
        b=pdn89WVkn14u1OnDLoVqWqwP5hryi6yAwUbJl1icKBqq79OdWbudo0uD1K2EGEbuP5
         6VCxZZW86chejVd5ai/G54fD/Bs/cGN+r69TXxdSTd8YUk3VcejcEEQs1cbA82XQk2Lq
         km4URWsRlpXqhyhz5CKZ+K6582lbragTqansiOcTTwTYyawduKmyiHSit1dMFCXbwxF3
         3hw+vZ0EU6Xx9sdACIbzSlBcth1oZoLpjJM2sg3AIr2/c0U5PWLsZPUaRU8U0v3wfq62
         Dk/nvAt+SCJIUZEY9X6jOnxbK8JRixu5STI5XfOYHFyTc9Qkfgi7+1KLbQZrYZPEJoLl
         AM6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=+8VBpOq5IPiyukv1r/cJV6FOcSBdmxIoPOlZnr/6lsM=;
        b=A67hSQ4xvNa2FAS/2jLsrAHsC6fhumjYVuKh76EFwblcXAyqAJIjxMdM700RSV51nN
         Ei5IReAHldEJjTqZUdS9qfdYsjUq5Y9vL83kqEOuAgz9BO5C+lXte+BgN39R0NKcopRe
         fzykYV/8x/T/303VtwCYnYGry/pFr1iFNvNQevm3rYgmid+b+suZ6zJKXUbPIiEV3V+E
         fd/Ka8BkCCY8UQMXL3lYc/9SH2euOv/FX/aYIti+a4FDagSidSRQNLlpPKWuFtIOHkoW
         EFg5gnBhSRuye3rF64Xqjy7EEPjA1MBD2iGyA/+RGdJMk/GORp5O65UMFm2XhK8M6JYe
         /IAw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zQNVnTP0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j1si565815ual.126.2020.11.10.07.03.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Nov 2020 07:03:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zQNVnTP0;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kcVAi-0002Tw-QV
	for alex.bennee@linaro.org; Tue, 10 Nov 2020 10:03:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcV8W-0002Qb-SD
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 10:00:44 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:44667)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kcV8I-0007Mw-UA
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 10:00:44 -0500
Received: by mail-wr1-x42c.google.com with SMTP id c17so12974483wrc.11
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 07:00:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=+8VBpOq5IPiyukv1r/cJV6FOcSBdmxIoPOlZnr/6lsM=;
 b=zQNVnTP0FVAdicV+y0OfuGzREC3bqKzlccYfz5aCC/5r64auh+sU0C9ocKktYPNqBD
 TuTGtV0Q00jNPV+EnIZybj5BnRkyVoXwOjMsIfKrFehybGDER5qVr2G76kkS3rqS9wF9
 c1HvaSxNLk5g6C/XPuGuil+QqsZcK6srH0HBEYldmLDD4u3HpzlRdUOLOFMRZiTE80Ac
 1w8ciGN57ZE+xPRgQ2AVMU5K0/WxYLmgdWCZUlYRVNFW37tdXJY/IruUCd0wYZBsT5ql
 +UMQbIma8nn4nQhXOS43ZOZPkntKuUmwZxNQCcugnT6nXFyVGn3mD27Kaj2LiJj0/wvV
 zuKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+8VBpOq5IPiyukv1r/cJV6FOcSBdmxIoPOlZnr/6lsM=;
 b=eDo8zRtNprV4zXHAMyRXO//vmPKhp758c5mPD+VW2qPI1xWPFwqIvWyNbKF2Yyn8wV
 4vMNyTg3NHXZAjmqMZHPPKIh85qvKrZWK/VrnW3Z8LJ+LTl5OajVr4rQ10tnjx+WaWrI
 v38zuUmFVZdsp90Yv9IYZlSns5c0NpA8xBrwXFK7xa+S6LhZG+R4UN1kMHhSXw1gF0wg
 /ScjG8dYmIFsQdB3766tQAgJKxf+z1WAsIvx/8egDzkAMMkWKFZJgtD21NywX+3ibZlO
 Legrf/QgNH+ZlmoJn0LhGHz2RR6Rxt3zWhEBgVgYplOd7HofuE7JVSQ9kerg3/KZRbSh
 DURg==
X-Gm-Message-State: AOAM531gT8bjtlW1W1yuL6bdO3hQjCK7N2EDVoCEtl7OkHHhWNWg6YaA
 /Bjyx5Ff3L6ebEPbTmczppoa2Q==
X-Received: by 2002:a5d:4349:: with SMTP id u9mr24003093wrr.319.1605020428734; 
 Tue, 10 Nov 2020 07:00:28 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id o205sm3392493wma.25.2020.11.10.07.00.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 07:00:28 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/2] tmp105: Correct handling of temperature limit checks
Date: Tue, 10 Nov 2020 15:00:23 +0000
Message-Id: <20201110150023.25533-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201110150023.25533-1-peter.maydell@linaro.org>
References: <20201110150023.25533-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: abi0kCua6meT

The TMP105 datasheet says that in Interrupt Mode (when TM==1) the device
signals an alert when the temperature equals or exceeds the T_high value and
then remains high until a device register is read or the device responds to
the SMBUS Alert Response address, or the device is put into Shutdown Mode.
Thereafter the Alert pin will only be re-signalled when temperature falls
below T_low; alert can then be cleared in the same set of ways, and the
device returns to its initial "alert when temperature goes above T_high"
mode. (If this textual description is confusing, see figure 3 in the
TI datasheet at https://www.ti.com/lit/gpn/tmp105 .)

We were misimplementing this as a simple "always alert if temperature is
above T_high or below T_low" condition, which gives a spurious alert on
startup if using the "T_high = 80 degrees C, T_low = 75 degrees C" reset
limit values.

Implement the correct (hysteresis) behaviour by tracking whether we
are currently looking for the temperature to rise over T_high or
for it to fall below T_low. Our implementation of the comparator
mode (TM==0) wasn't wrong, but rephrase it to match the way that
interrupt mode is now handled for clarity.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/misc/tmp105.c | 70 +++++++++++++++++++++++++++++++++++++++++-------
 hw/misc/tmp105.h |  7 +++++
 2 files changed, 68 insertions(+), 9 deletions(-)

diff --git a/hw/misc/tmp105.c b/hw/misc/tmp105.c
index 0a4aad4854..d299d9b21b 100644
--- a/hw/misc/tmp105.c
+++ b/hw/misc/tmp105.c
@@ -41,16 +41,40 @@ static void tmp105_alarm_update(TMP105State *s)
             return;
     }
 
-    if ((s->config >> 1) & 1) {					/* TM */
-        if (s->temperature >= s->limit[1])
-            s->alarm = 1;
-        else if (s->temperature < s->limit[0])
-            s->alarm = 1;
+    if (s->config >> 1 & 1) {
+        /*
+         * TM == 1 : Interrupt mode. We signal Alert when the
+         * temperature rises above T_high, and expect the guest to clear
+         * it (eg by reading a device register).
+         */
+        if (s->detect_falling) {
+            if (s->temperature < s->limit[0]) {
+                s->alarm = 1;
+                s->detect_falling = false;
+            }
+        } else {
+            if (s->temperature >= s->limit[1]) {
+                s->alarm = 1;
+                s->detect_falling = true;
+            }
+        }
     } else {
-        if (s->temperature >= s->limit[1])
-            s->alarm = 1;
-        else if (s->temperature < s->limit[0])
-            s->alarm = 0;
+        /*
+         * TM == 0 : Comparator mode. We signal Alert when the temperature
+         * rises above T_high, and stop signalling it when the temperature
+         * falls below T_low.
+         */
+        if (s->detect_falling) {
+            if (s->temperature < s->limit[0]) {
+                s->alarm = 0;
+                s->detect_falling = false;
+            }
+        } else {
+            if (s->temperature >= s->limit[1]) {
+                s->alarm = 1;
+                s->detect_falling = true;
+            }
+        }
     }
 
     tmp105_interrupt_update(s);
@@ -197,6 +221,29 @@ static int tmp105_post_load(void *opaque, int version_id)
     return 0;
 }
 
+static bool detect_falling_needed(void *opaque)
+{
+    TMP105State *s = opaque;
+
+    /*
+     * We only need to migrate the detect_falling bool if it's set;
+     * for migration from older machines we assume that it is false
+     * (ie temperature is not out of range).
+     */
+    return s->detect_falling;
+}
+
+static const VMStateDescription vmstate_tmp105_detect_falling = {
+    .name = "TMP105/detect-falling",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = detect_falling_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_BOOL(detect_falling, TMP105State),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static const VMStateDescription vmstate_tmp105 = {
     .name = "TMP105",
     .version_id = 0,
@@ -212,6 +259,10 @@ static const VMStateDescription vmstate_tmp105 = {
         VMSTATE_UINT8(alarm, TMP105State),
         VMSTATE_I2C_SLAVE(i2c, TMP105State),
         VMSTATE_END_OF_LIST()
+    },
+    .subsections = (const VMStateDescription*[]) {
+        &vmstate_tmp105_detect_falling,
+        NULL
     }
 };
 
@@ -224,6 +275,7 @@ static void tmp105_reset(I2CSlave *i2c)
     s->config = 0;
     s->faults = tmp105_faultq[(s->config >> 3) & 3];
     s->alarm = 0;
+    s->detect_falling = false;
 
     s->limit[0] = 0x4b00; /* T_LOW, 75 degrees C */
     s->limit[1] = 0x5000; /* T_HIGH, 80 degrees C */
diff --git a/hw/misc/tmp105.h b/hw/misc/tmp105.h
index e5198fce80..7c97071ad7 100644
--- a/hw/misc/tmp105.h
+++ b/hw/misc/tmp105.h
@@ -43,6 +43,13 @@ struct TMP105State {
     int16_t limit[2];
     int faults;
     uint8_t alarm;
+    /*
+     * The TMP105 initially looks for a temperature rising above T_high;
+     * once this is detected, the condition it looks for next is the
+     * temperature falling below T_low. This flag is false when initially
+     * looking for T_high, true when looking for T_low.
+     */
+    bool detect_falling;
 };
 
 #endif
-- 
2.20.1

