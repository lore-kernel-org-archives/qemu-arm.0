Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp2085342wrw;
        Wed, 7 Nov 2018 04:41:46 -0800 (PST)
X-Google-Smtp-Source: AJdET5fAudys1G/zfadzKVtNRyaLVd8CT7OILkuWw57NuH3O8VE5b0Xr+IPP5GkVPl8R046oEUz2
X-Received: by 2002:ac8:544e:: with SMTP id d14mr17344qtq.279.1541594506370;
        Wed, 07 Nov 2018 04:41:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541594506; cv=none;
        d=google.com; s=arc-20160816;
        b=k3c8tWKduBBQP25a1ncSVm3i1u8nzK2/M1Iu9YBNb46RJxH/dynCgDHH1w1kZuv/XB
         EYFVGiic9YxXAPzvdo3Sg+b6Q64HMVr/MgFj4gXK1JCAs5a/VfsYGMCW5oZ3jBR/+Hln
         NHU5uC7N7+YD04ptp7VndaKUQG0EZSCLw2W3AEix7H8dBtC+M+JRw0bkTPBSdi4h9GdD
         YTVUdk0MFShtHFlzPBnFs9Zxy2mgaHn0gjHPyfRk/13X1m+8euIvP1gWqYTJUGs3wLoN
         Vur5KQQ3nXE+2+A5KXctIEtmlEaeMqvCTb1dJo+TWZWaIPUPYmWZm/dekuJdzWXuN1vZ
         5giw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=tP56JbLf5KfNxhgUYjZJXfx669nbInnNv7ohB76rXiQ=;
        b=AklAwtXvQhr6RsX9OhKUh8C2002rpWgeAkqxzY5TXjmIa60JU670KgL4CRtvn5YWXS
         wJQlom+hYzGDSqDB4FrmhaIMl5jpPpu7XRp7+e++F2xgDgpzFB2QtPm/SBsb2ATkYQG1
         J0cTg1aqTxUb0icQ3uTevHWpEyD6nt+bpC8P0z5tUAb29HzT5aE8zr9yO5Rs2+G0gI6h
         hJBKz3STmrzR7+yYQyflAQinN6IcApxt9ngt12xe0MtOV8N8Ffz698vwK6EzM2i/OMoy
         JnZR+OM8pLdwokTTiUUQlOEn0x0cqTPO/dEjKkmSgJZcYt2QUCeX8L/pxA1duwEAdmf6
         j6ag==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l19si351785qtn.352.2018.11.07.04.41.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Nov 2018 04:41:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47637 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gKN9V-0001ff-QS
	for alex.bennee@linaro.org; Wed, 07 Nov 2018 07:41:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37609)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1gKN6j-0007hD-Rs
	for qemu-arm@nongnu.org; Wed, 07 Nov 2018 07:38:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1gKN6f-00074v-Qf
	for qemu-arm@nongnu.org; Wed, 07 Nov 2018 07:38:51 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51590)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
	id 1gKN6Z-0006qH-DZ; Wed, 07 Nov 2018 07:38:47 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9C62431F40F;
	Wed,  7 Nov 2018 12:38:19 +0000 (UTC)
Received: from localhost (ovpn-112-43.ams2.redhat.com [10.36.112.43])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2CB0560196;
	Wed,  7 Nov 2018 12:38:17 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  7 Nov 2018 16:36:47 +0400
Message-Id: <20181107123652.23417-10-marcandre.lureau@redhat.com>
In-Reply-To: <20181107123652.23417-1-marcandre.lureau@redhat.com>
References: <20181107123652.23417-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Wed, 07 Nov 2018 12:38:19 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH for-3.2 v3 09/14] qdev-props: remove errp from
 GlobalProperty
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
X-TUID: HOkFnSrEk9MD

All qdev_prop_register_global() set &error_fatal for errp, except
'-rtc driftfix=3Dslew', which arguably should also use &error_fatal, as
otherwise failing to apply the property would only report a warning.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 include/hw/qdev-core.h    | 6 ------
 hw/core/qdev-properties.c | 4 ++--
 qom/cpu.c                 | 1 -
 target/i386/cpu.c         | 1 -
 target/sparc/cpu.c        | 1 -
 vl.c                      | 1 -
 6 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index baaf097212..3a45889c34 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -250,18 +250,12 @@ struct PropertyInfo {
 /**
  * GlobalProperty:
  * @used: Set to true if property was used when initializing a device.
- * @errp: Error destination, used like first argument of error_setg()
- *        in case property setting fails later. If @errp is NULL, we
- *        print warnings instead of ignoring errors silently. For
- *        hotplugged devices, errp is always ignored and warnings are
- *        printed instead.
  */
 typedef struct GlobalProperty {
     const char *driver;
     const char *property;
     const char *value;
     bool used;
-    Error **errp;
 } GlobalProperty;
=20
 /*** Board API.  This should go away once we have a machine config file.=
  ***/
diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index 353e67c05a..8728cbab9f 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -1238,8 +1238,8 @@ void qdev_prop_set_globals(DeviceState *dev)
         if (err !=3D NULL) {
             error_prepend(&err, "can't apply global %s.%s=3D%s: ",
                           prop->driver, prop->property, prop->value);
-            if (!dev->hotplugged && prop->errp) {
-                error_propagate(prop->errp, err);
+            if (!dev->hotplugged) {
+                error_propagate(&error_fatal, err);
             } else {
                 warn_report_err(err);
             }
diff --git a/qom/cpu.c b/qom/cpu.c
index 9ad1372d57..5442a7323b 100644
--- a/qom/cpu.c
+++ b/qom/cpu.c
@@ -312,7 +312,6 @@ static void cpu_common_parse_features(const char *typ=
ename, char *features,
             prop->driver =3D typename;
             prop->property =3D g_strdup(featurestr);
             prop->value =3D g_strdup(val);
-            prop->errp =3D &error_fatal;
             qdev_prop_register_global(prop);
         } else {
             error_setg(errp, "Expected key=3Dvalue format, found %s.",
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index af7e9f09cc..1d2dba671e 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -3568,7 +3568,6 @@ static void x86_cpu_parse_featurestr(const char *ty=
pename, char *features,
         prop->driver =3D typename;
         prop->property =3D g_strdup(name);
         prop->value =3D g_strdup(val);
-        prop->errp =3D &error_fatal;
         qdev_prop_register_global(prop);
     }
=20
diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index 0f090ece54..4a4445bdf5 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -111,7 +111,6 @@ cpu_add_feat_as_prop(const char *typename, const char=
 *name, const char *val)
     prop->driver =3D typename;
     prop->property =3D g_strdup(name);
     prop->value =3D g_strdup(val);
-    prop->errp =3D &error_fatal;
     qdev_prop_register_global(prop);
 }
=20
diff --git a/vl.c b/vl.c
index d11b070e70..8ee6f7a688 100644
--- a/vl.c
+++ b/vl.c
@@ -2931,7 +2931,6 @@ static int global_init_func(void *opaque, QemuOpts =
*opts, Error **errp)
     g->driver   =3D qemu_opt_get(opts, "driver");
     g->property =3D qemu_opt_get(opts, "property");
     g->value    =3D qemu_opt_get(opts, "value");
-    g->errp =3D &error_fatal;
     qdev_prop_register_global(g);
     return 0;
 }
--=20
2.19.1.708.g4ede3d42df

