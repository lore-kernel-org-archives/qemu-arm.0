Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp2088572wrw;
        Wed, 7 Nov 2018 04:45:25 -0800 (PST)
X-Google-Smtp-Source: AJdET5fNvGCfH1NHxd5YUlQfPj4/udDjy7kAH7JSQZW+1Tr3780eLyt9GlUL3TM5IzSE2UiZ9xlD
X-Received: by 2002:a05:6214:110e:: with SMTP id e14mr86345qvs.10.1541594725076;
        Wed, 07 Nov 2018 04:45:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541594725; cv=none;
        d=google.com; s=arc-20160816;
        b=PGoeXkuqlPy5lptSVPne5ej3kRTFH1igAY/QIg/U65jqsfpcNnTuL/EsQvGxG+Lrk3
         h9jnwS101e+vUgKuSsktlGD3CWQtYJBJ7/7xnr1XJj25vhQbxvn+UZOuf8tlRQsGNgWw
         qkh4X0eMrCVFHKdvOJYbUaIyXPw2rn9VPQbMBcB9hjsFA3UFW1pVBUvFoWoR7ZyOGrP0
         eSN8c7kvDzUVWoaYl+uu/05+BDdZTdtme04xNxKEaNtHUjPeQUOkPlnJbJfkLaL5gRaq
         f88Ah4fdci2dkM3Cj8677sH+ziwBQd3FLyHiEekZbnHNuJOO0oI1gHEM3SiTSpa2Faji
         32Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=bQNJ+mFCGL8+hgYwkeVKMucsrtxMi+Hr+Re3rxU0GxI=;
        b=n+bAVaXwn5FXhVcaYcRsi/Rw1gUWofQkmP6JBz4n2iV41p8RjWtQtsi9NQgVkOQGcW
         2StMTB2dKD1DGNGX+Ev5CCu+YPLZ52PFY8f1xlLoHXYzoGRU3whLOgfg8uJtW/vxxUMZ
         asjFumG9y02SF2+MuTrpx1heAz6zST+tpykSezkrucGAqXDVDCRAlSSXlyu/y+heypT7
         NNoLfplkoIdIHVENwqefvBip6kUWuwkbwiRst+L4oz6bMATc4Y9vb8JzLJMr/Ls7cUVg
         0udhpLodySkI49J0s/AM96bCVfht32M558hVKWogdbK8OTUy2bWxbLA9O+AmuwcK0r0j
         2waA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p11si393946qtn.50.2018.11.07.04.45.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Nov 2018 04:45:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47663 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gKND2-0006vD-Kc
	for alex.bennee@linaro.org; Wed, 07 Nov 2018 07:45:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37768)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1gKN70-0007wy-Po
	for qemu-arm@nongnu.org; Wed, 07 Nov 2018 07:39:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1gKN6z-0007Fj-NC
	for qemu-arm@nongnu.org; Wed, 07 Nov 2018 07:39:10 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53246)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
	id 1gKN6z-0007AF-0Z; Wed, 07 Nov 2018 07:39:09 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 443BDC0C7CA2;
	Wed,  7 Nov 2018 12:39:00 +0000 (UTC)
Received: from localhost (ovpn-112-43.ams2.redhat.com [10.36.112.43])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3BBB15D75C;
	Wed,  7 Nov 2018 12:38:54 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  7 Nov 2018 16:36:51 +0400
Message-Id: <20181107123652.23417-14-marcandre.lureau@redhat.com>
In-Reply-To: <20181107123652.23417-1-marcandre.lureau@redhat.com>
References: <20181107123652.23417-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 07 Nov 2018 12:39:00 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH for-3.2 v3 13/14] hw/i386: add pc-i440fx-3.2 &
 pc-q35-3.2
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
X-TUID: 5SPRTETYZVHw

The following patch is going to add compatiblity parameters for
qemu <=3D 3.1.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 include/hw/compat.h  |  3 +++
 include/hw/i386/pc.h |  3 +++
 hw/i386/pc_piix.c    | 21 ++++++++++++++++++---
 hw/i386/pc_q35.c     | 19 +++++++++++++++++--
 4 files changed, 41 insertions(+), 5 deletions(-)

diff --git a/include/hw/compat.h b/include/hw/compat.h
index 6f4d5fc647..70958328fe 100644
--- a/include/hw/compat.h
+++ b/include/hw/compat.h
@@ -1,6 +1,9 @@
 #ifndef HW_COMPAT_H
 #define HW_COMPAT_H
=20
+#define HW_COMPAT_3_1 \
+    /* empty */
+
 #define HW_COMPAT_3_0 \
     /* empty */
=20
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 136fe497b6..c37d4333a0 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -294,6 +294,9 @@ int e820_add_entry(uint64_t, uint64_t, uint32_t);
 int e820_get_num_entries(void);
 bool e820_get_entry(int, uint32_t, uint64_t *, uint64_t *);
=20
+#define PC_COMPAT_3_1 \
+    HW_COMPAT_3_1
+
 #define PC_COMPAT_3_0 \
     HW_COMPAT_3_0 \
     {\
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index dc09466b3e..ba371bfcd7 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -428,21 +428,36 @@ static void pc_i440fx_machine_options(MachineClass =
*m)
     machine_class_allow_dynamic_sysbus_dev(m, TYPE_RAMFB_DEVICE);
 }
=20
-static void pc_i440fx_3_0_machine_options(MachineClass *m)
+static void pc_i440fx_3_2_machine_options(MachineClass *m)
 {
     pc_i440fx_machine_options(m);
     m->alias =3D "pc";
     m->is_default =3D 1;
 }
=20
+DEFINE_I440FX_MACHINE(v3_2, "pc-i440fx-3.2", NULL,
+                      pc_i440fx_3_2_machine_options);
+
+static void pc_i440fx_3_1_machine_options(MachineClass *m)
+{
+    pc_i440fx_3_2_machine_options(m);
+    m->is_default =3D 0;
+    m->alias =3D NULL;
+    SET_MACHINE_COMPAT(m, PC_COMPAT_3_1);
+}
+
+static void pc_i440fx_3_0_machine_options(MachineClass *m)
+{
+    pc_i440fx_3_1_machine_options(m);
+    SET_MACHINE_COMPAT(m, PC_COMPAT_3_0);
+}
+
 DEFINE_I440FX_MACHINE(v3_0, "pc-i440fx-3.0", NULL,
                       pc_i440fx_3_0_machine_options);
=20
 static void pc_i440fx_2_12_machine_options(MachineClass *m)
 {
     pc_i440fx_3_0_machine_options(m);
-    m->is_default =3D 0;
-    m->alias =3D NULL;
     SET_MACHINE_COMPAT(m, PC_COMPAT_2_12);
 }
=20
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 532241e3f8..64d6ea65d5 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -311,19 +311,34 @@ static void pc_q35_machine_options(MachineClass *m)
     m->max_cpus =3D 288;
 }
=20
-static void pc_q35_3_0_machine_options(MachineClass *m)
+static void pc_q35_3_2_machine_options(MachineClass *m)
 {
     pc_q35_machine_options(m);
     m->alias =3D "q35";
 }
=20
+DEFINE_Q35_MACHINE(v3_2, "pc-q35-3.2", NULL,
+                   pc_q35_3_2_machine_options);
+
+static void pc_q35_3_1_machine_options(MachineClass *m)
+{
+    pc_q35_3_2_machine_options(m);
+    m->alias =3D NULL;
+    SET_MACHINE_COMPAT(m, PC_COMPAT_3_1);
+}
+
+static void pc_q35_3_0_machine_options(MachineClass *m)
+{
+    pc_q35_3_1_machine_options(m);
+    SET_MACHINE_COMPAT(m, PC_COMPAT_3_0);
+}
+
 DEFINE_Q35_MACHINE(v3_0, "pc-q35-3.0", NULL,
                     pc_q35_3_0_machine_options);
=20
 static void pc_q35_2_12_machine_options(MachineClass *m)
 {
     pc_q35_3_0_machine_options(m);
-    m->alias =3D NULL;
     SET_MACHINE_COMPAT(m, PC_COMPAT_2_12);
 }
=20
--=20
2.19.1.708.g4ede3d42df

