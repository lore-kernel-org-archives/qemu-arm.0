Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2219378lfo;
        Fri, 5 Feb 2021 09:52:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJynt6yiGuNAq70ezfa9trLmnlGk/TsuI3siVnq+8wLSyFE6vqKzeXnSokW+9oRlh6m98TXb
X-Received: by 2002:a25:ac94:: with SMTP id x20mr7245457ybi.411.1612547573224;
        Fri, 05 Feb 2021 09:52:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612547573; cv=none;
        d=google.com; s=arc-20160816;
        b=WKnBja8Y+qQ4HbqR32A1+vyujMk4lRo34886JZyvmAghoRHE5dyfV+a6WluHh28VMC
         YuGdiu82ohDyjCt+Nc2VCs4A1a6PPyB7dYsjn/uzM4C5q+Wd6K6b9VTj7WI5mjujsemc
         xfYbnCW/fRYaqh4tnUmzBHK6aTGlE6f9bgWMsZH2LS29o/vmkVMf0ziqa6Xma1I3s8i/
         cmaSf9y+lc0rN0/fd/A79TlKqKF9i65awrs+JFlV7jJDxLSW4gBH+9JtApMOKq/YfGzR
         YRNc5szgch8vwo04TGmZyINDRcg7Uj20ynbDJxS/PiFa7yDBd+GPAPPCyjnGxN7xmHL1
         5xyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=vPha70CdlIz8Ft1BgdKuRx55ClhohOzaXUUXYhoxm5M=;
        b=FouIWSWY5zSjfJGE1fs8yqERt4Y9e3L7xCJ1w6ZWc3Vyp5Li5APyCzcr8nVCtYAH6/
         ltbmBvyl74nTZjYmRFV7GiRP9ED6hu5TXsQC+txrmb3sf8u117gdrgPNBntUWJJe+ODo
         oiJ7ORDtOYUl2qV7uYEpqesHae+WvpmO/UZSDQ6UkUwUYbp8e58SNS9ritTVLTKf/Gdw
         J103k1M3IbOLTHA3Rhat6Z9EH3TGXQPzbZpmraMS5skvEN4A4a7dxbUqF7R3aYPa+DSX
         BJVRKhehjZA5eg6I216pNA8pJRtQiZRsGffYji532DOaIaKs6xgYhFDQj8pTFhf30BY6
         a1CQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="g/8Lv/PC";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l204si9960528ybc.266.2021.02.05.09.52.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 Feb 2021 09:52:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="g/8Lv/PC";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l85Ho-000732-Il
	for alex.bennee@linaro.org; Fri, 05 Feb 2021 12:52:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l84Ta-0006kv-VM
 for qemu-arm@nongnu.org; Fri, 05 Feb 2021 12:00:59 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:37077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l84T8-00042Q-MZ
 for qemu-arm@nongnu.org; Fri, 05 Feb 2021 12:00:57 -0500
Received: by mail-wr1-x42c.google.com with SMTP id v15so8464994wrx.4
 for <qemu-arm@nongnu.org>; Fri, 05 Feb 2021 09:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=vPha70CdlIz8Ft1BgdKuRx55ClhohOzaXUUXYhoxm5M=;
 b=g/8Lv/PCmVVItNdnAT1VaNzH6B+1ScitB/EWkMXo76JuspwX8JbLRsHlLlLee0nDvW
 EWrJJV7170rDPEvm6/JvvOJBv0R5dHiecIISaq3C2j3KWh17zKwfN3NdhUeJ3+45Khl/
 0PUmeCACBhuD54Axrp3YkMofMjoHhcl7FGs8tpxROV9vCM1rNuBr7uW/nhAA03wxZ+pr
 ETdjw0M7A1WllSLuIK+X+MyFkaOGuWko4akScpG6ZOlP3wwxQoi6DKEdIAamjTCsqFs6
 mPskzGVRO6jR/oCWmQ0Pd9st2x1d40Id4RF4M0Pr+4s2BKDDdmu/OjRI5hZVMUHrl1Ax
 t0LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vPha70CdlIz8Ft1BgdKuRx55ClhohOzaXUUXYhoxm5M=;
 b=hxlo0Yi5MURHS/8KGLj93duU048RJJkLicyZB2Q8c6uMD4j45dTC28m779YFMG4Rvp
 8AI2hOLlahUbVkw1cVKzfku9GpY93l+tIBhN2jTMKHQF2zab9k51iJzxt8ptk8IK6lRR
 V7+dBl8YQH2fb+ibWF9o3XSxVRBiTIcFKAuM/xpz9lC8GQcs5IgUFlzKzn80MzmPBs54
 WfDd/lLMiRSPWMgfC61qYOfb/qMJIIcpIPMzWy/O88tGonOtwGfDcKlfb983VRoA+oqe
 Z7jcdAdy8NhIONgiH3RYdnh+KG9J55L3dTh1kd2nDPHVJYDFCOiLQXJJtCDuySzXxw2r
 qflQ==
X-Gm-Message-State: AOAM531Q9WdagyUD6xSxTQQJHLR6qngcy9DzHR0f7914vYoWYkepuMDR
 1aO7ATrYfpryfcnshha+2I8oLfuk52HcGw==
X-Received: by 2002:a5d:6712:: with SMTP id o18mr5862736wru.375.1612544425859; 
 Fri, 05 Feb 2021 09:00:25 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l11sm12200010wrt.23.2021.02.05.09.00.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Feb 2021 09:00:25 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 05/24] hw/misc/mps2-fpgaio: Make number of LEDs configurable
 by board
Date: Fri,  5 Feb 2021 17:00:00 +0000
Message-Id: <20210205170019.25319-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210205170019.25319-1-peter.maydell@linaro.org>
References: <20210205170019.25319-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /J7RhUh2ia1d

The MPS2 board has 2 LEDs, but the MPS3 board has 10 LEDs.  The
FPGAIO device is similar on both sets of boards, but the LED0
register has correspondingly more bits that have an effect.  Add a
device property for number of LEDs.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
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

