Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp3994723lfi;
        Mon, 6 Apr 2020 06:54:20 -0700 (PDT)
X-Google-Smtp-Source: APiQypKnR4qAgvY1/aQ5E/qNXHv4ca7MMwHe0vv2yEWL2w0/P7PuJFLERfr2wx1ZVAOjjIqMJIRq
X-Received: by 2002:ae9:ef50:: with SMTP id d77mr5695983qkg.99.1586181259711;
        Mon, 06 Apr 2020 06:54:19 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e23si10663894qkm.130.2020.04.06.06.54.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Apr 2020 06:54:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=neutral (body hash did not verify) header.i=@greensocs.com header.s=mail header.b=DpAvFuYy;
       arc=fail (body hash mismatch);
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:60490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jLSCh-0004d5-1r
	for alex.bennee@linaro.org; Mon, 06 Apr 2020 09:54:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54114)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <damien.hedde@greensocs.com>) id 1jLSBk-0003zw-Cr
 for qemu-arm@nongnu.org; Mon, 06 Apr 2020 09:53:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <damien.hedde@greensocs.com>) id 1jLSBj-000290-3u
 for qemu-arm@nongnu.org; Mon, 06 Apr 2020 09:53:20 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:57150)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <damien.hedde@greensocs.com>)
 id 1jLSBi-00027G-Qq; Mon, 06 Apr 2020 09:53:19 -0400
Received: from crumble.bar.greensocs.com (unknown [172.17.10.14])
 by beetle.greensocs.com (Postfix) with ESMTPS id 4F68896F58;
 Mon,  6 Apr 2020 13:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1586181197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LSG/QpD1xqo/C6MQOGaRFTgH86+yW5uNIUzQ2andGQk=;
 b=DpAvFuYyp6/Zj8DXDaj0LWWey/wKffnlF15Do7BcjiHjnRPrPPkyCX9rSnFcrlC6tLLI1e
 a72PY47RxCRhMk72o+Nx//DWAdmQNa+dwQiVJ1LKD7xx7Ix21nQHglJKQSRM5od4s1c8KZ
 WaDbTQliYZhb4imHLe7AzW+6ND1VLOU=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 9/9] qdev-monitor: print the device's clock with info qtree
Date: Mon,  6 Apr 2020 15:52:51 +0200
Message-Id: <20200406135251.157596-10-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200406135251.157596-1-damien.hedde@greensocs.com>
References: <20200406135251.157596-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com; 
 s=mail; t=1586181197;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LSG/QpD1xqo/C6MQOGaRFTgH86+yW5uNIUzQ2andGQk=;
 b=TNiQbGa8DyiWfoxtZ+Y7ALFB2zUkwmiuEgiBH/9nRIH3u014NTlJST9/2yt06DRfSUcCP6
 K7hGbMcwMEHCTskNq3W+3r1B6hvLBv5ruFubFi1wadJlUh0jZKamKv2Re0N312RtPhnJf5
 xvh98UcFLi4wcJTJ2EqyPHPCaFF+9L4=
ARC-Seal: i=1; s=mail; d=greensocs.com; t=1586181197; a=rsa-sha256; cv=none;
 b=rsoI97DSIWFUXxIgIO+apK3O1wMsvmJXjMh/wK62zdHy7JQc8371cFaCBjoBNjv16M/3T3
 k7JY/U5+SXKpfXtgAljTdvLZC7S8LxXjqj2rCobsPh2HyFOToAMcs+ujyU3i+foxnIT219
 L30zOxWP/rPwhE3Yn5n4NgZHkV774sI=
ARC-Authentication-Results: i=1;
	beetle.greensocs.com;
	none
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 5.135.226.135
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
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>, berrange@redhat.com,
 ehabkost@redhat.com, pbonzini@redhat.com, alistair@alistair23.me,
 mark.burton@greensocs.com, qemu-arm@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, marcandre.lureau@redhat.com,
 philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vCHRTWckvhyt

This prints the clocks attached to a DeviceState when using
"info qtree" monitor command. For every clock, it displays the
direction, the name and if the clock is forwarded. For input clock,
it displays also the frequency.

This is based on the original work of Frederic Konrad.

Here follows a sample of `info qtree` output on xilinx_zynq machine
after linux boot with only one uart clocked:
> bus: main-system-bus
>  type System
>  [...]
>  dev: cadence_uart, id ""
>    gpio-out "sysbus-irq" 1
>    clock-in "refclk" freq_hz=3D0.000000e+00
>    chardev =3D ""
>    mmio 00000000e0001000/0000000000001000
>  dev: cadence_uart, id ""
>    gpio-out "sysbus-irq" 1
>    clock-in "refclk" freq_hz=3D1.375661e+07
>    chardev =3D "serial0"
>    mmio 00000000e0000000/0000000000001000
>  [...]
>  dev: xilinx,zynq_slcr, id ""
>    clock-out "uart1_ref_clk" freq_hz=3D0.000000e+00
>    clock-out "uart0_ref_clk" freq_hz=3D1.375661e+07
>    clock-in "ps_clk" freq_hz=3D3.333333e+07
>    mmio 00000000f8000000/0000000000001000

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---

v7:
 + print output clocks frequencies too
 + add sample of qtree message above
 + display frequencies in floating-point
---
 qdev-monitor.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/qdev-monitor.c b/qdev-monitor.c
index 9833b33549..56cee1483f 100644
--- a/qdev-monitor.c
+++ b/qdev-monitor.c
@@ -38,6 +38,7 @@
 #include "migration/misc.h"
 #include "migration/migration.h"
 #include "qemu/cutils.h"
+#include "hw/clock.h"
=20
 /*
  * Aliases were a bad idea from the start.  Let's keep them
@@ -737,6 +738,7 @@ static void qdev_print(Monitor *mon, DeviceState *dev=
, int indent)
     ObjectClass *class;
     BusState *child;
     NamedGPIOList *ngl;
+    NamedClockList *ncl;
=20
     qdev_printf("dev: %s, id \"%s\"\n", object_get_typename(OBJECT(dev))=
,
                 dev->id ? dev->id : "");
@@ -751,6 +753,13 @@ static void qdev_print(Monitor *mon, DeviceState *de=
v, int indent)
                         ngl->num_out);
         }
     }
+    QLIST_FOREACH(ncl, &dev->clocks, node) {
+        qdev_printf("clock-%s%s \"%s\" freq_hz=3D%e\n",
+                    ncl->output ? "out" : "in",
+                    ncl->alias ? " (alias)" : "",
+                    ncl->name,
+                    CLOCK_PERIOD_TO_HZ(1.0 * clock_get(ncl->clock)));
+    }
     class =3D object_get_class(OBJECT(dev));
     do {
         qdev_print_props(mon, dev, DEVICE_CLASS(class)->props_, indent);
--=20
2.26.0

