Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp707951wre;
        Fri, 1 Jun 2018 07:43:41 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJjV6Ptsr6n0aNzrPBCyHy6ZPfBZ5nWBulRSyYP2M91Bbu4YvuJjvoMbEJUMsePpvXpJFiq
X-Received: by 2002:ac8:21a7:: with SMTP id 36-v6mr3337523qty.252.1527864221691;
        Fri, 01 Jun 2018 07:43:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527864221; cv=none;
        d=google.com; s=arc-20160816;
        b=uVMp/I9YNnOueZVgnW+JvF4R/t8IU+k8gVMKKb0RNTi05BxETqXt8jLMoht+TNfQXx
         fbWjMJ9ZqWt4/a/pEv/fVoAWQ7sjKW+uDPqLGhiJfo7ggi54gzSD1DMdctR9ocKxPgFC
         2FXYS+d1Xm6KAD0nDNYq4BZPIL5NHHhLzHQ2n0mfjvFFgrA9+7AcU8V3pQozJn65irYN
         NkzUNiP1ox718ay6g4lGrs0spTi2HK0GYZViCQzRw+A677Roo2/ItgIsoRp+suOMPmM1
         /74ukCgqjk4+xRcHrY6E58xZKIZtrBqzap/wOn4zr8FxU1m36Je4Voe1SD+nmS3GmYjG
         dDrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=md5CzOwfzp6x9w0ab2GFuNtdfXVHTUCzNzCqNTcdzlk=;
        b=LdF4keUq45yyQXiB8EaX1OkpuT4oVQEzXXXKPABVXA4/ulTac9DlXSGL0TLAvzyFPV
         lZ98HFRG/6KQPezMOxB3F/lFs788yPK9UieoJMfvUI+GBsFcg9MaWlmNwjEc9jC0/W5R
         ScruOsXGL+GuI674l1Xa1chmaQ6MyZNWeOPSpvuBAdVEFtE5LN8xo3XoT87ZCyK2Lr/H
         RlWYxiMN1ciHmnr5fIf1m+9daTL44lNwBJjKXUnMUmKL1rkOKeGA+AnE8Rya2DWc0l74
         AaxDdjr0xQbOpbciVtOAEVcGyn8n49Ut7x45qQYF7JRtLZb/pvsY8+bQq5quqQpFFOAx
         10NA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u18-v6si10549954qvc.168.2018.06.01.07.43.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Jun 2018 07:43:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56073 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fOlHJ-0001nM-8X
	for alex.bennee@linaro.org; Fri, 01 Jun 2018 10:43:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46522)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fOlHB-0001nF-Nw
	for qemu-arm@nongnu.org; Fri, 01 Jun 2018 10:43:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fOlHA-0005Nw-QA
	for qemu-arm@nongnu.org; Fri, 01 Jun 2018 10:43:33 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:42372)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fOlHA-0005Mh-Is; Fri, 01 Jun 2018 10:43:32 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fOlH8-00047W-7x; Fri, 01 Jun 2018 15:43:30 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri,  1 Jun 2018 15:43:27 +0100
Message-Id: <20180601144328.23817-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180601144328.23817-1-peter.maydell@linaro.org>
References: <20180601144328.23817-1-peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 1/2] stellaris: Stop using armv7m_init()
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
Cc: Jim Mussared <jim@groklearning.com>,
	=?UTF-8?q?Steffen=20G=C3=B6rtz?= <mail@steffen-goertz.de>,
	patches@linaro.org, Joel Stanley <joel@jms.id.au>,
	Stefan Hajnoczi <stefanha@redhat.com>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TBX2iuPM8OMs

The stellaris board is still using the legacy armv7m_init() function,
which predates conversion of the ARMv7M into a proper QOM container
object. Make the board code directly create the ARMv7M object instead.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/stellaris.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index e886f54976..1b2c383e9f 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -20,6 +20,7 @@
 #include "qemu/log.h"
 #include "exec/address-spaces.h"
 #include "sysemu/sysemu.h"
+#include "hw/arm/armv7m.h"
 #include "hw/char/pl011.h"
 #include "hw/misc/unimp.h"
 #include "cpu.h"
@@ -1297,8 +1298,13 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
                            &error_fatal);
     memory_region_add_subregion(system_memory, 0x20000000, sram);
 
-    nvic = armv7m_init(system_memory, flash_size, NUM_IRQ_LINES,
-                       ms->kernel_filename, ms->cpu_type);
+    nvic = qdev_create(NULL, TYPE_ARMV7M);
+    qdev_prop_set_uint32(nvic, "num-irq", NUM_IRQ_LINES);
+    qdev_prop_set_string(nvic, "cpu-type", ms->cpu_type);
+    object_property_set_link(OBJECT(nvic), OBJECT(get_system_memory()),
+                                     "memory", &error_abort);
+    /* This will exit with an error if the user passed us a bad cpu_type */
+    qdev_init_nofail(nvic);
 
     qdev_connect_gpio_out_named(nvic, "SYSRESETREQ", 0,
                                 qemu_allocate_irq(&do_sys_reset, NULL, 0));
@@ -1430,6 +1436,8 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
     create_unimplemented_device("analogue-comparator", 0x4003c000, 0x1000);
     create_unimplemented_device("hibernation", 0x400fc000, 0x1000);
     create_unimplemented_device("flash-control", 0x400fd000, 0x1000);
+
+    armv7m_load_kernel(ARM_CPU(first_cpu), ms->kernel_filename, flash_size);
 }
 
 /* FIXME: Figure out how to generate these from stellaris_boards.  */
-- 
2.17.1

