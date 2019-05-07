Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp3357307wrh;
        Tue, 7 May 2019 01:20:34 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwz73UORYOMIJUKNEpHitaFjnbHjUK3p8zKoRSRC1bO1+GGLrQKY52vBll8NKDmiIcxEYA+
X-Received: by 2002:a05:600c:230c:: with SMTP id 12mr20377192wmo.152.1557217234471;
        Tue, 07 May 2019 01:20:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557217234; cv=none;
        d=google.com; s=arc-20160816;
        b=Tslr7wNEQnLcjD8UAim6OPYfJuD5szj1uT1T7Unfw/2KG+Jclizd810InbpdT1J2v3
         SK+kZ4Nd6zUNUc9993urWVuFc+3KuHnoAPxkKALd7zfdNiCYul2bVEju2lv+FleY+qKu
         a0vAjzBDSybb3vFaN3MARXp4rFTE25VuwhigzN3htu1FDDgX0BHRnC8YfzGOqR9cwIfL
         EZJmWr3xFBScCT5c1b/1U1Zrj5rrciYFV5syRLsWcJrbxdIAFY/ZPvMszmRk0mVLBHPC
         gMS138i9C/mpHm0ZsNkR/mrffod2x0EbhMvWGBwHfspSvC3lai6Xmx3DSccCY9OxIBG+
         cSpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=5CfZiVkftWY/3ow9nrKpwJXnetUQ+lbdQLQWWg5uA8s=;
        b=C7WYF9gMEflgDdUkUNbBo76MwfkytqNmVB5tTdcq7mTeoIwB9FOy9W3CBZIqyNRcbD
         YFJud1m421k/PlEBjFmcyXkWw9YpU88rkgmHFXvdsSl134/BFYfwZpaF6gCGi5vtmpvd
         TJTCA0fnRx4QsdsJ1Gp01Dd4cUba75vsQ67e3YevNud5SfNhIa41lf2Czkf2j236el9Z
         DsEXMwcvJbULwSewbfatkx6hg+O98hivRwK4NAOQsPw++9SkPcEhyM/6BX+FHhinLgAq
         2jeglQzXo0BurITgSmTEys+ubA5w+DTC1ukZH56tBNPgbkdogFNMzLBWmdPYFSIqaEZR
         SJwg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k3si8277248wmi.124.2019.05.07.01.20.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 07 May 2019 01:20:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:42038 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hNvKz-0000zX-CV
	for alex.bennee@linaro.org; Tue, 07 May 2019 04:20:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57902)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hNvKM-0000eE-7b
	for qemu-arm@nongnu.org; Tue, 07 May 2019 04:19:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hNvKL-00089R-67
	for qemu-arm@nongnu.org; Tue, 07 May 2019 04:19:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45704)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1hNvKL-00088e-03; Tue, 07 May 2019 04:19:53 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3D8B8308338F;
	Tue,  7 May 2019 08:19:52 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-45.ams2.redhat.com
	[10.36.116.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 9369261B6C;
	Tue,  7 May 2019 08:19:47 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 98EACA1E3; Tue,  7 May 2019 10:19:46 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue,  7 May 2019 10:19:42 +0200
Message-Id: <20190507081946.19264-5-kraxel@redhat.com>
In-Reply-To: <20190507081946.19264-1-kraxel@redhat.com>
References: <20190507081946.19264-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Tue, 07 May 2019 08:19:52 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 4/8] vl: constify VGAInterfaceInfo
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
X-TUID: VhX6c5X1QJ2E

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Message-id: 20190412152713.16018-2-marcandre.lureau@redhat.com
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 vl.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/vl.c b/vl.c
index d9fea0a11966..6b2820483c43 100644
--- a/vl.c
+++ b/vl.c
@@ -2015,7 +2015,7 @@ typedef struct VGAInterfaceInfo {
     const char *class_names[2];
 } VGAInterfaceInfo;
=20
-static VGAInterfaceInfo vga_interfaces[VGA_TYPE_MAX] =3D {
+static const VGAInterfaceInfo vga_interfaces[VGA_TYPE_MAX] =3D {
     [VGA_NONE] =3D {
         .opt_name =3D "none",
     },
@@ -2061,7 +2061,7 @@ static VGAInterfaceInfo vga_interfaces[VGA_TYPE_MAX=
] =3D {
=20
 static bool vga_interface_available(VGAInterfaceType t)
 {
-    VGAInterfaceInfo *ti =3D &vga_interfaces[t];
+    const VGAInterfaceInfo *ti =3D &vga_interfaces[t];
=20
     assert(t < VGA_TYPE_MAX);
     return !ti->class_names[0] ||
@@ -2076,7 +2076,7 @@ static void select_vgahw(const char *p)
=20
     assert(vga_interface_type =3D=3D VGA_NONE);
     for (t =3D 0; t < VGA_TYPE_MAX; t++) {
-        VGAInterfaceInfo *ti =3D &vga_interfaces[t];
+        const VGAInterfaceInfo *ti =3D &vga_interfaces[t];
         if (ti->opt_name && strstart(p, ti->opt_name, &opts)) {
             if (!vga_interface_available(t)) {
                 error_report("%s not available", ti->name);
--=20
2.18.1

