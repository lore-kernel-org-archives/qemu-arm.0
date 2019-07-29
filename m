Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp3248266wrv;
        Mon, 29 Jul 2019 08:01:29 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyg9/mbCVIFuArydSNZXdXE2Y17CFskOBOrqyr1f0UtM3kxA9jJzebHyrmr/N5YCtk8emxV
X-Received: by 2002:a50:fd0c:: with SMTP id i12mr99777152eds.55.1564412489316;
        Mon, 29 Jul 2019 08:01:29 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g2si16017351edh.299.2019.07.29.08.01.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 29 Jul 2019 08:01:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=v8KfFYqO;
       arc=fail (body hash mismatch);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hs79U-0007jE-Dm
	for alex.bennee@linaro.org; Mon, 29 Jul 2019 11:01:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37541)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <damien.hedde@greensocs.com>) id 1hs776-0003rf-9e
 for qemu-arm@nongnu.org; Mon, 29 Jul 2019 10:59:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.com>) id 1hs774-0004Ry-Tk
 for qemu-arm@nongnu.org; Mon, 29 Jul 2019 10:59:00 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:48004)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.com>)
 id 1hs774-0004Qa-5f; Mon, 29 Jul 2019 10:58:58 -0400
Received: from kouign-amann.bar.greensocs.com (unknown [172.16.11.117])
 by beetle.greensocs.com (Postfix) with ESMTPS id 111A496F5A;
 Mon, 29 Jul 2019 14:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1564412337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OSbZBrooUlpNiqJvIw0CUPHIsdjLEeJwNlZv9K17I/0=;
 b=v8KfFYqOpQf7oIDDzN8FDe+GM3Ck5jaZZZdxx7rXVBNQP4Wzf6fg41uVbvKnJWEqSBT9l/
 2+Lk6UkdkMtimU7nGwLpBzUC+9TUOC98BdFqLH1u3PLmfecY9nRZVGAaQ+L+hcUN+pSM/a
 aVBchxm52ZEUpyW1LbwJ2gVh1JBPMRU=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Date: Mon, 29 Jul 2019 16:56:26 +0200
Message-Id: <20190729145654.14644-6-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190729145654.14644-1-damien.hedde@greensocs.com>
References: <20190729145654.14644-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1564412337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OSbZBrooUlpNiqJvIw0CUPHIsdjLEeJwNlZv9K17I/0=;
 b=mepM0RO3/446PQmNi/jIsK+aRxRWVwfPQrnexUjsCJFysqtb++Nu+qZzuseswiCO+4tO5y
 2d7gAVbbD3q0weiYVqAcxlfZAt92p8HfxebPedy5s6Da41zqBfmbJ9c+lEQfFxi1BrriNV
 XYjFl3h1s88ymC91DpkVMnUuxX60A9E=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1564412337; a=rsa-sha256; cv=none;
 b=T+To/0nzF3o75zV9CtHv1QR9RVDEFuquB9MfCu8v8tj7rsP3LXFMKdVaAaEIKMBL7/Edlo
 5O2j2fgkvQEpsYRziu4n0DoajUkV0x21T5n7TZXrY7btonw/EBiajBNH5oUamB/4bdUVjX
 HEPhKS3upcwjLKCpOgQzGbQAnXAuqoo=
ARC-Authentication-Results: i=1;
	beetle.greensocs.com;
	none
X-Spam: Yes
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 5.135.226.135
Subject: [Qemu-arm] [PATCH v3 05/33] Switch to new api in qdev/bus
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
X-TUID: iwTq0TNfF67f

Deprecate old reset apis and make them use the new one while they
are still used somewhere.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 hw/core/qdev.c         | 22 +++-------------------
 include/hw/qdev-core.h | 28 ++++++++++++++++++++++------
 2 files changed, 25 insertions(+), 25 deletions(-)

diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index 559ced070d..e9e5f2d5f9 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -312,25 +312,9 @@ static void device_foreach_reset_child(Object *obj, =
void (*func)(Object *))
     }
 }
=20
-static int qdev_reset_one(DeviceState *dev, void *opaque)
-{
-    device_legacy_reset(dev);
-
-    return 0;
-}
-
-static int qbus_reset_one(BusState *bus, void *opaque)
-{
-    BusClass *bc =3D BUS_GET_CLASS(bus);
-    if (bc->reset) {
-        bc->reset(bus);
-    }
-    return 0;
-}
-
 void qdev_reset_all(DeviceState *dev)
 {
-    qdev_walk_children(dev, NULL, NULL, qdev_reset_one, qbus_reset_one, =
NULL);
+    device_reset(dev, false);
 }
=20
 void qdev_reset_all_fn(void *opaque)
@@ -340,7 +324,7 @@ void qdev_reset_all_fn(void *opaque)
=20
 void qbus_reset_all(BusState *bus)
 {
-    qbus_walk_children(bus, NULL, NULL, qdev_reset_one, qbus_reset_one, =
NULL);
+    bus_reset(bus, false);
 }
=20
 void qbus_reset_all_fn(void *opaque)
@@ -922,7 +906,7 @@ static void device_set_realized(Object *obj, bool val=
ue, Error **errp)
             }
         }
         if (dev->hotplugged) {
-            device_legacy_reset(dev);
+            device_reset(dev, true);
         }
         dev->pending_deleted_event =3D false;
=20
diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index eeb75611c8..1670ae41bb 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -109,6 +109,11 @@ typedef struct DeviceClass {
     bool hotpluggable;
=20
     /* callbacks */
+    /*
+     * Reset method here is deprecated and replaced by methods in the
+     * resettable class interface to implement a multi-phase reset.
+     * TODO: remove once every reset callback is unused
+     */
     DeviceReset reset;
     DeviceRealize realize;
     DeviceUnrealize unrealize;
@@ -455,19 +460,22 @@ bool bus_is_resetting(BusState *bus);
  */
 bool bus_is_reset_cold(BusState *bus);
=20
-void qdev_reset_all(DeviceState *dev);
-void qdev_reset_all_fn(void *opaque);
-
 /**
- * @qbus_reset_all:
- * @bus: Bus to be reset.
+ * qbus/qdev_reset_all:
+ * @bus/dev: Bus/Device to be reset.
  *
- * Reset @bus and perform a bus-level ("hard") reset of all devices conn=
ected
+ * Reset @bus/dev and perform a bus-level reset of all devices/buses con=
nected
  * to it, including recursive processing of all buses below @bus itself.=
  A
  * hard reset means that qbus_reset_all will reset all state of the devi=
ce.
  * For PCI devices, for example, this will include the base address regi=
sters
  * or configuration space.
+ *
+ * Theses functions are deprecated, please use device/bus_reset or
+ * resettable_reset_* instead
+ * TODO: remove them when all occurence are removed
  */
+void qdev_reset_all(DeviceState *dev);
+void qdev_reset_all_fn(void *opaque);
 void qbus_reset_all(BusState *bus);
 void qbus_reset_all_fn(void *opaque);
=20
@@ -489,9 +497,17 @@ void qdev_machine_init(void);
  * device_legacy_reset:
  *
  * Reset a single device (by calling the reset method).
+ *
+ * This function is deprecated, please use device_reset() instead.
+ * TODO: remove the function when all occurences are removed.
  */
 void device_legacy_reset(DeviceState *dev);
=20
+/**
+ * device_class_set_parent_reset:
+ * TODO: remove the function when DeviceClass's reset method
+ * is not used anymore.
+ */
 void device_class_set_parent_reset(DeviceClass *dc,
                                    DeviceReset dev_reset,
                                    DeviceReset *parent_reset);
--=20
2.22.0

