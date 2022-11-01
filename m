Received: by 2002:a17:906:9f27:b0:7ad:ca5a:aee3 with SMTP id fy39csp1433467ejc;
        Mon, 31 Oct 2022 18:04:02 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7TtsaFms/feP/et5eGUqU472dxbkO0t0ogzCivTwHAWfSLqaHbyi3NA0/lsy3D/wzFqJ4v
X-Received: by 2002:a05:620a:112d:b0:6fa:dde:394b with SMTP id p13-20020a05620a112d00b006fa0dde394bmr34961qkk.265.1667264642347;
        Mon, 31 Oct 2022 18:04:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667264642; cv=none;
        d=google.com; s=arc-20160816;
        b=No+pgpwLM2hi4RCQhcU/T22v/WHOYqymzGdCitUg/vflvMWRvu7lxO+BsZgRQ6WRoc
         I+waVSJmc0KVTIGTLVl3kyZeLkCziEa7U/u5krucIHpwqOnOmIeIzrASONAU0y0R1qY5
         QkO9FGWOdjjXT/+8SLZmNkwyUUcKCT+VYS/f6fK8LUMtvHBLt3fE8njnVgp64sMffb+g
         rGxeKvlXZrg8aBj17QW2WbMGA7UKP96i42L8v3c+l8HFFzD7wFlF7LgL42li/KSNg5vh
         k9q9LEWZtDPPxGJQ2cLrw42FlCvz5+ndFEwQ//sVsEcnfQbfX6b1BoCkKAIgcgj59nAD
         EfmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=NRuCwoKWiPF/zQ4ogg7uItA8DuEE4aQtCuC8AzGLcFo=;
        b=tRjwwZiC9j4V5OoepgVfh8IOoR5Bexh5TTBOkzaUtRZsmPwcGe3p4yfeo+YoFNtdn5
         rVx1C2Bu/nNoPswpsIxyfmmniyoq8nuw5tumQxK1Qf+3u53OTXNV7yBuvwGkFb6bNef5
         68O4NiKm04NadtOSYSfSWnLBGwjg/Hu1DJIksYGnyRT9yU8mzna9wp65Qx+m0aZAHWCT
         TKJLDgqyWfEPNSN8BVZ2aF6JsdC5t109J6yPbecch5Ehj2KXjCOCVnfagRgg7zKfYAHL
         CrF6LmbJRTPvpkMLY5nvgBu81UWd+kxQkfC1JLI1n/DoCPpzEbrbOCNQcKN+t47YLyxo
         /RRA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=PFsg73UP;
       spf=pass (google.com: domain of qemu-arm-bounces+linus.walleij=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+linus.walleij=linaro.org+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+linus.walleij=linaro.org+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id fq6-20020a056214258600b004afb5d22ed1si4835959qvb.191.2022.10.31.18.04.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 31 Oct 2022 18:04:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+linus.walleij=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=PFsg73UP;
       spf=pass (google.com: domain of qemu-arm-bounces+linus.walleij=linaro.org+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+linus.walleij=linaro.org+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1opfe1-0005Do-4v; Mon, 31 Oct 2022 21:00:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opfdS-0004hX-0c
 for qemu-arm@nongnu.org; Mon, 31 Oct 2022 21:00:12 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1opfdN-0006GG-UZ
 for qemu-arm@nongnu.org; Mon, 31 Oct 2022 21:00:07 -0400
Received: by mail-pf1-x432.google.com with SMTP id y13so12144547pfp.7
 for <qemu-arm@nongnu.org>; Mon, 31 Oct 2022 18:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NRuCwoKWiPF/zQ4ogg7uItA8DuEE4aQtCuC8AzGLcFo=;
 b=PFsg73UPyK1X383Y+LNdXf4YeJP63qI6KQiDsrrcLJQ6iPt4fhca9vfa6183pEJkhe
 WGPAuPowTKqWFgyN8TefQVyAjuKJzzLmwP5f1Xy4QjU3vBQBeWFJBgTgMzp8eHGSJ9DO
 tKhW7wflMkXi0oqGT+/wNnfyUvR0ni9+1tD5/MBgDPGw34knC6mL+n2i8mFOZw/40RUU
 WxWwTQ5S3NTF+P6F3AxObrGCdNKniGKsW2iHdqfD2vmDWj/B6gIYX0dbglQbX0ZB9vkc
 lnoPBB5eA/xkwmwawyvfFrVwAsGRCcc9OVIFcJEsi9UXkYd3jIJbnmoBAi/Jx+Ds9zsV
 64lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NRuCwoKWiPF/zQ4ogg7uItA8DuEE4aQtCuC8AzGLcFo=;
 b=Rbh0jnh+SEdoNimevDQV8o4QK6M+yFDEAshb8LWagbb1rCD7MGo3dNkw2YQP17OYHZ
 55ylOzRVE8aExftSXvlc9bt4e2oBX0Wod/smCZ+fOCsmOUNMUOhmvOw8JkkxWx4EUYfw
 BgErkPsFuh8opKdUFQpZl+24d4BeDsKT0LODMLX40t0u1c8EH9ZwaRAQk+aUH7Zz3FD1
 kIYd9Fry/RDqyqnAL4SGdzFAjQYjd8cUCw5nQgwoQ8umAwB3SkqkUPqwEwD8Lu0WZiyb
 L3rg03uPTcQr+njbZD+ocV07Je+SnQlkOm55zR+jcw+Dlv7DpX1aCOVrzuYVe6AcPOCN
 N+pg==
X-Gm-Message-State: ACrzQf2hgGYKtCp1ieQKVDbq0VuwfQMP4fSaHoE7RJLUIl04pdMiU9u3
 YCl4lu0zFumOnvDSuWu2bI+zDw==
X-Received: by 2002:a63:2f45:0:b0:457:dc63:68b4 with SMTP id
 v66-20020a632f45000000b00457dc6368b4mr14973859pgv.228.1667264404623; 
 Mon, 31 Oct 2022 18:00:04 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 o9-20020aa79789000000b0056d98e359a5sm1875644pfp.165.2022.10.31.17.59.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 18:00:04 -0700 (PDT)
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
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v7 11/17] pci/shpc: Omit errp for pci_add_capability
Date: Tue,  1 Nov 2022 09:58:53 +0900
Message-Id: <20221101005859.4198-12-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221101005859.4198-1-akihiko.odaki@daynix.com>
References: <20221101005859.4198-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::432;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x432.google.com
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
Errors-To: qemu-arm-bounces+linus.walleij=linaro.org+alex.bennee=linaro.org@nongnu.org
X-TUID: GXAvwXb+tYNw

Omitting errp for pci_add_capability() causes it to abort if
capabilities overlap. A caller of shpc_init(), which calls
pci_add_capability() in turn, is expected to ensure that will not
happen.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 hw/pci-bridge/pci_bridge_dev.c  |  2 +-
 hw/pci-bridge/pcie_pci_bridge.c |  2 +-
 hw/pci/shpc.c                   | 23 ++++++-----------------
 include/hw/pci/shpc.h           |  3 +--
 4 files changed, 9 insertions(+), 21 deletions(-)

diff --git a/hw/pci-bridge/pci_bridge_dev.c b/hw/pci-bridge/pci_bridge_dev.c
index 657a06ddbe..4b6d1876eb 100644
--- a/hw/pci-bridge/pci_bridge_dev.c
+++ b/hw/pci-bridge/pci_bridge_dev.c
@@ -66,7 +66,7 @@ static void pci_bridge_dev_realize(PCIDevice *dev, Error **errp)
         dev->config[PCI_INTERRUPT_PIN] = 0x1;
         memory_region_init(&bridge_dev->bar, OBJECT(dev), "shpc-bar",
                            shpc_bar_size(dev));
-        err = shpc_init(dev, &br->sec_bus, &bridge_dev->bar, 0, errp);
+        err = shpc_init(dev, &br->sec_bus, &bridge_dev->bar, 0);
         if (err) {
             goto shpc_error;
         }
diff --git a/hw/pci-bridge/pcie_pci_bridge.c b/hw/pci-bridge/pcie_pci_bridge.c
index df5dfdd139..99778e3e24 100644
--- a/hw/pci-bridge/pcie_pci_bridge.c
+++ b/hw/pci-bridge/pcie_pci_bridge.c
@@ -42,7 +42,7 @@ static void pcie_pci_bridge_realize(PCIDevice *d, Error **errp)
     d->config[PCI_INTERRUPT_PIN] = 0x1;
     memory_region_init(&pcie_br->shpc_bar, OBJECT(d), "shpc-bar",
                        shpc_bar_size(d));
-    rc = shpc_init(d, &br->sec_bus, &pcie_br->shpc_bar, 0, errp);
+    rc = shpc_init(d, &br->sec_bus, &pcie_br->shpc_bar, 0);
     if (rc) {
         goto error;
     }
diff --git a/hw/pci/shpc.c b/hw/pci/shpc.c
index e71f3a7483..5b3228c793 100644
--- a/hw/pci/shpc.c
+++ b/hw/pci/shpc.c
@@ -440,16 +440,11 @@ static void shpc_cap_update_dword(PCIDevice *d)
 }
 
 /* Add SHPC capability to the config space for the device. */
-static int shpc_cap_add_config(PCIDevice *d, Error **errp)
+static void shpc_cap_add_config(PCIDevice *d)
 {
     uint8_t *config;
-    int config_offset;
-    config_offset = pci_add_capability(d, PCI_CAP_ID_SHPC,
-                                       0, SHPC_CAP_LENGTH,
-                                       errp);
-    if (config_offset < 0) {
-        return config_offset;
-    }
+    uint8_t config_offset;
+    config_offset = pci_add_capability(d, PCI_CAP_ID_SHPC, 0, SHPC_CAP_LENGTH);
     config = d->config + config_offset;
 
     pci_set_byte(config + SHPC_CAP_DWORD_SELECT, 0);
@@ -459,7 +454,6 @@ static int shpc_cap_add_config(PCIDevice *d, Error **errp)
     /* Make dword select and data writable. */
     pci_set_byte(d->wmask + config_offset + SHPC_CAP_DWORD_SELECT, 0xff);
     pci_set_long(d->wmask + config_offset + SHPC_CAP_DWORD_DATA, 0xffffffff);
-    return 0;
 }
 
 static uint64_t shpc_mmio_read(void *opaque, hwaddr addr,
@@ -584,18 +578,13 @@ void shpc_device_unplug_request_cb(HotplugHandler *hotplug_dev,
 }
 
 /* Initialize the SHPC structure in bridge's BAR. */
-int shpc_init(PCIDevice *d, PCIBus *sec_bus, MemoryRegion *bar,
-              unsigned offset, Error **errp)
+int shpc_init(PCIDevice *d, PCIBus *sec_bus, MemoryRegion *bar, unsigned offset)
 {
-    int i, ret;
+    int i;
     int nslots = SHPC_MAX_SLOTS; /* TODO: qdev property? */
     SHPCDevice *shpc = d->shpc = g_malloc0(sizeof(*d->shpc));
     shpc->sec_bus = sec_bus;
-    ret = shpc_cap_add_config(d, errp);
-    if (ret) {
-        g_free(d->shpc);
-        return ret;
-    }
+    shpc_cap_add_config(d);
     if (nslots < SHPC_MIN_SLOTS) {
         return 0;
     }
diff --git a/include/hw/pci/shpc.h b/include/hw/pci/shpc.h
index d5683b7399..18ab16ec9f 100644
--- a/include/hw/pci/shpc.h
+++ b/include/hw/pci/shpc.h
@@ -38,8 +38,7 @@ struct SHPCDevice {
 
 void shpc_reset(PCIDevice *d);
 int shpc_bar_size(PCIDevice *dev);
-int shpc_init(PCIDevice *dev, PCIBus *sec_bus, MemoryRegion *bar,
-              unsigned off, Error **errp);
+int shpc_init(PCIDevice *dev, PCIBus *sec_bus, MemoryRegion *bar, unsigned off);
 void shpc_cleanup(PCIDevice *dev, MemoryRegion *bar);
 void shpc_free(PCIDevice *dev);
 void shpc_cap_write_config(PCIDevice *d, uint32_t addr, uint32_t val, int len);
-- 
2.38.1

