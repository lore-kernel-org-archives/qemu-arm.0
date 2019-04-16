Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3365667wrx;
        Mon, 15 Apr 2019 18:40:06 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwLGBEyekcvQKXCUkDaFxb+hCJpSDXwuEFKlxY7utD+y6NElih4b6MCBVLo73xKKjrR8lgx
X-Received: by 2002:adf:c788:: with SMTP id l8mr48949801wrg.143.1555378806155;
        Mon, 15 Apr 2019 18:40:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555378806; cv=none;
        d=google.com; s=arc-20160816;
        b=tkH94B0FR9Ry4+W9KOKrwLASBLQAyHqtKCmY0jpWriL7PdD4MH8gofKDDXG1KqQbP0
         fUsKcaFf/lK2diDlG1zMzWhAK8oorrmXpRHYN0rZNgBXiAnG76ak+9awlETVrs3Op4GU
         p2LuQ27Hd3F3CXCII73w7BeACkjP8togynw1JuaifriVp+m3P9ZWBh18++1WlatzhnGR
         q1U9H2Wjp8aAZBL6tuUp5bJelmAggvrW5lnWXjUkq4twdEtuYhVxHDX3Cq5jH+vvMnwn
         htCEsleIU8uiEaecZzIo6YducRqI5gzRdQUWvUTyT0q+dg72cubFhe+/5mFA7EKRQ4UG
         ZQKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=2Jrfp6guHhu12IiPCjZRuA1AOo7RUF4vA5QQQUxraEE=;
        b=zdVUdFwQ1XZFeaWYEpXEBItiCkj0+n4oyN+SRGKwaY1cPbgQ3Cd0bx9gctSJc6Q23N
         Gj8WGy3izNY4Vb+um6IyhsbyTg4hvLNU4/KHPOa9DexZ6ec5a92q2G4nAItJ1cr39Ufs
         J8FWR+SmGA7wnFgULwhCA3130S2Qh8WvapIDRasNhzkE/ZW/OtPqYFPRTAIsAZPA8vox
         vOe2UZ/SyWQbtI70S72Gno+ItIe9pDhR+0FeNVBYOludKrrRyQNy/JrHM3SemOWT565Y
         gx6sqw9WZNqLvt8bz4cMkOlayUuMeloA3KwujZ3SQCr9C21DJiPkStpJEjf4R7ONZd+k
         +vSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=PnIQM4f1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p7si11794961wmg.134.2019.04.15.18.40.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Apr 2019 18:40:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=PnIQM4f1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:57784 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hGD4v-0006kk-6z
	for alex.bennee@linaro.org; Mon, 15 Apr 2019 21:40:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44068)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1hGD4T-0006Ul-TE
	for qemu-arm@nongnu.org; Mon, 15 Apr 2019 21:39:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1hGD4S-0007pd-Sh
	for qemu-arm@nongnu.org; Mon, 15 Apr 2019 21:39:37 -0400
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642]:39762)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1hGD4S-0007p0-Kc; Mon, 15 Apr 2019 21:39:36 -0400
Received: by mail-pl1-x642.google.com with SMTP id a96so9474552pla.6;
	Mon, 15 Apr 2019 18:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=2Jrfp6guHhu12IiPCjZRuA1AOo7RUF4vA5QQQUxraEE=;
	b=PnIQM4f1YSKwxMRbTTZ5RnvgndeWOtz4LRBQmjWczMxAVNGCBb73BXFoIc3057WBct
	BiWz1XS5dM09B2yAQVbYG+F+clxiM/wbc9Ol7cG+vNt5X0bTwuEZWyEOYBeSmpUNfSZT
	kdx1yf/01UHfp7UgjKIcFyWpFwIZJZncsnkSM1iVXidjgcMMpglUdTNOQfNElpgFTvXL
	VwZ62yk+7bjPm9rWi85C78+qgeoTbXmhQ83/hmuR7Cy9NrOn6ykJWDvK73115TjoEhOc
	kS0Y8zXv/duOV7r3MPIGU80+Qp5xBVhlyeenX252pIWCjaOKkeZ5ScFZrBjlrB1zDXmr
	cWcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=2Jrfp6guHhu12IiPCjZRuA1AOo7RUF4vA5QQQUxraEE=;
	b=TWNCJyjAPqH7yJkWGM8EnEtdphH4FbNTWyMJ56CW8AWhl7sTUxW0ftQe5tJsBv1hTa
	XZSJDzzz8yFBiVRU180/uVSFrVkZTpNwO9YW8U2ggzkcfKwUDUfkfRWycD6lT5GhPgFv
	llBeZwESsJ6FkxbzNeSSv/WfooYvtBKRlN1xkJVhD9JcMnmoKKc+9fY66Yvsd31Sur22
	jG0LqJC4j1N5zCh1VfELUbU8hBxTaPBTETokS/YcKdmEn2SzcNZmvXogANkkjBu5ma3V
	BunHAPLsyKFWCvrKzp+u1lDI1Tv2xAYQaeGqOVvfTTjkLPkkizfLa9keBcoa8KB1Uyt9
	2QKA==
X-Gm-Message-State: APjAAAVUO8olaqz8y74yKq8WQK0Ol3qFh6eA0gS19q5SUEPJuAEuoxhk
	DvNsUBvleoTQiaz73/O6D3AgLzy+
X-Received: by 2002:a17:902:a5ca:: with SMTP id
	t10mr76432641plq.234.1555378775344; 
	Mon, 15 Apr 2019 18:39:35 -0700 (PDT)
Received: from squirtle.lan (c-24-22-235-96.hsd1.wa.comcast.net.
	[24.22.235.96]) by smtp.gmail.com with ESMTPSA id
	v20sm74710362pfn.116.2019.04.15.18.39.33
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 15 Apr 2019 18:39:34 -0700 (PDT)
From: Andrey Smirnov <andrew.smirnov@gmail.com>
To: qemu-arm@nongnu.org
Date: Mon, 15 Apr 2019 18:39:02 -0700
Message-Id: <20190416013902.4941-6-andrew.smirnov@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190416013902.4941-1-andrew.smirnov@gmail.com>
References: <20190416013902.4941-1-andrew.smirnov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::642
Subject: [Qemu-arm] [PATCH 5/5] i.mx7d: pci: Update PCI IRQ mapping to match
 HW
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	"Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: n5OX2mwd+HOl

Datasheet for i.MX7 is incorrect and i.MX7's PCI IRQ mapping matches
that of i.MX6:

    * INTD/MSI    122
    * INTC        123
    * INTB        124
    * INTA        125

Fix all of the relevant code to reflect that fact. Needed by latest
Linux kernels.

Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
---
 include/hw/arm/fsl-imx7.h | 8 ++++----
 hw/pci-host/designware.c  | 6 ++++--
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/include/hw/arm/fsl-imx7.h b/include/hw/arm/fsl-imx7.h
index 3efa697adc..9750003a4f 100644
--- a/include/hw/arm/fsl-imx7.h
+++ b/include/hw/arm/fsl-imx7.h
@@ -213,10 +213,10 @@ enum FslIMX7IRQs {
     FSL_IMX7_USB2_IRQ     = 42,
     FSL_IMX7_USB3_IRQ     = 40,
 
-    FSL_IMX7_PCI_INTA_IRQ = 122,
-    FSL_IMX7_PCI_INTB_IRQ = 123,
-    FSL_IMX7_PCI_INTC_IRQ = 124,
-    FSL_IMX7_PCI_INTD_IRQ = 125,
+    FSL_IMX7_PCI_INTA_IRQ = 125,
+    FSL_IMX7_PCI_INTB_IRQ = 124,
+    FSL_IMX7_PCI_INTC_IRQ = 123,
+    FSL_IMX7_PCI_INTD_IRQ = 122,
 
     FSL_IMX7_UART7_IRQ    = 126,
 
diff --git a/hw/pci-host/designware.c b/hw/pci-host/designware.c
index e80facc4a0..f4c58b25c1 100644
--- a/hw/pci-host/designware.c
+++ b/hw/pci-host/designware.c
@@ -50,6 +50,8 @@
 #define DESIGNWARE_PCIE_ATU_DEVFN(x)               (((x) >> 16) & 0xff)
 #define DESIGNWARE_PCIE_ATU_UPPER_TARGET           0x91C
 
+#define DESIGNWARE_PCIE_IRQ_MSI                    3
+
 static DesignwarePCIEHost *
 designware_pcie_root_to_host(DesignwarePCIERoot *root)
 {
@@ -66,7 +68,7 @@ static void designware_pcie_root_msi_write(void *opaque, hwaddr addr,
     root->msi.intr[0].status |= BIT(val) & root->msi.intr[0].enable;
 
     if (root->msi.intr[0].status & ~root->msi.intr[0].mask) {
-        qemu_set_irq(host->pci.irqs[0], 1);
+        qemu_set_irq(host->pci.irqs[DESIGNWARE_PCIE_IRQ_MSI], 1);
     }
 }
 
@@ -310,7 +312,7 @@ static void designware_pcie_root_config_write(PCIDevice *d, uint32_t address,
     case DESIGNWARE_PCIE_MSI_INTR0_STATUS:
         root->msi.intr[0].status ^= val;
         if (!root->msi.intr[0].status) {
-            qemu_set_irq(host->pci.irqs[0], 0);
+            qemu_set_irq(host->pci.irqs[DESIGNWARE_PCIE_IRQ_MSI], 0);
         }
         break;
 
-- 
2.20.1

