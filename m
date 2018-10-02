Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp5135970wrt;
        Tue, 2 Oct 2018 07:40:19 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61rGoRyCiS+xJdumGyfAPn2Tvpx6x/fujDGhlvC06acin2fZNYPbdtZ6lOBrVYQu1LvJfxI
X-Received: by 2002:a0c:bd1e:: with SMTP id m30-v6mr12527949qvg.234.1538491219114;
        Tue, 02 Oct 2018 07:40:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538491219; cv=none;
        d=google.com; s=arc-20160816;
        b=fDJZJXlxzenyfjPvQcpk0sBgq6JhNgHVY+VoC8+u4beBax+ea+Xri+VFI7XIFBAtgz
         yBM0UXgt+getfPD3yTV4Aj8UyeF+idYbE4G6GM4JItFHd6sfnewIEKbi6jcIUPoEcxxT
         1NmkHFusuLbY+lIu2TpLXYyz3fwy/f9iz2dY3B+hrghN4DoCHjxstUwDkD4lOneLgRL7
         dV6ZY9NGdRnj5Y9/hdsW9Y2vdy4GJcmyx1XsC/oeBYX2BSjRLJByxqRkkzkSf9+bFdta
         vYO/9NN+rU8g1y9yMkR9WdavCykT6VxgvXzzv1swzJd/ZvCMeIWYDMX7MPnWFOZ5pQ9v
         fNUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=oGFgn3IKZnAIvjfuOvmtdlfG5oBnlh3lCgq8bn2pbbc=;
        b=S+I9rRqxxcjttG6Ma6QSQmJiT0pPw0bezb0q9bPENqbqA5rqI28QlQxNEGmDVVZASY
         xxA6JntordxfYmSAeow1TjulCzXCS3G4S78UweKryX8HBOEpLQ/PVlQBkjzw8RdeVBh+
         dzaBZv9/OxQp9m6PU5S/fH+je0otBOc84UwTJNu6NksdZPlUGUhxO1U07afT30Z3YUB3
         DaLSxfN0rPOFQBPHqBdaNWHPTcD4hMCmYApTFsK8wYaZ+Qyarg2V9qVjWptHlPXE3EKe
         Fva2zn79O26zxaW1j/0gyhv4QCE3KOBNywIvc3y5MvAiJ1SFetEkAuNSJgWuOKwuZ22n
         1nyw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=mL7tTloM;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=A5kNiJnr;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=A5kNiJnr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o21-v6si3508287qtk.150.2018.10.02.07.40.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Oct 2018 07:40:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=mL7tTloM;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=A5kNiJnr;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=A5kNiJnr;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44027 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7LqU-0000Em-I7
	for alex.bennee@linaro.org; Tue, 02 Oct 2018 10:40:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46603)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1g7Lmw-0005Hu-65
	for qemu-devel@nongnu.org; Tue, 02 Oct 2018 10:36:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1g7LdC-0004Q6-Ho
	for qemu-devel@nongnu.org; Tue, 02 Oct 2018 10:26:36 -0400
Received: from greensocs.com ([193.104.36.180]:53820)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>)
	id 1g7Lcy-0004L1-CD; Tue, 02 Oct 2018 10:26:25 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 49EDD442ADA;
	Tue,  2 Oct 2018 16:26:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1538490365;
	bh=SjTuGKi1/V1teMZEtop/VVZ2j005PNFl3339+t7F7B8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=mL7tTloMi2ODKZQI33SQEnEFeSb/vU7unCxa8JBSzZGxpCejjgnhbR72KMyIv+qpk
	9ahAqYkKpc6k6B1zxYKokJROcliLTr5HYBaY32w2GYQP5/zinJJ+P+mMsvG+qRTu7M
	fONp0To/pH3xO4zWm/7cTqA1ei1KSzA280j+8yFA=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=A5kNiJnr;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=A5kNiJnr
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yc7q8NE8idDN; Tue,  2 Oct 2018 16:26:04 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 5403F442AEC; Tue,  2 Oct 2018 16:26:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1538490364;
	bh=SjTuGKi1/V1teMZEtop/VVZ2j005PNFl3339+t7F7B8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=A5kNiJnrQpPNHuqptNkAO+SIyKWKhd1q6IdDXQo/UB7MYmi8aFPsL6opJLJjAiLEo
	qAiGDtXpO2nYxZ0Uj3i5BU9f+9QsFXDs60dZgrQxFlg80KzwYVSmSXUfGDRClJT41U
	f9oxlbodo/DE/LrxBYpH7G8MBV7HRheCgeQtRdQc=
Received: from kouign-amann.hive.antfield.fr (antfield.tima.u-ga.fr
	[147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: damien.hedde@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id E1481442AE7;
	Tue,  2 Oct 2018 16:26:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1538490364;
	bh=SjTuGKi1/V1teMZEtop/VVZ2j005PNFl3339+t7F7B8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=A5kNiJnrQpPNHuqptNkAO+SIyKWKhd1q6IdDXQo/UB7MYmi8aFPsL6opJLJjAiLEo
	qAiGDtXpO2nYxZ0Uj3i5BU9f+9QsFXDs60dZgrQxFlg80KzwYVSmSXUfGDRClJT41U
	f9oxlbodo/DE/LrxBYpH7G8MBV7HRheCgeQtRdQc=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Date: Tue,  2 Oct 2018 16:24:35 +0200
Message-Id: <20181002142443.30976-2-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20181002142443.30976-1-damien.hedde@greensocs.com>
References: <20181002142443.30976-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-devel] [PATCH v5 1/9] hw/core/clock-port: introduce clock
 port objects
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, alistair@alistair23.me,
	mark.burton@greensocs.com, saipava@xilinx.com,
	qemu-arm@nongnu.org, Damien Hedde <damien.hedde@greensocs.com>,
	pbonzini@redhat.com, konrad@adacore.com, luc.michel@greensocs.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Zm+QxFY4w1cG

Introduce clock port objects: ClockIn and ClockOut.

Theses ports may be used to distribute a clock from a object to several
other objects. The ClockIn object contains the current state of the
clock: the frequency.

A ClockIn may be connected to a ClockOut so that it receives update,
through the callback, whenever the Clockout is updated using the
ClockOut's set function.

This is based on the original work of Frederic Konrad.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 Makefile.objs           |   1 +
 include/hw/clock-port.h | 136 ++++++++++++++++++++++++++++++++++
 hw/core/clock-port.c    | 159 ++++++++++++++++++++++++++++++++++++++++
 hw/core/Makefile.objs   |   1 +
 hw/core/trace-events    |   7 ++
 5 files changed, 304 insertions(+)
 create mode 100644 include/hw/clock-port.h
 create mode 100644 hw/core/clock-port.c
 create mode 100644 hw/core/trace-events

diff --git a/Makefile.objs b/Makefile.objs
index ce9c79235e..b29747075f 100644
--- a/Makefile.objs
+++ b/Makefile.objs
@@ -210,6 +210,7 @@ trace-events-subdirs +=3D hw/audio
 trace-events-subdirs +=3D hw/block
 trace-events-subdirs +=3D hw/block/dataplane
 trace-events-subdirs +=3D hw/char
+trace-events-subdirs +=3D hw/core
 trace-events-subdirs +=3D hw/display
 trace-events-subdirs +=3D hw/dma
 trace-events-subdirs +=3D hw/hppa
diff --git a/include/hw/clock-port.h b/include/hw/clock-port.h
new file mode 100644
index 0000000000..8266549350
--- /dev/null
+++ b/include/hw/clock-port.h
@@ -0,0 +1,136 @@
+#ifndef CLOCK_PORT_H
+#define CLOCK_PORT_H
+
+#include "qom/object.h"
+#include "hw/qdev-core.h"
+#include "qemu/queue.h"
+#include "migration/vmstate.h"
+
+#define TYPE_CLOCK_IN "clock-in"
+#define CLOCK_IN(obj) OBJECT_CHECK(ClockIn, (obj), TYPE_CLOCK_IN)
+#define TYPE_CLOCK_OUT "clock-out"
+#define CLOCK_OUT(obj) OBJECT_CHECK(ClockOut, (obj), TYPE_CLOCK_OUT)
+
+typedef void ClockCallback(void *opaque);
+
+typedef struct ClockOut ClockOut;
+typedef struct ClockIn ClockIn;
+
+struct ClockIn {
+    /*< private >*/
+    Object parent_obj;
+    /*< private >*/
+    uint64_t frequency;
+    char *canonical_path; /* clock path cache */
+    ClockOut *driver; /* clock output controlling this clock */
+    ClockCallback *callback; /* local callback */
+    void *callback_opaque; /* opaque argument for the callback */
+    QLIST_ENTRY(ClockIn) sibling;  /* entry in a followers list */
+};
+
+struct ClockOut {
+    /*< private >*/
+    Object parent_obj;
+    /*< private >*/
+    char *canonical_path; /* clock path cache */
+    QLIST_HEAD(, ClockIn) followers; /* list of registered clocks */
+};
+
+extern const VMStateDescription vmstate_clockin;
+
+/*
+ * vmstate description entry to be added in device vmsd.
+ */
+#define VMSTATE_CLOCKIN(_field, _state) \
+    VMSTATE_CLOCKIN_V(_field, _state, 0)
+#define VMSTATE_CLOCKIN_V(_field, _state, _version) \
+    VMSTATE_STRUCT_POINTER_V(_field, _state, _version, vmstate_clockin, =
ClockIn)
+
+/**
+ * clock_out_setup_canonical_path:
+ * @clk: clock
+ *
+ * compute the canonical path of the clock (used by log messages)
+ */
+void clock_out_setup_canonical_path(ClockOut *clk);
+
+/**
+ * clock_in_setup_canonical_path:
+ * @clk: clock
+ *
+ * compute the canonical path of the clock (used by log messages)
+ */
+void clock_in_setup_canonical_path(ClockIn *clk);
+
+/**
+ * clock_add_callback:
+ * @clk: the clock to register the callback into
+ * @cb: the callback function
+ * @opaque: the argument to the callback
+ *
+ * Register a callback called on every clock update.
+ */
+void clock_set_callback(ClockIn *clk, ClockCallback *cb, void *opaque);
+
+/**
+ * clock_clear_callback:
+ * @clk: the clock to delete the callback from
+ *
+ * Unregister the callback registered with clock_set_callback.
+ */
+void clock_clear_callback(ClockIn *clk);
+
+/**
+ * clock_init_frequency:
+ * @clk: the clock to initialize.
+ * @freq: the clock's frequency in Hz or 0 if unclocked.
+ *
+ * Initialize the local cached frequency value of @clk to @freq.
+ * Note: this function must only be called during device inititializatio=
n
+ * or migration.
+ */
+void clock_init_frequency(ClockIn *clk, uint64_t freq);
+
+/**
+ * clock_connect:
+ * @clkin: the drived clock.
+ * @clkout: the driving clock.
+ *
+ * Setup @clkout to drive @clkin: Any @clkout update will be propagated
+ * to @clkin.
+ */
+void clock_connect(ClockIn *clkin, ClockOut *clkout);
+
+/**
+ * clock_set_frequency:
+ * @clk: the clock to update.
+ * @freq: the new clock's frequency in Hz or 0 if unclocked.
+ *
+ * Update the @clk to the new @freq.
+ * This change will be propagated through registered clock inputs.
+ */
+void clock_set_frequency(ClockOut *clk, uint64_t freq);
+
+/**
+ * clock_get_frequency:
+ * @clk: the clk to fetch the clock
+ *
+ * @return: the current frequency of @clk in Hz. If @clk is NULL, return=
 0.
+ */
+static inline uint64_t clock_get_frequency(const ClockIn *clk)
+{
+    return clk ? clk->frequency : 0;
+}
+
+/**
+ * clock_is_enabled:
+ * @clk: a clock state
+ *
+ * @return: true if the clock is running. If @clk is NULL return false.
+ */
+static inline bool clock_is_enabled(const ClockIn *clk)
+{
+    return clock_get_frequency(clk) !=3D 0;
+}
+
+#endif /* CLOCK_PORT_H */
diff --git a/hw/core/clock-port.c b/hw/core/clock-port.c
new file mode 100644
index 0000000000..25bab0fbed
--- /dev/null
+++ b/hw/core/clock-port.c
@@ -0,0 +1,159 @@
+/*
+ * Clock inputs and outputs
+ *
+ * Copyright GreenSocs 2016-2018
+ *
+ * Authors:
+ *  Frederic Konrad <fred.konrad@greensocs.com>
+ *  Damien Hedde <damien.hedde@greensocs.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or la=
ter.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/module.h"
+#include "hw/clock-port.h"
+#include "hw/qdev-core.h"
+#include "migration/vmstate.h"
+#include "qemu/log.h"
+#include "qapi/error.h"
+#include "trace.h"
+
+const VMStateDescription vmstate_clockin =3D {
+    .name =3D "clockin",
+    .version_id =3D 0,
+    .minimum_version_id =3D 0,
+    .fields =3D (VMStateField[]) {
+        VMSTATE_UINT64(frequency, ClockIn),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+#define CLOCK_PATH(_clk) (_clk->canonical_path)
+
+void clock_out_setup_canonical_path(ClockOut *clk)
+{
+    g_free(clk->canonical_path);
+    clk->canonical_path =3D object_get_canonical_path(OBJECT(clk));
+}
+
+void clock_in_setup_canonical_path(ClockIn *clk)
+{
+    g_free(clk->canonical_path);
+    clk->canonical_path =3D object_get_canonical_path(OBJECT(clk));
+}
+
+void clock_set_callback(ClockIn *clk, ClockCallback *cb, void *opaque)
+{
+    assert(clk);
+
+    clk->callback =3D cb;
+    clk->callback_opaque =3D opaque;
+}
+
+void clock_init_frequency(ClockIn *clk, uint64_t freq)
+{
+    assert(clk);
+
+    clk->frequency =3D freq;
+}
+
+void clock_clear_callback(ClockIn *clk)
+{
+    clock_set_callback(clk, NULL, NULL);
+}
+
+void clock_connect(ClockIn *clkin, ClockOut *clkout)
+{
+    assert(clkin && clkin->driver =3D=3D NULL);
+    assert(clkout);
+
+    trace_clock_connect(CLOCK_PATH(clkin), CLOCK_PATH(clkout));
+
+    QLIST_INSERT_HEAD(&clkout->followers, clkin, sibling);
+    clkin->driver =3D clkout;
+}
+
+static void clock_disconnect(ClockIn *clk)
+{
+    if (clk->driver =3D=3D NULL) {
+        return;
+    }
+
+    trace_clock_disconnect(CLOCK_PATH(clk));
+
+    clk->driver =3D NULL;
+    QLIST_REMOVE(clk, sibling);
+}
+
+void clock_set_frequency(ClockOut *clk, uint64_t freq)
+{
+    ClockIn *follower;
+    trace_clock_update(CLOCK_PATH(clk), freq);
+
+    QLIST_FOREACH(follower, &clk->followers, sibling) {
+        trace_clock_propagate(CLOCK_PATH(clk), CLOCK_PATH(follower));
+        if (follower->frequency !=3D freq) {
+            follower->frequency =3D freq;
+            if (follower->callback) {
+                follower->callback(follower->callback_opaque);
+            }
+        }
+    }
+}
+
+static void clock_out_initfn(Object *obj)
+{
+    ClockOut *clk =3D CLOCK_OUT(obj);
+
+    QLIST_INIT(&clk->followers);
+}
+
+static void clock_out_finalizefn(Object *obj)
+{
+    ClockOut *clk =3D CLOCK_OUT(obj);
+    ClockIn *follower, *next;
+
+    /* clear our list of followers */
+    QLIST_FOREACH_SAFE(follower, &clk->followers, sibling, next) {
+        clock_disconnect(follower);
+    }
+
+    g_free(clk->canonical_path);
+    clk->canonical_path =3D NULL;
+}
+
+static void clock_in_finalizefn(Object *obj)
+{
+    ClockIn *clk =3D CLOCK_IN(obj);
+
+    /* remove us from driver's followers list */
+    clock_disconnect(clk);
+
+    g_free(clk->canonical_path);
+    clk->canonical_path =3D NULL;
+}
+
+static const TypeInfo clock_out_info =3D {
+    .name              =3D TYPE_CLOCK_OUT,
+    .parent            =3D TYPE_OBJECT,
+    .instance_size     =3D sizeof(ClockOut),
+    .instance_init     =3D clock_out_initfn,
+    .instance_finalize =3D clock_out_finalizefn,
+};
+
+static const TypeInfo clock_in_info =3D {
+    .name              =3D TYPE_CLOCK_IN,
+    .parent            =3D TYPE_OBJECT,
+    .instance_size     =3D sizeof(ClockIn),
+    .instance_finalize =3D clock_in_finalizefn,
+};
+
+static void clock_register_types(void)
+{
+    type_register_static(&clock_in_info);
+    type_register_static(&clock_out_info);
+}
+
+type_init(clock_register_types)
diff --git a/hw/core/Makefile.objs b/hw/core/Makefile.objs
index eb88ca979e..f7102121f4 100644
--- a/hw/core/Makefile.objs
+++ b/hw/core/Makefile.objs
@@ -6,6 +6,7 @@ common-obj-$(CONFIG_SOFTMMU) +=3D fw-path-provider.o
 # irq.o needed for qdev GPIO handling:
 common-obj-y +=3D irq.o
 common-obj-y +=3D hotplug.o
+common-obj-y +=3D clock-port.o
 common-obj-$(CONFIG_SOFTMMU) +=3D nmi.o
=20
 common-obj-$(CONFIG_EMPTY_SLOT) +=3D empty_slot.o
diff --git a/hw/core/trace-events b/hw/core/trace-events
new file mode 100644
index 0000000000..d4880ec138
--- /dev/null
+++ b/hw/core/trace-events
@@ -0,0 +1,7 @@
+# See docs/devel/tracing.txt for syntax documentation.
+
+# hw/core/clock-port.c
+clock_connect(const char *clk, const char *driver) "'%s' drived-by '%s'"
+clock_disconnect(const char *clk) "'%s'"
+clock_update(const char *clk, uint64_t freq) "'%s' frequency %" PRIu64 "=
Hz"
+clock_propagate(const char *clko, const char *clki) "'%s' =3D> '%s'"
--=20
2.19.0

