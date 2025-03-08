Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp307329njc;
        Sat, 8 Mar 2025 13:38:34 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVUneEZrvKDUJGVQvW3c61ZjR9JJCb4Cktnt+nAxkEILMbncqERIfpgVW2+hn5rUVx17zfOp/WV1FMctg==@linaro.org
X-Google-Smtp-Source: AGHT+IFXh2WQfeGtk3DX4P3b8cNIYi6VU3VDZ0MHRF+fvMsAPlLJmVJ3nVt6oc9LBpuFV2jMAF/d
X-Received: by 2002:ad4:5f85:0:b0:6df:99f7:a616 with SMTP id 6a1803df08f44-6e9006047a0mr112008556d6.2.1741469913940;
        Sat, 08 Mar 2025 13:38:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741469913; cv=none;
        d=google.com; s=arc-20240605;
        b=bo6zRA0f8D+gt4yWOlOF7kTGwGE7SPxpvze/wks2UfpAO6IhLv34qVq/wp5v4Y/KCP
         c0LvYvJh2xHV+w1e+oim8tLJyAsGKIGIxc7l711BbZdtXlRKAf7QSdbmt+hafNCF516D
         6BaV+ZajQoPvt6336ab+xudisKUd3jP7d3G2p8xXsIauJr3nu5v0MisnAwOEB0HeCMdv
         8C+lw08h5eVcIKcqZDeP6lIncDnUVNKKyIsmRsIUHHLS4E1/XiR21Opznhhn8qhQQw9z
         bSwJv2LmhMsEKOrG45n+/qUGQEEFTSCD42dhgS7SvgeYUw6iEQgkkMF/FSglX/ugRXr0
         ZAdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=B/DAOjgGSbt8R5XFJfa90IfAIHW3vg/xwsnsSI4jCJ0=;
        fh=rMXdrnrTjI8bwDp/hrbQxUIXASpvIc0R/STu4klMUXw=;
        b=anVfgnefazMqC0Vw+5E6NvDucV0vhuu2QVSqfkNAYBzqPuhSmTFymLvrm8TLbqUJgc
         QPJrQ30CWPlr2M3nPnc6QMmvq710gacdrfJpoVWUv/Tv4ZdvkUm4BtkFULgOwIHiZVvI
         bOpyR2qxTT5SbPCZ1uvBN04yMLCrYTVddShOfqp/ETMeXVkHmYOKX8VehqmuzRMtBGAh
         8BAUirXf+0V4b+/960KEZASdcmspNUFWVbiOAz/HlsF7B66kuf42AmYo53qlHDgoBWE5
         Ye+LonAm2SQnTlhta7asFDVLIXp5Z3bnTYHfw2juino3MASgJwWqTFFLoq/HrQdQJFlZ
         onWA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RgjmaF5o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e906c57a2csi30423676d6.448.2025.03.08.13.38.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 08 Mar 2025 13:38:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RgjmaF5o;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tr1sH-0006Pe-34; Sat, 08 Mar 2025 16:38:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tr1r2-0005QX-75
 for qemu-arm@nongnu.org; Sat, 08 Mar 2025 16:37:10 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tr1qz-0003u6-2b
 for qemu-arm@nongnu.org; Sat, 08 Mar 2025 16:37:07 -0500
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-390f5f48eafso1530198f8f.0
 for <qemu-arm@nongnu.org>; Sat, 08 Mar 2025 13:37:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741469823; x=1742074623; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B/DAOjgGSbt8R5XFJfa90IfAIHW3vg/xwsnsSI4jCJ0=;
 b=RgjmaF5oNLjV3aADvkVb4Oivfd9lH385d2iELV7/mFe+rCX+/kiqo9+qlkmjtoeBc3
 1H5u0SGSTWC5FedmTaOUP+RdR3Q879Q7TATAZWU3eRJLHl231NCganIYa5E+l3wduEqW
 NZPcrpLpBZ9ARZ3zswNjA2ye8bMJB//grtbegSQ/CfzslGVjqELLimxrwD/sS2FOC2tt
 3zNKio/yoUKikjv6sXuaYZA6bEbPMM8JDTDlFk28bCQ8AnLn7bO80SdtMagtnvE6/ZZz
 766lsfzOnOb4YbkktruvCx+0I/syoIs99mXGXC5/DS52KBbykmtHG6zRy1S46lm2AcpI
 SU1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741469823; x=1742074623;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B/DAOjgGSbt8R5XFJfa90IfAIHW3vg/xwsnsSI4jCJ0=;
 b=m7Z93LpfOeyMmEPpF1S55ZcJr+GskkRrl4Sx3KahgTtz5xfzsNfGCOQAyqBDrh6RKG
 LxvY43vfhDf7/HxZYJxWsteVxa2TcFRNGjaDZ8qinYeDSk0NMtLujLz1HdNZ5uQy9JIn
 wlPD5yUySn0s9vqAD4LH4DeKYRL6ULeDfLl1n4imwchlat5rdZmDmrWhbg7FOZsVums5
 /hiMxvHMIxuGF+qdund8Z6pErfKhur/LjJJZNoc9YKeoEf+T0EDFsg/Gq7FowxZikAfX
 yT4rZoyycTRiwSET7PSf1L4nUXKaBAU4/QdWAO3SQtjXJJbgy/sfjDJKwn+0fREkbJ1l
 pg1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9aMbHBYVpbhboR5ov2EtC80hB4XeD1PcGoVjSaisN7+CVlLmFq/KPX8oodJSTcKMbpbRC0ZNQbQ==@nongnu.org
X-Gm-Message-State: AOJu0YyGYepDHau7CNVlYYpV2F/XcJXm8IWihZADoaJcPGCJnAyggCLH
 iq9qFZ1e8v8tFlS/+VBFkB2inxE0t8qZ7o03wZphmgMYAUSMXRQX+ZBjo8D5sPE=
X-Gm-Gg: ASbGncvixSFUI09Q/O3UiCq06vwh5vmWJ02aNmUfl9p8MkqOrnaRMaJ/mzVgDEeKWKX
 LutLQNZDxe8AFkYXDNV1NK4tp4Cs1dm4BPoLCL+3dkS9Up961L3U6aJHRwuAXRf7mjYWiEfVeDm
 kQN2CqxqhvrnxLaVL4CFeG/qk0kqzid0fd+7nHw1MgPJEeqA88v9V4MX62cw6TCuS5S5gEv2p2z
 NuGegiKSC5bIVrrb4IGl+YbMm054RuWb+R7BVzm1IAfFIXS7NVYnJVZbnpcXnyPOhTROfvMz7eg
 J0v/H2HUoWOHJmnREQrWJBQ9VWUdTKth9zarsx/Bi3GOvjodN+7sXe+TkTO5N9VvUzqDMXYRAB0
 XMmxFX+KZ6SyqiG8WkWjp6N5+iznLXQ==
X-Received: by 2002:a05:6000:156b:b0:38d:e304:7478 with SMTP id
 ffacd0b85a97d-39132dc56f2mr6089276f8f.38.1741469823381; 
 Sat, 08 Mar 2025 13:37:03 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c0e4065sm10069393f8f.62.2025.03.08.13.37.01
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 08 Mar 2025 13:37:02 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	BALATON Zoltan <balaton@eik.bme.hu>
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Guenter Roeck <linux@roeck-us.net>, qemu-block@nongnu.org,
 Bin Meng <bmeng.cn@gmail.com>, qemu-arm@nongnu.org
Subject: [PATCH v4 04/14] hw/sd/sdhci: Make quirks a class property
Date: Sat,  8 Mar 2025 22:36:30 +0100
Message-ID: <20250308213640.13138-5-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250308213640.13138-1-philmd@linaro.org>
References: <20250308213640.13138-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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
X-TUID: vnWUmkh0qAXB

All TYPE_IMX_USDHC instances use the quirk:
move it to the class layer.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/sd/sdhci.h |  3 ++-
 hw/sd/sdhci.c         | 15 +++++++++++++--
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
index c4b20db3877..0616ce3aa59 100644
--- a/include/hw/sd/sdhci.h
+++ b/include/hw/sd/sdhci.h
@@ -95,7 +95,6 @@ struct SDHCIState {
 
     /* Configurable properties */
     bool pending_insert_quirk; /* Quirk for Raspberry Pi card insert int */
-    uint32_t quirks;
     uint8_t endianness;
     uint8_t sd_spec_version;
     uint8_t uhs_mode;
@@ -112,6 +111,8 @@ typedef struct SDHCIClass {
         PCIDeviceClass pci_parent_class;
         SysBusDeviceClass sbd_parent_class;
     };
+
+    uint32_t quirks;
 } SDHCIClass;
 
 /*
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 4917a9b3632..2b7eb11a14a 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -345,6 +345,8 @@ static void sdhci_send_command(SDHCIState *s)
     rlen = sdbus_do_command(&s->sdbus, &request, response);
 
     if (s->cmdreg & SDHC_CMD_RESPONSE) {
+        SDHCIClass *sc = SYSBUS_SDHCI_GET_CLASS(s);
+
         if (rlen == 4) {
             s->rspreg[0] = ldl_be_p(response);
             s->rspreg[1] = s->rspreg[2] = s->rspreg[3] = 0;
@@ -366,7 +368,7 @@ static void sdhci_send_command(SDHCIState *s)
             }
         }
 
-        if (!(s->quirks & SDHCI_QUIRK_NO_BUSY_IRQ) &&
+        if (!(sc->quirks & SDHCI_QUIRK_NO_BUSY_IRQ) &&
             (s->norintstsen & SDHC_NISEN_TRSCMP) &&
             (s->cmdreg & SDHC_CMD_RESPONSE) == SDHC_CMD_RSP_WITH_BUSY) {
             s->norintsts |= SDHC_NIS_TRSCMP;
@@ -1886,7 +1888,15 @@ static void imx_usdhc_init(Object *obj)
     SDHCIState *s = SYSBUS_SDHCI(obj);
 
     s->io_ops = &usdhc_mmio_ops;
-    s->quirks = SDHCI_QUIRK_NO_BUSY_IRQ;
+}
+
+static void imx_usdhc_class_init(ObjectClass *oc, void *data)
+{
+    SDHCIClass *sc = SYSBUS_SDHCI_CLASS(oc);
+
+    sc->quirks = SDHCI_QUIRK_NO_BUSY_IRQ;
+
+    sdhci_common_class_init(oc, data);
 }
 
 /* --- qdev Samsung s3c --- */
@@ -1967,6 +1977,7 @@ static const TypeInfo sdhci_types[] = {
         .name = TYPE_IMX_USDHC,
         .parent = TYPE_SYSBUS_SDHCI,
         .instance_init = imx_usdhc_init,
+        .class_init = imx_usdhc_class_init,
     },
     {
         .name = TYPE_S3C_SDHCI,
-- 
2.47.1

