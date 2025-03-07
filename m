Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp2449536njm;
        Fri, 7 Mar 2025 12:41:29 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXms7qRBcAEMUoHuIwk85Tr8Frb0CmMMFZ2DQbLYQTknR40q+uBlQ10akZJ5rpFIx+q7DiEsBQmpUXwyg==@linaro.org
X-Google-Smtp-Source: AGHT+IGaS9N4qTSd8+VZv5dIodCoueFy9lExMZIz6yZBysWIieVxZc9fQY0hPP+8MSIiAteEi0Fs
X-Received: by 2002:a05:620a:618f:b0:7c0:a3d5:488d with SMTP id af79cd13be357-7c4e1f21fcdmr683404185a.21.1741380088996;
        Fri, 07 Mar 2025 12:41:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741380088; cv=none;
        d=google.com; s=arc-20240605;
        b=Xm1j3IO/XaC9O3EhKTVxAf1A+i2v9iTW4dDoQNssPuI6cazyAvAZqdW2k6czTvCXSj
         zrntWZ9hOTnTZDwpmwgu2zsFlC2h5h5GHRd1ZZX+da/EkMIaoJvVoMuZtG1L7UU/xocS
         mHarV7F/HpF8S13oka8EKx4ktPYKi3hfTJv9IA2b4Ajl6mXMQm0dUsNVET3nhIhMNldl
         idFJBc5qVtgFOJVSHeJHC6G0Y4BJHGlQf2cCEY433zshPuEl4VWtdKgwhwLEZbQQ8RAF
         MeVutwciiBw9ioe3B0e8AJBjmb4H1G85MCgAF/vmKYyeycEb82Pega9yUeJJlm4eNjYl
         UnQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=ohIL3BV/104Xh7k2LK2qauY0LQOX7g9NVibMeK73rWw=;
        fh=xAeZ1nDGc8bcAjPg/akG/HfAOokMW9O5GJVBYiEy4RI=;
        b=Zruhd1O7RLFNMA2vEHRXoGebL9lIlWA+J9VTtsjzHBz7R8qM/GJ8ObgvtnaEzDZhUl
         aj9zbElUO9vE23vbANcb2MY3EV4CrALOoa3ckfQ6stDJiva0yMFbKeyitgzUxPnLuCaA
         s9sPwIfBkKvnXd9KXlJHuK53l8B9CAygnrmr1LwNoe/SCHGExTaCgePOZD/HtwZ2RQI2
         cZOpp+YOOhCuwY+yszjBnhguG6HQwkiIJf/hmdWB7jUeauW5iC1CUNj3xKpGm6sJhdff
         MUaDhgs3sBHToyGXiXYvzPTZYTUaFxTVeZ1mSDKtTtYlXjr1mdGjzcrOZUwp39hgtGe2
         SNNg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=iKDatbPk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c53c9ffa20si42884285a.64.2025.03.07.12.41.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Mar 2025 12:41:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=iKDatbPk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tqeV8-0004jl-1u; Fri, 07 Mar 2025 15:40:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1tqeUi-0004R3-4P
 for qemu-arm@nongnu.org; Fri, 07 Mar 2025 15:40:35 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1tqeUg-0001wa-30
 for qemu-arm@nongnu.org; Fri, 07 Mar 2025 15:40:31 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-2ff80290e44so2233386a91.0
 for <qemu-arm@nongnu.org>; Fri, 07 Mar 2025 12:40:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1741380029; x=1741984829; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ohIL3BV/104Xh7k2LK2qauY0LQOX7g9NVibMeK73rWw=;
 b=iKDatbPkWhloT8eiSVVqPgSX4g+PdBwKJUPPTfzSgCM3Bd2A1YElwIkOlFxcslY4m5
 lT2VHt0juxfjn7C0OeYnXnofCxxlWM40nR5dFsl6myXbHa96/GZYED3VxyiImxVVF2jx
 ZNmZYcv9mRB2OBPbIgvVosNfHxfQQJKCF0rr23EXnOZ85pq2ZJL2x45Jo5AzlaotuoDL
 OaorC9EE1KgDg7mTdWwkvXwo5+PGLTvHtY/eCNpPml616NLVGM+A8C33k5RuW6tOL7Nx
 N9TNgRVCB3MpgY34WnddRdgJZuXb2lpcF+1tjx7ytHCRDOUBN06HWGqhrK4rfpiBBFew
 hPhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741380029; x=1741984829;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ohIL3BV/104Xh7k2LK2qauY0LQOX7g9NVibMeK73rWw=;
 b=gQZb/La92YosxdMnBtvtiCaPDLn/10cO09WWXGxvpsJIpzabnc6Jkv0dO1m4tYBr/e
 AHHMZV73/Yv21FbsyxdD59xCWk4DetMKpgehU4OzO4aPoOFxMAb9fDqanLgdxp+GMwxn
 6GnhcBwlDC18SlJWpIqi3uN8S9DJDOc07ztaVcpyKJmkWLTy3Aoa2G/I5EUbqEj8Uk4Q
 ZIT+BvIf9fEuSVZ2XtIXWxWaA2cmKn11pP2xz9TbpVDinud76pWp4HCojjt0sc8y/QVt
 m5yV8Cp9AbneSgbYU8HXlcIjnl7//+ddvC5gP/UG8KOBv/kDBc/aFp9f/J2mPD3E7wwy
 ifHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrVG8KDYyGdGKhqCWopZbbdI9mpW+rugB03a9IxkEH2btP0PFs8f4O0TZNfofLNfLcYkizUVJgvA==@nongnu.org
X-Gm-Message-State: AOJu0YwAAsadHmC8sl2txGqQeOhRSChre7dRWDPYp/mtURthULxgDyyk
 eoeM0/XG73qJ3oGZy6KbPpJ8546/Kuw2DMp/QJx8UN+E+loAWxXWVM4eTHka8zye4lAHRmDlZsH
 l
X-Gm-Gg: ASbGncuZTIlrSfRPz62J4VMtxJvEemueqTJdWx12VGEa4DilewLBqzU9LqoqL5SEKHu
 1T/4BphXmXQ7lNKDfBRMpTU5OER0XjFpmZCO2UTmFiVbIgCJiFcS/tMVt14xCbYavoKmMjOa0Gr
 YWZuFlcYMEQYgZlkLnJdYt847aicO6hkQ7IzUxHpIaDOliDLxAd9PgCoxM2rPugl3Y3obeaWTb9
 ATuYB5K3G82wuaugTW8nJIUt09MnwWLFVhVOacfypdS0URXSeZKMmee0Ce+CQaJE/hXmnkDcXnF
 ez7PCU8O6oNZVjgNcNDkI+B1r5l6DHqnb+56mp3MCU9R5VC15LIzbVfQcsdeoJIJaBFkzzVk
X-Received: by 2002:a17:90b:2d83:b0:2ff:64a0:4a58 with SMTP id
 98e67ed59e1d1-2ff7cf14552mr6416174a91.22.1741380028710; 
 Fri, 07 Mar 2025 12:40:28 -0800 (PST)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ff5aa3d3ccsm3270900a91.0.2025.03.07.12.40.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Mar 2025 12:40:28 -0800 (PST)
From: Jason Chien <jason.chien@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-arm@nongnu.org (open list:MCIMX7D SABRE / i...),
 Jason Chien <jason.chien@sifive.com>
Subject: [PATCH 3/4] hw/pci-host/designware: Implement
 PCIIOMMUOps.set_downstream_mr()
Date: Sat,  8 Mar 2025 04:39:36 +0800
Message-ID: <20250307203952.13871-4-jason.chien@sifive.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20250307203952.13871-1-jason.chien@sifive.com>
References: <20250307203952.13871-1-jason.chien@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=jason.chien@sifive.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: KiyR/zn3uoO2

The original DesignWare PCIe host implementation could not connect with
an IOMMU, as both attempted to register PCIIOMMUOps.

This commit resolves the conflict by hooking PCIIOMMUOps.set_downstream_mr()
through designware_pcie_host_set_mr(), allowing the IOMMU to designate the
PCIe host's downstream memory region via pci_setup_iommu_downstream_mr()
without competing for PCIIOMMUOps.

Signed-off-by: Jason Chien <jason.chien@sifive.com>
---
 hw/pci-host/designware.c         | 18 +++++++++++++++---
 include/hw/pci-host/designware.h |  2 ++
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/hw/pci-host/designware.c b/hw/pci-host/designware.c
index c07740bfaa..fafbf90259 100644
--- a/hw/pci-host/designware.c
+++ b/hw/pci-host/designware.c
@@ -404,7 +404,6 @@ static void designware_pcie_root_realize(PCIDevice *dev, Error **errp)
 {
     DesignwarePCIERoot *root = DESIGNWARE_PCIE_ROOT(dev);
     DesignwarePCIEHost *host = designware_pcie_root_to_host(root);
-    MemoryRegion *host_mem = get_system_memory();
     MemoryRegion *address_space = &host->pci.memory;
     PCIBridge *br = PCI_BRIDGE(dev);
     DesignwarePCIEViewport *viewport;
@@ -445,7 +444,7 @@ static void designware_pcie_root_realize(PCIDevice *dev, Error **errp)
         viewport->cr[0]   = DESIGNWARE_PCIE_ATU_TYPE_MEM;
 
         source      = &host->pci.address_space_root;
-        destination = host_mem;
+        destination = &host->bridge_mr;
         direction   = "Inbound";
 
         /*
@@ -470,7 +469,7 @@ static void designware_pcie_root_realize(PCIDevice *dev, Error **errp)
 
         destination = &host->pci.memory;
         direction   = "Outbound";
-        source      = host_mem;
+        source      = get_system_memory();
 
         /*
          * Configure MemoryRegion implementing CPU -> PCI memory
@@ -675,8 +674,16 @@ static AddressSpace *designware_pcie_host_set_iommu(PCIBus *bus, void *opaque,
     return &s->pci.address_space;
 }
 
+static void designware_pcie_host_set_mr(void *opaque, MemoryRegion *mr)
+{
+    DesignwarePCIEHost *s = DESIGNWARE_PCIE_HOST(opaque);
+
+    memory_region_add_subregion_overlap(&s->bridge_mr, 0, mr, INT32_MAX);
+}
+
 static const PCIIOMMUOps designware_iommu_ops = {
     .get_address_space = designware_pcie_host_set_iommu,
+    .set_downstream_mr = designware_pcie_host_set_mr,
 };
 
 static void designware_pcie_host_realize(DeviceState *dev, Error **errp)
@@ -713,6 +720,11 @@ static void designware_pcie_host_realize(DeviceState *dev, Error **errp)
                                      TYPE_DESIGNWARE_PCIE_ROOT_BUS);
     pci->bus->flags |= PCI_BUS_EXTENDED_CONFIG_SPACE;
 
+    memory_region_init(&s->bridge_mr, OBJECT(s),
+                       "pcie-bus-bridge-memory", UINT64_MAX);
+    memory_region_add_subregion(&s->bridge_mr, 0x0, get_system_memory());
+    address_space_init(&s->bridge_as, &s->bridge_mr, "pcie-bus-bridge-space");
+
     memory_region_init(&s->pci.address_space_root,
                        OBJECT(s),
                        "pcie-bus-address-space-root",
diff --git a/include/hw/pci-host/designware.h b/include/hw/pci-host/designware.h
index a35a3bd06c..30f1598dbe 100644
--- a/include/hw/pci-host/designware.h
+++ b/include/hw/pci-host/designware.h
@@ -97,6 +97,8 @@ struct DesignwarePCIEHost {
     } pci;
 
     MemoryRegion mmio;
+    AddressSpace bridge_as;
+    MemoryRegion bridge_mr;
 };
 
 #endif /* DESIGNWARE_H */
-- 
2.43.2

