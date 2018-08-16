Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1915168wru;
        Thu, 16 Aug 2018 07:24:27 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPwKp2H/BJ2LPETOI+7QRbYPc34C3iS7eJCI0ebgZU9BNsBG1s28kGZJ2c8erml2VXPEd/2Z
X-Received: by 2002:a37:5285:: with SMTP id g127-v6mr26797595qkb.377.1534429467739;
        Thu, 16 Aug 2018 07:24:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534429467; cv=none;
        d=google.com; s=arc-20160816;
        b=MLyXDFo1taFkLsdUe/Mlvp6WgapjxJzpRPyaaTmSDIJLnhhxmpOmvy1Dq7Ashw34n9
         0oX4+ajoATBPNx8f4PK+4GYVH1gBciaDnnrNaUxu2VJxnf3DcJaCLgPtfFl85aNqxLQ4
         g6Zu3inTqf5LCchHqcffZ3RV41f2rSO1p0+KWBZU/uW6T9I+z10zU2syocjO25YZV0ZK
         BeVXozKth9Rd9pNr1sULvST3vepWt+9cbRmJoq/PT9G3u3qQ+zFFcJirxNlNgwseWcm6
         QptFnH7tiVukchFttDxjwDJtd53nJYLMjXkVJQx+lKcprWAe3ft+5qUhzS6Vxzr0NCyy
         rDtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=BEuLX0ahye47Gf5X2qlGa21bUMaQV4A951E5uD+yS84=;
        b=MfS93wrGlS3O6muY7Sr3zbpG3NN+rKW8zknwWR6Xa5EGIse0pO45EYMZGAxycfXnm0
         f2jRORLL2Q8CV6Hl3l+G5bDYzirvhI7uFpKZcW6KkHawJ9hFfNMzD/ii0lq2aLm60YDV
         ClElRkQwVxION6feVSVEMITg9PrW1lKLv8Ji23tusy93kDFj++lBbVLj8EQdql31I2Vv
         d/HYeGpWvUfbbOEXLpg8PuaXxcnbpIYiAPEC1jUg1TLSu2MyjawxsQP7Pux6HIxC54I9
         VyDGzYzx6MVZe4hFw6J+BI+aXiXxQvMasyVTcHhDNT2On1hYuZDY2kHvY8FTLtS5n1LG
         SFmA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=PLnETtpg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h47-v6si3122554qth.404.2018.08.16.07.24.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 16 Aug 2018 07:24:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=PLnETtpg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56008 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fqJCN-00007S-8X
	for alex.bennee@linaro.org; Thu, 16 Aug 2018 10:24:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42676)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fqJ25-0006j5-QF
	for qemu-devel@nongnu.org; Thu, 16 Aug 2018 10:13:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fqJ22-0004Xz-66
	for qemu-devel@nongnu.org; Thu, 16 Aug 2018 10:13:49 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:39487)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1fqJ21-0004XO-W9; Thu, 16 Aug 2018 10:13:46 -0400
Received: by mail-pf1-x442.google.com with SMTP id j8-v6so2089779pff.6;
	Thu, 16 Aug 2018 07:13:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=BEuLX0ahye47Gf5X2qlGa21bUMaQV4A951E5uD+yS84=;
	b=PLnETtpgP3CvBROKNAQGtkO5druacSEEwl/lRcd3AERFhtVtRHQlLIZndnBMfAMWzG
	QhzOljl7a0lMzq17fgA5uHRZz+9miRIZXNfSWe3TPoOwceYpP0rGKg2Jjm0TPonoe7mx
	U6Zj2QT8sTrxC1kRJBwuzM+Qr+RtDPFQ7SXDMN7OPO4HPqS7ukxDoh0i8MOzhuV77Yqx
	+fhxjK71naxVUwywLsUROQ1U7sYJaR6t2Sb4IJlKVocOvmgbGcHxCWjwryMMw00iCHnT
	tA/vKd2jQwFOaJaAoMPgo1hyCwGRg/WJndJg7/QetyD+eTWonyVS82TbE6+VbKODbe7i
	u2iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=BEuLX0ahye47Gf5X2qlGa21bUMaQV4A951E5uD+yS84=;
	b=BmY+cf2BetvjA62wWNsTfZyjROKPKq93lWaICEuESbX+v+rjim22UrDNc1+C4Bkip9
	LiI3KgeX3k4CFQCqID9LMg0I8U6ZRWnfkHIP2VORAmSsj/f4sCOb75WPKPiE9usHF6p5
	zn4Siaq7px4Jq5k3uxg/BYHBYeIMf2w/4HiorR+3dQ0ZTYLuKQEHPrGWD70UYUrgw01i
	9eeYGbNOymizxBybBKiqlCwHSu9gzpWs0BiSb4vuOquhDJyIuTjrai5pkX5KitKMIFhj
	QkxhtqQjTJq8Cfd0e201zgXMt2U9ddf0x/rhwgXyMPRqj5SnsSR9DjgUUrzqD9hO/QYg
	bxzA==
X-Gm-Message-State: AOUpUlFcfOR2W6T0HXiJjjs+s0dRtMMM8SmKlxvn3+Z1f4obd9OthYIj
	N4GZ/PBbhcTml9YT9oUPTEc=
X-Received: by 2002:a63:cf10:: with SMTP id
	j16-v6mr29232964pgg.238.1534428825117; 
	Thu, 16 Aug 2018 07:13:45 -0700 (PDT)
Received: from aurora.jms.id.au ([45.124.203.18])
	by smtp.gmail.com with ESMTPSA id
	x1-v6sm24117637pgr.59.2018.08.16.07.13.40
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 16 Aug 2018 07:13:44 -0700 (PDT)
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
	Thu, 16 Aug 2018 23:43:37 +0930
From: Joel Stanley <joel@jms.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Aug 2018 23:43:03 +0930
Message-Id: <20180816141303.20518-4-joel@jms.id.au>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180816141303.20518-1-joel@jms.id.au>
References: <20180816141303.20518-1-joel@jms.id.au>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::442
Subject: [Qemu-devel] [PATCH v5 3/3] arm: Add BBC micro:bit machine
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
Cc: Stefan Hajnoczi <stefanha@gmail.com>,
	=?UTF-8?q?Steffen=20G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	Jim Mussared <jim.mussared@gmail.com>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EdnzpmHXm86V

This adds the base for a machine model of the BBC micro:bit:

  https://en.wikipedia.org/wiki/Micro_Bit

This is a system with a nRF51 SoC containing the main processor, with
various peripherals on board.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v2:
 - Instead of setting kernel filename property, load the image directly
 - Add link to hardware overview website
v3:
 - Rebase microbit on m0 changes
 - Remove hard-coded flash size and retrieve from the soc
 - Add Stefan's reviewed-by
v5:
 - move back to armv7m calls, as v4 of Stefan's patch removed the
 m_profile changes
---
 hw/arm/Makefile.objs |  2 +-
 hw/arm/microbit.c    | 54 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 55 insertions(+), 1 deletion(-)
 create mode 100644 hw/arm/microbit.c

diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index ae4e20373b9e..5f88062c666d 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -37,4 +37,4 @@ obj-$(CONFIG_IOTKIT) += iotkit.o
 obj-$(CONFIG_FSL_IMX7) += fsl-imx7.o mcimx7d-sabre.o
 obj-$(CONFIG_ARM_SMMUV3) += smmu-common.o smmuv3.o
 obj-$(CONFIG_FSL_IMX6UL) += fsl-imx6ul.o mcimx6ul-evk.o
-obj-$(CONFIG_NRF51_SOC) += nrf51_soc.o
+obj-$(CONFIG_NRF51_SOC) += nrf51_soc.o microbit.o
diff --git a/hw/arm/microbit.c b/hw/arm/microbit.c
new file mode 100644
index 000000000000..467cfbda2348
--- /dev/null
+++ b/hw/arm/microbit.c
@@ -0,0 +1,54 @@
+/*
+ * BBC micro:bit machine
+ * http://tech.microbit.org/hardware/
+ *
+ * Copyright 2018 Joel Stanley <joel@jms.id.au>
+ *
+ * This code is licensed under the GPL version 2 or later.  See
+ * the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "hw/boards.h"
+#include "hw/arm/arm.h"
+#include "exec/address-spaces.h"
+
+#include "hw/arm/nrf51_soc.h"
+
+typedef struct {
+    MachineState parent;
+
+    NRF51State nrf51;
+} MICROBITMachineState;
+
+#define TYPE_MICROBIT_MACHINE "microbit"
+
+#define MICROBIT_MACHINE(obj) \
+    OBJECT_CHECK(MICROBITMachineState, obj, TYPE_MICROBIT_MACHINE)
+
+static void microbit_init(MachineState *machine)
+{
+    MICROBITMachineState *s = g_new(MICROBITMachineState, 1);
+    MemoryRegion *system_memory = get_system_memory();
+    Object *soc;
+
+    object_initialize(&s->nrf51, sizeof(s->nrf51), TYPE_NRF51_SOC);
+    soc = OBJECT(&s->nrf51);
+    object_property_add_child(OBJECT(machine), "nrf51", soc, &error_fatal);
+    object_property_set_link(soc, OBJECT(system_memory),
+                             "memory", &error_abort);
+
+    object_property_set_bool(soc, true, "realized", &error_abort);
+
+    armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
+            NRF51_SOC(soc)->flash_size);
+}
+
+static void microbit_machine_init(MachineClass *mc)
+{
+    mc->desc = "BBC micro:bit";
+    mc->init = microbit_init;
+    mc->max_cpus = 1;
+}
+DEFINE_MACHINE("microbit", microbit_machine_init);
-- 
2.17.1

