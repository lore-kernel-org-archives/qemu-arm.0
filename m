Received: by 2002:ac2:593b:0:0:0:0:0 with SMTP id v27csp1223386lfi;
        Fri, 2 Jul 2021 03:41:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz0MB/HliKkY0/rQROBepppQAXVguknklmkT8T8ZoKILoOMkp0deDgEzox1LFrLkI8R+NI3
X-Received: by 2002:a05:6102:224a:: with SMTP id e10mr5037975vsb.29.1625222488465;
        Fri, 02 Jul 2021 03:41:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625222488; cv=none;
        d=google.com; s=arc-20160816;
        b=WCmXDNUJDE9A2qRFTQV4QnSsrV16nhsFqMk4CqwXR2hYfrx24Vh37oTluDKCk65wlq
         i/RrW5OSwsTBdIZN6YpuO5652UC1Zfl3bmLKJgrs3TCWFAqryP2UEUhEcKAkCpLAoDCN
         NHUkBxJ/1TBl9Nc2m1gunSuabwNDPqcUDLsTz5Umiblm+YMwAxUerM7nqM+CPIUJeRuf
         uh7p22lsn2GClNA+O0phRzDfCnWT9+UVeeMW82ZjH81lUZGjXCNCzjoxKxtqeS6yJo3E
         GjtXb0c1zdq5AL2I2UAegWLVPLGXQKnKLujhsTaigiRTeKG29ibDidqJTh8naORGnThq
         50ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=L7U6W9EH1FihHhwpCAtDoJvA3yxH/uDVM+98Ig5Lyfk=;
        b=f6gRM6Y1GXhbXifLdXGq3Q075HNykNyiBHoyFxGwdWuyESKpXL7Uft9+nvxm0Ls5D6
         8Yj6LI3MnpiRJ0SuHBgHqanEYejrqzlpTM+nA1x6x4J3Zn6XAsOZ0J9+vTFRuMmZhJBr
         APCntIHx9lORlx8NqPrEVRAGkaXOG4BVQA4LgdOEsIR23HthhbYrtODarV0+EjMTuGYK
         P90R9OEmPYtIzbq8AAANOdjKBybDZ/v2j4ycFLpadlfnM3P0V+zz++cJZ6qRHNusVVsk
         w3vtb1Uh47PAi/T5Kk+mSLJ3cjKzL7l/0p26diTmWCBRjF2a+z2srycam5yMXkTmYxUa
         kQtg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bq6gKAWv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n8si2625925vsp.97.2021.07.02.03.41.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Jul 2021 03:41:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bq6gKAWv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lzGbv-0006PR-Ng
	for alex.bennee@linaro.org; Fri, 02 Jul 2021 06:41:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzGb4-0004n1-IK
 for qemu-arm@nongnu.org; Fri, 02 Jul 2021 06:40:34 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:45761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzGaz-0006fM-3A
 for qemu-arm@nongnu.org; Fri, 02 Jul 2021 06:40:33 -0400
Received: by mail-wr1-x42b.google.com with SMTP id j2so11865640wrs.12
 for <qemu-arm@nongnu.org>; Fri, 02 Jul 2021 03:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L7U6W9EH1FihHhwpCAtDoJvA3yxH/uDVM+98Ig5Lyfk=;
 b=bq6gKAWvABTAkpFGvttT1LTiw5mJ/W3RUwScC7njlKR7MOunXjk7tA3RF4zpXJ5uee
 VaXWXnFdfoYIaPy9Kc7n2sd1dFQKTpQ0k6MJoDdA3ZHXn1WVDODeNIMnc5EYNHwbjfwS
 HwL0Ak6Sgi9VgjFDgKSZdkOiem21+Xh/APQ8wYuFovV6KpMvrlbUJITWwbAdfKuzcS6e
 sfEL8aitjaEccxFciZKtelQeP1x9ez7vfBHw7YigBLlORsPOvFkQkQT/niahDGiENRSa
 F8RP8tp/y5mj/oGwNUV+aEWNv4hGXTkD2FfRSrsVgJ96v/3EYMResgxo/gtYRt5MDoPA
 azKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L7U6W9EH1FihHhwpCAtDoJvA3yxH/uDVM+98Ig5Lyfk=;
 b=P4q7kMvuEEj8RrxQ24iMaDNMpi4+H0hkdTwnq4WnUAdWmsxXJE+SEwvXbC63Int3/a
 60UAP6uKR0s5LZRJ4TEMtUULc/n9eWoinreZg9NIX1npAE7mUejBgUYVrTi+72uYM+1Z
 PCphc4M5usZ9m7MaAnhQh0uXG3FPZgUq1aEcb7UFg4c7ULvXnqXu85Iwl3Fm/L0kOgKm
 +93q9XdEdddnaAHHZRtC4tY0kQRn3vbUYng2kWfArVqp/tuvFd5oqcnplHXxO38Gn+x7
 wWO1/k1f33XzJANM4MsfqREPuBsUBQCUhvkOgNG5ybEoTd4rVtj2fNN4WYgogQ8n3etr
 D/bg==
X-Gm-Message-State: AOAM533RBuigBxC9+yAMekTM7boxDoc4YyrDkdWeCe4ksNqscnRHEeqJ
 tQ7zmrlAypLnZdkfA8ygfsPqTVDvJE3wrtAg
X-Received: by 2002:a5d:524e:: with SMTP id k14mr5126206wrc.390.1625222427679; 
 Fri, 02 Jul 2021 03:40:27 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id p16sm2745810wrs.52.2021.07.02.03.40.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 03:40:27 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 09/11] hw/gpio/pl061: Convert to 3-phase reset and assert GPIO
 lines correctly on reset
Date: Fri,  2 Jul 2021 11:40:16 +0100
Message-Id: <20210702104018.19881-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210702104018.19881-1-peter.maydell@linaro.org>
References: <20210702104018.19881-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Maxim Uvarov <maxim.uvarov@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: v5oRFcNYGMQT

The PL061 comes out of reset with all its lines configured as input,
which means they might need to be pulled to 0 or 1 depending on the
'pullups' and 'pulldowns' properties.  Currently we do not assert
these lines on reset; they will only be set whenever the guest first
touches a register that triggers a call to pl061_update().

Convert the device to three-phase reset so we have a place where we
can safely call qemu_set_irq() to set the floating lines to their
correct values.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/gpio/pl061.c      | 29 +++++++++++++++++++++++++----
 hw/gpio/trace-events |  1 +
 2 files changed, 26 insertions(+), 4 deletions(-)

diff --git a/hw/gpio/pl061.c b/hw/gpio/pl061.c
index bb496a19ade..8d12b2d6b97 100644
--- a/hw/gpio/pl061.c
+++ b/hw/gpio/pl061.c
@@ -448,13 +448,14 @@ static void pl061_write(void *opaque, hwaddr offset,
     return;
 }
 
-static void pl061_reset(DeviceState *dev)
+static void pl061_enter_reset(Object *obj, ResetType type)
 {
-    PL061State *s = PL061(dev);
+    PL061State *s = PL061(obj);
+
+    trace_pl061_reset(DEVICE(s)->canonical_path);
 
     /* reset values from PL061 TRM, Stellaris LM3S5P31 & LM3S8962 Data Sheet */
     s->data = 0;
-    s->old_out_data = 0;
     s->old_in_data = 0;
     s->dir = 0;
     s->isense = 0;
@@ -476,6 +477,24 @@ static void pl061_reset(DeviceState *dev)
     s->amsel = 0;
 }
 
+static void pl061_hold_reset(Object *obj)
+{
+    PL061State *s = PL061(obj);
+    int i, level;
+    uint8_t floating = pl061_floating(s);
+    uint8_t pullups = pl061_pullups(s);
+
+    for (i = 0; i < N_GPIOS; i++) {
+        if (extract32(floating, i, 1)) {
+            continue;
+        }
+        level = extract32(pullups, i, 1);
+        trace_pl061_set_output(DEVICE(s)->canonical_path, i, level);
+        qemu_set_irq(s->out[i], level);
+    }
+    s->old_out_data = pullups;
+}
+
 static void pl061_set_irq(void * opaque, int irq, int level)
 {
     PL061State *s = (PL061State *)opaque;
@@ -545,11 +564,13 @@ static Property pl061_props[] = {
 static void pl061_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
 
     dc->vmsd = &vmstate_pl061;
-    dc->reset = &pl061_reset;
     dc->realize = pl061_realize;
     device_class_set_props(dc, pl061_props);
+    rc->phases.enter = pl061_enter_reset;
+    rc->phases.hold = pl061_hold_reset;
 }
 
 static const TypeInfo pl061_info = {
diff --git a/hw/gpio/trace-events b/hw/gpio/trace-events
index eb5fb4701c6..1dab99c5604 100644
--- a/hw/gpio/trace-events
+++ b/hw/gpio/trace-events
@@ -20,6 +20,7 @@ pl061_input_change(const char *id, int gpio, int level) "%s input %d changed to
 pl061_update_istate(const char *id, uint32_t istate, uint32_t im, int level) "%s GPIORIS 0x%x GPIOIE 0x%x interrupt level %d"
 pl061_read(const char *id, uint64_t offset, uint64_t r) "%s offset 0x%" PRIx64 " value 0x%" PRIx64
 pl061_write(const char *id, uint64_t offset, uint64_t value) "%s offset 0x%" PRIx64 " value 0x%" PRIx64
+pl061_reset(const char *id) "%s reset"
 
 # sifive_gpio.c
 sifive_gpio_read(uint64_t offset, uint64_t r) "offset 0x%" PRIx64 " value 0x%" PRIx64
-- 
2.20.1

