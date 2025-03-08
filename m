Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp252667njc;
        Sat, 8 Mar 2025 11:04:54 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUwJ6WMEnsN/aBeMSGeHgL1f9VDEvS3jVj0lN7iqaaOc5MxjeCWGx6o0AxOp2bFHSJTJQdH5mf2u8uFIg==@linaro.org
X-Google-Smtp-Source: AGHT+IFHoZsb8gsDMLwPDcQ2NZNHaBAMpVe37aIrh7sAa360eQAAyqQIn6OSyJkaLYgi5DTSOJsI
X-Received: by 2002:a05:622a:438a:b0:474:e1bd:98bf with SMTP id d75a77b69052e-476621ea1eamr48596221cf.0.1741460693878;
        Sat, 08 Mar 2025 11:04:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741460693; cv=none;
        d=google.com; s=arc-20240605;
        b=gPl15rqWjG6BQcsNLDbQYvLUKp6M/rAMFtgtZQJE3Ec9tPGZvDabvSwiAweC/IpHiM
         Hy+4TVvFSxzOp9x15crACevBwAREUrxMGZT5F7p8rNvwfGTlfxJSnB9nN4Zk8aZ7fPuR
         nUBEm1+erpv9tyg73phirnmua3dYOkvgspJcKeUY2fc1gRWPJ1keYgJlK7Iw+1duakpE
         rLShvtsNokJL4NDqAODcjDUTe6+qurjpDdTED+PttHMM1SKhJp8Qb5X9cQ3qY0TfZE5A
         T7eo1WFFsWMFek7HUsQDpL3jwRokh6Rp/75sTNVVkscJrTjw1QKWJM4rj7XQc5fsFLgT
         MA9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=kVOO+KOKZ3d7DAin1HuzOowHrfcYHXZ8ykM+c1XZbKY=;
        fh=lUZoJPRb3tn+3HvRGYaVgQ55y1IPHK0w1svPZHJJYb0=;
        b=RXYHvUbnQrHJle0vcEMzDVc0i+fYrEyWzlip2LslUbn9m3LUpVrwmAQ6JA0N/02Eq3
         lJhINWZ4yCsSDdnft5WoZzQ2HfRaTvg7pqjkT8Xn/JmgcH7S1jlHhWezsW9pn7aIZCfy
         mFBx7x3rTKlxjGqprQH2WaWnxudm9/mo+z1tR3xXdm+xiEgaUQ+5eWPbHmkTh+92vc+c
         ZWLtRcQte04Dn+6LNZCsmgRi9RLZwnLjPPVqi33izlqXPb0MD374nlRY3+wUvUu9I7lX
         hSEM728LmqZqzja7T6px91/lHsvhNt6ofpu5UVIbSn83jEq4gHP98th2rMGpH9HYKA4/
         RIGw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fth54c2r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-476622eb752si23086651cf.480.2025.03.08.11.04.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 08 Mar 2025 11:04:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fth54c2r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tqzSi-000894-9e; Sat, 08 Mar 2025 14:03:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tqzST-0007ob-G7
 for qemu-arm@nongnu.org; Sat, 08 Mar 2025 14:03:37 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tqzSK-0003fZ-Ma
 for qemu-arm@nongnu.org; Sat, 08 Mar 2025 14:03:35 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-43cf034d4abso820065e9.3
 for <qemu-arm@nongnu.org>; Sat, 08 Mar 2025 11:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741460607; x=1742065407; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kVOO+KOKZ3d7DAin1HuzOowHrfcYHXZ8ykM+c1XZbKY=;
 b=fth54c2r1QJZu+IEBe3PaTHBdIkGuJ0dm035QJonEBZPXNFZ6YhYobkOQEz3lBScO3
 6pvKNR4lJSL0ZeKbTbIQ+cCFxn/2n8fsociN4p0QhRFmmkr9mjqbUUcZk5KaIbvCCPpf
 rQpxXHgveOrGaRZlGDtzrvgjFw5cZ2XZS2/ludtuV7NxadVeV1CU7/s0EQGv96LFKCBm
 p8/n2XtyxDzBmjb4ZAvzhnxg4IiUmtYxjZEJzxUYlJiAGAADzgth1V3rFw/0wViek2v5
 ixJWyf5sfqNU/jdG3qC65o70/s8YzR9QBp7gVew6ZRa/S7eGNheYGNfbfnbL/LcT6RHw
 zGEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741460607; x=1742065407;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kVOO+KOKZ3d7DAin1HuzOowHrfcYHXZ8ykM+c1XZbKY=;
 b=gD8SCuRd/feZGsmudakVVqE4OVVv13T7gzqMQb6RtezasSYw6X/LVW0rtV5FkHiG7z
 0Zu/To8oYWp/anvNeU0Kqn8FaYTomTfCmPGV3yiI+H2AsHWkWIEzfN+Jx16n2n6BEAxE
 bhhjDKiwqyRkNE8wKrpYRfjz+FkgSR5wwNj3u6GeD28OaYwLcPdoUSlA9TnZxb5Twz9K
 nAWQvmszJ0lWoFiJy/VZQIXI5Mhebw1D1MfolCE5FAqgIp2eNh5ic+yTpbowiTUYmNE5
 5fLtvsXhWHDwr1iWYyhoWhoPtGysjhMGg7yoTpJPWhPc6ozvq55pP7Qt3eTOhb9KRBWL
 AGOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXoU3nC/gu3bcjLZ5y5+/tzgBMgRIOy8enKTtceFl9jvuDglRHaok7QrpuIAT0nISNeBv91LuD3Ag==@nongnu.org
X-Gm-Message-State: AOJu0YxcqSr6Dk73r5xZeUWp81Hd0pPK2xOlR13atpCx+wF4rLBaTHg+
 fwHyW6OaK/hyCivFKcfcKjUUcgKJWoUD6eQV+orshU7jL0ilukq5T9sJB0wa1cc=
X-Gm-Gg: ASbGncs86KnIz/eL5rytc71gC0iUyVWvZhQmwge7arwD5fdUKTR94zOWTLCdBSGJ4In
 3g1PQTM1/ZyAVEZUH4DAikM4r7mi5exwWc6DgMQCOXNNoUVW8U1cfP+dLj7atMSd+7kP3TBJeH/
 2ft+K1A9sEzGYspyewNlKFVhIq9G1Tv/zbaw1o6GQ5I3/xbQfgwBEN/VaTMX4msANDimuVHRD2g
 ND+9H3XlW1BeFcublOk7Cr4mGZoMVxTkJB+04Za2F1G5TLv3qsufOEz0V/3m68c/6t8diuqTEdJ
 9t9ckPP4pY4fqzCTNEGVsM61sREMz+IrvJ1mJIy7AbsA+QLFZVUKhESi0b1jwN7zAEPNChSn9Db
 UShYBu6QLF/0ENuTmgRqNBtjUxzRybg==
X-Received: by 2002:a05:600c:2e49:b0:43c:ec0a:ddfd with SMTP id
 5b1f17b1804b1-43cec0adf09mr11917065e9.6.1741460606973; 
 Sat, 08 Mar 2025 11:03:26 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43bd4292b06sm121601615e9.14.2025.03.08.11.03.24
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 08 Mar 2025 11:03:25 -0800 (PST)
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
Subject: [PATCH v3 11/12] hw/sd/sdhci: Implement Freescale eSDHC as
 TYPE_FSL_ESDHC
Date: Sat,  8 Mar 2025 20:02:29 +0100
Message-ID: <20250308190230.7508-12-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250308190230.7508-1-philmd@linaro.org>
References: <20250308190230.7508-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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
X-TUID: a2xO8qs7vg4P

Per the MPC8569E reference manual, its SDHC I/O range is 4KiB
wide, mapped in big endian order, and it only accepts 32-bit
aligned access. Set the default register reset values.

Reported-by: BALATON Zoltan <balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/sd/sdhci.h |  2 ++
 hw/sd/sdhci.c         | 37 ++++++++++++++++++++++++++++++++++++-
 2 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
index e24392eb10d..0e9d3b10d1b 100644
--- a/include/hw/sd/sdhci.h
+++ b/include/hw/sd/sdhci.h
@@ -161,6 +161,8 @@ DECLARE_INSTANCE_CHECKER(SDHCIState, SYSBUS_SDHCI,
 DECLARE_CLASS_CHECKERS(SDHCIClass, SYSBUS_SDHCI,
                        TYPE_SYSBUS_SDHCI)
 
+#define TYPE_FSL_ESDHC "fsl-esdhc"
+
 #define TYPE_IMX_USDHC "imx-usdhc"
 
 #define TYPE_S3C_SDHCI "s3c-sdhci"
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index cda608f8ec2..a78cff40fb1 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -1644,7 +1644,37 @@ static void sdhci_bus_class_init(ObjectClass *klass, void *data)
     sbc->set_readonly = sdhci_set_readonly;
 }
 
-/* --- qdev i.MX eSDHC --- */
+/* --- Freescale eSDHC (MPC8569ERM Rev.2 from 06/2011) --- */
+
+static const MemoryRegionOps fsl_esdhc_mmio_ops = {
+    .read = sdhci_read,
+    .write = sdhci_write,
+    .valid = {
+        .min_access_size = 4,
+        .unaligned = false
+    },
+    .endianness = DEVICE_BIG_ENDIAN,
+};
+
+static void fsl_esdhc_class_init(ObjectClass *oc, void *data)
+{
+    SDHCIClass *sc = SYSBUS_SDHCI_CLASS(oc);
+
+    sc->iomem_size = 0x1000;
+    sc->io_ops = &fsl_esdhc_mmio_ops;
+    sc->ro.capareg = 0x01e30000;
+    sc->reset.sdmasysad = 8;
+    sc->reset.blkcnt = 8;
+    sc->reset.prnsts = 0xff800000;
+    sc->reset.hostctl1 = 0x20; /* Endian mode (address-invariant) */
+    sc->reset.clkcon = 0x8000;
+    sc->reset.norintstsen = 0x013f;
+    sc->reset.errintstsen = 0x117f;
+
+    sdhci_common_class_init(oc, data);
+}
+
+/* --- qdev i.MX uSDHC --- */
 
 #define USDHC_MIX_CTRL                  0x48
 
@@ -1974,6 +2004,11 @@ static const TypeInfo sdhci_types[] = {
         .class_size = sizeof(SDHCIClass),
         .class_init = sdhci_sysbus_class_init,
     },
+    {
+        .name = TYPE_FSL_ESDHC,
+        .parent = TYPE_SYSBUS_SDHCI,
+        .class_init = fsl_esdhc_class_init,
+    },
     {
         .name = TYPE_IMX_USDHC,
         .parent = TYPE_SYSBUS_SDHCI,
-- 
2.47.1

