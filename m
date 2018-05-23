Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp883355wre;
        Wed, 23 May 2018 09:04:07 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZp80CdzS/KBdsn9vjZ87Vt4eWCHT+E2VKLCOoxGFZLTRm+LipWedZY/quNZuPAmZLu7mfj5
X-Received: by 2002:aed:21d1:: with SMTP id m17-v6mr3204830qtc.351.1527091447611;
        Wed, 23 May 2018 09:04:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527091447; cv=none;
        d=google.com; s=arc-20160816;
        b=aew6xQYzGs7UM8kKtwLcS0Kz8nR8FKKhwPN1p6rbB49n6/LKpUpIGBQRy7dJFGlAlA
         yihXQc/5hBncMJhvE1A0eypAdEWn1ItEvCk5Ge8RZvSrP7ILlElaEHHi5BfHKnu5Ukwg
         cqilNWHRH5Kb62luLf59c/5XRwvMN/VnDyIEHtym/IhaKpsdkyBajV4TWt3LIeL0yki+
         TvZqWx6ITaTVXsmEJ7rel175tXQhZPHT8qnpJhj9u26//GENFzkv5CHnohEngMhQmp+K
         4zYQqFvjgqg7npazTnr6pQ/vVnoxLhq+oxAEgoK27+Go6noyECS73X2OjDGG1It4/e8b
         A7NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=1jekOkMgnUNUtVIpDFgqOfQERZ0YV8FNNim22fEtDBc=;
        b=YUvXkaFADeQUPm82Dlwg4PjFFgxV4MnuRqhlKoqKKFFJZ1BiGvGWLNT9sRnpS4CrfW
         VDJUXgohgHH/A/TyHqhwxFnGzufM6gorBGFjNSFkRvyUCfrmL3E6v8+WivZeV16s45Og
         gDniKtv9Gqi57tTHwvvjsSudeP5l6oMP3K+NtbNNpZwxGz/2Bbt/1CxPkUPDrooiMLEB
         Gp7QjYZcBfiArl1sqzvWAbdwrBQivroDurZr+e7rIcXFu6rQpRIhI7rH4hJfrozYmxRs
         oP2G9pcK0TCz4itbPqqEhMwJHfjjlQttpTRSy/4R2vBWLOojZtBJ3Ue8K3oM79bf06ui
         gwFQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e63-v6si48784qkj.192.2018.05.23.09.04.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 May 2018 09:04:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34371 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fLWFD-0002zn-5X
	for alex.bennee@linaro.org; Wed, 23 May 2018 12:04:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43295)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fLWEz-0002yU-7r
	for qemu-arm@nongnu.org; Wed, 23 May 2018 12:03:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fLWEy-0004Dm-BK
	for qemu-arm@nongnu.org; Wed, 23 May 2018 12:03:53 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:51874 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fLWEy-0004De-6j; Wed, 23 May 2018 12:03:52 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BCF724074C95;
	Wed, 23 May 2018 16:03:51 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-116-69.ams2.redhat.com
	[10.36.116.69])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 39B776B592;
	Wed, 23 May 2018 16:03:50 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org
Date: Wed, 23 May 2018 18:03:38 +0200
Message-Id: <1527091418-11874-3-git-send-email-eric.auger@redhat.com>
In-Reply-To: <1527091418-11874-1-git-send-email-eric.auger@redhat.com>
References: <1527091418-11874-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Wed, 23 May 2018 16:03:51 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Wed, 23 May 2018 16:03:51 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC 2/2] hw/arm/virt: Add virt-3.0 machine type
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
Cc: drjones@redhat.com, ard.biesheuvel@linaro.org, lersek@redhat.com,
	zhaoshenglong@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: e0plLv90DrhY

Add virt-3.0 machine type.

This machine type supports highmem 256MB ECAM by default.
This feature is disabled for earlier machine types and
if highmem is off.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/arm/virt.c         | 27 ++++++++++++++++++++++++---
 include/hw/arm/virt.h |  1 +
 2 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index a35550b..c24c306 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -1520,6 +1520,7 @@ static void virt_set_highmem(Object *obj, bool value, Error **errp)
     VirtMachineState *vms = VIRT_MACHINE(obj);
 
     vms->highmem = value;
+    vms->highmem_ecam &= value;
 }
 
 static bool virt_get_its(Object *obj, Error **errp)
@@ -1697,7 +1698,7 @@ static void machvirt_machine_init(void)
 }
 type_init(machvirt_machine_init);
 
-static void virt_2_12_instance_init(Object *obj)
+static void virt_3_0_instance_init(Object *obj)
 {
     VirtMachineState *vms = VIRT_MACHINE(obj);
     VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
@@ -1740,6 +1741,8 @@ static void virt_2_12_instance_init(Object *obj)
                                     "Set GIC version. "
                                     "Valid values are 2, 3 and host", NULL);
 
+    vms->highmem_ecam = vmc->no_highmem_ecam ? false : true;
+
     if (vmc->no_its) {
         vms->its = false;
     } else {
@@ -1765,10 +1768,28 @@ static void virt_2_12_instance_init(Object *obj)
     vms->irqmap = a15irqmap;
 }
 
-static void virt_machine_2_12_options(MachineClass *mc)
+static void virt_machine_3_0_options(MachineClass *mc)
 {
 }
-DEFINE_VIRT_MACHINE_AS_LATEST(2, 12)
+DEFINE_VIRT_MACHINE_AS_LATEST(3, 0)
+
+#define VIRT_COMPAT_2_12 \
+    HW_COMPAT_2_12
+
+static void virt_2_12_instance_init(Object *obj)
+{
+    virt_3_0_instance_init(obj);
+}
+
+static void virt_machine_2_12_options(MachineClass *mc)
+{
+    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
+
+    virt_machine_3_0_options(mc);
+    SET_MACHINE_COMPAT(mc, VIRT_COMPAT_2_12);
+    vmc->no_highmem_ecam = true;
+}
+DEFINE_VIRT_MACHINE(2, 12)
 
 #define VIRT_COMPAT_2_11 \
     HW_COMPAT_2_11
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index e9423a7..10a5c71 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -95,6 +95,7 @@ typedef struct {
     bool no_pmu;
     bool claim_edge_triggered_timers;
     bool smbios_old_sys_ver;
+    bool no_highmem_ecam;
 } VirtMachineClass;
 
 typedef struct {
-- 
2.5.5

