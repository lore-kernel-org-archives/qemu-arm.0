Received: by 10.25.30.65 with SMTP id e62csp1241888lfe;
        Wed, 25 May 2016 04:10:44 -0700 (PDT)
X-Received: by 10.200.55.181 with SMTP id d50mr2912248qtc.32.1464174644441;
        Wed, 25 May 2016 04:10:44 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r19si7332266qhb.20.2016.05.25.04.10.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 25 May 2016 04:10:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58988 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1b5Wi3-0002dE-O3
	for alex.bennee@linaro.org; Wed, 25 May 2016 07:10:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50995)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1b5WQz-0003N7-LW
	for qemu-arm@nongnu.org; Wed, 25 May 2016 06:53:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1b5WQv-00019T-Dw
	for qemu-arm@nongnu.org; Wed, 25 May 2016 06:53:04 -0400
Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243]:34963)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>)
	id 1b5WQk-00011R-H1; Wed, 25 May 2016 06:52:50 -0400
Received: by mail-wm0-x243.google.com with SMTP id f75so14169837wmf.2;
	Wed, 25 May 2016 03:52:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=oIiagLQrR2SRZvdfHOsixfouSFtI+yqhdAgnDNiWMRs=;
	b=Y5Ov67/aAh34GJ0GJqhkd1RciA11Henc4GcV5kM+4HRYDg1AZufLu/ULuQUXLrI+79
	baoegzIw9rENlmwU2rOOYkeovQib4KVTbGrLUtTzLgTAqU7koCBL67ZOLnF1w9g2OLyS
	yy22KStndFv0Se5S9j5JXvXJvL2tyVRb+LQYewY01z6n6WsPE3Cqr8HFpgz7xngcCgwq
	MaQAE/3YZshMM67GK8LFxhJnyAO5IDPZ2iVD2/rEHEANn1aOUQ8aLLQe1C/pyNBwlbO5
	wov/GWmWtkwX5M7BuhZaXD5U4qaECUfYz4P4zE436zd2hbndt1hHDbWpujeEYfyKIDxQ
	2UYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=oIiagLQrR2SRZvdfHOsixfouSFtI+yqhdAgnDNiWMRs=;
	b=NU54YKDZn6b4iNi8Dz0hx4hHghA4JALEK8qQ3YZjDtuQ8R03Rii82j2eISccfDeFDm
	sqNAyQbNjG9iqZCUbkHtlCDOS6wuFhDuN1qI+K3IcgSfgQw2KPehniRoNc6tWdrV9tsc
	RuswLDYw/uvJ+f4xCAZjLqrKsCQm+VRCx/ZhkBfGgimwo5sECNNqLVHy7e1WgIhP9LBW
	dIcvLRFU0c9C6bJDpUHC5OzviX8arCqWJymfkDNQybEZuYyoG/0QB4eQKWc8OxdeTOtR
	MmwJpNYQlmOuO+cUkbdHTed85+2A63fRInczZmPd27MvC+KWHUmXe2hpK2XespqGeiy9
	K5Zw==
X-Gm-Message-State: ALyK8tLQ1rngJHRGA9u/m2OBOsLWJjmop1km7k5GSVD9YE+Lc4Ua8R8wqO1wb+bLGSgC9w==
X-Received: by 10.194.32.199 with SMTP id l7mr3059627wji.137.1464173569729;
	Wed, 25 May 2016 03:52:49 -0700 (PDT)
Received: from localhost (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id
	q125sm8592416wmd.19.2016.05.25.03.52.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 25 May 2016 03:52:48 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed, 25 May 2016 12:52:35 +0200
Message-Id: <1464173555-12800-5-git-send-email-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <1464173555-12800-1-git-send-email-edgar.iglesias@gmail.com>
References: <1464173555-12800-1-git-send-email-edgar.iglesias@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::243
Subject: [Qemu-arm] [PATCH v2 4/4] xlnx-zynqmp: Use the in kernel GIC model
 for KVM runs
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, qemu-arm@nongnu.org,
	alistair.francis@xilinx.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EAVBFB3viRq3

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Use the in kernel GIC model when running with KVM enabled.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/arm/xlnx-zynqmp.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index db5b82b..9a1bc94 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -22,6 +22,8 @@
 #include "hw/arm/xlnx-zynqmp.h"
 #include "hw/intc/arm_gic_common.h"
 #include "exec/address-spaces.h"
+#include "sysemu/kvm.h"
+#include "kvm_arm.h"
 
 #define GIC_NUM_SPI_INTR 160
 
@@ -135,7 +137,7 @@ static void xlnx_zynqmp_init(Object *obj)
                              qdev_prop_allow_set_link_before_realize,
                              OBJ_PROP_LINK_UNREF_ON_RELEASE, &error_abort);
 
-    object_initialize(&s->gic, sizeof(s->gic), TYPE_ARM_GIC);
+    object_initialize(&s->gic, sizeof(s->gic), gic_class_name());
     qdev_set_parent_bus(DEVICE(&s->gic), sysbus_get_default());
 
     for (i = 0; i < XLNX_ZYNQMP_NUM_GEMS; i++) {
-- 
2.5.0

