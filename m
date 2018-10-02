Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp5139417wrt;
        Tue, 2 Oct 2018 07:43:54 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61rZhJBhNBYW0m872OXGq0RZMASxVKmhQKUfqt7E1woAL8hiQ4MBu/u4wuU6BstStLoQgnT
X-Received: by 2002:a0c:c78c:: with SMTP id k12-v6mr12104372qvj.99.1538491434091;
        Tue, 02 Oct 2018 07:43:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1538491434; cv=none;
        d=google.com; s=arc-20160816;
        b=z5ddHuANR0SYhuEBVybsxT7YCbz8DHZm1E8XAMSRC2bQ1MGq5Y/0rl6pmS6Qdxgd5M
         gzFR8G8c6bBh2ANsFRtOnDZAPvd3GVmcqOSr+pvwgLtjnfc3r8eRMEyPRwn8DpRYDcpW
         jpgn5f4Src0OGPCw4sRW3eoUTcnnFNlLL6oBfwvuFUnlWuF+LDWnPcEcn7YyFWA+p56f
         nOFDDcr/M+/fz1dKetnGo8AUN/QcxiwmjYxpNjLz/3V6j8gNR5L8LJuInY8m+RniaudG
         BpymXwhXOoQg2qWkWcYZAm5/O0tm6kdA5sWxWXowKtH9bIj8qpG8nsyoxHwI3hqTrEeX
         3ZCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=SCyG95Fk8ExKCzt1Y3e7CQpnXuPyhu9GubpNa+c+EIY=;
        b=gzEUinxLbuaaVrODRLAWGzIBDrmx1qxfu/5gLPnDGzyXnUzadyLW+tgXL5XRi4cTbD
         iqjk2TadJLP+g6/rGQ7LsiCYs3pCELsDIC6S9FLnP14kxSt8Xwto4qulgGJEM+v3KmnC
         3nrv/99GT1xvLITzeV5u88G3QoRhVuxHZkQkTQwrYfDy5DrAvN3jIlsRpr2dO5MgBd5U
         DB7Fe903LUT0qKiNgdNJKRbLs01lSywlUAdgyqVIgB1LKq//QPDQ2qBBtcwLb0xoOttv
         dJifuXhpvrlZgXwmphe7CYRRhlq6iqKs+thb/wZVxD7cjJzZij/HI2AhSnJGV2L1WR03
         0hEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="S5C/yARp";
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=bSjz8aJP;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=bSjz8aJP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u42-v6si850997qth.262.2018.10.02.07.43.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 02 Oct 2018 07:43:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b="S5C/yARp";
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=bSjz8aJP;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=bSjz8aJP;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44051 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g7Ltx-0002z7-EG
	for alex.bennee@linaro.org; Tue, 02 Oct 2018 10:43:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46825)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1g7Lmw-0005Kf-7H
	for qemu-devel@nongnu.org; Tue, 02 Oct 2018 10:36:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1g7LdC-0004QL-LV
	for qemu-devel@nongnu.org; Tue, 02 Oct 2018 10:26:35 -0400
Received: from greensocs.com ([193.104.36.180]:53819)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>)
	id 1g7Ld9-0004L0-C3; Tue, 02 Oct 2018 10:26:31 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id 0D1BCC7AC5;
	Tue,  2 Oct 2018 16:26:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1538490368;
	bh=hfBPiWf3ZL4pT347LbsUbQ915KOAggttZcOgqcVYycs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=S5C/yARp6sbzYiPmKWH904uFdaULGLR3XPoDyrmfu4YRjY5U2FRxAscGqMMdXzoWq
	88vEhbvk+V73dW9tGkMQOINnMIripGsSsbebnPLCASLLw1n0v7ux+1pYbjJ3Rjrhmu
	RXoLE9Wirv/DdCUSeCNf76muama9SSknpFZGPYO4=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=bSjz8aJP;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=bSjz8aJP
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nedi4oqLr3lv; Tue,  2 Oct 2018 16:26:06 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id A9BD0442AF8; Tue,  2 Oct 2018 16:26:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1538490365;
	bh=hfBPiWf3ZL4pT347LbsUbQ915KOAggttZcOgqcVYycs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bSjz8aJPTPYj/m0e1Rf8yO1mS4CQDPRO2ABo1q7Qn1Y3Ca4YBqbvE+fE8uLU+d62b
	ZW1LAuYQt0D0PTpJ095jT8wgvuT154bzC4gSMdk2wYzMOGM+8EDMNL4YcKzibec1Cn
	R7sa4flfYJm9zDoWlPx+rrix4cS90izeD7Qy0SAU=
Received: from kouign-amann.hive.antfield.fr (antfield.tima.u-ga.fr
	[147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: damien.hedde@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id 24E41442AE7;
	Tue,  2 Oct 2018 16:26:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1538490365;
	bh=hfBPiWf3ZL4pT347LbsUbQ915KOAggttZcOgqcVYycs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bSjz8aJPTPYj/m0e1Rf8yO1mS4CQDPRO2ABo1q7Qn1Y3Ca4YBqbvE+fE8uLU+d62b
	ZW1LAuYQt0D0PTpJ095jT8wgvuT154bzC4gSMdk2wYzMOGM+8EDMNL4YcKzibec1Cn
	R7sa4flfYJm9zDoWlPx+rrix4cS90izeD7Qy0SAU=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Date: Tue,  2 Oct 2018 16:24:38 +0200
Message-Id: <20181002142443.30976-5-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.19.0
In-Reply-To: <20181002142443.30976-1-damien.hedde@greensocs.com>
References: <20181002142443.30976-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-devel] [PATCH v5 4/9] qdev-clock: introduce an init array to
 ease the device construction
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
X-TUID: WgyDM5B2dkfn

Introduce a function and macro helpers to setup several clocks
in a device from a static array description.

An element of the array describes the clock (name and direction) as
well as the related callback and an optional offset to store the
created object pointer in the device state structure.

The array must be terminated by a special element QDEV_CLOCK_END.

This is based on the original work of Frederic Konrad.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 include/hw/qdev-clock.h | 67 +++++++++++++++++++++++++++++++++++++++++
 hw/core/qdev-clock.c    | 26 ++++++++++++++++
 2 files changed, 93 insertions(+)

diff --git a/include/hw/qdev-clock.h b/include/hw/qdev-clock.h
index d76aa9f479..fba907dee2 100644
--- a/include/hw/qdev-clock.h
+++ b/include/hw/qdev-clock.h
@@ -59,4 +59,71 @@ void qdev_connect_clock(DeviceState *dev, const char *=
name,
                         DeviceState *driver, const char *driver_name,
                         Error **errp);
=20
+/**
+ * ClockInitElem:
+ * @name: name of the clock (can't be NULL)
+ * @output: indicates whether the clock is input or output
+ * @callback: for inputs, optional callback to be called on clock's upda=
te
+ * with device as opaque
+ * @offset: optional offset to store the clock pointer in device'state
+ * structure (0 means unused)
+ */
+struct ClockPortInitElem {
+    const char *name;
+    bool output;
+    ClockCallback *callback;
+    size_t offset;
+};
+
+#define clock_offset_value(_type, _devstate, _field) \
+    (offsetof(_devstate, _field) + \
+     type_check(_type *, typeof_field(_devstate, _field)))
+
+#define QDEV_CLOCK(_output, _type, _devstate, _field, _callback) { \
+    .name =3D (stringify(_field)), \
+    .output =3D _output, \
+    .callback =3D _callback, \
+    .offset =3D clock_offset_value(_type, _devstate, _field), \
+}
+
+/**
+ * QDEV_CLOCK_(IN|OUT):
+ * @_devstate: structure type. @dev argument of qdev_init_clocks below m=
ust be
+ * a pointer to that same type.
+ * @_field: a field in @_devstate (must be ClockIn* or ClockOut*)
+ * @_callback: (for input only) callback (or NULL) to be called with the=
 device
+ * state as argument
+ *
+ * The name of the clock will be derived from @_field
+ */
+#define QDEV_CLOCK_IN(_devstate, _field, _callback) \
+    QDEV_CLOCK(false, ClockIn, _devstate, _field, _callback)
+
+#define QDEV_CLOCK_OUT(_devstate, _field) \
+    QDEV_CLOCK(true, ClockOut, _devstate, _field, NULL)
+
+/**
+ * QDEV_CLOCK_IN_NOFIELD:
+ * @_name: name of the clock
+ * @_callback: callback (or NULL) to be called with the device state as =
argument
+ */
+#define QDEV_CLOCK_IN_NOFIELD(_name, _callback) { \
+    .name =3D _name, \
+    .output =3D false, \
+    .callback =3D _callback, \
+    .offset =3D 0, \
+}
+
+#define QDEV_CLOCK_END { .name =3D NULL }
+
+typedef struct ClockPortInitElem ClockPortInitArray[];
+
+/**
+ * qdev_init_clocks:
+ * @dev: the device to add clocks
+ * @clocks: a QDEV_CLOCK_END-terminated array which contains the
+ * clocks information.
+ */
+void qdev_init_clocks(DeviceState *dev, const ClockPortInitArray clocks)=
;
+
 #endif /* QDEV_CLOCK_H */
diff --git a/hw/core/qdev-clock.c b/hw/core/qdev-clock.c
index f0e4839aed..08afe3983d 100644
--- a/hw/core/qdev-clock.c
+++ b/hw/core/qdev-clock.c
@@ -138,3 +138,29 @@ void qdev_connect_clock(DeviceState *dev, const char=
 *name,
=20
     clock_connect(ncl->in , drv_ncl->out);
 }
+
+void qdev_init_clocks(DeviceState *dev, const ClockPortInitArray clocks)
+{
+    const struct ClockPortInitElem *elem;
+
+    assert(dev);
+    assert(clocks);
+
+    for (elem =3D &clocks[0]; elem->name !=3D NULL; elem++) {
+        /* offset cannot be inside the DeviceState part */
+        assert(elem->offset =3D=3D 0 || elem->offset > sizeof(DeviceStat=
e));
+        if (elem->output) {
+            ClockOut *clk;
+            clk =3D qdev_init_clock_out(dev, elem->name);
+            if (elem->offset) {
+                *(ClockOut **)(((void *) dev) + elem->offset) =3D clk;
+            }
+        } else {
+            ClockIn *clk;
+            clk =3D qdev_init_clock_in(dev, elem->name, elem->callback, =
dev);
+            if (elem->offset) {
+                *(ClockIn **)(((void *) dev) + elem->offset) =3D clk;
+            }
+        }
+    }
+}
--=20
2.19.0

