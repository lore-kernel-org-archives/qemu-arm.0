Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2113620ejc;
        Mon, 9 Jan 2023 01:32:12 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv39AQsczHhkiKvBnK9MeF6lPR8ZxiTxifdgAei7SYzZM0RY0cKAqWyBBu22u5WcFMGmYOc
X-Received: by 2002:a0c:8067:0:b0:4c6:f5e2:f13a with SMTP id 94-20020a0c8067000000b004c6f5e2f13amr89173057qva.37.1673256732199;
        Mon, 09 Jan 2023 01:32:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673256732; cv=none;
        d=google.com; s=arc-20160816;
        b=mVrmHXt8GbgaVgZ1CAfb5LsVZfjwuXsYB/hqz6gnDsq8VjcKAmVspvUZ9Xn1WTA6ZZ
         jU+fIXEQSyCaVL89wVeC7VfA9+lkqcbYUIN+RTjSc1jMH0/qM0lpgET0Fn/+fQ3/DJkp
         YR5SZgUj5BHGtC11iVJqqgorTaFmCJ1t9vq++Svyip/PHTLjlMu1/bfUYMgFQR+BdQwn
         LN8S7OBr+Nb8HbWHRHvksWaOQ50yYMfvSA8QmiD/H5Z3rFz/7cphAslJcinD+d2aDO5/
         YOBKENNBFINO4gquHoEN/Dpv524zl/Zj94sQteblP15ZjQ1Wn+N16L+C4o2XAHksn6T4
         LjFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=OifjLWkIiTpp4NzZ3D7HB/BxO662eTPuWGQeISpUJWM=;
        b=gVH8KtXc/E495FZIVPfJxCOb0a4qacDZGmyYJbO8hPrK6wPM+vPeYoHAp3C0xOmZxl
         C+fnhZBQDeaEEUW86N/tmEDcTpd1k8odlz+cQ48Xgdix2zZPwhP48et+hQQ33rpt6eeg
         avwa12qvcJ86xy6wXm829aaeLw9Q29euw7UZlnAOULRz4BRx57fz/8ha1qoxN9gj/vMp
         5vqB1n0yoNjfy7OTXxjH8HJlskPcnlw8eMtN9xq2SwxkE0XDDKdFJBUTN7iSK79JaIS4
         dZ5a/Ms1UmuCIL76Gb2/KQbKeTxJ64KeoNYKv4iULPRcnQ6mO3YSssZe6WSNva2inNVr
         /n+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y95U5XbF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id if11-20020a0562141c4b00b004c76586484asi4050937qvb.332.2023.01.09.01.32.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Jan 2023 01:32:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=y95U5XbF;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEoIJ-0000y5-O1; Mon, 09 Jan 2023 04:18:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEoII-0000xY-1A
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 04:18:14 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEoIF-0002mN-Bo
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 04:18:12 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 k22-20020a05600c1c9600b003d1ee3a6289so6086269wms.2
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 01:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OifjLWkIiTpp4NzZ3D7HB/BxO662eTPuWGQeISpUJWM=;
 b=y95U5XbFCWMH4UqxWXs/nMeNNckTxjBw5GqzEhKQPhz4seP5+cFAG0pqzIo9ZJ4zs0
 ilHmhIGE5yZ0bHOYFagl7O2tmUx4IzDa3xMSF8Yuptg9fgHyx19P3yu2vKV1yTkZsqPg
 4njqe4X1UHpV8ygPQSgRJljrF6p/C/qwfiAMcs3GPlRn4/+KJJl0VERg9Hh7jOZspBzo
 Qi2/gDJ93kONkTHMVk3USBmq0Ey5Gss7o1VRGLGq5KgFC1cYw6PVaz7R0nDxDqa8q3C2
 XXMTaxKPkxL0clu7Nc63uOLH5A29kSFLPmjFG5pGTNATtvJC2o11eSxAoq3lVEYwqUrJ
 wYug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OifjLWkIiTpp4NzZ3D7HB/BxO662eTPuWGQeISpUJWM=;
 b=mt0gKyuvDEu3ERWmTgk3XBcClkYYmOzqSlS0eZdFZtkQqHmI1ukcQK/wVDZ1tV1Fip
 j6rM6H+s1j6RaoaECNUTgP8Rm2smY8ZwisvR8beybNiSTiiQ1NjJXUIA9ZDyBdJcPjJ5
 Mk/fuWcnwRnZkr6gRtkFSPF+TC5BAQPcc21NqQSlvfqCn1JEoE/tUmlH0SYAjUUcU9of
 IIGIsYCVUrl2GTJbUq7IHD2ppaS9YmXnY5VQmAh8ZsFHKwXuVc0JrxuDCFcMcD00v98L
 qfFBC2ep/mx0PZb/YmleFV0DvAGvNFfPMej1VQ6/a1haSNj+0aOGkgAPL+ZRKbbsofAc
 Cj6w==
X-Gm-Message-State: AFqh2kofYaPMHaIvwqnCvCCJMXl9W/vbWG3eoKP82puqOzRpIH/b78g5
 K0OZYRV/O/SUSnc1I0Tv0eWfG+ao5BLjGVWv
X-Received: by 2002:a05:600c:5022:b0:3c6:e61e:ae8c with SMTP id
 n34-20020a05600c502200b003c6e61eae8cmr55792568wmr.28.1673255889877; 
 Mon, 09 Jan 2023 01:18:09 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 2-20020a05600c228200b003d9e00dfccfsm8342334wmf.8.2023.01.09.01.18.09
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 01:18:09 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 3/5] hw/i2c/versatile_i2c: Replace TYPE_VERSATILE_I2C ->
 TYPE_ARM_SBCON_I2C
Date: Mon,  9 Jan 2023 10:17:52 +0100
Message-Id: <20230109091754.79499-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109091754.79499-1-philmd@linaro.org>
References: <20230109091754.79499-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: EsIcTvQT1djz

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/realview.c              | 2 +-
 hw/arm/versatilepb.c           | 2 +-
 hw/arm/vexpress.c              | 2 +-
 hw/i2c/versatile_i2c.c         | 4 ++--
 include/hw/i2c/arm_sbcon_i2c.h | 3 +--
 5 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/hw/arm/realview.c b/hw/arm/realview.c
index d2dc8a8952..a5aa2f046a 100644
--- a/hw/arm/realview.c
+++ b/hw/arm/realview.c
@@ -309,7 +309,7 @@ static void realview_init(MachineState *machine,
         }
     }
 
-    dev = sysbus_create_simple(TYPE_VERSATILE_I2C, 0x10002000, NULL);
+    dev = sysbus_create_simple(TYPE_ARM_SBCON_I2C, 0x10002000, NULL);
     i2c = (I2CBus *)qdev_get_child_bus(dev, "i2c");
     i2c_slave_create_simple(i2c, "ds1338", 0x68);
 
diff --git a/hw/arm/versatilepb.c b/hw/arm/versatilepb.c
index ecc1f6cf74..e4fff668e2 100644
--- a/hw/arm/versatilepb.c
+++ b/hw/arm/versatilepb.c
@@ -336,7 +336,7 @@ static void versatile_init(MachineState *machine, int board_id)
     /* Add PL031 Real Time Clock. */
     sysbus_create_simple("pl031", 0x101e8000, pic[10]);
 
-    dev = sysbus_create_simple(TYPE_VERSATILE_I2C, 0x10002000, NULL);
+    dev = sysbus_create_simple(TYPE_ARM_SBCON_I2C, 0x10002000, NULL);
     i2c = (I2CBus *)qdev_get_child_bus(dev, "i2c");
     i2c_slave_create_simple(i2c, "ds1338", 0x68);
 
diff --git a/hw/arm/vexpress.c b/hw/arm/vexpress.c
index e1d1983ae6..391199d458 100644
--- a/hw/arm/vexpress.c
+++ b/hw/arm/vexpress.c
@@ -646,7 +646,7 @@ static void vexpress_common_init(MachineState *machine)
     sysbus_create_simple("sp804", map[VE_TIMER01], pic[2]);
     sysbus_create_simple("sp804", map[VE_TIMER23], pic[3]);
 
-    dev = sysbus_create_simple(TYPE_VERSATILE_I2C, map[VE_SERIALDVI], NULL);
+    dev = sysbus_create_simple(TYPE_ARM_SBCON_I2C, map[VE_SERIALDVI], NULL);
     i2c = (I2CBus *)qdev_get_child_bus(dev, "i2c");
     i2c_slave_create_simple(i2c, "sii9022", 0x39);
 
diff --git a/hw/i2c/versatile_i2c.c b/hw/i2c/versatile_i2c.c
index ee095762e5..b95c70608b 100644
--- a/hw/i2c/versatile_i2c.c
+++ b/hw/i2c/versatile_i2c.c
@@ -31,7 +31,7 @@
 
 typedef ArmSbconI2CState VersatileI2CState;
 DECLARE_INSTANCE_CHECKER(ArmSbconI2CState, VERSATILE_I2C,
-                         TYPE_VERSATILE_I2C)
+                         TYPE_ARM_SBCON_I2C)
 
 
 
@@ -98,7 +98,7 @@ static void versatile_i2c_init(Object *obj)
 }
 
 static const TypeInfo versatile_i2c_info = {
-    .name          = TYPE_VERSATILE_I2C,
+    .name          = TYPE_ARM_SBCON_I2C,
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(ArmSbconI2CState),
     .instance_init = versatile_i2c_init,
diff --git a/include/hw/i2c/arm_sbcon_i2c.h b/include/hw/i2c/arm_sbcon_i2c.h
index 0101422d9d..da9b5e8f83 100644
--- a/include/hw/i2c/arm_sbcon_i2c.h
+++ b/include/hw/i2c/arm_sbcon_i2c.h
@@ -17,8 +17,7 @@
 #include "hw/i2c/bitbang_i2c.h"
 #include "qom/object.h"
 
-#define TYPE_VERSATILE_I2C "versatile_i2c"
-#define TYPE_ARM_SBCON_I2C TYPE_VERSATILE_I2C
+#define TYPE_ARM_SBCON_I2C "versatile_i2c"
 
 typedef struct ArmSbconI2CState ArmSbconI2CState;
 DECLARE_INSTANCE_CHECKER(ArmSbconI2CState, ARM_SBCON_I2C, TYPE_ARM_SBCON_I2C)
-- 
2.38.1

