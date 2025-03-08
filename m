Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp251772njc;
        Sat, 8 Mar 2025 11:03:19 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWkMOzJ7LrmG3SFolr4QpNdVKji5Y0DrjtE3otaLZe1m8m26CdUJhq/8ZUKC3NX5Z01ZeX91WD6TmjzfQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGPwcSraQT6qaaDmZBaJ/ehmF9Ci9EK+/aa39lViwU8zXoATtBrQMeeCE/3DDi+527kLigf
X-Received: by 2002:ad4:5f85:0:b0:6e8:f9e6:c4e2 with SMTP id 6a1803df08f44-6e9006c9878mr124273396d6.32.1741460598826;
        Sat, 08 Mar 2025 11:03:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741460598; cv=none;
        d=google.com; s=arc-20240605;
        b=eDRD2RyCFdGyoR5Pqs/SKGRpTZZuxPlSzqUA3r5xsnrhwqlCNYQPL5wImTWzuzBo+e
         ZeRCZspXWexlXo0nfHIOc0tEMDYWOqLXxcgMos+K7mmyuF+dzWFaw56bk2frO6ktLCvA
         magVuKjsMxS5mOLvLEiy8u0i0gVFVu3kevhunfwyjbOchVdanZHPTVBdNv3RN7kGXOy7
         YtMLevysHptcbU/fw8S2wt/+R1YA5btT2Nn1JoXdCPaQiY87reE8io3jYSg5QFuC+aiX
         6Dv6zm2tnzXXgesfcSy2uuHTIbhbianFdy6Ed0LhGu8NZnJ/0D7CsMvT3hTLPkJMUGxO
         RBKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Tnj+mTi8s7/bMf+Ney6NYzMHgEQnS0OOPbvhz438H5o=;
        fh=1kYHpdNsadmN4fFrnK2YR1v864tymHXETY3HWs2oRWs=;
        b=PiH29NSeUPoKlJ2xpgS/ZWo2+WbKFw5SWiV9rk+zIb43i+sOITSCKh5ukTH54qcOvr
         IOnudN/xq2jRa6DlYoMCmZ/dvCyX9vH/+CloPtZ4ryLCIj95X6BixenRTUhGG5KR1ToT
         aingtx/te8K7jqjRQw/zUZZ+xZ+YkhFuENiYSPD4QoTG30hGgXwTnRgSD2aRgqAXXZkz
         fcjAsintHvcFC0Fl6cav9Cdb4zEj4rFAvcRr4ex7Wt+isV/l9QLV4+SIZjriHmzK2hyu
         EvwTM3f1nxpzH94dyIvYscFxzj0G8PGZwBENuNQrRtzJL4QdqEADlOlXT6UWfcAe8DMB
         xYdg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q6Reit88;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e8f7175914si59824076d6.321.2025.03.08.11.03.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 08 Mar 2025 11:03:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q6Reit88;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tqzS3-00078c-5D; Sat, 08 Mar 2025 14:03:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tqzRy-00072V-Ij
 for qemu-arm@nongnu.org; Sat, 08 Mar 2025 14:03:07 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tqzRw-0003a1-Ho
 for qemu-arm@nongnu.org; Sat, 08 Mar 2025 14:03:06 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-43bc48ff815so17229275e9.0
 for <qemu-arm@nongnu.org>; Sat, 08 Mar 2025 11:03:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741460581; x=1742065381; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Tnj+mTi8s7/bMf+Ney6NYzMHgEQnS0OOPbvhz438H5o=;
 b=Q6Reit88KFJXCxeDD20PQGv2eTkrorznqwF1/WQJamO7udYKooPocC2pWNdp1sGwQU
 JRHs6UuCKWO4KXG+OVqF4Fn1GxNFyvqSLXtq5zj3WuMLnPvFAeuKxkaDs2cPfglGMNWi
 uxwAwmEVcH9nyQqoRAkznX+RgS/mPZ/xwWappD5e0Sm8hbR6kQLa+5cZ4m3VE1+NgYCi
 Eqdm2dgnX82Y2XAx+QHg0laO/m3rzkhc0OKTiNS0BvcZueVE3DXjZxN5Yr5TORAmZ2TE
 7PHaOA+oDNOYnojFtYIy5hJPxsNy3izKdeRAG6SO8X62ZURrM3FxA37OdJxu8BNy8Koq
 EaLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741460581; x=1742065381;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Tnj+mTi8s7/bMf+Ney6NYzMHgEQnS0OOPbvhz438H5o=;
 b=aBDGF7YByf92J5vtsLyB7R4WEU7LeG8mUCU9Ecsk6IkIkniaUjCX8C0iEqpB3cNI6l
 6qvvw6XZRTTARv+zKNSFn8PAf4cuWP8/4dgVxEf/SJThRImtxZkMyZWXDr/Im6vG/ASm
 Xs2VZvpXzJslhofIFSx7AnfyEXrMAQuZN0n6OXV7eMIn5MHQ5Ejot51YHMAePPrguhPw
 sTowBoGrfr/XngbRgqm1214nJlLzbgiTU13gA0aMZpuDIfAdyJTkwCSsEX/tVCkC/a+3
 xhHOVZ93/mhwEjx1zeN+owxb8EKwaKaT8ZIszE3g5bVd+MsZ65I1ay+99RyJJOCxnkvA
 feKA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1iIRPsJP6Kik32OSGRTMxxF9qpTd+a86G53jIORetNjUIodw1z0/R9d/GRYAUmpprbFbOGrXStA==@nongnu.org
X-Gm-Message-State: AOJu0YynswTZOphBbBatYOQi02vyJCe0HR7fgZZ1ZXTsgQkc2Y6Dz347
 /SS9gBfIQEbfxcSdsmCWu8yeiCIH+Gji2ghXwtAq7MWa8YEdKiuAHfoNYjVhdUA=
X-Gm-Gg: ASbGncsJMdJAOsBH1tYaEpKupkLk1/Q2KmGrLA/bmNprL75gs1nfeSUeBmMmS5M1lVb
 j4DulxorTLOi+bfI4Wv0YRMkvOtlQ6x36guCSG/YZ48rFOAc1cDeP5vS2xfayuXfeweLDkdrRLr
 pSa2tLbL1vgm1k3R1WTWgqYMVyjdfCo6p+KaTkQuESulHyX0hRBapkA5k8q5TcAGKLCQrJJokHg
 MudJ5nekETM5uxPPUVgwON/nVdqbezhgKhkwIO6kDyPtRgvNuoibPXRkcSaF7771KkmtgzBi3pM
 G5z6kdkXjVqRVfE0fdY3s+ZUttSEU6mSuMG0eInfVHYUf5SV6+1YF+JesB5/ZSjMeUcS70IJXAB
 DU5uFONMaNMcfUHPF0vqY1xX2TAQ7aw==
X-Received: by 2002:a05:600c:5118:b0:439:873a:1114 with SMTP id
 5b1f17b1804b1-43ce4ac8229mr23840105e9.6.1741460581506; 
 Sat, 08 Mar 2025 11:03:01 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ce9f2d081sm27980775e9.21.2025.03.08.11.03.00
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 08 Mar 2025 11:03:00 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: BALATON Zoltan <balaton@eik.bme.hu>,
	qemu-devel@nongnu.org
Cc: Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Bin Meng <bmeng.cn@gmail.com>, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 Guenter Roeck <linux@roeck-us.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 06/12] hw/sd/sdhci: Allow SDHCI classes to register their
 own MemoryRegionOps
Date: Sat,  8 Mar 2025 20:02:24 +0100
Message-ID: <20250308190230.7508-7-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250308190230.7508-1-philmd@linaro.org>
References: <20250308190230.7508-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 3Cp1/K+U3MKh

Add MemoryRegionOps as a class property. For now it is only
used by TYPE_IMX_USDHC.
Otherwise the default remains in little endian.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/sd/sdhci.h |  1 +
 hw/sd/sdhci.c         | 22 ++++++++--------------
 2 files changed, 9 insertions(+), 14 deletions(-)

diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
index 2709a7a69d5..60a0442c805 100644
--- a/include/hw/sd/sdhci.h
+++ b/include/hw/sd/sdhci.h
@@ -112,6 +112,7 @@ typedef struct SDHCIClass {
         SysBusDeviceClass sbd_parent_class;
     };
 
+    const MemoryRegionOps *io_ops;
     uint32_t quirks;
     uint64_t iomem_size;
 } SDHCIClass;
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 59d506cafa3..d87a7bb45a4 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -1427,8 +1427,6 @@ void sdhci_initfn(SDHCIState *s)
                                    sdhci_raise_insertion_irq, s);
     s->transfer_timer = timer_new_ns(QEMU_CLOCK_VIRTUAL,
                                      sdhci_data_transfer, s);
-
-    s->io_ops = &sdhci_mmio_le_ops;
 }
 
 void sdhci_uninitfn(SDHCIState *s)
@@ -1445,6 +1443,7 @@ void sdhci_common_realize(SDHCIState *s, Error **errp)
     ERRP_GUARD();
     SDHCIClass *sc = SYSBUS_SDHCI_GET_CLASS(s);
 
+    s->io_ops = sc->io_ops ?: &sdhci_mmio_le_ops;
     switch (s->endianness) {
     case DEVICE_LITTLE_ENDIAN:
         /* s->io_ops is little endian by default */
@@ -1888,17 +1887,11 @@ static const MemoryRegionOps usdhc_mmio_ops = {
     .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
-static void imx_usdhc_init(Object *obj)
-{
-    SDHCIState *s = SYSBUS_SDHCI(obj);
-
-    s->io_ops = &usdhc_mmio_ops;
-}
-
 static void imx_usdhc_class_init(ObjectClass *oc, void *data)
 {
     SDHCIClass *sc = SYSBUS_SDHCI_CLASS(oc);
 
+    sc->io_ops = &usdhc_mmio_ops;
     sc->quirks = SDHCI_QUIRK_NO_BUSY_IRQ;
 
     sdhci_common_class_init(oc, data);
@@ -1955,11 +1948,13 @@ static const MemoryRegionOps sdhci_s3c_mmio_ops = {
     .endianness = DEVICE_LITTLE_ENDIAN,
 };
 
-static void sdhci_s3c_init(Object *obj)
+static void sdhci_s3c_class_init(ObjectClass *oc, void *data)
 {
-    SDHCIState *s = SYSBUS_SDHCI(obj);
+    SDHCIClass *sc = SYSBUS_SDHCI_CLASS(oc);
 
-    s->io_ops = &sdhci_s3c_mmio_ops;
+    sc->io_ops = &sdhci_s3c_mmio_ops;
+
+    sdhci_common_class_init(oc, data);
 }
 
 static const TypeInfo sdhci_types[] = {
@@ -1981,13 +1976,12 @@ static const TypeInfo sdhci_types[] = {
     {
         .name = TYPE_IMX_USDHC,
         .parent = TYPE_SYSBUS_SDHCI,
-        .instance_init = imx_usdhc_init,
         .class_init = imx_usdhc_class_init,
     },
     {
         .name = TYPE_S3C_SDHCI,
         .parent = TYPE_SYSBUS_SDHCI,
-        .instance_init = sdhci_s3c_init,
+        .class_init = sdhci_s3c_class_init,
     },
 };
 
-- 
2.47.1

