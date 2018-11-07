Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp2081989wrw;
        Wed, 7 Nov 2018 04:38:06 -0800 (PST)
X-Google-Smtp-Source: AJdET5cGrsQ2y16E3gZwF2YwKUhD/j1G8coqRLx0+NeHaLYzX/5JhDpmz1+h4cKnKRL3XDvH6Jzb
X-Received: by 2002:a0c:f80f:: with SMTP id r15mr52868qvn.130.1541594286814;
        Wed, 07 Nov 2018 04:38:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541594286; cv=none;
        d=google.com; s=arc-20160816;
        b=0nY+QLT9ndx4hhcFBXSDfoRINCClTckPCqjEIze9i9pYefuL9v7ggcZ+a+381A34xV
         P2OEdV+iwsXveJ12S3WzQs9AP/4DUfe9u3u2bN+hGb/ntA7B1gRNtTr1yMSEp/8N7Kx1
         F1HB8G++l7QWaL0r8sITntYLnFGN95ifiF4tdwGfh+rIGZgmEADgDsaqib7OozGPuLg6
         wsGYIL8wwJf20M15VpkAOABs3+VNbzX0h7efzZIHuzvwiR0xsCwOuKvi7fb4sZeAoEhR
         mX6qW+1eJRFHWcWS9MB97WFwlfLw0ROa3gI9jhxjUqy46lSbee8uc3Us7auAKAvMYhQx
         GOaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=WYHhpLoDIhEE1vxYZyaVBPQFE1ZzkLIWyojsj2KnF0U=;
        b=ofJxjX82L9AFuHv+oWaBic4GMlTLCVbPPyDnf5lvx+MaCqOLEqs5TFP0xVM7hxgp9O
         /BiGwMVTWAipUURt5mRSLAFYuCwaWh6Ji6KR8mogMhuDN8m+TqGvWPvM8zPEcZLLNUBq
         rnZhQVdWsyomXzhlyoeNgcdD/SWYOCJ0RVnAhT8EZNXZLDzgb8b6gM7niedx4xFc6Kjy
         WCn+RWG3uO986yim0evIeajTG6gKcbWcWnz3Im6f/zDSrqjN08eEGw5E8jvXmkbX19Fq
         T7FMpWiARQrjWOYCY3dH7rHqabPMVWLI/9/UKE+DOxpPa5ozl9M1762nYU9kNaVcyByP
         Thmw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o13si355775qvn.167.2018.11.07.04.38.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Nov 2018 04:38:06 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47604 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gKN5y-0005Lb-7H
	for alex.bennee@linaro.org; Wed, 07 Nov 2018 07:38:06 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37230)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1gKN5i-000541-6i
	for qemu-arm@nongnu.org; Wed, 07 Nov 2018 07:37:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1gKN5e-0006PS-RJ
	for qemu-arm@nongnu.org; Wed, 07 Nov 2018 07:37:50 -0500
Received: from mx1.redhat.com ([209.132.183.28]:34816)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
	id 1gKN5a-0006J8-NH; Wed, 07 Nov 2018 07:37:42 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 03E8FA53D6;
	Wed,  7 Nov 2018 12:37:38 +0000 (UTC)
Received: from localhost (ovpn-112-43.ams2.redhat.com [10.36.112.43])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4BFD84D732;
	Wed,  7 Nov 2018 12:37:29 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  7 Nov 2018 16:36:42 +0400
Message-Id: <20181107123652.23417-5-marcandre.lureau@redhat.com>
In-Reply-To: <20181107123652.23417-1-marcandre.lureau@redhat.com>
References: <20181107123652.23417-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Wed, 07 Nov 2018 12:37:38 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH for-3.2 v3 04/14] accel: register global_props
 like machine globals
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	xen-devel@lists.xenproject.org, Corey Minyard <minyard@acm.org>,
	Amit Shah <amit@kernel.org>,
	=?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	dgilbert@redhat.com, Eduardo Habkost <ehabkost@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: at4waamk8u1u

global_props is only used for Xen xen_compat_props. It's a static
array of GlobalProperty, like machine globals in SET_MACHINE_COMPAT().
Let's register the globals the same way, without extra copy allocation.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 include/hw/qdev-properties.h | 29 -----------------------------
 accel/accel.c                |  9 ++++++++-
 hw/core/qdev-properties.c    | 21 ---------------------
 3 files changed, 8 insertions(+), 51 deletions(-)

diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
index 4f60cc88f3..a95f4a73eb 100644
--- a/include/hw/qdev-properties.h
+++ b/include/hw/qdev-properties.h
@@ -255,35 +255,6 @@ void qdev_prop_set_globals(DeviceState *dev);
 void error_set_from_qdev_prop_error(Error **errp, int ret, DeviceState *=
dev,
                                     Property *prop, const char *value);
=20
-/**
- * register_compat_prop:
- *
- * Register internal (not user-provided) global property, changing the
- * default value of a given property in a device type.  This can be used
- * for enabling machine-type compatibility or for enabling
- * accelerator-specific defaults in devices.
- *
- * The property values set using this function must be always valid and
- * never report setter errors, as the property will have
- * GlobalProperty::errp set to &error_abort.
- *
- * User-provided global properties should override internal global
- * properties, so callers of this function should ensure that it is
- * called before user-provided global properties are registered.
- *
- * @driver: Device type to be affected
- * @property: Property whose default value is going to be changed
- * @value: New default value for the property
- */
-void register_compat_prop(const char *driver, const char *property,
-                          const char *value);
-/*
- * register_compat_props_array(): using register_compat_prop(), which
- * only registers internal global properties (which has lower priority
- * than user-provided global properties)
- */
-void register_compat_props_array(GlobalProperty *prop);
-
 /**
  * qdev_property_add_static:
  * @dev: Device to add the property to.
diff --git a/accel/accel.c b/accel/accel.c
index 966b2d8f53..3da26eb90f 100644
--- a/accel/accel.c
+++ b/accel/accel.c
@@ -34,6 +34,7 @@
 #include "qom/object.h"
 #include "qemu/error-report.h"
 #include "qemu/option.h"
+#include "qapi/error.h"
=20
 static const TypeInfo accel_type =3D {
     .name =3D TYPE_ACCEL,
@@ -121,7 +122,13 @@ void configure_accelerator(MachineState *ms)
 void accel_register_compat_props(AccelState *accel)
 {
     AccelClass *class =3D ACCEL_GET_CLASS(accel);
-    register_compat_props_array(class->global_props);
+    GlobalProperty *prop =3D class->global_props;
+
+    for (; prop && prop->driver; prop++) {
+        /* Any compat_props must never cause error */
+        prop->errp =3D &error_abort;
+        qdev_prop_register_global(prop);
+    }
 }
=20
 void accel_setup_post(MachineState *ms)
diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index 35072dec1e..ab61d502fd 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -1180,27 +1180,6 @@ void qdev_prop_register_global(GlobalProperty *pro=
p)
     global_props =3D g_list_append(global_props, prop);
 }
=20
-void register_compat_prop(const char *driver,
-                          const char *property,
-                          const char *value)
-{
-    GlobalProperty *p =3D g_new0(GlobalProperty, 1);
-
-    /* Any compat_props must never cause error */
-    p->errp =3D &error_abort;
-    p->driver =3D driver;
-    p->property =3D property;
-    p->value =3D value;
-    qdev_prop_register_global(p);
-}
-
-void register_compat_props_array(GlobalProperty *prop)
-{
-    for (; prop && prop->driver; prop++) {
-        register_compat_prop(prop->driver, prop->property, prop->value);
-    }
-}
-
 void qdev_prop_register_global_list(GlobalProperty *props)
 {
     int i;
--=20
2.19.1.708.g4ede3d42df

