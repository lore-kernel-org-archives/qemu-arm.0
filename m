Received: by 10.25.159.131 with SMTP id i125csp115951lfe;
        Tue, 29 Nov 2016 21:45:05 -0800 (PST)
X-Received: by 10.200.33.244 with SMTP id 49mr27760743qtz.70.1480484705018;
        Tue, 29 Nov 2016 21:45:05 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k32si29391224qtd.329.2016.11.29.21.45.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Nov 2016 21:45:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41044 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cBxhY-0006L6-BL
	for alex.bennee@linaro.org; Wed, 30 Nov 2016 00:45:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44907)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alastair@au1.ibm.com>) id 1cBxZy-0000Sz-HX
	for qemu-arm@nongnu.org; Wed, 30 Nov 2016 00:37:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alastair@au1.ibm.com>) id 1cBxZu-0005Mx-J6
	for qemu-arm@nongnu.org; Wed, 30 Nov 2016 00:37:14 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:52161
	helo=mx0a-001b2d01.pphosted.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alastair@au1.ibm.com>)
	id 1cBxZu-0005MG-B3
	for qemu-arm@nongnu.org; Wed, 30 Nov 2016 00:37:10 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
	uAU5Y5V8137238
	for <qemu-arm@nongnu.org>; Wed, 30 Nov 2016 00:37:09 -0500
Received: from e23smtp04.au.ibm.com (e23smtp04.au.ibm.com [202.81.31.146])
	by mx0b-001b2d01.pphosted.com with ESMTP id 271mdjkdue-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <qemu-arm@nongnu.org>; Wed, 30 Nov 2016 00:37:08 -0500
Received: from localhost
	by e23smtp04.au.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-arm@nongnu.org> from <alastair@au1.ibm.com>;
	Wed, 30 Nov 2016 15:37:05 +1000
Received: from d23dlp02.au.ibm.com (202.81.31.213)
	by e23smtp04.au.ibm.com (202.81.31.210) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Wed, 30 Nov 2016 15:37:03 +1000
Received: from d23relay10.au.ibm.com (d23relay10.au.ibm.com [9.190.26.77])
	by d23dlp02.au.ibm.com (Postfix) with ESMTP id D658E2BB005B;
	Wed, 30 Nov 2016 16:37:02 +1100 (EST)
Received: from d23av02.au.ibm.com (d23av02.au.ibm.com [9.190.235.138])
	by d23relay10.au.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	uAU5b2Gq3080594; Wed, 30 Nov 2016 16:37:02 +1100
Received: from d23av02.au.ibm.com (localhost [127.0.0.1])
	by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
	uAU5b12o021113; Wed, 30 Nov 2016 16:37:02 +1100
Received: from ozlabs.au.ibm.com (ozlabs.au.ibm.com [9.192.253.14])
	by d23av02.au.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
	uAU5b1QM021107; Wed, 30 Nov 2016 16:37:01 +1100
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 0D2CDA030E;
	Wed, 30 Nov 2016 16:37:01 +1100 (AEDT)
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: qemu-arm@nongnu.org
Date: Wed, 30 Nov 2016 16:36:27 +1100
X-Mailer: git-send-email 2.9.3
In-Reply-To: <20161130053629.23340-1-alastair@au1.ibm.com>
References: <20161130053629.23340-1-alastair@au1.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16113005-0012-0000-0000-000001F18DB7
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16113005-0013-0000-0000-0000068B30B4
Message-Id: <20161130053629.23340-5-alastair@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-11-30_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	spamscore=0 suspectscore=1
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1609300000
	definitions=main-1611300092
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
	mx0b-001b2d01.pphosted.com id uAU5Y5V8137238
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.158.5
Subject: [Qemu-arm] [PATCH v2 4/6] hw/timer: Add Epson RX8900 RTC support
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
	qemu-devel@nongnu.org, Chris Smart <chris@distroguy.com>,
	Joel Stanley <joel@jms.id.au>, Alastair D'Silva <alastair@d-silva.org>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cjem3Lcrjr9S

From: Alastair D'Silva <alastair@d-silva.org>

This patch adds support for the Epson RX8900 I2C RTC.

The following chip features are implemented:
 - RTC (wallclock based, ptimer 10x oversampling to pick up
	wallclock transitions)
 - Time update interrupt (per second/minute, wallclock based)
 - Alarms (wallclock based)
 - Temperature (set via a property)
 - Countdown timer (emulated clock via ptimer)
 - FOUT via GPIO (emulated clock via ptimer)

The following chip features are unimplemented:
 - Low voltage detection
 - i2c timeout

The implementation exports the following named GPIOs:
rx8900-interrupt-out
rx8900-fout-enable
rx8900-fout

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
Signed-off-by: Chris Smart <chris@distroguy.com>
---
 default-configs/arm-softmmu.mak |   1 +
 hw/timer/Makefile.objs          |   2 +
 hw/timer/rx8900.c               | 890 ++++++++++++++++++++++++++++++++++=
++++++
 hw/timer/rx8900_regs.h          | 139 +++++++
 hw/timer/trace-events           |  31 ++
 5 files changed, 1063 insertions(+)
 create mode 100644 hw/timer/rx8900.c
 create mode 100644 hw/timer/rx8900_regs.h

diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
index 6de3e16..adb600e 100644
--- a/default-configs/arm-softmmu.mak
+++ b/default-configs/arm-softmmu.mak
@@ -29,6 +29,7 @@ CONFIG_SMC91C111=3Dy
 CONFIG_ALLWINNER_EMAC=3Dy
 CONFIG_IMX_FEC=3Dy
 CONFIG_DS1338=3Dy
+CONFIG_RX8900=3Dy
 CONFIG_PFLASH_CFI01=3Dy
 CONFIG_PFLASH_CFI02=3Dy
 CONFIG_MICRODRIVE=3Dy
diff --git a/hw/timer/Makefile.objs b/hw/timer/Makefile.objs
index 7ba8c23..fa028ac 100644
--- a/hw/timer/Makefile.objs
+++ b/hw/timer/Makefile.objs
@@ -3,6 +3,7 @@ common-obj-$(CONFIG_ARM_MPTIMER) +=3D arm_mptimer.o
 common-obj-$(CONFIG_A9_GTIMER) +=3D a9gtimer.o
 common-obj-$(CONFIG_CADENCE) +=3D cadence_ttc.o
 common-obj-$(CONFIG_DS1338) +=3D ds1338.o
+common-obj-$(CONFIG_RX8900) +=3D rx8900.o
 common-obj-$(CONFIG_HPET) +=3D hpet.o
 common-obj-$(CONFIG_I8254) +=3D i8254_common.o i8254.o
 common-obj-$(CONFIG_M48T59) +=3D m48t59.o
@@ -17,6 +18,7 @@ common-obj-$(CONFIG_IMX) +=3D imx_epit.o
 common-obj-$(CONFIG_IMX) +=3D imx_gpt.o
 common-obj-$(CONFIG_LM32) +=3D lm32_timer.o
 common-obj-$(CONFIG_MILKYMIST) +=3D milkymist-sysctl.o
+common-obj-$(CONFIG_RX8900) +=3D rx8900.o
=20
 obj-$(CONFIG_EXYNOS4) +=3D exynos4210_mct.o
 obj-$(CONFIG_EXYNOS4) +=3D exynos4210_pwm.o
diff --git a/hw/timer/rx8900.c b/hw/timer/rx8900.c
new file mode 100644
index 0000000..e634819
--- /dev/null
+++ b/hw/timer/rx8900.c
@@ -0,0 +1,890 @@
+/*
+ * Epson RX8900SA/CE Realtime Clock Module
+ *
+ * Copyright (c) 2016 IBM Corporation
+ * Authors:
+ *  Alastair D'Silva <alastair@d-silva.org>
+ *  Chris Smart <chris@distroguy.com>
+ *
+ * This code is licensed under the GPL version 2 or later.  See
+ * the COPYING file in the top-level directory.
+ *
+ * Datasheet available at:
+ *  https://support.epson.biz/td/api/doc_check.php?dl=3Dapp_RX8900CE&lan=
g=3Den
+ *
+ * Not implemented:
+ *  Implement i2c timeout
+ */
+
+#include "qemu/osdep.h"
+#include "qemu-common.h"
+#include "hw/i2c/i2c.h"
+#include "hw/timer/rx8900_regs.h"
+#include "hw/ptimer.h"
+#include "qemu/main-loop.h"
+#include "qemu/bcd.h"
+#include "qemu/log.h"
+#include "qapi/error.h"
+#include "qapi/visitor.h"
+#include "trace.h"
+
+ #include <sys/time.h>
+
+ #include <execinfo.h>
+
+#define TYPE_RX8900 "rx8900"
+#define RX8900(obj) OBJECT_CHECK(RX8900State, (obj), TYPE_RX8900)
+
+typedef struct RX8900State {
+    I2CSlave parent_obj;
+
+    ptimer_state *sec_timer; /* triggered once per second */
+    ptimer_state *fout_timer;
+    ptimer_state *countdown_timer;
+    bool fout;
+    int64_t offset;
+    uint8_t weekday; /* Saved for deferred offset calculation, 0-6 */
+    uint8_t wday_offset;
+    uint8_t nvram[RX8900_NVRAM_SIZE];
+    int32_t ptr; /* Wrapped to stay within RX8900_NVRAM_SIZE */
+    bool addr_byte;
+    uint8_t last_interrupt_seconds;
+    uint8_t last_update_interrupt_minutes;
+    double supply_voltage;
+    qemu_irq interrupt_pin;
+    qemu_irq fout_pin;
+} RX8900State;
+
+static const VMStateDescription vmstate_rx8900 =3D {
+    .name =3D "rx8900",
+    .version_id =3D 2,
+    .minimum_version_id =3D 1,
+    .fields =3D (VMStateField[]) {
+        VMSTATE_I2C_SLAVE(parent_obj, RX8900State),
+        VMSTATE_PTIMER(sec_timer, RX8900State),
+        VMSTATE_PTIMER(fout_timer, RX8900State),
+        VMSTATE_PTIMER(countdown_timer, RX8900State),
+        VMSTATE_BOOL(fout, RX8900State),
+        VMSTATE_INT64(offset, RX8900State),
+        VMSTATE_UINT8_V(weekday, RX8900State, 2),
+        VMSTATE_UINT8_V(wday_offset, RX8900State, 2),
+        VMSTATE_UINT8_ARRAY(nvram, RX8900State, RX8900_NVRAM_SIZE),
+        VMSTATE_INT32(ptr, RX8900State),
+        VMSTATE_BOOL(addr_byte, RX8900State),
+        VMSTATE_UINT8_V(last_interrupt_seconds, RX8900State, 2),
+        VMSTATE_UINT8_V(last_update_interrupt_minutes, RX8900State, 2),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void rx8900_reset(DeviceState *dev);
+static void disable_countdown_timer(RX8900State *s);
+static void enable_countdown_timer(RX8900State *s);
+static void disable_timer(RX8900State *s);
+static void enable_timer(RX8900State *s);
+
+static void capture_current_time(RX8900State *s)
+{
+    /* Capture the current time into the secondary registers
+     * which will be actually read by the data transfer operation.
+     */
+    struct tm now;
+    qemu_get_timedate(&now, s->offset);
+    s->nvram[SECONDS] =3D to_bcd(now.tm_sec);
+    s->nvram[MINUTES] =3D to_bcd(now.tm_min);
+    s->nvram[HOURS] =3D to_bcd(now.tm_hour);
+
+    s->nvram[WEEKDAY] =3D 0x01 << ((now.tm_wday + s->wday_offset) % 7);
+    s->nvram[DAY] =3D to_bcd(now.tm_mday);
+    s->nvram[MONTH] =3D to_bcd(now.tm_mon + 1);
+    s->nvram[YEAR] =3D to_bcd(now.tm_year % 100);
+
+    s->nvram[EXT_SECONDS] =3D s->nvram[SECONDS];
+    s->nvram[EXT_MINUTES] =3D s->nvram[MINUTES];
+    s->nvram[EXT_HOURS] =3D s->nvram[HOURS];
+    s->nvram[EXT_WEEKDAY] =3D s->nvram[WEEKDAY];
+    s->nvram[EXT_DAY] =3D s->nvram[DAY];
+    s->nvram[EXT_MONTH] =3D s->nvram[MONTH];
+    s->nvram[EXT_YEAR] =3D s->nvram[YEAR];
+
+    trace_rx8900_capture_current_time(now.tm_hour, now.tm_min, now.tm_se=
c,
+            (now.tm_wday + s->wday_offset) % 7,
+            now.tm_mday, now.tm_mon, now.tm_year + 1900,
+            s->nvram[HOURS], s->nvram[MINUTES], s->nvram[SECONDS],
+            s->nvram[WEEKDAY], s->nvram[DAY], s->nvram[MONTH], s->nvram[=
YEAR]);
+}
+
+/**
+ * Increment the internal register pointer, dealing with wrapping
+ * @param s the RTC to operate on
+ */
+static void inc_regptr(RX8900State *s)
+{
+    /* The register pointer wraps around after 0x1F
+     */
+    s->ptr =3D (s->ptr + 1) & (RX8900_NVRAM_SIZE - 1);
+    trace_rx8900_regptr_update(s->ptr);
+
+    if (s->ptr =3D=3D 0x00) {
+        trace_rx8900_regptr_overflow();
+        capture_current_time(s);
+    }
+}
+
+/**
+ * Receive an I2C Event
+ * @param i2c the i2c device instance
+ * @param event the event to handle
+ */
+static void rx8900_event(I2CSlave *i2c, enum i2c_event event)
+{
+    RX8900State *s =3D RX8900(i2c);
+
+    switch (event) {
+    case I2C_START_RECV:
+        /* In h/w, time capture happens on any START condition, not just=
 a
+         * START_RECV. For the emulation, it doesn't actually matter,
+         * since a START_RECV has to occur before the data can be read.
+         */
+        capture_current_time(s);
+        break;
+    case I2C_START_SEND:
+        s->addr_byte =3D true;
+        break;
+    case I2C_FINISH:
+        if (s->weekday < 7) {
+            /* We defer the weekday calculation as it is handed to us be=
fore
+             * the date has been updated. If we calculate the weekday of=
fset
+             * when it is passed to us, we will incorrectly determine it
+             * based on the current emulated date, rather than the date =
that
+             * has been written.
+             */
+            struct tm now;
+            qemu_get_timedate(&now, s->offset);
+
+            s->wday_offset =3D (s->weekday - now.tm_wday + 7) % 7;
+
+            trace_rx8900_event_weekday(s->weekday, BIT(s->weekday),
+                    s->wday_offset);
+
+            s->weekday =3D 7;
+        }
+        break;
+
+    default:
+        break;
+    }
+}
+
+/**
+ * Perform an i2c receive action
+ * @param i2c the i2c device instance
+ * @return the value of the current register
+ * @post the internal register pointer is incremented
+ */
+static int rx8900_recv(I2CSlave *i2c)
+{
+    RX8900State *s =3D RX8900(i2c);
+    uint8_t res =3D s->nvram[s->ptr];
+    trace_rx8900_read_register(s->ptr, res);
+    inc_regptr(s);
+    return res;
+}
+
+/**
+ * Validate the extension register and perform actions based on the bits
+ * @param s the RTC to operate on
+ * @param data the new data for the extension register
+ */
+static void update_extension_register(RX8900State *s, uint8_t data)
+{
+    if (data & EXT_MASK_TEST) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+            "Test bit is enabled but is forbidden by the manufacturer");
+    }
+
+    if ((data ^ s->nvram[EXTENSION_REGISTER]) &
+            (EXT_MASK_FSEL0 | EXT_MASK_FSEL1)) {
+        uint8_t fsel =3D (data & (EXT_MASK_FSEL0 | EXT_MASK_FSEL1))
+                >> EXT_REG_FSEL0;
+        /* FSELx has changed */
+        switch (fsel) {
+        case 0x01:
+            trace_rx8900_set_fout(1024);
+            ptimer_set_limit(s->fout_timer, 32, 1);
+            break;
+        case 0x02:
+            trace_rx8900_set_fout(1);
+            ptimer_set_limit(s->fout_timer, 32768, 1);
+            break;
+        default:
+            trace_rx8900_set_fout(32768);
+            ptimer_set_limit(s->fout_timer, 1, 1);
+            break;
+        }
+    }
+
+    if ((data ^ s->nvram[EXTENSION_REGISTER]) &
+            (EXT_MASK_TSEL0 | EXT_MASK_TSEL1)) {
+        uint8_t tsel =3D (data & (EXT_MASK_TSEL0 | EXT_MASK_TSEL1))
+                >> EXT_REG_TSEL0;
+        /* TSELx has changed */
+        switch (tsel) {
+        case 0x00:
+            trace_rx8900_set_countdown_timer(64);
+            ptimer_set_limit(s->countdown_timer, 4096 / 64, 1);
+            break;
+        case 0x01:
+            trace_rx8900_set_countdown_timer(1);
+            ptimer_set_limit(s->countdown_timer, 4096, 1);
+            break;
+        case 0x02:
+            trace_rx8900_set_countdown_timer_per_minute();
+            ptimer_set_limit(s->countdown_timer, 4069 * 60, 1);
+            break;
+        case 0x03:
+            trace_rx8900_set_countdown_timer(4096);
+            ptimer_set_limit(s->countdown_timer, 1, 1);
+            break;
+        }
+    }
+
+    if (data & EXT_MASK_TE) {
+        enable_countdown_timer(s);
+    }
+
+    s->nvram[EXTENSION_REGISTER] =3D data;
+    s->nvram[EXT_EXTENSION_REGISTER] =3D data;
+
+}
+/**
+ * Validate the control register and perform actions based on the bits
+ * @param s the RTC to operate on
+ * @param data the new value for the control register
+ */
+
+static void update_control_register(RX8900State *s, uint8_t data)
+{
+    uint8_t diffmask =3D ~s->nvram[CONTROL_REGISTER] & data;
+
+    if (diffmask & CTRL_MASK_WP0) {
+        data &=3D ~CTRL_MASK_WP0;
+        qemu_log_mask(LOG_GUEST_ERROR,
+            "Attempt to write to write protected bit %d in control regis=
ter",
+            CTRL_REG_WP0);
+    }
+
+    if (diffmask & CTRL_MASK_WP1) {
+        data &=3D ~CTRL_MASK_WP1;
+        qemu_log_mask(LOG_GUEST_ERROR,
+            "Attempt to write to write protected bit %d in control regis=
ter",
+            CTRL_REG_WP1);
+    }
+
+    if (data & CTRL_MASK_RESET) {
+        data &=3D ~CTRL_MASK_RESET;
+        rx8900_reset(DEVICE(s));
+    }
+
+    if (diffmask & CTRL_MASK_UIE) {
+        /* Update interrupts were off and are now on */
+        struct tm now;
+
+        trace_rx8900_enable_update_timer();
+
+        qemu_get_timedate(&now, s->offset);
+
+        s->last_update_interrupt_minutes =3D now.tm_min;
+        s->last_interrupt_seconds =3D now.tm_sec;
+        enable_timer(s);
+    }
+
+    if (diffmask & CTRL_MASK_AIE) {
+        /* Alarm interrupts were off and are now on */
+        struct tm now;
+
+        trace_rx8900_enable_alarm();
+
+        qemu_get_timedate(&now, s->offset);
+
+        s->last_interrupt_seconds =3D now.tm_sec;
+        enable_timer(s);
+    }
+
+    if (!(data & (CTRL_MASK_UIE | CTRL_MASK_AIE))) {
+        disable_timer(s);
+    }
+
+    s->nvram[CONTROL_REGISTER] =3D data;
+    s->nvram[EXT_CONTROL_REGISTER] =3D data;
+}
+
+/**
+ * Validate the flag register
+ * @param s the RTC to operate on
+ * @param data the new value for the flag register
+ */
+static void validate_flag_register(RX8900State *s, uint8_t *data)
+{
+    uint8_t diffmask =3D ~s->nvram[FLAG_REGISTER] & *data;
+
+    if (diffmask & FLAG_MASK_VDET) {
+        *data &=3D ~FLAG_MASK_VDET;
+        qemu_log_mask(LOG_GUEST_ERROR,
+            "Only 0 can be written to VDET bit %d in the flag register",
+            FLAG_REG_VDET);
+    }
+
+    if (diffmask & FLAG_MASK_VLF) {
+        *data &=3D ~FLAG_MASK_VLF;
+        qemu_log_mask(LOG_GUEST_ERROR,
+            "Only 0 can be written to VLF bit %d in the flag register",
+            FLAG_REG_VLF);
+    }
+
+    if (diffmask & FLAG_MASK_UNUSED_2) {
+        *data &=3D ~FLAG_MASK_UNUSED_2;
+        qemu_log_mask(LOG_GUEST_ERROR,
+            "Only 0 can be written to unused bit %d in the flag register=
",
+            FLAG_REG_UNUSED_2);
+    }
+
+    if (diffmask & FLAG_MASK_UNUSED_6) {
+        *data &=3D ~FLAG_MASK_UNUSED_6;
+        qemu_log_mask(LOG_GUEST_ERROR,
+            "Only 0 can be written to unused bit %d in the flag register=
",
+            FLAG_REG_UNUSED_6);
+    }
+
+    if (diffmask & FLAG_MASK_UNUSED_7) {
+        *data &=3D ~FLAG_MASK_UNUSED_7;
+        qemu_log_mask(LOG_GUEST_ERROR,
+            "Only 0 can be written to unused bit %d in the flag register=
",
+            FLAG_REG_UNUSED_7);
+    }
+}
+
+/**
+ * Tick the per second timer (can be called more frequently as it early =
exits
+ * if the wall clock has not progressed)
+ * @param opaque the RTC to tick
+ */
+static void rx8900_timer_tick(void *opaque)
+{
+    RX8900State *s =3D (RX8900State *)opaque;
+    struct tm now;
+    bool fire_interrupt =3D false;
+    bool alarm_week_day_matches;
+
+    qemu_get_timedate(&now, s->offset);
+
+    if (now.tm_sec =3D=3D s->last_interrupt_seconds) {
+        return;
+    }
+
+    s->last_interrupt_seconds =3D now.tm_sec;
+
+    trace_rx8900_tick();
+
+    /* Update timer interrupt */
+    if (s->nvram[CONTROL_REGISTER] & CTRL_MASK_UIE) {
+        if ((s->nvram[EXTENSION_REGISTER] & EXT_MASK_USEL) &&
+                now.tm_min !=3D s->last_update_interrupt_minutes) {
+            s->last_update_interrupt_minutes =3D now.tm_min;
+            s->nvram[FLAG_REGISTER] |=3D FLAG_MASK_UF;
+            fire_interrupt =3D true;
+        } else if (!(s->nvram[EXTENSION_REGISTER] & EXT_MASK_USEL)) {
+            /* per second update interrupt */
+            s->nvram[FLAG_REGISTER] |=3D FLAG_MASK_UF;
+            fire_interrupt =3D true;
+        }
+    }
+
+    /* Alarm interrupt */
+    alarm_week_day_matches =3D s->nvram[ALARM_WEEK_DAY] =3D=3D
+            ((s->nvram[EXTENSION_REGISTER] & EXT_MASK_WADA) ?
+                    to_bcd(now.tm_mday) :
+                    0x01 << ((now.tm_wday + s->wday_offset) % 7));
+
+    if ((s->nvram[CONTROL_REGISTER] & CTRL_MASK_AIE) && now.tm_sec =3D=3D=
 0) {
+        if (s->nvram[ALARM_MINUTE] =3D=3D to_bcd(now.tm_min) &&
+                s->nvram[ALARM_HOUR] =3D=3D to_bcd(now.tm_hour) &&
+                alarm_week_day_matches) {
+            trace_rx8900_trigger_alarm();
+            s->nvram[FLAG_REGISTER] |=3D FLAG_MASK_AF;
+            fire_interrupt =3D true;
+        }
+    }
+
+    if (fire_interrupt) {
+        trace_rx8900_fire_interrupt();
+        qemu_irq_pulse(s->interrupt_pin);
+    }
+}
+
+/**
+ * Disable the per second timer
+ * @param s the RTC to operate on
+ */
+static void disable_timer(RX8900State *s)
+{
+    trace_rx8900_disable_timer();
+    ptimer_stop(s->sec_timer);
+}
+
+/**
+ * Enable the per second timer
+ * @param s the RTC to operate on
+ */
+static void enable_timer(RX8900State *s)
+{
+    trace_rx8900_enable_timer();
+    ptimer_run(s->sec_timer, 0);
+}
+
+/**
+ * Handle FOUT_ENABLE (FOE) line
+ * Enables/disables the FOUT line
+ * @param opaque the device instance
+ * @param n the IRQ number
+ * @param level true if the line has been raised
+ */
+static void rx8900_fout_enable_handler(void *opaque, int n, int level)
+{
+    RX8900State *s =3D RX8900(opaque);
+
+    if (level) {
+        trace_rx8900_enable_fout();
+        ptimer_run(s->fout_timer, 0);
+    } else {
+        /* disable fout */
+        trace_rx8900_disable_fout();
+        ptimer_stop(s->fout_timer);
+    }
+}
+
+/**
+ * Tick the FOUT timer
+ * @param opaque the device instance
+ */
+static void rx8900_fout_tick(void *opaque)
+{
+    RX8900State *s =3D (RX8900State *)opaque;
+
+    trace_rx8900_fout_toggle();
+    s->fout =3D !s->fout;
+
+    if (s->fout) {
+        qemu_irq_raise(s->fout_pin);
+    } else {
+        qemu_irq_lower(s->fout_pin);
+    }
+}
+
+
+/**
+ * Disable the countdown timer
+ * @param s the RTC to operate on
+ */
+static void disable_countdown_timer(RX8900State *s)
+{
+    trace_rx8900_disable_countdown();
+    ptimer_stop(s->countdown_timer);
+}
+
+/**
+ * Enable the countdown timer
+ * @param s the RTC to operate on
+ */
+static void enable_countdown_timer(RX8900State *s)
+{
+    trace_rx8900_enable_countdown();
+    ptimer_run(s->countdown_timer, 0);
+}
+
+/**
+ * Tick the countdown timer
+ * @param opaque the device instance
+ */
+static void rx8900_countdown_tick(void *opaque)
+{
+    RX8900State *s =3D (RX8900State *)opaque;
+
+    uint16_t count =3D s->nvram[TIMER_COUNTER_0] +
+            ((s->nvram[TIMER_COUNTER_1] & 0x0F) << 8);
+    trace_rx8900_countdown_tick(count);
+    count--;
+
+    s->nvram[TIMER_COUNTER_0] =3D (uint8_t)(count & 0x00ff);
+    s->nvram[TIMER_COUNTER_1] =3D (uint8_t)((count & 0x0f00) >> 8);
+
+    if (count =3D=3D 0) {
+        trace_rx8900_countdown_elapsed();
+
+        disable_countdown_timer(s);
+
+        s->nvram[FLAG_REGISTER] |=3D FLAG_MASK_TF;
+
+        if (s->nvram[CONTROL_REGISTER] & CTRL_MASK_TIE) {
+            trace_rx8900_fire_interrupt();
+            qemu_irq_pulse(s->interrupt_pin);
+        }
+    }
+}
+
+/**
+ * Verify the current voltage and raise flags if it is low
+ * @param s the RTC to operate on
+ */
+static void check_voltage(RX8900State *s)
+{
+    if (!(s->nvram[BACKUP_FUNCTION] & BACKUP_MASK_VDETOFF)) {
+        if (s->supply_voltage < 2.0f) {
+            s->nvram[FLAG_REGISTER] |=3D FLAG_MASK_VDET;
+        }
+
+        if (s->supply_voltage < 1.6f) {
+            s->nvram[FLAG_REGISTER] |=3D FLAG_MASK_VLF;
+        }
+    }
+}
+
+/**
+ * Receive a byte of data from i2c
+ * @param i2c the i2c device that is receiving data
+ * @param data the data that was received
+ */
+static int rx8900_send(I2CSlave *i2c, uint8_t data)
+{
+    RX8900State *s =3D RX8900(i2c);
+    struct tm now;
+
+    trace_rx8900_i2c_data_receive(data);
+
+    if (s->addr_byte) {
+        s->ptr =3D data & (RX8900_NVRAM_SIZE - 1);
+        trace_rx8900_regptr_update(s->ptr);
+        s->addr_byte =3D false;
+        return 0;
+    }
+
+    trace_rx8900_set_register(s->ptr, data);
+
+    qemu_get_timedate(&now, s->offset);
+    switch (s->ptr) {
+    case SECONDS:
+    case EXT_SECONDS:
+        now.tm_sec =3D from_bcd(data & 0x7f);
+        s->offset =3D qemu_timedate_diff(&now);
+        break;
+
+    case MINUTES:
+    case EXT_MINUTES:
+        now.tm_min =3D from_bcd(data & 0x7f);
+        s->offset =3D qemu_timedate_diff(&now);
+        break;
+
+    case HOURS:
+    case EXT_HOURS:
+        now.tm_hour =3D from_bcd(data & 0x3f);
+        s->offset =3D qemu_timedate_diff(&now);
+        break;
+
+    case WEEKDAY:
+    case EXT_WEEKDAY: {
+        int user_wday =3D ctz32(data);
+        /* The day field is supposed to contain a value in
+         * the range 0-6. Otherwise behavior is undefined.
+         */
+        switch (data) {
+        case 0x01:
+        case 0x02:
+        case 0x04:
+        case 0x08:
+        case 0x10:
+        case 0x20:
+        case 0x40:
+            break;
+        default:
+            qemu_log_mask(LOG_GUEST_ERROR,
+                "RX8900 - weekday data '%x' is out of range, "
+                        "undefined behavior will result", data);
+            break;
+        }
+        s->weekday =3D user_wday;
+        break;
+    }
+
+    case DAY:
+    case EXT_DAY:
+        now.tm_mday =3D from_bcd(data & 0x3f);
+        s->offset =3D qemu_timedate_diff(&now);
+        break;
+
+    case MONTH:
+    case EXT_MONTH:
+        now.tm_mon =3D from_bcd(data & 0x1f) - 1;
+        s->offset =3D qemu_timedate_diff(&now);
+        break;
+
+    case YEAR:
+    case EXT_YEAR:
+        now.tm_year =3D from_bcd(data) + 100;
+        s->offset =3D qemu_timedate_diff(&now);
+        break;
+
+    case EXTENSION_REGISTER:
+    case EXT_EXTENSION_REGISTER:
+        update_extension_register(s, data);
+        break;
+
+    case FLAG_REGISTER:
+    case EXT_FLAG_REGISTER:
+        validate_flag_register(s, &data);
+
+        s->nvram[FLAG_REGISTER] =3D data;
+        s->nvram[EXT_FLAG_REGISTER] =3D data;
+
+        check_voltage(s);
+        break;
+
+    case CONTROL_REGISTER:
+    case EXT_CONTROL_REGISTER:
+        update_control_register(s, data);
+        break;
+
+    default:
+        s->nvram[s->ptr] =3D data;
+    }
+
+    inc_regptr(s);
+    return 0;
+}
+
+/**
+ * Get the device temperature in Celcius as a property
+ * @param obj the device
+ * @param v
+ * @param name the property name
+ * @param opaque
+ * @param errp an error object to populate on failure
+ */
+static void rx8900_get_temperature(Object *obj, Visitor *v, const char *=
name,
+                                   void *opaque, Error **errp)
+{
+    RX8900State *s =3D RX8900(obj);
+    double value =3D (s->nvram[TEMPERATURE] * 2.0f - 187.1f) / 3.218f;
+
+    trace_rx8900_read_temperature(s->nvram[TEMPERATURE], value);
+
+    visit_type_number(v, name, &value, errp);
+}
+
+/**
+ * Set the device temperature in Celcius as a property
+ * @param obj the device
+ * @param v
+ * @param name the property name
+ * @param opaque
+ * @param errp an error object to populate on failure
+ */
+static void rx8900_set_temperature(Object *obj, Visitor *v, const char *=
name,
+                                   void *opaque, Error **errp)
+{
+    RX8900State *s =3D RX8900(obj);
+    Error *local_err =3D NULL;
+    double temp; /* degrees Celcius */
+    visit_type_number(v, name, &temp, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
+    if (temp >=3D 100 || temp < -58) {
+        error_setg(errp, "value %f=C2=B0C is out of range", temp);
+        return;
+    }
+
+    s->nvram[TEMPERATURE] =3D (uint8_t) ((temp * 3.218f + 187.19f) / 2);
+
+    trace_rx8900_set_temperature(s->nvram[TEMPERATURE], temp);
+}
+
+/**
+ * Get the device supply voltage as a property
+ * @param obj the device
+ * @param v
+ * @param name the property name
+ * @param opaque
+ * @param errp an error object to populate on failure
+ */
+static void rx8900_get_voltage(Object *obj, Visitor *v, const char *name=
,
+                                   void *opaque, Error **errp)
+{
+    RX8900State *s =3D RX8900(obj);
+
+    visit_type_number(v, name, &s->supply_voltage, errp);
+}
+
+/**
+ * Set the device supply voltage as a property
+ * @param obj the device
+ * @param v
+ * @param name the property name
+ * @param opaque
+ * @param errp an error object to populate on failure
+ */
+static void rx8900_set_voltage(Object *obj, Visitor *v, const char *name=
,
+                                   void *opaque, Error **errp)
+{
+    RX8900State *s =3D RX8900(obj);
+    Error *local_err =3D NULL;
+    double temp;
+    visit_type_number(v, name, &temp, &local_err);
+    if (local_err) {
+        error_propagate(errp, local_err);
+        return;
+    }
+
+    s->supply_voltage =3D temp;
+    trace_rx8900_set_voltage(s->supply_voltage);
+
+    check_voltage(s);
+}
+
+
+/**
+ * Configure device properties
+ * @param obj the device
+ */
+static void rx8900_initfn(Object *obj)
+{
+    object_property_add(obj, "temperature", "number",
+                        rx8900_get_temperature,
+                        rx8900_set_temperature, NULL, NULL, NULL);
+
+    object_property_add(obj, "supply voltage", "number",
+                        rx8900_get_voltage,
+                        rx8900_set_voltage, NULL, NULL, NULL);
+}
+
+/**
+ * Reset the device
+ * @param dev the RX8900 device to reset
+ */
+static void rx8900_reset(DeviceState *dev)
+{
+    RX8900State *s =3D RX8900(dev);
+
+    trace_rx8900_reset();
+
+    /* The clock is running and synchronized with the host */
+    s->offset =3D 0;
+    s->weekday =3D 7; /* Set to an invalid value */
+
+    s->nvram[EXTENSION_REGISTER] =3D EXT_MASK_TSEL1;
+    s->nvram[CONTROL_REGISTER] =3D CTRL_MASK_CSEL0;
+    s->nvram[FLAG_REGISTER] &=3D FLAG_MASK_VDET | FLAG_MASK_VLF;
+
+    s->ptr =3D 0;
+
+    trace_rx8900_regptr_update(s->ptr);
+
+    s->addr_byte =3D false;
+}
+
+/**
+ * Realize an RX8900 device instance
+ * Set up timers
+ * Configure GPIO lines
+ * @param dev the device instance to realize
+ * @param errp an error object to populate on error
+ */
+static void rx8900_realize(DeviceState *dev, Error **errp)
+{
+    RX8900State *s =3D RX8900(dev);
+    I2CSlave *i2c =3D I2C_SLAVE(dev);
+    QEMUBH *bh;
+    char name[64];
+
+    s->fout =3D false;
+
+    memset(s->nvram, 0, RX8900_NVRAM_SIZE);
+    /* Temperature formulation from the datasheet
+     * ( TEMP[ 7:0 ] * 2 - 187.19) / 3.218
+     *
+     * Set the initial state to 25 degrees Celcius
+     */
+    s->nvram[TEMPERATURE] =3D 135; /* (25 * 3.218 + 187.19) / 2 */
+
+    bh =3D qemu_bh_new(rx8900_timer_tick, s);
+    s->sec_timer =3D ptimer_init(bh, PTIMER_POLICY_DEFAULT);
+    /* we trigger the timer at 10Hz and check for rollover, as the qemu
+     * clock does not advance in realtime in the test environment,
+     * leading to unstable test results
+     */
+    ptimer_set_freq(s->sec_timer, 10);
+    ptimer_set_limit(s->sec_timer, 1, 1);
+
+    bh =3D qemu_bh_new(rx8900_fout_tick, s);
+    s->fout_timer =3D ptimer_init(bh, PTIMER_POLICY_DEFAULT);
+    /* frequency doubled to generate 50% duty cycle square wave */
+    ptimer_set_freq(s->fout_timer, 32768 * 2);
+    ptimer_set_limit(s->fout_timer, 1, 1);
+
+    bh =3D qemu_bh_new(rx8900_countdown_tick, s);
+    s->countdown_timer =3D ptimer_init(bh, PTIMER_POLICY_DEFAULT);
+    ptimer_set_freq(s->countdown_timer, 4096);
+    ptimer_set_limit(s->countdown_timer, 4096, 1);
+
+
+    snprintf(name, sizeof(name), "rx8900-interrupt-out");
+    qdev_init_gpio_out_named(&i2c->qdev, &s->interrupt_pin, name, 1);
+    trace_rx8900_pin_name("Interrupt", name);
+
+    snprintf(name, sizeof(name), "rx8900-fout-enable");
+    qdev_init_gpio_in_named(&i2c->qdev, rx8900_fout_enable_handler, name=
, 1);
+    trace_rx8900_pin_name("Fout-enable", name);
+
+    snprintf(name, sizeof(name), "rx8900-fout");
+    qdev_init_gpio_out_named(&i2c->qdev, &s->fout_pin, name, 1);
+    trace_rx8900_pin_name("Fout", name);
+
+    s->supply_voltage =3D 3.3f;
+    trace_rx8900_set_voltage(s->supply_voltage);
+}
+
+/**
+ * Set up the device callbacks
+ * @param klass the device class
+ * @param data
+ */
+static void rx8900_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc =3D DEVICE_CLASS(klass);
+    I2CSlaveClass *k =3D I2C_SLAVE_CLASS(klass);
+
+    k->event =3D rx8900_event;
+    k->recv =3D rx8900_recv;
+    k->send =3D rx8900_send;
+    dc->realize =3D rx8900_realize;
+    dc->reset =3D rx8900_reset;
+    dc->vmsd =3D &vmstate_rx8900;
+}
+
+static const TypeInfo rx8900_info =3D {
+    .name =3D TYPE_RX8900,
+    .parent =3D TYPE_I2C_SLAVE,
+    .instance_size =3D sizeof(RX8900State),
+    .instance_init =3D rx8900_initfn,
+    .class_init =3D rx8900_class_init,
+};
+
+/**
+ * Register the device with QEMU
+ */
+static void rx8900_register_types(void)
+{
+    type_register_static(&rx8900_info);
+}
+
+type_init(rx8900_register_types)
diff --git a/hw/timer/rx8900_regs.h b/hw/timer/rx8900_regs.h
new file mode 100644
index 0000000..cfec535
--- /dev/null
+++ b/hw/timer/rx8900_regs.h
@@ -0,0 +1,139 @@
+/*
+ * Epson RX8900SA/CE Realtime Clock Module
+ *
+ * Copyright (c) 2016 IBM Corporation
+ * Authors:
+ *  Alastair D'Silva <alastair@d-silva.org>
+ *
+ * This code is licensed under the GPL version 2 or later.  See
+ * the COPYING file in the top-level directory.
+ *
+ * Datasheet available at:
+ *  https://support.epson.biz/td/api/doc_check.php?dl=3Dapp_RX8900CE&lan=
g=3Den
+ *
+ */
+
+#ifndef RX8900_REGS_H
+#define RX8900_REGS_H
+
+#include "qemu/bitops.h"
+
+#define RX8900_NVRAM_SIZE 0x20
+
+typedef enum RX8900Addresses {
+    SECONDS =3D 0x00,
+    MINUTES =3D 0x01,
+    HOURS =3D 0x02,
+    WEEKDAY =3D 0x03,
+    DAY =3D 0x04,
+    MONTH =3D 0x05,
+    YEAR =3D 0x06,
+    RAM =3D 0x07,
+    ALARM_MINUTE =3D 0x08,
+    ALARM_HOUR =3D 0x09,
+    ALARM_WEEK_DAY =3D 0x0A,
+    TIMER_COUNTER_0 =3D 0x0B,
+    TIMER_COUNTER_1 =3D 0x0C,
+    EXTENSION_REGISTER =3D 0x0D,
+    FLAG_REGISTER =3D 0X0E,
+    CONTROL_REGISTER =3D 0X0F,
+    EXT_SECONDS =3D 0x010, /* Alias of SECONDS */
+    EXT_MINUTES =3D 0x11, /* Alias of MINUTES */
+    EXT_HOURS =3D 0x12, /* Alias of HOURS */
+    EXT_WEEKDAY =3D 0x13, /* Alias of WEEKDAY */
+    EXT_DAY =3D 0x14, /* Alias of DAY */
+    EXT_MONTH =3D 0x15, /* Alias of MONTH */
+    EXT_YEAR =3D 0x16, /* Alias of YEAR */
+    TEMPERATURE =3D 0x17,
+    BACKUP_FUNCTION =3D 0x18,
+    NO_USE_1 =3D 0x19,
+    NO_USE_2 =3D 0x1A,
+    EXT_TIMER_COUNTER_0 =3D 0x1B, /* Alias of TIMER_COUNTER_0 */
+    EXT_TIMER_COUNTER_1 =3D 0x1C, /* Alias of TIMER_COUNTER_1 */
+    EXT_EXTENSION_REGISTER =3D 0x1D, /* Alias of EXTENSION_REGISTER */
+    EXT_FLAG_REGISTER =3D 0X1E, /* Alias of FLAG_REGISTER */
+    EXT_CONTROL_REGISTER =3D 0X1F /* Alias of CONTROL_REGISTER */
+} RX8900Addresses;
+
+typedef enum ExtRegBits {
+    EXT_REG_TSEL0 =3D 0,
+    EXT_REG_TSEL1 =3D 1,
+    EXT_REG_FSEL0 =3D 2,
+    EXT_REG_FSEL1 =3D 3,
+    EXT_REG_TE =3D 4,
+    EXT_REG_USEL =3D 5,
+    EXT_REG_WADA =3D 6,
+    EXT_REG_TEST =3D 7
+} ExtRegBits;
+
+typedef enum ExtRegMasks {
+    EXT_MASK_TSEL0 =3D BIT(0),
+    EXT_MASK_TSEL1 =3D BIT(1),
+    EXT_MASK_FSEL0 =3D BIT(2),
+    EXT_MASK_FSEL1 =3D BIT(3),
+    EXT_MASK_TE =3D BIT(4),
+    EXT_MASK_USEL =3D BIT(5),
+    EXT_MASK_WADA =3D BIT(6),
+    EXT_MASK_TEST =3D BIT(7)
+} ExtRegMasks;
+
+typedef enum CtrlRegBits {
+    CTRL_REG_RESET =3D 0,
+    CTRL_REG_WP0 =3D 1,
+    CTRL_REG_WP1 =3D 2,
+    CTRL_REG_AIE =3D 3,
+    CTRL_REG_TIE =3D 4,
+    CTRL_REG_UIE =3D 5,
+    CTRL_REG_CSEL0 =3D 6,
+    CTRL_REG_CSEL1 =3D 7
+} CtrlRegBits;
+
+typedef enum CtrlRegMask {
+    CTRL_MASK_RESET =3D BIT(0),
+    CTRL_MASK_WP0 =3D BIT(1),
+    CTRL_MASK_WP1 =3D BIT(2),
+    CTRL_MASK_AIE =3D BIT(3),
+    CTRL_MASK_TIE =3D BIT(4),
+    CTRL_MASK_UIE =3D BIT(5),
+    CTRL_MASK_CSEL0 =3D BIT(6),
+    CTRL_MASK_CSEL1 =3D BIT(7)
+} CtrlRegMask;
+
+typedef enum FlagRegBits {
+    FLAG_REG_VDET =3D 0,
+    FLAG_REG_VLF =3D 1,
+    FLAG_REG_UNUSED_2 =3D 2,
+    FLAG_REG_AF =3D 3,
+    FLAG_REG_TF =3D 4,
+    FLAG_REG_UF =3D 5,
+    FLAG_REG_UNUSED_6 =3D 6,
+    FLAG_REG_UNUSED_7 =3D 7
+} FlagRegBits;
+
+#define RX8900_INTERRUPT_SOURCES 6
+typedef enum FlagRegMask {
+    FLAG_MASK_VDET =3D BIT(0),
+    FLAG_MASK_VLF =3D BIT(1),
+    FLAG_MASK_UNUSED_2 =3D BIT(2),
+    FLAG_MASK_AF =3D BIT(3),
+    FLAG_MASK_TF =3D BIT(4),
+    FLAG_MASK_UF =3D BIT(5),
+    FLAG_MASK_UNUSED_6 =3D BIT(6),
+    FLAG_MASK_UNUSED_7 =3D BIT(7)
+} FlagRegMask;
+
+typedef enum BackupRegBits {
+    BACKUP_REG_BKSMP0 =3D 0,
+    BACKUP_REG_BKSMP1 =3D 1,
+    BACKUP_REG_SWOFF =3D 2,
+    BACKUP_REG_VDETOFF =3D 3
+} BackupRegBits;
+
+typedef enum BackupRegMask {
+    BACKUP_MASK_BKSMP0 =3D BIT(0),
+    BACKUP_MASK_BKSMP1 =3D BIT(1),
+    BACKUP_MASK_SWOFF =3D BIT(2),
+    BACKUP_MASK_VDETOFF =3D BIT(3)
+} BackupRegMask;
+
+#endif
diff --git a/hw/timer/trace-events b/hw/timer/trace-events
index 3495c41..057e414 100644
--- a/hw/timer/trace-events
+++ b/hw/timer/trace-events
@@ -49,3 +49,34 @@ aspeed_timer_ctrl_pulse_enable(uint8_t i, bool enable)=
 "Timer %" PRIu8 ": %d"
 aspeed_timer_set_ctrl2(uint32_t value) "Value: 0x%" PRIx32
 aspeed_timer_set_value(int timer, int reg, uint32_t value) "Timer %d reg=
ister %d: 0x%" PRIx32
 aspeed_timer_read(uint64_t offset, unsigned size, uint64_t value) "From =
0x%" PRIx64 ": of size %u: 0x%" PRIx64
+
+# hw/timer/rx8900.c
+rx8900_capture_current_time(int hour, int minute, int second, int weekda=
y, int mday, int month, int year, int raw_hours, int raw_minutes, int raw=
_seconds, int raw_weekday, int raw_day, int raw_month, int raw_year) "Upd=
ate current time to %02d:%02d:%02d %d %d/%d/%d (0x%02x%02x%02x%02x%02x%02=
x%02x)"
+rx8900_regptr_update(uint32_t ptr) "Operating on register 0x%02x"
+rx8900_regptr_overflow(void) "Register pointer has overflowed, wrapping =
to 0"
+rx8900_event_weekday(int weekday, int weekmask, int weekday_offset) "Set=
 weekday to %d (0x%02x), wday_offset=3D%d"
+rx8900_read_register(int address, int val) "Read register 0x%x =3D 0x%x"
+rx8900_set_fout(int hz) "Setting fout to %dHz"
+rx8900_set_countdown_timer(int hz) "Setting countdown timer to %d Hz"
+rx8900_set_countdown_timer_per_minute(void) "Setting countdown timer to =
per minute updates"
+rx8900_enable_update_timer(void) "Enabling update timer"
+rx8900_enable_alarm(void) "Enabling alarm"
+rx8900_trigger_alarm(void) "Triggering alarm"
+rx8900_tick(void) "Tick"
+rx8900_fire_interrupt(void) "Pulsing interrupt"
+rx8900_disable_timer(void) "Disabling timer"
+rx8900_enable_timer(void) "Enabling timer"
+rx8900_disable_fout(void) "Disabling fout"
+rx8900_enable_fout(void) "Enabling fout"
+rx8900_fout_toggle(void) "Toggling fout"
+rx8900_disable_countdown(void) "Disabling countdown timer"
+rx8900_enable_countdown(void) "Enabling countdown timer"
+rx8900_countdown_tick(int count) "Countdown tick, count=3D%d"
+rx8900_countdown_elapsed(void) "Countdown elapsed"
+rx8900_i2c_data_receive(uint8_t data) "Received I2C data 0x%02x"
+rx8900_set_register(uint32_t addr, uint8_t data) "Set data 0x%02x=3D0x%0=
2x"
+rx8900_read_temperature(uint8_t raw, double val) "Read temperature prope=
rty, 0x%x =3D %f=C2=B0C"
+rx8900_set_temperature(uint8_t raw, double val) "Set temperature propert=
y, 0x%x =3D %f=C2=B0C"
+rx8900_reset(void) "Reset"
+rx8900_pin_name(const char *type, const char *name) "'%s' pin is '%s'"
+rx8900_set_voltage(double voltage) "Device voltage set to %f"
--=20
2.9.3

