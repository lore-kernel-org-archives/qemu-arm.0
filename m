Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp3245863wrv;
        Mon, 29 Jul 2019 07:59:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzzBIUZW9/SKev3uac0+gO6fLzK2+OolRFaVzy2jbjGQvrWEZrU00vo6fLffHwfr1BQuVvi
X-Received: by 2002:a17:906:2409:: with SMTP id z9mr39322218eja.179.1564412357016;
        Mon, 29 Jul 2019 07:59:17 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w23si14713674eju.93.2019.07.29.07.59.16
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Jul 2019 07:59:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="y/nSaNI3";
       arc=fail (body hash mismatch);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hs77M-0003pv-4W
	for alex.bennee@linaro.org; Mon, 29 Jul 2019 10:59:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37443)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <damien.hedde@greensocs.com>) id 1hs771-0003io-Cd
 for qemu-arm@nongnu.org; Mon, 29 Jul 2019 10:58:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.com>) id 1hs770-0004O4-AF
 for qemu-arm@nongnu.org; Mon, 29 Jul 2019 10:58:55 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:47916)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.com>)
 id 1hs770-0004N6-24; Mon, 29 Jul 2019 10:58:54 -0400
Received: from kouign-amann.bar.greensocs.com (unknown [172.16.11.117])
 by beetle.greensocs.com (Postfix) with ESMTPS id CB8D696F57;
 Mon, 29 Jul 2019 14:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1564412333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aiqIrflaNa5CRchlhs9CsppxO8rAtOcqpCOtOp1k/GM=;
 b=y/nSaNI3ftY/Dq5tWvoieZ6AG3WpTgK2q089LYRUthhT9/3A3Eo17BP1WA0iVkgQ05IYO8
 Of7Gfr1h4VDFnOWevw/L3OlJ7DIvgBsiuI1zCTp2XeZfT54gLODTrrKnDaopS2ZfkRWAbt
 nBrkxri0RDwd7xTInUgk3dBtHwsX3xk=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Date: Mon, 29 Jul 2019 16:56:23 +0200
Message-Id: <20190729145654.14644-3-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190729145654.14644-1-damien.hedde@greensocs.com>
References: <20190729145654.14644-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1564412333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aiqIrflaNa5CRchlhs9CsppxO8rAtOcqpCOtOp1k/GM=;
 b=EMrJ6Y/iaFuBsQibLU0FN6ClIWd4wIuVbUdOkhxVDhCIoN8Xdtae2obZKPww/WefgFUi/Y
 0DUOYKtHhvBJhUQM6JRfIRDj7gA+2mpxX7wjawpOjYOK5hI6STQTk2dJUH1zwN/neRIFNQ
 Ib/UBZkTjBTWUIH0u3vjlIm70qRBNGM=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1564412333; a=rsa-sha256; cv=none;
 b=BScCHCRyXaFec7+DGK/1ylR21Ja4QM9+etlE1NgbhrlgMquU5P6sU+S8/on4WxW+Uc8DDU
 ofN4hpErXuTuO9+AVE9DCLOmBnaFkxmmGKfD3QiZgshgCMyAhLk2b/8ZvniqlHYXm+x8N6
 f8zb8tcwG2Xeh6QRGyuU7JDeKleOzGI=
ARC-Authentication-Results: i=1;
	beetle.greensocs.com;
	none
X-Spam: Yes
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 5.135.226.135
Subject: [Qemu-arm] [PATCH v3 02/33] add temporary device_legacy_reset
 function to replace device_reset
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
X-TUID: sB8rLJYdlW5j

Provide a temporary function doing what device_reset does to do the
transition with Resettable API which will trigger a prototype change
of device_reset.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 hw/core/qdev.c         | 6 +++---
 include/hw/qdev-core.h | 9 +++++++--
 2 files changed, 10 insertions(+), 5 deletions(-)

diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index 94ebc0a4a1..043e058396 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -256,7 +256,7 @@ HotplugHandler *qdev_get_hotplug_handler(DeviceState =
*dev)
=20
 static int qdev_reset_one(DeviceState *dev, void *opaque)
 {
-    device_reset(dev);
+    device_legacy_reset(dev);
=20
     return 0;
 }
@@ -864,7 +864,7 @@ static void device_set_realized(Object *obj, bool val=
ue, Error **errp)
             }
         }
         if (dev->hotplugged) {
-            device_reset(dev);
+            device_legacy_reset(dev);
         }
         dev->pending_deleted_event =3D false;
=20
@@ -1086,7 +1086,7 @@ void device_class_set_parent_unrealize(DeviceClass =
*dc,
     dc->unrealize =3D dev_unrealize;
 }
=20
-void device_reset(DeviceState *dev)
+void device_legacy_reset(DeviceState *dev)
 {
     DeviceClass *klass =3D DEVICE_GET_CLASS(dev);
=20
diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index e157fc4acd..690ce72433 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -407,11 +407,16 @@ char *qdev_get_own_fw_dev_path_from_handler(BusStat=
e *bus, DeviceState *dev);
 void qdev_machine_init(void);
=20
 /**
- * @device_reset
+ * device_legacy_reset:
  *
  * Reset a single device (by calling the reset method).
  */
-void device_reset(DeviceState *dev);
+void device_legacy_reset(DeviceState *dev);
+
+static inline void device_reset(DeviceState *dev)
+{
+    device_legacy_reset(dev);
+}
=20
 void device_class_set_parent_reset(DeviceClass *dc,
                                    DeviceReset dev_reset,
--=20
2.22.0

