Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp1762790ejf;
        Sun, 25 Feb 2024 16:05:58 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW02EZ+co2RKXxFEgJWWkJordOM1oXsuk25Req4zfSRXMYAQacDXybKBOktaqDJ4xYGjEtD9g+PWa4rlRiuSYW5HSAsVCl3
X-Google-Smtp-Source: AGHT+IG7xr42I1m91RdMrfIg4m/ZGty/S74j9wVMyIIw/h7UWZi9SGuvX4D3ge8iRNdtZXxTophN
X-Received: by 2002:a05:620a:5697:b0:785:7403:8860 with SMTP id wg23-20020a05620a569700b0078574038860mr6088655qkn.50.1708905958494;
        Sun, 25 Feb 2024 16:05:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708905958; cv=none;
        d=google.com; s=arc-20160816;
        b=ev2sGxGyBC5XyrSvHBm/MjkH+nX/vgBxG4DgeFLEILoRP4xO/tat8pr0I9eQcvjJJY
         gDkkGU0+0tZylwWLy9zbw8Vel6/v2dLVrpalDdoZQ7i2oocr9tgF9BfR1cQjVjiBuQVu
         iqCWnVGtXiR3yEx6FPxMUD+VuNLsmpqjA6HpU/FkMzooaqQ1rqDelrCeO2l76L2ZlN6N
         88Tbcxp0cpjpZZ0Znpa7mF+T0SixdCnPu8/+hPG6Dv37vBOD/gxprpPV00MNea4UgcIg
         0DLYtqU+a53u+8IrOzewxc5gEgpiVYlskykPAHRPse1puYsVpc6VhjjzSvRTpfq1ILg2
         839A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Sdj2LKjTWfRffh840NVkRHn4jF2vWhTAo+Ql2VJiLDU=;
        fh=Q3ymybApXVKZLLe/tVr7XNOAtHP7L1mCO+uDLDigmRk=;
        b=KXo6MKMLHQZ6uK8qJ9VbTrRBDWjsKwsi7DJC8lgiroBSOXMr+spvKe/oakWcGwEcCM
         nGtI8aGyWmrBuUTxJPIz/APhag0rqsLIexD1Kz7eZK6G9PFVRdHJ+cxwplDW/9JE3Zm0
         zDZhnr14o97gx7hj8TEdxQn1pnxltKV6r2H5I0+3055sGc8dMtqEL176WpWFrDC5q8G1
         ibtN9Rv63m1otxpcp/EKfg7Xa41xKjIDzDh8hEIckuN6MG7O/5HG6CW/ToB2w3s4ZiQJ
         IClIrBj7H4x8qBsmO8VmRIxHC6OO/GHniUlqGZuBX3IVkhFPGdaoY9Dnv6Ya2JeYrbg0
         pURQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=kEHGShQH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id vr21-20020a05620a55b500b00785c0c8579fsi3743333qkn.632.2024.02.25.16.05.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 25 Feb 2024 16:05:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=kEHGShQH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1reOT0-0006kK-2C; Sun, 25 Feb 2024 19:03:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1reOSp-0006c2-9b; Sun, 25 Feb 2024 19:03:23 -0500
Received: from mail-yw1-x1129.google.com ([2607:f8b0:4864:20::1129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <serg.oker@gmail.com>)
 id 1reOSm-0000LW-8J; Sun, 25 Feb 2024 19:03:22 -0500
Received: by mail-yw1-x1129.google.com with SMTP id
 00721157ae682-6087192b092so27904167b3.0; 
 Sun, 25 Feb 2024 16:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708905797; x=1709510597; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Sdj2LKjTWfRffh840NVkRHn4jF2vWhTAo+Ql2VJiLDU=;
 b=kEHGShQHlfoUMJieCpCBr/0R9Ydm+gCDUpzWasJQGVgCooNZNQRaJQS1Ro2Nd6cZin
 39Ea7ZVKRlTMFiMQ5O8Wcd5s/HGjcsJr7+u7JnxQOJ32SJgxkCifp0R9mgInfyJfx7Hn
 yJJ5xMN0F5qcp6rgBJiB33c87kmbxtLG1dF/VXVA0QPybiTeFrpVnTOhC8kcO+ZueXKb
 L7L6rpZkdzwhPaDg7/ih4aYdCporTK0+A+4WfaFiqGz6OUjrhD4eJVYMGv+F680PdlPO
 XdfarBwPADdMuNnLBWm9Y36y1jsFZ5WGwBALQXSXGgFV+4ukcgcICc07nXK59Hf65or0
 s0nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708905797; x=1709510597;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Sdj2LKjTWfRffh840NVkRHn4jF2vWhTAo+Ql2VJiLDU=;
 b=Veym9yU0yiKxrgKHfRGkAuGTBATZkz7IqIiqf42hiLDQRhRbYN4bJQduHvxZWRJoFm
 vj+UVHDZL6uTvHtkpXfezfnTCjuzXC/U+dO28fXQ+LQcF60nuPCdnPalxBspB34qrMr1
 zxHKKruV/zvEaAbNdwZUmh6TYuuWrcFOQmfjRCHKUbbYFUQIG2ZXT87pdA2Z51nFhHIO
 6+BtjpvdsFXbIsS1eAzIo5VNzHojVbdQIJf4WPvQAgZFKXn/2eSQ9Zz86YI3quqr3s0v
 HxDMd3xOrJjcZ4ea9jmLqOwCn3FMV6YxbVH0HFHCkiQs/JzsNjC5Ejc4E5TVTDcwFngi
 13mQ==
X-Gm-Message-State: AOJu0YxUCwwwwYsNNm8RHPS4AoJhyWczK9Lcel/co0R1g5S8A3B/pf4Q
 YdNO7dQiRp1SRKKJFWcKuqBUOGd/erOMYMGYNup6clpVpm7i5fWs5KBoEkKVi+33Yw==
X-Received: by 2002:a81:e701:0:b0:608:42ac:1116 with SMTP id
 x1-20020a81e701000000b0060842ac1116mr5000259ywl.29.1708905797694; 
 Sun, 25 Feb 2024 16:03:17 -0800 (PST)
Received: from localhost.localdomain ([201.203.117.224])
 by smtp.gmail.com with ESMTPSA id
 t18-20020a818312000000b00607bfa1913csm938171ywf.114.2024.02.25.16.03.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Feb 2024 16:03:17 -0800 (PST)
From: Sergey Kambalin <serg.oker@gmail.com>
X-Google-Original-From: Sergey Kambalin <sergey.kambalin@auriga.com>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, Sergey Kambalin <sergey.kambalin@auriga.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 12/41] Add memory region for BCM2837 RPiVid ASB
Date: Sun, 25 Feb 2024 18:02:30 -0600
Message-Id: <20240226000259.2752893-13-sergey.kambalin@auriga.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240226000259.2752893-1-sergey.kambalin@auriga.com>
References: <20240226000259.2752893-1-sergey.kambalin@auriga.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1129;
 envelope-from=serg.oker@gmail.com; helo=mail-yw1-x1129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: Bznllf2F1qHY

Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/bcm2838_peripherals.c         | 3 +++
 include/hw/arm/bcm2838_peripherals.h | 2 ++
 include/hw/arm/raspi_platform.h      | 2 +-
 3 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/arm/bcm2838_peripherals.c b/hw/arm/bcm2838_peripherals.c
index 55ae56733f..ca2f37b260 100644
--- a/hw/arm/bcm2838_peripherals.c
+++ b/hw/arm/bcm2838_peripherals.c
@@ -185,6 +185,9 @@ static void bcm2838_peripherals_realize(DeviceState *dev, Error **errp)
         sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->gpio), 0));
 
     object_property_add_alias(OBJECT(s), "sd-bus", OBJECT(&s->gpio), "sd-bus");
+
+    /* BCM2838 RPiVid ASB must be mapped to prevent kernel crash */
+    create_unimp(s_base, &s->asb, "bcm2838-asb", BRDG_OFFSET, 0x24);
 }
 
 static void bcm2838_peripherals_class_init(ObjectClass *oc, void *data)
diff --git a/include/hw/arm/bcm2838_peripherals.h b/include/hw/arm/bcm2838_peripherals.h
index 86b0d96944..af085934c9 100644
--- a/include/hw/arm/bcm2838_peripherals.h
+++ b/include/hw/arm/bcm2838_peripherals.h
@@ -69,6 +69,8 @@ struct BCM2838PeripheralState {
     OrIRQState mmc_irq_orgate;
     OrIRQState dma_7_8_irq_orgate;
     OrIRQState dma_9_10_irq_orgate;
+
+    UnimplementedDeviceState asb;
 };
 
 struct BCM2838PeripheralClass {
diff --git a/include/hw/arm/raspi_platform.h b/include/hw/arm/raspi_platform.h
index 0db146e592..7bc4807fa5 100644
--- a/include/hw/arm/raspi_platform.h
+++ b/include/hw/arm/raspi_platform.h
@@ -73,7 +73,7 @@ uint64_t board_ram_size(uint32_t board_rev);
 #define MPHI_OFFSET             0x6000   /* Message-based Parallel Host Intf. */
 #define DMA_OFFSET              0x7000   /* DMA controller, channels 0-14 */
 #define ARBA_OFFSET             0x9000
-#define BRDG_OFFSET             0xa000
+#define BRDG_OFFSET             0xa000   /* RPiVid ASB for BCM2838 (BCM2711) */
 #define ARM_OFFSET              0xB000   /* ARM control block */
 #define ARMCTRL_OFFSET          (ARM_OFFSET + 0x000)
 #define ARMCTRL_IC_OFFSET       (ARM_OFFSET + 0x200) /* Interrupt controller */
-- 
2.34.1

