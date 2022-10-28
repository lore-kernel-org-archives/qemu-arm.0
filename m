Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp1203610ejn;
        Fri, 28 Oct 2022 05:31:59 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7nlwnPYEojiJ2f5zgUWu374LNMBylJI1142q1ZDtA+5uduQbWHi8rFlK/ubX6SMZoKdgqQ
X-Received: by 2002:a05:622a:1710:b0:39a:cc1d:1daf with SMTP id h16-20020a05622a171000b0039acc1d1dafmr46603970qtk.394.1666960319303;
        Fri, 28 Oct 2022 05:31:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666960319; cv=none;
        d=google.com; s=arc-20160816;
        b=TWa6MfZB54XZ4HQTtJmXflbpTnh/EPMskDPGxIE10T4WqdsNxegszL8rIfiAKC8vSv
         ovRhu0TW8UuoRiCTcZ1J0o9k67B8HtdOOpIlH6guQnj3hfr33pDU/GDjBdMXjYDpQR5g
         Rqw6tni0Sc4DSNaSVVsa+iCVJvMFOJavsQcyi3FM1JEiO4EJ0pkrxKkr5KENHCkkcHSl
         atAi01ST5UbibnGdQCUKgcAtlPh55Et/WojBB6JaPjM0KBybtshzBHjcuaWhem8fj9XF
         Q8PCPOSQ+Y33lBYeQFHBjxxL9pJnvx/3hgRrzrArFi7XxQEo6h5x7ANXZ3O6yGUod12Y
         oVqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Dqc5LLPJjFQlDlaLY/6hGAzf/cbhcBszssmeQVoPp1s=;
        b=fQDtf0saPi1WhtnpS+Y2bJ0xfRcZ1sPrZ0B5Y71DEiYcKSUOnkqCIbGAYm90k+Yizc
         NYSEy/uae1gnZwzaoLja+DTMrSMLIw6lYTUBx42kjjJxBUMpbmTU0r+2JMcpzjhp36E2
         yP+oK1KR16jp+uHnw+nB6wgzzQh6v7QxNSGcVNsH3IZF5wylgV/vzzsRBnS4brd70OZY
         sbD+R6onzAzAsrjVVJY5Gf3bXAeBkYc1gvES/WysHfiKvT0nYItMhS/SxS33Nn0s0Ace
         rOhYVV/YYppeVA3LYqas0SId7MrNXkczfF3uubcecvPL6q5huGkqSlRlCnN4BKpcjqV+
         bbPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=USecb4um;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a6-20020ad45c46000000b004bbae9d4a0fsi891626qva.425.2022.10.28.05.31.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Oct 2022 05:31:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=USecb4um;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ooOVj-00078E-37; Fri, 28 Oct 2022 08:30:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ooOSe-0002zp-DW
 for qemu-arm@nongnu.org; Fri, 28 Oct 2022 08:27:48 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ooOSb-0003QE-By
 for qemu-arm@nongnu.org; Fri, 28 Oct 2022 08:27:44 -0400
Received: by mail-pl1-x629.google.com with SMTP id p21so843844plr.7
 for <qemu-arm@nongnu.org>; Fri, 28 Oct 2022 05:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dqc5LLPJjFQlDlaLY/6hGAzf/cbhcBszssmeQVoPp1s=;
 b=USecb4umgn7k5tkrzxjIuZuDEOuQlWGi/w5nV7J3ikC8z5Y5KBhcIEPRj8TO3e/Lld
 Ti9ALLElnkdDByW6JLRSSOTQS44JyRmM0XbAkebWtVjx6PBfIJcQdP2CqablBR7wOsjR
 5GwaNUxHLn5EZcGJ7sERtBbUzDD8KKkWonfrY7QKkPcDvGjR8d3tLMG/+XnaawCcj+fj
 ANdmcEJk64SytxmonSa60Outt3oZQsoDzUty6DnH3SHE5x2a7C9pfpxzLMKh5KCstb8D
 C9cmEc/UuD8HgwKST7oFoXJjFDhzQK01hpzXVeHN0c1z9GSbRbZXn8ElX94XsesPAWlP
 Bf4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Dqc5LLPJjFQlDlaLY/6hGAzf/cbhcBszssmeQVoPp1s=;
 b=3bJanhmOoTmtCh2W0eMg6vD/2gwcV3xVv3+Wx43WxMFUGS4JSUQ65AlsTi/qi8MdfQ
 Gc3xGZwwa3UMIda3gLp1oi6XUyAWZeEmPD4xM0tACmXGbiJc5BhgS7p0mUUpeQnm9sG4
 6r1KykRz96BlwVICpWlLrHvZBsMLN9euwP/7BgyyTYxnV6EpQvV/t9JfJLPWX5gN2Cnu
 /IwmiYBdgO+L/AvNzTdjtmK6/Lbyblj8I/IPYZ5hECHtd7Q1Hu22JQmVqzEPQ/TFzdYs
 lIle3c5LAqmSBe1hXieqoewMgzZ4d2Q2/Nm28Tzl2uf3Jwr348tJlO2p3vH2YnWm6vNY
 qy3Q==
X-Gm-Message-State: ACrzQf2RMOUlL523U368Z0O0aUEOpRCZ1r5zu31iFOvts/1dA8JV4ABV
 BHp/aiKlEG1VzOJjpPxqm61mJg==
X-Received: by 2002:a17:90b:4f46:b0:20d:1fe8:dcd2 with SMTP id
 pj6-20020a17090b4f4600b0020d1fe8dcd2mr15990543pjb.235.1666960059175; 
 Fri, 28 Oct 2022 05:27:39 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 x3-20020a170902ec8300b00174d9bbeda4sm2948456plg.197.2022.10.28.05.27.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 05:27:38 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Alex Williamson <alex.williamson@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, qemu-arm@nongnu.org,
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
Subject: [PATCH v5 11/17] pci/shpc: Omit errp for pci_add_capability
Date: Fri, 28 Oct 2022 21:26:23 +0900
Message-Id: <20221028122629.3269-12-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028122629.3269-1-akihiko.odaki@daynix.com>
References: <20221028122629.3269-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::629;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x629.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: v1oiSonqFBbd

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
2.37.3

