Received: by 10.182.105.169 with SMTP id gn9csp294581obb;
        Sat, 7 Nov 2015 07:26:01 -0800 (PST)
X-Received: by 10.31.169.9 with SMTP id s9mr20777352vke.103.1446909961435;
        Sat, 07 Nov 2015 07:26:01 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h73si4745394vkc.22.2015.11.07.07.26.01
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Sat, 07 Nov 2015 07:26:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44294 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1Zv5NR-0006kO-1W
	for alex.bennee@linaro.org; Sat, 07 Nov 2015 10:26:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51359)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1Zv5N7-0006Tf-2D
	for qemu-devel@nongnu.org; Sat, 07 Nov 2015 10:25:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1Zv5N6-0007P6-5C
	for qemu-devel@nongnu.org; Sat, 07 Nov 2015 10:25:41 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38866)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>)
	id 1Zv5N0-0007OX-Rc; Sat, 07 Nov 2015 10:25:35 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id A29C6C0AEE45;
	Sat,  7 Nov 2015 15:25:33 +0000 (UTC)
Received: from hawk.localdomain.com (ovpn-116-23.ams2.redhat.com
	[10.36.116.23])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tA7FPU6r007179; Sat, 7 Nov 2015 10:25:31 -0500
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Date: Sat,  7 Nov 2015 09:25:25 -0600
Message-Id: <1446909925-12201-1-git-send-email-drjones@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org
Subject: [Qemu-devel] [PATCH] hw/arm/virt: error_report cleanups
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: pz5UDSDO3ccx

Signed-off-by: Andrew Jones <drjones@redhat.com>
---
 hw/arm/virt.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 77d9267599b7e..9c6792cea16f6 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -941,8 +941,8 @@ static void machvirt_init(MachineState *machine)
     if (!gic_version) {
         gic_version = kvm_arm_vgic_probe();
         if (!gic_version) {
-            error_report("Unable to determine GIC version supported by host\n"
-                         "Probably KVM acceleration is not supported\n");
+            error_report("Unable to determine GIC version supported by host");
+            error_printf("KVM acceleration is probably not supported\n");
             exit(1);
         }
     }
@@ -990,7 +990,7 @@ static void machvirt_init(MachineState *machine)
         char *cpuopts = g_strdup(cpustr[1]);
 
         if (!oc) {
-            fprintf(stderr, "Unable to find CPU definition\n");
+            error_report("Unable to find CPU definition");
             exit(1);
         }
         cpuobj = object_new(object_class_get_name(oc));
@@ -1126,8 +1126,8 @@ static void virt_set_gic_version(Object *obj, const char *value, Error **errp)
     } else if (!strcmp(value, "host")) {
         vms->gic_version = 0; /* Will probe later */
     } else {
-        error_report("Invalid gic-version option value\n"
-                     "Allowed values are: 3, 2, host\n");
+        error_report("Invalid gic-version option value");
+        error_printf("Allowed gic-version values are: 3, 2, host\n");
         exit(1);
     }
 }
-- 
2.4.3

