Received: by 2002:a17:505:57c2:b0:1be9:327d:8ee3 with SMTP id yd2csp1871939njb;
        Sun, 15 Dec 2024 16:50:19 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUx40Wh8Xa2GGbVG4BLoR2BV+df+z3Y75yB1OwXe+bH0G+BC45mgYTHmD8v3MnKm5gxLZUJx1Uc51MXwA==@linaro.org
X-Google-Smtp-Source: AGHT+IEspyLEEq5Fj8CIDZt6yO0LPrhqf8m2xy3TGq+x5ZRSnVThqNPjGqUShx+7WcAezvc9QFzO
X-Received: by 2002:a05:620a:27d2:b0:7b6:6a3b:539b with SMTP id af79cd13be357-7b6fbee81abmr1953742685a.17.1734310219382;
        Sun, 15 Dec 2024 16:50:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734310219; cv=none;
        d=google.com; s=arc-20240605;
        b=k2xyHpyh/S38fMnQjtzjVVu+a9x8t+HilBGlhcnS9ieuKnyy7hn97Dp205tJaEPoff
         9HhDNdIDHd+5/6+CUR16K0+gKmM8yWEeP6bGgOtokI2dnhkSra6EH3oJkDqrvnGxPizv
         B3jqI288vNbie0D7aN8bAh+cwmsgN862lkYTEZGegJP/1FeB4AYUIKY0QO4ug4q+uin0
         VRyHjrW0CQfpFKVa4A4DfbyYsZo1lS9Lm6YsV5S0NFaRQKfXDIubazLo2ZbHOPJ9ENSN
         2Dsc8M1vk9lv/AXzHlcYCgKrJu1D2Um/Qs2dWRdw0WYrXBGy1+zZRM+nckXebSZQlOuz
         3+ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=VUe/CaMF1o3K5iHx+qDApgHKPoUWwGBc8t+UaT1YHyc=;
        fh=tgClJXLELmrjayatrZPxDblVKSnr6wuca+d9KbSN/eM=;
        b=Q2KytnLZ+6tup8w8U4nDLxC2JFlTC9Q4F/7SGonopMue1rrq4+dnBDVeVUzwlp0jtc
         Y1ptBu/UvLTY/MDeDq3Vb9BAftJxu6H0GsKyEsXg98m665AHrMPm0ecbXPWcW2+iyKk8
         y2Dz9LzLWp3j9D8FybyeA/Dqjar69YALG8RE+Ux3+xC6nNndeyqC3ojEhpc8QvNKaAWB
         nNvVIZY94V9tbmC1x7+yWiiq2hbXrO5bRWjxG3HpwnnDMLE2GLh7sJVAOAu84vtRWrMa
         psFg9gbD5d7vNFAHtuJbyroI01lx5h1SEXdBqcpxT43wJfmNpcl5XHXPNqAajWEjlgy6
         XAXg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=asvH60sv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b7048e4a3bsi598690285a.555.2024.12.15.16.50.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 15 Dec 2024 16:50:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=asvH60sv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tMzJE-0001IC-Ay; Sun, 15 Dec 2024 19:50:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1tMzJ8-0001HA-Fr
 for qemu-arm@nongnu.org; Sun, 15 Dec 2024 19:49:58 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1tMzIy-00073k-2C
 for qemu-arm@nongnu.org; Sun, 15 Dec 2024 19:49:56 -0500
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-728eccf836bso2933106b3a.1
 for <qemu-arm@nongnu.org>; Sun, 15 Dec 2024 16:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1734310187; x=1734914987; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VUe/CaMF1o3K5iHx+qDApgHKPoUWwGBc8t+UaT1YHyc=;
 b=asvH60svarZ7u3X3/heC9aA3cbPRY750IK32BoAJXakbmgbSdAd8D3htha1iQlx+wb
 9fO5gCdVGamTIcN07QYgw6sQm7P0I8Anayvzw0hgsJBoXc/DC/YHzgpoDvW+UPXAWf1U
 USas5Gcf4chngOqEC/4KRMdWyrcV8UfO516BJXMaOmwRBCl7yzK20AkDcrxUm8QzbO3r
 /xjaXzTemjOcpAtlrnWEtDnhH6hBBNjonKiqn7ucYMNBAnsYgSV7nVTEYwjdfzGc9UCL
 fHRSH7FaNJCiATx+qSnhXCsfI/7bI1A4RMp7286G18BCLuiQ8R8ka/iMDJ6MwlMpkHKQ
 Y9Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734310187; x=1734914987;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VUe/CaMF1o3K5iHx+qDApgHKPoUWwGBc8t+UaT1YHyc=;
 b=M6uMjHa5ij18hlOoMmyuTYUeNQDVs77wgE6GrBdFPofbjyX3qDPfyAyTrVR23sk/+8
 cy5VduqkvI2IllEnI5L1fNQey3ef5yJX+cSw9KCdxjuLbfSRYo9hJopv6wnmym2rkgYh
 rRr+VpVZeAeCOA4hPrcySdn7E9y9B9ksQ3S51OWl+mmI3U0CSIcLlMhOMym4c3Iq5deA
 W/I9hub+6+dPfF4MQOsNWVtPCH7CPJGDZkiVg40yR4ZeqhbilcUjR+Vl4NJiJzRy0nlY
 q3xmeWZZQ4vJ3G4s/MXfYuVUzt8NK2ns8o2vZi0ZP9AXsJcKWf3RMkYG+Kj4gxrnheu7
 ikkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgeopnlvutUNPpS0AQ5WUaYkmTPaQ5GSNCP9rli+4URFglv6v2eUBgSHsu0Bh7vMtUcAS+B2G8dw==@nongnu.org
X-Gm-Message-State: AOJu0YzEdbOuz7ZwNTr7Mn+73a4EDeMRhttXXca2GqPDikqB7JDUEyrQ
 kdPMYP8CHJRV+ueBtoqHbrBhp49GGyUqBk9mQpERhMaJ8LYGLOSErDvBlh/DEtY=
X-Gm-Gg: ASbGncvs860HWqx9Faq35kNhIs/u2SfNt/kaX6tloGif+kzt/zQ/3gxIdypBpeNcOsu
 zUxRF04jt8G3kqDVtPUszkfQpXsgdPetGEqNLfwVf4Rt3OwixDCu7UlyoTd/ZZ+t8fyU2ZK5rL2
 31ivVhCGd/MlV//zTjjmIUwcy8Ao6r3AvIcx5Po7Jjb/0FdLKboAfcPBOYi/gBEur1WnlpWRtuN
 2V1ka8RMs+3YauWEEceKDKDQ7RLiO++4lB5qMjHVCrM5UJskQ/a8lJOBsF5TZdJJmwgChwMS/U8
 cJZudLeK
X-Received: by 2002:a05:6a20:728f:b0:1db:ec0f:5cf4 with SMTP id
 adf61e73a8af0-1e1dfe322a0mr16052201637.39.1734310186830; 
 Sun, 15 Dec 2024 16:49:46 -0800 (PST)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-801d5addbf9sm3059586a12.47.2024.12.15.16.49.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Dec 2024 16:49:46 -0800 (PST)
From: Jason Chien <jason.chien@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bmeng.cn@gmail.com>,
 Weiwei Li <liwei1518@gmail.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 qemu-arm@nongnu.org (open list:MCIMX7D SABRE / i...),
 Jason Chien <jason.chien@sifive.com>
Subject: [RFC PATCH 2/6] hw/pci: Add an API to set the downstream memory
 region of a PCI bus
Date: Mon, 16 Dec 2024 08:48:53 +0800
Message-ID: <20241216004857.9367-3-jason.chien@sifive.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20241216004857.9367-1-jason.chien@sifive.com>
References: <20241216004857.9367-1-jason.chien@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=jason.chien@sifive.com; helo=mail-pf1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: rAbBc0E15Hqy

pci_setup_iommu_downstream_mem() invokes PCIIOMMUOps.set_memory_region()
to set the downstream memroy region of a PCI bus.

Signed-off-by: Jason Chien <jason.chien@sifive.com>
---
 hw/pci/pci.c         | 6 ++++++
 include/hw/pci/pci.h | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 1416ae202c..8703d75ac3 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -2811,6 +2811,12 @@ void pci_setup_iommu(PCIBus *bus, const PCIIOMMUOps *ops, void *opaque)
     bus->iommu_opaque = opaque;
 }
 
+void pci_setup_iommu_downstream_mem(PCIBus *bus, MemoryRegion *mr)
+{
+    assert(bus->iommu_ops && bus->iommu_ops->set_memory_region);
+    bus->iommu_ops->set_memory_region(bus->iommu_opaque, mr);
+}
+
 static void pci_dev_get_w64(PCIBus *b, PCIDevice *dev, void *opaque)
 {
     Range *range = opaque;
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index cb3039bce8..9ae2cc61f1 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -450,6 +450,13 @@ void pci_device_unset_iommu_device(PCIDevice *dev);
  * @opaque: passed to callbacks of the @ops structure.
  */
 void pci_setup_iommu(PCIBus *bus, const PCIIOMMUOps *ops, void *opaque);
+/**
+ * pci_setup_iommu_downstream_mem: Designate a memory region for a PCIBus
+ *
+ * @bus: the #PCIBus being updated.
+ * @mr: the designated memory region.
+ */
+void pci_setup_iommu_downstream_mem(PCIBus *bus, MemoryRegion *mr);
 
 pcibus_t pci_bar_address(PCIDevice *d,
                          int reg, uint8_t type, pcibus_t size);
-- 
2.43.2

