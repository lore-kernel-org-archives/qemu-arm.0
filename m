Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp5942544lfp;
        Tue, 18 Feb 2020 01:49:15 -0800 (PST)
X-Google-Smtp-Source: APXvYqwYlhky/ft/G1On30XpgsrwSiYm6AsAP7sYSMTnrIJY2lC8zkyAmFZcd5edVET5P32CHsl7
X-Received: by 2002:ad4:518d:: with SMTP id b13mr15744478qvp.141.1582019355689;
        Tue, 18 Feb 2020 01:49:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582019355; cv=none;
        d=google.com; s=arc-20160816;
        b=C4bD+NS4zg5U4gpKi5xGBGl+57kUMl8/pkIlkKYiEZbeXdSiLdW7MyfUcAE+1abYJf
         sbx+v39+d5jUbeUMuev9cYmY8qvT1NLSV3OHHW2ho5Hhct01oSjuRhL4hCoEzF5uDJiN
         JmeT+cglUV62MzUq3h4CNxm1fcvN3MmDTRSPpz/A+fEiSBMRMQDrv0Foh/nx5ev0Un3t
         EGQ7RTH5LIaPcE1VUt2e4XjTaLc67G7YqiUWwbXUUsmZz4rD0a53ApC25/XeyuSr5K70
         ds7xN7CebQ1x1Hrz58DbgX49fyGM83Hs1GRBPFgoKseJQ8fyPRBYR2cRywLXgtHBkj/+
         ErWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=02HoXPXFSTUgu0KD081ip91ymagPAPyI1gRkeiKZ3KI=;
        b=IyUwG+CfApaUZyysEQMXEFE8LN7LO38YZkwfSjHmFjbtFfvcJpwaGh7TFfLqt0Cl+I
         Jb2TZ9362UvTG28w6UY2HYOfAUFl7mKduAs2OG+eSd9GDjokKgpjKi4KxYTNQpQGuVfZ
         MBjOTU+GW1Sxobjm8SciYHEV1PDF+f1EqPQczz/TQHzMD4+sVoU+o7auNsRbI4C1rsq/
         zdAzCwycWVF4aQUja9TaDoQY72qHyIT4+hmkkTSUEuvPn6mwiIDdVWvSzxmLHbYdQOSF
         W32bfo32qiRHMIvqVM006CeHE0oh36YeJ/tzxNChAEJfo3G0/k1VQmC+0h8skp3sITeU
         calA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Vm4OIrEw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p10si1426877qvo.39.2020.02.18.01.49.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Feb 2020 01:49:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Vm4OIrEw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3zVD-0000CA-3G
	for alex.bennee@linaro.org; Tue, 18 Feb 2020 04:49:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43550)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j3zQa-0001mz-Ji
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 04:44:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j3zQZ-00061k-Is
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 04:44:28 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:44365
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j3zQZ-00060R-Ec
 for qemu-arm@nongnu.org; Tue, 18 Feb 2020 04:44:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582019067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=02HoXPXFSTUgu0KD081ip91ymagPAPyI1gRkeiKZ3KI=;
 b=Vm4OIrEwT+hpm4Kythrdkr/pkpeNwBuBILQvg4SIKGgEbCUb7m/4gKGloPNuo1YZoKkZvz
 otIFCZvM6XRYZRsWp2uIqJbFyPedpfOBIgMunOA+5h+zZEgoh3wjRTlMO8y4y9AvUhZ6JH
 m4GpqFYZF2SduWX4YY0jbE3nMT9gfZc=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-200-pFm8ohICO26EFBTWVxtjjw-1; Tue, 18 Feb 2020 04:44:23 -0500
Received: by mail-wm1-f72.google.com with SMTP id n17so797107wmk.1
 for <qemu-arm@nongnu.org>; Tue, 18 Feb 2020 01:44:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vA3IsJyKAQofk6HtSuxZl4Ss0klNULH/CRlFylcfG4k=;
 b=FOOMfulAYO5A3d2wgD0xZu7OhLUDcW1YJNy8KsoWX2mVduN+YQoIYp+XBI3KDQuCwj
 z7tpwjmpzivTLNT0zHcWVRZjSyQv9oP60zzDaaNk7Uz4X365ooAGRmwYvArzHEebRHBn
 8dys7ctOT7el4NxopYrSdJJa0p8z5/qrwjhQiEl+xd88mAlkl755nqylkwF3Fo6e8rLR
 255nnVsT+UkJN/t1SVD+0UzOp/TCArC7dRoVTOJZAU1xXmfs+XvZ4P7XUqKAiLGUWtzt
 MJFwsQd8lBnDbsYo1B2l0TAa6JaQQrcCUEq3b+jzMQ7SSu8bripvn3H9wv7+5EvDSF2e
 HKMA==
X-Gm-Message-State: APjAAAW5iaBqirnyKdvwY0f7DKjFLnOIIJnCh9Yi9jO25lmtI7N9ymYt
 f1Kh17bqLgVqPagwpI1B7yenR/kOwyuEiZU2XtEpsC7prSpvT0Yom5y3a7Xa2+NXeeCOqpHPQ1f
 vjHaicFb5zCzs
X-Received: by 2002:a7b:c76a:: with SMTP id x10mr2165451wmk.49.1582019061849; 
 Tue, 18 Feb 2020 01:44:21 -0800 (PST)
X-Received: by 2002:a7b:c76a:: with SMTP id x10mr2165430wmk.49.1582019061660; 
 Tue, 18 Feb 2020 01:44:21 -0800 (PST)
Received: from x1w.redhat.com (78.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.78])
 by smtp.gmail.com with ESMTPSA id z10sm2735588wmk.31.2020.02.18.01.44.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Feb 2020 01:44:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH RESEND 08/13] hw/vfio/display: Remove superfluous semicolon
Date: Tue, 18 Feb 2020 10:43:57 +0100
Message-Id: <20200218094402.26625-9-philmd@redhat.com>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200218094402.26625-1-philmd@redhat.com>
References: <20200218094402.26625-1-philmd@redhat.com>
MIME-Version: 1.0
X-MC-Unique: pFm8ohICO26EFBTWVxtjjw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>, Yuval Shaia <yuval.shaia.ml@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, qemu-trivial@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Julia Suvorova <jusual@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Aarushi Mehta <mehta.aaru20@gmail.com>,
 Richard Henderson <rth@twiddle.net>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <huth@tuxfamily.org>, Laurent Vivier <laurent@vivier.eu>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Vr8AB/B0WI/I

Fixes: 8b818e059bf
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
Cc: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/vfio/display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/vfio/display.c b/hw/vfio/display.c
index a5a608c5b2..f4977c66e1 100644
--- a/hw/vfio/display.c
+++ b/hw/vfio/display.c
@@ -287,7 +287,7 @@ static void vfio_display_dmabuf_update(void *opaque)
     VFIOPCIDevice *vdev =3D opaque;
     VFIODisplay *dpy =3D vdev->dpy;
     VFIODMABuf *primary, *cursor;
-    bool free_bufs =3D false, new_cursor =3D false;;
+    bool free_bufs =3D false, new_cursor =3D false;
=20
     primary =3D vfio_display_get_dmabuf(vdev, DRM_PLANE_TYPE_PRIMARY);
     if (primary =3D=3D NULL) {
--=20
2.21.1

