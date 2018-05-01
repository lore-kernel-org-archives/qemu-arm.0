Received: by 10.28.4.212 with SMTP id 203csp4792090wme;
        Tue, 1 May 2018 05:10:09 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZrFnkkSbgJViCvRlfOVFhwW0BzIAt8YQwYFOIAwlUEyE5Hd9MlPkeTArIe7y35lglHMktCc
X-Received: by 10.55.17.168 with SMTP id 40mr12082598qkr.413.1525176609001;
        Tue, 01 May 2018 05:10:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525176608; cv=none;
        d=google.com; s=arc-20160816;
        b=e0S7EBMM4zScvvKjKNT9EslooReyWdIgX0rpxSlGy46Q3+R7OtPBdHZXlMCIaCQUT1
         /Moz039STyjK3Swicx0YU0e4L/HAZOVgPd2Auq+rdvScO0S0f1IG/2/hUvv/2sxddHIk
         lzFKB82CtlBpEHnOwNAjbdbNGbKANQsN19hxbc3/A6rW0sXwsXbIEXC3H8tU8fmQn2jE
         7CRLktMkg4ewHehIC77OXBjOxQR2YIOjspC4qblWY1zafs0NkN/40f2d9F3L23f4SKoK
         lLHuYGec3A3+rC6otnK+W6KN2UVbOAQb9ENwsBM+ocGMp5YOkXqvIhWwQouYiNYKpT0B
         HA9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=X1fcl8nzoLQCEY4rUTRT0TZbWYc1xE4ykLz/Eignwtg=;
        b=A13lU9A9gm5RUdVJK6aDJd5DOD9G8vQJ0YJv6w99J8xYQXDyXoa5CZClNj8AtF7IUr
         aQfl92H/sJiQ5yf1sni9DokdtZ7dWco+aW2WYPanUcRIOiWtCqGN0TOM6PJ5reV6W6ox
         FA/6h1R/F00D8CJ+azb6VthCTvjg55Jb4AMjgFxQrZHgSd1oHPz1fggmyrS6o9Jye2t9
         86xuC59J67AZec8tTMO2Zk4cObpjWzjnsWvmHmLAFW2bxyxFKH2c3swBstIwjPr0EbZN
         KZJI89G2lymOtsIeKP9Q0cGlfK6qXKvAqMgVZUHRhVZnHM54GH8zZNm4SrpzlC1WoO10
         bnUg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v22-v6si4206014qth.228.2018.05.01.05.10.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 01 May 2018 05:10:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:42251 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fDU6i-0005fB-Eg
	for alex.bennee@linaro.org; Tue, 01 May 2018 08:10:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52433)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1fDU6N-0005aR-B4
	for qemu-arm@nongnu.org; Tue, 01 May 2018 08:09:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1fDU6J-0003QE-15
	for qemu-arm@nongnu.org; Tue, 01 May 2018 08:09:47 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:60344 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1fDU6I-0003Pm-Ru; Tue, 01 May 2018 08:09:42 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 02F851238DA;
	Tue,  1 May 2018 12:09:40 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3D6042022C00;
	Tue,  1 May 2018 12:09:39 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  1 May 2018 14:08:38 +0200
Message-Id: <1525176522-200354-2-git-send-email-imammedo@redhat.com>
In-Reply-To: <1525176522-200354-1-git-send-email-imammedo@redhat.com>
References: <1525176522-200354-1-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Tue, 01 May 2018 12:09:40 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Tue, 01 May 2018 12:09:40 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'imammedo@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v3 1/5] pc: simplify
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mjd6H48drOdf

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

