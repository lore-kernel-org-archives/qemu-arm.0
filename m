Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3711335wrx;
        Mon, 25 Mar 2019 04:02:57 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyIujoWJAbSlNNG/iwhpoekU8rho+X+T2wxs9LTjGUGQemSxSYQBgfnD/Z0aI29pBRXmu3n
X-Received: by 2002:a0d:ee42:: with SMTP id x63mr18718417ywe.97.1553511776921;
        Mon, 25 Mar 2019 04:02:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553511776; cv=none;
        d=google.com; s=arc-20160816;
        b=H9U6y7ioR5YmQzLarhQ2VIcJxhXW+jiTIwCL4/p50YCWoXOd9UX80FPJSBdCf2IZz6
         bJnO449LZulSyrdyNXM47T/9NCzbkIQ/KIOUu76ImEd9CnkNxBszj46eFCeJUiqHnZx4
         RCAGLZj2pLdehudDvowWt10BTWCJ1VY15ErbdmvnSkm6giq5MefopShfsOS9/1PHzGCl
         GasAOTyTde1Im3EYasuTmGpRH9X1cKCZzleTEYR/z+lu1Un+mpbsat3gvORR9uXUZ/iV
         ZJL6nlx69+jahnONuBosbNwbLOmD/Y0weFmC63gATQRibLMkXPH6S8nb34K5PNFwYfKF
         BClw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=ZxHHbSrrbfIasdrTBpe+svxOvfr9WVzbiYdx5JJjRlo=;
        b=w0/c6jhzzCFluZrJpmYp3PopoosgDXo51HVd/RFgbGXq69s17wLQEJIVgSvS5i8ZuZ
         8608GF9Vs1FUw37C6FwRpG7oTG4PCHyQaH9Vp5tn9kBL6kga8QpD28Mg55MMigpkP1iJ
         2g8YEAIwI/Z4XW+zAmLV+MHqIC/EblRPkxipLz+TVVL7zTsxonhwAxLX+1G5uIsW/xkb
         S+YDbx/QfBv9JuG4NNMsE497jswSAQWwpoqU2ICKJDhAA+O30Cb3dFVKpDCxX9wWQ4JR
         NB+oAYYYkue7p9CLkuknBE3OAmcRMiIZ1DJmt7UjAOIbFeC7zkhXWfZ5uf6bFbVFKQM/
         maqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=slS6NgWU;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=LYUcHioC;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=LYUcHioC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h81si9073811ywh.365.2019.03.25.04.02.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Mar 2019 04:02:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=slS6NgWU;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=LYUcHioC;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=LYUcHioC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:40456 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h8NNY-00057l-Ai
	for alex.bennee@linaro.org; Mon, 25 Mar 2019 07:02:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58442)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1h8NNA-00056n-Di
	for qemu-arm@nongnu.org; Mon, 25 Mar 2019 07:02:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1h8NN8-0007oh-LI
	for qemu-arm@nongnu.org; Mon, 25 Mar 2019 07:02:32 -0400
Received: from greensocs.com ([193.104.36.180]:38284)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>)
	id 1h8NN7-0007m6-Li; Mon, 25 Mar 2019 07:02:30 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id B47057D78B4;
	Mon, 25 Mar 2019 12:02:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1553511745;
	bh=4rCBKop/jhXKENgGNrYN0iCn8CMt31D2QPxCOMlalak=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=slS6NgWUCZecq97yYoG0EeyD5xJZYL2kyKrzI3BjXpIWxygPSJV9QISwIPtAoHwuz
	s2+N2tsRk8/I4DGw/BdxfxcLQyqj6bgh9M6E+1XGvcd9d1Qi8KpaVdxmZzhQ6PTyiO
	n73XxZ+HcFw+Df2zXRuDqVaYo/RTEORmgzLrnv34=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=LYUcHioC;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=LYUcHioC
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UMkDFMeDCjJm; Mon, 25 Mar 2019 12:02:24 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 6FD0E7D78A5; Mon, 25 Mar 2019 12:02:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1553511742;
	bh=4rCBKop/jhXKENgGNrYN0iCn8CMt31D2QPxCOMlalak=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LYUcHioC3epGowhEusABOmhAfvGtmgO0L4yu3RDPuUJSqdl15NEbFg+kZ/oNz48eO
	IaWqSosIkmy2O/3aquqvs4Y+2yQ8qcSPQc/AVEgOvovioWEivNy1Sgw24wLLCNkhvw
	HoX0vrVC/ZkqE+D+3iZMiHsK+tCWkAyRdycL1lGg=
Received: from kouign-amann.bar.greensocs.com (antfield.tima.u-ga.fr
	[147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: damien.hedde@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id E19647D7887;
	Mon, 25 Mar 2019 12:02:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1553511742;
	bh=4rCBKop/jhXKENgGNrYN0iCn8CMt31D2QPxCOMlalak=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LYUcHioC3epGowhEusABOmhAfvGtmgO0L4yu3RDPuUJSqdl15NEbFg+kZ/oNz48eO
	IaWqSosIkmy2O/3aquqvs4Y+2yQ8qcSPQc/AVEgOvovioWEivNy1Sgw24wLLCNkhvw
	HoX0vrVC/ZkqE+D+3iZMiHsK+tCWkAyRdycL1lGg=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Date: Mon, 25 Mar 2019 12:01:47 +0100
Message-Id: <bc73ff96bc52397d1992f6f1b67fa8c71382264f.1553510737.git.damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1553510737.git.damien.hedde@greensocs.com>
References: <cover.1553510737.git.damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [RFC PATCH 04/17] Add local reset methods in Device class
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
X-TUID: j+/D1GKnlcII

Add 3 methods in device class corresponding to the local part of
the 3-phases reset. This allows specialization classes not to care
about the ressetting counter and sub-buses. The exit phase method
is called only if resetting counter hits 0.

Also, these methods are called in `device_reset`. Specializations can swi=
tch
from the single-phase reset to the 3-phases reset with no effects on the
`device_reset` behavior.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 hw/core/qdev.c         | 44 ++++++++++++++++++++++++++++++++++++++++++
 include/hw/qdev-core.h | 17 ++++++++++++++++
 2 files changed, 61 insertions(+)

diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index 98d173f34f..884a49efa4 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -280,21 +280,30 @@ static void device_reset_init_phase(Object *obj, bo=
ol cold)
     if (dc->reset) {
         dc->reset(dev);
     }
+    if (dc->reset_phases.init) {
+        dc->reset_phases.init(OBJECT(dev), cold);
+    }
 }
=20
 static void device_reset_hold_phase(Object *obj)
 {
     DeviceState *dev =3D DEVICE(obj);
+    DeviceClass *dc =3D DEVICE_GET_CLASS(obj);
     BusState *child;
=20
     QLIST_FOREACH(child, &dev->child_bus, sibling) {
         resettable_hold_phase(OBJECT(child));
     }
+
+    if (dc->reset_phases.hold) {
+        dc->reset_phases.hold(OBJECT(dev));
+    }
 }
=20
 static void device_reset_exit_phase(Object *obj)
 {
     DeviceState *dev =3D DEVICE(obj);
+    DeviceClass *dc =3D DEVICE_GET_CLASS(obj);
     BusState *child;
=20
     QLIST_FOREACH(child, &dev->child_bus, sibling) {
@@ -303,6 +312,12 @@ static void device_reset_exit_phase(Object *obj)
=20
     assert(dev->resetting > 0);
     dev->resetting -=3D 1;
+
+    if (dev->resetting =3D=3D 0) {
+        if (dc->reset_phases.exit) {
+            dc->reset_phases.exit(OBJECT(dev));
+        }
+    }
 }
=20
 static int qdev_reset_one(DeviceState *dev, void *opaque)
@@ -1143,6 +1158,24 @@ void device_class_set_parent_unrealize(DeviceClass=
 *dc,
     dc->unrealize =3D dev_unrealize;
 }
=20
+void device_class_set_parent_reset_phases(DeviceClass *dc,
+                                   ResettableInitPhase dev_reset_init,
+                                   ResettableHoldPhase dev_reset_hold,
+                                   ResettableExitPhase dev_reset_exit,
+                                   ResettablePhases *parent_phases)
+{
+    *parent_phases =3D dc->reset_phases;
+    if (dev_reset_init) {
+        dc->reset_phases.init =3D dev_reset_init;
+    }
+    if (dev_reset_hold) {
+        dc->reset_phases.hold =3D dev_reset_hold;
+    }
+    if (dev_reset_exit) {
+        dc->reset_phases.exit =3D dev_reset_exit;
+    }
+}
+
 void device_reset(DeviceState *dev)
 {
     DeviceClass *klass =3D DEVICE_GET_CLASS(dev);
@@ -1150,6 +1183,17 @@ void device_reset(DeviceState *dev)
     if (klass->reset) {
         klass->reset(dev);
     }
+    dev->resetting +=3D 1;
+    if (klass->reset_phases.init) {
+        klass->reset_phases.init(OBJECT(dev), false);
+    }
+    if (klass->reset_phases.hold) {
+        klass->reset_phases.hold(OBJECT(dev));
+    }
+    dev->resetting -=3D 1;
+    if (klass->reset_phases.exit) {
+        klass->reset_phases.exit(OBJECT(dev));
+    }
 }
=20
 Object *qdev_get_machine(void)
diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index f4aa8dbaa2..0ef4d6c920 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -6,6 +6,7 @@
 #include "qom/object.h"
 #include "hw/irq.h"
 #include "hw/hotplug.h"
+#include "hw/resettable.h"
=20
 enum {
     DEV_NVECTORS_UNSPECIFIED =3D -1,
@@ -110,6 +111,7 @@ typedef struct DeviceClass {
     DeviceReset reset;
     DeviceRealize realize;
     DeviceUnrealize unrealize;
+    ResettablePhases reset_phases;
=20
     /* device state */
     const struct VMStateDescription *vmsd;
@@ -455,6 +457,21 @@ void device_class_set_parent_unrealize(DeviceClass *=
dc,
                                        DeviceUnrealize dev_unrealize,
                                        DeviceUnrealize *parent_unrealize=
);
=20
+/**
+ * @device_class_set_parent_reset_phases:
+ *
+ * Save @dc current reset phases into @parent_phases and override @dc ph=
ases
+ * by the given new methods (@dev_reset_init, @dev_reset_hold and
+ * @dev_reset_exit).
+ * Each phase is overriden only if the new one is not NULL allowing to
+ * override a subset of phases.
+ */
+void device_class_set_parent_reset_phases(DeviceClass *dc,
+                                   ResettableInitPhase dev_reset_init,
+                                   ResettableHoldPhase dev_reset_hold,
+                                   ResettableExitPhase dev_reset_exit,
+                                   ResettablePhases *parent_phases);
+
 const struct VMStateDescription *qdev_get_vmsd(DeviceState *dev);
=20
 const char *qdev_fw_name(DeviceState *dev);
--=20
2.21.0

