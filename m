Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp8139126ejc;
        Thu, 2 Mar 2023 03:41:52 -0800 (PST)
X-Google-Smtp-Source: AK7set+c9kr8gVEvmSTQOFiz90WS71PvV78uJawR7ZmuOxHN9B5kGO/P1oC0vuzuOwaGZkBpKFPD
X-Received: by 2002:a05:6214:da1:b0:574:124b:fa0d with SMTP id h1-20020a0562140da100b00574124bfa0dmr19322276qvh.7.1677757312185;
        Thu, 02 Mar 2023 03:41:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677757312; cv=none;
        d=google.com; s=arc-20160816;
        b=R+l2Ow39KO736wjPhxYfDXxejA4pIpBrsrjLS0ETIAjKcaGOkjXVoiVaFLOtMEscWk
         Kw0z1A1BXqz24lFGmgD9SKNnFfkk/QcpKTrMUsugHz9Q6nuKv88u5i29/TE5/4AZYiV4
         t8EoNYGqLUDjvxWSyGl6UHFWad8jigUFYq86JSiPjInhClDAPI+2edLn/juuvtmm/LUV
         7CNlj6SLXw020OmtxUXhVHALfcZo+BIzZUE5IJEQ7F2LWn0pyUhfPgqb6yvszOoxtSYG
         /20xZEW3KV83aFH1NgtqVfAB3javA/B+0ohl+LqrQ6a01aPvBakZDeOtGU6PumAnY8xo
         ssuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=gZ00j0RL6EPyiOjEg/gcT8mV4sWyhdEWLnycoYVAHvE=;
        b=iPtfl2r7/Ta4C9zTTtC5f97q4XyUVtWms9X790pE2EZ/zchQOEi8mDZt6FUqV59395
         mpXkWhgx9JOmK5vZlIeZy9hHq1tNvQvZD/IGXbSDc1KGQXOAJQ1iniXZKzGnE0wh5DFb
         oK8MtAsktZ0PR6rctgsDpbObdkZVgySec51Xc4oiM8CVBsg8PG+Eoz+dc8J05hbjrOpD
         oxNOjTvgA8SNZoum16Cc/K4/DNsYNTbWUW0u6un33WFLxNZtR0/OcHfFpaTYCUp+gzD5
         prV0gE24haoIpuok1+qolK7awUzGeQuAblxNKlnXEJHCnxN0c76XnEAXwYRMiG8WkDpN
         OiIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@163.com header.s=s110527 header.b=SpDCPUSr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=163.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l9-20020a0ce509000000b0056bfba05976si13568314qvm.342.2023.03.02.03.41.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Mar 2023 03:41:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@163.com header.s=s110527 header.b=SpDCPUSr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=163.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pXhJe-00043z-7T; Thu, 02 Mar 2023 06:41:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qianfanguijin@163.com>)
 id 1pXhJb-00041Z-R7; Thu, 02 Mar 2023 06:41:39 -0500
Received: from m12.mail.163.com ([123.126.96.233])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <qianfanguijin@163.com>)
 id 1pXhJZ-0006Am-2B; Thu, 02 Mar 2023 06:41:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=gZ00j
 0RL6EPyiOjEg/gcT8mV4sWyhdEWLnycoYVAHvE=; b=SpDCPUSr9n98gB7MrJOWM
 OdWugHKUxuXTbOelN8b8a7IKhrFIdtNsGlHcCyIguBYsQWJYof/tF36PpekSBDY4
 MS8Wnmo6ksR8k7f3Xhk7iCHJ/6rQaAPzXP7m8e+RaArcUnbvy3V+m6ya2FOBf9GB
 Yvi35OUQi/UZfEEDdOAumw=
Received: from DESKTOP-B1R4FVG.localdomain (unknown [144.123.156.254])
 by smtp20 (Coremail) with SMTP id H91pCgBni79OiwBknjVaGA--.63318S12;
 Thu, 02 Mar 2023 19:41:08 +0800 (CST)
From: qianfanguijin@163.com
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 qianfan Zhao <qianfanguijin@163.com>
Subject: [RFC PATCH v1 10/12] hw: sd: allwinner-sdhost: Add sun50i-a64 SoC
 support
Date: Thu,  2 Mar 2023 19:40:59 +0800
Message-Id: <20230302114102.32236-11-qianfanguijin@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230302114102.32236-1-qianfanguijin@163.com>
References: <20230302114102.32236-1-qianfanguijin@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: H91pCgBni79OiwBknjVaGA--.63318S12
X-Coremail-Antispam: 1Uf129KBjvJXoW3WFWkCry7XFWrWF4kAr48Xrb_yoWxZrW5pF
 ZYkw45GF45Gan3Jr47tF1DKF1rGa4kCF4UKrn3uF97Ar1DG3WYqa1qgay5JF4DGFZ8CF4U
 Aan0qFy5uFsxtaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pR-18kUUUUU=
X-Originating-IP: [144.123.156.254]
X-CM-SenderInfo: htld0w5dqj3xxmlqqiywtou0bp/1tbiXRQm7VWBoxmNQwAAsi
Received-SPF: pass client-ip=123.126.96.233;
 envelope-from=qianfanguijin@163.com; helo=m12.mail.163.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: i8XgsYZMobRM

From: qianfan Zhao <qianfanguijin@163.com>

A64's sd register was similar to H3, and it introduced a new register
named SAMP_DL_REG location at 0x144. The dma descriptor buffer size of
mmc2 is only 8K and the other mmc controllers has 64K.

Signed-off-by: qianfan Zhao <qianfanguijin@163.com>
---
 hw/sd/allwinner-sdhost.c         | 70 ++++++++++++++++++++++++++++++--
 include/hw/sd/allwinner-sdhost.h |  9 ++++
 2 files changed, 76 insertions(+), 3 deletions(-)

diff --git a/hw/sd/allwinner-sdhost.c b/hw/sd/allwinner-sdhost.c
index 51e5e90830..38e7844399 100644
--- a/hw/sd/allwinner-sdhost.c
+++ b/hw/sd/allwinner-sdhost.c
@@ -77,6 +77,7 @@ enum {
     REG_SD_DATA1_CRC  = 0x12C, /* CRC Data 1 from card/eMMC */
     REG_SD_DATA0_CRC  = 0x130, /* CRC Data 0 from card/eMMC */
     REG_SD_CRC_STA    = 0x134, /* CRC status from card/eMMC during write */
+    REG_SD_SAMP_DL    = 0x144, /* Sample Delay Control (sun50i-a64) */
     REG_SD_FIFO       = 0x200, /* Read/Write FIFO */
 };
 
@@ -158,6 +159,7 @@ enum {
     REG_SD_RES_CRC_RST      = 0x0,
     REG_SD_DATA_CRC_RST     = 0x0,
     REG_SD_CRC_STA_RST      = 0x0,
+    REG_SD_SAMPLE_DL_RST    = 0x00002000,
     REG_SD_FIFO_RST         = 0x0,
 };
 
@@ -438,6 +440,7 @@ static uint64_t allwinner_sdhost_read(void *opaque, hwaddr offset,
 {
     AwSdHostState *s = AW_SDHOST(opaque);
     AwSdHostClass *sc = AW_SDHOST_GET_CLASS(s);
+    bool out_of_bounds = false;
     uint32_t res = 0;
 
     switch (offset) {
@@ -556,13 +559,24 @@ static uint64_t allwinner_sdhost_read(void *opaque, hwaddr offset,
     case REG_SD_FIFO:      /* Read/Write FIFO */
         res = allwinner_sdhost_fifo_read(s);
         break;
+    case REG_SD_SAMP_DL: /* Sample Delay */
+        if (sc->can_calibrate) {
+            res = s->sample_delay;
+        } else {
+            out_of_bounds = true;
+        }
+        break;
     default:
-        qemu_log_mask(LOG_GUEST_ERROR, "%s: out-of-bounds offset %"
-                      HWADDR_PRIx"\n", __func__, offset);
+        out_of_bounds = true;
         res = 0;
         break;
     }
 
+    if (out_of_bounds) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: out-of-bounds offset %"
+                      HWADDR_PRIx"\n", __func__, offset);
+    }
+
     trace_allwinner_sdhost_read(offset, res, size);
     return res;
 }
@@ -581,6 +595,7 @@ static void allwinner_sdhost_write(void *opaque, hwaddr offset,
 {
     AwSdHostState *s = AW_SDHOST(opaque);
     AwSdHostClass *sc = AW_SDHOST_GET_CLASS(s);
+    bool out_of_bounds = false;
 
     trace_allwinner_sdhost_write(offset, value, size);
 
@@ -704,10 +719,21 @@ static void allwinner_sdhost_write(void *opaque, hwaddr offset,
     case REG_SD_DATA0_CRC: /* CRC Data 0 from card/eMMC */
     case REG_SD_CRC_STA:   /* CRC status from card/eMMC in write operation */
         break;
+    case REG_SD_SAMP_DL: /* Sample delay control */
+        if (sc->can_calibrate) {
+            s->sample_delay = value;
+        } else {
+            out_of_bounds = true;
+        }
+        break;
     default:
+        out_of_bounds = true;
+        break;
+    }
+
+    if (out_of_bounds) {
         qemu_log_mask(LOG_GUEST_ERROR, "%s: out-of-bounds offset %"
                       HWADDR_PRIx"\n", __func__, offset);
-        break;
     }
 }
 
@@ -756,6 +782,7 @@ static const VMStateDescription vmstate_allwinner_sdhost = {
         VMSTATE_UINT32(response_crc, AwSdHostState),
         VMSTATE_UINT32_ARRAY(data_crc, AwSdHostState, 8),
         VMSTATE_UINT32(status_crc, AwSdHostState),
+        VMSTATE_UINT32(sample_delay, AwSdHostState),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -794,6 +821,7 @@ static void allwinner_sdhost_realize(DeviceState *dev, Error **errp)
 static void allwinner_sdhost_reset(DeviceState *dev)
 {
     AwSdHostState *s = AW_SDHOST(dev);
+    AwSdHostClass *sc = AW_SDHOST_GET_CLASS(s);
 
     s->global_ctl = REG_SD_GCTL_RST;
     s->clock_ctl = REG_SD_CKCR_RST;
@@ -834,6 +862,10 @@ static void allwinner_sdhost_reset(DeviceState *dev)
     }
 
     s->status_crc = REG_SD_CRC_STA_RST;
+
+    if (sc->can_calibrate) {
+        s->sample_delay = REG_SD_SAMPLE_DL_RST;
+    }
 }
 
 static void allwinner_sdhost_bus_class_init(ObjectClass *klass, void *data)
@@ -867,6 +899,24 @@ static void allwinner_sdhost_sun5i_class_init(ObjectClass *klass, void *data)
     sc->is_sun4i = false;
 }
 
+static void allwinner_sdhost_sun50i_a64_class_init(ObjectClass *klass,
+                                                   void *data)
+{
+    AwSdHostClass *sc = AW_SDHOST_CLASS(klass);
+    sc->max_desc_size = 64 * KiB;
+    sc->is_sun4i = false;
+    sc->can_calibrate = true;
+}
+
+static void allwinner_sdhost_sun50i_a64_emmc_class_init(ObjectClass *klass,
+                                                        void *data)
+{
+    AwSdHostClass *sc = AW_SDHOST_CLASS(klass);
+    sc->max_desc_size = 8 * KiB;
+    sc->is_sun4i = false;
+    sc->can_calibrate = true;
+}
+
 static const TypeInfo allwinner_sdhost_info = {
     .name          = TYPE_AW_SDHOST,
     .parent        = TYPE_SYS_BUS_DEVICE,
@@ -889,6 +939,18 @@ static const TypeInfo allwinner_sdhost_sun5i_info = {
     .class_init    = allwinner_sdhost_sun5i_class_init,
 };
 
+static const TypeInfo allwinner_sdhost_sun50i_a64_info = {
+    .name          = TYPE_AW_SDHOST_SUN50I_A64,
+    .parent        = TYPE_AW_SDHOST,
+    .class_init    = allwinner_sdhost_sun50i_a64_class_init,
+};
+
+static const TypeInfo allwinner_sdhost_sun50i_a64_emmc_info = {
+    .name          = TYPE_AW_SDHOST_SUN50I_A64_EMMC,
+    .parent        = TYPE_AW_SDHOST,
+    .class_init    = allwinner_sdhost_sun50i_a64_emmc_class_init,
+};
+
 static const TypeInfo allwinner_sdhost_bus_info = {
     .name = TYPE_AW_SDHOST_BUS,
     .parent = TYPE_SD_BUS,
@@ -901,6 +963,8 @@ static void allwinner_sdhost_register_types(void)
     type_register_static(&allwinner_sdhost_info);
     type_register_static(&allwinner_sdhost_sun4i_info);
     type_register_static(&allwinner_sdhost_sun5i_info);
+    type_register_static(&allwinner_sdhost_sun50i_a64_info);
+    type_register_static(&allwinner_sdhost_sun50i_a64_emmc_info);
     type_register_static(&allwinner_sdhost_bus_info);
 }
 
diff --git a/include/hw/sd/allwinner-sdhost.h b/include/hw/sd/allwinner-sdhost.h
index 30c1e60404..1b951177dd 100644
--- a/include/hw/sd/allwinner-sdhost.h
+++ b/include/hw/sd/allwinner-sdhost.h
@@ -38,6 +38,12 @@
 /** Allwinner sun5i family and newer (A13, H2+, H3, etc) */
 #define TYPE_AW_SDHOST_SUN5I TYPE_AW_SDHOST "-sun5i"
 
+/** Allwinner sun50i-a64 */
+#define TYPE_AW_SDHOST_SUN50I_A64 TYPE_AW_SDHOST "-sun50i-a64"
+
+/** Allwinner sun50i-a64 emmc */
+#define TYPE_AW_SDHOST_SUN50I_A64_EMMC  TYPE_AW_SDHOST "-sun50i-a64-emmc"
+
 /** @} */
 
 /**
@@ -110,6 +116,7 @@ struct AwSdHostState {
     uint32_t startbit_detect;   /**< eMMC DDR Start Bit Detection Control */
     uint32_t response_crc;      /**< Response CRC */
     uint32_t data_crc[8];       /**< Data CRC */
+    uint32_t sample_delay;      /**< Sample delay control */
     uint32_t status_crc;        /**< Status CRC */
 
     /** @} */
@@ -132,6 +139,8 @@ struct AwSdHostClass {
     size_t max_desc_size;
     bool   is_sun4i;
 
+    /** does the IP block support autocalibration? */
+    bool can_calibrate;
 };
 
 #endif /* HW_SD_ALLWINNER_SDHOST_H */
-- 
2.25.1

