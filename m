Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp2822050wru;
        Thu, 2 Aug 2018 22:25:13 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpdS0VENKSwifQ72sHcxmIX+nVAaAA4901gtmS5vvgya1pl4b8UcoB9nX8exnkMiCDFU6NrM
X-Received: by 2002:a37:d60f:: with SMTP id t15-v6mr2327613qki.316.1533273913419;
        Thu, 02 Aug 2018 22:25:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533273913; cv=none;
        d=google.com; s=arc-20160816;
        b=MCue+S/2GkdL3F5JGeGm0DiRU5XI0LRv73dNsvBLQrx9SsdNNjQ7wPqA+8Nr1EtAU4
         DfiyFU/nNkzYmSQcIBCGJ55cSiTVS5eHKvokfpKgt06xjwfRecKENb01aBZy03N/xrQQ
         9H8CHNdms7S3LW/TOrnfdE5qcoXGpgw0KZfCF8vAiaR5V5jIgm11jMzKFyLx8RWTNqa4
         ff1LJEAHQyRUukH+SxTpmK37faY13EMOnl7+glcLy79/FCXDhInOc2bHorVtOMt1A7yn
         iET2hyPeIOapV9xwF3ukPu5eP5pJ+ZeQAlA1/EscV9QmCIGAVc7rbF62KX+9sqkBru0g
         1Qbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=uVpIy0tbum8TS+4LeuR9ToTnLJtiAlEi8k9IZIn1ZjE=;
        b=uwyZBhVqbGCnjCascRInIQ3CjIAdMWUr5COs8ETnnji+C63pdChM79ZnWRzl0jfKqo
         OCDMsX/RfwTWVECmwZ/jyvjfPSlVm0k65JR6NJKh6VjW7V0a2wyW9gF/211E7Q1Ho6zo
         dzZuYOPWc1Xea2QQIEHby62P1Pvj/vfiHqj/a3vkzuKb97wyxu7ENhqD5XKQnexdftGw
         NHSrXa6GtcDXLEAWSm0nsOkKyjwYV/uAefq6qjEl4VFqGY+yDWKYpNzLjex4zCiX8Hu/
         03cr1464vuiF0L4ogmTEO8GqQlmH/y/bnPK/sAk2z7MF2brIzmtjIeTXoJmmwmlVZQEl
         pJoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nMwAWy+F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e1-v6si3470547qvo.202.2018.08.02.22.25.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 02 Aug 2018 22:25:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=nMwAWy+F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:49015 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1flSaO-0004EJ-VA
	for alex.bennee@linaro.org; Fri, 03 Aug 2018 01:25:13 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38989)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1flSXX-0001pa-IF
	for qemu-arm@nongnu.org; Fri, 03 Aug 2018 01:22:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1flSXW-0004w5-J0
	for qemu-arm@nongnu.org; Fri, 03 Aug 2018 01:22:15 -0400
Received: from mail-pl0-x241.google.com ([2607:f8b0:400e:c01::241]:42541)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1flSXU-0004uv-2F; Fri, 03 Aug 2018 01:22:12 -0400
Received: by mail-pl0-x241.google.com with SMTP id z7-v6so2044079plo.9;
	Thu, 02 Aug 2018 22:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=uVpIy0tbum8TS+4LeuR9ToTnLJtiAlEi8k9IZIn1ZjE=;
	b=nMwAWy+FgIlT34iAu1gKv8rw0O8YAGvx1k3JV0uGPVNcOp+lDdm9R5JaFEiCLhqOWI
	hlUoXp9Srk+0r467AKsOc6e/QDogeDhZZUPDgRqwI772OkwUF0SktbmDEDoB1NAuRWcC
	e+ZpNgT047hRlP6F/AsE+nLdYFSUoP5bjAolpGwwNvK++q3g0ujZBZTGGIvWenO5AyPM
	luqmPb8QiSvSfDHWKZBS+yhLzNj2aBm7fVlBaxLFN8f/kZvK4l4D2fk+5kAfX+rVq3xE
	rwnqd07kQLpz8snu8ci6dnEbnzolXsozk9h/vp5toHbR5UBllAcdaxFGUo14F88pvkoX
	Le3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=uVpIy0tbum8TS+4LeuR9ToTnLJtiAlEi8k9IZIn1ZjE=;
	b=nJTJtzAKPp/+MbUeYIfnqrC/1J5sfK549XittNE8KM1OWFTsgzisU7es/HqO9iDzZJ
	5KQ6loMgLO0PKYZ6V6X/F6W3TJ6KPZ88uQGQ4VMNSYNtsQOXTBJNR4QuSh5clUOsF2S1
	zN0nsDMYMZyCiCdGkD0XpbeXmVCqhDf+0qwqaBRYkE9oomDEGkaMmDht4d8jrJnQ5XS0
	2kQQ2bSZsJYFznrJDn42qECIoNrZ5eRr4gepE4kkRm8NkxWuiq7ek+oIDzuNy7PMsONM
	lm+vqqWZg/aJSWgQSSiO/nzR55brvoaU1dC2+rhOm9aAoB6cco1Cetuw/xm62o26X+bk
	BZHQ==
X-Gm-Message-State: AOUpUlGltw9De0aX3gkX/9kbmuIjGS8H03hBgZYCB9+uZYq+N7M+LNiW
	nN6i5GpbnKk+Z7+gUGEuk007wgg0
X-Received: by 2002:a17:902:8481:: with SMTP id
	c1-v6mr2117962plo.177.1533273731092; 
	Thu, 02 Aug 2018 22:22:11 -0700 (PDT)
Received: from aurora.jms.id.au ([45.124.203.18])
	by smtp.gmail.com with ESMTPSA id
	f67-v6sm9069888pfe.75.2018.08.02.22.22.06
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 02 Aug 2018 22:22:10 -0700 (PDT)
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
	Fri, 03 Aug 2018 14:52:03 +0930
From: Joel Stanley <joel@jms.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Fri,  3 Aug 2018 14:51:37 +0930
Message-Id: <20180803052137.10602-4-joel@jms.id.au>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180803052137.10602-1-joel@jms.id.au>
References: <20180803052137.10602-1-joel@jms.id.au>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::241
Subject: [Qemu-arm] [PATCH v4 3/3] arm: Add BBC micro:bit machine
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
X-TUID: pK/0SlypXDNp

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

