Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp544315wru;
        Wed, 3 Jul 2019 02:07:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyUvQOLE9iMsRoBZUH+WOmOE4QNGJwkMpcHE+f05eXBbvwK6u3Ym8mjwVSOQaK97G1l10jc
X-Received: by 2002:a17:906:fae0:: with SMTP id lu32mr33026308ejb.283.1562144841221;
        Wed, 03 Jul 2019 02:07:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562144841; cv=none;
        d=google.com; s=arc-20160816;
        b=mfxDQVG3sDP9IySPghS8QCSksB4oT2JI2dn/HWM6dm+XT9ly8csRsb6NP1KHqd3C3d
         c2bcTqo4vg8WF/hwpdl6IeR7fpj0o1JtsJ1gOxNEsL0nitZ2z16L/frcWjMHjVlvd1Yl
         pUreHQ9UoE+ky9gRYyKlFPsApBPe4lH2U7P7ENE0ykQXX0TkBN6YwbetEFx+ridQDINE
         Hq9Kfiasc2uUglb3m4U2XWQsMcC6zuUANRhiIhTYcIn028q+ZRUf8oGwEEpYss/00skI
         eioxT19Oq7ge0iHHY/6QdNY5O/DRLz5sahEdq7Gxt1fpGyHSXI2rWAKf/1CdVsmEdz1V
         fxBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=5Bwd/DhBhjh4qWaVYfGgpaUup9VlualZXeyWE9hrSPk=;
        b=WXDffJHZiy6jYOsgyAEktZWfG81TWTZhqtybZlDcMomL6YUyRdfO2GYSLpmzouRI4S
         yDoJPv1wJA+dtNioD3Yv+cm+U/TNbYAqgRs/LgOErlbcTpqnBLc92Klj13TVbChNihwR
         20hVPfOp0h0vmikkM+aul+NAvZpuOJkNCR6Kk0bc79EECmn7N7BnxLK2Usk6aUt+8pHW
         wLiq0I50YQL4IwiVUDcDD2FmjQDziVaMLj/sq9aQPAP+d58mISlWlNvMmW1aGqXruQVv
         XmHnVeGrHKkd/RLvJdAOCm6mwie1etLyI67OkNaVHWakXp7sp4G3M9Mhb0JUhxQKiiGh
         aw3w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g41si1567480edc.339.2019.07.03.02.07.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 03 Jul 2019 02:07:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hibEW-00051U-A3
	for alex.bennee@linaro.org; Wed, 03 Jul 2019 05:07:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55132)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kraxel@redhat.com>) id 1hib2Q-000486-5C
 for qemu-arm@nongnu.org; Wed, 03 Jul 2019 04:54:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1hib2P-0003sQ-89
 for qemu-arm@nongnu.org; Wed, 03 Jul 2019 04:54:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42746)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>)
 id 1hib2P-00030G-2I; Wed, 03 Jul 2019 04:54:49 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9536A3081244;
 Wed,  3 Jul 2019 08:54:24 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-96.ams2.redhat.com
 [10.36.116.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 653E7891D2;
 Wed,  3 Jul 2019 08:54:17 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6E76B1747C; Wed,  3 Jul 2019 10:54:16 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  3 Jul 2019 10:54:14 +0200
Message-Id: <20190703085416.21837-3-kraxel@redhat.com>
In-Reply-To: <20190703085416.21837-1-kraxel@redhat.com>
References: <20190703085416.21837-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Wed, 03 Jul 2019 08:54:24 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PULL 2/4] virtio-gpu: check if the resource already
 exists in virtio_gpu_load()
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Li Qiang <liq3ea@163.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LDNAKR1zvfTp

From: Li Qiang <liq3ea@163.com>

While loading virtio-gpu, the data can be malicious, we
should check if the resource already exists.

Signed-off-by: Li Qiang <liq3ea@163.com>
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Message-id: 20190628161358.10400-1-liq3ea@163.com
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/virtio-gpu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 475a018c027c..25d9e327fc69 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -1002,6 +1002,11 @@ static int virtio_gpu_load(QEMUFile *f, void *opaq=
ue, size_t size,
=20
     resource_id =3D qemu_get_be32(f);
     while (resource_id !=3D 0) {
+        res =3D virtio_gpu_find_resource(g, resource_id);
+        if (res) {
+            return -EINVAL;
+        }
+
         res =3D g_new0(struct virtio_gpu_simple_resource, 1);
         res->resource_id =3D resource_id;
         res->width =3D qemu_get_be32(f);
--=20
2.18.1

