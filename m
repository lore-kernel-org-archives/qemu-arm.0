Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp2082495wrw;
        Wed, 7 Nov 2018 04:38:40 -0800 (PST)
X-Google-Smtp-Source: AJdET5dbhJG5a6/OW9B1aVl1LoUVuOnqtJ4jQPQimPa43FezjkbTJIxG7fI6EEs6ow01HvePCF6g
X-Received: by 2002:ac8:d86:: with SMTP id s6mr33848qti.324.1541594320004;
        Wed, 07 Nov 2018 04:38:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541594319; cv=none;
        d=google.com; s=arc-20160816;
        b=fkw/UvtiHHSE5SX+MBZ04Z++KgeoGmHA/STRRdKOmTcf5QIq1IoN7v+5Shy/4X4DpJ
         neu7JpscvuvkmS0BzfcMpsoFtj6xnZ1idGv5BxoZXan70LSo2+TEUPUoG9j5FY+ajVo2
         BOHO5mlOVW8wXv4Vj43nAh3oT9byc6aFFRJSVRfEJ8Xi51JeYOCU2/BXqV71qzgtRkjM
         hGbBG1QUIk9gDN85+nhfyDG5BqxhWN/ZtjomTx2xUtYmXLALTgHm9Gr6/4YOVoUzrDsP
         SjC28IF9CjImpMFPhWQjswWKGWvoEZXeDsmIUbpCmRm+ICMSMLHm6fTunbTDIX9PxCHv
         uFmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=XsPciF/Tq+3cLdzJyiZmYTMCZkiXxUontPfSJ5uM6gI=;
        b=m++HsortPibWSnnSp9dMDizlVsOXhoBa+lX0D1jwmicyjjnMES/+cjkN8J/Yed9o5h
         XLwGnwuSfqZKqIFm9WywoWwDAan2+RtnF5jzB2tjtr9r0zecrYx6Huw5uW/khmj4sUgS
         I32cJLvfbj2wVVjvBOfxwOLsAkgY8ACvfguKJku3QE6k/f3b/CZ0jlR592B6emicZuSV
         us+jLMVSeeWszol+r1pw8Bq1MMYa6/L+W0SrErJFin2VAXzAUoQD0diDvsQtnMtNeMcs
         PQgU40vSR0+uY9OWTHmvN3TJ2ucC4KOOmGpls8Of9PTMFh1HRuc2yt5IyMSV1MiHkqpQ
         l+/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a24si349245qth.308.2018.11.07.04.38.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Nov 2018 04:38:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47608 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gKN6V-0006Sj-GP
	for alex.bennee@linaro.org; Wed, 07 Nov 2018 07:38:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37293)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1gKN5l-0005KC-Fr
	for qemu-devel@nongnu.org; Wed, 07 Nov 2018 07:37:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1gKN5j-0006Zo-Ij
	for qemu-devel@nongnu.org; Wed, 07 Nov 2018 07:37:53 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52928)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
	id 1gKN5d-0006O7-6D; Wed, 07 Nov 2018 07:37:46 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 12292C0C49D1;
	Wed,  7 Nov 2018 12:37:43 +0000 (UTC)
Received: from localhost (ovpn-112-43.ams2.redhat.com [10.36.112.43])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C0B234D730;
	Wed,  7 Nov 2018 12:37:41 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  7 Nov 2018 16:36:43 +0400
Message-Id: <20181107123652.23417-6-marcandre.lureau@redhat.com>
In-Reply-To: <20181107123652.23417-1-marcandre.lureau@redhat.com>
References: <20181107123652.23417-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 07 Nov 2018 12:37:43 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH for-3.2 v3 05/14] qdev: move
 qdev_prop_register_global_list() to tests
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
X-TUID: N/o9a7pVnCpL

The function is only used by a test, move it there.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
---
 include/hw/qdev-properties.h   |  1 -
 hw/core/qdev-properties.c      |  9 ---------
 tests/test-qdev-global-props.c | 18 ++++++++++++++----
 3 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
index a95f4a73eb..3ab9cd2eb6 100644
--- a/include/hw/qdev-properties.h
+++ b/include/hw/qdev-properties.h
@@ -249,7 +249,6 @@ void qdev_prop_set_enum(DeviceState *dev, const char =
*name, int value);
 void qdev_prop_set_ptr(DeviceState *dev, const char *name, void *value);
=20
 void qdev_prop_register_global(GlobalProperty *prop);
-void qdev_prop_register_global_list(GlobalProperty *props);
 int qdev_prop_check_globals(void);
 void qdev_prop_set_globals(DeviceState *dev);
 void error_set_from_qdev_prop_error(Error **errp, int ret, DeviceState *=
dev,
diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index ab61d502fd..bd84c4ea4c 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -1180,15 +1180,6 @@ void qdev_prop_register_global(GlobalProperty *pro=
p)
     global_props =3D g_list_append(global_props, prop);
 }
=20
-void qdev_prop_register_global_list(GlobalProperty *props)
-{
-    int i;
-
-    for (i =3D 0; props[i].driver !=3D NULL; i++) {
-        qdev_prop_register_global(props+i);
-    }
-}
-
 int qdev_prop_check_globals(void)
 {
     GList *l;
diff --git a/tests/test-qdev-global-props.c b/tests/test-qdev-global-prop=
s.c
index ccdf6c57c1..b1eb505442 100644
--- a/tests/test-qdev-global-props.c
+++ b/tests/test-qdev-global-props.c
@@ -89,6 +89,16 @@ static void test_static_prop(void)
     g_test_trap_assert_stdout("");
 }
=20
+static void register_global_properties(GlobalProperty *props)
+{
+    int i;
+
+    for (i =3D 0; props[i].driver !=3D NULL; i++) {
+        qdev_prop_register_global(props + i);
+    }
+}
+
+
 /* Test setting of static property using global properties */
 static void test_static_globalprop_subprocess(void)
 {
@@ -98,7 +108,7 @@ static void test_static_globalprop_subprocess(void)
         {}
     };
=20
-    qdev_prop_register_global_list(props);
+    register_global_properties(props);
=20
     mt =3D STATIC_TYPE(object_new(TYPE_STATIC_PROPS));
     qdev_init_nofail(DEVICE(mt));
@@ -216,7 +226,7 @@ static void test_dynamic_globalprop_subprocess(void)
     };
     int global_error;
=20
-    qdev_prop_register_global_list(props);
+    register_global_properties(props);
=20
     mt =3D DYNAMIC_TYPE(object_new(TYPE_DYNAMIC_PROPS));
     qdev_init_nofail(DEVICE(mt));
@@ -261,7 +271,7 @@ static void test_dynamic_globalprop_nouser_subprocess=
(void)
     };
     int global_error;
=20
-    qdev_prop_register_global_list(props);
+    register_global_properties(props);
=20
     mt =3D DYNAMIC_TYPE(object_new(TYPE_DYNAMIC_PROPS));
     qdev_init_nofail(DEVICE(mt));
@@ -299,7 +309,7 @@ static void test_subclass_global_props(void)
         {}
     };
=20
-    qdev_prop_register_global_list(props);
+    register_global_properties(props);
=20
     mt =3D STATIC_TYPE(object_new(TYPE_SUBCLASS));
     qdev_init_nofail(DEVICE(mt));
--=20
2.19.1.708.g4ede3d42df

