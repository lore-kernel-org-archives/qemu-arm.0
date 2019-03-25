Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3711787wrx;
        Mon, 25 Mar 2019 04:03:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwHktcpDTayR1/ubvSoDXw/ZyeWwfczyYVzkJx5028SPkVtvc8roEtn2/HpTs99l1k4CbKk
X-Received: by 2002:a5b:4d0:: with SMTP id u16mr20791450ybp.46.1553511800258;
        Mon, 25 Mar 2019 04:03:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553511800; cv=none;
        d=google.com; s=arc-20160816;
        b=sh5xo+7Pj43phlp9c++5JM2Efp3TYESqJ8vAbWJupXoC6UlgBBUI6ioIzcMi+t8KJp
         mC8RTY9AmwIe3n5PBwUWUnxRpDWNXyzY+oBlA0j/De8ihSYgF1bro8IMDuvms0/87+HT
         Ab+tzC94uluL8G90ryKylBwffBGyh0z6mU72ewDlWn5VGu3G77er3jm8DdDHaatEiWcF
         2qsdGxawqReN9RSqa1UM2NBWzXy9Mo0yFthi8x3FpbaRZVZEZsqa/FqMqO6iYFYto21Z
         QTkUK/8Qk0+jlCqOTCqvmaOq88VSfoRYaCU+LUtQhcfvnXf9JIlWLrk8R25tZLohQjxP
         Elyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=xypXkmKUTcoj8eunK5Csi1oTnKQELQ+anH6j7mBdpI4=;
        b=CwIGrJeDbBNo3Eje3SSSK2ixV8asEXB8wozazjRzKaPNBBwHfmeOuUAPIiFim52O/U
         nZEw8794bWeWn/DtpRy/GJx/dq/wGLy55aTVK4VoptazSVNtdRxlpS2KWdrUtY4PWKuK
         ByLVpO4v3UcxVRzYslv3dZdjW3TDtXTSeVRYRAVkE49Jdd4cZDnuzXe4y/ZqDa0fH9fs
         0dFifMTnUWS1Qk/J0Lr7CY/CGt9Os60Nv4gcI57bj/2v6Nb/DtVm0LGD4kyC/ae6Bvqf
         GRrtHMwktT5/KxmKT3T/RytlPGgNd/2eTjKO8jCvV2BcwlMAdeARn0/yilb0oP6VJ3E9
         g9Lw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=1E9Jsi+1;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="7em/qB7v";
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=kOO+0ut1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j15si8552662ywj.371.2019.03.25.04.03.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 25 Mar 2019 04:03:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=1E9Jsi+1;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="7em/qB7v";
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=kOO+0ut1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:40471 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h8NNv-0005Qa-Lj
	for alex.bennee@linaro.org; Mon, 25 Mar 2019 07:03:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58431)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1h8NNA-00056m-2z
	for qemu-arm@nongnu.org; Mon, 25 Mar 2019 07:02:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1h8NN8-0007oG-Al
	for qemu-arm@nongnu.org; Mon, 25 Mar 2019 07:02:32 -0400
Received: from greensocs.com ([193.104.36.180]:38247)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>)
	id 1h8NN7-0007kW-Lj; Mon, 25 Mar 2019 07:02:30 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 235427D78AE;
	Mon, 25 Mar 2019 12:02:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1553511742;
	bh=fim3p4zmaf3aFDPE3gcaY2aoXqpm/15izlSUkLSkHAQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=1E9Jsi+1+PYA0IsIz4dITUBE0AkjYVXKmDH/yUdePOy96F/o0ZZwbrOCQbTx/e6rW
	v0MBGZFRA0I5tX7UuXcTpOtSqmHC7Kqul9tT+859hTKN23DbueBJV6QN+R0mCzII2+
	qTrh0xQdmuIs3JCW3sbeZ2gmIqO62hyN6X+DZnVQ=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=7em/qB7v;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=kOO+0ut1
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rDy1deads57w; Mon, 25 Mar 2019 12:02:21 +0100 (CET)
Received: by greensocs.com (Postfix, from userid 998)
	id 089097D78A0; Mon, 25 Mar 2019 12:02:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1553511741;
	bh=fim3p4zmaf3aFDPE3gcaY2aoXqpm/15izlSUkLSkHAQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=7em/qB7v5iU6nlx8AL2232qhb76gPZ+1KmPjxNlXigSXke2TCMbXlvRpaxIq5YQg+
	9tya1o0AbSJWFcYmt4bXluvjjFpcNEtvvVNBYBIdaaia7I8j2JJccqlykLMTBsvQuG
	kk9Lh8r0PfpErsVVxUn8ClEEt0ElyPJuDEEhr09E=
Received: from kouign-amann.bar.greensocs.com (antfield.tima.u-ga.fr
	[147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: damien.hedde@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 641E57D788E;
	Mon, 25 Mar 2019 12:02:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1553511740;
	bh=fim3p4zmaf3aFDPE3gcaY2aoXqpm/15izlSUkLSkHAQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=kOO+0ut1cFqycEDJ6vqpimJmGfOG3IYNfzvxVd/Q/82GrLI2Jy+fEzLgt77O8h5Qw
	nLyhAwhgffBFLMCoatU1s7OwjZP7X2+VaaDsYufpk/o7tEuqBqxyaUnW5iBwltni+t
	2cr4y7TbAhNJ4s+mTdAyd150N1Kr40h53OIXZv2U=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Date: Mon, 25 Mar 2019 12:01:44 +0100
Message-Id: <19e6624397deb68db77526a8d25be42aafb3373e.1553510737.git.damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <cover.1553510737.git.damien.hedde@greensocs.com>
References: <cover.1553510737.git.damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [RFC PATCH 01/17] Create Resettable QOM interface
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
X-TUID: XCJPVyFcT53O

This commit defines an interface allowing multi-phase reset.
The phases are INIT, HOLD and EXIT.

The reset of a Resettable is controlled with 2 functions:
  - resettable_assert_reset which starts the reset operation.
  - resettable_deassert_reset which ends the reset operation.

There is also a `resettable_reset` helper function which does assert then
deassert allowing to do a proper reset in one call.

The interface only contains 3 methods, one per phase. Each method should
handle reset of the object and its sub-elements.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 hw/core/Makefile.objs   |  1 +
 hw/core/resettable.c    | 69 ++++++++++++++++++++++++++++++++++
 include/hw/resettable.h | 83 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 153 insertions(+)
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
index 0000000000..6ea1e5b54a
--- /dev/null
+++ b/hw/core/resettable.c
@@ -0,0 +1,69 @@
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
+#define RESETTABLE_GET_CLASS(obj) \
+    OBJECT_GET_CLASS(ResettableClass, (obj), TYPE_RESETTABLE)
+
+void resettable_init_phase(Object *obj, bool cold)
+{
+    ResettableClass *rc =3D RESETTABLE_GET_CLASS(obj);
+
+    if (rc->phases.init) {
+        rc->phases.init(obj, cold);
+    }
+}
+
+void resettable_hold_phase(Object *obj)
+{
+    ResettableClass *rc =3D RESETTABLE_GET_CLASS(obj);
+
+    if (rc->phases.hold) {
+        rc->phases.hold(obj);
+    }
+}
+
+void resettable_exit_phase(Object *obj)
+{
+    ResettableClass *rc =3D RESETTABLE_GET_CLASS(obj);
+
+    if (rc->phases.exit) {
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
index 0000000000..15d5bd878d
--- /dev/null
+++ b/include/hw/resettable.h
@@ -0,0 +1,83 @@
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
+ * "Entering the reset state" corresponds to the init and hold phases.
+ * "Leaving the reset state" corresponds to the exit phase.
+ */
+typedef void (*ResettableInitPhase)(Object *obj, bool cold);
+typedef void (*ResettableHoldPhase)(Object *obj);
+typedef void (*ResettableExitPhase)(Object *obj);
+typedef struct ResettableClass {
+    InterfaceClass parent_class;
+
+    struct ResettablePhases {
+        ResettableInitPhase init;
+        ResettableHoldPhase hold;
+        ResettableExitPhase exit;
+    } phases;
+} ResettableClass;
+typedef struct ResettablePhases ResettablePhases;
+
+/*
+ * Helpers to do a single phase of a Resettable.
+ * Call the corresponding ResettableClass method if it is not NULL.
+ */
+void resettable_init_phase(Object *obj, bool cold);
+void resettable_hold_phase(Object *obj);
+void resettable_exit_phase(Object *obj);
+
+/**
+ * resettable_assert_reset:
+ * Put an object in reset state.
+ * Each time resettable_assert_reset is called, resettable_deassert_rese=
t
+ * must be eventually called once and only once.
+ *
+ * @obj object to reset, must implement Resettable interface.
+ * @cold boolean indicating the type of reset (cold or warm)
+ */
+void resettable_assert_reset(Object *obj, bool cold);
+
+/**
+ * resettable_deassert_reset:
+ * End the reset state if an object.
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
+static inline void resettable_reset(Object *obj, bool cold)
+{
+    resettable_assert_reset(obj, cold);
+    resettable_deassert_reset(obj);
+}
+
+#endif
--=20
2.21.0

