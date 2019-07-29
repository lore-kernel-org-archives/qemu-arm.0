Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp3263680wrv;
        Mon, 29 Jul 2019 08:14:22 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxKmelqpBETaad4u8jk97YqWizr/YU24JA9E3GPoj9XhXeM4Zu8/4mIE62FvjEe4RN3p1Rv
X-Received: by 2002:aed:36e8:: with SMTP id f95mr76848743qtb.88.1564413262188;
        Mon, 29 Jul 2019 08:14:22 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g25si11664813vsp.362.2019.07.29.08.14.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Jul 2019 08:14:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=QNTC4OP8;
       arc=fail (body hash mismatch);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hs7Lx-0000F1-NH
	for alex.bennee@linaro.org; Mon, 29 Jul 2019 11:14:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39402)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <damien.hedde@greensocs.com>) id 1hs794-00073I-AB
 for qemu-arm@nongnu.org; Mon, 29 Jul 2019 11:01:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.com>) id 1hs78y-0006Ji-2X
 for qemu-arm@nongnu.org; Mon, 29 Jul 2019 11:01:00 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:49066)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.com>)
 id 1hs78x-0005ZG-3G; Mon, 29 Jul 2019 11:00:55 -0400
Received: from kouign-amann.bar.greensocs.com (unknown [172.16.11.117])
 by beetle.greensocs.com (Postfix) with ESMTPS id F08FB9702E;
 Mon, 29 Jul 2019 14:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1564412368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X6a9yB+7WOaxY+qK9/kQ2MT/JV31qgwvuX92IoveZZc=;
 b=QNTC4OP8wnUjZckFl9TQNiZg5F3JNO7F8q8fshP/6FJ+iTiJhoNo+PmsM56el60+nb3I1m
 6y2AhnL+2h/k8zBm+RaOMdUvAG1Kfvk8bF7f4bs9nXcxFiHLM0ZqtP/Ukb1fx7Ez873rVf
 k5MKqB2Lp87XTeONIHv2nlDoFbWZoQ8=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Date: Mon, 29 Jul 2019 16:56:48 +0200
Message-Id: <20190729145654.14644-28-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190729145654.14644-1-damien.hedde@greensocs.com>
References: <20190729145654.14644-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1564412368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=X6a9yB+7WOaxY+qK9/kQ2MT/JV31qgwvuX92IoveZZc=;
 b=rIEvNpTiEw4NGTdnopR6kQIGPHKDDvWCetQdwsSBfCIah/t/nXLzJPuHNeKUSxr/2MxxKF
 GJr+tNsngNVE1RSKmh6grXvm1KqalseSQF/Gj/dyDT1j+Sdsold/qk7x8ce3/HQ+EU1KXq
 y1Vmhz10YgKhA1vsSdQYFy9bNfZp6/M=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1564412368; a=rsa-sha256; cv=none;
 b=UgzksAO3615upQ0mtA93qhU5YRgjXWxjUbiMqR5Iw0olCUPAy+KjKPs+ccTd6gS7xFeJNi
 3WlEOFsaiNTT+0xF/gj4yQZOWeRFf55INdfTvV9VeylHy8CwFWhUsXDZDcpiChHpaPeLih
 CNG3KgoXmTqxZBioSlbmWyyZN3TLDfk=
ARC-Authentication-Results: i=1;
	beetle.greensocs.com;
	none
X-Spam: Yes
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 5.135.226.135
Subject: [Qemu-arm] [PATCH v3 27/33] hw/ide/microdrive.c: remove
 device_legacy_reset calls
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
X-TUID: oxn9tk2ysm5c

Replace MicroDriveState legacy reset by device_reset_warm.

The new function propagates also the reset to the sub-buses tree.
The MicroDriveState has a child bus so it is now reset automatically
as well as all the qdev sub tree. It seems to me that IDE_BUS and
IDE_DEVICEs reset methods are not implemented so resetting the
qdev/qbus ide tree will have no effect.

Keep the explicit call to ide_bus_reset (in md_reset function) since
it is not called when using the standard reset method of the IDE_BUS
object.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 hw/ide/microdrive.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/ide/microdrive.c b/hw/ide/microdrive.c
index fc346f5ad5..afe2342da8 100644
--- a/hw/ide/microdrive.c
+++ b/hw/ide/microdrive.c
@@ -173,7 +173,7 @@ static void md_attr_write(PCMCIACardState *card, uint=
32_t at, uint8_t value)
     case 0x00:	/* Configuration Option Register */
         s->opt =3D value & 0xcf;
         if (value & OPT_SRESET) {
-            device_legacy_reset(DEVICE(s));
+            device_reset_warm(DEVICE(s));
         }
         md_interrupt_update(s);
         break;
@@ -316,7 +316,7 @@ static void md_common_write(PCMCIACardState *card, ui=
nt32_t at, uint16_t value)
     case 0xe:	/* Device Control */
         s->ctrl =3D value;
         if (value & CTRL_SRST) {
-            device_legacy_reset(DEVICE(s));
+            device_reset_warm(DEVICE(s));
         }
         md_interrupt_update(s);
         break;
@@ -541,7 +541,7 @@ static int dscm1xxxx_attach(PCMCIACardState *card)
     md->attr_base =3D pcc->cis[0x74] | (pcc->cis[0x76] << 8);
     md->io_base =3D 0x0;
=20
-    device_legacy_reset(DEVICE(md));
+    device_reset_warm(DEVICE(md));
     md_interrupt_update(md);
=20
     return 0;
@@ -551,7 +551,7 @@ static int dscm1xxxx_detach(PCMCIACardState *card)
 {
     MicroDriveState *md =3D MICRODRIVE(card);
=20
-    device_legacy_reset(DEVICE(md));
+    device_reset_warm(DEVICE(md));
     return 0;
 }
=20
--=20
2.22.0

