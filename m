Received: by 2002:a17:505:4c56:b0:1be9:327d:8ee3 with SMTP id do22csp1935556njc;
        Tue, 26 Nov 2024 03:23:12 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWymV00wE1qYxPu3T9MaHPfYc3LU42392LP37amK1LIzDcGgohiK96p2HRlUeVs1cAogvN0eg8pd6nqNA==@linaro.org
X-Google-Smtp-Source: AGHT+IFuy8cyRcWXTcSW0mLJJt4lhVf7rzI/DlYhnQF+NmmCVVc/UxJbyKYz46DtzvNB87juUnOX
X-Received: by 2002:a05:690c:74c7:b0:6e3:37a7:8a98 with SMTP id 00721157ae682-6eee08a4daamr161956117b3.14.1732620191865;
        Tue, 26 Nov 2024 03:23:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732620191; cv=none;
        d=google.com; s=arc-20240605;
        b=XheyNTk77FH9SktDjhzZF8bHFcsKXi2BqZ/QFYTlvUhOxpDdPSnFxYZlpzW1bG/NtT
         N0TTgVl8A1Lh4LCjrCy8SGc7HJmxtS59tkkx1Opxy0dUPhyl31PdZ2GUPjIPKpioD4pE
         IDEd6BS7EQQjGWXOo5qM05EEUEofPrJB6zJmIWXplwFwU3eK3YVFf0hqeRG59EVbyW6+
         H0xXeMeZT+PToNll3Qvdmk4AEthx8s+QPkqsVfEoe1HqMq+2FcNAdvwWeC/qtjzum1mK
         haC4JulHmlNmEQuX9pIQU4yj0yOuCZeVcpssv2BYE+ZM4FtJKvW8/F3WuTSS1A2R3NyO
         OeqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=XytEl+ZiAvdgFcp20ox+30b5Cy75Cc7byEhOtvETzBY=;
        fh=URBMvZUSd9pDlrSdR1CPpC91mr5YVF3RHA8aoeU5t0U=;
        b=F+eu/upiiP21l5PA0bBXF15MSQSwebje/P524ktYLQfBW49gZge5GGluGUyvaapWtT
         GK181PM7W9jFjn7XGWMXBKbD/xiQSC7xDA2WvGK3Pv9dD07RqRvUeeoyZt1PT324kuQo
         9HtrpccqzjOlRQNhmK+dhfQj2fsKvsgAEtZQRsFZahqKgEDwDS9tnrzNrB3Y8L9xTqby
         c95hXQqPqkzwjtWkQVcXCnoMA1JYoI1419xptgkc8Xj7PMW7N11SBUfQwLWlSAFpG0uj
         91BVCJSx5OBcFkZfUhWXrLwBOimCzwDY90fOOFsSy38WaE6dMqfkDVBHk5MtxZiFimKR
         N8Nw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ab6xEX7/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d451b1c7efsi117688916d6.226.2024.11.26.03.23.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Nov 2024 03:23:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="ab6xEX7/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tFteL-0003lq-Kk; Tue, 26 Nov 2024 06:22:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tFteJ-0003kK-Ni
 for qemu-arm@nongnu.org; Tue, 26 Nov 2024 06:22:31 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tFteG-0002bm-LC
 for qemu-arm@nongnu.org; Tue, 26 Nov 2024 06:22:31 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4315e9e9642so50600365e9.0
 for <qemu-arm@nongnu.org>; Tue, 26 Nov 2024 03:22:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732620147; x=1733224947; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XytEl+ZiAvdgFcp20ox+30b5Cy75Cc7byEhOtvETzBY=;
 b=ab6xEX7/KSPKZkv7SByMMrs0kYhVjUQBBrRexX3FJdSh4nnpyuts4vH/QREzROZ6YY
 GX6pRdpJxZJFN5g3A/xKSAaFXtvkp7eo1B1g2iZuYZr80xU8kM0MMSQoNfYimvYrS7vD
 5OzLv7yzecdjhWr11LqQsA6VlMJ1GPyILVu/gircI7+lUUoROLvRRGf5ZOlJEV8HTC7k
 3NiUupdMlVS37Y9+FEiYuKCciVKITRwF1kbgZjtc+1nOAayjGShQlGuyzX7XtAY9D0uX
 lY5Kjgo7B0bNL5PlFDxf9Z8DlwQqH21i51lpwMsbwB9RauvG++djPSre1dsfyJSugINY
 6lWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732620147; x=1733224947;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XytEl+ZiAvdgFcp20ox+30b5Cy75Cc7byEhOtvETzBY=;
 b=kQDtNOqsn9URUUYDplDPxvutBQchOI1fHpw85wwrcI9ane9aD8lZLhMrGwDp+5z4HN
 kBQuRarsObZ1d2UjTks1Bhhdq8Dt5JCwH8Q56A1AzD/mCnLqvvkMjVFRJpwECK2sba3I
 UThAQosJSsn6ix4bCi/hh/iKIypYIelPSrS1Kh36YwxMvHf4cgZlTRh6xjansbhEvTga
 XHQcZxh9j4PuNh5HEXsl2UmTmlogaHPAACj8ZkxHyZqpPbVae44SP/D/CWH2h0FyEbuf
 4yqdrNB5Pr2Ojh0ON0ju+aa/bHgSO/WSaacKDWVA06UK3JpEx/puOGy1V/e0KRpJCCwz
 VZsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWaJU3pH6RLOs9i+Hzd6scnAA8DclsWcHLVfJQaPmjMXT52KNYDNWgapB2uDWw/8gIXKJ3zGOAV0w==@nongnu.org
X-Gm-Message-State: AOJu0Yy4bdUXBkULp8KuFuWdDsP2XKRZqNNJMqnm63zPL0oAYXXJgsvt
 WvrNyTzpkI6y+ANATN8ByCJm8zj107Yb7qigMgseYKOoorMwBayIL65BJlv4XAU=
X-Gm-Gg: ASbGnct43h45v1orQfE7h/o5Xu97LvtSeYE5k804OB6tAtuoUjPOlOZTFkc1Pv9lL4V
 I5qI9NvqzyMh9salhrJ5Ex7Bq6iYMSeA4Q9CZyj2qT/AASgwuCHNKJXLxevgegZkWID/lQxX1AL
 arJCvcVasGe+T8EY2STt5z8EwWA5+smQ8cUjvf+6WKin7QmUtk0RB2Mx1CK6d14i9ApHdaov4ry
 oL7KDSOe2mrPUpCDcIugckyPmMbR6b1nkatj9mP0jRkKoU75ep+eTUrH41T4ukETZOUS0Qb
X-Received: by 2002:a05:600c:3b91:b0:434:a29d:6c71 with SMTP id
 5b1f17b1804b1-434a29d6d6bmr39357155e9.27.1732620147073; 
 Tue, 26 Nov 2024 03:22:27 -0800 (PST)
Received: from localhost.localdomain ([176.176.143.205])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3825fb25d74sm13208001f8f.47.2024.11.26.03.22.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 26 Nov 2024 03:22:26 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-s390x@nongnu.org, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-riscv@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-10.0 v2 02/13] hw/pci-bridge: Initialize bridge with
 parent bus flags
Date: Tue, 26 Nov 2024 12:22:01 +0100
Message-ID: <20241126112212.64524-3-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241126112212.64524-1-philmd@linaro.org>
References: <20241126112212.64524-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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
X-TUID: cUfCm6XBYOOa

Bridged buses inherit their parent flag,
except they can not be a root.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/pci-bridge/pci_expander_bridge.c | 8 ++++++--
 hw/pci/pci_bridge.c                 | 1 +
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expander_bridge.c
index 07d411cff52..bbf615f544b 100644
--- a/hw/pci-bridge/pci_expander_bridge.c
+++ b/hw/pci-bridge/pci_expander_bridge.c
@@ -336,6 +336,7 @@ static bool pxb_dev_realize_common(PCIDevice *dev, enum BusType type,
     PXBDev *pxb = PXB_DEV(dev);
     DeviceState *ds, *bds = NULL;
     PCIBus *bus;
+    PCIBus *parent_bus = pci_get_bus(dev);
     const char *dev_name = NULL;
     Error *local_err = NULL;
     MachineState *ms = MACHINE(qdev_get_machine());
@@ -358,12 +359,15 @@ static bool pxb_dev_realize_common(PCIDevice *dev, enum BusType type,
     ds = qdev_new(type == CXL ? TYPE_PXB_CXL_HOST : TYPE_PXB_HOST);
     if (type == PCIE) {
         bus = pci_root_bus_new(ds, dev_name, NULL, NULL, 0, TYPE_PXB_PCIE_BUS);
+        bus->flags = parent_bus->flags & ~PCI_BUS_IS_ROOT;
     } else if (type == CXL) {
         bus = pci_root_bus_new(ds, dev_name, NULL, NULL, 0, TYPE_PXB_CXL_BUS);
+        bus->flags = parent_bus->flags & ~PCI_BUS_IS_ROOT;
         bus->flags |= PCI_BUS_CXL;
         PXB_CXL_DEV(dev)->cxl_host_bridge = PXB_CXL_HOST(ds);
     } else {
         bus = pci_root_bus_new(ds, "pxb-internal", NULL, NULL, 0, TYPE_PXB_BUS);
+        bus->flags = parent_bus->flags & ~PCI_BUS_IS_ROOT;
         bds = qdev_new("pci-bridge");
         bds->id = g_strdup(dev_name);
         qdev_prop_set_uint8(bds, PCI_BRIDGE_DEV_PROP_CHASSIS_NR, pxb->bus_nr);
@@ -371,8 +375,8 @@ static bool pxb_dev_realize_common(PCIDevice *dev, enum BusType type,
     }
 
     bus->parent_dev = dev;
-    bus->address_space_mem = pci_get_bus(dev)->address_space_mem;
-    bus->address_space_io = pci_get_bus(dev)->address_space_io;
+    bus->address_space_mem = parent_bus->address_space_mem;
+    bus->address_space_io = parent_bus->address_space_io;
     bus->map_irq = pxb_map_irq_fn;
 
     PCI_HOST_BRIDGE(ds)->bus = bus;
diff --git a/hw/pci/pci_bridge.c b/hw/pci/pci_bridge.c
index 2c7bb1a5254..d47ded9e0cf 100644
--- a/hw/pci/pci_bridge.c
+++ b/hw/pci/pci_bridge.c
@@ -376,6 +376,7 @@ void pci_bridge_initfn(PCIDevice *dev, const char *typename)
 
     qbus_init(sec_bus, sizeof(br->sec_bus), typename, DEVICE(dev),
               br->bus_name);
+    sec_bus->flags = parent->flags & ~PCI_BUS_IS_ROOT;
     sec_bus->parent_dev = dev;
     sec_bus->map_irq = br->map_irq ? br->map_irq : pci_swizzle_map_irq_fn;
     sec_bus->address_space_mem = &br->address_space_mem;
-- 
2.45.2

