Received: by 2002:a17:906:1917:b0:98d:b2f5:1316 with SMTP id a23csp2741272eje;
        Wed, 12 Jul 2023 09:40:53 -0700 (PDT)
X-Google-Smtp-Source: APBJJlF+AKYJLAPu5Y/Yyf9EVV7qlTPAoJ2YvV9GX425MgI3n8sLXAXK3FWtHEHVHQYAttXhbwqC
X-Received: by 2002:ac8:5811:0:b0:403:be93:678 with SMTP id g17-20020ac85811000000b00403be930678mr5818996qtg.6.1689180053714;
        Wed, 12 Jul 2023 09:40:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1689180053; cv=none;
        d=google.com; s=arc-20160816;
        b=f3SreksjCVyoqUBbKNMLhiWRm3CrIBQRNvumTQJhu/iEsl6vtlkIfksCyaXDcxI+Qn
         67fBbNYfyo7roXU52vRMniQQPE7CpVAOeyKmGv/xxlx+V8r3B1x0qVlhZxIDzgRZHWhR
         UPw1/4sXiUTC77hqjzNa/2MNH/2KUkjkYMgCO8kOSi4PB9iAG/xk5OOJT5q3QlDu66TC
         Gbz27nfu1qVgugHVVNnf23yJQvop1l6LL7Jf3GyXspJY82ITLa1R5vH3AitpWT7D+5+s
         uS4h5JMVtB8SNBBok9Ah50bdEFBjjpQY2dAQaN79tAU0xqxcrfmSKONqH+5uzi8MPTNj
         4c9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=my6WC56v1NHoMbkaX3PQi+I7N7GynsA+Ik6uIihef78=;
        fh=QsSyH/XJB0d/FRsyBb/wvDqny4l1zc3rGbeONrDGr3Y=;
        b=jQsSVXAlzhTP04EhFHuqgjG1GKm+8+0UZJz3G1f2kr79Y6fX8YW7m/bD7F3bXvu2p0
         9XUrcV7p0VQRvy1sx1/pHkVgQHKqsRD/zyudeH+c+jpkMI+xRRORZr+75nSs6c4ynZHr
         7Dvf82bTd6nCSBZcDddfMslpG2uFm7+I8PYLCZ1Uruanb8gbJyl8g8h7XQC5JhZxrjef
         GacX8ZTflavbAW+5WPHvMfmayKaJRj2Mxxmib2jjvUqPIuWUMVTQAeowbx5FyyGka/Lt
         pqlDW1mqfsJjnG3UO5B0c0alpbQyk4kVtrHeBFRolyRQ7e8eDAdikL8nIqJn6xEDC9VV
         eXcA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=BI7LIKlv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h13-20020ac85e0d000000b00403b41bd7e1si1930733qtx.548.2023.07.12.09.40.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Jul 2023 09:40:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ventanamicro.com header.s=google header.b=BI7LIKlv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qJcsp-0003hl-Oz; Wed, 12 Jul 2023 12:40:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qJcsn-0003gn-44
 for qemu-arm@nongnu.org; Wed, 12 Jul 2023 12:40:05 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sunilvl@ventanamicro.com>)
 id 1qJcsk-0004c9-G9
 for qemu-arm@nongnu.org; Wed, 12 Jul 2023 12:40:04 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1b89114266dso53973555ad.0
 for <qemu-arm@nongnu.org>; Wed, 12 Jul 2023 09:40:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google; t=1689180001; x=1691772001;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=my6WC56v1NHoMbkaX3PQi+I7N7GynsA+Ik6uIihef78=;
 b=BI7LIKlv/hre/FD7W1RLXqzzMMJlEa5d1oNvWH9OiHAsEGIoL0zWWKZ+OCePMkSfBG
 J8frAkEJtaMTJFja1w/hyPYGlKeP6QUWVLHDRcXVom2bTYzDSc3xfpRKiX+JPN5YdkMH
 pgOLDlwAtfj09mIwZrhJQtCZQ4KN3N40a82duYDcv5DIs6NKx9GoUS29vgawaMUG1yYz
 dARyE7y9MvMvWHnzl24xiuFoHSmewP0JmKdCOFEDTOZkd+w0WuswE2ewxd5deDsKB/t8
 rNHXOrcTebScCH7ioS4KitHHPKlnHwnjP8tOQ343FwHg0Sxm9WfM+ivUJunK4A07PS0Q
 46Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689180001; x=1691772001;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=my6WC56v1NHoMbkaX3PQi+I7N7GynsA+Ik6uIihef78=;
 b=RFrD6e7nfUp7LBgu3zP/SL/ZwdAjODLLEabtBzynA/TC+MT2JMOzyvzWpe1vDch4Xg
 FqlUapfi/rfVmNkr4D56WrfAeZxkC5w2KBmYqsm94fdcwht+/UtHO7W4KbuNQPWj/dPw
 akzRGRF8Roicx+q2U6kmBIp0LLX1K9BDGEUFAi384aauCfEEU9aTX68yloYq//slth0t
 3EX+bpJ6gb89aI7DasJ8496X8Jx/sNO7FGhHB0LAXlLse6pJq1/Z98sgLhIcKQx07Vcq
 V3MiRrIdoMW7H5z+aWORLDFg65KkzXGP6cQvVubbx146hvI4gsgiQBt4K6wOgQTs3jf8
 y1uQ==
X-Gm-Message-State: ABy/qLbUIahjoqIDK1bbCRaxlmVRWZbrvvTR8rc3yAP4GR6+5kWqitzM
 hQ4/8lYVuGFuEFwX6YyXYB09Gg==
X-Received: by 2002:a17:902:788c:b0:1ae:8892:7d27 with SMTP id
 q12-20020a170902788c00b001ae88927d27mr10527926pll.42.1689180000942; 
 Wed, 12 Jul 2023 09:40:00 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.190.25])
 by smtp.gmail.com with ESMTPSA id
 a18-20020a1709027d9200b001ac7f583f72sm4172824plm.209.2023.07.12.09.39.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jul 2023 09:40:00 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org,
	qemu-riscv@nongnu.org
Cc: "Michael S . Tsirkin" <mst@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <anisinha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Andrew Jones <ajones@ventanamicro.com>,
 Anup Patel <apatel@ventanamicro.com>, Sunil V L <sunilvl@ventanamicro.com>
Subject: [PATCH 02/10] hw/riscv: virt: Add PCI bus reference in RISCVVirtState
Date: Wed, 12 Jul 2023 22:09:35 +0530
Message-Id: <20230712163943.98994-3-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712163943.98994-1-sunilvl@ventanamicro.com>
References: <20230712163943.98994-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=sunilvl@ventanamicro.com; helo=mail-pl1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: d5MswJDDPhdT

The PCI bus information is needed in RISCVVirtState so that other
files like virt-acpi-build.c can make use of it. Add new field in
RISCVVirtState so that ACPI code can use it.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 hw/riscv/virt.c         | 6 ++++--
 include/hw/riscv/virt.h | 1 +
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index d90286dc46..46d3341113 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -1073,7 +1073,8 @@ static inline DeviceState *gpex_pcie_init(MemoryRegion *sys_mem,
                                           hwaddr high_mmio_base,
                                           hwaddr high_mmio_size,
                                           hwaddr pio_base,
-                                          DeviceState *irqchip)
+                                          DeviceState *irqchip,
+                                          RISCVVirtState *s)
 {
     DeviceState *dev;
     MemoryRegion *ecam_alias, *ecam_reg;
@@ -1113,6 +1114,7 @@ static inline DeviceState *gpex_pcie_init(MemoryRegion *sys_mem,
         gpex_set_irq_num(GPEX_HOST(dev), i, PCIE_IRQ + i);
     }
 
+    s->bus = PCI_HOST_BRIDGE(dev)->bus;
     return dev;
 }
 
@@ -1502,7 +1504,7 @@ static void virt_machine_init(MachineState *machine)
                    virt_high_pcie_memmap.base,
                    virt_high_pcie_memmap.size,
                    memmap[VIRT_PCIE_PIO].base,
-                   pcie_irqchip);
+                   pcie_irqchip, s);
 
     create_platform_bus(s, mmio_irqchip);
 
diff --git a/include/hw/riscv/virt.h b/include/hw/riscv/virt.h
index e5c474b26e..4ef1f660ab 100644
--- a/include/hw/riscv/virt.h
+++ b/include/hw/riscv/virt.h
@@ -60,6 +60,7 @@ struct RISCVVirtState {
     char *oem_table_id;
     OnOffAuto acpi;
     const MemMapEntry *memmap;
+    PCIBus *bus;
 };
 
 enum {
-- 
2.39.2

