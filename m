Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp3654838wrd;
        Mon, 17 Sep 2018 01:41:40 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdY7aqkKqGLFdhcnuJGBzL4eePSrSGPgz8HMVReqARmG1VeQ/l2yKx0q9316QIO4eNjdmf3H
X-Received: by 2002:a37:9dd8:: with SMTP id g207-v6mr15960462qke.19.1537173700517;
        Mon, 17 Sep 2018 01:41:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537173700; cv=none;
        d=google.com; s=arc-20160816;
        b=SD0u/OaiVIggFRc+wWOiqGhnVRIxA5O5Tj8KgxDzqZZyfJ9NO1GHmh6mjVhaypU6aw
         kSiqRSIz7UKGLUfLyGtnf35gC3PqiX1t0vBTNNXPpBSvRYL/s9sZcwiye+piNRIttpE7
         KEK8SUnwfJSMlOa67q2RcNwxxeJ0VQl1veDyHuBrGuCxzpOD78eRE1m99SLMYC+nqhIN
         O2H0XONKqdsx900NVZBdldzWwzmBOgddLXpXWZafJ3ioFkjyi+gqs1V/MGMqjq5IH2Vl
         TLCXrpU7I2bgqLIaztTIThwaHvGtQ1Aj7V0HIMPlga4PKSgeajT7UV7OxL3BAY2g9RLS
         3IRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature:dkim-signature
         :dkim-signature;
        bh=VE4eezL0B9M6/caKT6BcqCjK42dV+2ETwDrU/t06M+g=;
        b=gb9WS1k4hmkNcIToANivA8nI3N3xL47X3RuKTbfYxDS2MaYJB/3AdKN99wKI3OUjHQ
         Xhrr3cS+37qgxfBGRga3pwbzLeJYCjpchpzX9ltIxkxvT3RzRFkB+wKvj6Ri7eqAe+hg
         aKdGQBIIeVDT9wOp33KDWktk765iwKB80wFOarwS0mVxG4B+8+cZpkhvkcnFVFpVffLh
         AYpWLktMdG1rShDoke4z5+9XwmQV8ajhzGIajIyvqTegzUikbC+CwFxOmjHOCxLOQdN/
         vQNZ6WcSALGSwJc4ZQoFEMKAG5bGXiKmcQO+lzrCt4z7K/EVUlJuECecG0TYQkscpBzP
         LLUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=zKMSiVbp;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=34Lt9d1U;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=34Lt9d1U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g48-v6si8535425qtc.224.2018.09.17.01.41.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 17 Sep 2018 01:41:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=zKMSiVbp;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=34Lt9d1U;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=34Lt9d1U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34414 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g1p6B-0006AY-W5
	for alex.bennee@linaro.org; Mon, 17 Sep 2018 04:41:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46390)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1g1p5u-00069K-Su
	for qemu-arm@nongnu.org; Mon, 17 Sep 2018 04:41:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>) id 1g1p5p-0005V7-L3
	for qemu-arm@nongnu.org; Mon, 17 Sep 2018 04:41:22 -0400
Received: from greensocs.com ([193.104.36.180]:51710)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <damien.hedde@greensocs.com>)
	id 1g1p5o-0005TH-Vi; Mon, 17 Sep 2018 04:41:17 -0400
Received: from localhost (localhost [127.0.0.1])
	by greensocs.com (Postfix) with ESMTP id CF794521AB6;
	Mon, 17 Sep 2018 10:41:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1537173670;
	bh=ad+IoHRlAKMY+vuSKfg4+m9rK/Mw7VhSQZL3cL+Z0BM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=zKMSiVbporfQbWVMpm8LehmvQjYT2kngLpDsK5uuqk5lNaZIj4bgkoskwLdl1LNiq
	k+kHdC7FcJg6IxbGrrwGhxIIDxyGIhWIaWVuGEtxSR5lSm2T2SKcHzg3An47Wk6BaQ
	fxkN94a9ti+TnxDMHJGgJqZk8Fx48eEs+rdNujQ0=
X-Virus-Scanned: amavisd-new at greensocs.com
Authentication-Results: gs-01.greensocs.com (amavisd-new);
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=34Lt9d1U;
	dkim=pass (1024-bit key) header.d=greensocs.com header.b=34Lt9d1U
Received: from greensocs.com ([127.0.0.1])
	by localhost (gs-01.greensocs.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WEFZO5GAPU2j; Mon, 17 Sep 2018 10:41:10 +0200 (CEST)
Received: by greensocs.com (Postfix, from userid 998)
	id 5983D2386FB; Mon, 17 Sep 2018 10:41:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1537173669;
	bh=ad+IoHRlAKMY+vuSKfg4+m9rK/Mw7VhSQZL3cL+Z0BM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=34Lt9d1Up3ApSRaVWLeDTG10VgQgIzNZvuK511Tbgf6fY2ekHelwjzx6xEOP2fTvc
	FkRpuAIbRL0ms8tKYwDiHG/dffy0SzVyvhmJya0kGcDoVEjFOuDaazr5VCyr8T0gcT
	CmrcjKezVrAvnuZfv6Gt8NPxPTLKLxMcNWhuZhNk=
Received: from kouign-amann.hive.antfield.fr (antfield.tima.u-ga.fr
	[147.171.129.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: damien.hedde@greensocs.com)
	by greensocs.com (Postfix) with ESMTPSA id D871323878C;
	Mon, 17 Sep 2018 10:41:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=greensocs.com;
	s=mail; t=1537173669;
	bh=ad+IoHRlAKMY+vuSKfg4+m9rK/Mw7VhSQZL3cL+Z0BM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=34Lt9d1Up3ApSRaVWLeDTG10VgQgIzNZvuK511Tbgf6fY2ekHelwjzx6xEOP2fTvc
	FkRpuAIbRL0ms8tKYwDiHG/dffy0SzVyvhmJya0kGcDoVEjFOuDaazr5VCyr8T0gcT
	CmrcjKezVrAvnuZfv6Gt8NPxPTLKLxMcNWhuZhNk=
From: damien.hedde@greensocs.com
To: qemu-devel@nongnu.org
Date: Mon, 17 Sep 2018 10:40:10 +0200
Message-Id: <20180917084016.12750-5-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180917084016.12750-1-damien.hedde@greensocs.com>
References: <20180917084016.12750-1-damien.hedde@greensocs.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 193.104.36.180
Subject: [Qemu-arm] [PATCH v4 04/10] qdev-clock: introduce an init array to
 ease the device construction
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, alistair@alistair23.me,
	mark.burton@greensocs.com, saipava@xilinx.com,
	qemu-arm@nongnu.org, Damien Hedde <damien.hedde@greensocs.com>,
	pbonzini@redhat.com, luc.michel@greensocs.com, fred.konrad@greensocs.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oo0KiW80eWGB

From: Damien Hedde <damien.hedde@greensocs.com>

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
index 324eea6bcc..a5da8878af 100644
--- a/include/hw/qdev-clock.h
+++ b/include/hw/qdev-clock.h
@@ -59,4 +59,71 @@ void qdev_clock_connect(DeviceState *dev, const char *name,
                         DeviceState *driver, const char *driver_name,
                         Error **errp);
 
+/**
+ * ClockInitElem:
+ * @name: name of the clock (can't be NULL)
+ * @output: indicates whether the clock is input or output
+ * @callback: for inputs, optional callback to be called on clock's update
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
+    .name = (stringify(_field)), \
+    .output = _output, \
+    .callback = _callback, \
+    .offset = clock_offset_value(_type, _devstate, _field), \
+}
+
+/**
+ * QDEV_CLOCK_(IN|OUT):
+ * @_devstate: structure type. @dev argument of qdev_init_clocks below must be
+ * a pointer to that same type.
+ * @_field: a field in @_devstate (must be ClockIn* or ClockOut*)
+ * @_callback: (for input only) callback (or NULL) to be called with the device
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
+ * @_callback: callback (or NULL) to be called with the device state as argument
+ */
+#define QDEV_CLOCK_IN_NOFIELD(_name, _callback) { \
+    .name = _name, \
+    .output = false, \
+    .callback = _callback, \
+    .offset = 0, \
+}
+
+#define QDEV_CLOCK_END { .name = NULL }
+
+typedef struct ClockPortInitElem ClockPortInitArray[];
+
+/**
+ * qdev_init_clocks:
+ * @dev: the device to add clocks
+ * @clocks: a QDEV_CLOCK_END-terminated array which contains the
+ * clocks information.
+ */
+void qdev_init_clocks(DeviceState *dev, const ClockPortInitArray clocks);
+
 #endif /* QDEV_CLOCK_H */
diff --git a/hw/core/qdev-clock.c b/hw/core/qdev-clock.c
index cb7dba3f75..78d2509e04 100644
--- a/hw/core/qdev-clock.c
+++ b/hw/core/qdev-clock.c
@@ -138,3 +138,29 @@ void qdev_clock_connect(DeviceState *dev, const char *name,
 
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
+    for (elem = &clocks[0]; elem->name != NULL; elem++) {
+        /* offset cannot be inside the DeviceState part */
+        assert(elem->offset == 0 || elem->offset > sizeof(DeviceState));
+        if (elem->output) {
+            ClockOut *clk;
+            clk = qdev_init_clock_out(dev, elem->name);
+            if (elem->offset) {
+                *(ClockOut **)(((void *) dev) + elem->offset) = clk;
+            }
+        } else {
+            ClockIn *clk;
+            clk = qdev_init_clock_in(dev, elem->name, elem->callback, dev);
+            if (elem->offset) {
+                *(ClockIn **)(((void *) dev) + elem->offset) = clk;
+            }
+        }
+    }
+}
-- 
2.18.0

