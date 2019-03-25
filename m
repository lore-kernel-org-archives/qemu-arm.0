Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3712299wrx;
        Mon, 25 Mar 2019 04:03:42 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxHcav8SSLjK9EQiwK+SNueZrS11BOzhxy5iODOzlIRWR5m1ovFUDs6CkW40aZhXBAfXfog
X-Received: by 2002:a25:10c5:: with SMTP id 188mr5353311ybq.304.1553511822577;
        Mon, 25 Mar 2019 04:03:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553511822; cv=none;
        d=google.com; s=arc-20160816;
        b=mIX9DUnz6vbH1TMG6VKP83NQkinStNNvpEhiwdhpYLY/r4qt/neMZsQkHcIpc4Niee
         g4h3DrgCDZKtzRi88tL+leJJeQb046jFVDneKHp6/Wt45Q+3+DU8Jdey9Cj5B5LH1oc0
         6ushTlruKIg8J+xmm6+6mm4nRn2abTXmfuTnZW4aGR/CLKZz3b0ZbjKWjX7Leue/mi4Y
         mHugtR6fWgLPbWXm/eKe2GIEGqft2sGROQoDTSEX7wQDENrGhrcrOGIKJc+KstzIm3VE
         6SPZPQbXjSKHWO+HQtL1kts2zalYVMrg3PviM9XZrFGAgCkwoWjy1e6QsJCj0f1UYEZY
         T/gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=LpzTonOxUYX2T9x6jPC7zkQLsyKJOT8NVkwuoh9ksFE=;
        b=Ewwd9nZsXabm2A/acAJB7soP+S1CLs3hDdEv/HzWVt8hW84OIGVUXQl9tuRc+Bp8p2
         nMI6OD53gnEP7tLMEuBbuoqyf4Z+J9qpvgjJtS5W2MYMXeC5XWEp9ShHWASkRi2i3tTm
         g0ENdp32aSTaax9iFX2vVRQaq8HwVU+A3bz/fl/paLy3KqFBcoLV+3n8X98T81INd34o
         QizZ5vSUy9aS4qWjixZUcf1/2mVAcoORugecDoZV5NKxTnYUOCLLEIr/b4Aw2yIINHof
         Ufdojji/4ONrAoPoxy3BaH8LLZZTD0Zgdx/1ps+tHMgUrmMjBGBF5S307bc2jjl0Xf7u
         Q63Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=qPhPEFIi;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=UUfytm+M;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=UUfytm+M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i7si7248073ybe.313.2019.03.25.04.03.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Mar 2019 04:03:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=qPhPEFIi;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=UUfytm+M;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=UUfytm+M;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:40489 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h8NOH-0005l9-VI
	for alex.bennee@linaro.org; Mon, 25 Mar 2019 07:03:42 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58493)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1h8NNB-00056x-Ml
	for qemu-arm@nongnu.org; Mon, 25 Mar 2019 07:02:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1h8NN9-0007pS-AW
	for qemu-arm@nongnu.org; Mon, 25 Mar 2019 07:02:33 -0400
Received: from greensocs.com ([193.104.36.180]:38352)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>)
	id 1h8NN8-0007oK-Nj; Mon, 25 Mar 2019 07:02:31 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id DF99E7D78B7;
	Mon, 25 Mar 2019 12:02:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1553511746;
	bh=clq3gvkosMEvBafp8I7Dl74ggYCNhXMTvzQ/+rm5LXM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=qPhPEFIi5efDn5FvBKbaEvu6DIdW8wOxPOJgZS/xiUZs7qgkl+avMHJ+IuCm6gw1Z
	W8sdfBWy1G6imzBQEBoh8ZWFl29Ofpl25qmQ9nXZM5jDHyNFIuZaUSifVFSknrdLm4
	q4yv9WjAp48N2qwaMJ58yQEZxEn0LsuQyxedsbYE=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=UUfytm+M;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=UUfytm+M
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zapesw92xvvE; Mon, 25 Mar 2019 12:02:26 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 9D18A7D78A2; Mon, 25 Mar 2019 12:02:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1553511743;
	bh=clq3gvkosMEvBafp8I7Dl74ggYCNhXMTvzQ/+rm5LXM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UUfytm+MquilzR9zQJ7NG1FEinwlC8TA2ikP0pkoXNILexKX/N+6yt1mEwV46sHrr
	Thh+DeaRSvDh9SY4g2PXHIWrouFC1HrkCL4cR5ispjqfdILBzFso6w0Q6bIbpVFR+B
	QfWTM8rdROdDTm/pLkJ/iS5ss1j3ZywxxzLRSVmQ=
Received: from kouign-amann.bar.greensocs.com (antfield.tima.u-ga.fr
	[147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: damien.hedde@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id E182A7D7887;
	Mon, 25 Mar 2019 12:02:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1553511743;
	bh=clq3gvkosMEvBafp8I7Dl74ggYCNhXMTvzQ/+rm5LXM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UUfytm+MquilzR9zQJ7NG1FEinwlC8TA2ikP0pkoXNILexKX/N+6yt1mEwV46sHrr
	Thh+DeaRSvDh9SY4g2PXHIWrouFC1HrkCL4cR5ispjqfdILBzFso6w0Q6bIbpVFR+B
	QfWTM8rdROdDTm/pLkJ/iS5ss1j3ZywxxzLRSVmQ=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Date: Mon, 25 Mar 2019 12:01:49 +0100
Message-Id: <5a0f7fc13cd69586dba5475edf5a6bec46559858.1553510737.git.damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1553510737.git.damien.hedde@greensocs.com>
References: <cover.1553510737.git.damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [RFC PATCH 06/17] Add function to control reset with
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
	mark.burton@greensocs.com,
	Damien Hedde <damien.hedde@greensocs.com>, qemu-arm@nongnu.org,
	alistair.francis@wdc.com, marcandre.lureau@redhat.com,
	pbonzini@redhat.com, philmd@redhat.com, luc.michel@greensocs.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 163KoUlVcTk6

It adds the possibility to add 2 gpios to control the warm and cold reset=
.
With theses ios, the reset can be maintained during some time.
Each io is associated with a state to detect level changes.

The cold reset io function is named power_gate as it is really the
meaning of this io.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 hw/core/qdev-vmstate.c |  2 ++
 hw/core/qdev.c         | 57 ++++++++++++++++++++++++++++++++++++++++++
 include/hw/qdev-core.h | 44 ++++++++++++++++++++++++++++++++
 3 files changed, 103 insertions(+)

diff --git a/hw/core/qdev-vmstate.c b/hw/core/qdev-vmstate.c
index a9834f1a1c..dec6a72f75 100644
--- a/hw/core/qdev-vmstate.c
+++ b/hw/core/qdev-vmstate.c
@@ -20,6 +20,8 @@ const struct VMStateDescription device_vmstate_reset =3D=
 {
     .minimum_version_id =3D 0,
     .fields =3D (VMStateField[]) {
         VMSTATE_UINT32(resetting, DeviceState),
+        VMSTATE_BOOL(cold_reset_input.state, DeviceState),
+        VMSTATE_BOOL(warm_reset_input.state, DeviceState),
         VMSTATE_END_OF_LIST()
     }
 };
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index 884a49efa4..8dae26d957 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -464,6 +464,61 @@ void qdev_init_gpio_in(DeviceState *dev, qemu_irq_ha=
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
@@ -1021,6 +1076,8 @@ static void device_initfn(Object *obj)
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
index baad2e7066..db997cc47d 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -130,6 +130,17 @@ struct NamedGPIOList {
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
@@ -157,6 +168,8 @@ struct DeviceState {
     int instance_id_alias;
     int alias_required_for_version;
     uint32_t resetting;
+    DeviceResetInputState cold_reset_input;
+    DeviceResetInputState warm_reset_input;
 };
=20
 struct DeviceListener {
@@ -361,6 +374,37 @@ static inline void qdev_init_gpio_in_named(DeviceSta=
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

