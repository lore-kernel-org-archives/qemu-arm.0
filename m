Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp1729681ejn;
        Fri, 21 Oct 2022 22:39:30 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4rcenPLxlEXlCMswZ2CvkY6TDaso+LGK2VD5i6R5W1haUt+PoUjKeu96rFTYMLQZiy3/C3
X-Received: by 2002:a05:622a:138c:b0:399:72a0:477 with SMTP id o12-20020a05622a138c00b0039972a00477mr18627435qtk.607.1666417169929;
        Fri, 21 Oct 2022 22:39:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666417169; cv=none;
        d=google.com; s=arc-20160816;
        b=07ZJMSXJcey00fyjPowPtzAyuk5eKnFA7l4Q013/2d3/ubz5YYyVsYgJuDwBG8foJm
         EgHhLtK45+e0HUYensm7Zd/uLQgxTryaeG1CBsgperDGAgzis0oMzaT+NWsoWkCwefhD
         EjIVTSTvWY1yrwedsYuX2/b8pHSJtYmk0r4JTTAYe7Vx/zp7nZbwJU7jvMHrdZICsOa1
         Qq1ywe/l5TaucJ0D0aWfI35J2dNy1IWBBHbec6NtokevIMSg0g0Ys9gdFUpR6vDf3nIa
         OFUWssco+ilwbBndvkACeUiCVN2nwljbclifJFao+zsECQ2ggBb1u7XpsSZnrzLGodD/
         TX3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=lYXsnmI64THN87X9qxc5pT/qxy+vaFZS48nunSgSsh4=;
        b=Ul21BZXJEYwdanKfDv9vF04Vqa0MxG1cpw+FilHIN2oFGXhMFsnLfHmYfNMHcoeTUg
         wRxQYBGgoe1AsFyaTDK4Bz5cXARqL2VUqg7RoWHnne5BuzHH2CKCTE4YTmiIKcsYqID8
         wNiKPQjpJs6JX8ktgVzWwRXMlR4npSy/Ap7DUyaYiLGg0HdX4hU6maxZJ4LsHypZNGkV
         8iBbiuLYI7D2NEGEDGlLSuTdFW3kC7JRtfO+yihqAdvhH0NySeH9ZgfwP49yC2dqNkyx
         Km+OpB58yymrzdTr/64hAH0asMycXhZ9IjGCHaQDpuH9p2JWLgKn2jQH9qjP8zdCGl9J
         sUOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=N0WfITOv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gw8-20020a0562140f0800b004bb5e2bd1e1si673236qvb.212.2022.10.21.22.39.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 21 Oct 2022 22:39:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@daynix-com.20210112.gappssmtp.com header.s=20210112 header.b=N0WfITOv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1om6Kl-0005cw-FI; Sat, 22 Oct 2022 00:42:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1om6Ki-0005bW-RW
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 00:42:04 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1om6Kg-0003j8-5O
 for qemu-devel@nongnu.org; Sat, 22 Oct 2022 00:42:03 -0400
Received: by mail-pg1-x530.google.com with SMTP id b5so4256207pgb.6
 for <qemu-devel@nongnu.org>; Fri, 21 Oct 2022 21:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lYXsnmI64THN87X9qxc5pT/qxy+vaFZS48nunSgSsh4=;
 b=N0WfITOvKFqLbEQ7Mw6lsChtLiZKrvUX2zVfyVcXFsXp7WMAfrdkEzqOp5zgBxnsk9
 x8C18WiEGdjEXt8Mk5ZW2xgYIQ2KaOf8HTg3x94UISSMwpPcah1fUTIGoLJB4c3ZfrlR
 qmg25cF7eK0yxUAPQyicJYhZegM9N657AjOu7udb1xWGoB4KaymqJXnpJuhf1CJ4BagP
 sYrgX4iwNrOPH9uv3N14KpqC5pPk9FuvyvBxpaLJw572vFYZ4M+yov/E1+e/5+wVq/Do
 2Z12moXmf3xOHPaSvfdDQu2r3XubOSdWGezjAq1xaEi6+a8Peauj5JwNr+5wXQUqZYAG
 L6dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lYXsnmI64THN87X9qxc5pT/qxy+vaFZS48nunSgSsh4=;
 b=OAR39LwQfYhQuEHBTiTT0031kVmT5lrbLPh737k9oI/cOXvH1j+4YERDf3KhIjiyBo
 vCXXynDzXxH38Co8QpZWn2dG0UqElxFGAkefSAX/P+Kdj6BD/Zj1wAD9qrcr+AHAcizd
 HHOzS1PPQClFB9gtL/IAwubean3hEBbZD9jxlR2aG2UxoueNkepZMfaQUK5X3E4K9li4
 k02PqX7UybRMkNDIGKTcGpuDdkNV/ngL7ip4apPyZz+x1c0eaYKWhuutBMcfl7m6/CTy
 D3OWHapXYbhQWLYOB3qhZrGI7F7lBXJDdE4U2T6I+w5YM6jhMiySjPTORr6eHTv7yGvJ
 UlWA==
X-Gm-Message-State: ACrzQf1izHuKKjGJT3KEndUA+UI7G2leSwHTsbj+9s7MxWp6H5aBfg3R
 f/gpigQ6o6zHdX9Vj04ZapZdmA==
X-Received: by 2002:a63:f305:0:b0:43f:6af:7553 with SMTP id
 l5-20020a63f305000000b0043f06af7553mr19219965pgh.570.1666413721516; 
 Fri, 21 Oct 2022 21:42:01 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a17090264d000b001868d4600b8sm178049pli.158.2022.10.21.21.41.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Oct 2022 21:42:00 -0700 (PDT)
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
Subject: [PATCH v2 10/17] pci/shpc: Omit errp for pci_add_capability
Date: Sat, 22 Oct 2022 13:40:46 +0900
Message-Id: <20221022044053.81650-11-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221022044053.81650-1-akihiko.odaki@daynix.com>
References: <20221022044053.81650-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::530;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pg1-x530.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: uuZy3TGVXvqk

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

