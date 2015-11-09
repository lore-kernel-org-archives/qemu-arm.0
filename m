Received: by 10.182.105.169 with SMTP id gn9csp1007254obb;
        Sun, 8 Nov 2015 23:11:03 -0800 (PST)
X-Received: by 10.140.142.147 with SMTP id 141mr10949968qho.24.1447053063776;
        Sun, 08 Nov 2015 23:11:03 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w16si10120227qkw.64.2015.11.08.23.11.03
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Sun, 08 Nov 2015 23:11:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:50531 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZvgbX-0007WO-Ex
	for alex.bennee@linaro.org; Mon, 09 Nov 2015 02:11:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42320)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ZvgbV-0007T6-69
	for qemu-arm@nongnu.org; Mon, 09 Nov 2015 02:11:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ZvgbU-0008Ec-Fg
	for qemu-arm@nongnu.org; Mon, 09 Nov 2015 02:11:01 -0500
Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b]:34471)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1ZvgbS-0008DZ-2e; Mon, 09 Nov 2015 02:10:58 -0500
Received: by padhx2 with SMTP id hx2so181638737pad.1;
	Sun, 08 Nov 2015 23:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=4UEETkotUhwkp8mnnkyZDyT+8QtLKgnNMLLUqbDluZQ=;
	b=TGvJUhgtDown+1lkdMGMtaX5p4MV4kLnUsqUnd4HxP/YQeahy6ndoP4JviVErmibmn
	RpV5nue2rWNGZNvpPBJchq3Qee85VX59hEy20i6GwGqGvOawV2N8umBEy88CZodHTkqw
	N5rpcPpPics8ZaXZ8GMstyGNqUL9COT8UzdpE8XJ+QUDzXmo2M/Gq+g01/Nxzgx1tusY
	+76wVdugXD2LvmFPWLZft+fUCyry15UOhBeVdoITnsG2KJVKLuraFe4jt5q9GfzcB8DN
	42QEe3Sg78bsJDDKNpA+SJfqXUnFUAImT0KtsTbzeYBYjxZm88pKTGwPxy8NmQmEtdLM
	Rl2A==
X-Received: by 10.66.120.136 with SMTP id lc8mr37832420pab.19.1447053057472;
	Sun, 08 Nov 2015 23:10:57 -0800 (PST)
Received: from localhost.localdomain (mobile-166-171-248-219.mycingular.net.
	[166.171.248.219]) by smtp.gmail.com with ESMTPSA id
	vl1sm14294818pbc.31.2015.11.08.23.10.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 08 Nov 2015 23:10:56 -0800 (PST)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun,  8 Nov 2015 23:10:33 -0800
Message-Id: <471a61e049c7ca6e82f5ef6668889a1d518c7e00.1447007690.git.crosthwaite.peter@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1447007690.git.crosthwaite.peter@gmail.com>
References: <cover.1447007690.git.crosthwaite.peter@gmail.com>
In-Reply-To: <cover.1447007690.git.crosthwaite.peter@gmail.com>
References: <cover.1447007690.git.crosthwaite.peter@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c03::22b
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, linux@roeck-us.net,
	robh@kernel.org
Subject: [Qemu-arm] [PATCH for-2.5 v4 2/3] arm: highbank: Defeature CPU
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
X-TUID: oHqI0HnRBdOS

This board should not support CPU model override. This allows for
easier patching of the board with being able to rely on the CPU
type being correct.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
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

