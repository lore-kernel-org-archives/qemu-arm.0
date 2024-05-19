Received: by 2002:a17:906:eec5:b0:a5d:17e5:aef9 with SMTP id wu5csp856945ejb;
        Sun, 19 May 2024 02:43:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV8EFg5PMORKokPErzqQxM6+uR+sTg7yb3Xk547VDKxXe/TKWqQOElibTjVqa9ht2b2OgVeP7v3p0wUTONKTUJ8v5Brjvth
X-Google-Smtp-Source: AGHT+IGv6DJW60i3UFukhxPsTXsof3dsdaq/354P7hWx7rTqAu+8sB6eVz7Wtuh4AtAA8Tzhrd2Z
X-Received: by 2002:a05:6214:4a0a:b0:6a9:3497:d38c with SMTP id 6a1803df08f44-6a93497d6e6mr25567116d6.16.1716111802969;
        Sun, 19 May 2024 02:43:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716111802; cv=none;
        d=google.com; s=arc-20160816;
        b=wl2BuBh57zdOXbx0sowdLPDm6TnSXgPnrPd1/z0rPTXlixjbnaGD2ZfPA+6RJT+oHX
         ok3mNbe6tgZnYhFHuXMVUJ/u9Wbsibmkg1qJZDJzemHVSVtDsDxo9a5I3PxjgCWkg0nG
         xNePgVPGsd5JwoSXAIry3ME84rvqbfteeNpYbf6+cfqaCR9426nVhb/oYFLbio6CTTBK
         YsbUZAnG8K90UN4QLVPmXdHbt4v47F4VSDbsjeoYx7w+0cWMtV/ml5GifAqix4zHkmoa
         9h/rvPxYxh0ruKvKP95yWb9sNYa4FYKi8vSCnywQKACm4QCw2kH5tZJbHAtwWMgAPmho
         CHDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=nR1fFYfnhfe8OWUbCv/jg5IVIW3zj6nZbcBspKeIn5Q=;
        fh=F1oLrNJl6x+dMZE9ahIPUfYFMQstyilklVITsf9EEl8=;
        b=WzKzFTOFzYQ0qz4sxBJtiibfvmW3tN3xqGhIvmRIyNciQJQRnPKQBaeaxfCkYOBUi9
         Vw/ThgSRl6V+1wWggRrVrRaxEOFkdtXCBgYc0nnjutuVBVzo+kOSzSN/uxUkYQIwCS8v
         tHA6U7nMnmI8yxCrPClyyYN7GVxugrJ6NrAQpNmP4W4rejpv1gPw8PdALUlCJNZDGSmV
         sqRLHOPgK6HCEPtCNuVQQNCYF4o5aDsKlbWUE6e8ufDe4ntxs1UKPRd05CaPA3oEOO9j
         srAZdP0gwS2YmKa73B25klHQjDpQUTB0b5u4NIFVtFq/JvXRyZiwBMR2djef+LsHpkM6
         OCZA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=SxHvqIe8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6a35f3f9b67si87527346d6.102.2024.05.19.02.43.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 19 May 2024 02:43:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=SxHvqIe8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s8d3w-00021B-Hx; Sun, 19 May 2024 05:42:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rayhan.faizel@gmail.com>)
 id 1s8d3v-00020M-Ao; Sun, 19 May 2024 05:42:39 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rayhan.faizel@gmail.com>)
 id 1s8d3t-0004ZF-Fd; Sun, 19 May 2024 05:42:39 -0400
Received: by mail-pl1-x629.google.com with SMTP id
 d9443c01a7336-1f2ecea41deso37282985ad.1; 
 Sun, 19 May 2024 02:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716111755; x=1716716555; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nR1fFYfnhfe8OWUbCv/jg5IVIW3zj6nZbcBspKeIn5Q=;
 b=SxHvqIe83QpqRUibBcvfh9bBVHjAwfbl9OvwCYO9gHvF1JQgJzds+CmG0VxpMIqo1D
 ExMuHIPB7G7biBQQ/0Q1vLy+9LwQlM89JPhcnhiKVmkHYf+gJH7HnZ7b9zkmV9M6zRVc
 80mu6zCsfcn4blFzDNMrSSem+646biRTlgGAzoBL2g8F/ncj5UtqxWTYc4P6s7BhqwGq
 TE1Ij09ZT/MP0NuhGwLf/jz7xMgCnCabxYgNjGE0sfgf6uYljJ/iQFpdjmTkk+nz3/x4
 Mdb6kcDbPScGf+pJ6ih79dQoE1OaUmBMISLROo0mmiDFkR6XF/y2P1iHLlDBHLkbdjnJ
 nkPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716111755; x=1716716555;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nR1fFYfnhfe8OWUbCv/jg5IVIW3zj6nZbcBspKeIn5Q=;
 b=tOwcZRDysSC/+jUx9osvtWUx6sZ4ZpqsiTgR2Fq0dTEyJS4AuiLQrQxjUSyAjTo+WC
 X3p0VDhjizg3cyrtYcXijFnytHNxD0TFZR+od/moxMayz4UoUZ5TUtRDST8V29yrwUSB
 UmFAtv2Ci91KHXlozWlsxrhLd/FBAxeBkMxfqtqu/aMgwNxRAcTFrbqjIrJT/D137dy5
 f7FIW+Cadhb5E3pu1vmiZKE1grTwsxjOdODmCkjqbaayrGXaGFZO/BDVq+W23w1+nffZ
 gXHIT+1MChWE99XSPQ7dv4hJPPtVHISZgCNBMJuU8CmoewyyqGsxiwyRVm1hqhuIKk9W
 Xvgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtwOPzzJ5g6PqFHo5ecr7Tz8kQsO/ZMi3+SEbizCUuzS3aQE+TSWE068v717HH+XYIVSFfZzf2zhdDpUt+M4aeevrN
X-Gm-Message-State: AOJu0Yxu6Yqbg95DifkAt80tQuRPRMgThdvw+U4ccZzhdQanD++Z6ni4
 x0fKSGApiCaKM994S19oDrOvrOZY2ouGchxDNSzSOk0gU3Bju6PYLJLYKA==
X-Received: by 2002:a17:90b:124b:b0:2ad:af1c:4fc with SMTP id
 98e67ed59e1d1-2b6cc76d23fmr22469754a91.25.1716111754804; 
 Sun, 19 May 2024 02:42:34 -0700 (PDT)
Received: from localhost.localdomain ([49.47.193.102])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2b62863a265sm19977932a91.10.2024.05.19.02.42.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 May 2024 02:42:34 -0700 (PDT)
From: Rayhan Faizel <rayhan.faizel@gmail.com>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org, peter.maydell@linaro.org, qemu-arm@nongnu.org,
 Rayhan Faizel <rayhan.faizel@gmail.com>
Subject: [PATCH v3 2/3] hw/arm: Connect OTP device to BCM2835
Date: Sun, 19 May 2024 15:11:05 +0530
Message-Id: <20240519094106.2142896-3-rayhan.faizel@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240519094106.2142896-1-rayhan.faizel@gmail.com>
References: <20240519094106.2142896-1-rayhan.faizel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=rayhan.faizel@gmail.com; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: rPOrEwAvZRc2

Replace stubbed OTP memory region with the new OTP device.

Signed-off-by: Rayhan Faizel <rayhan.faizel@gmail.com>
---
 hw/arm/bcm2835_peripherals.c         | 13 ++++++++++++-
 include/hw/arm/bcm2835_peripherals.h |  3 ++-
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index 1695d8b453..7d735bb56c 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -116,6 +116,10 @@ static void raspi_peripherals_base_init(Object *obj)
     object_property_add_const_link(OBJECT(&s->fb), "dma-mr",
                                    OBJECT(&s->gpu_bus_mr));
 
+    /* OTP */
+    object_initialize_child(obj, "bcm2835-otp", &s->otp,
+                            TYPE_BCM2835_OTP);
+
     /* Property channel */
     object_initialize_child(obj, "property", &s->property,
                             TYPE_BCM2835_PROPERTY);
@@ -374,6 +378,14 @@ void bcm_soc_peripherals_common_realize(DeviceState *dev, Error **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->fb), 0,
                        qdev_get_gpio_in(DEVICE(&s->mboxes), MBOX_CHAN_FB));
 
+    /* OTP */
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->otp), errp)) {
+        return;
+    }
+
+    memory_region_add_subregion(&s->peri_mr, OTP_OFFSET,
+                sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->otp), 0));
+
     /* Property channel */
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->property), errp)) {
         return;
@@ -500,7 +512,6 @@ void bcm_soc_peripherals_common_realize(DeviceState *dev, Error **errp)
     create_unimp(s, &s->i2s, "bcm2835-i2s", I2S_OFFSET, 0x100);
     create_unimp(s, &s->smi, "bcm2835-smi", SMI_OFFSET, 0x100);
     create_unimp(s, &s->bscsl, "bcm2835-spis", BSC_SL_OFFSET, 0x100);
-    create_unimp(s, &s->otp, "bcm2835-otp", OTP_OFFSET, 0x80);
     create_unimp(s, &s->dbus, "bcm2835-dbus", DBUS_OFFSET, 0x8000);
     create_unimp(s, &s->ave0, "bcm2835-ave0", AVE0_OFFSET, 0x8000);
     create_unimp(s, &s->v3d, "bcm2835-v3d", V3D_OFFSET, 0x1000);
diff --git a/include/hw/arm/bcm2835_peripherals.h b/include/hw/arm/bcm2835_peripherals.h
index 636203baa5..1eeaeec9e0 100644
--- a/include/hw/arm/bcm2835_peripherals.h
+++ b/include/hw/arm/bcm2835_peripherals.h
@@ -33,6 +33,7 @@
 #include "hw/usb/hcd-dwc2.h"
 #include "hw/ssi/bcm2835_spi.h"
 #include "hw/i2c/bcm2835_i2c.h"
+#include "hw/nvram/bcm2835_otp.h"
 #include "hw/misc/unimp.h"
 #include "qom/object.h"
 
@@ -71,7 +72,7 @@ struct BCMSocPeripheralBaseState {
     BCM2835SPIState spi[1];
     BCM2835I2CState i2c[3];
     OrIRQState orgated_i2c_irq;
-    UnimplementedDeviceState otp;
+    BCM2835OTPState otp;
     UnimplementedDeviceState dbus;
     UnimplementedDeviceState ave0;
     UnimplementedDeviceState v3d;
-- 
2.34.1

