Received: by 2002:a17:505:57c2:b0:1be9:327d:8ee3 with SMTP id yd2csp1872277njb;
        Sun, 15 Dec 2024 16:51:29 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUhgAuEmuuPhuE9f6pxUQjewwa/mj6TgpplwOp3Ue8vtznpDXKwvpCU+3nSz6Najg11KyZrRfsl55LRmA==@linaro.org
X-Google-Smtp-Source: AGHT+IGydGVDxoCzFjwkgEllCxIytLskvLRtVuypJzzfbGf9/Q5fzLzVoUGbMC+F+LV9y8JXFNa6
X-Received: by 2002:a05:622a:1a0b:b0:467:5d90:12a0 with SMTP id d75a77b69052e-467a57a99d8mr184152141cf.28.1734310289412;
        Sun, 15 Dec 2024 16:51:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734310289; cv=none;
        d=google.com; s=arc-20240605;
        b=Fa+VAU3A8le9ni6sJZDfeE1sZCv5U7zN7IWMDaNZO8PlvC+UXBlV46BVVIWSPAR4XD
         4EdRwhmDzrwwImX3e9ms+bFL89H9kSN8Xy1iV/phh4ZTaGm8lHjik7xLO78+ZuyCgOQz
         SxQKh0RggSyZ4Typ6XtRmWUzuOTE8T7CVASjfeuQ+ISqEyqx7fXPTLJidNa0Pdx7RfS9
         wBBqw0ymP300ESjkPNkbQZbFfxzvQBcIW8RMV3T9aBwPjwBkto+9DBEKZvh7SP+GoNYm
         3jG8jAgXZ4Ifi+ja8ztcZUmKyYRAlTgPlblCLXyf22m7OnE3vapmPT9QNFAabfhz1+Qa
         0WOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=gMz5z1qtJxQUJErlLKkRHU3+t7ygQhiQ+P8RsAR7bug=;
        fh=jnHD3VsLlvFTejaF1eYrcb+kYoV3UhPL70uTnppbGNA=;
        b=ccfaMoFefraQH1vQqtb7u1B2w1V8nS8aWyOqnOt+iad3kERRQo6avy0RIWuefO8GYf
         +472qioPXWMAb7MnXhRmGNM5w3dfRuU3ySkpF4dtf3cEkTuHd7lCFTR6GyIshgdeVYGS
         On11uWDxkjImvMymOqyMcdKDzKD9ydy+RgfhNUTROZ6K8yf+Cxb5Hif9EFLxA+vWOoV7
         oq4CP5o9LNuA7MwrPHhfuPTTfpLm0GEjX4S6OuinpBVvc5vaOAnWD9Blc0VGwFe7Vncp
         Dffsk7gg2y7PfslznXfzgT4lJ3oyWlV4pMCTGGj7SYUprZnfEc3C4+DjPwP/kFCzpBRJ
         RjhA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=IxL8Ja5X;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-467b2f16644si57458761cf.593.2024.12.15.16.51.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 15 Dec 2024 16:51:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@sifive.com header.s=google header.b=IxL8Ja5X;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=sifive.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tMzJG-0001Jk-HZ; Sun, 15 Dec 2024 19:50:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1tMzJA-0001IF-SQ
 for qemu-devel@nongnu.org; Sun, 15 Dec 2024 19:50:02 -0500
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jason.chien@sifive.com>)
 id 1tMzJ6-000750-IY
 for qemu-devel@nongnu.org; Sun, 15 Dec 2024 19:49:59 -0500
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-7fbd9be84bdso3301163a12.1
 for <qemu-devel@nongnu.org>; Sun, 15 Dec 2024 16:49:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sifive.com; s=google; t=1734310193; x=1734914993; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gMz5z1qtJxQUJErlLKkRHU3+t7ygQhiQ+P8RsAR7bug=;
 b=IxL8Ja5XX3u+LXmSva3zRNf2X3uv19ueFIxz/Ns72fh558qe5zcWpK86Xu8fu88vox
 OIBorXodUf/vwsAhpFHstBpXHdiMK0qs9E31CoaI7jzpr93d6/GhWKoVbjYp2P/pxIJT
 TrpSJaQz1dVUaLZJneUUPnqZ9GK+A8OFCvkdgNRF/J70p+VgdtUovLLL3PY35LkmQlc0
 ohRZRi9ybDCo0t7NPpSPQN4uhzVh5wZY4JrJEvkQkWi0ftMa03eH3PQ0H82VMSVlRC+o
 6P53oTLmqdSJKdGtnB0k3tRtqBbIc2wAFur/iV/wkwrVbQhKG3JMoC9MMaxX+nvIR8dc
 KkPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734310193; x=1734914993;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gMz5z1qtJxQUJErlLKkRHU3+t7ygQhiQ+P8RsAR7bug=;
 b=epv0TGsjKbr4LOu85L8mnkQ5Jm7Ys1cSgnYX0p4UdpRTT6JGnC/9hzNx8/tzJXCi5Y
 5hMalj6itkA6ubsTzZ2fkh2sSE8VzTYylpppXg0kj+3n3Xy1GdxbL5viGe/SwTjoYyoN
 vgwQpXTuxl1nmqZfIleJPqzu+wplpVvv4cX5yfgseBDfrf1cWgUq7D+epTBbA24sPHGs
 Oz9IyDHeir3WJSqoCU8x1tT10p5/kMSs3TIV6qxuwtYASAZ54tPesMJuTI26/ANjdANE
 wGQiCR0CvqdYxaNVKkhGWRWx4kEa68s+TeDgTGy9gY201E88lCZAGLJgBMv51e5lPzbl
 3CAw==
X-Gm-Message-State: AOJu0YwX1nJNO8n4V0I0bBnKeWdBM4IZG0W6Dz+Mss1VQlEfDSh2UpmP
 LERVJIY677bfkwfCGvJB3luutxC5LtC4jg3sEDZ3iE90ySWgFBVAQvdUt+/1T6BOL5lYwqUXUH5
 izWagPAon0Sz2Ig0ZD7M7W9XzL8xb1DtFNq5oxzGMUAqXecc1wiIVffclA2d+r2nmc+eraGGK5Q
 Xdd+5D4G/ZuYwAsWBElLJqilIAAIgDhyosC3/i8Us4iUSWuOE=
X-Gm-Gg: ASbGnct0ElNeRsVpwBGmzgvauXfarOMFYtMTUZVYnM6HjEEgNi6B52tiDQyjn/0YYKY
 6OXp1tvJLaZ4QbrkK0oTD3glhzv1cWN+fKJ6gi1Pr/fHdFPLwzIByb0a5aOAEDmqBtDnZwN/xJ1
 qskyOtp9cTMiUPxnOrQ/MyZeHRuqeaPjv6xbJe2nRuV1uUluUMUD5Q479Q45lWrnW/S1GrDO0ew
 5Jx/AM9wd9jorHO8Yl7Z4Rtirm2Gw+8wf4dLCdcSQIsoHu+DTjUOx6wokq0RHRHC814kgfWoqdz
 bIUroEVY
X-Received: by 2002:a05:6a20:9143:b0:1e1:9f77:da92 with SMTP id
 adf61e73a8af0-1e1dfde6d4dmr14073191637.33.1734310193247; 
 Sun, 15 Dec 2024 16:49:53 -0800 (PST)
Received: from hsinchu16.internal.sifive.com ([210.176.154.34])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-801d5addbf9sm3059586a12.47.2024.12.15.16.49.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Dec 2024 16:49:52 -0800 (PST)
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
Subject: [RFC PATCH 3/6] hw/pci-host: Enable DW PCIe host to send memory
 transactions over specific mr
Date: Mon, 16 Dec 2024 08:48:54 +0800
Message-ID: <20241216004857.9367-4-jason.chien@sifive.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20241216004857.9367-1-jason.chien@sifive.com>
References: <20241216004857.9367-1-jason.chien@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=jason.chien@sifive.com; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: RQTDailu5DnY

Current Designware PCIe host cannot connect to an IOMMU, since it has
registered PCIIOMMUOps.get_address_space() and an IOMMU cannot overwrite
PCIIOMMUOps.get_address_space() without breaking the PCIe translation
rules.

This commit implements designware_pcie_host_set_mem(), which is used to
register PCIIOMMUOps.set_memory_region(), so an IOMMU can designate the
downstream memory region for the PCIe devices.

Signed-off-by: Jason Chien <jason.chien@sifive.com>
---
 hw/pci-host/designware.c         | 18 +++++++++++++++---
 include/hw/pci-host/designware.h |  2 ++
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/hw/pci-host/designware.c b/hw/pci-host/designware.c
index c3fc37b904..8afe447562 100644
--- a/hw/pci-host/designware.c
+++ b/hw/pci-host/designware.c
@@ -395,7 +395,6 @@ static void designware_pcie_root_realize(PCIDevice *dev, Error **errp)
 {
     DesignwarePCIERoot *root = DESIGNWARE_PCIE_ROOT(dev);
     DesignwarePCIEHost *host = designware_pcie_root_to_host(root);
-    MemoryRegion *host_mem = get_system_memory();
     MemoryRegion *address_space = &host->pci.memory;
     PCIBridge *br = PCI_BRIDGE(dev);
     DesignwarePCIEViewport *viewport;
@@ -436,7 +435,7 @@ static void designware_pcie_root_realize(PCIDevice *dev, Error **errp)
         viewport->cr[0]   = DESIGNWARE_PCIE_ATU_TYPE_MEM;
 
         source      = &host->pci.address_space_root;
-        destination = host_mem;
+        destination = &host->bridge_mr;
         direction   = "Inbound";
 
         /*
@@ -461,7 +460,7 @@ static void designware_pcie_root_realize(PCIDevice *dev, Error **errp)
 
         destination = &host->pci.memory;
         direction   = "Outbound";
-        source      = host_mem;
+        source      = get_system_memory();
 
         /*
          * Configure MemoryRegion implementing CPU -> PCI memory
@@ -666,8 +665,16 @@ static AddressSpace *designware_pcie_host_set_iommu(PCIBus *bus, void *opaque,
     return &s->pci.address_space;
 }
 
+void designware_pcie_host_set_mem(void *opaque, MemoryRegion *mr)
+{
+    DesignwarePCIEHost *s = DESIGNWARE_PCIE_HOST(opaque);
+
+    memory_region_add_subregion_overlap(&s->bridge_mr, 0, mr, INT32_MAX);
+}
+
 static const PCIIOMMUOps designware_iommu_ops = {
     .get_address_space = designware_pcie_host_set_iommu,
+    .set_memory_region = designware_pcie_host_set_mem,
 };
 
 static void designware_pcie_host_realize(DeviceState *dev, Error **errp)
@@ -703,6 +710,11 @@ static void designware_pcie_host_realize(DeviceState *dev, Error **errp)
                                      TYPE_PCIE_BUS);
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
index c484e377a8..9562a4ff96 100644
--- a/include/hw/pci-host/designware.h
+++ b/include/hw/pci-host/designware.h
@@ -89,6 +89,8 @@ struct DesignwarePCIEHost {
     } pci;
 
     MemoryRegion mmio;
+    AddressSpace bridge_as;
+    MemoryRegion bridge_mr;
 };
 
 #endif /* DESIGNWARE_H */
-- 
2.43.2

