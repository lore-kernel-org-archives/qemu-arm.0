Received: by 10.28.4.212 with SMTP id 203csp2847146wme;
        Mon, 7 May 2018 04:13:18 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZpcYtJYNtKq09viqhdr7ZtOgXyYuRFMw2utHejCrY5P2ZGJmHbaGpt9x2E5whyxCjrb6iH+
X-Received: by 10.55.27.97 with SMTP id b94mr28388692qkb.281.1525691598454;
        Mon, 07 May 2018 04:13:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525691598; cv=none;
        d=google.com; s=arc-20160816;
        b=hL3htndDvG0g7JGjGAg4/3hwVu9ctXFBLf9kgVij9gTpdMS+jXdQEzgLbeTw96ILNx
         BUMf3Jq6ku2VIvhVveB0Q++45Zsr+fxw476Yem+Cgk5dZUCbcVrxKzEPQicwC05gJROA
         oa9icJ7pT0urghyhGRTQRkSLiCBaxHBQRqA7O+BOeJ+IUPGpYd5tWyMVbOHg1y1p/xvQ
         61F9ImvN2QrELclL9dHmlbniwNQtReLqABogyGKtJveCM6kaVwoxbrEvPCrFWx+IDuy5
         nO2q5PV4lJntJgLzout2a0ubjVMx06qCe4iN7nBx88DZ9kuClaFdQwAUSnSdfwSYhj6S
         A6gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=X1fcl8nzoLQCEY4rUTRT0TZbWYc1xE4ykLz/Eignwtg=;
        b=js9H+z7fU8WgpjI8vCUxKYYuq78JhMK7kf0K/hBRKNY7OeZh7Kuj48pt/yrzC0yBOi
         9O45ZBXlHH9mgUQwJyckGRWeh7awyXIotM6iwXMcPcmCL8spUikeqKOOnxH4+6PPsA99
         bYCraGqj1eXe0CELNWeiDmh0H1qK4yw4HOPAH8S53g4mttywIQIGcLsmDuPrtwBFpqGa
         1ayH5HT3iUqsC7v9HTkaI5qOsZ8wy0D+ZZwkGy+uZ+qtsUHzMwhTLaE4VFVrS4liHCF6
         5D/uU9oD3/mj7K6WN1IkE3AF2c5wOKOVlvs88IUIwDkMqz5SL5Lta/oYAzJxQ63BOgu5
         Hz2g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a21-v6si7252671qtp.111.2018.05.07.04.13.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 07 May 2018 04:13:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45217 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fFe4z-0002Fn-KF
	for alex.bennee@linaro.org; Mon, 07 May 2018 07:13:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59435)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1fFe4n-0002F4-Gt
	for qemu-arm@nongnu.org; Mon, 07 May 2018 07:13:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1fFe4j-00076k-DY
	for qemu-arm@nongnu.org; Mon, 07 May 2018 07:13:05 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:36780 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1fFe4j-00076P-8K; Mon, 07 May 2018 07:13:01 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 720BF40201A5;
	Mon,  7 May 2018 11:12:58 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CCE9A7C5D;
	Mon,  7 May 2018 11:12:57 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  7 May 2018 13:12:01 +0200
Message-Id: <1525691524-32265-2-git-send-email-imammedo@redhat.com>
In-Reply-To: <1525691524-32265-1-git-send-email-imammedo@redhat.com>
References: <1525691524-32265-1-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Mon, 07 May 2018 11:12:58 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Mon, 07 May 2018 11:12:58 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'imammedo@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v4 1/4] pc: simplify
 MachineClass::get_hotplug_handler handling
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iKhsAZMdfTWw

By default MachineClass::get_hotplug_handler is NULL and concrete board
should set it to it's own handler.
Considering there isn't any default handler, drop saving empty
MachineClass::get_hotplug_handler in child class and make PC code
consistent with spapr/s390x boards.

We can bring this back when actual usecase surfaces and do it
consistently across boards that use get_hotplug_handler().

Suggested-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
---
 include/hw/i386/pc.h | 8 --------
 hw/i386/pc.c         | 6 +-----
 2 files changed, 1 insertion(+), 13 deletions(-)

diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index ffee841..fac6689 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -84,10 +84,6 @@ struct PCMachineState {
 /**
  * PCMachineClass:
  *
- * Methods:
- *
- * @get_hotplug_handler: pointer to parent class callback @get_hotplug_h=
andler
- *
  * Compat fields:
  *
  * @enforce_aligned_dimm: check that DIMM's address/size is aligned by
@@ -107,10 +103,6 @@ struct PCMachineClass {
=20
     /*< public >*/
=20
-    /* Methods: */
-    HotplugHandler *(*get_hotplug_handler)(MachineState *machine,
-                                           DeviceState *dev);
-
     /* Device configuration: */
     bool pci_enabled;
     bool kvmclock_enabled;
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index b297a5d..018fd8d 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -2056,15 +2056,12 @@ static void pc_machine_device_unplug_cb(HotplugHa=
ndler *hotplug_dev,
 static HotplugHandler *pc_get_hotpug_handler(MachineState *machine,
                                              DeviceState *dev)
 {
-    PCMachineClass *pcmc =3D PC_MACHINE_GET_CLASS(machine);
-
     if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM) ||
         object_dynamic_cast(OBJECT(dev), TYPE_CPU)) {
         return HOTPLUG_HANDLER(machine);
     }
=20
-    return pcmc->get_hotplug_handler ?
-        pcmc->get_hotplug_handler(machine, dev) : NULL;
+    return NULL;
 }
=20
 static void
@@ -2344,7 +2341,6 @@ static void pc_machine_class_init(ObjectClass *oc, =
void *data)
     HotplugHandlerClass *hc =3D HOTPLUG_HANDLER_CLASS(oc);
     NMIClass *nc =3D NMI_CLASS(oc);
=20
-    pcmc->get_hotplug_handler =3D mc->get_hotplug_handler;
     pcmc->pci_enabled =3D true;
     pcmc->has_acpi_build =3D true;
     pcmc->rsdp_in_ram =3D true;
--=20
2.7.4

