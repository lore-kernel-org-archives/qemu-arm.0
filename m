Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp994524ejq;
        Wed, 17 May 2023 03:53:36 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5AhrSIC6S45GfKYbKm0WMP7GZrkaiaALuoHNc+Q1U54XLxAaXDYCOAysC3f7mhDnjGDhRw
X-Received: by 2002:a05:6214:d05:b0:615:29ab:e4a8 with SMTP id 5-20020a0562140d0500b0061529abe4a8mr60707495qvh.31.1684320816492;
        Wed, 17 May 2023 03:53:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684320816; cv=none;
        d=google.com; s=arc-20160816;
        b=k+nugKzewWmMq/HRe0xNCNhTJBlL+UK/cuP18H/LFABZCDL3+XZ8aC5/f7iQzU8UCE
         Vjna+mcfP2iZOrWgAZpLXKgJG2f2eNrt0Z+awtIeL/y15h0T3Q6Zil262EdJZr0/tbFx
         71ZZXChKkCReNRX65VwGIFwlctUghDSesJkEEtbdr5kqvQ8Lv9JrIzCCSzLianfQJlWa
         VE9WqRPvMWPiOHJjLEH7HNzq9KaB3C1mSIfoVcKhdX2im1cN1pG4pJ8v23XvHE1vtnxP
         OaTGh/2ZrCOwFAQCwyPjeEnRMN3MIhXztJORxN06D4VHI9+KkTRp2xMQXT0NYc98pt+Z
         W8+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=mO5b/FJXc/pTaAiVtkSQ9MXnSLdPkTIXBd1RX+caGrY=;
        b=JcNH9CHnDnQl/CC4zfB/4LlnJrJJvgXNdaauODrnbbSekRFNZqcMzS/bN6U5MZQjSk
         v03buxom99j24xiyga/o1epkjc/a52F4oIlw/I5n2+WbB1sHkIpeBtfkfp39vMDNBC0E
         n3GSz2aHqGON2L9Smpnni2UrKu7NxC2mJOURrjUoBzmkwPbsaDm89j/gNZDxVFAOC+nf
         jWWA5NPxdejFhPhSahOw/XqbEOK/lLDOGg1nPagyK4abzzku982ThLpHpQH9EKP/IDwj
         AzJLrs+KubLhtgyGDBX+dgWN3SZydOPo50OjhjUwrkohucGvI28f3HGIS5yRSCLxAnfB
         EglQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pj32-20020a05620a1da000b0075947ef3256si1081541qkn.719.2023.05.17.03.53.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 May 2023 03:53:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pzEmP-0001HQ-QM; Wed, 17 May 2023 06:53:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1pzEmO-0001HD-6h; Wed, 17 May 2023 06:53:12 -0400
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1pzEmM-0002Er-Mx; Wed, 17 May 2023 06:53:11 -0400
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id C634A260B87;
 Wed, 17 May 2023 12:53:07 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p-Xpu8dioxNR; Wed, 17 May 2023 12:53:06 +0200 (CEST)
Received: from applejack.lan (83.11.34.59.ipv4.supernova.orange.pl
 [83.11.34.59])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id AFAD92600A3;
 Wed, 17 May 2023 12:53:05 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: [PATCH v2] hw/arm/sbsa-ref: add GIC node into DT
Date: Wed, 17 May 2023 12:53:03 +0200
Message-Id: <20230517105303.453161-1-marcin.juszkiewicz@linaro.org>
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
X-TUID: zESodoCnrzi+

Let add GIC information into DeviceTree as part of SBSA-REF versioning.

Trusted Firmware will read it and provide to next firmware level.

Bumps platform version to 0.1 one so we can check is node is present.

Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
---
 hw/arm/sbsa-ref.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/hw/arm/sbsa-ref.c b/hw/arm/sbsa-ref.c
index 792371fdce..9204e8605f 100644
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
@@ -168,6 +169,20 @@ static uint64_t sbsa_ref_cpu_mp_affinity(SBSAMachineState *sms, int idx)
     return arm_cpu_mp_affinity(idx, clustersz);
 }
 
+static void sbsa_fdt_add_gic_node(SBSAMachineState *sms)
+{
+    char *nodename;
+
+    nodename = g_strdup_printf("/intc");
+    qemu_fdt_add_subnode(sms->fdt, nodename);
+    qemu_fdt_setprop_sized_cells(sms->fdt, nodename, "reg",
+                                 2, sbsa_ref_memmap[SBSA_GIC_DIST].base,
+                                 2, sbsa_ref_memmap[SBSA_GIC_DIST].size,
+                                 2, sbsa_ref_memmap[SBSA_GIC_REDIST].base,
+                                 2, sbsa_ref_memmap[SBSA_GIC_REDIST].size);
+
+    g_free(nodename);
+}
 /*
  * Firmware on this machine only uses ACPI table to load OS, these limited
  * device tree nodes are just to let firmware know the info which varies from
@@ -204,7 +219,7 @@ static void create_fdt(SBSAMachineState *sms)
      *                        fw compatibility.
      */
     qemu_fdt_setprop_cell(fdt, "/", "machine-version-major", 0);
-    qemu_fdt_setprop_cell(fdt, "/", "machine-version-minor", 0);
+    qemu_fdt_setprop_cell(fdt, "/", "machine-version-minor", 1);
 
     if (ms->numa_state->have_numa_distance) {
         int size = nb_numa_nodes * nb_numa_nodes * 3 * sizeof(uint32_t);
@@ -260,6 +275,8 @@ static void create_fdt(SBSAMachineState *sms)
 
         g_free(nodename);
     }
+
+    sbsa_fdt_add_gic_node(sms);
 }
 
 #define SBSA_FLASH_SECTOR_SIZE (256 * KiB)
-- 
2.40.1

