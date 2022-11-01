Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp2034351ejc;
        Tue, 1 Nov 2022 10:06:01 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6Oke9xRoBQOOFgzXURDgZvIWisnH0jCkJ7c0FfMd+upDHUs25xkcCW1WJhvXEqDdva8r17
X-Received: by 2002:ac8:6742:0:b0:3a5:1ba1:b80a with SMTP id n2-20020ac86742000000b003a51ba1b80amr12913261qtp.571.1667322361317;
        Tue, 01 Nov 2022 10:06:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667322361; cv=none;
        d=google.com; s=arc-20160816;
        b=m7yc++Du10Vud641lXb/QiwQoUO4GM91rvQvhZKTiK6qyBEqbRubI2P4ec3B1sV0+b
         N4I7dEV/J4mNEyUms+Lv5PxpFjQ/vGwajZogCdlqz9xwRukxDd3WMwB6vuk+gEH6Pu0Z
         oalTPm0twYxU9TgM4VOzQJL/tuKq0U9ZtbW6ktL1FURyKuzx9TDGpwivKyfjHVtZoeiS
         kCkXcbqywUQb3sIqhrnjHxjPK3YH/ZHGQ0KQPlBqRzt3lxEFiCr/Hhy6DQi2GjOXy5Z8
         4Wk2yXI5ibIi7lkqf8tnVZG3ovcMidNvK27MK9gvgFaarMp/gxkGKyf7PTTS57Mu/jFv
         8Otw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=OuJGfEqiahgje0+ZI8xfhUI2kNLbWBqS9djVvTbLrXo=;
        b=W6BMcYdXSCAkhf/CixUyvIWPQhd8k723A0zn4CG83m2Q5GHyHG4FHrLOav121LhwDX
         wH55Dc5UUTB4fEY1mxyJkieG1uZz2mEnkt5dgbnFsKCTpW87+t9PfPQsjY1p6QXY+07b
         sSziVCij3TImj76jHXWymrfTYO3iDOiHa5HbAcCQR4TslY2+WVQGqTRpWU2RJXZoEU19
         TYBxEYbOaO0fli5hReJ9lLe0Fuao0aMRgXY9FkGWMUCgHtLb749ucBg5nJAcIyiIhutk
         zVOxPCNH8IikIVrx+hUVyyTYBW7kwa0clwjon4X8ZaWKPxpvf/Tarzq32wfffFeaErY5
         pN1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=uec6W+Av;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g25-20020a05620a13d900b006ef0758b013si5575155qkl.642.2022.11.01.10.06.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Nov 2022 10:06:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=uec6W+Av;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1oprmV-0005kj-6u; Tue, 01 Nov 2022 09:58:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oprmU-0005kS-0A
 for qemu-arm@nongnu.org; Tue, 01 Nov 2022 09:58:18 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1oprmS-0003sG-EN
 for qemu-arm@nongnu.org; Tue, 01 Nov 2022 09:58:17 -0400
Received: by mail-pg1-x536.google.com with SMTP id e129so13471390pgc.9
 for <qemu-arm@nongnu.org>; Tue, 01 Nov 2022 06:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OuJGfEqiahgje0+ZI8xfhUI2kNLbWBqS9djVvTbLrXo=;
 b=uec6W+AveTWsuZadrEVxPz94mQ0T5yGhPmLKlZOocA8pxbofpkjV/wNQ7eCfx0KEP4
 TOXI/V5fK14hI6LrWwYOIn+2+3KI2EiQ8/KfTuqoggEXdloG74jrWROD8wpQJ5NoLWhL
 IbGg/U2TI+d9Dk21PD/Wp7mCIKBpmoULD/z65YXsV9O7OUPkmGDTXm8fYYeNi2YvtIQ2
 O+pOmimESfOIau6NQU4X835kd8aNliZVmXlhRcl2uIGhXkz7f/wkXnVTAvwMSjEjecRb
 j4jWj1p1JjJAijNq7Kvxx5DwIjkcLrzCKNo5NVsq6J/wVpzWkx3Y1Y/BbRi7JMDW8Kel
 +O1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OuJGfEqiahgje0+ZI8xfhUI2kNLbWBqS9djVvTbLrXo=;
 b=0wWqkaY2+/XSy+/6o8qHQzHH6uQyPjYYF0VN4YA11P7Nu4BsyLwBM5FQMwMmlabDDh
 YbI+IH92XtflzPSxA1nSUWjM6X5BCrakkeBMlZ7SC01YsE9H534jTiQJGHJLikKwx7EL
 MAmRzDhdpnzVHsuzwZ2Gxb8dz8EsOim/lS/aBqq30peIA5qVBuJ78lR0fqWq+5RUFGMN
 uWIm2zTlNpeZekZlJKPbU53gOsYMOAVoCSV3DiP9IB3qsT+OEU2NtEutQIuHbNUYmTDn
 2xoD1fD2d5iN1ubY9Tpk+1eW/SyjW4p3P3/Ijn8Ue5uiksMq+TCURvmcEZGNI5EbLZG4
 S63w==
X-Gm-Message-State: ACrzQf2/NU5ZtFywUvukTn8RfQjPH8ofbdto/Azb2HeZ/04/Ou6s+iLx
 c/19bD+xBahOcze+jMQW+N7fuQ==
X-Received: by 2002:a63:a555:0:b0:46f:f363:635d with SMTP id
 r21-20020a63a555000000b0046ff363635dmr2167613pgu.212.1667311095288; 
 Tue, 01 Nov 2022 06:58:15 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 y4-20020aa79ae4000000b0056bdc3f5b29sm6510722pfp.186.2022.11.01.06.58.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Nov 2022 06:58:14 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-arm@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, John Snow <jsnow@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Jason Wang <jasowang@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Keith Busch <kbusch@kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Paul Burton <paulburton@kernel.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Yan Vugenfirer <yan@daynix.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v8 03/17] hw/i386/amd_iommu: Omit errp for pci_add_capability
Date: Tue,  1 Nov 2022 22:57:35 +0900
Message-Id: <20221101135749.4477-4-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221101135749.4477-1-akihiko.odaki@daynix.com>
References: <20221101135749.4477-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::536;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x536.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: FD/TxabyigHh

Omitting errp for pci_add_capability() causes it to abort if
capabilities overlap. This behavior is appropriate here because all of
the capabilities set in this device are defined in the program and
their overlap should not happen unless there is a programming error.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/i386/amd_iommu.c | 21 ++++-----------------
 1 file changed, 4 insertions(+), 17 deletions(-)

diff --git a/hw/i386/amd_iommu.c b/hw/i386/amd_iommu.c
index 725f69095b..8a88cbea0a 100644
--- a/hw/i386/amd_iommu.c
+++ b/hw/i386/amd_iommu.c
@@ -1539,7 +1539,6 @@ static void amdvi_sysbus_reset(DeviceState *dev)
 
 static void amdvi_sysbus_realize(DeviceState *dev, Error **errp)
 {
-    int ret = 0;
     AMDVIState *s = AMD_IOMMU_DEVICE(dev);
     MachineState *ms = MACHINE(qdev_get_machine());
     PCMachineState *pcms = PC_MACHINE(ms);
@@ -1553,23 +1552,11 @@ static void amdvi_sysbus_realize(DeviceState *dev, Error **errp)
     if (!qdev_realize(DEVICE(&s->pci), &bus->qbus, errp)) {
         return;
     }
-    ret = pci_add_capability(&s->pci.dev, AMDVI_CAPAB_ID_SEC, 0,
-                                         AMDVI_CAPAB_SIZE, errp);
-    if (ret < 0) {
-        return;
-    }
-    s->capab_offset = ret;
+    s->capab_offset = pci_add_capability(&s->pci.dev, AMDVI_CAPAB_ID_SEC, 0,
+                                         AMDVI_CAPAB_SIZE);
 
-    ret = pci_add_capability(&s->pci.dev, PCI_CAP_ID_MSI, 0,
-                             AMDVI_CAPAB_REG_SIZE, errp);
-    if (ret < 0) {
-        return;
-    }
-    ret = pci_add_capability(&s->pci.dev, PCI_CAP_ID_HT, 0,
-                             AMDVI_CAPAB_REG_SIZE, errp);
-    if (ret < 0) {
-        return;
-    }
+    pci_add_capability(&s->pci.dev, PCI_CAP_ID_MSI, 0, AMDVI_CAPAB_REG_SIZE);
+    pci_add_capability(&s->pci.dev, PCI_CAP_ID_HT, 0, AMDVI_CAPAB_REG_SIZE);
 
     /* Pseudo address space under root PCI bus. */
     x86ms->ioapic_as = amdvi_host_dma_iommu(bus, s, AMDVI_IOAPIC_SB_DEVID);
-- 
2.38.1

