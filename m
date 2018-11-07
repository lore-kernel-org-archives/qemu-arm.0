Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp2081668wrw;
        Wed, 7 Nov 2018 04:37:43 -0800 (PST)
X-Google-Smtp-Source: AJdET5fU1iKlidmItz4YkooXYdV/2V1I/YBD8pGelEGZXVHlzNSOhQL2xhWCmxmTO/bcyRsGGpyu
X-Received: by 2002:ac8:901:: with SMTP id t1-v6mr2274qth.335.1541594263565;
        Wed, 07 Nov 2018 04:37:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541594263; cv=none;
        d=google.com; s=arc-20160816;
        b=C/W0dTNDkQfywmgjGnLa1YbXyT1uwdte84pID2Ubgwi9e28ktdZvYwnc3ytMoi9f3x
         9uNWBTvQu5SUtUpbCxni1zYtt4dNXAiG3Rc/FBZcFX6bG4irtQkTNY1AqJZKFbRin/G9
         xaSGZKvwkvmgExFphTH3jamEqjs86fDzchgIqERVlhXN3GElsnxoeumKma74EO/98ebg
         7qHiVegrQa+T54tEakv53gXiG8dqTQNmoXdiyjszUYS5pw821anz2JP/fgrRh0XcOBSv
         xAz4sKzUq6F227mLwWLH150bY4vTYXf+qZz6APvvplUtT/4NnnzgHCNBgY4oWGU/6xhe
         EZcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=dGuAhxv/BWC0cgK2cGRWdXMi6YJ0C7VNgYbCOypXUgU=;
        b=vsm2vixtXc3TCmfxqHDVDmH1VICkaMT3P80aQtI2cNJqo9DSHxVsMEBb2/VOwqRBno
         7Q40WO7fSxja+gg7oWBuAt4B1QPysUT3IMF3ZuN6hRFuLxzqxqDj+Odl0meLpfxpeDld
         +QbomICvmKLhKqnj/gjxDdVlb1znn6nSHfF6u6XuzRC2q4iMBSynL+qOugwvP/4O421G
         1kBf0xZgDzRafB+s41PLQqHXyk2gXFkCc+LS6IEfVrtBOgfYdQ90tHsW/dmz0q8qgfm3
         d7ocG0UuPi/hcBEYwcRz5/d1AwrDE9twEPNN5+x0kJCwOqLwtcJBEZm9LYhalIPMJxHN
         OtCA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m70si354794qkl.245.2018.11.07.04.37.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Nov 2018 04:37:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47601 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gKN5b-0004AE-3U
	for alex.bennee@linaro.org; Wed, 07 Nov 2018 07:37:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36855)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1gKN5D-00041m-PN
	for qemu-arm@nongnu.org; Wed, 07 Nov 2018 07:37:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1gKN5A-000646-0r
	for qemu-arm@nongnu.org; Wed, 07 Nov 2018 07:37:18 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43840)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
	id 1gKN59-00060q-Ji; Wed, 07 Nov 2018 07:37:15 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C3EBE30D49D8;
	Wed,  7 Nov 2018 12:37:11 +0000 (UTC)
Received: from localhost (ovpn-112-43.ams2.redhat.com [10.36.112.43])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B5B4926368;
	Wed,  7 Nov 2018 12:37:05 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  7 Nov 2018 16:36:39 +0400
Message-Id: <20181107123652.23417-2-marcandre.lureau@redhat.com>
In-Reply-To: <20181107123652.23417-1-marcandre.lureau@redhat.com>
References: <20181107123652.23417-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Wed, 07 Nov 2018 12:37:12 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH for-3.2 v3 01/14] tests:
 qdev_prop_check_globals() doesn't return "all_used"
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
X-TUID: 1RrkXrP71m1X

Instead, it returns 1 if an error was detected, which is the case for:

/qdev/properties/dynamic/global/subprocess:
warning: global dynamic-prop-type-bad.prop3 has invalid class name
warning: global nohotplug-type.prop5=3D105 not used
warning: global nondevice-type.prop6 has invalid class name

Clarify the function return value.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 tests/test-qdev-global-props.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/test-qdev-global-props.c b/tests/test-qdev-global-prop=
s.c
index d81b0862d5..ccdf6c57c1 100644
--- a/tests/test-qdev-global-props.c
+++ b/tests/test-qdev-global-props.c
@@ -214,7 +214,7 @@ static void test_dynamic_globalprop_subprocess(void)
         { TYPE_NONDEVICE, "prop6", "106", true },
         {}
     };
-    int all_used;
+    int global_error;
=20
     qdev_prop_register_global_list(props);
=20
@@ -223,8 +223,8 @@ static void test_dynamic_globalprop_subprocess(void)
=20
     g_assert_cmpuint(mt->prop1, =3D=3D, 101);
     g_assert_cmpuint(mt->prop2, =3D=3D, 102);
-    all_used =3D qdev_prop_check_globals();
-    g_assert_cmpuint(all_used, =3D=3D, 1);
+    global_error =3D qdev_prop_check_globals();
+    g_assert_cmpuint(global_error, =3D=3D, 1);
     g_assert(props[0].used);
     g_assert(props[1].used);
     g_assert(!props[2].used);
@@ -259,7 +259,7 @@ static void test_dynamic_globalprop_nouser_subprocess=
(void)
         { TYPE_NONDEVICE, "prop6", "106" },
         {}
     };
-    int all_used;
+    int global_error;
=20
     qdev_prop_register_global_list(props);
=20
@@ -268,8 +268,8 @@ static void test_dynamic_globalprop_nouser_subprocess=
(void)
=20
     g_assert_cmpuint(mt->prop1, =3D=3D, 101);
     g_assert_cmpuint(mt->prop2, =3D=3D, 102);
-    all_used =3D qdev_prop_check_globals();
-    g_assert_cmpuint(all_used, =3D=3D, 0);
+    global_error =3D qdev_prop_check_globals();
+    g_assert_cmpuint(global_error, =3D=3D, 0);
     g_assert(props[0].used);
     g_assert(props[1].used);
     g_assert(!props[2].used);
--=20
2.19.1.708.g4ede3d42df

