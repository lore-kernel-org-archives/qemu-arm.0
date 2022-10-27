Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp161420ejn;
        Wed, 26 Oct 2022 23:48:28 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM60XOAi/kW+o8xWp8q4omYD1g3KnF2rMOUvRpaBjjUhMkvU6fEv9sT+eKYBGtLHtp35ruG4
X-Received: by 2002:a05:6214:1a48:b0:4bb:604d:fb2c with SMTP id fi8-20020a0562141a4800b004bb604dfb2cmr20900273qvb.93.1666853308510;
        Wed, 26 Oct 2022 23:48:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666853308; cv=none;
        d=google.com; s=arc-20160816;
        b=aM5mXRPX26dfNPa7gI4vHJtXyPvy1KtBXXNmeTx4b7+n157MTdBBV8p6AKUGfQJFB2
         XM0QSGuFt5esP9SNFvAHWnKFCSBt5z2Ye5XNFK37g2wPCMM3B8eg2yxPuf62kzFbCU/1
         t00Qe+RF2hSpoBL35OdYhaotQ4Hly29LrtcI7Eo/S0SD8rfo0Eef5Ut4FY/5AuKlkAAG
         uc2j3ftRaQBXqN1sIlnQ4CIIK+UTNL0EiPf7jLCWGMU2cpjYhiAcsOR9g3zQwlP8yLoB
         SWOZLYiwsy1xr8M23QJt0txUjqFyw9cNPE3NbeiyweISM8zN7yXgZzB8jSDDFiXoHxm/
         WtWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Dqc5LLPJjFQlDlaLY/6hGAzf/cbhcBszssmeQVoPp1s=;
        b=xnLe+4xB2flX13sgNt9En7zW4g0XC2OXBM012MXpn/ejmHMA6bcJ4gZ4Xr6tsilvAa
         QML5oFjDdizNZh9M7REtQTM7igTMARpu2NBm5uMkEEzAp2sR8AP3Z/T5KQjzXKrguVhY
         lu+b0AdExFR34c0WXawD+J/zEwbFi01NSRBoio0Yw+XEpWtjfHlZ7YSJsHnjsJ2mTO7i
         MvT0cYa29XgQHRaB6mPVC8CB6uiKEK2mSs8hEPnibvFjhHuUsWc21gJUiLzLwhVSCis3
         N4sM+t+y39E8gJY3QoKNwlPXJNmuC/MVWSvv/8EiC3h45yivR7kF3dGH1mEyGD282Ny8
         9gpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=FdXUaj+K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ke23-20020a056214301700b004bb63dda5absi420769qvb.276.2022.10.26.23.48.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Oct 2022 23:48:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=FdXUaj+K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1onwZ1-0004W8-62; Thu, 27 Oct 2022 02:40:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1onwWv-0004Iz-S5
 for qemu-arm@nongnu.org; Thu, 27 Oct 2022 02:38:19 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1onwWt-0003K1-CX
 for qemu-arm@nongnu.org; Thu, 27 Oct 2022 02:38:16 -0400
Received: by mail-pg1-x529.google.com with SMTP id g129so389895pgc.7
 for <qemu-arm@nongnu.org>; Wed, 26 Oct 2022 23:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Dqc5LLPJjFQlDlaLY/6hGAzf/cbhcBszssmeQVoPp1s=;
 b=FdXUaj+KFq9Ubs/NuxsJ+jwFt74+Kq0ia5GI7uOpdWUeygrWUy92t+bLEfuhqNXQhe
 idicHOe7UbUTGUP9kd4NuDrF7Sm3cBb6jtgPGG3gyVWfi3mZwy0hTsEl+sVyQUWWBQMy
 HTn+hgAZAMOhxBBRqKS9w6wbhzjyRYG0aq5qsIXs5cOAPS7AGh05OYOOTChq3jxbjgQ8
 R/gTZGM0Z7yqIKN1RyrB6pcRQzxp15PumtN2o4ns+4pWGrWBFg3r6fNwb9kWehdT54oh
 KtSxJciYtVtIR2ZRKuufY82cXTq54XQ5Ewj+vCj3UhUiCwb1SHNMCo6gPtAV4CO7N+9T
 6EGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Dqc5LLPJjFQlDlaLY/6hGAzf/cbhcBszssmeQVoPp1s=;
 b=2fom7ujCaIBgVNJod51xkzoi4aHpx0r/zA1cVYx6+7W6sFkHXYd8dJDNkg21fpKkhR
 ZH+Zw6nydF3tGxMAfJSx0Teft4iYLSdx/FR0dc3NyrrQrWpye0o6EKjwlpAE3uDTLibg
 6dKoonT6bfObA2KLTGDUZtODoM5a1B1AdwuvoryLYPlb9oHP+05bm7S4zhbZs3HNyZiq
 hv2iNjP61/UTlN0yKXjhcAmvBW4TiVz4UqrDiqcK+qTLSRyZJqDKSJBjXClEp8itsT33
 ibRAYkFFFoL6AhZOHOq92YjPfAcP8WOh8kbVKXoDXwN9bqZ8D5CcO/6eu+Q9+HQ/v0fd
 NWCg==
X-Gm-Message-State: ACrzQf0PngWQbNhTmMm7oKqivhinnIniQEK4t30Hps5xMkbDx1evoOPg
 Op34sTAiKNwhfEV3uT7PQ/NbOg==
X-Received: by 2002:a63:5d5b:0:b0:46e:f010:d0f7 with SMTP id
 o27-20020a635d5b000000b0046ef010d0f7mr20534344pgm.585.1666852692173; 
 Wed, 26 Oct 2022 23:38:12 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 z17-20020aa79491000000b0056b818142a2sm448872pfk.109.2022.10.26.23.38.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 23:38:11 -0700 (PDT)
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
Subject: [PATCH v4 11/17] pci/shpc: Omit errp for pci_add_capability
Date: Thu, 27 Oct 2022 15:36:59 +0900
Message-Id: <20221027063705.4093-12-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221027063705.4093-1-akihiko.odaki@daynix.com>
References: <20221027063705.4093-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::529;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x529.google.com
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
X-TUID: NLHdYJfeFae2

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

