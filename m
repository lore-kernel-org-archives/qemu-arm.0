Received: by 10.28.71.155 with SMTP id m27csp5683364wmi;
        Wed, 4 Apr 2018 23:09:35 -0700 (PDT)
X-Google-Smtp-Source: AIpwx485GpfBN219y0WNuSG7hti1nDZgpFr5BIxclavr4bfBbu0ABc+Vr9eUuehumDXJvZy46ked
X-Received: by 10.55.32.71 with SMTP id g68mr27330176qkg.129.1522908575051;
        Wed, 04 Apr 2018 23:09:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1522908575; cv=none;
        d=google.com; s=arc-20160816;
        b=jufO484IB8g1LM6a9ShwcRFPIa1L8sVoyvwF+iASw+W64vDNuqz+dJ6kNoTDIT9fqi
         jQ4FcH5lR00n8hQJ4vXQ7VdVrrf/LhPkkQcqhzmcLXLa5D2W/cp8QX9DmPg0GGHFlKRr
         yOCnczcycKqAE1Zl1MAge7zPu/KjdI1nOrWdXEU6N2u1V0wH+co/OhOXWxw4C0xTCoIC
         rTqpswiOyadfEZ5GPR9iONqyNu2T//DECzG6bSf/zMKTYUjc/+gDEtHVpsjQm3kMlpOn
         pQDvJF05Eup7l63Y4jtGKDUbBJlX6FAqSHZUhnbF3cDrDde9LAg+oYq9awZzzjz6EEPr
         oQ2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=joq29DYUnQeIXmJskBboxcivhXOV7eosXjtkfVs0W3Q=;
        b=oh7zHHQ0abnH40CHnH309NlMbZe0tUTj3IbzJlYh2SbfD4GU/96MK1P5XNrnd3KzOp
         aot3C2riFeuDZM0auWu1/32L5Oa8/gJSykWo8NNS0aJ0+QljKe4xqLczGLxdv6FE4usn
         TkdR4KbXYzdhfN07TGIQceo2KCgwpF5O0aijTD/Ebhm7AE74CMgSjZAb62q4Q0k/6YPk
         V1IV9nG94rh/XLHqZaHyxxb72vMRtPl8svzZkRSs/13jBPS6R7Wl4GFgHEex3M0QMBRZ
         I7ZCIhBVuHhVGjOeAKZ1QK0Xzo8APQFtkYlQRgHrOk9Z9Am8PPJKLPU1tNJYpuMDrl03
         Ucvw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t9si550499qtg.216.2018.04.04.23.09.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 04 Apr 2018 23:09:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60931 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f3y5W-0006es-Ht
	for alex.bennee@linaro.org; Thu, 05 Apr 2018 02:09:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51136)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1f3y5N-0006d0-Ky
	for qemu-arm@nongnu.org; Thu, 05 Apr 2018 02:09:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1f3y5J-0008CY-Io
	for qemu-arm@nongnu.org; Thu, 05 Apr 2018 02:09:25 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:50790 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1f3y5J-0008BQ-Dn; Thu, 05 Apr 2018 02:09:21 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5F35A404084A;
	Thu,  5 Apr 2018 06:09:17 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-84.ams2.redhat.com [10.36.116.84])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 599AC1208F6C;
	Thu,  5 Apr 2018 06:09:12 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Date: Thu,  5 Apr 2018 08:09:11 +0200
Message-Id: <1522908551-14885-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Thu, 05 Apr 2018 06:09:17 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Thu, 05 Apr 2018 06:09:17 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH for-2.12] hw/arm/fsl-imx: Fix introspection
 problem with fsl-imx6 and fsl-imx7
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wGAbZQtV++Ag

QEMU currently exits unexpectedly when trying to introspect the fsl-imx6
and fsl-imx7 devices on systems with many SMP CPUs:

$ echo "{'execute':'qmp_capabilities'}"\
       "{'execute':'device-list-properties',"\
       " 'arguments':{'typename':'fsl,imx6'}}" \
       | arm-softmmu/qemu-system-arm -M virt,accel=qtest -qmp stdio -smp 8
{"QMP": {"version": {"qemu": {"micro": 91, "minor": 11, "major": 2},
 "package": "build-all"}, "capabilities": []}}
{"return": {}}
fsl,imx6: Only 4 CPUs are supported (8 requested)

And:

$ echo "{'execute':'qmp_capabilities'}"\
       "{'execute':'device-list-properties',"\
       " 'arguments':{'typename':'fsl,imx7'}}" \
       | arm-softmmu/qemu-system-arm -M raspi2,accel=qtest -qmp stdio
{"QMP": {"version": {"qemu": {"micro": 91, "minor": 11, "major": 2},
 "package": "build-all"}, "capabilities": []}}
{"return": {}}
fsl,imx7: Only 2 CPUs are supported (4 requested)

This happens because these devices are doing an exit() from their
instance_init function - which should never be done since instance_init
can be called at any time for device introspection! Fix it by moving
the deadly check into the realize() function instead.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/fsl-imx6.c | 14 +++++++-------
 hw/arm/fsl-imx7.c | 13 +++++++------
 2 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/hw/arm/fsl-imx6.c b/hw/arm/fsl-imx6.c
index b6ac72d..9dfbc9a 100644
--- a/hw/arm/fsl-imx6.c
+++ b/hw/arm/fsl-imx6.c
@@ -37,13 +37,7 @@ static void fsl_imx6_init(Object *obj)
     char name[NAME_SIZE];
     int i;
 
-    if (smp_cpus > FSL_IMX6_NUM_CPUS) {
-        error_report("%s: Only %d CPUs are supported (%d requested)",
-                     TYPE_FSL_IMX6, FSL_IMX6_NUM_CPUS, smp_cpus);
-        exit(1);
-    }
-
-    for (i = 0; i < smp_cpus; i++) {
+    for (i = 0; i < MIN(smp_cpus, FSL_IMX6_NUM_CPUS); i++) {
         object_initialize(&s->cpu[i], sizeof(s->cpu[i]),
                           "cortex-a9-" TYPE_ARM_CPU);
         snprintf(name, NAME_SIZE, "cpu%d", i);
@@ -119,6 +113,12 @@ static void fsl_imx6_realize(DeviceState *dev, Error **errp)
     uint16_t i;
     Error *err = NULL;
 
+    if (smp_cpus > FSL_IMX6_NUM_CPUS) {
+        error_setg(errp, "%s: Only %d CPUs are supported (%d requested)",
+                   TYPE_FSL_IMX6, FSL_IMX6_NUM_CPUS, smp_cpus);
+        return;
+    }
+
     for (i = 0; i < smp_cpus; i++) {
 
         /* On uniprocessor, the CBAR is set to 0 */
diff --git a/hw/arm/fsl-imx7.c b/hw/arm/fsl-imx7.c
index 26ef36c..390b431 100644
--- a/hw/arm/fsl-imx7.c
+++ b/hw/arm/fsl-imx7.c
@@ -35,13 +35,8 @@ static void fsl_imx7_init(Object *obj)
     char name[NAME_SIZE];
     int i;
 
-    if (smp_cpus > FSL_IMX7_NUM_CPUS) {
-        error_report("%s: Only %d CPUs are supported (%d requested)",
-                     TYPE_FSL_IMX7, FSL_IMX7_NUM_CPUS, smp_cpus);
-        exit(1);
-    }
 
-    for (i = 0; i < smp_cpus; i++) {
+    for (i = 0; i < MIN(smp_cpus, FSL_IMX7_NUM_CPUS); i++) {
         object_initialize(&s->cpu[i], sizeof(s->cpu[i]),
                           ARM_CPU_TYPE_NAME("cortex-a7"));
         snprintf(name, NAME_SIZE, "cpu%d", i);
@@ -197,6 +192,12 @@ static void fsl_imx7_realize(DeviceState *dev, Error **errp)
     qemu_irq irq;
     char name[NAME_SIZE];
 
+    if (smp_cpus > FSL_IMX7_NUM_CPUS) {
+        error_setg(errp, "%s: Only %d CPUs are supported (%d requested)",
+                   TYPE_FSL_IMX7, FSL_IMX7_NUM_CPUS, smp_cpus);
+        return;
+    }
+
     for (i = 0; i < smp_cpus; i++) {
         o = OBJECT(&s->cpu[i]);
 
-- 
1.8.3.1

