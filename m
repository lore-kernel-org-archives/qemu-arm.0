Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2441287lfm;
        Sun, 28 Jun 2020 14:42:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJznOzof9r6xXRfnHvFB745F21EEpPhx55cIkCGdq149wsgAFlB69h0IbjiWxx+pLL/idSJx
X-Received: by 2002:a25:dd85:: with SMTP id u127mr16457571ybg.484.1593380574849;
        Sun, 28 Jun 2020 14:42:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593380574; cv=none;
        d=google.com; s=arc-20160816;
        b=okQQLNs1zDvPiRJLwRw3sqqIg4EcB4RmqY6NRCSpTLIIG2Q8oBmtbDWcRqZkJ/EzZe
         M1akmEpe82hERtdr3YbeJz8JPgJ/1tFcHyoVhSQMgLLI+UPQ4HGPqgVTX2OxfeFkjt+z
         3H/8yOQkNf/pTVOGzfEPXU8RUnPe1UmRpfnLjqEVOfXb5ww/CyF/3ciZY2uC16wsR4NV
         WGoAGfS7UlnhTA5nva/+BB1OLFOv574BUpny2uDRwe63kaM4Hy15Uyr0Ppy/x+8aSxHY
         Nc/cspXJPlF5177BHakJ5NkDebj0NFHzcuVSsSf38vk+3W4E6BqXiNbeau9z0IlHxEsM
         EPog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=ueTMRGS8RlMtxcVmTh1y5s8U6X/zJuJaAqd5maYfOBU=;
        b=CvZRsts+9InLS82qm+H899fNlQH2qHmZ2qvzwylwle8tF0FzSvlpp9ic8DLAvCCwW3
         aeZNeLHkdMSERkLj4SxxZyzPr/Vt5LwDMnUmn2rs3fltp86gKtgHtWMdbEfAjvGTXoSs
         rY/n48hWUarf0GOTN69LgNjbKRo5g8m/jywCycBXuLxiauivHtTM3y04KQJE7iWdxPJC
         vR14wHRn28XNMuldzGyT/b4P+SBKXIy7idpuIVYSH8Ss+GqPHw3i8F8w5TU8gXkQPaxq
         xqbQp4Xc7sahqpZ8NYiLNXyW9ToyoGs9HVlmIFEOeoLPI1H5YJDK0YC3E5MLnJhPLc/I
         1bCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=klJLyuiK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f67si32807200ybi.238.2020.06.28.14.42.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 28 Jun 2020 14:42:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=klJLyuiK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jpf4g-0008K0-5D
	for alex.bennee@linaro.org; Sun, 28 Jun 2020 17:42:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jpf4Q-0008EG-9Z
 for qemu-arm@nongnu.org; Sun, 28 Jun 2020 17:42:38 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:44180)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jpf4O-00073Y-Bb
 for qemu-arm@nongnu.org; Sun, 28 Jun 2020 17:42:37 -0400
Received: by mail-wr1-x441.google.com with SMTP id b6so14639297wrs.11
 for <qemu-arm@nongnu.org>; Sun, 28 Jun 2020 14:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ueTMRGS8RlMtxcVmTh1y5s8U6X/zJuJaAqd5maYfOBU=;
 b=klJLyuiK2tqR7Fjyk0UQ8fm3uaf+tk0YWm8kOvRmZlFj7+UPvRceuPeaM1tbzGcTcA
 3cI+NseMKwUGCYInsLsIcyk9yMT/Klkc288MShVFw9xTHw+txKmoa57DmBxNHbxn0NmV
 JcgV1X/hrUDhNJXfsMbjeFZQBYfql3UiUGe2FNso2D/xN+RVC2O97sRSh0C+Sz5S8/hJ
 G78DR7Xr+r9ziN6zonuLYRLwyXnYj6CbWsvVFCHASJdo69caxrIx3O4J8lk3kqvmRscs
 gLUTbk+cNrxJp4gDg4HbVH7W5oR7n+DL70Ex4U3rrOd12alVQc2t0JXKkIaWWLmHzjE1
 2wZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ueTMRGS8RlMtxcVmTh1y5s8U6X/zJuJaAqd5maYfOBU=;
 b=Rn9HTLUAjrS+4CD59SFKPxCeL7Fv29jktuxrL5xBQBrNzDR5ZvyuSEf8C1XkEupeln
 qImSj08eO8Odnnux3ENE3IP7E+kR4wBQifgTga3jVuv1sQfBg/wBdgqtnV7iBxF0kGsz
 tgPNDhM92ev1+a568XsCAPQGAViYjKqpKkFZhN7mH5hzr+HpP+GTZqL7siFjqLk3qsvR
 vwB4r1y2JHNLxFoq3oCEo5vrVd+GFTY0xGNbhGH2jAIVZz5y5h28WRsGyINMmV3jZch3
 fIoIWimQ2LAw+kWfXR86P1+dtDTlmMrsWve+ZPBsyIayrZA70KindGt5KGgxenSwerzl
 cGJA==
X-Gm-Message-State: AOAM531j8Gtdn6SJmSOnHGwKHPIFXJTFU72V+pZM2Ny1Elz43x/wCKVX
 0/tMB6oiWMimClQJregNZ4w7R1/rVJMK2A==
X-Received: by 2002:a5d:610a:: with SMTP id v10mr14159235wrt.108.1593380554713; 
 Sun, 28 Jun 2020 14:42:34 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id t16sm26300948wru.9.2020.06.28.14.42.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Jun 2020 14:42:34 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 2/2] hw/arm/palm.c: Encapsulate misc GPIO handling in a device
Date: Sun, 28 Jun 2020 22:42:30 +0100
Message-Id: <20200628214230.2592-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200628214230.2592-1-peter.maydell@linaro.org>
References: <20200628214230.2592-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: eKWQ38S1Dmwp

Replace the free-floating set of IRQs and palmte_onoff_gpios()
function with a simple QOM device that encapsulates this
behaviour.

This fixes Coverity issue CID 1421944, which points out that
the memory returned by qemu_allocate_irqs() is leaked.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/palm.c | 61 +++++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 52 insertions(+), 9 deletions(-)

diff --git a/hw/arm/palm.c b/hw/arm/palm.c
index 569836178f6..e7bc9ea4c6a 100644
--- a/hw/arm/palm.c
+++ b/hw/arm/palm.c
@@ -124,6 +124,21 @@ static void palmte_button_event(void *opaque, int keycode)
                         !(keycode & 0x80));
 }
 
+/*
+ * Encapsulation of some GPIO line behaviour for the Palm board
+ *
+ * QEMU interface:
+ *  + unnamed GPIO inputs 0..6: for the various miscellaneous input lines
+ */
+
+#define TYPE_PALM_MISC_GPIO "palm-misc-gpio"
+#define PALM_MISC_GPIO(obj) \
+    OBJECT_CHECK(PalmMiscGPIOState, (obj), TYPE_PALM_MISC_GPIO)
+
+typedef struct PalmMiscGPIOState {
+    SysBusDevice parent_obj;
+} PalmMiscGPIOState;
+
 static void palmte_onoff_gpios(void *opaque, int line, int level)
 {
     switch (line) {
@@ -151,23 +166,44 @@ static void palmte_onoff_gpios(void *opaque, int line, int level)
     }
 }
 
+static void palm_misc_gpio_init(Object *obj)
+{
+    DeviceState *dev = DEVICE(obj);
+
+    qdev_init_gpio_in(dev, palmte_onoff_gpios, 7);
+}
+
+static const TypeInfo palm_misc_gpio_info = {
+    .name = TYPE_PALM_MISC_GPIO,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(PalmMiscGPIOState),
+    .instance_init = palm_misc_gpio_init,
+    /*
+     * No class init required: device has no internal state so does not
+     * need to set up reset or vmstate, and has no realize method.
+     */
+};
+
 static void palmte_gpio_setup(struct omap_mpu_state_s *cpu)
 {
-    qemu_irq *misc_gpio;
+    DeviceState *misc_gpio;
+
+    misc_gpio = sysbus_create_simple(TYPE_PALM_MISC_GPIO, -1, NULL);
 
     omap_mmc_handlers(cpu->mmc,
                     qdev_get_gpio_in(cpu->gpio, PALMTE_MMC_WP_GPIO),
                     qemu_irq_invert(omap_mpuio_in_get(cpu->mpuio)
                             [PALMTE_MMC_SWITCH_GPIO]));
 
-    misc_gpio = qemu_allocate_irqs(palmte_onoff_gpios, cpu, 7);
-    qdev_connect_gpio_out(cpu->gpio, PALMTE_MMC_POWER_GPIO,     misc_gpio[0]);
-    qdev_connect_gpio_out(cpu->gpio, PALMTE_SPEAKER_GPIO,       misc_gpio[1]);
-    qdev_connect_gpio_out(cpu->gpio, 11,                        misc_gpio[2]);
-    qdev_connect_gpio_out(cpu->gpio, 12,                        misc_gpio[3]);
-    qdev_connect_gpio_out(cpu->gpio, 13,                        misc_gpio[4]);
-    omap_mpuio_out_set(cpu->mpuio, 1,                           misc_gpio[5]);
-    omap_mpuio_out_set(cpu->mpuio, 3,                           misc_gpio[6]);
+    qdev_connect_gpio_out(cpu->gpio, PALMTE_MMC_POWER_GPIO,
+                          qdev_get_gpio_in(misc_gpio, 0));
+    qdev_connect_gpio_out(cpu->gpio, PALMTE_SPEAKER_GPIO,
+                          qdev_get_gpio_in(misc_gpio, 1));
+    qdev_connect_gpio_out(cpu->gpio, 11, qdev_get_gpio_in(misc_gpio, 2));
+    qdev_connect_gpio_out(cpu->gpio, 12, qdev_get_gpio_in(misc_gpio, 3));
+    qdev_connect_gpio_out(cpu->gpio, 13, qdev_get_gpio_in(misc_gpio, 4));
+    omap_mpuio_out_set(cpu->mpuio, 1, qdev_get_gpio_in(misc_gpio, 5));
+    omap_mpuio_out_set(cpu->mpuio, 3, qdev_get_gpio_in(misc_gpio, 6));
 
     /* Reset some inputs to initial state.  */
     qemu_irq_lower(qdev_get_gpio_in(cpu->gpio, PALMTE_USBDETECT_GPIO));
@@ -276,3 +312,10 @@ static void palmte_machine_init(MachineClass *mc)
 }
 
 DEFINE_MACHINE("cheetah", palmte_machine_init)
+
+static void palm_register_types(void)
+{
+    type_register_static(&palm_misc_gpio_info);
+}
+
+type_init(palm_register_types)
-- 
2.20.1

