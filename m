Received: by 10.28.91.67 with SMTP id p64csp669298wmb;
        Wed, 28 Feb 2018 06:25:39 -0800 (PST)
X-Google-Smtp-Source: AG47ELtbAMnSsK45YmLEePXgWGbydp2Rc+VljOnT0r555mbt3wvGXOSdRjoFt38kF5nKnjFAByhb
X-Received: by 10.13.208.69 with SMTP id s66mr11676672ywd.483.1519827939648;
        Wed, 28 Feb 2018 06:25:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519827939; cv=none;
        d=google.com; s=arc-20160816;
        b=0/4e5vuoVoZZxLU+tfxsIpp362b5uGJmVwJ503VbtzRjUtqKydFxAdnZRyZIok2xAn
         HIvBcoPZZe7zLcQMctTw3t6fUpNECqy8yRM76fVuKhkYek28hv1CMN9ZJELQPHt4Xk8e
         8BfYCMZwra8Xw0dTdV3bWWvbVjxj70hpCKWShp+RiSFsB4KWBju8X6l+X0qNhYupWMIs
         IlRO2axY/lCO1VBgzeOWZm5opl0TQZH0cU0z/r1wiBuTYgEv2552XZVcAdib79/evUnb
         jJeBAcbDjs0I3hgFyzGR3649drml8QV9jqtiEQzCT3uf/PbeTyMTaPc7LjhXuL9zTGa0
         jkGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=zm1QGdDGSfpv5ShlqIrKFJAH48iwWG8t+QvOVonYSLM=;
        b=WhVhqsXlsO+qSjxiQnQzR41rY6IiHdqeM57UykP95ay/hhysfyDS/BOLjZhfRNu4qq
         utJM+rYSQM+ML3GlPFSs5nAiJ69kdpMQ8Gr/BtbiOpEGbIVXNUnQtcGa6xURA9fHyo5e
         WfYmCPRzGIiA8EwHcgJmG6+iAztO1tI0qyIoZRvCamitJD6mezGze/WOITk6bRGNbWV1
         pZ8mtmy2Eoiy5zCFBMsFCx2JwSRUytRoZOG3Nw86CkoTM7lCvjoDUMBH5nfnpXp3UOxm
         hvbdDKIetunGPlwIe+M1b/ev0BNKP2JjlOHJK6KqWGYUJpaDSC0ZwHJmAWq7T0/gbiRS
         UAQA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n206-v6si284429ybg.673.2018.02.28.06.25.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 28 Feb 2018 06:25:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44597 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1er2fq-0004f1-U9
	for alex.bennee@linaro.org; Wed, 28 Feb 2018 09:25:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33422)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1er2fd-0004eI-I4
	for qemu-arm@nongnu.org; Wed, 28 Feb 2018 09:25:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1er2fc-0001tB-Bm
	for qemu-arm@nongnu.org; Wed, 28 Feb 2018 09:25:25 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:35394 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1er2fc-0001sv-0e; Wed, 28 Feb 2018 09:25:24 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 956834015184;
	Wed, 28 Feb 2018 14:25:23 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
	(dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B3827946B7;
	Wed, 28 Feb 2018 14:25:22 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 28 Feb 2018 15:23:47 +0100
Message-Id: <1519827835-239519-3-git-send-email-imammedo@redhat.com>
In-Reply-To: <1519827835-239519-1-git-send-email-imammedo@redhat.com>
References: <1519827835-239519-1-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Wed, 28 Feb 2018 14:25:23 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Wed, 28 Feb 2018 14:25:23 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'imammedo@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v2 02/10] pc: replace pm object initialization
 with one-liner in acpi_get_pm_info()
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
Cc: Auger Eric <eric.auger@redhat.com>, Shannon Zhao <zhaoshenglong@huawei.com>,
	qemu-arm@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1+wsI9En5lZ2

next patch will need it before it gets to piix4/lpc branches
that initializes 'obj' now.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
 hw/i386/acpi-build.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index deb440f..b85fefe 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -128,7 +128,7 @@ static void acpi_get_pm_info(AcpiPmInfo *pm)
 {
     Object *piix =3D piix4_pm_find();
     Object *lpc =3D ich9_lpc_find();
-    Object *obj =3D NULL;
+    Object *obj =3D piix ? piix : lpc;
     QObject *o;
=20
     pm->force_rev1_fadt =3D false;
@@ -138,7 +138,6 @@ static void acpi_get_pm_info(AcpiPmInfo *pm)
     if (piix) {
         /* w2k requires FADT(rev1) or it won't boot, keep PC compatible =
*/
         pm->force_rev1_fadt =3D true;
-        obj =3D piix;
         pm->cpu_hp_io_base =3D PIIX4_CPU_HOTPLUG_IO_BASE;
         pm->pcihp_io_base =3D
             object_property_get_uint(obj, ACPI_PCIHP_IO_BASE_PROP, NULL)=
;
@@ -146,7 +145,6 @@ static void acpi_get_pm_info(AcpiPmInfo *pm)
             object_property_get_uint(obj, ACPI_PCIHP_IO_LEN_PROP, NULL);
     }
     if (lpc) {
-        obj =3D lpc;
         pm->cpu_hp_io_base =3D ICH9_CPU_HOTPLUG_IO_BASE;
     }
     assert(obj);
--=20
2.7.4

