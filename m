Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp3260018wrv;
        Mon, 29 Jul 2019 08:11:08 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz5Qpf4kx8wWYloxD+YRgm3NM3eKnxfJ1guaiYd5KI5fmYFgsbwNdFnwqqSpSyc/LTNRDOj
X-Received: by 2002:a67:ff19:: with SMTP id v25mr69290706vsp.48.1564413068713;
        Mon, 29 Jul 2019 08:11:08 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i26si20730300uan.36.2019.07.29.08.11.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Jul 2019 08:11:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=HlNjKQcM;
       arc=fail (body hash mismatch);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53231 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hs7Iq-00014c-8d
	for alex.bennee@linaro.org; Mon, 29 Jul 2019 11:11:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39401)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <damien.hedde@greensocs.com>) id 1hs794-00073H-AR
 for qemu-arm@nongnu.org; Mon, 29 Jul 2019 11:01:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.com>) id 1hs78y-0006Jx-4n
 for qemu-arm@nongnu.org; Mon, 29 Jul 2019 11:01:00 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:49064)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.com>)
 id 1hs78x-0005ZH-3s; Mon, 29 Jul 2019 11:00:55 -0400
Received: from kouign-amann.bar.greensocs.com (unknown [172.16.11.117])
 by beetle.greensocs.com (Postfix) with ESMTPS id 8950E9702D;
 Mon, 29 Jul 2019 14:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1564412366;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ktiT63C3qh5TZrbCabCo/OpHpi9eQGkR5JjcE/VjSh4=;
 b=HlNjKQcMc27bLTChaJLKPVXWY7hoAiNPxnOIZviZO4qyPAWpfu6QADe5fwW7nRDPLG9zHs
 fd3jdqwGFaNxH7c0fqo7IQoHzEutW00kV5+XAWFwAtjUmC6q0FaDY+f/pd6cVxylcw1M8Z
 Ql8PO6UxQz3r4KvLhco3pDo3DkUDfgc=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Date: Mon, 29 Jul 2019 16:56:47 +0200
Message-Id: <20190729145654.14644-27-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190729145654.14644-1-damien.hedde@greensocs.com>
References: <20190729145654.14644-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1564412366;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ktiT63C3qh5TZrbCabCo/OpHpi9eQGkR5JjcE/VjSh4=;
 b=Gt/EhTEZrrDQHDkdpyzEL8/qepLHd1f4VuZho0yLvzVK9x6gINTuwF3YyDcjdy0k+KUjLD
 K7w/U9uOWqqBksxcOZ29HWZ9NX7msRR33WRswJcuhBNFMTZGvNiHNwJYe7ey/h+64DkM4D
 Gz0uSUmqFwkOlBG8+24ZDb64kzlyi0w=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1564412366; a=rsa-sha256; cv=none;
 b=QmGwgVvFK2E2KgNlIQn/U7wMhdi7n22WLjek7SR52yo/XXP0Vqvp3qmgyCCVhYtGln3GYW
 FbQEyhI6+LOvRwNka/nCuvtiHIVv/c+hGD6kPozXKI4vjbh2qj/IB8m3to5xuLfGwkgpIh
 1gjyC6ea+c2tIaTDlIM8mwsWotmvJ+o=
ARC-Authentication-Results: i=1;
	beetle.greensocs.com;
	none
X-Spam: Yes
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 5.135.226.135
Subject: [Qemu-arm] [PATCH v3 26/33] hw/s390x/s390-pci-inst.c: remove
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
X-TUID: iBQBusH08bu1

Replace S390PCIBusDevice legacy reset by device_reset_warm.

The new function propagates also the reset to the sub-buses tree.
I'm not sure whether S390PCIBusDevice has bus children or not.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 hw/s390x/s390-pci-inst.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/s390x/s390-pci-inst.c b/hw/s390x/s390-pci-inst.c
index 93cda37c27..d7bca68245 100644
--- a/hw/s390x/s390-pci-inst.c
+++ b/hw/s390x/s390-pci-inst.c
@@ -242,7 +242,7 @@ int clp_service_call(S390CPU *cpu, uint8_t r2, uintpt=
r_t ra)
                 stw_p(&ressetpci->hdr.rsp, CLP_RC_SETPCIFN_FHOP);
                 goto out;
             }
-            device_legacy_reset(DEVICE(pbdev));
+            device_reset_warm(DEVICE(pbdev));
             pbdev->fh &=3D ~FH_MASK_ENABLE;
             pbdev->state =3D ZPCI_FS_DISABLED;
             stl_p(&ressetpci->fh, pbdev->fh);
--=20
2.22.0

