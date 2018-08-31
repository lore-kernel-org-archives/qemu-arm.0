Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1083809wrd;
        Fri, 31 Aug 2018 15:12:40 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdYcBIHYfRrDzzgdBthNhWxihN3+fHG8l1Q9Fc1xa3fp4LUJTVsRUDoF67wFaBZxLVs3zhy4
X-Received: by 2002:ac8:4283:: with SMTP id o3-v6mr18384134qtl.28.1535753560312;
        Fri, 31 Aug 2018 15:12:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535753560; cv=none;
        d=google.com; s=arc-20160816;
        b=SEWfXlChBVGfj78JPpet6gOXpMMqeK/4B7YAE2JdLcEEl9APcnbRswtzfdvbpeAQ92
         apQeyiMcs4ztqBTpaHliZbfDgSwrhXOWWEpTx0XHDhzCC8mGEBcK235CQjLe1Gq6k7YE
         8LUPjrnfCS3e8EH6b5tyef6n54K5XFf0ZjhXmvy7jojq4WfaKGA9Xi0VmmsCKM7PwlCl
         61KCiWFo0Ulb9oI3bufZN13FrQggTM9IluKg+Owf7YceK72fo2+r/qBLb9QsHAZVG8RH
         phkxxNONF3pfXqvzxVPqYZzJKu+ZyeFY6CctBRRCssmmUHn1EAwXN1ndsoNVah65GXUk
         vZvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=HECvTG3GejFa6sz+CKKWy/jQ+RL2N8C5303UsdeGdog=;
        b=HSs/EHC7zgXpL4jsI9qfdPMlI0Wq3iDR+LX9B5dA9jorsgUqEp+eQ7xZUB94c2ncCW
         L9kvRRMcVN5wSEdR8t4qkIY1VDx68qLwt6WOUkDq2PGUC4Dl8sdR65D3DO5TWUh8XK2f
         UasA/mGT3KTMN+gj+3SfYtL/ulIz6ic2caNnmUEpIp7akDfqpODP1a8WDCeIdDwT86Jr
         WetY3xfWWE8JtqhYsg6Wtl7wQSPtzy21/BKeMNG77U26aRz0pFZYhP85w8Syhu9QXoR3
         iHMmpgBoIYhnji7IjG3y2XhKvh6ha/dYxfmd+Ohfi02yxTg8YFpBpf0FFgC530OXEEvp
         xosw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=sA68YOl8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j31-v6si240300qtd.364.2018.08.31.15.12.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 31 Aug 2018 15:12:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=sA68YOl8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58654 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fvreh-0007M9-Og
	for alex.bennee@linaro.org; Fri, 31 Aug 2018 18:12:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52551)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fvrc1-0004o4-Qx
	for qemu-arm@nongnu.org; Fri, 31 Aug 2018 18:09:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fvrbv-00051i-0H
	for qemu-arm@nongnu.org; Fri, 31 Aug 2018 18:09:53 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:44590)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1fvrbm-0004mb-QK; Fri, 31 Aug 2018 18:09:39 -0400
Received: by mail-pg1-x541.google.com with SMTP id r1-v6so6013674pgp.11;
	Fri, 31 Aug 2018 15:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=HECvTG3GejFa6sz+CKKWy/jQ+RL2N8C5303UsdeGdog=;
	b=sA68YOl8VGfUR9TaJJ97poZ/p6f4/6xoFgdPPa+z1btWMz6PoJgbY3nubQkzUmqv5Z
	YI89b7PDtwTNk1mhXFpi/azMGIJ5A7+78KPXCSqxUuiUpzkELDxoft4+V8xUtiovhcjK
	GyDG5VBdVetQSbsFbwZJghcXm7MZ0eqgC57qY3nMwVSsJ7dnN/cQUrCforvluGIA5XNc
	JAFaWHQ2uyFefcsjRRog4aYV8I9WFPiG5qIpSdjpKhqyKu44qKSZCJUPdmY9lL1uH8C5
	sA6PkKVPSTxHtVxWICy7mcM9bovhWJAFXaOo9ywnZUc/xxiNWsO3a8pL7bxU5A4XXOwx
	lf9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=HECvTG3GejFa6sz+CKKWy/jQ+RL2N8C5303UsdeGdog=;
	b=bfedXGFS/vwDEMiUpxTWqMkXOZqL41xlmjo6uJDRSET48BqBkPEFdYce72TdYck1l8
	1fC9h9DwvXtJ/B8v9M7LV82ff6ZM2Uo+RVoJwIB1qRxs1htFeczNSpqJFPdZqFGARvXT
	8QfHVddMcpdlBPQQKOYtFV59Vp7cydO7KkxdnExKqa/m432sQEbvPzBKZqnk/iX9EwAS
	El5hJsVv0XdDGwTtlBlG3Ko9VC7NjQtmj6rCXCkGESrkfUTY4cfm6BATkQejzXkfnRpU
	OZMDPLti3+DMW+MQwkUEz4p7ENOGPuPJNr/gOUOoxEOTsHdnSoK0pLKvij9z3s20BoYr
	b5sw==
X-Gm-Message-State: APzg51BIi0lubTlN7PXS/bh8JuIG3uSuKFTaW0EVHkjsrAXM+xvQPEX7
	Syd4HXFIIR0oz0c0kqUga7c=
X-Received: by 2002:a63:2354:: with SMTP id
	u20-v6mr1602019pgm.122.1535753374402; 
	Fri, 31 Aug 2018 15:09:34 -0700 (PDT)
Received: from aurora.jms.id.au ([72.28.92.217])
	by smtp.gmail.com with ESMTPSA id
	d12-v6sm16634207pfk.69.2018.08.31.15.09.32
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 31 Aug 2018 15:09:33 -0700 (PDT)
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
	Fri, 31 Aug 2018 15:09:32 -0700
From: Joel Stanley <joel@jms.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 31 Aug 2018 15:09:20 -0700
Message-Id: <20180831220920.27113-4-joel@jms.id.au>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180831220920.27113-1-joel@jms.id.au>
References: <20180831220920.27113-1-joel@jms.id.au>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::541
Subject: [Qemu-arm] [PATCH v6 3/3] arm: Add BBC micro:bit machine
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
X-TUID: VrQiXBoNLIg+

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
v6:
 - MICROBITMachineState -> MicrobitMachineState
 - Rework machine type init with PMM's suggestions
---
 hw/arm/Makefile.objs |  2 +-
 hw/arm/microbit.c    | 67 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 68 insertions(+), 1 deletion(-)
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
index 000000000000..e7d74116a504
--- /dev/null
+++ b/hw/arm/microbit.c
@@ -0,0 +1,67 @@
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
+} MicrobitMachineState;
+
+#define TYPE_MICROBIT_MACHINE MACHINE_TYPE_NAME("microbit")
+
+#define MICROBIT_MACHINE(obj) \
+    OBJECT_CHECK(MicrobitMachineState, obj, TYPE_MICROBIT_MACHINE)
+
+static void microbit_init(MachineState *machine)
+{
+    MicrobitMachineState *s = MICROBIT_MACHINE(machine);
+    MemoryRegion *system_memory = get_system_memory();
+    Object *soc = OBJECT(&s->nrf51);
+
+    sysbus_init_child_obj(OBJECT(machine), "nrf51", soc, sizeof(s->nrf51),
+                          TYPE_NRF51_SOC);
+    object_property_set_link(soc, OBJECT(system_memory), "memory",
+                             &error_fatal);
+    object_property_set_bool(soc, true, "realized", &error_fatal);
+
+    armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
+                       NRF51_SOC(soc)->flash_size);
+}
+
+static void microbit_machine_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+
+    mc->desc = "BBC micro:bit";
+    mc->init = microbit_init;
+    mc->max_cpus = 1;
+}
+
+static const TypeInfo microbit_info = {
+    .name = TYPE_MICROBIT_MACHINE,
+    .parent = TYPE_MACHINE,
+    .instance_size = sizeof(MicrobitMachineState),
+    .class_init = microbit_machine_class_init,
+};
+
+static void microbit_machine_init(void)
+{
+    type_register_static(&microbit_info);
+}
+
+type_init(microbit_machine_init);
-- 
2.17.1

