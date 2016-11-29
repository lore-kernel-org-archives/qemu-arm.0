Received: by 10.25.150.194 with SMTP id y185csp2426573lfd;
        Tue, 29 Nov 2016 08:13:04 -0800 (PST)
X-Received: by 10.233.239.204 with SMTP id d195mr23421313qkg.313.1480435984395;
        Tue, 29 Nov 2016 08:13:04 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u62si35200050qkd.232.2016.11.29.08.13.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Nov 2016 08:13:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:37843 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cBl1j-0004Xf-4c
	for alex.bennee@linaro.org; Tue, 29 Nov 2016 11:13:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40277)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cBkdi-0000Im-I2
	for qemu-arm@nongnu.org; Tue, 29 Nov 2016 10:48:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1cBkde-0005oO-G5
	for qemu-arm@nongnu.org; Tue, 29 Nov 2016 10:48:14 -0500
Received: from 11.mo1.mail-out.ovh.net ([188.165.48.29]:52315)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1cBkde-0005oD-9t
	for qemu-arm@nongnu.org; Tue, 29 Nov 2016 10:48:10 -0500
Received: from player795.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo1.mail-out.ovh.net (Postfix) with ESMTP id BCC161F93D
	for <qemu-arm@nongnu.org>; Tue, 29 Nov 2016 16:48:08 +0100 (CET)
Received: from hermes.lab.toulouse-stg.fr.ibm.com
	(deibp9eh1--blueice2n7.emea.ibm.com [195.212.29.169])
	(Authenticated sender: clg@kaod.org)
	by player795.ha.ovh.net (Postfix) with ESMTPSA id 2F7F51200B6;
	Tue, 29 Nov 2016 16:48:01 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Nov 2016 16:44:03 +0100
Message-Id: <1480434248-27138-26-git-send-email-clg@kaod.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1480434248-27138-1-git-send-email-clg@kaod.org>
References: <1480434248-27138-1-git-send-email-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Ovh-Tracer-Id: 11761150430051404561
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeelfedrfeejgddvtdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 188.165.48.29
Subject: [Qemu-arm] [PATCH for-2.9 25/30] block: add a model option for MTD
 devices
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
	Marcin Krzeminski <marcin.krzeminski@nokia.com>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UwnnzVXluuI8

This could be used to define the flash model to use on some boards
definitions.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Reviewed-by: Joel Stanley <joel@jms.id.au>
---
 blockdev.c                | 12 ++++++++++++
 include/sysemu/blockdev.h |  1 +
 qemu-options.hx           |  4 +++-
 3 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/blockdev.c b/blockdev.c
index 245e1e1d177a..bcc99365b86c 100644
--- a/blockdev.c
+++ b/blockdev.c
@@ -742,6 +742,10 @@ QemuOptsList qemu_legacy_drive_opts =3D {
             .type =3D QEMU_OPT_STRING,
             .help =3D "pci address (virtio only)",
         },{
+            .name =3D "model",
+            .type =3D QEMU_OPT_STRING,
+            .help =3D "flash model (mtd only)",
+        },{
             .name =3D "serial",
             .type =3D QEMU_OPT_STRING,
             .help =3D "disk serial number",
@@ -790,6 +794,7 @@ DriveInfo *drive_new(QemuOpts *all_opts, BlockInterfa=
ceType block_default_type)
     bool read_only =3D false;
     bool copy_on_read;
     const char *serial;
+    const char *model;
     const char *filename;
     Error *local_err =3D NULL;
     int i;
@@ -1076,6 +1081,12 @@ DriveInfo *drive_new(QemuOpts *all_opts, BlockInte=
rfaceType block_default_type)
         qdict_put(bs_opts, "rerror", qstring_from_str(rerror));
     }
=20
+    model =3D qemu_opt_get(legacy_opts, "model");
+    if (model && type !=3D IF_MTD) {
+        error_report("model is not supported by this bus type");
+        goto fail;
+    }
+
     /* Actual block device init: Functionality shared with blockdev-add =
*/
     blk =3D blockdev_init(filename, bs_opts, &local_err);
     bs_opts =3D NULL;
@@ -1102,6 +1113,7 @@ DriveInfo *drive_new(QemuOpts *all_opts, BlockInter=
faceType block_default_type)
     dinfo->unit =3D unit_id;
     dinfo->devaddr =3D devaddr;
     dinfo->serial =3D g_strdup(serial);
+    dinfo->model =3D g_strdup(model);
=20
     blk_set_legacy_dinfo(blk, dinfo);
=20
diff --git a/include/sysemu/blockdev.h b/include/sysemu/blockdev.h
index 16432f350805..10c66e5e86a4 100644
--- a/include/sysemu/blockdev.h
+++ b/include/sysemu/blockdev.h
@@ -39,6 +39,7 @@ struct DriveInfo {
     int cyls, heads, secs, trans;
     QemuOpts *opts;
     char *serial;
+    char *model;
     QTAILQ_ENTRY(DriveInfo) next;
 };
=20
diff --git a/qemu-options.hx b/qemu-options.hx
index 4a5b29f349f7..16add85bd0f5 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -517,7 +517,7 @@ DEF("drive", HAS_ARG, QEMU_OPTION_drive,
     "-drive [file=3Dfile][,if=3Dtype][,bus=3Dn][,unit=3Dm][,media=3Dd][,=
index=3Di]\n"
     "       [,cyls=3Dc,heads=3Dh,secs=3Ds[,trans=3Dt]][,snapshot=3Don|of=
f]\n"
     "       [,cache=3Dwritethrough|writeback|none|directsync|unsafe][,fo=
rmat=3Df]\n"
-    "       [,serial=3Ds][,addr=3DA][,rerror=3Dignore|stop|report]\n"
+    "       [,serial=3Ds][,model=3Dm][,addr=3DA][,rerror=3Dignore|stop|r=
eport]\n"
     "       [,werror=3Dignore|stop|report|enospc][,id=3Dname][,aio=3Dthr=
eads|native]\n"
     "       [,readonly=3Don|off][,copy-on-read=3Don|off]\n"
     "       [,discard=3Dignore|unmap][,detect-zeroes=3Don|off|unmap]\n"
@@ -570,6 +570,8 @@ the format.  Can be used to specify format=3Draw to a=
void interpreting
 an untrusted format header.
 @item serial=3D@var{serial}
 This option specifies the serial number to assign to the device.
+@item model=3D@var{model}
+This option specifies the model to use to create a flash device (if=3Dmt=
d only).
 @item addr=3D@var{addr}
 Specify the controller's PCI address (if=3Dvirtio only).
 @item werror=3D@var{action},rerror=3D@var{action}
--=20
2.7.4

