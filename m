Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp2813652ejc;
        Wed, 15 Nov 2023 06:34:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFmKcS1yyIm/T1KHveiwnUdKcWzUjIzdT6jPZsS/l+hq7I+NuApsopGMdEPWdwNj3KphQCH
X-Received: by 2002:a05:620a:35a:b0:76c:e7b7:1d9d with SMTP id t26-20020a05620a035a00b0076ce7b71d9dmr5333994qkm.27.1700058887738;
        Wed, 15 Nov 2023 06:34:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700058887; cv=none;
        d=google.com; s=arc-20160816;
        b=ECxgEq9FUpCACjh9VDaWGi6nR9L98Jl04Ah+y/zSdbJPM9pDuxgF1bSscYAcyul8mA
         hhK6cpPrbTeW3zpRZ1YRkmio4G4U2dLYTF+QKG3G+jW/n9p+QYXt4ZrnKunRiTfpnH+6
         DyBxHFOSih5NocIF0FDqsymrE4nMXI+jTUnTQ1U9y6pQW6qNnTK8dWi3uVAXmT2k30JG
         sylymhg6uKUomgwi9Bq5ELKhGLxwAsQZ+ZjMNxgIkViFocMDQeUfJgrQmboAXgTNyF30
         mkeTFT+Iz9FuisgwVgGp6xA1cPgo7GabL7Y5eUu73rVNrlIbNfs8Ak/b5LwkGctQXKCD
         eJUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=/+LSBBFvRHoLXmzEGwmfH2B1p6OS5SltGOhUI11MSx0=;
        fh=usG7HSbX+ppIdZ8S6Yecerp/4Ix7uDfnNi1g9n+wGgw=;
        b=CO9nIwlXqWkwvQF/1JC3Na6ZiUlKeDIYwxlqaV8fyEJppWVyWX1wylVxouxJkHvD2x
         aC+K/B0DMj1GnWIHj/ar+VZ9blWPnOhiS5K2Qilg1+AN76q+aq6WMhm0Fi6PlN1CuxU+
         KrY1kAT90wqsjDlK3Qi1l+Jnbl9aZ/6ec2fGQ7Zsk+/Yh47EPGCUVEifOSN/YOMS4fiJ
         AGcs/QrIK6MM30PuUnnLtXVRpadSfxM5gjdw8z51h+yGlF/7uAlwc1NZwOKmF6IaI7rB
         2Fgannwck4sBOzOKvS84AVBt2MW1lpxMYYxDIHMFNTmM3i/mmhD4LgGBipNIsET+yT2f
         jwBg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=FrX57pk2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j4-20020a05620a410400b0077419b27790si9962545qko.97.2023.11.15.06.34.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Nov 2023 06:34:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=FrX57pk2;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r3Gxq-0005P6-3k; Wed, 15 Nov 2023 09:33:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <max.hsu@sifive.com>)
 id 1r3Gxi-0005OD-Jr
 for qemu-devel@nongnu.org; Wed, 15 Nov 2023 09:33:50 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <max.hsu@sifive.com>)
 id 1r3Gxf-0000oN-Vh
 for qemu-devel@nongnu.org; Wed, 15 Nov 2023 09:33:50 -0500
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-6b1d1099a84so6835285b3a.1
 for <qemu-devel@nongnu.org>; Wed, 15 Nov 2023 06:33:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1700058826; x=1700663626; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/+LSBBFvRHoLXmzEGwmfH2B1p6OS5SltGOhUI11MSx0=;
 b=FrX57pk2UlPjS1hlaVE+pCCFCtXm9oVCn509PbxcF5fpnNzk6V9fJKvHr1s9esvIIZ
 kwrLn8VwPAOBjybs6dqrJHVD5ZUHUjc9wSaOGpwwMv+vcweNwjDZLgOHKj/e8xOP7Ppu
 CZM1Wqx4aNyAcSCndOyDdVKOl+AlPxxAEW9y3hqqvMMuoI9GhBC3Eq36OXpqZlm2yhX+
 IOSmvL/xavrtrRi+hr9zyKesOyVHdiZJdwORj8zLunEGHoYlMkFiyw/VuGCKOKZsNmCC
 eX0phnxepMALU9GrYf03E+3lYgEwDTZt23VOSz/vRGUe9zTDXKUipPPnVuyJlceRo45d
 NtEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700058826; x=1700663626;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/+LSBBFvRHoLXmzEGwmfH2B1p6OS5SltGOhUI11MSx0=;
 b=d3O/RP7KXImEhYdBR8POvWJtDd8ZpPyiG9B8gvLZIJnLbnzmMQ2nkUEsQwVzmM4tIv
 J3vLGMGciIFk3i1Ze8/TKCAfuOaqkebNCyaqrwfqgJYNCF+93TMmlhC/rhw8VRVNwem8
 AMR1nRoiORpTJlvWkd+8LfVyIp9NgJtgK9ZQcQA/wpwhe8B+0SPnwPCZWu3LG3lZwyG3
 W98b/SSN9iBPYGLgXHq0TwxoOOWHbnLPFTZs7fnjMW0c9sgx2ouvCBrpkisi+mKvWQVq
 g9yClk/aJYah38VUieH7FjsQvxTUZp/WiYqb5ukY+m6Kz3Tc+shAGPcY7i3d1M+4HVMe
 H4fw==
X-Gm-Message-State: AOJu0Yxgo/UaMfGXtRnSiKik3G65TP0Vz2f4KA6c1eMEWY8yQD4S0VrY
 gStx2/2i4lXn+evyLgkJrrib0w==
X-Received: by 2002:a05:6a00:2d95:b0:6be:e54e:a540 with SMTP id
 fb21-20020a056a002d9500b006bee54ea540mr15264914pfb.30.1700058826407; 
 Wed, 15 Nov 2023 06:33:46 -0800 (PST)
Received: from maxhsu-SiFive.. (61-230-7-62.dynamic-ip.hinet.net.
 [61.230.7.62]) by smtp.gmail.com with ESMTPSA id
 r2-20020aa78b82000000b006c871f3ad1csm1443496pfd.71.2023.11.15.06.33.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Nov 2023 06:33:46 -0800 (PST)
From: Max Hsu <max.hsu@sifive.com>
To: Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: Frank Chang <frank.chang@sifive.com>, qemu-arm@nongnu.org,
 Greentime Hu <greentime.hu@sifive.com>, qemu-devel@nongnu.org,
 Max Hsu <max.hsu@sifive.com>
Subject: [PATCH 1/2] hw/pci-host: Designware: Fix inbound iATU no address
 match behavior
Date: Wed, 15 Nov 2023 22:33:40 +0800
Message-Id: <20231115143341.13068-2-max.hsu@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231115143341.13068-1-max.hsu@sifive.com>
References: <20231115143341.13068-1-max.hsu@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=max.hsu@sifive.com; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: /tZgrjDLh+TA

IMX6DQRM Rev4, in chapter 48.3.9.3, specifies that for inbound iATU
with no address match: 'If there is no match, then the address is
untranslated.'
The current model implementation registers inbound region 0 as
untranslated dummy, intending to serve as a passing medium for
the no-match address behavior using MemoryRegion.

However, a bug exists where the Linux Kernel driver of Designware PCIe
RC is unaware that inbound region 0 is registered for special setup.
During Kernel driver initialization, the driver overwrites the target
address to 0x1111_0000 and later disables all regions, rendering the
untranslated passing medium ineffective.
Consequently, TLP cannot pass iATU, and the transaction is blocked.

To address this issue, we propose "inbound untranslated pass" which is
consistently enabled and distinct from the usage of iATU regions.
We achieve this by introducing a new MemoryRegion with the
lowest priority to prevent conflicts with configured iATU regions.

This fix has been tested with the integration of Designware PCIe RC
along with the e1000e Ethernet card, ensuring proper functioning of
network transmissions and MSI interrupts.

Signed-off-by: Max Hsu <max.hsu@sifive.com>
---
 hw/pci-host/designware.c | 29 ++++++++++++++++++++---------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/hw/pci-host/designware.c b/hw/pci-host/designware.c
index f477f97847..83dd9b1aaf 100644
--- a/hw/pci-host/designware.c
+++ b/hw/pci-host/designware.c
@@ -487,17 +487,28 @@ static void designware_pcie_root_realize(PCIDevice *dev, Error **errp)
     }
 
     /*
-     * If no inbound iATU windows are configured, HW defaults to
-     * letting inbound TLPs to pass in. We emulate that by explicitly
-     * configuring first inbound window to cover all of target's
-     * address space.
+     * For HW iATU address no match behavior, the TLP should continue with
+     * untranslated address.
      *
-     * NOTE: This will not work correctly for the case when first
-     * configured inbound window is window 0
+     * We emulate this behavior by adding extra MemoryRegions to create a
+     * 1:1 mapping between PCI address space and cpu address space within
+     * the 64-bit range, encompassing both inbound and outbound directions.
+     *
+     * To avoid interfering with the configured iATU regions and potentially
+     * producing incorrect addresses, the two untranslated regions are set
+     * to have the lowest priority.
      */
-    viewport = &root->viewports[DESIGNWARE_PCIE_VIEWPORT_INBOUND][0];
-    viewport->cr[1] = DESIGNWARE_PCIE_ATU_ENABLE;
-    designware_pcie_update_viewport(root, viewport);
+    MemoryRegion *inbound_untranslated = g_new(MemoryRegion, 1);
+
+    memory_region_init_alias(inbound_untranslated, OBJECT(root),
+                             "inbound untranslated pass",
+                             get_system_memory(), dummy_offset, dummy_size);
+    memory_region_add_subregion_overlap(&host->pci.address_space_root,
+                                        dummy_offset, inbound_untranslated,
+                                        INT32_MIN);
+    memory_region_set_size(inbound_untranslated, UINT64_MAX);
+    memory_region_set_address(inbound_untranslated, 0x0ULL);
+    memory_region_set_enabled(inbound_untranslated, true);
 
     memory_region_init_io(&root->msi.iomem, OBJECT(root),
                           &designware_pci_host_msi_ops,
-- 
2.34.1

