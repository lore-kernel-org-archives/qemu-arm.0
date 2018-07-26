Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1360091wru;
        Wed, 25 Jul 2018 19:38:03 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpc8aPdrLqSQKrE7lHMi45qHDnHCyL5TUrN6Yo5SlAH49U5LyhG4Icwrqxr31fcLqPZdmzBT
X-Received: by 2002:a0c:aa46:: with SMTP id e6-v6mr98190qvb.50.1532572683163;
        Wed, 25 Jul 2018 19:38:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532572683; cv=none;
        d=google.com; s=arc-20160816;
        b=XUyoJjnZ+cLmuMhZDUm2JNIY0NW2aJdOjIgbfRYBMuMvJYDCfCKvMT4nIvcUHdt7Wo
         kHKq/yjU9ag+yZmeyHiXFxoqF6putSAwjSk94zhKQXmT4jWto+v1pjuP+BuLFF7uLEdE
         AbeJktq9ZJZYnT3aw17RD+WsIIbbRqJgVaTfVY/46FNAkxkpwclcjrvP0OJkNzL9Ghxw
         v+Ux+XTj0Kgo2pamYiwx9LRyP0OYi03kH071swv5mBhdIiEDwMCqjcXwhtyPfTpyHjel
         +q6CHN013ZZgUP/oJfMvZfxI/gp8IHUEA4/XKCCr4AqBzFiEdiSjQf7e3uKwfMwW9nVy
         dQkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=uVpIy0tbum8TS+4LeuR9ToTnLJtiAlEi8k9IZIn1ZjE=;
        b=HGllVmsuT559/Mkt60fRHwjzJJBOjJ6UmXyZtC/badY+nIgFzicAVJAnZrmEKityj5
         hQL/KBt8K2oibazl/1QORKGDhdacegKaNE67+ilLFhgdPJ//wRqpeU7WGvfGgPNVzFr8
         sjNv/qXCzj5VBu2yJYyDTkaK70sL2F7JPZ7cKYT9GFRpmDCwxNRi98fGYiF4RtVIZY4q
         c38+JKlca2wMykf/811TCh9isxW2oprk/biCHAPgtGX3R05cQRtuQ1oEzgOj3ZglcBQC
         cGqzD+Rj5JmO14nYjoSUUGuir11E+9Uur/LB0m1A6MyA/zxejKu11Fm3hYGu8uVBqJXw
         fQpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=e+rSrOSo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k7-v6si115119qtj.247.2018.07.25.19.38.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 25 Jul 2018 19:38:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=e+rSrOSo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57701 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fiWAE-00062G-NT
	for alex.bennee@linaro.org; Wed, 25 Jul 2018 22:38:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53416)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fiW9r-0005v1-KI
	for qemu-arm@nongnu.org; Wed, 25 Jul 2018 22:37:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fiW9o-0003Oj-LZ
	for qemu-arm@nongnu.org; Wed, 25 Jul 2018 22:37:39 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:35583)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1fiW9i-0003LO-6X; Wed, 25 Jul 2018 22:37:30 -0400
Received: by mail-pf1-x444.google.com with SMTP id q7-v6so74013pff.2;
	Wed, 25 Jul 2018 19:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=uVpIy0tbum8TS+4LeuR9ToTnLJtiAlEi8k9IZIn1ZjE=;
	b=e+rSrOSoOddjat6fksfoZiVEkrkWwBPaaUree7BLNDWo8/KygHjyAm6VOLcP9xIJdz
	xlMjhWArb5TyFaxqLc0iY1FWHAy2H9x6IZKiS13rTE2cyyi938PsCp1pJ72MZJ9DAfR3
	udB8IM3fLB/F58lCtZsLH4PfiG4Mle89x0JKtIk6qqMVaFgZyiRX/3BHLI1Ee3QFNdDk
	yE3C/0SpvEKNfhVDLnjh5Jy4zQn13XoGHrQ9cCrW4R7N0vWH6Pig7zmvKYAj8ePhXS+G
	vqbYu/jjs/fDHJnQefAPGhfI2JPDQZ8N5ilOiftBslt+WHJ8U/Uo+OEkTNxGMZsjXGf8
	FkIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=uVpIy0tbum8TS+4LeuR9ToTnLJtiAlEi8k9IZIn1ZjE=;
	b=qiLsmNfYyKpGRVHOjKzx7lNmPcueMDR1flP+4PsJpOsPKz1M5BuF5E0oENwivyJLWV
	j6v86v5CzUjKhrwjdDRRevmkukFcViNQvw4mtOEkiKTLpIzyy0Cf8ZUWydoFpWnu2Wl3
	oGXVHtcGbnm5PwPGC+3I9PPywCfS2XAYYEcxGqVFTZUQi0RBD2b8YT4J0YnKHxmvTRE3
	Z94C9n/D4dj/LFGmNSqXZ6tj+PKwZZSoBSDrOoPa4i1COFhRajXlGKFjwji1qiYWDMoP
	OnIs+0IY+lBQDtwuO80kY04QufzfMQCK2VSI1XqlG3OZ+zkXqTkIALWBzZGQp9Bmgmxo
	w6Ew==
X-Gm-Message-State: AOUpUlHRSAjLi2udZs8VvsFFgKtBP9tnbLEEmTQ7d74hDG/EQnquNc+p
	/pjDe8kmdXeIN30p+R1BCn4=
X-Received: by 2002:a62:6eca:: with SMTP id
	j193-v6mr127694pfc.256.1532572649147; 
	Wed, 25 Jul 2018 19:37:29 -0700 (PDT)
Received: from aurora.jms.id.au ([45.124.203.18])
	by smtp.gmail.com with ESMTPSA id
	x87-v6sm106681pfa.143.2018.07.25.19.37.24
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 25 Jul 2018 19:37:28 -0700 (PDT)
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
	Thu, 26 Jul 2018 12:07:21 +0930
From: Joel Stanley <joel@jms.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 26 Jul 2018 12:06:45 +0930
Message-Id: <20180726023645.13927-4-joel@jms.id.au>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180726023645.13927-1-joel@jms.id.au>
References: <20180726023645.13927-1-joel@jms.id.au>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: [Qemu-arm] [PATCH v3 3/3] arm: Add BBC micro:bit machine
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
Cc: Stefan Hajnoczi <stefanha@gmail.com>,
	=?UTF-8?q?Steffen=20G=C3=B6rtz?= <contrib@steffen-goertz.de>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	Jim Mussared <jim.mussared@gmail.com>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8blYTvZg4uLB

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
---
 hw/arm/Makefile.objs |  2 +-
 hw/arm/microbit.c    | 54 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 55 insertions(+), 1 deletion(-)
 create mode 100644 hw/arm/microbit.c

diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index e31875ec69bc..2798a257921d 100644
--- a/hw/arm/Makefile.objs
+++ b/hw/arm/Makefile.objs
@@ -36,4 +36,4 @@ obj-$(CONFIG_MSF2) += msf2-soc.o msf2-som.o
 obj-$(CONFIG_IOTKIT) += iotkit.o
 obj-$(CONFIG_FSL_IMX7) += fsl-imx7.o mcimx7d-sabre.o
 obj-$(CONFIG_ARM_SMMUV3) += smmu-common.o smmuv3.o
-obj-$(CONFIG_NRF51_SOC) += nrf51_soc.o
+obj-$(CONFIG_NRF51_SOC) += nrf51_soc.o microbit.o
diff --git a/hw/arm/microbit.c b/hw/arm/microbit.c
new file mode 100644
index 000000000000..ecf64e883f4f
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
+    arm_m_profile_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
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

