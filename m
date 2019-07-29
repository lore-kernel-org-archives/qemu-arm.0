Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp3252862wrv;
        Mon, 29 Jul 2019 08:05:08 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzizeVoKq5d21OxGkxvSEONJStnWsAESj7gpiss4ymolIq6dJC12slx/Ip/LF3gF1bT6tS7
X-Received: by 2002:a37:a116:: with SMTP id k22mr73083137qke.53.1564412704215;
        Mon, 29 Jul 2019 08:05:04 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c5si13384806uam.152.2019.07.29.08.05.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Jul 2019 08:05:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=mwdMFUne;
       arc=fail (body hash mismatch);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hs7Cx-0005aa-DL
	for alex.bennee@linaro.org; Mon, 29 Jul 2019 11:05:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38584)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <damien.hedde@greensocs.com>) id 1hs78A-0005Tz-41
 for qemu-arm@nongnu.org; Mon, 29 Jul 2019 11:00:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.com>) id 1hs789-0005Zs-0Y
 for qemu-arm@nongnu.org; Mon, 29 Jul 2019 11:00:06 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:48394)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.com>)
 id 1hs788-0004hE-Pi; Mon, 29 Jul 2019 11:00:04 -0400
Received: from kouign-amann.bar.greensocs.com (unknown [172.16.11.117])
 by beetle.greensocs.com (Postfix) with ESMTPS id 742BC96F88;
 Mon, 29 Jul 2019 14:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1564412352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k5fLNLBjdV6+7E7c/JKPYT8WFMywRHAMb8K8XSSC0BM=;
 b=mwdMFUnet1WK6hOZ0GrybZr8G+dn0AH10yKxU5oDeUEphyHFiFGd8eRbQH8FQZe7DQu4H7
 t3vxPWw7KQTdU71Fb1hL0S3bisVf6/eNoi3iN2BLepy+cSEN48jB/B4BAiJqh2q1SKq17Y
 hhIPIXONAGZwFDXTK5bvSjeXt3yZHlQ=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Date: Mon, 29 Jul 2019 16:56:37 +0200
Message-Id: <20190729145654.14644-17-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190729145654.14644-1-damien.hedde@greensocs.com>
References: <20190729145654.14644-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1564412352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=k5fLNLBjdV6+7E7c/JKPYT8WFMywRHAMb8K8XSSC0BM=;
 b=J+UF4NDQCEMvalc7fEX9SKb/5TkfNcyuduk3yQbJ7TvDMubHIzfXCG0tOXdmwD+d6VyiXR
 o11Kz/Gr6KzjWhxO0b8ZqQ8RALCQh67FXxoVSpqcUMW5+nRTowvKjxlYRlJSfsmqYx2Y2+
 I+HBy1/pdXgu3krMN3+H5Kn4BGtDgXg=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1564412352; a=rsa-sha256; cv=none;
 b=5Su81pOKhapiikKTtXG6b97g+L6xc017m9bBhDMrB7veGYBnmqNn0vL6N6vomym4+RWlTX
 jhhFE5hlT/2a+YDrattV0QjRUBJqMfOmm0ZxMikIosHqpWpD9PowW1GaHynG7GZqgmVCxz
 gsmgmfAxpwUhX1PFkOwTnmp80/YU+JY=
ARC-Authentication-Results: i=1;
	beetle.greensocs.com;
	none
X-Spam: Yes
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 5.135.226.135
Subject: [Qemu-arm] [PATCH v3 16/33] hw/input/adb.c: remove qdev_reset_all
 call
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
X-TUID: vSZYwzDS1Oij

Replace deprecated qdev_reset_all by device_reset_warm.

This does not impact the behavior.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 hw/input/adb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/input/adb.c b/hw/input/adb.c
index 1446f32521..6b35682aba 100644
--- a/hw/input/adb.c
+++ b/hw/input/adb.c
@@ -32,7 +32,7 @@
=20
 static void adb_device_reset(ADBDevice *d)
 {
-    qdev_reset_all(DEVICE(d));
+    device_reset_warm(DEVICE(d));
 }
=20
 int adb_request(ADBBusState *s, uint8_t *obuf, const uint8_t *buf, int l=
en)
--=20
2.22.0

