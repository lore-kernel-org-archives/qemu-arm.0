Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp3259382wrv;
        Mon, 29 Jul 2019 08:10:39 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxX2hCVOBeNkm+c971ah5PVlWKgf1gum7LQuimhguBQFH845JkETzMOOJh/C39bIXkYyPU+
X-Received: by 2002:a17:906:914:: with SMTP id i20mr18098660ejd.213.1564413039749;
        Mon, 29 Jul 2019 08:10:39 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e24si17222529ede.59.2019.07.29.08.10.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Jul 2019 08:10:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=4rccWn6D;
       arc=fail (body hash mismatch);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hs7IM-0000Hb-RP
	for alex.bennee@linaro.org; Mon, 29 Jul 2019 11:10:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39327)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <damien.hedde@greensocs.com>) id 1hs78x-00071D-T4
 for qemu-arm@nongnu.org; Mon, 29 Jul 2019 11:00:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.com>) id 1hs78w-0006Hx-EE
 for qemu-arm@nongnu.org; Mon, 29 Jul 2019 11:00:55 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:49056)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.com>)
 id 1hs78t-0005S7-OX; Mon, 29 Jul 2019 11:00:53 -0400
Received: from kouign-amann.bar.greensocs.com (unknown [172.16.11.117])
 by beetle.greensocs.com (Postfix) with ESMTPS id 54BC196F99;
 Mon, 29 Jul 2019 14:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1564412362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s5DLg4avO5acJBUhcvaCP8164eOHhmP4zzXa7H0ijdE=;
 b=4rccWn6Dt51xQZ6woZve8SwzUXLlCiwBE7NAGxXG5uNQ6bMYLLPs/0LnSF4oUfZRK/LI+7
 InK/umsVed0UPiAsAhxsKsCGyyfjHxQDjbyJ9v/3NEsvxoFleUnnSTqmSAwiXIJ2hw9hct
 lLo/CxqUv4eYhKTw63gmWpxLPqcA7fM=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Date: Mon, 29 Jul 2019 16:56:44 +0200
Message-Id: <20190729145654.14644-24-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190729145654.14644-1-damien.hedde@greensocs.com>
References: <20190729145654.14644-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1564412362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s5DLg4avO5acJBUhcvaCP8164eOHhmP4zzXa7H0ijdE=;
 b=n9ozJTx3x/bIv/kjMn4DspfRanTj/IRLDv3ILb+MuZmgqYVzX9hYfMjcyHsQJiVb2VtJal
 CqzbxQOuEo0rat1P7EVAfWwuTAyM61D1sfsnXaxAPVbgFSYlFOqY/MBCIqBrmyeADurWAQ
 9bU/TpFzS0lxrUOO/J0PCK4wPIOFKDs=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1564412362; a=rsa-sha256; cv=none;
 b=y7rkyq0nrFSiHkgjKEvx1tEge3WVcInBXdN2DoVWtXZDyA1Q12ZXBQHvHzorfrXxi14o/w
 Ea3Xq9GNPRqOFOyAPcvSNxElUp45vXRbHvxVjfe2xyetWDKtILDyGzBC9o5PiRRERv+pMw
 IgFSH5wLeyx/IQZu6yHLJiXTPVEMaFQ=
ARC-Authentication-Results: i=1;
	beetle.greensocs.com;
	none
X-Spam: Yes
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 5.135.226.135
Subject: [Qemu-arm] [PATCH v3 23/33] hw/scsi/vmw_pvscsi.c: remove
 device_legacy_reset call
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
X-TUID: Z+sTPjPl34A3

Replace legacy's reset call by device_reset_warm.

The new function propagates also the reset to the sub-buses tree but this=
 has
no impact since SCSIDevices have no child bus (neither generic device nor
disks).

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 hw/scsi/vmw_pvscsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/scsi/vmw_pvscsi.c b/hw/scsi/vmw_pvscsi.c
index 40fcf808a7..5be2227cc8 100644
--- a/hw/scsi/vmw_pvscsi.c
+++ b/hw/scsi/vmw_pvscsi.c
@@ -835,7 +835,7 @@ pvscsi_on_cmd_reset_device(PVSCSIState *s)
=20
     if (sdev !=3D NULL) {
         s->resetting++;
-        device_legacy_reset(&sdev->qdev);
+        device_reset_warm(&sdev->qdev);
         s->resetting--;
         return PVSCSI_COMMAND_PROCESSING_SUCCEEDED;
     }
--=20
2.22.0

