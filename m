Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp661728wrp;
        Wed, 4 Sep 2019 05:47:52 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwXU18nAtR8jRyna2I/SUpKVWx/N4/vbNq1OzdubmDuEOO7LKrmQl0zHdL3at0BftprmFo+
X-Received: by 2002:a17:906:454b:: with SMTP id s11mr4575698ejq.183.1567601272752;
        Wed, 04 Sep 2019 05:47:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567601272; cv=none;
        d=google.com; s=arc-20160816;
        b=wqy9R1GJ4axdKm071aQrFV8mcsrd36DLgz23xXCVeZGyOiqfQU0x42KF1Mzotu/Y09
         nwJXTZXw3OhddHN3er5b9aYvUMX8Wcv/zCK9rBaajqcxX6C0zZ5heIydoDH9exxd5xdM
         H/IVgA6jrXmC+C8gNwSWk4ToZaCLH2M0VCbQ5T7udA4iI+DgT0LzgtjBqgUWfOkwkhiD
         cEfVsg33RAIGS1UVPcf6miVhr5Smf/7xla7kJ2GflnmvDCOjqiJdiyLIkrqWc7ahkwk8
         PLRyzAGUXtsD1Ge49/jCeXgNAlMxobXvP844vDLHN1gzlVrEL7ZWgStC+A1v2xhTEq5d
         CDZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from;
        bh=VJ4WddnZqt6DiP2aBroZGBcVdbR4+jNSA7hOukb011c=;
        b=ekzeK5MwjMpJ5dJ730B8XrIf9g5PCicn/UU2AcsB49CWJUQeVPeDImTfD7phn0b3cT
         exQCXEKNVdEkFSWQM2s6u0vI50rqpDwWxaHZiV7aq7kyl8ZJ5XzxNPysOzOTujkQLhnt
         xXB+C4eQtu6lOVsaItN98t/2qffvA6d2bARXhy0pJVl1tofNYF3Dv1PL9VDMED5EaIiu
         2HtYBF/TY8WUrg0+nIQVaJpFX+HJdP8VNdiNqpDFBxJbu28d8ChgKAPqlf2gkB2AKm16
         m+hjY0t1uqSKhp+vluZdORWu0Ol4Xt7C6ry5GaQQ2L8YdrrFrjUCcB8npV62eWjr0amw
         6xhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h12si520727ejc.84.2019.09.04.05.47.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Sep 2019 05:47:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5UhS-0006YU-7N
	for alex.bennee@linaro.org; Wed, 04 Sep 2019 08:47:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47769)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <damien.hedde@greensocs.con>) id 1i5Rqo-0004q0-Np
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 05:45:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.con>) id 1i5Rqn-0008QZ-1p
 for qemu-arm@nongnu.org; Wed, 04 Sep 2019 05:45:18 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:40562)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.con>)
 id 1i5Rqm-0008Pn-Pr; Wed, 04 Sep 2019 05:45:16 -0400
Received: from crumble.bar.greensocs.com (crumble.bar.greensocs.com
 [172.16.11.102])
 by beetle.greensocs.com (Postfix) with ESMTPS id 8837596F57;
 Wed,  4 Sep 2019 09:38:52 +0000 (UTC)
From: damien.hedde@greensocs.con
To: qemu-devel@nongnu.org
Date: Wed,  4 Sep 2019 11:38:38 +0200
Message-Id: <20190904093843.8765-5-damien.hedde@greensocs.con>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190904093843.8765-1-damien.hedde@greensocs.con>
References: <20190904093843.8765-1-damien.hedde@greensocs.con>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 5.135.226.135
X-Mailman-Approved-At: Wed, 04 Sep 2019 08:47:14 -0400
Subject: [Qemu-arm] [PATCH v6 4/9] qdev-monitor: print the device's clock
 with info qtree
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, peter.maydell@linaro.org,
 berrange@redhat.com, ehabkost@redhat.com, alistair@alistair23.me,
 mark.burton@greensocs.com, pbonzini@redhat.com, qemu-arm@nongnu.org,
 marcandre.lureau@redhat.com, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Hxl2ET6VVOSu

From: Damien Hedde <damien.hedde@greensocs.com>

This prints the clocks attached to a DeviceState when using "info qtree" =
monitor
command. For every clock, it displays the direction, the name and if the
clock is forwarded. For input clock, it displays also the frequency.

This is based on the original work of Frederic Konrad.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 qdev-monitor.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/qdev-monitor.c b/qdev-monitor.c
index a0003bf2a9..d5b8be956b 100644
--- a/qdev-monitor.c
+++ b/qdev-monitor.c
@@ -19,6 +19,7 @@
=20
 #include "qemu/osdep.h"
 #include "hw/sysbus.h"
+#include "hw/clock.h"
 #include "monitor/monitor.h"
 #include "monitor/qdev.h"
 #include "sysemu/arch_init.h"
@@ -689,6 +690,7 @@ static void qdev_print(Monitor *mon, DeviceState *dev=
, int indent)
     ObjectClass *class;
     BusState *child;
     NamedGPIOList *ngl;
+    NamedClockList *clk;
=20
     qdev_printf("dev: %s, id \"%s\"\n", object_get_typename(OBJECT(dev))=
,
                 dev->id ? dev->id : "");
@@ -703,6 +705,17 @@ static void qdev_print(Monitor *mon, DeviceState *de=
v, int indent)
                         ngl->num_out);
         }
     }
+    QLIST_FOREACH(clk, &dev->clocks, node) {
+        if (clk->out) {
+            qdev_printf("clock-out%s \"%s\"\n",
+                        clk->forward ? " (fw)" : "",
+                        clk->name);
+        } else {
+            qdev_printf("clock-in%s \"%s\" freq_hz=3D%" PRIu64"\n",
+                        clk->forward ? " (fw)" : "",
+                        clk->name, clock_get_frequency(clk->in));
+        }
+    }
     class =3D object_get_class(OBJECT(dev));
     do {
         qdev_print_props(mon, dev, DEVICE_CLASS(class)->props, indent);
--=20
2.22.0

