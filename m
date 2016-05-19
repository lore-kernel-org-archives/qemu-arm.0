Received: by 10.25.208.137 with SMTP id h131csp3299217lfg;
        Thu, 19 May 2016 15:56:38 -0700 (PDT)
X-Received: by 10.55.71.143 with SMTP id u137mr17402578qka.1.1463698598473;
        Thu, 19 May 2016 15:56:38 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t184si14969008qkd.250.2016.05.19.15.56.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 19 May 2016 15:56:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52433 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b3Wrt-0001Ub-W2
	for alex.bennee@linaro.org; Thu, 19 May 2016 18:56:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45868)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1b3Wpr-0008NV-Ha
	for qemu-devel@nongnu.org; Thu, 19 May 2016 18:54:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1b3Wpp-0007Gn-IF
	for qemu-devel@nongnu.org; Thu, 19 May 2016 18:54:30 -0400
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244]:32870)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>)
	id 1b3Wpp-0007Ge-Bk; Thu, 19 May 2016 18:54:29 -0400
Received: by mail-wm0-x244.google.com with SMTP id 67so1713324wmg.0;
	Thu, 19 May 2016 15:54:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fn3lZwjL5v4bKcH0mwCcf92jZwlH3Nw/R30iL02clPc=;
	b=hGhXSMieUquKaO0/s9EYT3gt7piwdLWwkQrEc3xJ3s4Oo6AYto6W74ktj+uWmF6rjn
	FEcuNZ0D0CV4coc0HMGuomKg2lhMsgAE8r6HLgo8wvLfkXskXkGwbKlB/cUucdF6kaFp
	wdOdxDrCdRxlcu7XYvMoe3y/Lx1B1AUU2zWelvewz/C4p4cOJmui09En1Q9t3bAk0rAa
	eNzm8qkf5V4c9d18WX9kC/BhvFCWhJUCLStEk12flUu4K9eiO6Ru8xd0qBBcPfkjKrtQ
	SDu6oJh1hUs+DiyRD35k4ZX6PaReyaCh9/5MpQSUdKoMY533JqCM7dAXmiQOJNFRGwim
	Rfmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=fn3lZwjL5v4bKcH0mwCcf92jZwlH3Nw/R30iL02clPc=;
	b=EwH3SD5bsnAlCWoJoCOxo163PDBSIpgTP12IXkPKqnixMBLhLRXl4+nakgMwQsus9y
	m2wDCSkhDxlJdLFMj2whVdoajn8r01UgNnEbCWP3LXudxXfBEQo+Xx4xqOm9j7nYU/CF
	DjFFzW7e2+Pb8kTrS6gW0rdfvR/xuqeW3MG+zcSTMEJzkWGGesq0k2heFh/hjl6yMgq9
	uuqjsRgGe8VAhN+D7u8l3MQsAHey4/idigGjORpjnHxPTc4DFj+HnFHCfJ81Ys2OSvm0
	eJntWL6QJ6yMdC7xQHPEQ7mSNRUekS8Gcn4NAt35lw72jUkqYK2CBFxX21FwX475Nrem
	kvlA==
X-Gm-Message-State: AOPr4FX3VSnKN1sNghfUGFI4AVXg2GLxLVtjuV35isRTUg7UfGL4KycC2aXKXqYvnQK4+A==
X-Received: by 10.28.222.69 with SMTP id v66mr227249wmg.84.1463698468709;
	Thu, 19 May 2016 15:54:28 -0700 (PDT)
Received: from localhost (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id u6sm1483065wmd.21.2016.05.19.15.54.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 19 May 2016 15:54:28 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Date: Fri, 20 May 2016 00:54:19 +0200
Message-Id: <1463698459-31312-6-git-send-email-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1463698459-31312-1-git-send-email-edgar.iglesias@gmail.com>
References: <1463698459-31312-1-git-send-email-edgar.iglesias@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::244
Subject: [Qemu-devel] [PATCH v1 5/5] xlnx-zynqmp: Use the in kernel GIC
 model for KVM runs
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org,
	crosthwaite.peter@gmail.com, qemu-arm@nongnu.org,
	alistair.francis@xilinx.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: q6ue9pp/+J4o

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Use the in kernel GIC model when running with KVM enabled.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/arm/xlnx-zynqmp.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 0648028..c3878da 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -22,6 +22,8 @@
 #include "hw/arm/xlnx-zynqmp.h"
 #include "hw/intc/arm_gic_common.h"
 #include "exec/address-spaces.h"
+#include "sysemu/kvm.h"
+#include "kvm_arm.h"
 
 #define GIC_NUM_SPI_INTR 160
 
@@ -169,7 +171,7 @@ static void xlnx_zynqmp_init(Object *obj)
                              qdev_prop_allow_set_link_before_realize,
                              OBJ_PROP_LINK_UNREF_ON_RELEASE, &error_abort);
 
-    object_initialize(&s->gic, sizeof(s->gic), TYPE_ARM_GIC);
+    object_initialize(&s->gic, sizeof(s->gic), gic_class_name());
     qdev_set_parent_bus(DEVICE(&s->gic), sysbus_get_default());
 
     for (i = 0; i < XLNX_ZYNQMP_NUM_GEMS; i++) {
-- 
2.5.0

