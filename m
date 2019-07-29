Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp3252367wrv;
        Mon, 29 Jul 2019 08:04:42 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzXPPkZt2fF9lQ7gyildXS0gm4vsb6Z/s5+b/VEKcTemKV4ibXY9RFVkT1xNrwXn7cQDb7U
X-Received: by 2002:a67:db89:: with SMTP id f9mr63698677vsk.150.1564412682714;
        Mon, 29 Jul 2019 08:04:42 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n6si3290743vsq.264.2019.07.29.08.04.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Jul 2019 08:04:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=CRnX8qe0;
       arc=fail (body hash mismatch);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hs7Cc-0005CB-6M
	for alex.bennee@linaro.org; Mon, 29 Jul 2019 11:04:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38560)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <damien.hedde@greensocs.com>) id 1hs789-0005Rk-Ad
 for qemu-arm@nongnu.org; Mon, 29 Jul 2019 11:00:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.com>) id 1hs788-0005Yx-8r
 for qemu-arm@nongnu.org; Mon, 29 Jul 2019 11:00:05 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:48318)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.com>)
 id 1hs787-0004dW-9Z; Mon, 29 Jul 2019 11:00:04 -0400
Received: from kouign-amann.bar.greensocs.com (unknown [172.16.11.117])
 by beetle.greensocs.com (Postfix) with ESMTPS id A8AAC96F80;
 Mon, 29 Jul 2019 14:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1564412349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+91vMB90IqiygS2VUtck4RL8697UwbFWu26mMIWkdw0=;
 b=CRnX8qe026GQEAaDXQBd2ggC48dwqFGGn5pagINvKRYGrSk3G9PBDE8VcKJaB/lux7Hs7v
 6Iga05QGQcc8Z/hAJDO+zV0mCJ9QnQBmc4P/rLmD+9720xbvud9JdM2VZeKAQ+R5UxRwoC
 BivaGb/EqIA2tBQeSpfhGkxH6TH/yGg=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Date: Mon, 29 Jul 2019 16:56:35 +0200
Message-Id: <20190729145654.14644-15-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190729145654.14644-1-damien.hedde@greensocs.com>
References: <20190729145654.14644-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1564412349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+91vMB90IqiygS2VUtck4RL8697UwbFWu26mMIWkdw0=;
 b=450F/6l/g9GCHVtpHB9VwKd3hBbVOAZCjTNGjRy+FoFRBnnEccL+t5VXGVl7tjtrKjaeSJ
 NFxPrVLFORB44iDe0ZR8S07hwaLhCD1/0L9z1C/motJnz0wznwTHQocvZC/igSK6jlm1pu
 RosBOXLkvRR6NrGH3PFvkiHqTVS/wv8=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1564412349; a=rsa-sha256; cv=none;
 b=PlL37MMEOFGkjRiL0PUpFmiJOGLN388Z4jQJpcnclmCieBUs4iT1Nz9nK54l0yK/osQj52
 A2lBaO1VyKlIWfCh3bWi36JkgcfWpMt2d8tmzmpQio0WYRmjocL+1LnT+mugL/TJzsjqM/
 IE+8/n2VvXWTO5ApI3wOQXY4u/eVaxc=
ARC-Authentication-Results: i=1;
	beetle.greensocs.com;
	none
X-Spam: Yes
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 5.135.226.135
Subject: [Qemu-arm] [PATCH v3 14/33] hw/s390x/s390-virtio-ccw.c: remove
 qdev_reset_all call
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
Cc: fam@euphon.net, peter.maydell@linaro.org, walling@linux.ibm.com,
 dmitry.fleytman@gmail.com, mst@redhat.com, mark.cave-ayland@ilande.co.uk,
 kraxel@redhat.com, edgar.iglesias@xilinx.com, hare@suse.com,
 qemu-block@nongnu.org, david@redhat.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, marcel.apfelbaum@gmail.com,
 marcandre.lureau@redhat.com, rth@twiddle.net, thuth@redhat.com,
 ehabkost@redhat.com, alistair@alistair23.me, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, clg@kaod.org, jsnow@redhat.com,
 david@gibson.dropbear.id.au, Damien Hedde <damien.hedde@greensocs.com>,
 berrange@redhat.com, cohuck@redhat.com, mark.burton@greensocs.com,
 qemu-ppc@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PH5HYUMemSzE

Replace deprecated qdev_reset_all by device_reset_warm.

This does not impact the behavior.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 hw/s390x/s390-virtio-ccw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index 5b6a9a4e55..1d6b966817 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -104,7 +104,7 @@ static void subsystem_reset(void)
     for (i =3D 0; i < ARRAY_SIZE(reset_dev_types); i++) {
         dev =3D DEVICE(object_resolve_path_type("", reset_dev_types[i], =
NULL));
         if (dev) {
-            qdev_reset_all(dev);
+            device_reset_warm(dev);
         }
     }
 }
--=20
2.22.0

