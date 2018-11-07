Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp2090441wrw;
        Wed, 7 Nov 2018 04:47:12 -0800 (PST)
X-Google-Smtp-Source: AJdET5cwJ6mGdYHLW4OOL6V7Bl77uNFRnLFMBOx7LwutiSn4RuXFLXhLhorTdd0z2eGNqqKWB/xE
X-Received: by 2002:a37:aa91:: with SMTP id t139mr48498qke.139.1541594832353;
        Wed, 07 Nov 2018 04:47:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541594832; cv=none;
        d=google.com; s=arc-20160816;
        b=bC8nlGcj/3/FtYySZFZIMKFPjx0uOQCbOOHE3wPOcmTXiCz5/oTNOBRHGKFYnXN24E
         TdpWLdHi2dx673radxUGT5fEMRsl0piIPmz6N4S374l7JwVPX5H0bX0GzxSEjeiRuyCf
         DN9bQE+gMZtCudFJy8A9hSJkggABzQr03psx+wewiI2r9pOuGmoWsB8P07+7RpQGhSJt
         W7hyij+DcQrf958rXLacItS/ZsnuOMPa1izLZgG1gJDURPndWV4XnY03CZPlCixid0Cj
         gnc6B3ocyK1KWE2FRpd8rTYWiOle8EZThijyNHZTmOpTJoFvi9JhrZutKr02rfqqPHB6
         rflQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=FQTtAZunPkqoja3scBVrXzfTi2r0DVoiLYv1zqlPrQc=;
        b=i9HZxVvbjmNJZyTwLjFMZJh31hPaNh6i2NYb6+6WOVUrk9MLL9/PrjoDzgnd7+fAdT
         IdLKb+TLCED7xRvdgunSxelqi/cAM1K5YoXjOnCL4fPp+akFNI7Jq5jcWXz2gTuo9IrK
         x9HsSk6yVWY3owHAE58O34D5JWES0O097qKtChrrU9qk/Dc/qefAouJoTcOr3M8ZESWe
         Sx2JY/0RUJpxmuu7V/P4JEJwK/NXQqJ6p5QZjUCzLGU2d8tOq8xhUZoG0ZRHad5xi58L
         xTcOq9fRjXKCYjwtZm7B1+Dy46VC12ij1ra7K9OSl1umPUBzRvWfjXWhFW+gO8LYp3lZ
         BQtw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y24si379978qve.86.2018.11.07.04.47.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Nov 2018 04:47:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47679 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gKNEl-00088a-QT
	for alex.bennee@linaro.org; Wed, 07 Nov 2018 07:47:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37610)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1gKN6j-0007hE-Rt
	for qemu-devel@nongnu.org; Wed, 07 Nov 2018 07:38:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1gKN6f-00074j-Ov
	for qemu-devel@nongnu.org; Wed, 07 Nov 2018 07:38:51 -0500
Received: from mx1.redhat.com ([209.132.183.28]:44012)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
	id 1gKN6K-0006lP-KI; Wed, 07 Nov 2018 07:38:29 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4DD7730D4DAA;
	Wed,  7 Nov 2018 12:38:14 +0000 (UTC)
Received: from localhost (ovpn-112-43.ams2.redhat.com [10.36.112.43])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 77BCE6012D;
	Wed,  7 Nov 2018 12:38:09 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  7 Nov 2018 16:36:46 +0400
Message-Id: <20181107123652.23417-9-marcandre.lureau@redhat.com>
In-Reply-To: <20181107123652.23417-1-marcandre.lureau@redhat.com>
References: <20181107123652.23417-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Wed, 07 Nov 2018 12:38:14 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH for-3.2 v3 08/14] qdev-props: convert
 global_props to GArray
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
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
	Igor Mammedov <imammedo@redhat.com>,
	Anthony Perard <anthony.perard@citrix.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Stefan Berger <stefanb@linux.ibm.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>,
	Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: brMZmeXsJfun

A step towards being able to call object_apply_global_props().

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 hw/core/qdev-properties.c | 29 ++++++++++++++++++++---------
 1 file changed, 20 insertions(+), 9 deletions(-)

diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index 43c30a57f4..353e67c05a 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -1173,22 +1173,32 @@ void qdev_prop_set_ptr(DeviceState *dev, const ch=
ar *name, void *value)
     *ptr =3D value;
 }
=20
-static GList *global_props;
+static GArray *global_props(void)
+{
+    static GArray *gp;
+
+    if (!gp) {
+        gp =3D g_array_new(false, false, sizeof(GlobalProperty *));
+    }
+
+    return gp;
+}
=20
 void qdev_prop_register_global(GlobalProperty *prop)
 {
-    global_props =3D g_list_append(global_props, prop);
+    g_array_append_val(global_props(), prop);
 }
=20
 int qdev_prop_check_globals(void)
 {
-    GList *l;
-    int ret =3D 0;
+    int i, ret =3D 0;
=20
-    for (l =3D global_props; l; l =3D l->next) {
-        GlobalProperty *prop =3D l->data;
+    for (i =3D 0; i < global_props()->len; i++) {
+        GlobalProperty *prop;
         ObjectClass *oc;
         DeviceClass *dc;
+
+        prop =3D g_array_index(global_props(), GlobalProperty *, i);
         if (prop->used) {
             continue;
         }
@@ -1213,12 +1223,13 @@ int qdev_prop_check_globals(void)
=20
 void qdev_prop_set_globals(DeviceState *dev)
 {
-    GList *l;
+    int i;
=20
-    for (l =3D global_props; l; l =3D l->next) {
-        GlobalProperty *prop =3D l->data;
+    for (i =3D 0; i < global_props()->len; i++) {
+        GlobalProperty *prop;
         Error *err =3D NULL;
=20
+        prop =3D g_array_index(global_props(), GlobalProperty *, i);
         if (object_dynamic_cast(OBJECT(dev), prop->driver) =3D=3D NULL) =
{
             continue;
         }
--=20
2.19.1.708.g4ede3d42df

