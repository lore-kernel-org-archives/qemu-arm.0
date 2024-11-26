Received: by 2002:a17:505:4c56:b0:1be9:327d:8ee3 with SMTP id do22csp1936265njc;
        Tue, 26 Nov 2024 03:24:48 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVn0DVfOQ2LWeGWmCcYOmmw4M848+w4oNLC3VDLnB6pDBcEBxbXnS5a+LQXD10lGD8TVsun2L1/jGm/Cw==@linaro.org
X-Google-Smtp-Source: AGHT+IH8Hm6ThV5cBLyB4GVSxpsYiTw1GZaGioPSq5zPTFnt9b4mFiiK4dX4cUGeTEXdi+eck3gs
X-Received: by 2002:a05:622a:894b:b0:466:8819:6f8f with SMTP id d75a77b69052e-46688197202mr95421591cf.11.1732620288261;
        Tue, 26 Nov 2024 03:24:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732620288; cv=none;
        d=google.com; s=arc-20240605;
        b=V2atb9ynYfo0avFUPF1lG6znariYeWNcOd3/PUqTAcd0SeXMXbOnW+F7fqhzl1cEb1
         ArNm0XacAfBzo6/xxXD50HxdrciK++dFxuLD4U7FlZDCWI35iEioqc4lyaTnnxTQaXU3
         Su8Y/HGpzGFGfgumGg772K9yOoF3e7eeHA+gl4h3vA4DKa0hZLvr3L1oqOER9g0SqkXv
         ctt/paLS+NdbTYHpUJnCkDJbAjzDoFmIabvXlFeaW4vkJXpIWv2Et/e/5w7lbTh4arJa
         YZop91hs0ogSTQtdjq92eMtGBOUjRWTf/TSySnl2U8e/rR/KwYYzdLHl67YTQhNBbTND
         kThw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=WlPdyc/DTHUeKFvLcv8XiL1CJLw++4u5ykrc9rCsGw0=;
        fh=HJCS9vqhL5iKX8rwXvBl912v+0TxEnQa1UnMTFQ5hoI=;
        b=jSx97W1VuLIEpMvLNkEMbBkFMyHrRYRNVz8Bmm/B+4KxxVhXFJk1HbBcSgg1SO2FOD
         +tpiV0/opjyiWb2Sov95I2mS9DLs+gUt1icUm3Yd5ZudY5yCUK4l1KSQ8mtsHhJxUUGU
         0DLcVvyW84gV0mj1bYT5ILp9KWv6Jyk2ET5wv+j5CV3vGSMmwzE0GbIG9IOvl0vfOFPo
         1NKa7Tt0ce6+VlBuZJSrUuQ+Szv6auJJnYuxV9BaErlz4q1AmcOMwtfqV/lPfW3oi05G
         mKEizp+tg6c6f9zcP3kCnIAncmWUXVRDN5QbT6AyY+wfUDK6mknhjRS5r0uSDpEl05bP
         8jqA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kL3XWD4G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-466a676930dsi15191491cf.129.2024.11.26.03.24.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Nov 2024 03:24:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kL3XWD4G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tFtgU-0006Sz-CB; Tue, 26 Nov 2024 06:24:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tFtfA-00041X-Md
 for qemu-arm@nongnu.org; Tue, 26 Nov 2024 06:23:26 -0500
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tFtf5-0002pU-2A
 for qemu-arm@nongnu.org; Tue, 26 Nov 2024 06:23:21 -0500
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-53de556ecdaso1887691e87.1
 for <qemu-arm@nongnu.org>; Tue, 26 Nov 2024 03:23:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732620194; x=1733224994; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WlPdyc/DTHUeKFvLcv8XiL1CJLw++4u5ykrc9rCsGw0=;
 b=kL3XWD4GFgeZTLHRbeakLUGuvKuZVApvnRo89G5+ETHvGhglGVFX7UAbd1CTX4wn5I
 YIi+HluaTdhjBjfZH4Nig4OoWdBb0rzgUJ2TGJrcx2XKxh9/9awkcR61QLsFIUdDuhhg
 T3YjKQVl7XNbE2sF3sjl9cRqNEhLOoRo9DuJRMzs3wN4n7k3jv2DhHvZ1WI3Z3jXiUWa
 od9nlaqu0ML5uyjo7qJ5j2rlyL9iKLi2eSCLAsMxj1m1zqiKKcbX7xZiTveiRJQfldzb
 pMLvcxftqBmfTyXoGPSSveg89Zl4qzyEwJHd3W5iplS1hKAK/29uAfxqkAlQ5LKtL/ZK
 AsGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732620194; x=1733224994;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WlPdyc/DTHUeKFvLcv8XiL1CJLw++4u5ykrc9rCsGw0=;
 b=ehhuHncc++CI0EWKKcaX9SXVLq0pz4jAASHk4dJcgRvgPAC9TQtXT9NjkiD/QqcglH
 2Aks4Vnzn4sdK6D4E1sQXKQz8iPUvS67zrExEeaH6ii+A4EJ5If8W8+jRZlt4YK3w1Oz
 QwgXG+LndmmzLFSVIjJwk4xOwy/U09JRn1U/et7fhOa+PGaIjJFxGWirgc6gGqifVtvD
 SmXwq3yiH9o2P09/unlEBmj9RFFvpzzR3oyk1WANT+fKSp43S6S2pC4P4Z+9UiMJ5hTZ
 A2sJc1C4lC3Jlrg4o/8ksjMkPemoTHKud733KDWpmKbgku1V+CIWuGNfqDo4jw7LsVwC
 QQCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVJVzVkhC6zcOjBbLlcXSA89VKjjRaagtRPDnsWM8NVlbg7dip+wotdFpjab7UEEz8J25wgbofB3A==@nongnu.org
X-Gm-Message-State: AOJu0Yz5yBvMkJe6ZkODXsIDu4wpcwhM8XxcgOg9ffHrQSZSe5KS+cgy
 95sYoARrsFy3e3CblUq+Vtx82wH+4Hu5wLBh8EnqvVl2H2IOejIrtgJNVVHKSQY=
X-Gm-Gg: ASbGncsQm2VPjhZC/sDfoI2vTbrD6A/wShQUVtqvzteGMF/QhYtOGQJ6aH4PLVnyMAV
 VJBANXFHMdwplzeS8GyEI2FgBbpuezfPVOK1DCyvaPkM+WQwrSm0HCHYW9QQWX6kDM5EFoDdNZF
 uEfE17D/fFraS7swwsCsYVNH0TZBYmcfDHzWdOQb5nRibkdN0ajICziifqVu8P8dHnoQMqKWEY8
 uzzdxrQacBnaff6SVx9td/RTHj9WQpGHgCEzBslTzVWanVfZqBALldmuoePT2g2CBuRC0Kw
X-Received: by 2002:a05:6512:2209:b0:536:73b5:d971 with SMTP id
 2adb3069b0e04-53dd39b0ddcmr7303704e87.38.1732620194134; 
 Tue, 26 Nov 2024 03:23:14 -0800 (PST)
Received: from localhost.localdomain ([176.176.143.205])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4349d60de86sm90041125e9.35.2024.11.26.03.23.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 26 Nov 2024 03:23:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-riscv@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.0 v2 07/13] hw/pci: Propagate bar_at_addr_0_refused to
 pci_root_bus_new()
Date: Tue, 26 Nov 2024 12:22:06 +0100
Message-ID: <20241126112212.64524-8-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241126112212.64524-1-philmd@linaro.org>
References: <20241126112212.64524-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12e.google.com
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
X-TUID: rhW+tJVlcLSw

Have pci_root_bus_new() callers set the
'bar_at_addr_0_refused' argument. No logical change.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/pci/pci.h                | 3 ++-
 hw/pci-bridge/pci_expander_bridge.c | 9 ++++++---
 hw/pci-host/gt64120.c               | 2 +-
 hw/pci-host/i440fx.c                | 2 +-
 hw/pci-host/q35.c                   | 2 +-
 hw/pci-host/remote.c                | 2 +-
 hw/pci/pci.c                        | 7 ++++---
 7 files changed, 16 insertions(+), 11 deletions(-)

diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index b499846083f..f5454db0eb5 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -288,7 +288,8 @@ void pci_root_bus_init(PCIBus *bus, size_t bus_size, DeviceState *parent,
                        bool bar_at_addr_0_refused);
 PCIBus *pci_root_bus_new(DeviceState *parent, const char *name,
                          MemoryRegion *mem, MemoryRegion *io,
-                         uint8_t devfn_min, const char *typename);
+                         uint8_t devfn_min, const char *typename,
+                         bool bar_at_addr_0_refused);
 void pci_root_bus_cleanup(PCIBus *bus);
 void pci_bus_irqs(PCIBus *bus, pci_set_irq_fn set_irq,
                   void *irq_opaque, int nirq);
diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expander_bridge.c
index bbf615f544b..d4b472a8305 100644
--- a/hw/pci-bridge/pci_expander_bridge.c
+++ b/hw/pci-bridge/pci_expander_bridge.c
@@ -358,15 +358,18 @@ static bool pxb_dev_realize_common(PCIDevice *dev, enum BusType type,
 
     ds = qdev_new(type == CXL ? TYPE_PXB_CXL_HOST : TYPE_PXB_HOST);
     if (type == PCIE) {
-        bus = pci_root_bus_new(ds, dev_name, NULL, NULL, 0, TYPE_PXB_PCIE_BUS);
+        bus = pci_root_bus_new(ds, dev_name, NULL, NULL, 0, TYPE_PXB_PCIE_BUS,
+                               true);
         bus->flags = parent_bus->flags & ~PCI_BUS_IS_ROOT;
     } else if (type == CXL) {
-        bus = pci_root_bus_new(ds, dev_name, NULL, NULL, 0, TYPE_PXB_CXL_BUS);
+        bus = pci_root_bus_new(ds, dev_name, NULL, NULL, 0, TYPE_PXB_CXL_BUS,
+                               true);
         bus->flags = parent_bus->flags & ~PCI_BUS_IS_ROOT;
         bus->flags |= PCI_BUS_CXL;
         PXB_CXL_DEV(dev)->cxl_host_bridge = PXB_CXL_HOST(ds);
     } else {
-        bus = pci_root_bus_new(ds, "pxb-internal", NULL, NULL, 0, TYPE_PXB_BUS);
+        bus = pci_root_bus_new(ds, "pxb-internal", NULL, NULL, 0, TYPE_PXB_BUS,
+                               true);
         bus->flags = parent_bus->flags & ~PCI_BUS_IS_ROOT;
         bds = qdev_new("pci-bridge");
         bds->id = g_strdup(dev_name);
diff --git a/hw/pci-host/gt64120.c b/hw/pci-host/gt64120.c
index 14fc803d279..3cc92e7200f 100644
--- a/hw/pci-host/gt64120.c
+++ b/hw/pci-host/gt64120.c
@@ -1193,7 +1193,7 @@ static void gt64120_realize(DeviceState *dev, Error **errp)
     phb->bus = pci_root_bus_new(dev, "pci",
                                 &s->pci0_mem,
                                 get_system_io(),
-                                PCI_DEVFN(18, 0), TYPE_PCI_BUS);
+                                PCI_DEVFN(18, 0), TYPE_PCI_BUS, true);
 
     pci_create_simple(phb->bus, PCI_DEVFN(0, 0), "gt64120_pci");
     memory_region_init_io(&phb->conf_mem, OBJECT(phb),
diff --git a/hw/pci-host/i440fx.c b/hw/pci-host/i440fx.c
index 4f0a0438d77..35a54b953a7 100644
--- a/hw/pci-host/i440fx.c
+++ b/hw/pci-host/i440fx.c
@@ -268,7 +268,7 @@ static void i440fx_pcihost_realize(DeviceState *dev, Error **errp)
     memory_region_add_coalescing(&phb->conf_mem, 0, 4);
 
     b = pci_root_bus_new(dev, NULL, s->pci_address_space,
-                         s->io_memory, 0, TYPE_PCI_BUS);
+                         s->io_memory, 0, TYPE_PCI_BUS, true);
     phb->bus = b;
 
     d = pci_create_simple(b, 0, s->pci_type);
diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
index f3e713318ed..e47ba7aa0c2 100644
--- a/hw/pci-host/q35.c
+++ b/hw/pci-host/q35.c
@@ -65,7 +65,7 @@ static void q35_host_realize(DeviceState *dev, Error **errp)
     pci->bus = pci_root_bus_new(DEVICE(s), "pcie.0",
                                 s->mch.pci_address_space,
                                 s->mch.address_space_io,
-                                0, TYPE_PCIE_BUS);
+                                0, TYPE_PCIE_BUS, true);
 
     qdev_realize(DEVICE(&s->mch), BUS(pci->bus), &error_fatal);
 }
diff --git a/hw/pci-host/remote.c b/hw/pci-host/remote.c
index bfb25ef6af8..646e14de4e9 100644
--- a/hw/pci-host/remote.c
+++ b/hw/pci-host/remote.c
@@ -43,7 +43,7 @@ static void remote_pcihost_realize(DeviceState *dev, Error **errp)
 
     pci->bus = pci_root_bus_new(DEVICE(s), "remote-pci",
                                 s->mr_pci_mem, s->mr_sys_io,
-                                0, TYPE_PCIE_BUS);
+                                0, TYPE_PCIE_BUS, true);
 }
 
 static void remote_pcihost_class_init(ObjectClass *klass, void *data)
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index f7158fb9573..5fea39e4dfa 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -571,13 +571,14 @@ void pci_root_bus_init(PCIBus *bus, size_t bus_size, DeviceState *parent,
 
 PCIBus *pci_root_bus_new(DeviceState *parent, const char *name,
                          MemoryRegion *mem, MemoryRegion *io,
-                         uint8_t devfn_min, const char *typename)
+                         uint8_t devfn_min, const char *typename,
+                         bool bar_at_addr_0_refused)
 {
     PCIBus *bus;
 
     bus = PCI_BUS(qbus_new(typename, parent, name));
     pci_root_bus_internal_init(bus, parent, mem, io, devfn_min,
-                               true);
+                               bar_at_addr_0_refused);
     return bus;
 }
 
@@ -622,7 +623,7 @@ PCIBus *pci_register_root_bus(DeviceState *parent, const char *name,
 {
     PCIBus *bus;
 
-    bus = pci_root_bus_new(parent, name, mem, io, devfn_min, typename);
+    bus = pci_root_bus_new(parent, name, mem, io, devfn_min, typename, true);
     pci_bus_irqs(bus, set_irq, irq_opaque, nirq);
     pci_bus_map_irqs(bus, map_irq);
     return bus;
-- 
2.45.2

