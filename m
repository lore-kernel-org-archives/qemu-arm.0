Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp4644500wro;
        Mon, 29 Oct 2018 12:45:45 -0700 (PDT)
X-Google-Smtp-Source: AJdET5cgVedBygsN1PKzYNcWVAPVkdAiFyMbDZJAmIVj8bfZvi8DRAKAeoQd44FrL5Rz1nMHTmDR
X-Received: by 2002:a0c:e9cc:: with SMTP id q12mr14227690qvo.198.1540842345741;
        Mon, 29 Oct 2018 12:45:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540842345; cv=none;
        d=google.com; s=arc-20160816;
        b=HrRS4rQ9AR22bsYGS9wK0GzUViVU6+gxC8hKgOPZyHr5XlPri/EJvGHSHZJGuJyL19
         W3lZCl1n5rdzSn0khU7MKw1qycYrnDQAXRp+kQapCDzcEkIOGkbI7av0rwtWeo9MIpAe
         bng9XRf45Q3fJxKmoGZsKu6iz1VYVyE2L0LT+FCD8xD3Ap81lvCZ/3l70O9W24bGs6Ck
         SK8J4e3Ub/4yyEAWZ7XEmgM6jK6ZnQYVGDh9Y61yxzBtTr+jeXqWPb4dplS55oz9Vw/Z
         he7CS48Q53EKrHy/kdCx+Mf17pvJxSRQDAeU8Zv9I6eOEdm3rHw0PF0VGYvZAd140Gyf
         FlGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from;
        bh=pe4NJZozaW8mr20AMIWM/Qtmb+kRCQX540BhEgDsHKo=;
        b=UPYUl5yToKx6kccpPTyZZ7DpBIhCwlrjCkK5n9GUSW3VOehzusBIgjdABdFAAOfF14
         mosxHwhdxDlBOcbcG5KJ7tUh49Swx3yz/4xv9DyzOVbzCgb4tp5z/Y6xyKFAjt5JwSb2
         +wLza71RnWLYL/5Fo8sgTfpVGgeSA6GCd6cprXoYY9NoOZ9+T1fvX2eMnwmSLp7mC6Tt
         KlnSeqgcNNU+ZgvOvcuzF9JNgbPcaKFAPmeLfV1oO41Q5T6EqroouyzfJJz0sWzhK7OV
         ZIX6xOKVlwJRqxVHLQt0j6OMaUkFtShaJ6zbIEVDjWxFQQ5Si5CxxhMbtZFJU5w6v9gY
         rkCg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o4-v6si8178670qte.269.2018.10.29.12.45.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 29 Oct 2018 12:45:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48600 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gHDTt-0000iV-9x
	for alex.bennee@linaro.org; Mon, 29 Oct 2018 15:45:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46610)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1gHDTl-0000ha-Na
	for qemu-arm@nongnu.org; Mon, 29 Oct 2018 15:45:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1gHDTe-0006Zt-Ry
	for qemu-arm@nongnu.org; Mon, 29 Oct 2018 15:45:34 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33280)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1gHDTb-0006W2-BA; Mon, 29 Oct 2018 15:45:28 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1702F3082142;
	Mon, 29 Oct 2018 19:45:24 +0000 (UTC)
Received: from localhost (ovpn-116-92.ams2.redhat.com [10.36.116.92])
	by smtp.corp.redhat.com (Postfix) with ESMTP id EDB1D194AB;
	Mon, 29 Oct 2018 19:45:20 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: <qemu-devel@nongnu.org>
Date: Mon, 29 Oct 2018 19:45:19 +0000
Message-Id: <20181029194519.15628-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Mon, 29 Oct 2018 19:45:24 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH] microbit: do not rely on -kernel option
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
Cc: Peter Maydell <peter.maydell@linaro.org>, jim@groklearning.com,
	Steffen Gortz <qemu.ml@steffen-goertz.de>, qemu-arm@nongnu.org,
	Joel Stanley <joel@jms.id.au>,
	Stefan Hajnoczi <stefanha@redhat.com>, jusual@mail.ru
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: j+22EHn/C0vq

Microbit programs are typically in Intel HEX (.hex) format.  The generic
loader supports .hex files but it doesn't work as expected:

  $ qemu-system-arm -M microbit -device loader,file=microbit.hex
  Guest image must be specified (using -kernel)

This error comes from armv7m_load_kernel().  Don't try to use it.

Note that we need to register the reset handler that
armv7m_load_kernel() used to register for us.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/arm/microbit.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/hw/arm/microbit.c b/hw/arm/microbit.c
index e7d74116a5..c4263c05c0 100644
--- a/hw/arm/microbit.c
+++ b/hw/arm/microbit.c
@@ -13,6 +13,7 @@
 #include "hw/boards.h"
 #include "hw/arm/arm.h"
 #include "exec/address-spaces.h"
+#include "qemu/error-report.h"
 
 #include "hw/arm/nrf51_soc.h"
 
@@ -27,6 +28,13 @@ typedef struct {
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
@@ -39,8 +47,12 @@ static void microbit_init(MachineState *machine)
                              &error_fatal);
     object_property_set_bool(soc, true, "realized", &error_fatal);
 
-    armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
-                       NRF51_SOC(soc)->flash_size);
+    if (machine->kernel_filename) {
+        error_report("-device loader,file=<filename> must be used instead of -kernel");
+        exit(1);
+    }
+
+    qemu_register_reset(microbit_cpu_reset, ARM_CPU(first_cpu));
 }
 
 static void microbit_machine_class_init(ObjectClass *oc, void *data)
-- 
2.17.2

