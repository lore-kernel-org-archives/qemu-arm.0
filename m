Received: by 10.182.105.169 with SMTP id gn9csp1646717obb;
        Mon, 2 Nov 2015 20:31:06 -0800 (PST)
X-Received: by 10.140.94.40 with SMTP id f37mr33891594qge.3.1446525064293;
        Mon, 02 Nov 2015 20:31:04 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p15si21265215qkl.19.2015.11.02.20.31.04
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Mon, 02 Nov 2015 20:31:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:45582 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZtTFP-0002QO-SV
	for alex.bennee@linaro.org; Mon, 02 Nov 2015 23:31:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55968)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ZtTFM-0002Jt-Tb
	for qemu-arm@nongnu.org; Mon, 02 Nov 2015 23:31:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ZtTFL-0000HL-Sp
	for qemu-arm@nongnu.org; Mon, 02 Nov 2015 23:31:00 -0500
Received: from mail-pa0-x230.google.com ([2607:f8b0:400e:c03::230]:33113)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1ZtTFJ-0000Fv-UK; Mon, 02 Nov 2015 23:30:58 -0500
Received: by pabfh17 with SMTP id fh17so6859095pab.0;
	Mon, 02 Nov 2015 20:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=nWFsPzVnF88WesAXvBhF//lGDEqOtURk61djr7VelQM=;
	b=PGOXHKFnjDxq8oHKk24EAvce8R3EqFa183Tiiy2SLpRK78QLjpYLqHFFCPooJHOa/+
	IoflGvOda6oeLpbINmWUQYRC+apHQdbzcjr8AsGskSoud5HY4Rtk3DHEg+Kz6yhsj0JX
	eO2KJVIH3QEIZVNBRPHWN5mqDvrFtdxRvXRrlrAH4rd0TESbSef0WoM+miRNwe3SD0uD
	QXgcuKjFtDR8jLRORudg1QBk+SvguNmXC56YVQjexsPuFtqvBOye4kWuzy06zhisZSF3
	jsdQBBee6kN0qYrMdJC/e8k9/PpE+r2E7JQC5nxQki5N8Yk3qCu7YooGqO1gqCZElNEw
	xRxw==
X-Received: by 10.68.57.238 with SMTP id l14mr31393137pbq.150.1446525057605;
	Mon, 02 Nov 2015 20:30:57 -0800 (PST)
Received: from localhost.localdomain (mobile-166-171-251-070.mycingular.net.
	[166.171.251.70]) by smtp.gmail.com with ESMTPSA id
	ey2sm26830137pbd.77.2015.11.02.20.30.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 02 Nov 2015 20:30:56 -0800 (PST)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
To: qemu-devel@nongnu.org
Date: Mon,  2 Nov 2015 20:30:36 -0800
Message-Id: <633702099477eb5c12575260a763bf4e150217df.1446428067.git.crosthwaite.peter@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1446428067.git.crosthwaite.peter@gmail.com>
References: <cover.1446428067.git.crosthwaite.peter@gmail.com>
In-Reply-To: <cover.1446428067.git.crosthwaite.peter@gmail.com>
References: <cover.1446428067.git.crosthwaite.peter@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c03::230
Cc: robh@kernel.org, qemu-arm@nongnu.org, linux@roeck-us.net
Subject: [Qemu-arm] [PATCH for-2.5 v3 2/3] arm: highbank: Defeature CPU
	override
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Kz/g4o7aMx+f

This board should not support CPU model override. This allows for
easier patching of the board with being able to rely on the CPU
type being correct.

Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
---

 hw/arm/highbank.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/hw/arm/highbank.c b/hw/arm/highbank.c
index be04b27..f2e248b 100644
--- a/hw/arm/highbank.c
+++ b/hw/arm/highbank.c
@@ -223,15 +223,13 @@ static void calxeda_init(MachineState *machine, enum cxmachines machine_id)
     MemoryRegion *sysmem;
     char *sysboot_filename;
 
-    if (!cpu_model) {
-        switch (machine_id) {
-        case CALXEDA_HIGHBANK:
-            cpu_model = "cortex-a9";
-            break;
-        case CALXEDA_MIDWAY:
-            cpu_model = "cortex-a15";
-            break;
-        }
+    switch (machine_id) {
+    case CALXEDA_HIGHBANK:
+        cpu_model = "cortex-a9";
+        break;
+    case CALXEDA_MIDWAY:
+        cpu_model = "cortex-a15";
+        break;
     }
 
     for (n = 0; n < smp_cpus; n++) {
@@ -240,11 +238,6 @@ static void calxeda_init(MachineState *machine, enum cxmachines machine_id)
         ARMCPU *cpu;
         Error *err = NULL;
 
-        if (!oc) {
-            error_report("Unable to find CPU definition");
-            exit(1);
-        }
-
         cpuobj = object_new(object_class_get_name(oc));
         cpu = ARM_CPU(cpuobj);
 
-- 
1.9.1

