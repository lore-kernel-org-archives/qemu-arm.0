Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp3357366wrh;
        Tue, 7 May 2019 01:20:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwMvZqssLphc7gpA0rINxKEUjwv5K6dRZlH7qPXxQuq60KvjZ3aSwsibBqcHZIfoJL3BtjT
X-Received: by 2002:adf:8068:: with SMTP id 95mr20855018wrk.174.1557217239940;
        Tue, 07 May 2019 01:20:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557217239; cv=none;
        d=google.com; s=arc-20160816;
        b=tfDP2AxyRhGaCqRsJPGChHjun/kY1IrpLIg+bY9P2wSMzZQkfvAWXlTi/Jic/rX+u4
         4murF+aSSLg/X4tf7dz7uHugBE7ugiLY2Zj6j7rpvT03GP3e6Q2boPukHmFQ9Qu4Z5nG
         YSy2wB3XqFs2LpCk1cK8aKS+FwHnUqcoADbactM+U22o+EN5O0/R5+dR18aFaQ0oJlwG
         25sFGYmNIn+e2TIt/SZjSMaNf2kTO4lSn8lwPv6ed6/qGKPz0lP3JCRWlhT/MYaO4W0x
         uPlxLi0tN8csosTd1zg0DloLRhuzwa4KI50evPo7AxyoqY0vHnSbvxsNUPevlpQY3gL8
         J02w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=kvnhc47Iwf65Hq/fR0ew/48WA5GznF2dB4FmCj6mxcM=;
        b=qHIqhxK5OFcE+OUNecUgdNJHf36MMWlVFy+W8mEfewqN5RMPpqb1Gl7PSm2hd7LG0E
         nhcsYqH3jKiH0o2zlo2fVAbUuVps31GfWj8MpCAxyFoFKYXCIc4nYFH8XU5KPZsYY1Bk
         jhM5Fjd0kZw5V/Gu7FID3Kl46J7rdjekDEyKIkD8so5pLfkigmJ2QpjmbsJeQBDbvAJe
         qmkaNxmoqiBo8xYV4r/e6E1OEyTwOaWCjS2s0iK4SN660paWlg93KggFBILU30FC2Bo5
         jJbO9aVqS8HldPUThXRjLcL8/npoEtsXH4KQFxtgBUwL7GZ+0yODplwWuNEQd2/GgVFH
         91fw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v7si8573404wrr.42.2019.05.07.01.20.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 May 2019 01:20:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:42040 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hNvL2-00012K-VX
	for alex.bennee@linaro.org; Tue, 07 May 2019 04:20:37 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58029)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hNvKP-0000h1-9W
	for qemu-arm@nongnu.org; Tue, 07 May 2019 04:19:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hNvKO-0008CQ-6D
	for qemu-arm@nongnu.org; Tue, 07 May 2019 04:19:57 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43264)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1hNvKN-0008BS-UE; Tue, 07 May 2019 04:19:56 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 31900C007344;
	Tue,  7 May 2019 08:19:55 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-45.ams2.redhat.com
	[10.36.116.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C0B945B097;
	Tue,  7 May 2019 08:19:50 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id A145AA1E4; Tue,  7 May 2019 10:19:46 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  7 May 2019 10:19:43 +0200
Message-Id: <20190507081946.19264-6-kraxel@redhat.com>
In-Reply-To: <20190507081946.19264-1-kraxel@redhat.com>
References: <20190507081946.19264-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Tue, 07 May 2019 08:19:55 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 5/8] vl: add -vga help support
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
	Alistair Francis <alistair@alistair23.me>,
	BALATON Zoltan <balaton@eik.bme.hu>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2Z0E2HjnBV1n

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

Provide help output similar to other argument help handling:

$ qemu-system-x86_64 -vga help
none
std                  standard VGA (default)
cirrus               Cirrus VGA
vmware               VMWare SVGA
xenfb
qxl                  QXL VGA
virtio               Virtio VG

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Message-id: 20190412152713.16018-3-marcandre.lureau@redhat.com
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 vl.c | 40 +++++++++++++++++++++++++++++++---------
 1 file changed, 31 insertions(+), 9 deletions(-)

diff --git a/vl.c b/vl.c
index 6b2820483c43..b6709514c1bb 100644
--- a/vl.c
+++ b/vl.c
@@ -2069,11 +2069,39 @@ static bool vga_interface_available(VGAInterfaceT=
ype t)
            object_class_by_name(ti->class_names[1]);
 }
=20
-static void select_vgahw(const char *p)
+static const char *
+get_default_vga_model(const MachineClass *machine_class)
+{
+    if (machine_class->default_display) {
+        return machine_class->default_display;
+    } else if (vga_interface_available(VGA_CIRRUS)) {
+        return "cirrus";
+    } else if (vga_interface_available(VGA_STD)) {
+        return "std";
+    }
+
+    return NULL;
+}
+
+static void select_vgahw(const MachineClass *machine_class, const char *=
p)
 {
     const char *opts;
     int t;
=20
+    if (g_str_equal(p, "help")) {
+        const char *def =3D get_default_vga_model(machine_class);
+
+        for (t =3D 0; t < VGA_TYPE_MAX; t++) {
+            const VGAInterfaceInfo *ti =3D &vga_interfaces[t];
+
+            if (vga_interface_available(t) && ti->opt_name) {
+                printf("%-20s %s%s\n", ti->opt_name, ti->name ?: "",
+                       g_str_equal(ti->opt_name, def) ? " (default)" : "=
");
+            }
+        }
+        exit(0);
+    }
+
     assert(vga_interface_type =3D=3D VGA_NONE);
     for (t =3D 0; t < VGA_TYPE_MAX; t++) {
         const VGAInterfaceInfo *ti =3D &vga_interfaces[t];
@@ -4424,16 +4452,10 @@ int main(int argc, char **argv, char **envp)
=20
     /* If no default VGA is requested, the default is "none".  */
     if (default_vga) {
-        if (machine_class->default_display) {
-            vga_model =3D machine_class->default_display;
-        } else if (vga_interface_available(VGA_CIRRUS)) {
-            vga_model =3D "cirrus";
-        } else if (vga_interface_available(VGA_STD)) {
-            vga_model =3D "std";
-        }
+        vga_model =3D get_default_vga_model(machine_class);
     }
     if (vga_model) {
-        select_vgahw(vga_model);
+        select_vgahw(machine_class, vga_model);
     }
=20
     if (watchdog) {
--=20
2.18.1

