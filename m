Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2093524wrg;
        Tue, 4 Jun 2019 09:29:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqymnPxDZ+se8rdhPL2Ef0uM4wIVTYuyqEMg3YOU3dWkgdgTuSfAmeztcRF/+RwxjV28+R1G
X-Received: by 2002:a37:7bc3:: with SMTP id w186mr28098634qkc.225.1559665798497;
        Tue, 04 Jun 2019 09:29:58 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g52si1301180qtg.18.2019.06.04.09.29.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 04 Jun 2019 09:29:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=CN8qRnad;
       arc=fail (body hash mismatch);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:55085 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hYCJx-0004DV-SQ
	for alex.bennee@linaro.org; Tue, 04 Jun 2019 12:29:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39214)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1hYCFv-0000XS-4H
	for qemu-arm@nongnu.org; Tue, 04 Jun 2019 12:25:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1hYCFt-0003X9-0z
	for qemu-arm@nongnu.org; Tue, 04 Jun 2019 12:25:47 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:40550)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <damien.hedde@greensocs.com>)
	id 1hYCFs-0003Vi-LO; Tue, 04 Jun 2019 12:25:44 -0400
Received: from kouign-amann.bar.greensocs.com (unknown [172.17.10.6])
	by beetle.greensocs.com (Postfix) with ESMTPSA id 2347496F5E;
	Tue,  4 Jun 2019 16:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
	s=mail; t=1559665543;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=BV0HcRaSIU6Sfthp4FZeZ/8eIR2NE6/Pg/vTMJGpqZY=;
	b=CN8qRnadXOPvK5WPEJ90QixXUOL/2WmYapH/CXsyaMZN0SWMS5Smitz7phifTBbNtiCmbw
	KKkwXd7jcUsrflZzb6tG/OkIoR+TwHvWIGMVdPsWKa1meqP0QMwc1aXJuCWuVsEeb98xgy
	GwJWsqZoGAksJQS4DXr6q/YSN6yYAP0=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Date: Tue,  4 Jun 2019 18:25:19 +0200
Message-Id: <20190604162526.10655-6-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190604162526.10655-1-damien.hedde@greensocs.com>
References: <20190604162526.10655-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
	s=mail; t=1559665543;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=BV0HcRaSIU6Sfthp4FZeZ/8eIR2NE6/Pg/vTMJGpqZY=;
	b=To0LJPRV0yTupyaEtrgPvojdbEkCbpEkDxfMvmiGgENOcIGLkf7nBfXoVaarFJjHitiwoC
	WjdkMAbukxkf74p+EzRKOLIj2wPH9DBm1g2pg5G6Mpb66MsD8J0cYB5froBfBK4yMTap3Y
	/gT6buEPxmtO0vigNNpPOcBNEGJIotc=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1559665543; a=rsa-sha256; cv=none;
	b=jBjUSTf86wY0KAec2FMpSLAU3aZf3ArCa/zJ00cB6Jh4rcXT6LPTgQbR3bNq9BqpYZuJ8P
	NAEs4hJI6PH3lWddY/ODlBdGr00dLzkCbjNLEDw4lggnqbAV25wtf8JY+Aue0QsfM1FMpM
	x38n6IQlARdWzeZlJnYaAtdmGhQfy4Y=
ARC-Authentication-Results: i=1; ORIGINATING;
	auth=pass smtp.auth=damien smtp.mailfrom=damien.hedde@greensocs.com
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 5.135.226.135
Subject: [Qemu-arm] [RFC PATCH v2 05/12] Add function to control reset with
 gpio inputs
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org,
	marc.burton@greensocs.com, alistair@alistair23.me,
	qemu-arm@nongnu.org, Damien Hedde <damien.hedde@greensocs.com>,
	marcandre.lureau@redhat.com, pbonzini@redhat.com,
	philmd@redhat.com, luc.michel@greensocs.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LB0lUiVkPkfv

It adds the possibility to add 2 gpios to control the warm and cold reset=
.
With theses ios, the reset can be maintained during some time.
Each io is associated with a state to detect level changes.

The cold reset io function is named power_gate as it is really the
meaning of this io.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 hw/core/qdev.c         | 57 ++++++++++++++++++++++++++++++++++++++++++
 include/hw/qdev-core.h | 44 ++++++++++++++++++++++++++++++++
 2 files changed, 101 insertions(+)

diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index 8c3911c2bd..89405398ae 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -429,6 +429,61 @@ void qdev_init_gpio_in(DeviceState *dev, qemu_irq_ha=
ndler handler, int n)
     qdev_init_gpio_in_named(dev, handler, NULL, n);
 }
=20
+static void device_reset_handler(DeviceState *dev, bool cold, bool level=
)
+{
+    DeviceResetInputState *dris;
+
+    dris =3D cold ? &dev->cold_reset_input : &dev->warm_reset_input;
+
+    if (level =3D=3D dris->state) {
+        /* io state has not changed */
+        return;
+    }
+
+    dris->state =3D level;
+    switch (dris->type) {
+    case DEVICE_ACTIVE_LOW:
+        level =3D !level;
+    case DEVICE_ACTIVE_HIGH:
+        if (level) {
+            resettable_assert_reset(OBJECT(dev), cold);
+        } else {
+            resettable_deassert_reset(OBJECT(dev));
+        }
+        break;
+    }
+}
+
+static void device_cold_reset_handler(void *opaque, int n, int level)
+{
+    device_reset_handler((DeviceState *) opaque, true, level);
+}
+
+static void device_warm_reset_handler(void *opaque, int n, int level)
+{
+    device_reset_handler((DeviceState *) opaque, false, level);
+}
+
+void qdev_init_reset_gpio_in_named(DeviceState *dev, const char *name,
+                                   bool cold, DeviceActiveType type)
+{
+    qemu_irq_handler handler;
+
+    if (cold) {
+        assert(!dev->cold_reset_input.exists);
+        dev->cold_reset_input.exists =3D true;
+        dev->cold_reset_input.type =3D type;
+        handler =3D device_cold_reset_handler;
+    } else {
+        assert(!dev->warm_reset_input.exists);
+        dev->warm_reset_input.exists =3D true;
+        dev->warm_reset_input.type =3D type;
+        handler =3D device_warm_reset_handler;
+    }
+
+    qdev_init_gpio_in_named(dev, handler, name, 1);
+}
+
 void qdev_init_gpio_out_named(DeviceState *dev, qemu_irq *pins,
                               const char *name, int n)
 {
@@ -986,6 +1041,8 @@ static void device_initfn(Object *obj)
     dev->instance_id_alias =3D -1;
     dev->realized =3D false;
     dev->resetting =3D 0;
+    dev->cold_reset_input.exists =3D false;
+    dev->warm_reset_input.exists =3D false;
=20
     object_property_add_bool(obj, "realized",
                              device_get_realized, device_set_realized, N=
ULL);
diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 658a419350..693f79b385 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -134,6 +134,17 @@ struct NamedGPIOList {
     QLIST_ENTRY(NamedGPIOList) node;
 };
=20
+typedef enum DeviceActiveType {
+    DEVICE_ACTIVE_LOW,
+    DEVICE_ACTIVE_HIGH,
+} DeviceActiveType;
+
+typedef struct DeviceResetInputState {
+    bool exists;
+    DeviceActiveType type;
+    bool state;
+} DeviceResetInputState;
+
 /**
  * DeviceState:
  * @realized: Indicates whether the device has been fully constructed.
@@ -161,6 +172,8 @@ struct DeviceState {
     int instance_id_alias;
     int alias_required_for_version;
     uint32_t resetting;
+    DeviceResetInputState cold_reset_input;
+    DeviceResetInputState warm_reset_input;
 };
=20
 struct DeviceListener {
@@ -362,6 +375,37 @@ static inline void qdev_init_gpio_in_named(DeviceSta=
te *dev,
 void qdev_pass_gpios(DeviceState *dev, DeviceState *container,
                      const char *name);
=20
+/**
+ * qdev_init_reset_gpio_in_named:
+ * Create a gpio controlling the warm or cold reset of the device.
+ * @cold specify whether it triggers cold or warm reset
+ * @type what kind of reset io it is
+ */
+void qdev_init_reset_gpio_in_named(DeviceState *dev, const char *name,
+                                   bool cold, DeviceActiveType type);
+
+/**
+ * qdev_init_warm_reset_gpio:
+ * Create a reset input to control the device warm reset.
+ */
+static inline void qdev_init_warm_reset_gpio(DeviceState *dev,
+                                             const char *name,
+                                             DeviceActiveType type)
+{
+    qdev_init_reset_gpio_in_named(dev, name, false, type);
+}
+
+/**
+ * qdev_init_power_gate_gpio:
+ * Create a power gate input to control the device cold reset.
+ */
+static inline void qdev_init_power_gate_gpio(DeviceState *dev,
+                                             const char *name,
+                                             DeviceActiveType type)
+{
+    qdev_init_reset_gpio_in_named(dev, name, true, type);
+}
+
 BusState *qdev_get_parent_bus(DeviceState *dev);
=20
 /*** BUS API. ***/
--=20
2.21.0

