Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2145866wrt;
        Fri, 14 Dec 2018 06:51:57 -0800 (PST)
X-Google-Smtp-Source: AFSGD/UuL0a7+7nNj7C/8080yCRm/5WHqhvJ3vTgBO8h4rP/2gvI/SU/LuJA3tvxsCRgizJGIM6s
X-Received: by 2002:ac8:520f:: with SMTP id r15mr3037434qtn.167.1544799117895;
        Fri, 14 Dec 2018 06:51:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544799117; cv=none;
        d=google.com; s=arc-20160816;
        b=i6HtiuyOVJFZvL9QBGJ0mBfbzzFrJwmBz3IUNFgU1JCui+645EzE7/n3+A/oN+icnf
         nHx8HQ2s0t444KcXHsHl+sB67d4OGGlByipbfCkL0DGp2BgjaG1F2ec/BJikhnvf1BKF
         rN2MVZGltQRYMkTiDhdeejTepIW1YT+OLURbUCVAnnSzNCouF7S3ySXRtWEB9NFk/FVB
         1dB+S+r5voJzL9pD5Vf3DpgFV3nuFSp54X2wQEd+OIub+kJ3vTKnWSfLJYd3dWKwk1en
         fkNFAtbxWyRRIVBobr/raFOIy6AlGNs0Kq86r6dFb2CMxGjjbo5cQS6WL7RD2heb0ASM
         z2uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=FQ9AEQVWiuE/TMHwPotiAjfz6FVq+cZz/xyx2alSbGc=;
        b=REpUmBgZ7C0xBvPNMdJRsDwy/BOC7K0ngwM94V73yHII4ePrvbXgT66q7y3PnuzwGm
         s2oPsQXFWEOmdAN+dm3UefQFr5CEvQ6WSMgomd+v+PkrJKPk9GPHCNriycvpgOrjaUeh
         OddNk+F403id9hqNZD6U2BpCj6HQqtCJsNp2dRv2GDNscxQfS+wnlLWSxZTICMS3Lic5
         ZXOMOLwC5S7pp0o/0O5wtzZOBAdIrLgSdhVh337NUzzkf6KXm2FhkMWhHQw0POYNBwC5
         6QZ5ZkI0kSG9GyX8gK23tLwr8cS42B2DWcXB+tMcxSYKn3agD8PYRllQ4LfOEeWT+sq+
         JTgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of stefanha@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=stefanha@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <stefanha@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id a13si2589184qtp.35.2018.12.14.06.51.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Dec 2018 06:51:57 -0800 (PST)
Received-SPF: pass (google.com: domain of stefanha@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of stefanha@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=stefanha@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8822B315486E;
	Fri, 14 Dec 2018 14:51:56 +0000 (UTC)
Received: from localhost (unknown [10.36.118.25])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2DF485DA2A;
	Fri, 14 Dec 2018 14:51:52 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: jusual@mail.ru,
	Joel Stanley <joel@jms.id.au>,
	jim@groklearning.com,
	qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Steffen Gortz <qemu.ml@steffen-goertz.de>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH] microbit: make -kernel optional
Date: Fri, 14 Dec 2018 14:51:52 +0000
Message-Id: <20181214145152.27250-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Fri, 14 Dec 2018 14:51:57 +0000 (UTC)
X-TUID: eQTO352wC9tU

ARMv7M machine types support -kernel for ELF and raw image files.
Microbit programs are typically in Intel HEX (.hex) format.  The generic
loader supports .hex files but it doesn't work as expected:

  $ qemu-system-arm -M microbit -device loader,file=microbit.hex
  Guest image must be specified (using -kernel)

This error comes from armv7m_load_kernel() but we don't have -kernel in
this case.

This patch makes -kernel optional since most of the time we'll want to
use -device loader instead.

Note that we need to register the reset handler that
armv7m_load_kernel() used to register for us.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/arm/microbit.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/hw/arm/microbit.c b/hw/arm/microbit.c
index a734e7f650..638f638792 100644
--- a/hw/arm/microbit.c
+++ b/hw/arm/microbit.c
@@ -14,6 +14,7 @@
 #include "hw/arm/arm.h"
 #include "sysemu/sysemu.h"
 #include "exec/address-spaces.h"
+#include "qemu/error-report.h"
 
 #include "hw/arm/nrf51_soc.h"
 
@@ -28,6 +29,13 @@ typedef struct {
 #define MICROBIT_MACHINE(obj) \
     OBJECT_CHECK(MicrobitMachineState, obj, TYPE_MICROBIT_MACHINE)
 
+static void microbit_cpu_reset(void *opaque)
+{
+    ARMCPU *cpu = opaque;
+
+    cpu_reset(CPU(cpu));
+}
+
 static void microbit_init(MachineState *machine)
 {
     MicrobitMachineState *s = MICROBIT_MACHINE(machine);
@@ -41,8 +49,13 @@ static void microbit_init(MachineState *machine)
                              &error_fatal);
     object_property_set_bool(soc, true, "realized", &error_fatal);
 
-    armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
-                       NRF51_SOC(soc)->flash_size);
+    if (machine->kernel_filename) {
+        armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
+                           NRF51_SOC(soc)->flash_size);
+    } else {
+        /* armv7m_load_kernel() does this, we need to do it manually here */
+        qemu_register_reset(microbit_cpu_reset, ARM_CPU(first_cpu));
+    }
 }
 
 static void microbit_machine_class_init(ObjectClass *oc, void *data)
-- 
2.19.2
