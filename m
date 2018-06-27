Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp6301898wrq;
        Wed, 27 Jun 2018 07:39:09 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpep9bUf3ftdz74AdNgQsFzWosJ2V2KxLaoYQKNm5B+S9ZJQLARTG7TEMp3pGXnrCHlcSBAN
X-Received: by 2002:a0c:c60f:: with SMTP id v15-v6mr4296688qvi.186.1530110349190;
        Wed, 27 Jun 2018 07:39:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530110349; cv=none;
        d=google.com; s=arc-20160816;
        b=Zj6PweV+1i7q2ejt6aTs09aTgRYHFvCNVAzBQbAvxLOb7mE6RD94Xl3a7o4jC/Lzmx
         P/l2lODs6IX4dKcqaUcbd2IiflSRXcwZGRNKoBEjJCgpeSnrENPMxEnEeF7OvBENDikv
         cTEmnfdC6nOUV8DhCUd6FpyHr9Iq0hvRBYWiDIDU1vyNfQELcYklT9OZigTJBdlCK8qx
         /xr0eQ1Nd1QVmHHvUmjwsDhvih9Dgf9X+v7sQd4f4PUxwnNtcfSF0X4569Sq76QADX83
         YxJZRERlQLIc2RO5v/P4BismJkcGH5vuMhrQPWdL4+uKywsyLAJt7QXPdfIemEXpxrFf
         Rf2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:arc-authentication-results;
        bh=nGxUklkLjq7dCfdwBnYMyDLlkJR5/TzIHyUQafAprEM=;
        b=aA5XMKV2f3/L4kcDyeikrwRFeQGlpbp42TOKNA4x4Py1pEL7t1ql3Ily0W9LzPhjud
         m1SWGSJnUAF95uyKwsHq9GzvCr311ULBAtKcyPq/2zX66+DL8WsMIkSMvGf7fUuVpRMJ
         1o/qfBHkxoUXPdmKqqad8HTmWPncsdo8sjdGj+JBZ0p4MAtG0QjjQArHomFUwfUl3w1r
         dumI9Q1XdkLxbdONX44ZDe5zBu3UYrS3C/QdScmxlVL0q7q2Tr/neUglLRyvnXt8YLnM
         6+Hnqj+WoWkF4UFFGlaNZds/GbIVKth1CynA4vIqTjD4ArwviC4YvppQFjyFpgk4dTEC
         oyxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=MvIiy3oj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h134-v6si1711173qka.244.2018.06.27.07.39.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 27 Jun 2018 07:39:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=MvIiy3oj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59697 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fYBbA-0004ik-GG
	for alex.bennee@linaro.org; Wed, 27 Jun 2018 10:39:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49570)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fYBax-0004hd-3m
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 10:38:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1fYBaw-0002yD-5e
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 10:38:55 -0400
Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243]:34962)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1fYBaq-0002vL-3M; Wed, 27 Jun 2018 10:38:48 -0400
Received: by mail-pg0-x243.google.com with SMTP id i7-v6so1016211pgp.2;
	Wed, 27 Jun 2018 07:38:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=nGxUklkLjq7dCfdwBnYMyDLlkJR5/TzIHyUQafAprEM=;
	b=MvIiy3ojGCvB/frUdZJDqzYMR+QaAFXEYiaLCM31ntBXmMbdD/x30sl0rw72V6Q+mn
	bFO7fWaC/H0XpRw7iVUAT4dEQLKx+yJ+39OPQRautFbIp4oU6JghGrHvpNhL1VBe3xNp
	ozy+0Rrv8hrP6cPBeadwBxzF2k91hA4glEOvHGmSW2cH8fAdM4P1Hyr7ZTnj9W9gyBxR
	OJlKzd6JmdttDbxhDiesMSEzF0vgu4QBMJuyVONBPOC8ODg1L+MmLDN5QHpdwznHlye7
	l3rgRaZjWYLq0aptBwCRulA/RCEEF0wA3yt7DnH82bhzC6GVruQgQHEYz9zw0wlzouBu
	ZMWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references;
	bh=nGxUklkLjq7dCfdwBnYMyDLlkJR5/TzIHyUQafAprEM=;
	b=gHXHNJxOLjinzVM48X4pqcH4hNSmgDs8IjE+/1L5HQZHs7M4o4iDKELW0+OYTSPdr4
	ELhywwEcpvqq7myrQREjPFX7Zec0ypRui9GFnvtUx3DTvW857QrfVlLqcPF2LcjAOhyr
	Uznp/Q8hzF9fRHz2ZpXiG/j4UUcW2ixBf2CTaoQLb/nrdkqQ3XIUpnrv44XB+KYz7ZiN
	WVUJyJIpWrr+oxWbdQ2cNqA2kaIx4MRd2aibn5R76y4hvS5b886FxhnrnPZwZLuc7ZaV
	K9JJFpF8IkN5gmUVpHKakedeq4AK5D+CycN0L3u3UUJsRCmjRmfdj0hKRf16NluSmy8l
	zavw==
X-Gm-Message-State: APt69E3qn7hZwelJVCj2N0TreBYOgXELn5O06LSow6PAZ2dfxJO0EwdR
	kSMhP4mU9wr+YilARSILaQk=
X-Received: by 2002:a62:4359:: with SMTP id
	q86-v6mr6217559pfa.140.1530110327020; 
	Wed, 27 Jun 2018 07:38:47 -0700 (PDT)
Received: from aurora.jms.id.au ([45.124.203.19])
	by smtp.gmail.com with ESMTPSA id
	u5-v6sm5169933pfg.63.2018.06.27.07.38.42
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 27 Jun 2018 07:38:46 -0700 (PDT)
Received: by aurora.jms.id.au (sSMTP sendmail emulation);
	Thu, 28 Jun 2018 00:08:39 +0930
From: Joel Stanley <joel@jms.id.au>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jun 2018 00:08:14 +0930
Message-Id: <20180627143815.1829-3-joel@jms.id.au>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180627143815.1829-1-joel@jms.id.au>
References: <20180627143815.1829-1-joel@jms.id.au>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::243
Subject: [Qemu-arm] [PATCH v2 2/3] arm: Add BBC micro:bit machine
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
X-TUID: T3phg63OBci+

This adds the base for a machine model of the BBC micro:bit:

  https://en.wikipedia.org/wiki/Micro_Bit

This is a system with a nRF51 SoC containing the main processor, with
various peripherals on board.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v2:
 - Instead of setting kernel filename property, load the image directly
 - Add link to hardware overview website
---
 hw/arm/Makefile.objs |  2 +-
 hw/arm/microbit.c    | 56 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 57 insertions(+), 1 deletion(-)
 create mode 100644 hw/arm/microbit.c

diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
index 68be73f1c3ff..cecbe41086a8 100644
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
index 000000000000..e9e0d35ca79c
--- /dev/null
+++ b/hw/arm/microbit.c
@@ -0,0 +1,56 @@
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
+#define FLASH_BASE      0x00000000
+#define FLASH_SIZE      (256 * 1024)
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
+    armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename, FLASH_SIZE);
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

