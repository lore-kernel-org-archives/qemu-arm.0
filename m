Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp4801475wro;
        Mon, 29 Oct 2018 15:34:00 -0700 (PDT)
X-Google-Smtp-Source: AJdET5daIbeQiHElaCFbfmxaAY/SK6Kd4PJVX/zbMM9Qj4V+YJP5eOs8tAQ3IYpaCEUh/9ipXr6r
X-Received: by 2002:aed:2c03:: with SMTP id f3-v6mr248001qtd.59.1540852440093;
        Mon, 29 Oct 2018 15:34:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540852440; cv=none;
        d=google.com; s=arc-20160816;
        b=jgjmfFOa6O800HuH6SyBpCnuZjghN6JRkumBE4p+EJJ8KOmYRk3o0yrk1Hx1WKEL7Z
         C0MKeF8I1JykDTE2H9EXbE+vL8PzYRwnrhNpeXtAyCqP4m20wRYnS3xcGDLGbOXI5TFD
         f/6qSa2zY3fiZI+/fDN7Yur42sDwXXOpSQeJ9cH5t6xur6ZDMaZvBpogYyZm8aHffpMx
         K8GjccJhvhMmPivyhXS2Jp1AhcWHZHz/4hIIYRMS8aPIhYYUrUYxge2p7Uy6LnyU1h2N
         5Od/+yXU876SmP+00tQn43npjQnAGTj7pwRqDu9RUCJdQ3Zih3XbFK/ilFMubN6XKQWA
         A8dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=RjU4lbV8FmfEGSd5F5PEGf+a7zn2+orgT+CcaLs0lDM=;
        b=h3P46c3tDdf7+9xlALK+DEndAzqVfpN+HrEG7t8iEkY4zxsg1jgm/j/vZ82TNUK7KG
         u0VmREKu5IQGem9ozRPMEAj1yTpkVyk4UdTVEBjDjrEA+CJ6o1nWR/g9aj0uqrX+S1ul
         9umcFtqPQWnWavyrhWEOH1ZmtdAmJZVv4d56YXy/SaQPu1FoikFGtPoXu3VgcfJ3AHUC
         l3zAF3c9tbzeORmWpuGdNEBEvb9fsm1AuHK2ee3r5Bvt1IYoHIAH1pCt+BVVwjGVx0/E
         qswwQ55+DAT3ixDxCm7cWpLJIBehSjcH0qYREMjZhV/7vw0qhnIJpwV9tkPDUh1EYk4C
         UGaA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k38si2503266qvk.220.2018.10.29.15.33.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 29 Oct 2018 15:34:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49354 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gHG6h-0000Rn-L7
	for alex.bennee@linaro.org; Mon, 29 Oct 2018 18:33:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35759)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gHG6U-0000Qf-TD
	for qemu-arm@nongnu.org; Mon, 29 Oct 2018 18:33:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gHG6R-0006k0-JS
	for qemu-arm@nongnu.org; Mon, 29 Oct 2018 18:33:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37748)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1gHG6R-0006hn-9P; Mon, 29 Oct 2018 18:33:43 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 242384E91F;
	Mon, 29 Oct 2018 22:33:35 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-38.brq.redhat.com [10.40.204.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 194FF19489;
	Mon, 29 Oct 2018 22:33:22 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, Icenowy Zheng <icenowy@aosc.xyz>,
	Guenter Roeck <linux@roeck-us.net>, Gerd Hoffmann <kraxel@redhat.com>
Date: Mon, 29 Oct 2018 23:32:06 +0100
Message-Id: <20181029223207.31878-3-philmd@redhat.com>
In-Reply-To: <20181029223207.31878-1-philmd@redhat.com>
References: <20181029223207.31878-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Mon, 29 Oct 2018 22:33:35 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 2/3] usb: ehci: Add support for Allwinner A10
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
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NiGZRimfdQKy

From: Guenter Roeck <linux@roeck-us.net>

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
Gerd: You already review this code here:
https://lists.gnu.org/archive/html/qemu-arm/2017-01/msg00345.html
Can we use your R-b again?

 hw/usb/hcd-ehci-sysbus.c | 17 +++++++++++++++++
 hw/usb/hcd-ehci.h        |  1 +
 2 files changed, 18 insertions(+)

diff --git a/hw/usb/hcd-ehci-sysbus.c b/hw/usb/hcd-ehci-sysbus.c
index 3b83beb140..87fac9de01 100644
--- a/hw/usb/hcd-ehci-sysbus.c
+++ b/hw/usb/hcd-ehci-sysbus.c
@@ -110,6 +110,22 @@ static const TypeInfo ehci_xlnx_type_info =3D {
     .class_init    =3D ehci_xlnx_class_init,
 };
=20
+static void ehci_aw_a10_class_init(ObjectClass *oc, void *data)
+{
+    SysBusEHCIClass *sec =3D SYS_BUS_EHCI_CLASS(oc);
+    DeviceClass *dc =3D DEVICE_CLASS(oc);
+
+    sec->capsbase =3D 0x0;
+    sec->opregbase =3D 0x10;
+    set_bit(DEVICE_CATEGORY_USB, dc->categories);
+}
+
+static const TypeInfo ehci_aw_a10_type_info =3D {
+    .name          =3D TYPE_AW_A10_EHCI,
+    .parent        =3D TYPE_SYS_BUS_EHCI,
+    .class_init    =3D ehci_aw_a10_class_init,
+};
+
 static void ehci_exynos4210_class_init(ObjectClass *oc, void *data)
 {
     SysBusEHCIClass *sec =3D SYS_BUS_EHCI_CLASS(oc);
@@ -246,6 +262,7 @@ static void ehci_sysbus_register_types(void)
 {
     type_register_static(&ehci_type_info);
     type_register_static(&ehci_xlnx_type_info);
+    type_register_static(&ehci_aw_a10_type_info);
     type_register_static(&ehci_exynos4210_type_info);
     type_register_static(&ehci_tegra2_type_info);
     type_register_static(&ehci_ppc4xx_type_info);
diff --git a/hw/usb/hcd-ehci.h b/hw/usb/hcd-ehci.h
index 0bc364b286..8d78864a82 100644
--- a/hw/usb/hcd-ehci.h
+++ b/hw/usb/hcd-ehci.h
@@ -342,6 +342,7 @@ typedef struct EHCIPCIState {
=20
=20
 #define TYPE_SYS_BUS_EHCI "sysbus-ehci-usb"
+#define TYPE_AW_A10_EHCI "aw-a10-ehci-usb"
 #define TYPE_EXYNOS4210_EHCI "exynos4210-ehci-usb"
 #define TYPE_TEGRA2_EHCI "tegra2-ehci-usb"
 #define TYPE_PPC4xx_EHCI "ppc4xx-ehci-usb"
--=20
2.17.2

