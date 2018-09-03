Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp2129937wrd;
        Sun, 2 Sep 2018 23:58:10 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdZ3F9tKVdkIkt8aDmNq5eGynWm+QsOyzceIYOiI5wfS5I/KJnuPjA2sFo8EAPwhcdhU5YiW
X-Received: by 2002:aed:2b83:: with SMTP id e3-v6mr24527229qtd.246.1535957890086;
        Sun, 02 Sep 2018 23:58:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535957890; cv=none;
        d=google.com; s=arc-20160816;
        b=OMTPfBvqMMLsus6gqwPWyqOXPuFj8WzZJoe4rgZdYq31wEss8loybkLAAKKmJAL401
         8OpSvLfy0HgqWdmB9PGUowkLWC220fUWPTHnJPIhuIZMvB0sLjgZ824WmQ2e1L8/xPjf
         yYeHxw3xL4cr5p8rNtICjI5XOdBTmN0D3DPiUM0QVOED8UxCG1ynbGYEbUHloueKxJ+4
         8jPxPRAvMPP6d6zdl+krR64HuAp64K56NeMjF3sd+CKONSNEAzNm/L7QPhNsZp/jSaDa
         rD1r8dmnu8N+m3cmBqbT0fkedw4nGxePsC8jPfjfQRrUfE0kMLvGURtIMqkkWX33lfR0
         0Yug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=sXz1p4S7eaA5W3X5cXPaIGEYKSrNmLLn6+b5/xmPzI0=;
        b=H3S38wOI48r+QoSyeFOFWsndLJMMnMSnz6RMmcjLRKhRlB1PjfU3Wi8vtaX46w2jw2
         dpux94CbTWhPvN+qCi6pfB4GrWnuoZWTuHYnPOjc1QMha8DDhOy7PB2XE6IJnY0WuquY
         xZx9OANtPZ9a8fId5QPh5sM7vpZ77i/BMAG/umjSaIaHD/aytzUujB31XQImjHWs2rA3
         d0/GqAAgRrpeSWj3DJtDG+uMgkJjH+4Y7HZb3A+qcN9aH0dVT8npNejsyou+kV4NNnVk
         EflIaHI2GL6Ko0bBMiOcmXAbAfiufPLw6tEpWXKuTIIbi1BlDeeurmk2ipmjkhqwftym
         dPMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t74-v6si950214qki.111.2018.09.02.23.58.09
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 02 Sep 2018 23:58:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43793 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fwioL-0001nF-Hs
	for alex.bennee@linaro.org; Mon, 03 Sep 2018 02:58:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58414)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fwio7-0001lN-HF
	for qemu-arm@nongnu.org; Mon, 03 Sep 2018 02:57:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1fwio4-0008CM-9w
	for qemu-arm@nongnu.org; Mon, 03 Sep 2018 02:57:55 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:36364 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1fwio4-0008BO-2q; Mon, 03 Sep 2018 02:57:52 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 220D340216E9;
	Mon,  3 Sep 2018 06:57:51 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-66.ams2.redhat.com
	[10.36.116.66])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D8BD61055535;
	Mon,  3 Sep 2018 06:57:46 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id F02F09B1A; Mon,  3 Sep 2018 08:57:45 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon,  3 Sep 2018 08:57:41 +0200
Message-Id: <20180903065745.23055-2-kraxel@redhat.com>
In-Reply-To: <20180903065745.23055-1-kraxel@redhat.com>
References: <20180903065745.23055-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Mon, 03 Sep 2018 06:57:51 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Mon, 03 Sep 2018 06:57:51 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'kraxel@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PULL 1/5] virtio-vga: fix reset
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
X-TUID: OIcsicppntqk

We must call the reset functions for both virtio-gpu
and vga to properly reset the combo device.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Message-id: 20180821111313.27792-2-kraxel@redhat.com
---
 include/hw/virtio/virtio-gpu.h | 1 +
 hw/display/virtio-gpu.c        | 2 +-
 hw/display/virtio-vga.c        | 6 +++++-
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gp=
u.h
index d0321672f4..a718b7233f 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -150,6 +150,7 @@ extern const GraphicHwOps virtio_gpu_ops;
     } while (0)
=20
 /* virtio-gpu.c */
+void virtio_gpu_reset(VirtIODevice *vdev);
 void virtio_gpu_ctrl_response(VirtIOGPU *g,
                               struct virtio_gpu_ctrl_command *cmd,
                               struct virtio_gpu_ctrl_hdr *resp,
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 3ddd29c0de..d6c9b02b86 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -1289,7 +1289,7 @@ static void virtio_gpu_instance_init(Object *obj)
 {
 }
=20
-static void virtio_gpu_reset(VirtIODevice *vdev)
+void virtio_gpu_reset(VirtIODevice *vdev)
 {
     VirtIOGPU *g =3D VIRTIO_GPU(vdev);
     struct virtio_gpu_simple_resource *res, *tmp;
diff --git a/hw/display/virtio-vga.c b/hw/display/virtio-vga.c
index 701d980872..50c72f26f4 100644
--- a/hw/display/virtio-vga.c
+++ b/hw/display/virtio-vga.c
@@ -179,8 +179,12 @@ static void virtio_vga_realize(VirtIOPCIProxy *vpci_=
dev, Error **errp)
 static void virtio_vga_reset(DeviceState *dev)
 {
     VirtIOVGA *vvga =3D VIRTIO_VGA(dev);
-    vvga->vdev.enable =3D 0;
=20
+    /* reset virtio-gpu */
+    virtio_gpu_reset(VIRTIO_DEVICE(&vvga->vdev));
+
+    /* reset vga */
+    vga_common_reset(&vvga->vga);
     vga_dirty_log_start(&vvga->vga);
 }
=20
--=20
2.9.3

