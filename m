Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp741345ejb;
        Thu, 15 Feb 2024 10:06:38 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX1UTFiMxWghRfJxtAxDbDh5NCbqSvkPd0D9cA6LWROeCaIAAdAQdObdvdWjXm2kxtcVYvwXcbcuJIqLcfQs+VKuq+BtTmV
X-Google-Smtp-Source: AGHT+IFXBNii22PPhzMF/+hnJsmtqgSAlAwnn7rneo/hiEdfk8ere7UjWVFao7BCNfEjlgsCu07J
X-Received: by 2002:a9d:798d:0:b0:6e2:de29:f273 with SMTP id h13-20020a9d798d000000b006e2de29f273mr2593645otm.35.1708020398395;
        Thu, 15 Feb 2024 10:06:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708020398; cv=none;
        d=google.com; s=arc-20160816;
        b=utz/iqzIr1kl/XJhRM0Wtr3QHL8DnOB5yzEZVHyXzWiXUNDZGnMGn+1Brpaf6AwzET
         qB9ZvkVERuDuWpNSbS/Wh27ss72hlMdzwLk1HZjgFccYmPZU4bvN7DAcflls9TMQqv54
         VV9N0o8jYLD1dF2B3LlQlabjzNWjNJS8EHBWs8HACKP2TWSjMgnC6wy2JoLzCNKlv60T
         OWDBNLx40rxniUDbMbBaQn6xhg5seDuJ+etfXWiVLVD2jWJNHhne418OAtsto2Ypdzjm
         9CDBLYCDqYb6+TK13romZ4h5m2YNC9rNBNEOPH6i6hhk+eLbDoL0EFWJpW7AxTfmcphA
         wn6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=pbWJfttw2i/6nkY9oTBvXTNqjF14WXnlPS1ndEBwSeA=;
        fh=zQv3rct1PRzstrQSYTKpwoCC8NgtiTmMuIZHxiD8twM=;
        b=Tdmckmao/N/EBR51213NHxmqif8eP546lyyUAXhvDCnTLrQViXsedP5pWg2XI7DATy
         JKIJtumFPw6Kge0gIGWoA2EAmN1XowZm0tA9DxkQsxsC4oef4VJOdqVFSVr4/MkYr52o
         SGPb0/DLT62DpKRW6KvXTfkVhuz0S986b/VbopIUi5JDWrlXI6l7xSMSD+9ieW06t5ds
         tgyZxovEyr+ZFBHmPPzwIbTGpRoIlwk48ixl5O+cIBQg4n7+dxprRF9idO4SYe/eAKUK
         4kQZjctDi+dC82Gd7B4oE1Q2VzccNTNHbt9h8LWsUwHabBknAlZ8+lHdvSuKA8MscD3E
         1u0g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EO4AJs4J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c22-20020a0561023c9600b00469a879a0f6si434969vsv.152.2024.02.15.10.06.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Feb 2024 10:06:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=EO4AJs4J;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rag6A-0004Qy-7B; Thu, 15 Feb 2024 13:04:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rag5d-0003UE-Rd
 for qemu-arm@nongnu.org; Thu, 15 Feb 2024 13:04:08 -0500
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rag5b-0003Gf-LJ
 for qemu-arm@nongnu.org; Thu, 15 Feb 2024 13:04:05 -0500
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-50eac018059so1661552e87.0
 for <qemu-arm@nongnu.org>; Thu, 15 Feb 2024 10:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708020242; x=1708625042; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pbWJfttw2i/6nkY9oTBvXTNqjF14WXnlPS1ndEBwSeA=;
 b=EO4AJs4JF5F4yqS/JhrgfEDmec71NJscSPIKghS9QnP6mQVHM8WtCHr47JqhexT7Kg
 88qs9tBwmC3B7KijzRmhVct4LlCm3HmqZ9H/05QXM2QEC1x5CHCcVJw1zfMG4NKPo6Q6
 7XmWLleScphA5EHN81ctwB6TXAsAS0XqJvAYnuREyC7ypPNiPzjMhErGzSu9mogarwxi
 qPB1kkE++MyAyTYx+H69FIy7T9VuYfdGK3aNA1cGoPtbhsi6pzrR82k5nXiOyp3YGXWb
 CmRN+a8LFrxBVL4+ITf5Gbsec+2dXyAIHQreEzDMMk8lJvQzVMJ+6U1XdhDxs1OgpAUA
 wivQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708020242; x=1708625042;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pbWJfttw2i/6nkY9oTBvXTNqjF14WXnlPS1ndEBwSeA=;
 b=eP70KMiw0CtoBUrmSWGhykjwlfmeZwW/Cy7ML3Q0zjYoy/2AhngxGfQApSeNRa64aR
 +E7PQq7tDnQ1YQcIG/9ipwFmWT0zrDtmQhvFnAO/T1DiZQ3JKiEhObQG/DJJQ5VC04ya
 Trak1f5oMMclpvfvGt4eNLW68SthpV1ZxJce45/uOfPcYCju6WAGT3nFQJnBUXQebnEU
 lv7gBJfbnhxzrTPpA/ODaCH0V5lotuIlK4hwCXP/uJbMcc4RZnQiDyYZ4/1T8HqdLCUv
 cC7nEXKcMdOEi/ajZ0cMXmYH8ICrB4BlK2wBicb94rY4/On5lyRAAWzGjrhkr4Gd2PFq
 8WFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5U90IPkLYxZ1kD+w7d7zRqirX+0oquq+ktxCMQtO/LIQwYlKLA5P37bhZl33Hg6qjteKUczjrmXbbikAXMCGHL/4M
X-Gm-Message-State: AOJu0Yz1WKG88XoR6eCGuzS55YmQh04KrvKW8znMWMB5e1WKbzQELN+m
 Ejh7DlsHD8uDRpOkC2NpiHBjYVIrhz0wSD8Inm2kOfT+IYaZL3/oGQnWweFmu8OYzY8PsmNBRI8
 BkyM=
X-Received: by 2002:a19:3849:0:b0:511:7a31:d66d with SMTP id
 d9-20020a193849000000b005117a31d66dmr1604680lfj.57.1708020242033; 
 Thu, 15 Feb 2024 10:04:02 -0800 (PST)
Received: from m1x-phil.lan ([176.187.193.50])
 by smtp.gmail.com with ESMTPSA id
 s15-20020a17090699cf00b00a3bd8a34b1bsm793336ejn.164.2024.02.15.10.03.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 15 Feb 2024 10:04:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Rob Herring <robh@kernel.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 John Snow <jsnow@redhat.com>, Beniamino Galvani <b.galvani@gmail.com>,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: [PULL 55/56] hw/ide/ahci: Move SysBus definitions to 'ahci-sysbus.h'
Date: Thu, 15 Feb 2024 18:57:49 +0100
Message-ID: <20240215175752.82828-56-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240215175752.82828-1-philmd@linaro.org>
References: <20240215175752.82828-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x131.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: vmrsw3JZkMc7

Keep "hw/ide/ahci.h" AHCI-generic.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Leif Lindholm <quic_llindhol@quicinc.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20240213081201.78951-10-philmd@linaro.org>
---
 include/hw/arm/allwinner-a10.h |  2 +-
 include/hw/arm/allwinner-r40.h |  2 +-
 include/hw/arm/xlnx-zynqmp.h   |  2 +-
 include/hw/ide/ahci-sysbus.h   | 35 ++++++++++++++++++++++++++++++++++
 include/hw/ide/ahci.h          | 29 +---------------------------
 hw/arm/highbank.c              |  2 +-
 hw/arm/sbsa-ref.c              |  1 +
 hw/ide/ahci-allwinner.c        |  3 +--
 hw/ide/ahci.c                  |  1 +
 9 files changed, 43 insertions(+), 34 deletions(-)
 create mode 100644 include/hw/ide/ahci-sysbus.h

diff --git a/include/hw/arm/allwinner-a10.h b/include/hw/arm/allwinner-a10.h
index 2eb83a17ea..67a9a17b86 100644
--- a/include/hw/arm/allwinner-a10.h
+++ b/include/hw/arm/allwinner-a10.h
@@ -5,7 +5,7 @@
 #include "hw/intc/allwinner-a10-pic.h"
 #include "hw/net/allwinner_emac.h"
 #include "hw/sd/allwinner-sdhost.h"
-#include "hw/ide/ahci.h"
+#include "hw/ide/ahci-sysbus.h"
 #include "hw/usb/hcd-ohci.h"
 #include "hw/usb/hcd-ehci.h"
 #include "hw/rtc/allwinner-rtc.h"
diff --git a/include/hw/arm/allwinner-r40.h b/include/hw/arm/allwinner-r40.h
index 66c38e7d90..614e74b7ed 100644
--- a/include/hw/arm/allwinner-r40.h
+++ b/include/hw/arm/allwinner-r40.h
@@ -22,7 +22,7 @@
 
 #include "qom/object.h"
 #include "hw/timer/allwinner-a10-pit.h"
-#include "hw/ide/ahci.h"
+#include "hw/ide/ahci-sysbus.h"
 #include "hw/intc/arm_gic.h"
 #include "hw/sd/allwinner-sdhost.h"
 #include "hw/misc/allwinner-r40-ccu.h"
diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
index 96358d51eb..48f7948092 100644
--- a/include/hw/arm/xlnx-zynqmp.h
+++ b/include/hw/arm/xlnx-zynqmp.h
@@ -22,7 +22,7 @@
 #include "hw/net/cadence_gem.h"
 #include "hw/char/cadence_uart.h"
 #include "hw/net/xlnx-zynqmp-can.h"
-#include "hw/ide/ahci.h"
+#include "hw/ide/ahci-sysbus.h"
 #include "hw/sd/sdhci.h"
 #include "hw/ssi/xilinx_spips.h"
 #include "hw/dma/xlnx_dpdma.h"
diff --git a/include/hw/ide/ahci-sysbus.h b/include/hw/ide/ahci-sysbus.h
new file mode 100644
index 0000000000..06eaac8cb6
--- /dev/null
+++ b/include/hw/ide/ahci-sysbus.h
@@ -0,0 +1,35 @@
+/*
+ * QEMU AHCI Emulation (MMIO-mapped devices)
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#ifndef HW_IDE_AHCI_SYSBUS_H
+#define HW_IDE_AHCI_SYSBUS_H
+
+#include "qom/object.h"
+#include "hw/sysbus.h"
+#include "hw/ide/ahci.h"
+
+#define TYPE_SYSBUS_AHCI "sysbus-ahci"
+OBJECT_DECLARE_SIMPLE_TYPE(SysbusAHCIState, SYSBUS_AHCI)
+
+struct SysbusAHCIState {
+    SysBusDevice parent_obj;
+
+    AHCIState ahci;
+};
+
+#define TYPE_ALLWINNER_AHCI "allwinner-ahci"
+OBJECT_DECLARE_SIMPLE_TYPE(AllwinnerAHCIState, ALLWINNER_AHCI)
+
+#define ALLWINNER_AHCI_MMIO_OFF  0x80
+#define ALLWINNER_AHCI_MMIO_SIZE 0x80
+
+struct AllwinnerAHCIState {
+    SysbusAHCIState parent_obj;
+
+    MemoryRegion mmio;
+    uint32_t regs[ALLWINNER_AHCI_MMIO_SIZE / 4];
+};
+
+#endif
diff --git a/include/hw/ide/ahci.h b/include/hw/ide/ahci.h
index c0b10c2bb4..ba31e75ff9 100644
--- a/include/hw/ide/ahci.h
+++ b/include/hw/ide/ahci.h
@@ -24,8 +24,7 @@
 #ifndef HW_IDE_AHCI_H
 #define HW_IDE_AHCI_H
 
-#include "hw/sysbus.h"
-#include "qom/object.h"
+#include "exec/memory.h"
 
 typedef struct AHCIDevice AHCIDevice;
 
@@ -54,30 +53,4 @@ typedef struct AHCIState {
 
 void ahci_ide_create_devs(AHCIState *ahci, DriveInfo **hd);
 
-#define TYPE_SYSBUS_AHCI "sysbus-ahci"
-OBJECT_DECLARE_SIMPLE_TYPE(SysbusAHCIState, SYSBUS_AHCI)
-
-struct SysbusAHCIState {
-    /*< private >*/
-    SysBusDevice parent_obj;
-    /*< public >*/
-
-    AHCIState ahci;
-};
-
-#define TYPE_ALLWINNER_AHCI "allwinner-ahci"
-OBJECT_DECLARE_SIMPLE_TYPE(AllwinnerAHCIState, ALLWINNER_AHCI)
-
-#define ALLWINNER_AHCI_MMIO_OFF  0x80
-#define ALLWINNER_AHCI_MMIO_SIZE 0x80
-
-struct AllwinnerAHCIState {
-    /*< private >*/
-    SysbusAHCIState parent_obj;
-    /*< public >*/
-
-    MemoryRegion mmio;
-    uint32_t regs[ALLWINNER_AHCI_MMIO_SIZE/4];
-};
-
 #endif /* HW_IDE_AHCI_H */
diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
index 9fdac1cc81..c71b1a8db3 100644
--- a/hw/arm/highbank.c
+++ b/hw/arm/highbank.c
@@ -30,7 +30,7 @@
 #include "hw/boards.h"
 #include "qemu/error-report.h"
 #include "hw/char/pl011.h"
-#include "hw/ide/ahci.h"
+#include "hw/ide/ahci-sysbus.h"
 #include "hw/cpu/a9mpcore.h"
 #include "hw/cpu/a15mpcore.h"
 #include "qemu/log.h"
diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index f2adf30337..5d3a574664 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -38,6 +38,7 @@
 #include "hw/boards.h"
 #include "hw/ide/internal.h"
 #include "hw/ide/ahci_internal.h"
+#include "hw/ide/ahci-sysbus.h"
 #include "hw/intc/arm_gicv3_common.h"
 #include "hw/intc/arm_gicv3_its_common.h"
 #include "hw/loader.h"
diff --git a/hw/ide/ahci-allwinner.c b/hw/ide/ahci-allwinner.c
index b173121006..9620de8ce8 100644
--- a/hw/ide/ahci-allwinner.c
+++ b/hw/ide/ahci-allwinner.c
@@ -19,9 +19,8 @@
 #include "qemu/error-report.h"
 #include "qemu/module.h"
 #include "sysemu/dma.h"
-#include "hw/ide/internal.h"
 #include "migration/vmstate.h"
-#include "ahci_internal.h"
+#include "hw/ide/ahci-sysbus.h"
 
 #include "trace.h"
 
diff --git a/hw/ide/ahci.c b/hw/ide/ahci.c
index 041cc87c11..54c9685495 100644
--- a/hw/ide/ahci.c
+++ b/hw/ide/ahci.c
@@ -37,6 +37,7 @@
 #include "hw/ide/internal.h"
 #include "hw/ide/pci.h"
 #include "hw/ide/ahci-pci.h"
+#include "hw/ide/ahci-sysbus.h"
 #include "ahci_internal.h"
 
 #include "trace.h"
-- 
2.41.0

