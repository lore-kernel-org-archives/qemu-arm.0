Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp2085845wrw;
        Wed, 7 Nov 2018 04:42:21 -0800 (PST)
X-Google-Smtp-Source: AJdET5cFPMfPpki301OtVqMMRt2NVGfaG0kqYuZoNokXFYkDVkKIV+tVhBFeVZAfBHVQlEc4PJMT
X-Received: by 2002:a0c:8ecc:: with SMTP id y12mr45152qvb.41.1541594541736;
        Wed, 07 Nov 2018 04:42:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541594541; cv=none;
        d=google.com; s=arc-20160816;
        b=HVfEzLECW/PM40+dvzLuCFTlXpJCYpVVYU0pQpATM8RAYh4TSb1OUhrtbiFlR4rbzn
         M0BQIesIa/siIcZ4NghyyOJEU0qXS6HXnG6vG/CvKPyElSp82fjShjs+sw8PYuJA3/z9
         B/9Wzed/itEiChlrwMD6fB1tW2+4A7drMT7VMSq+fhGZozbkFea+M9ozcGaRO+0BSniT
         o+61748awfuHsv0SoY5xF4ql4tZ56CtbbQjCCvGRs6A11u06BQB2ESdkLGPJmVK4Nb7+
         AH8NdCstfRh9O3DbFYkrxsWuIuMSybAD8YZLsOm/WHVFPd6hTzc0vH1Afleunt3f8ple
         fy2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=odHH++IV13DGgUvw///ThDyhMebND5IzsP8IXYU1qeU=;
        b=O+JbQMm6wm9tTLDtU76QUU7sL/ElYFD5v6qxobKSxb5zauaXb32KAgj2/U726IFHx2
         lMbUoneIYsINj9mKI6HVYBbD9KAtKF6z4/W2ZR9b5Ov8/c6IzW9Gj57AFqZtFGjTL+/Z
         gTIpiCWhwj5/6FRH7KkQlGSLb6HbzWTw4zt7VB8EmfVdkG4V3bxx3aYjxWnXNmjUSNP5
         INFGeMcR/oEttoczG7dtO6RjaT+crr7FLlDpGxw0dE8rXwTqxlPe5L1CFZNt7dIS3uIj
         mz97kPmea/jVcY8at6I8Ztm+XJgPnrma46knPyl0o75Wxjf5DAWO3xDm1lbjBjcscXol
         OZ3g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x2si334075qte.376.2018.11.07.04.42.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Nov 2018 04:42:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47643 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gKNA5-00028U-5o
	for alex.bennee@linaro.org; Wed, 07 Nov 2018 07:42:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37781)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1gKN71-0007xS-94
	for qemu-arm@nongnu.org; Wed, 07 Nov 2018 07:39:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1gKN70-0007Ho-6Z
	for qemu-arm@nongnu.org; Wed, 07 Nov 2018 07:39:11 -0500
Received: from mx1.redhat.com ([209.132.183.28]:46562)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
	id 1gKN6z-0006rP-JB; Wed, 07 Nov 2018 07:39:09 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D82F630C914D;
	Wed,  7 Nov 2018 12:38:28 +0000 (UTC)
Received: from localhost (ovpn-112-43.ams2.redhat.com [10.36.112.43])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 72D1A60BEE;
	Wed,  7 Nov 2018 12:38:23 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  7 Nov 2018 16:36:48 +0400
Message-Id: <20181107123652.23417-11-marcandre.lureau@redhat.com>
In-Reply-To: <20181107123652.23417-1-marcandre.lureau@redhat.com>
References: <20181107123652.23417-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Wed, 07 Nov 2018 12:38:29 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH for-3.2 v3 10/14] qdev-props: call
 object_apply_global_props()
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
X-TUID: Q7XZvgesJrwx

It's now possible to use the common function.

Teach object_apply_global_props() to warn if Error argument is NULL.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 hw/core/qdev-properties.c | 24 ++----------------------
 qom/object.c              |  6 +++++-
 2 files changed, 7 insertions(+), 23 deletions(-)

diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index 8728cbab9f..239535a4cb 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -1223,28 +1223,8 @@ int qdev_prop_check_globals(void)
=20
 void qdev_prop_set_globals(DeviceState *dev)
 {
-    int i;
-
-    for (i =3D 0; i < global_props()->len; i++) {
-        GlobalProperty *prop;
-        Error *err =3D NULL;
-
-        prop =3D g_array_index(global_props(), GlobalProperty *, i);
-        if (object_dynamic_cast(OBJECT(dev), prop->driver) =3D=3D NULL) =
{
-            continue;
-        }
-        prop->used =3D true;
-        object_property_parse(OBJECT(dev), prop->value, prop->property, =
&err);
-        if (err !=3D NULL) {
-            error_prepend(&err, "can't apply global %s.%s=3D%s: ",
-                          prop->driver, prop->property, prop->value);
-            if (!dev->hotplugged) {
-                error_propagate(&error_fatal, err);
-            } else {
-                warn_report_err(err);
-            }
-        }
-    }
+    object_apply_global_props(OBJECT(dev), global_props(),
+                              dev->hotplugged ? NULL : &error_fatal);
 }
=20
 /* --- 64bit unsigned int 'size' type --- */
diff --git a/qom/object.c b/qom/object.c
index 9acdf9e16d..b1a7f70550 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -392,7 +392,11 @@ void object_apply_global_props(Object *obj, GArray *=
props, Error **errp)
         if (err !=3D NULL) {
             error_prepend(&err, "can't apply global %s.%s=3D%s: ",
                           p->driver, p->property, p->value);
-            error_propagate(errp, err);
+            if (errp) {
+                error_propagate(errp, err);
+            } else {
+                warn_report_err(err);
+            }
         }
     }
 }
--=20
2.19.1.708.g4ede3d42df

