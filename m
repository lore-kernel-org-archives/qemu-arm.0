Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp6396028ejq;
        Mon, 15 May 2023 03:05:26 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ60uuG5Ri2kM/2C4Bde+8BVUJvzRE5mJn3p4VYxWR8p2OVVA26PVPeevk6xCjVu2mMuEYxh
X-Received: by 2002:a05:622a:c:b0:3f3:8819:67eb with SMTP id x12-20020a05622a000c00b003f3881967ebmr46594373qtw.6.1684145126308;
        Mon, 15 May 2023 03:05:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684145126; cv=none;
        d=google.com; s=arc-20160816;
        b=omHNEBzssSn7HYTbOzBcX5KE7qp4qS6hCG2gOmPTCR/O75gHpi1fDh7ppfakcfjDBp
         n5PTJDe7Qs8/hEwURr/OIzUppYNwxrI3QNGW4Uhk2yyfnHouArlACKMvYL+5M2lXyho6
         TVCXnzQ7/iL83TTrCsLCYQj7awgi4UcBIWTla8inCl0rmhA5kjmQAt0XSoekbA/ExRlF
         gsumZIeTFXdNuhwoqzsxPreUjm0pkwFKJOfWqxatlahNphvEIEvP/6o1nKMNL7De9fuo
         JfxJm0tvYidPcDEw+PB6jzlO5e1A5VMQUECIbVn+lNa0V6jwX2P2MwsijODN+hYQ+Lxx
         IhyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=JEWeqF+ZrU2OTtT9sPoqWkrzeo4vOYhOzZnGqxZ49xs=;
        b=I552qCrnqAL3GkDmVOQKHjYFSzK8GnVSJ7U/tqEVNqPvV80AbwYKRngbXx4oRthZUD
         ZS0zgDXaYsXBPF48iORFKghtUvROSWlJi+f6eareYuwrDpozb8/sYMvY5nxtv01nJowV
         X+31g4hZ4lxaj+ZzZdihlILcKnOxmZEK5SW4QHdIDZGq1w5RpBa7HcqOl6PNTZbw312E
         DjnibTLWasbpw2sgsU55khF5mAi7tc15OIqMN9Jo28qwJ7HkWBu7KFQoEuXUhMYsMXAY
         Oecgh/2GduVtkOdmpTVJUjzoVcIEIIZjmGJPaen87Z6PlUb0GU2sBv2tumZ57dDqlxdM
         PYiA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w7-20020ac87e87000000b003d52e0543d2si9410634qtj.268.2023.05.15.03.05.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 May 2023 03:05:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pyV4X-0001Kr-7j; Mon, 15 May 2023 06:04:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1pyV4V-0001KZ-IW; Mon, 15 May 2023 06:04:51 -0400
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1pyV4T-0000ZJ-Vg; Mon, 15 May 2023 06:04:51 -0400
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id 15977260BA9;
 Mon, 15 May 2023 12:04:44 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ukay9FGXesDs; Mon, 15 May 2023 12:04:42 +0200 (CEST)
Received: from applejack.lan (83.11.34.59.ipv4.supernova.orange.pl
 [83.11.34.59])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id B90F1260BA8;
 Mon, 15 May 2023 12:04:41 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: [PATCH] hw/arm/sbsa-ref: add GIC node into DT
Date: Mon, 15 May 2023 12:04:38 +0200
Message-Id: <20230515100438.359690-1-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=213.251.184.221;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=muminek.juszkiewicz.com.pl
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
X-TUID: ewXULNEPjjTs

Let add GIC information into DeviceTree as part of SBSA-REF versioning.

Trusted Firmware will read it and provide to next firmware level.

Bumps platform version to 0.1 one so we can check is node is present.
---
 hw/arm/sbsa-ref.c | 38 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 37 insertions(+), 1 deletion(-)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 06bd1c5ec4..55dde901f0 100644
--- a/hw/arm/sbsa-ref.c
+++ b/hw/arm/sbsa-ref.c
@@ -29,6 +29,7 @@
 #include "exec/hwaddr.h"
 #include "kvm_arm.h"
 #include "hw/arm/boot.h"
+#include "hw/arm/fdt.h"
 #include "hw/arm/smmuv3.h"
 #include "hw/block/flash.h"
 #include "hw/boards.h"
@@ -170,6 +171,39 @@ static uint64_t sbsa_ref_cpu_mp_affinity(SBSAMachineState *sms, int idx)
     return arm_cpu_mp_affinity(idx, clustersz);
 }
 
+static void sbsa_fdt_add_gic_node(SBSAMachineState *sms)
+{
+    char *nodename;
+    int gic_phandle;
+
+    gic_phandle = qemu_fdt_alloc_phandle(sms->fdt);
+    qemu_fdt_setprop_cell(sms->fdt, "/", "interrupt-parent", gic_phandle);
+
+    nodename = g_strdup_printf("/intc@%" PRIx64,
+                               sbsa_ref_memmap[SBSA_GIC_DIST].base);
+    qemu_fdt_add_subnode(sms->fdt, nodename);
+    qemu_fdt_setprop_cell(sms->fdt, nodename, "#interrupt-cells", 3);
+    qemu_fdt_setprop(sms->fdt, nodename, "interrupt-controller", NULL, 0);
+    qemu_fdt_setprop_cell(sms->fdt, nodename, "#address-cells", 0x2);
+    qemu_fdt_setprop_cell(sms->fdt, nodename, "#size-cells", 0x2);
+    qemu_fdt_setprop(sms->fdt, nodename, "ranges", NULL, 0);
+
+    qemu_fdt_setprop_string(sms->fdt, nodename, "compatible",
+                            "arm,gic-v3");
+
+    qemu_fdt_setprop_sized_cells(sms->fdt, nodename, "reg",
+                                 2, sbsa_ref_memmap[SBSA_GIC_DIST].base,
+                                 2, sbsa_ref_memmap[SBSA_GIC_DIST].size,
+                                 2, sbsa_ref_memmap[SBSA_GIC_REDIST].base,
+                                 2, sbsa_ref_memmap[SBSA_GIC_REDIST].size);
+
+    qemu_fdt_setprop_cells(sms->fdt, nodename, "interrupts",
+			   GIC_FDT_IRQ_TYPE_PPI, ARCH_GIC_MAINT_IRQ,
+                           GIC_FDT_IRQ_FLAGS_LEVEL_HI);
+
+    qemu_fdt_setprop_cell(sms->fdt, nodename, "phandle", gic_phandle);
+    g_free(nodename);
+}
 /*
  * Firmware on this machine only uses ACPI table to load OS, these limited
  * device tree nodes are just to let firmware know the info which varies from
@@ -206,7 +240,7 @@ static void create_fdt(SBSAMachineState *sms)
      *                        fw compatibility.
      */
     qemu_fdt_setprop_cell(fdt, "/", "machine-version-major", 0);
-    qemu_fdt_setprop_cell(fdt, "/", "machine-version-minor", 0);
+    qemu_fdt_setprop_cell(fdt, "/", "machine-version-minor", 1);
 
     if (ms->numa_state->have_numa_distance) {
         int size = nb_numa_nodes * nb_numa_nodes * 3 * sizeof(uint32_t);
@@ -262,6 +296,8 @@ static void create_fdt(SBSAMachineState *sms)
 
         g_free(nodename);
     }
+
+    sbsa_fdt_add_gic_node(sms);
 }
 
 #define SBSA_FLASH_SECTOR_SIZE (256 * KiB)
-- 
2.40.1

