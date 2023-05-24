Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp2479708ejb;
        Wed, 24 May 2023 04:33:58 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7ITkcoPMFsJ0VUoF3bq8lru614h5pMtUfLlDuAlI+xIqAUm7PGgjLC9Te6hbfvXKP1Kmqf
X-Received: by 2002:a05:6214:494:b0:625:af4b:4162 with SMTP id pt20-20020a056214049400b00625af4b4162mr917499qvb.14.1684928038509;
        Wed, 24 May 2023 04:33:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684928038; cv=none;
        d=google.com; s=arc-20160816;
        b=ZHFkCFnu/pgqOGBC8AivFWxemsRsYqpq4yKS3jD0kksxqitkS2LtyG1BH8Lbx+YyZW
         dNiPJj5rNL9IjewyMO4DW0dokq7QtDE1DwA5CKiC/8TGS7usr19llchK0XzN3q0KDmju
         O4BwhmGse6pEr0pkgnVVmoAKd8Z7YEAydrPHu86aZvLhbDXHP0jvz1YdahUsjKPEeNZR
         LVrmcRhzOwDcQA5bfv8YEQh4vsJEteAys+vLuSVQmLj3RLCUk19b79XPaF6yXAbsQTeP
         RCKKB4CKJhrYXOFgSYnoOBywT2gaDFAPbDXGf6PVjIQ/5gHLxd0tEAkpcprXIjXCznEt
         55pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from;
        bh=mO5b/FJXc/pTaAiVtkSQ9MXnSLdPkTIXBd1RX+caGrY=;
        b=FIoi4wqJ+vuPef5DHjUWCeFAB7SsStNDFlNDfVtSqvIjrxzHiBykVOC0TsStTvsH+H
         v2wf9jmqpPkEtFEkMN7gtIp+XimH3Tlg2BGhnVQ28O6v2yLkNlHqheshyDIwmKT5Ey0x
         IMVGqo057SqjHRBqM05gUpKfR3cc5E36jAzav7PL8CaeD4hjuSJJEOrsgzAAE25WjqmU
         tozVqqGyTZgPu+x3xazPvMcgFAZUBddft439o1xn81gVf5ZFO3/uayxopFNkWiZJimMH
         Poo8PVl0+sVulkr2QK2RanBSGo8eX95SKHOgd3Fcfzu8PeEeq/dxzD43T7J1BkBYZpV3
         Yymg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i18-20020a05620a151200b0074e510edc1esi920751qkk.286.2023.05.24.04.33.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 May 2023 04:33:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q1mk7-0005qf-Kc; Wed, 24 May 2023 07:33:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q1mk6-0005pa-Dy; Wed, 24 May 2023 07:33:22 -0400
Received: from muminek.juszkiewicz.com.pl ([213.251.184.221])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1q1mk4-0002Vw-EY; Wed, 24 May 2023 07:33:22 -0400
Received: from localhost (localhost [127.0.0.1])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTP id 19F2A260249;
 Wed, 24 May 2023 13:33:17 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at juszkiewicz.com.pl
Received: from muminek.juszkiewicz.com.pl ([127.0.0.1])
 by localhost (muminek.juszkiewicz.com.pl [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QOnQDbWMSV5m; Wed, 24 May 2023 13:33:15 +0200 (CEST)
Received: from applejack.lan (83.21.125.167.ipv4.supernova.orange.pl
 [83.21.125.167])
 by muminek.juszkiewicz.com.pl (Postfix) with ESMTPSA id 118872602AC;
 Wed, 24 May 2023 13:33:15 +0200 (CEST)
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Leif Lindholm <quic_llindhol@quicinc.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Subject: [PATCH v3 1/4] hw/arm/sbsa-ref: add GIC node into DT
Date: Wed, 24 May 2023 13:33:06 +0200
Message-Id: <20230524113308.834675-2-marcin.juszkiewicz@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524113308.834675-1-marcin.juszkiewicz@linaro.org>
References: <20230524113308.834675-1-marcin.juszkiewicz@linaro.org>
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
X-TUID: 4ZTr+1bplpEo

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

