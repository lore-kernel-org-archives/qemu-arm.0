Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2092976wrg;
        Tue, 4 Jun 2019 09:29:23 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw6KVFW4EGUvSG5TYfWIjFPkGAr5ukGnhsaT6qxkF1m8DfAkuKk5m4gMi3BAGAGMpSYwJjT
X-Received: by 2002:a67:8e04:: with SMTP id q4mr16056493vsd.161.1559665763240;
        Tue, 04 Jun 2019 09:29:23 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i14si3355618uaq.264.2019.06.04.09.29.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 04 Jun 2019 09:29:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=DJSd9HDa;
       arc=fail (body hash mismatch);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:55081 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hYCJO-0003gN-Kl
	for alex.bennee@linaro.org; Tue, 04 Jun 2019 12:29:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39142)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1hYCFs-0000VD-L4
	for qemu-arm@nongnu.org; Tue, 04 Jun 2019 12:25:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1hYCFq-0003Tq-Rw
	for qemu-arm@nongnu.org; Tue, 04 Jun 2019 12:25:44 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:40476)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <damien.hedde@greensocs.com>)
	id 1hYCFq-0003RV-9U; Tue, 04 Jun 2019 12:25:42 -0400
Received: from kouign-amann.bar.greensocs.com (unknown [172.17.10.6])
	by beetle.greensocs.com (Postfix) with ESMTPSA id 02C8896F56;
	Tue,  4 Jun 2019 16:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
	s=mail; t=1559665540;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=15SURQuq7gIBgpjRlvviKrmBck+uSlAG1Ct83XX3t6U=;
	b=DJSd9HDaQZdleZxohktQ3aJiu+JSMnPlvqWZrH76JhuGKCtx7pkhbbg1c/1rFDk20vJslv
	+7dCe1jU6nylZDkGEYqcexgU6eoqOBYpLK8baub0bLAi1ChHmT1V7/hshFeA79EeuovkMz
	uZ42hhig10/vAxzcaMinGNOT7RgDHcw=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Date: Tue,  4 Jun 2019 18:25:15 +0200
Message-Id: <20190604162526.10655-2-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190604162526.10655-1-damien.hedde@greensocs.com>
References: <20190604162526.10655-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
	s=mail; t=1559665540;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=15SURQuq7gIBgpjRlvviKrmBck+uSlAG1Ct83XX3t6U=;
	b=jBd8pNsZ+Q0+P5zh6otcqJQiDD1SqHBcDpF/8Lrv3I5kAAnaahSZX8mAfyHlJsZaAkDj8x
	Uxt0GBNOCV/viAZrqgpE0caYMjegRQGLwXQC7bx0pLlpCMhc7ipw0QCh3H9fvw3eNZ2JOj
	UautRcjzfwqxo0ytDEExLOGfLCFfNDc=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1559665540; a=rsa-sha256; cv=none;
	b=R+emzzn2Pr7a3SREGj2J/27bc3wVBeuJ1JKQqkH3O+ussmbliFMu9cPz4n0uv/a5O9YXTE
	nzKzkvOzxmnGYm89WTLrWQltKl0arCQ7ESgatZNBZQPhr1lwEVXEe8xDFQ+bsT6sQis5NN
	hSwGvEmvYdPdL20ZBDdsXaUhz5PFUcI=
ARC-Authentication-Results: i=1; ORIGINATING;
	auth=pass smtp.auth=damien smtp.mailfrom=damien.hedde@greensocs.com
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 5.135.226.135
Subject: [Qemu-arm] [RFC PATCH v2 01/12] Create Resettable QOM interface
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
X-TUID: OIHFNpUKjP+Y

This commit defines an interface allowing multi-phase reset.
The phases are INIT, HOLD and EXIT. Each phase has an associated method
in the class.

The reset of a Resettable is controlled with 2 functions:
  - resettable_assert_reset which starts the reset operation.
  - resettable_deassert_reset which ends the reset operation.

There is also a `resettable_reset` helper function which does assert then
deassert allowing to do a proper reset in one call.

The Resettable interface is "reentrant", _assert_ can be called several
times and _deasert_ must be called the same number of times so that the
Resettable leave reset state. It is supported by keeping a counter of
the current number of _assert_ calls. The counter maintainance is done
though 3 methods get/increment/decrement_count.

Reset hierarchy is also supported. Each Resettable may have
sub-Resettable objects. When resetting a Resettable, it is propagated to
its children using the foreach_child method.

The reset is first propagated to the children before being applied to the
Resettable. This will allow to replace current qdev_reset mechanism by th=
is
interface without side-effects on reset order.

Note: I used an uint32 for the count. This match the type already used
in the existing resetting counter in hw/scsi/vmw_pvscsi.c for the
PVSCSIState.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 hw/core/Makefile.objs   |   1 +
 hw/core/resettable.c    | 121 ++++++++++++++++++++++++++++++++++++++++
 include/hw/resettable.h | 104 ++++++++++++++++++++++++++++++++++
 3 files changed, 226 insertions(+)
 create mode 100644 hw/core/resettable.c
 create mode 100644 include/hw/resettable.h

diff --git a/hw/core/Makefile.objs b/hw/core/Makefile.objs
index a799c83815..97007454a8 100644
--- a/hw/core/Makefile.objs
+++ b/hw/core/Makefile.objs
@@ -1,6 +1,7 @@
 # core qdev-related obj files, also used by *-user:
 common-obj-y +=3D qdev.o qdev-properties.o
 common-obj-y +=3D bus.o reset.o
+common-obj-y +=3D resettable.o
 common-obj-$(CONFIG_SOFTMMU) +=3D qdev-fw.o
 common-obj-$(CONFIG_SOFTMMU) +=3D fw-path-provider.o
 # irq.o needed for qdev GPIO handling:
diff --git a/hw/core/resettable.c b/hw/core/resettable.c
new file mode 100644
index 0000000000..59954dac05
--- /dev/null
+++ b/hw/core/resettable.c
@@ -0,0 +1,121 @@
+/*
+ * Resettable interface.
+ *
+ * Copyright (c) 2019 GreenSocs SAS
+ *
+ * Authors:
+ *   Damien Hedde
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/module.h"
+#include "hw/resettable.h"
+
+#define RESETTABLE_MAX_COUNT 50
+
+#define RESETTABLE_GET_CLASS(obj) \
+    OBJECT_GET_CLASS(ResettableClass, (obj), TYPE_RESETTABLE)
+
+static void resettable_init_phase(Object *obj, bool cold);
+
+static void resettable_cold_init_phase(Object *obj)
+{
+    resettable_init_phase(obj, true);
+}
+
+static void resettable_warm_init_phase(Object *obj)
+{
+    resettable_init_phase(obj, false);
+}
+
+static void resettable_init_phase(Object *obj, bool cold)
+{
+    void (*func)(Object *);
+    ResettableClass *rc =3D RESETTABLE_GET_CLASS(obj);
+    uint32_t count;
+
+    count =3D rc->increment_count(obj);
+    /* this assert is triggered by an eventual reset loop */
+    assert(count <=3D RESETTABLE_MAX_COUNT);
+
+    func =3D cold ? resettable_cold_init_phase : resettable_warm_init_ph=
ase;
+    rc->foreach_child(obj, func);
+
+    if (rc->phases.init) {
+        rc->phases.init(obj, cold);
+    }
+}
+
+static void resettable_hold_phase(Object *obj)
+{
+    ResettableClass *rc =3D RESETTABLE_GET_CLASS(obj);
+
+    rc->foreach_child(obj, resettable_hold_phase);
+
+    if (rc->phases.hold) {
+        rc->phases.hold(obj);
+    }
+}
+
+static void resettable_exit_phase(Object *obj)
+{
+    ResettableClass *rc =3D RESETTABLE_GET_CLASS(obj);
+
+    rc->foreach_child(obj, resettable_exit_phase);
+
+    assert(rc->get_count(obj) > 0);
+    if (rc->decrement_count(obj) =3D=3D 0 && rc->phases.exit) {
+        rc->phases.exit(obj);
+    }
+}
+
+void resettable_assert_reset(Object *obj, bool cold)
+{
+    resettable_init_phase(obj, cold);
+    resettable_hold_phase(obj);
+}
+
+void resettable_deassert_reset(Object *obj)
+{
+    resettable_exit_phase(obj);
+}
+
+void resettable_reset(Object *obj, bool cold)
+{
+    resettable_assert_reset(obj, cold);
+    resettable_deassert_reset(obj);
+}
+
+void resettable_class_set_parent_reset_phases(ResettableClass *rc,
+                                              ResettableInitPhase init,
+                                              ResettableHoldPhase hold,
+                                              ResettableExitPhase exit,
+                                              ResettablePhases *parent_p=
hases)
+{
+    *parent_phases =3D rc->phases;
+    if (init) {
+        rc->phases.init =3D init;
+    }
+    if (hold) {
+        rc->phases.hold =3D hold;
+    }
+    if (exit) {
+        rc->phases.exit =3D exit;
+    }
+}
+
+static const TypeInfo resettable_interface_info =3D {
+    .name       =3D TYPE_RESETTABLE,
+    .parent     =3D TYPE_INTERFACE,
+    .class_size =3D sizeof(ResettableClass),
+};
+
+static void reset_register_types(void)
+{
+    type_register_static(&resettable_interface_info);
+}
+
+type_init(reset_register_types)
diff --git a/include/hw/resettable.h b/include/hw/resettable.h
new file mode 100644
index 0000000000..39522b9b51
--- /dev/null
+++ b/include/hw/resettable.h
@@ -0,0 +1,104 @@
+#ifndef HW_RESETTABLE_H
+#define HW_RESETTABLE_H
+
+#include "qom/object.h"
+
+#define TYPE_RESETTABLE "resettable"
+
+#define RESETTABLE_CLASS(class) \
+    OBJECT_CLASS_CHECK(ResettableClass, (class), TYPE_RESETTABLE)
+
+/*
+ * ResettableClass:
+ * Interface for resettable objects.
+ *
+ * The reset operation is divided in several phases each represented by =
a
+ * method.
+ *
+ * Each Ressetable must maintain a reset counter in its state, 3 methods=
 allows
+ * to interact with it.
+ *
+ * @phases.init: should reset local state only. Takes a bool @cold argum=
ent
+ * specifying whether the reset is cold or warm. It must not do side-eff=
ect
+ * on others objects.
+ *
+ * @phases.hold: side-effects action on others objects due to staying in=
 a
+ * resetting state.
+ *
+ * @phases.exit: leave the reset state, may do side-effects action on ot=
hers
+ * objects.
+ *
+ * @get_count: Get the current reset count
+ * @increment_count: Increment the reset count, returns the new count
+ * @decrement_count: decrement the reset count, returns the new count
+ *
+ * @foreach_child: Executes a given function on every Resettable child.
+ * A child is not a QOM child, but a child a reset meaning.
+ */
+typedef void (*ResettableInitPhase)(Object *obj, bool cold);
+typedef void (*ResettableHoldPhase)(Object *obj);
+typedef void (*ResettableExitPhase)(Object *obj);
+typedef uint32_t (*ResettableGetCount)(Object *obj);
+typedef uint32_t (*ResettableIncrementCount)(Object *obj);
+typedef uint32_t (*ResettableDecrementCount)(Object *obj);
+typedef void (*ResettableForeachChild)(Object *obj, void (*visitor)(Obje=
ct *));
+typedef struct ResettableClass {
+    InterfaceClass parent_class;
+
+    struct ResettablePhases {
+        ResettableInitPhase init;
+        ResettableHoldPhase hold;
+        ResettableExitPhase exit;
+    } phases;
+
+    ResettableGetCount get_count;
+    ResettableIncrementCount increment_count;
+    ResettableDecrementCount decrement_count;
+    ResettableForeachChild foreach_child;
+} ResettableClass;
+typedef struct ResettablePhases ResettablePhases;
+
+/**
+ * resettable_assert_reset:
+ * Increments the reset count and executes the init and hold phases.
+ * Each time resettable_assert_reset is called, resettable_deassert_rese=
t
+ * must eventually be called once.
+ * It will also impact reset children.
+ *
+ * @obj object to reset, must implement Resettable interface.
+ * @cold boolean indicating the type of reset (cold or warm)
+ */
+void resettable_assert_reset(Object *obj, bool cold);
+
+/**
+ * resettable_deassert_reset:
+ * Decrements the reset count by one and executes the exit phase if it h=
its
+ * zero.
+ * It will also impact reset children.
+ *
+ * @obj object to reset, must implement Resettable interface.
+ */
+void resettable_deassert_reset(Object *obj);
+
+/**
+ * resettable_reset:
+ * Calling this function is equivalent to call @assert_reset then
+ * @deassert_reset.
+ */
+void resettable_reset(Object *obj, bool cold);
+
+/**
+ * resettable_class_set_parent_reset_phases:
+ *
+ * Save @rc current reset phases into @parent_phases and override @rc ph=
ases
+ * by the given new methods (@init, @hold and @exit).
+ * Each phase is overriden only if the new one is not NULL allowing to
+ * override a subset of phases.
+ */
+void resettable_class_set_parent_reset_phases(ResettableClass *rc,
+                                              ResettableInitPhase init,
+                                              ResettableHoldPhase hold,
+                                              ResettableExitPhase exit,
+                                              ResettablePhases *parent_p=
hases);
+
+#endif
--=20
2.21.0

