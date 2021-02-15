Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp5552842lfc;
        Mon, 15 Feb 2021 03:53:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw78AZaViRT4/44/9GIpoB0zErWImnmLqVE1lm+DHq8pSCLnIh+3TnqCoFQYRfvx+AWyhY8
X-Received: by 2002:a25:390:: with SMTP id 138mr22573366ybd.130.1613390029154;
        Mon, 15 Feb 2021 03:53:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613390029; cv=none;
        d=google.com; s=arc-20160816;
        b=oq7nLjYR1WbfEcc17+6yf1fK4TGhUw3xukUjySgkZzJ0mA8BqrRLcwhXXsCxiRjDmP
         I4LyaZI0wLb7n19xxwPN0xbRBGGzeJ1t/kbZQngvcwZ+AKlf6v/fppmC2HBeWojlgFE3
         n+bNLRx5PY4rY0iW+E1i+/2xxJpjXjA7quB1UjAaV+Sn6ZW86nkTKY9YbxPAegrr/PAG
         cUbBQb8MihGb4ASJkXFEOwTbj7ksKajShEipG9BDP5JTSmdw+f8BmhoO6/k1RNrK+6Nq
         XXxSRAxxFNuQ2kMh/Chx+qTXBM/Fx/hB48iBc6nNZfUPQMMcqbKEPW+cbD/EFEUj1H9G
         PQVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=shTSJl6L/H8wb4siiGCFXvHoXe+zewsk4Ogg6uSOUOc=;
        b=QV9k/hluIYocr/L3bUyMhCFPGWZP03bOmx/wiNJaVYZXiA9Ox9BlcAvcjT5rXTbeL2
         ArHOm7TMvcsy4OPB4E+0a3NCjIol4xYcDogfDJsnoRRdFPljJZskHzMveGs10pj5Z3TM
         n3sELlC4+M+dxuofwO6I8UxQm2bxmMWqgr3/uKspi8KJqRCYwjXyDFpVnrdjZznZVu00
         csOqa5Ms0X9jodCW2cYEwr0Rf5Vku4Utdgij+Jzjc9ItZn2p2nv3Ah1Ofctyi+Ixu2/B
         rc2oaFM4ZVSP8kTiTFY9C/p7GrfVdNt6gBjs846RKYP3T29Pk+zmOfLKdzgHgA8cR51X
         ooZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eMzzFH4F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z15si12655507ybg.411.2021.02.15.03.53.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Feb 2021 03:53:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eMzzFH4F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lBcRo-0001C7-Dw
	for alex.bennee@linaro.org; Mon, 15 Feb 2021 06:53:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBcQG-0006vr-Bh
 for qemu-arm@nongnu.org; Mon, 15 Feb 2021 06:52:12 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:40875)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lBcQD-0003s8-R8
 for qemu-arm@nongnu.org; Mon, 15 Feb 2021 06:52:12 -0500
Received: by mail-wm1-x32a.google.com with SMTP id o24so9021758wmh.5
 for <qemu-arm@nongnu.org>; Mon, 15 Feb 2021 03:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=shTSJl6L/H8wb4siiGCFXvHoXe+zewsk4Ogg6uSOUOc=;
 b=eMzzFH4FkG4AD266JpfsaeErVXuABv5yB6R/i9kl9N7IbbIqe1N8DJFsRiV/6vz9t8
 /csPJEP6Hk0uP8BjfUHZQ3xob7NStxMum6j7G+V0mqBJt7LLEyeh5/a9J67o5d2ioi41
 Vh304pPZqir5NyW2MEBaBUzUu7M6JCfW08YLeHzBN8jCsj/LTWJ4+IIGGxLMJlTGCxEv
 hjuDlJLMSnZZ/pH4Or5WqxN7TZSOaode99kTC51R50uGi+eK50nqJh1YDQj4NYt0joze
 Vdq3fFf2x8OvT2UxcVEfXxefhFacf7cJIRaWSeP1edPkP7iB9kUgK8PpeGt8crGLsqU8
 PIqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=shTSJl6L/H8wb4siiGCFXvHoXe+zewsk4Ogg6uSOUOc=;
 b=QylLp/z7Xwyzfzi+OpGBQsQcTxEX2B/t7A5fyhOYugXErxKVEwhlrzxR4HXPKyENBC
 aRlXRiJav8/z6/MWAhJpTqTgVB0afTEAS8O9yYb6RE4RlVAypZnOvBrPVWyJ1ixpkR4z
 1aIcXfyUIcxvuG5YZXT1kF99EvSjxaf98VaKKcqiT4J2hQr1UUFboQVGY+jEcRim55dm
 tyNrhRWYQnrMIhbZN3jPo6VxOjfwFZZ8zLbTMF6eVsKx2fmW3w+5dBMDINgYyAZ93FVx
 Nrfe8CzXNTsBogfjIEefJAadqx+rV/yPNWhY/Iu2NRDaqQiNmphbMwqSEU3EJGAJ5igb
 vnnw==
X-Gm-Message-State: AOAM5330tRcAmqMGsa6WHXlJrJdEVgraOiJPNXZhsHIQExthiX0z8iiP
 TajnIlR88W3woaXzxFHxwciVSInA0uBamw==
X-Received: by 2002:a1c:2ed4:: with SMTP id u203mr14278234wmu.45.1613389928504; 
 Mon, 15 Feb 2021 03:52:08 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l83sm25574812wmf.4.2021.02.15.03.52.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Feb 2021 03:52:08 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 05/24] hw/misc/mps2-fpgaio: Make number of LEDs
 configurable by board
Date: Mon, 15 Feb 2021 11:51:19 +0000
Message-Id: <20210215115138.20465-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210215115138.20465-1-peter.maydell@linaro.org>
References: <20210215115138.20465-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mn0FMrd7EdmF

The MPS2 board has 2 LEDs, but the MPS3 board has 10 LEDs.  The
FPGAIO device is similar on both sets of boards, but the LED0
register has correspondingly more bits that have an effect.  Add a
device property for number of LEDs.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/misc/mps2-fpgaio.h |  5 ++++-
 hw/misc/mps2-fpgaio.c         | 31 +++++++++++++++++++++++--------
 2 files changed, 27 insertions(+), 9 deletions(-)

diff --git a/include/hw/misc/mps2-fpgaio.h b/include/hw/misc/mps2-fpgaio.h
index a010fdb2b6d..bfe73134e78 100644
--- a/include/hw/misc/mps2-fpgaio.h
+++ b/include/hw/misc/mps2-fpgaio.h
@@ -28,13 +28,16 @@
 #define TYPE_MPS2_FPGAIO "mps2-fpgaio"
 OBJECT_DECLARE_SIMPLE_TYPE(MPS2FPGAIO, MPS2_FPGAIO)
 
+#define MPS2FPGAIO_MAX_LEDS 32
+
 struct MPS2FPGAIO {
     /*< private >*/
     SysBusDevice parent_obj;
 
     /*< public >*/
     MemoryRegion iomem;
-    LEDState *led[2];
+    LEDState *led[MPS2FPGAIO_MAX_LEDS];
+    uint32_t num_leds;
 
     uint32_t led0;
     uint32_t prescale;
diff --git a/hw/misc/mps2-fpgaio.c b/hw/misc/mps2-fpgaio.c
index 6af0e8f837a..b28a1be22cc 100644
--- a/hw/misc/mps2-fpgaio.c
+++ b/hw/misc/mps2-fpgaio.c
@@ -177,9 +177,14 @@ static void mps2_fpgaio_write(void *opaque, hwaddr offset, uint64_t value,
 
     switch (offset) {
     case A_LED0:
-        s->led0 = value & 0x3;
-        led_set_state(s->led[0], value & 0x01);
-        led_set_state(s->led[1], value & 0x02);
+        if (s->num_leds != 0) {
+            int i;
+
+            s->led0 = value & MAKE_64BIT_MASK(0, s->num_leds);
+            for (i = 0; i < s->num_leds; i++) {
+                led_set_state(s->led[i], value & (1 << i));
+            }
+        }
         break;
     case A_PRESCALE:
         resync_counter(s);
@@ -238,7 +243,7 @@ static void mps2_fpgaio_reset(DeviceState *dev)
     s->pscntr = 0;
     s->pscntr_sync_ticks = now;
 
-    for (size_t i = 0; i < ARRAY_SIZE(s->led); i++) {
+    for (size_t i = 0; i < s->num_leds; i++) {
         device_cold_reset(DEVICE(s->led[i]));
     }
 }
@@ -256,11 +261,19 @@ static void mps2_fpgaio_init(Object *obj)
 static void mps2_fpgaio_realize(DeviceState *dev, Error **errp)
 {
     MPS2FPGAIO *s = MPS2_FPGAIO(dev);
+    int i;
 
-    s->led[0] = led_create_simple(OBJECT(dev), GPIO_POLARITY_ACTIVE_HIGH,
-                                  LED_COLOR_GREEN, "USERLED0");
-    s->led[1] = led_create_simple(OBJECT(dev), GPIO_POLARITY_ACTIVE_HIGH,
-                                  LED_COLOR_GREEN, "USERLED1");
+    if (s->num_leds > MPS2FPGAIO_MAX_LEDS) {
+        error_setg(errp, "num-leds cannot be greater than %d",
+                   MPS2FPGAIO_MAX_LEDS);
+        return;
+    }
+
+    for (i = 0; i < s->num_leds; i++) {
+        g_autofree char *ledname = g_strdup_printf("USERLED%d", i);
+        s->led[i] = led_create_simple(OBJECT(dev), GPIO_POLARITY_ACTIVE_HIGH,
+                                      LED_COLOR_GREEN, ledname);
+    }
 }
 
 static bool mps2_fpgaio_counters_needed(void *opaque)
@@ -303,6 +316,8 @@ static const VMStateDescription mps2_fpgaio_vmstate = {
 static Property mps2_fpgaio_properties[] = {
     /* Frequency of the prescale counter */
     DEFINE_PROP_UINT32("prescale-clk", MPS2FPGAIO, prescale_clk, 20000000),
+    /* Number of LEDs controlled by LED0 register */
+    DEFINE_PROP_UINT32("num-leds", MPS2FPGAIO, num_leds, 2),
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
2.20.1

