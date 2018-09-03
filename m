Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp2129957wrd;
        Sun, 2 Sep 2018 23:58:12 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdZ6Mex0GsnFIdpnFm2KHDCjooEANcC05WgOYyBFqN5nUavRFO+QT15GUpUSPIjq5hoiPq1x
X-Received: by 2002:ac8:204:: with SMTP id k4-v6mr10517128qtg.0.1535957892014;
        Sun, 02 Sep 2018 23:58:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535957892; cv=none;
        d=google.com; s=arc-20160816;
        b=jg20xm2+LgTJ7INuXmXCHD0QXzrlvxvHzAmprgQ657yKN/hrqUQqMEcBDIvX78utE6
         ZdJ0U0g9A3BHCtG2nJyFm6Wfh4UDOpApOCB4We9Ld/+HV7/GNqOBPavZ8Xcrbc/ZpmP7
         GUwjGbf/DVeNp6NGXPR4e3nUlH+2iGWkHKzC2SkkoZU6jdtYM90hC3Q3wdmxpe2Oc75g
         Rz4y8cdFHkh9gCABUlJyPSl2H69E654Z5WbjxYeCeQ+OHsOmn0nchwBKoyqnZBFXaxXM
         Zd7ta/piw/6yCdAvYQREAhsiETOrJ7xFTZOdSwhQZur4ZUaBfM0JsXbsSNW9pILWNVWL
         zbgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=LR3C8zHjNjwI4ENH2Pq5yatl1iDfC08+AfOvcS57UYc=;
        b=Pjl5ezq0RZRqKlWeVUmjR5i288rtlEI3th21ILc7xKq7QwDSNvMS/rfdJrwpQCCL8M
         nOyAmeo9zV5mmrSDuf5/IAHEEihRzk+LlPkSgXXjRQNdYd96xEKEHuA7OM+ZP6DRx1iQ
         GPkz9UvBnXTTHwaLKvPQDZ9LOAy+o5F95OLzAfzEAHTgfwt06OUCFSYl6peXmB3RPaaw
         SQJjOpfo8BKKRv9ehGRiwkBxiRmk65l7s0OE+nMnWXal+sJ6S9akhK+iwxt8tzEQDc+i
         RVWUMWAgQ+KJMPwBsy4llvGcr88yrjrHuw/ard2QsBkRMLwMowDQkVzJ5pfkG0P+2Osb
         LQUg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d1-v6si653813qth.268.2018.09.02.23.58.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 02 Sep 2018 23:58:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43794 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fwioN-0001nI-F4
	for alex.bennee@linaro.org; Mon, 03 Sep 2018 02:58:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58420)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fwio7-0001lR-I1
	for qemu-arm@nongnu.org; Mon, 03 Sep 2018 02:57:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fwio4-0008Cd-Bh
	for qemu-arm@nongnu.org; Mon, 03 Sep 2018 02:57:55 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:33488 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1fwio4-0008Bk-3w; Mon, 03 Sep 2018 02:57:52 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7A4C287A76;
	Mon,  3 Sep 2018 06:57:51 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-66.ams2.redhat.com
	[10.36.116.66])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D8F757C47;
	Mon,  3 Sep 2018 06:57:46 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 07E739B1B; Mon,  3 Sep 2018 08:57:46 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  3 Sep 2018 08:57:42 +0200
Message-Id: <20180903065745.23055-3-kraxel@redhat.com>
In-Reply-To: <20180903065745.23055-1-kraxel@redhat.com>
References: <20180903065745.23055-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Mon, 03 Sep 2018 06:57:51 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Mon, 03 Sep 2018 06:57:51 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'kraxel@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PULL 2/5] Revert "virtio-gpu: fix crashes upon warm
 reboot with vga mode"
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8F3XMEuzCGv2

This reverts commit 93f874fe9dbe0b997b5a9459840957efd13d7191.

Now with virtio-vga being resetted properly the
crash workaround is not needed any more.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Message-id: 20180821111313.27792-3-kraxel@redhat.com
---
 include/hw/virtio/virtio-gpu.h |  1 -
 hw/display/virtio-gpu.c        |  5 -----
 hw/display/virtio-vga.c        | 11 -----------
 3 files changed, 17 deletions(-)

diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gp=
u.h
index a718b7233f..2374f022e8 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -125,7 +125,6 @@ typedef struct VirtIOGPU {
         uint32_t bytes_3d;
     } stats;
=20
-    void (*disable_scanout)(struct VirtIOGPU *g, int scanout_id);
     Error *migration_blocker;
 } VirtIOGPU;
=20
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index d6c9b02b86..1cc953006f 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -421,11 +421,6 @@ static void virtio_gpu_disable_scanout(VirtIOGPU *g,=
 int scanout_id)
                                          scanout->height ?: 480,
                                          "Guest disabled display.");
     }
-
-    if (g->disable_scanout) {
-        g->disable_scanout(g, scanout_id);
-    }
-
     dpy_gfx_replace_surface(scanout->con, ds);
     scanout->resource_id =3D 0;
     scanout->ds =3D NULL;
diff --git a/hw/display/virtio-vga.c b/hw/display/virtio-vga.c
index 50c72f26f4..1e601c1a3b 100644
--- a/hw/display/virtio-vga.c
+++ b/hw/display/virtio-vga.c
@@ -75,16 +75,6 @@ static void virtio_vga_gl_block(void *opaque, bool blo=
ck)
     }
 }
=20
-static void virtio_vga_disable_scanout(VirtIOGPU *g, int scanout_id)
-{
-    VirtIOVGA *vvga =3D container_of(g, VirtIOVGA, vdev);
-
-    if (scanout_id =3D=3D 0) {
-        /* reset surface if needed */
-        vvga->vga.graphic_mode =3D -1;
-    }
-}
-
 static const GraphicHwOps virtio_vga_ops =3D {
     .invalidate =3D virtio_vga_invalidate_display,
     .gfx_update =3D virtio_vga_update_display,
@@ -166,7 +156,6 @@ static void virtio_vga_realize(VirtIOPCIProxy *vpci_d=
ev, Error **errp)
                                  vvga->vga_mrs, true);
=20
     vga->con =3D g->scanout[0].con;
-    g->disable_scanout =3D virtio_vga_disable_scanout;
     graphic_console_set_hwops(vga->con, &virtio_vga_ops, vvga);
=20
     for (i =3D 0; i < g->conf.max_outputs; i++) {
--=20
2.9.3

