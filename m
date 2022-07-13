Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp368663lfp;
        Wed, 13 Jul 2022 13:46:55 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ue/tqamsAol2tLP76AjatVaho3zyE9bV34SpLgbp9UL0r6eI3zNZ+Vgxev53Mj3+GELIlt
X-Received: by 2002:a05:622a:251:b0:31e:c37b:9c9a with SMTP id c17-20020a05622a025100b0031ec37b9c9amr5031179qtx.564.1657745215702;
        Wed, 13 Jul 2022 13:46:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657745215; cv=none;
        d=google.com; s=arc-20160816;
        b=f3mrboNR30DhQBP6gbE2pXYHuLIYJjypRk6fke4ZFCXdhSfA6S/FaHDu/fnVNALZNg
         NnBIG6Kts3bP59/ZBxNyu26iL35idkYub+rm0WLrjs/t1TMalLUNNLt1DLCOPNIt+hcs
         j/DbdcqcqL5BmUmXW8Sbs7nW6Bm3+2C4YUEbAWXM9PeDvvvskziX1q5J806TkPtBGmPZ
         o9Ne5RffJILxiCiUb7BbPOa5VWP3ii9ISvdFWhha40kMsphbzuseZuiTV8uApoROBySE
         ZPMu0sBRiUO91uEnjjbl89c9uaUGXL3Pqpu1Ivujx/WkBm2qQOuH2Nieho9zxAgUUPi/
         +8bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=H+4ZPRfrNSKyRtVrvUfMzhAWGzYPYgw3H5OWlnWdnhI=;
        b=KKpQmzP/rU26SS7xQYSrftZ8oPiG8mUB3th7oq7FlaYQfO+mILioOYSzz1FwK6k/kB
         ojq95cI59/OlzBEJGYNiad3rFf7NanayCaDrOTjlMwLoDXYRTijiZHaUHXsQzB5pfK+E
         QO2Tpc+lsRkyAh7ZAi09stxyQ9ztWDutHhxIhBpHqSv0W5yVMQf1v3tnGIZdYhk6mMqr
         uHpZiPbBadnEdJV4kNbjQiCIDnQ0le9v/kt1zVYlMIQL55zw25W+nVTc2ua+vtM9fywu
         FpROS7f1RXzJIPltUYFAXCgdZYON4TZCYSSgvsWAhjRMmnGo9vecCjGofQzC1cImN3DD
         Y2zQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s10-20020a05620a254a00b006a69fc0f760si11468695qko.704.2022.07.13.13.46.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Jul 2022 13:46:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oBjG3-0005r9-08
	for alex.bennee@linaro.org; Wed, 13 Jul 2022 16:46:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@codethink.co.uk>)
 id 1oBfwJ-0006ZZ-P1; Wed, 13 Jul 2022 13:14:19 -0400
Received: from imap4.hz.codethink.co.uk ([188.40.203.114]:60716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@codethink.co.uk>)
 id 1oBfwI-0003Aa-6c; Wed, 13 Jul 2022 13:14:19 -0400
Received: from cpc152649-stkp13-2-0-cust121.10-2.cable.virginm.net
 ([86.15.83.122] helo=rainbowdash)
 by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
 id 1oBfdU-003M8r-1K; Wed, 13 Jul 2022 17:54:51 +0100
Received: from ben by rainbowdash with local (Exim 4.96)
 (envelope-from <ben@rainbowdash>) id 1oBfdS-0009l5-22;
 Wed, 13 Jul 2022 17:54:50 +0100
From: Ben Dooks <ben.dooks@sifive.com>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Jude Onyenegecha <jude.onyenegecha@sifive.com>,
 Sudip Mukherjee <sudip.mukherjee@sifive.com>,
 William Salmon <william.salmon@sifive.com>,
 Adnan Chowdhury <adnan.chowdhury@sifive.com>,
 Ben Dooks <ben.dooks@sifive.com>
Subject: [PATCH 7/7] pci: designware: add initial tracing events
Date: Wed, 13 Jul 2022 17:54:49 +0100
Message-Id: <20220713165449.37433-8-ben.dooks@sifive.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220713165449.37433-1-ben.dooks@sifive.com>
References: <20220713165449.37433-1-ben.dooks@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=188.40.203.114; envelope-from=ben@codethink.co.uk;
 helo=imap4.hz.codethink.co.uk
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 13 Jul 2022 16:45:07 -0400
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YHq57DpTsa7Z

Add a couple of tracing events for internal driver updates

Signed-off-by: Ben Dooks <ben.dooks@sifive.com>
---
 hw/pci-host/designware.c | 4 ++++
 hw/pci-host/trace-events | 4 ++++
 2 files changed, 8 insertions(+)

diff --git a/hw/pci-host/designware.c b/hw/pci-host/designware.c
index a47ae48071..489959513f 100644
--- a/hw/pci-host/designware.c
+++ b/hw/pci-host/designware.c
@@ -30,6 +30,7 @@
 #include "migration/vmstate.h"
 #include "hw/irq.h"
 #include "hw/pci-host/designware.h"
+#include "trace.h"
 
 #define DESIGNWARE_PCIE_PORT_LINK_CONTROL          0x710
 #define DESIGNWARE_PCIE_PHY_DEBUG_R1               0x72C
@@ -112,6 +113,7 @@ static void designware_pcie_root_update_msi_mapping(DesignwarePCIERoot *root)
     const uint64_t base = root->msi.base;
     const bool enable   = root->msi.intr[0].enable;
 
+    trace_dw_pcie_msi_update(base, enable);
     memory_region_set_address(mem, base);
     memory_region_set_enabled(mem, enable);
 }
@@ -279,6 +281,8 @@ static void designware_pcie_update_viewport(DesignwarePCIERoot *root,
     uint32_t cr0          = viewport->cr[0];
     MemoryRegion *current, *other;
 
+    trace_dw_pcie_viewport_update(target, base, size, cr0, enabled);
+
     if ((cr0 & 0xFF) == DESIGNWARE_PCIE_ATU_TYPE_MEM) {
         current = &viewport->mem;
         other   = &viewport->cfg;
diff --git a/hw/pci-host/trace-events b/hw/pci-host/trace-events
index 437e66ff50..6b064d3c74 100644
--- a/hw/pci-host/trace-events
+++ b/hw/pci-host/trace-events
@@ -3,6 +3,10 @@
 # bonito.c
 bonito_spciconf_small_access(uint64_t addr, unsigned size) "PCI config address is smaller then 32-bit, addr: 0x%"PRIx64", size: %u"
 
+# designware.c
+dw_pcie_msi_update(uint64_t base, int enable) "base 0x%" PRIx64 " enable %d"
+dw_pcie_viewport_update(uint64_t target, uint64_t base, uint64_t limit, uint32_t cr0, int enabled) "target 0x%" PRIx64 " base 0x%" PRIx64 " limit 0x%" PRIx64 " cr0 0x%" PRIx32 " enabled %d"
+
 # grackle.c
 grackle_set_irq(int irq_num, int level) "set_irq num %d level %d"
 
-- 
2.35.1

