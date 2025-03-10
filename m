Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp844067njc;
        Sun, 9 Mar 2025 17:12:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUfVRIQt3tdH7eo4RIH4ON4ZUhTOuYfHPibKriZp02xVK7KZtnRNEsk93b1FIa8nI2BcIqwiu4Vsh/rQQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFrSh2qUT4sHAw+Cv9zBNRn6IO464zpIGVUgHGdAWDGlteh4Sc2u7zere39jIN1toZmEeP/
X-Received: by 2002:a05:620a:6282:b0:7c0:b3cd:9bc7 with SMTP id af79cd13be357-7c4e166add3mr1516049485a.3.1741565522180;
        Sun, 09 Mar 2025 17:12:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741565522; cv=none;
        d=google.com; s=arc-20240605;
        b=Cn/vso5o0bAxTpm5n7j1SYBdXnGUWrN9/DGzsFKqlgi7qgIVCQZQqAwC/z/q4SlM/b
         g1tWugIwLRljHI7ZLPzcjx35g0mUflboZPJQ5Wxc1Bs6Ln2PdSZGdqkk4WJ+iIsyIyui
         QXkC81cHyUZZk42HW98VKooKiCKthgSJ62Kt9JVhfa3V41Z67AweF/PC6+yu/HgZkWsI
         PQVSknhx0Qf8nLizmPCe6Kg1lJag65cOf3hCCRwd490SLgrEfzcfUBYZzju9a6uPEWVH
         GkPIz7FzGYFF4Af+QTsY9eKmgsuFjXC1pkc5d2HRA8Oq4qoHRZ1nBPoHEzGHZUJaxQ/x
         itvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=/CV9763Q2OclYQny8AL1J9alx4TgqLIH5/4iLk98ggU=;
        fh=iW8t/Cjyzc2i3RGnkuQDlX5ktDe+lRmthRdtAOT+I0Y=;
        b=Q5gXvxHtb1fSoGThpE5K6VToLvP8l2zoRP/FHLgJ47Zl8/eR0Dde+l9x7e0hSTvYAJ
         9HLkdpPE9VPn/7MnNSoIXM3Hs1ihqqZX07zDUHC+1YMWqfrxDNJWCFk81yskXWm4TNoR
         o9VcTgg65ExiWpEGnwsW3gyAL93n3UiTlNXDNBNJzSj2Nvogy0Nge8KEIfXQ5bLr2qPp
         1fv8rwSgo4EGB5aRQelnvCJWYCzX/IE6TvX2J4CePvb9iHDUPTIEYtnMaQJ8nmkaRlUy
         /SSrTqvWZqwdN4P51V3IsUt9hurn1pOmRb2CxeY1VV3+N/CgCJT8DCbQS723DAKWRvSQ
         Wj9w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CHZcEKif;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c55759aed6si18665685a.591.2025.03.09.17.12.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 09 Mar 2025 17:12:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CHZcEKif;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1trQhU-0003a1-Cq; Sun, 09 Mar 2025 20:08:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1trQg7-0002MY-4i
 for qemu-arm@nongnu.org; Sun, 09 Mar 2025 20:07:42 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1trQg4-0007Tw-4b
 for qemu-arm@nongnu.org; Sun, 09 Mar 2025 20:07:29 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3913d129c1aso772369f8f.0
 for <qemu-arm@nongnu.org>; Sun, 09 Mar 2025 17:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741565246; x=1742170046; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/CV9763Q2OclYQny8AL1J9alx4TgqLIH5/4iLk98ggU=;
 b=CHZcEKiftzUvXVBTyVosVoBdYFfo/XtsPlWZX0tYfrRMAKFRWG8ZqCsEdQ6yg5sZnS
 M4Jk2hDD8jN2OXYVIhD6kKHSV37jvSkk5Dk6hv7ZXyaFU6YnWJiJBkLesSgrJeFG4ne5
 xpo/q22yy+UU/Vg+M5iYiSFPu+bL9mrPbtEr76xq0E2HfknJtescw53A37RZVjVZjDZQ
 dKtYo12zOvvbf9bUm71zSremsthgxLpnulvsccwc3luuWdWJF+00loUhxiWDihDHAaDx
 EYluIFuIAn2IL/GrJOauf4VPvyrtIpURgt+oeDB/NOPl6GfNn8krVjtYnepoLAp+XZVn
 pvPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741565246; x=1742170046;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/CV9763Q2OclYQny8AL1J9alx4TgqLIH5/4iLk98ggU=;
 b=fCtpAyo2kgDPulWXG88pOvAh4yVoqSxfIZq82SlSXmZhBZp+lfdoheOyYbf+w11AG2
 82Z1xR8g7GwaoLDVhMCdQ4pxTw29n7PaqtD3BmByWpSavNqDYXGZS2TiFKzx55bdTXfw
 EMyAe35A/O0nGvEiAKF8YXzzCTyZ+13vBJbG2o0dMM5cvlxmANoUlWYPlTZaW57iBUYh
 iekXjQvoGjsgHtsHt3Lv5LN8xSF50YovwkyQ8B6KfXkVEFVhTBhv6ukA6VMidmYVktmy
 CchFKbS/CZxabmCMTBNqmCps00NbspyasCLytfa9kDY5ggM5+BQQQZrHbbZs+lkH/0pz
 pGrQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV37OCjyNM1ueESkUyx+dV3RP9eHQOI70WM6O+kuBXqATKtD4/6HEWdv5lrGRdRFjmyWZEkDCBHmA==@nongnu.org
X-Gm-Message-State: AOJu0YyxvJ5PSlbg5SEZWR4IARQXqieL8znxUEEHOrtq49iiDgbpd3Mg
 IAqEzq4WnOPpnzNwM4NT/w4DqhQhNg7C06Kw81Dg8yd7Hr44Ip3ttgNBsgEhErg=
X-Gm-Gg: ASbGncuOjnHz6GCs0EetqFl2+fbq0Li8zyaP2fPmrEKhId5Wha/uOyOqQbjjyqJTJ5B
 RzOarKmJcGNPDWzaFM4OHtD2gGw9Buz3S4NYk8xcjwYsgSefGhz+dXno2aKQPocJTG5llbpswxI
 h4PfKTZgjI+ggmwEACLJq4dxq+g5Gs4D7Io+fpoIl7LXfXoITxXi/pOVSCOPm0Q6mlQzyqp4IGE
 nT+w8GAX4qK4TXRGGaVf0vBucZ35d/m4TNasRo57+3tAyuVWkpH6UPqg0Ig4i3mouvuQ1TNBO2S
 2GIPVIS4WG58uGXt4MFWyygc2UR5ZhsKLWsPSyL9tCvIBKUn0hxKtnG63HWKdu5PYZ6H6kNDoP2
 Nagap4PYQykV9zYuqkFg=
X-Received: by 2002:a5d:6c6a:0:b0:38d:dc03:a3d6 with SMTP id
 ffacd0b85a97d-3913aed81aamr4029381f8f.4.1741565246349; 
 Sun, 09 Mar 2025 17:07:26 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3912c103f57sm13217968f8f.91.2025.03.09.17.07.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 09 Mar 2025 17:07:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: BALATON Zoltan <balaton@eik.bme.hu>,
	qemu-devel@nongnu.org
Cc: Steven Lee <steven_lee@aspeedtech.com>, Joel Stanley <joel@jms.id.au>,
 Bernhard Beschow <shentey@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-ppc@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Guenter Roeck <linux@roeck-us.net>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Troy Lee <leetroy@gmail.com>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-block@nongnu.org, Jamin Lin <jamin_lin@aspeedtech.com>
Subject: [PATCH v5 12/14] hw/sd/sdhci: Implement Freescale eSDHC as
 TYPE_FSL_ESDHC
Date: Mon, 10 Mar 2025 01:06:18 +0100
Message-ID: <20250310000620.70120-13-philmd@linaro.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250310000620.70120-1-philmd@linaro.org>
References: <20250310000620.70120-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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
X-TUID: 5AguHNALHt4W

Per the MPC8569E reference manual, its SDHC I/O range is 4KiB
wide, mapped in big endian order, and it only accepts 32-bit
aligned access. Set the default register reset values.

Reported-by: BALATON Zoltan <balaton@eik.bme.hu>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/sd/sdhci.h |  2 ++
 hw/sd/sdhci.c         | 44 ++++++++++++++++++++++++++++++++++++++++++-
 2 files changed, 45 insertions(+), 1 deletion(-)

diff --git a/include/hw/sd/sdhci.h b/include/hw/sd/sdhci.h
index b21adcab670..e8fced5eedc 100644
--- a/include/hw/sd/sdhci.h
+++ b/include/hw/sd/sdhci.h
@@ -171,6 +171,8 @@ DECLARE_CLASS_CHECKERS(SDHCIClass, PCI_SDHCI,
 #define TYPE_SYSBUS_SDHCI "generic-sdhci"
 OBJECT_DECLARE_TYPE(SDHCIState, SDHCIClass, SYSBUS_SDHCI)
 
+#define TYPE_FSL_ESDHC "fsl-esdhc"
+
 #define TYPE_IMX_USDHC "imx-usdhc"
 
 #define TYPE_S3C_SDHCI "s3c-sdhci"
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index f731b1a141a..47e4bd1a610 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -1667,7 +1667,44 @@ static void sdhci_bus_class_init(ObjectClass *klass, void *data)
     sbc->set_readonly = sdhci_set_readonly;
 }
 
-/* --- qdev i.MX eSDHC --- */
+/* --- Freescale eSDHC (MPC8569ERM Rev.2 from 06/2011) --- */
+
+static const MemoryRegionOps fsl_esdhc_mmio_ops = {
+    .read = sdhci_read,
+    .write = sdhci_write,
+    .valid = {
+        /*
+         * Per the reference manual (chapter 16):
+         *
+         * All eSDHC registers must be accessed as aligned 4-byte quantities.
+         * Accesses to the eSDHC registers that are less than 4-bytes are not
+         * supported.
+         */
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
 
@@ -1997,6 +2034,11 @@ static const TypeInfo sdhci_types[] = {
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

