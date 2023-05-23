Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp1760741ejb;
        Tue, 23 May 2023 03:05:57 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4v8zJbppDQTBVJXOx4VFdmLQDl7XmKc2KafymjZwChN/7VgWQhlwgj8YLShe5OFsqgBe0a
X-Received: by 2002:a05:620a:219b:b0:75b:23a1:d84d with SMTP id g27-20020a05620a219b00b0075b23a1d84dmr3580546qka.15.1684836356828;
        Tue, 23 May 2023 03:05:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684836356; cv=none;
        d=google.com; s=arc-20160816;
        b=IBOdFAfj3byCOESwTIjEZjMP4k5N+RRi4WIdCpJW2CL7HjP3kv0H4kgQEQARHlk1zE
         mffzfAseUTrh/bjIvVo6BT2IcWEoBuvPOXNoDlnv77fegu5hOFR6WXhCcgT//4sWFBwQ
         rPkveLJulfgPZboa5A5sNiY/ItWzzfoHBr+RMh3Ky3+6zZ+7OdDRyzHM2OB/mjmF5YFp
         6bgXbFa3FWpDurRIir0Y53yMleRExX9zz2E89CjLFTevbjhzmdRntpF1pPL2dCVcwLF7
         pnEBZbObKdZY2IeVZMtY51Uu1BgheNIa1VRnNmJbpnsv9oSG4GliInSnzGV93iFNKb7v
         R1Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=VgY0PhCPXPsELfJ1N3Y7O3sibbpZFqwyeYcnZq7lV2c=;
        b=FD2cRxHyw3HATce7XipbGhO+9nGIgdm+XuinBbWFbNeS0g5DJnGSnBXhh4OC26RAIB
         Jq4rTazEYUPffC6DQmQUOzI3pFyGcJuatkcPyRg93CfKav1zHrPLTSyqLw2/SaSKwsrg
         enMI/kN5+rY28xwkLEZLBMHucWigsINPAUni+4O8gFnxLrF5dcvw3lqH2sHIthmSITXs
         ppkGMI0XD5mSATxpFWhmYj8EOw1uI75REgIePzJyVWGMif9yFvdAwJhHzMsbQLCizDjr
         Q3hTV79oAxNEWKinhtW1zo+Bw7zj/n/+mgZ3kGCcAc9/x8WEQnZJU+QHVJuRJngKBeap
         WdcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@163.com header.s=s110527 header.b=K86sNcuI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=163.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i16-20020a05620a151000b0075b2043cee9si1663664qkk.366.2023.05.23.03.05.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 May 2023 03:05:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@163.com header.s=s110527 header.b=K86sNcuI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=163.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q1Otg-0004sz-QN; Tue, 23 May 2023 06:05:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qianfanguijin@163.com>)
 id 1q1Ote-0004s6-Td; Tue, 23 May 2023 06:05:38 -0400
Received: from m12.mail.163.com ([220.181.12.217])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <qianfanguijin@163.com>)
 id 1q1Otc-00074g-Tg; Tue, 23 May 2023 06:05:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=VgY0P
 hCPXPsELfJ1N3Y7O3sibbpZFqwyeYcnZq7lV2c=; b=K86sNcuIMZDsmMIFiQmOh
 ECTc9tfSpY5NVkUSIgxTtYkPLNCOS09kWZRG9rwwFRhZmVnboXWkBgg0xsiCov2u
 K5sVKRhE1qQBH4pvYo1bf0XIHXQtvimKW181/MedZi021FtnR+Ne7vXKWaYMvqRJ
 ua2NBmbvYriXYXzjeFC9QA=
Received: from DESKTOP-B1R4FVG.localdomain (unknown [218.201.129.19])
 by zwqz-smtp-mta-g0-3 (Coremail) with SMTP id _____wAnDC3Wj2xkMfafAQ--.65319S9;
 Tue, 23 May 2023 18:05:26 +0800 (CST)
From: qianfanguijin@163.com
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Beniamino Galvani <b.galvani@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 qianfan Zhao <qianfanguijin@163.com>
Subject: [PATCH v5 07/11] hw: sd: allwinner-sdhost: Add sun50i-a64 SoC support
Date: Tue, 23 May 2023 18:05:04 +0800
Message-Id: <20230523100508.32564-8-qianfanguijin@163.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230523100508.32564-1-qianfanguijin@163.com>
References: <20230523100508.32564-1-qianfanguijin@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wAnDC3Wj2xkMfafAQ--.65319S9
X-Coremail-Antispam: 1Uf129KBjvJXoW3Jr4DAr4DWFWruw45Gr1fCrg_yoW3Ar1DpF
 ZYkw45GF45Gan3Jr47KFnrKF1rG34kCr4UKrn3uF97AryDJ3Z0qw4DKay5JF4DGFZ8CF4U
 Aan0qFy5uFsxtaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0z_F4iPUUUUU=
X-Originating-IP: [218.201.129.19]
X-CM-SenderInfo: htld0w5dqj3xxmlqqiywtou0bp/xtbBzgp47WI0ZReI7gABsS
Received-SPF: pass client-ip=220.181.12.217;
 envelope-from=qianfanguijin@163.com; helo=m12.mail.163.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: iwu0harg1kYH

From: qianfan Zhao <qianfanguijin@163.com>

A64's sd register was similar to H3, and it introduced a new register
named SAMP_DL_REG location at 0x144. The dma descriptor buffer size of
mmc2 is only 8K and the other mmc controllers has 64K.

Also fix allwinner-r40's mmc controller type.

Signed-off-by: qianfan Zhao <qianfanguijin@163.com>
---
 hw/arm/allwinner-r40.c           |  2 +-
 hw/sd/allwinner-sdhost.c         | 72 ++++++++++++++++++++++++++++++--
 include/hw/sd/allwinner-sdhost.h |  9 ++++
 3 files changed, 79 insertions(+), 4 deletions(-)

diff --git a/hw/arm/allwinner-r40.c b/hw/arm/allwinner-r40.c
index 0e4542d35f..b148c56449 100644
--- a/hw/arm/allwinner-r40.c
+++ b/hw/arm/allwinner-r40.c
@@ -271,7 +271,7 @@ static void allwinner_r40_init(Object *obj)
 
     for (int i = 0; i < AW_R40_NUM_MMCS; i++) {
         object_initialize_child(obj, mmc_names[i], &s->mmc[i],
-                                TYPE_AW_SDHOST_SUN5I);
+                                TYPE_AW_SDHOST_SUN50I_A64);
     }
 
     object_initialize_child(obj, "twi0", &s->i2c0, TYPE_AW_I2C_SUN6I);
diff --git a/hw/sd/allwinner-sdhost.c b/hw/sd/allwinner-sdhost.c
index 92a0f42708..286e009509 100644
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
 
@@ -459,6 +461,7 @@ static uint64_t allwinner_sdhost_read(void *opaque, hwaddr offset,
 {
     AwSdHostState *s = AW_SDHOST(opaque);
     AwSdHostClass *sc = AW_SDHOST_GET_CLASS(s);
+    bool out_of_bounds = false;
     uint32_t res = 0;
 
     switch (offset) {
@@ -577,13 +580,24 @@ static uint64_t allwinner_sdhost_read(void *opaque, hwaddr offset,
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
@@ -602,6 +616,7 @@ static void allwinner_sdhost_write(void *opaque, hwaddr offset,
 {
     AwSdHostState *s = AW_SDHOST(opaque);
     AwSdHostClass *sc = AW_SDHOST_GET_CLASS(s);
+    bool out_of_bounds = false;
 
     trace_allwinner_sdhost_write(offset, value, size);
 
@@ -725,10 +740,21 @@ static void allwinner_sdhost_write(void *opaque, hwaddr offset,
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
 
@@ -777,6 +803,7 @@ static const VMStateDescription vmstate_allwinner_sdhost = {
         VMSTATE_UINT32(response_crc, AwSdHostState),
         VMSTATE_UINT32_ARRAY(data_crc, AwSdHostState, 8),
         VMSTATE_UINT32(status_crc, AwSdHostState),
+        VMSTATE_UINT32(sample_delay, AwSdHostState),
         VMSTATE_END_OF_LIST()
     }
 };
@@ -815,6 +842,7 @@ static void allwinner_sdhost_realize(DeviceState *dev, Error **errp)
 static void allwinner_sdhost_reset(DeviceState *dev)
 {
     AwSdHostState *s = AW_SDHOST(dev);
+    AwSdHostClass *sc = AW_SDHOST_GET_CLASS(s);
 
     s->global_ctl = REG_SD_GCTL_RST;
     s->clock_ctl = REG_SD_CKCR_RST;
@@ -855,6 +883,10 @@ static void allwinner_sdhost_reset(DeviceState *dev)
     }
 
     s->status_crc = REG_SD_CRC_STA_RST;
+
+    if (sc->can_calibrate) {
+        s->sample_delay = REG_SD_SAMPLE_DL_RST;
+    }
 }
 
 static void allwinner_sdhost_bus_class_init(ObjectClass *klass, void *data)
@@ -879,6 +911,7 @@ static void allwinner_sdhost_sun4i_class_init(ObjectClass *klass, void *data)
     AwSdHostClass *sc = AW_SDHOST_CLASS(klass);
     sc->max_desc_size = 8 * KiB;
     sc->is_sun4i = true;
+    sc->can_calibrate = false;
 }
 
 static void allwinner_sdhost_sun5i_class_init(ObjectClass *klass, void *data)
@@ -886,6 +919,25 @@ static void allwinner_sdhost_sun5i_class_init(ObjectClass *klass, void *data)
     AwSdHostClass *sc = AW_SDHOST_CLASS(klass);
     sc->max_desc_size = 64 * KiB;
     sc->is_sun4i = false;
+    sc->can_calibrate = false;
+}
+
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
 }
 
 static const TypeInfo allwinner_sdhost_info = {
@@ -910,6 +962,18 @@ static const TypeInfo allwinner_sdhost_sun5i_info = {
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
@@ -922,6 +986,8 @@ static void allwinner_sdhost_register_types(void)
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

