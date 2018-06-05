Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp32153wrq;
        Tue, 5 Jun 2018 14:18:46 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKL+15xl1LDDnfQ9vmgHIlALjvQ+ISq1EP0Gctn3I3S3sp/BGQYuYPwYB6ea2nlQ6pPnYLWo
X-Received: by 2002:a0c:b620:: with SMTP id f32-v6mr315158qve.3.1528233526120;
        Tue, 05 Jun 2018 14:18:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528233526; cv=none;
        d=google.com; s=arc-20160816;
        b=FMvPMOkJwQtT/L/Vj0SjgIjAgm0xh08g+AzRKW8/PfQgr6xhW/EYWbjwTpTABO7W1l
         VKTIYZ3b4RFA4kt4fFBDLVR6ob+CE9nYDtOHb4zdNDGHE8TZCwlbZBk8LHs7bIfK/C2c
         E1SZIcGuDZ70mZAKhrHr6O/0c/+7Al7it+b7ysxjgl/HPBlnS/yx4x+9axJ4FSaX6Y55
         lC+goY5Pva55FL0dPldEhK7oPHVgtLlgPPF1TfdwuqZVF7feAb0YOXgPQTlbUqXw4FQz
         xyBLSF0QuNgUSjIQUO4hi/bB7exRc6VTFM0GoQ/4RyU9xbhJkY7PbSihQKLQ538fBc7Q
         yuSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=xdBAyB3oORTvX3zUqZSismGCVuMu8pJJumfiEDcfo14=;
        b=M6xWQNMkjBRAzUYCDHK4KxLjfSofpU1iTv1FMTP9PkwuHGNSeoSiVSETe0CTWVOL69
         E5KbFvId5IMkzpMpZ62iTyxw1FlXm1ZC0D+FdStZhjlgjR7julKrOni/RngE0HSilQo8
         Rk3uiUNe7ggbGqfWZfuJeGyq9zQHESNgbCVEMk/vUseWrW1qss3mgRqbspfRge/hK5PV
         cUXK5xmxXe+JZw0s8EufHQdnka1KOHDm9OKkYCNzzLE17o4SqISyH4ue40yOD0p3Iw2D
         SIvCbm4N2Uk3T7PlQhhATwJQChC0kDy21mncU71uUGIjGLarUu3VN9ou/OXSVemDpZTX
         Ogzw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p124-v6si8589964qkd.304.2018.06.05.14.18.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Jun 2018 14:18:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49161 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fQJLp-0000wM-3V
	for alex.bennee@linaro.org; Tue, 05 Jun 2018 17:18:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42119)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fQJLe-0000w3-1W
	for qemu-arm@nongnu.org; Tue, 05 Jun 2018 17:18:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fQJLZ-0005O8-4r
	for qemu-arm@nongnu.org; Tue, 05 Jun 2018 17:18:34 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:51340 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fQJLY-0005Ns-Vl; Tue, 05 Jun 2018 17:18:29 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 147EAE44B5;
	Tue,  5 Jun 2018 21:18:28 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-99.ams2.redhat.com [10.36.116.99])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 69EF06B43F;
	Tue,  5 Jun 2018 21:18:26 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Alistair Francis <alistair@alistair23.me>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org
Date: Tue,  5 Jun 2018 23:18:25 +0200
Message-Id: <1528233505-25842-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Tue, 05 Jun 2018 21:18:28 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Tue, 05 Jun 2018 21:18:28 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH] hw/arm: Remove the deprecated xlnx-ep108 machine
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	Alistair Francis <alistair.francis@xilinx.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CQUveEivUbRh

It has been marked as deprecated since QEMU v2.11, so it is time to
remove this now. The xlnx-zcu102 machine is very much the same and
can be used as a replacement instead.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 hw/arm/xlnx-zcu102.c | 62 ++--------------------------------------------------
 qemu-doc.texi        |  5 -----
 2 files changed, 2 insertions(+), 65 deletions(-)

diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
index c70278c..f26fd8e 100644
--- a/hw/arm/xlnx-zcu102.c
+++ b/hw/arm/xlnx-zcu102.c
@@ -39,10 +39,6 @@ typedef struct XlnxZCU102 {
 #define ZCU102_MACHINE(obj) \
     OBJECT_CHECK(XlnxZCU102, (obj), TYPE_ZCU102_MACHINE)
 
-#define TYPE_EP108_MACHINE   MACHINE_TYPE_NAME("xlnx-ep108")
-#define EP108_MACHINE(obj) \
-    OBJECT_CHECK(XlnxZCU102, (obj), TYPE_EP108_MACHINE)
-
 static struct arm_boot_info xlnx_zcu102_binfo;
 
 static bool zcu102_get_secure(Object *obj, Error **errp)
@@ -73,8 +69,9 @@ static void zcu102_set_virt(Object *obj, bool value, Error **errp)
     s->virt = value;
 }
 
-static void xlnx_zynqmp_init(XlnxZCU102 *s, MachineState *machine)
+static void xlnx_zcu102_init(MachineState *machine)
 {
+    XlnxZCU102 *s = ZCU102_MACHINE(machine);
     int i;
     uint64_t ram_size = machine->ram_size;
 
@@ -183,60 +180,6 @@ static void xlnx_zynqmp_init(XlnxZCU102 *s, MachineState *machine)
     arm_load_kernel(s->soc.boot_cpu_ptr, &xlnx_zcu102_binfo);
 }
 
-static void xlnx_ep108_init(MachineState *machine)
-{
-    XlnxZCU102 *s = EP108_MACHINE(machine);
-
-    if (!qtest_enabled()) {
-        info_report("The Xilinx EP108 machine is deprecated, please use the "
-                    "ZCU102 machine (which has the same features) instead.");
-    }
-
-    xlnx_zynqmp_init(s, machine);
-}
-
-static void xlnx_ep108_machine_instance_init(Object *obj)
-{
-    XlnxZCU102 *s = EP108_MACHINE(obj);
-
-    /* EP108, we don't support setting secure or virt */
-    s->secure = false;
-    s->virt = false;
-}
-
-static void xlnx_ep108_machine_class_init(ObjectClass *oc, void *data)
-{
-    MachineClass *mc = MACHINE_CLASS(oc);
-
-    mc->desc = "Xilinx ZynqMP EP108 board (Deprecated, please use xlnx-zcu102)";
-    mc->init = xlnx_ep108_init;
-    mc->block_default_type = IF_IDE;
-    mc->units_per_default_bus = 1;
-    mc->ignore_memory_transaction_failures = true;
-    mc->max_cpus = XLNX_ZYNQMP_NUM_APU_CPUS + XLNX_ZYNQMP_NUM_RPU_CPUS;
-    mc->default_cpus = XLNX_ZYNQMP_NUM_APU_CPUS;
-}
-
-static const TypeInfo xlnx_ep108_machine_init_typeinfo = {
-    .name       = MACHINE_TYPE_NAME("xlnx-ep108"),
-    .parent     = TYPE_MACHINE,
-    .class_init = xlnx_ep108_machine_class_init,
-    .instance_init = xlnx_ep108_machine_instance_init,
-    .instance_size = sizeof(XlnxZCU102),
-};
-
-static void xlnx_ep108_machine_init_register_types(void)
-{
-    type_register_static(&xlnx_ep108_machine_init_typeinfo);
-}
-
-static void xlnx_zcu102_init(MachineState *machine)
-{
-    XlnxZCU102 *s = ZCU102_MACHINE(machine);
-
-    xlnx_zynqmp_init(s, machine);
-}
-
 static void xlnx_zcu102_machine_instance_init(Object *obj)
 {
     XlnxZCU102 *s = ZCU102_MACHINE(obj);
@@ -289,4 +232,3 @@ static void xlnx_zcu102_machine_init_register_types(void)
 }
 
 type_init(xlnx_zcu102_machine_init_register_types)
-type_init(xlnx_ep108_machine_init_register_types)
diff --git a/qemu-doc.texi b/qemu-doc.texi
index f00706b..2effe66 100644
--- a/qemu-doc.texi
+++ b/qemu-doc.texi
@@ -2965,11 +2965,6 @@ support page sizes < 4096 any longer.
 
 @section System emulator machines
 
-@subsection Xilinx EP108 (since 2.11.0)
-
-The ``xlnx-ep108'' machine has been replaced by the ``xlnx-zcu102'' machine.
-The ``xlnx-zcu102'' machine has the same features and capabilites in QEMU.
-
 @section Block device options
 
 @subsection "backing": "" (since 2.12.0)
-- 
1.8.3.1

