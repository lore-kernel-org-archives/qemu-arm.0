Received: by 2002:a17:906:535b:b0:a20:43fc:1f40 with SMTP id j27csp2230328ejo;
        Thu, 14 Dec 2023 02:49:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEGZtQ3aH6hkwOFi9y9jW7/LTwQc1/QnreF1rN2bz8ipGZOQt6xxlnFiLkrG5fYfn7sZmpP
X-Received: by 2002:ae9:f70f:0:b0:77f:2496:1015 with SMTP id s15-20020ae9f70f000000b0077f24961015mr10301144qkg.76.1702550975074;
        Thu, 14 Dec 2023 02:49:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702550975; cv=none;
        d=google.com; s=arc-20160816;
        b=ej6ynbDXmAXli6/4lpfYBfBPMN3LVTmX/IDnNkN0lAExBJew9A+a8QpO9Kq/bCQBiG
         lTY6DIvOX2Dm6JaGuUJeraUMZa8wa3hAYyDVN2Mp1wzX/a62N8v/6kEhBfEQCvYxAFKr
         dZDGUOFHE30LgIRepwxddS/gguWMAhPfERfHHq2MbG80EU0zYIZMSXC7nIdwNCEGupzO
         JFFl+EQvQFk22yf3X0vwPifcUZ2dI2Fn8yDSBJ6f3NuTuVr7uTpyyTUHDwBKYuDPxKlO
         S3EjMvAAwhiqHJHvryseR4Q50D+zuOr85mVzjaf1I4S4ZwKA2QT8P7GzOSf1wSEAg8j4
         vZIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=Zn7jb2leDq7s98yEfNI6lTrtVVGbRWJlROFFZ8TfQyg=;
        fh=+Yl4wO5gHNT0cHtIiXjzh8GsFlL8ZqcQsI1Ac//KdGc=;
        b=MOJHf426gLScdxL4HIN4gTbJhu96zR+QOTDzhjQY+LS/QvxiM3YWtI046oW1hOnJzu
         CDEX7a/3nCPyGqCVN3n3qahn78CGWEa//PqjnVdfnZXFAIn8Fji9pfnCx4Lj70S4yi9C
         DvoizsEoX9MXf7eZUafQUJM4QX7F+HR4J2RIEttTZWIbgQ3hG5XPjAd459yE6CxIj7Eg
         T9hrdEm7qk8HXGD4ILY9gBriBexzcXDSey2JLsRFE5Si8aNL6D0KbkSZxOif8ZIJ++1N
         7Pam+m7ftL4KXrWqtEYXpdFVi/3T2UMhoiSWq3QKYwVWuWSBdps+gysEmd2wHJ+kI0Kf
         305Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=jsgcDvqJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w26-20020a05620a0e9a00b0077f5b410cdesi12158893qkm.756.2023.12.14.02.49.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Dec 2023 02:49:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=jsgcDvqJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rDjHU-0002RX-T6; Thu, 14 Dec 2023 05:49:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <n.ostrenkov@gmail.com>)
 id 1rDjHT-0002RN-7r
 for qemu-arm@nongnu.org; Thu, 14 Dec 2023 05:49:27 -0500
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <n.ostrenkov@gmail.com>)
 id 1rDjHR-0007uP-8J
 for qemu-arm@nongnu.org; Thu, 14 Dec 2023 05:49:27 -0500
Received: by mail-yb1-xb30.google.com with SMTP id
 3f1490d57ef6-dbc72b692adso4594876276.2
 for <qemu-arm@nongnu.org>; Thu, 14 Dec 2023 02:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702550963; x=1703155763; darn=nongnu.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=Zn7jb2leDq7s98yEfNI6lTrtVVGbRWJlROFFZ8TfQyg=;
 b=jsgcDvqJOEvsHyrV+9Wp11H7/XRHbQC2rFUcsxxztpLXeD2gXptumbY/GZIVn+wVkA
 1ou9O4YZpQramq3EJxtmR8f5lMp5ZXN2Dpl9GMZAtbaKeAPWsPC5t4t2f5JfJW2q1Rbx
 94Z82sblpTwZV5+TdKHhADI/3N7pn8ALRPCp/YR6kU6aD+5VRaf6vIVTig/Uyl7b2sWK
 hPcI0QFkA3aPW7Vg0e6bc/KH+pukWP9ISdvumVXW3Pw+STKVPMCpVAI4AXItgBtJf1iD
 BzxQ3YZKSHj4cpt+wxxo4Xh8zBFAKMKv2dKXVfB5JAK/93x7wibaHV3xRu+GWwrBpWK0
 tdyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702550963; x=1703155763;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Zn7jb2leDq7s98yEfNI6lTrtVVGbRWJlROFFZ8TfQyg=;
 b=Eqj2QK4a8rq7QZDrdiwTQ2RofTfV189hMWBszLFUWps6v+D1UbNU1Dv2SbHgYtcgiG
 FVk/spqKaRibexIUEa5WiGEVUtnXqNkOgFv3J/gZkPeLS4UyIc+QmS1osU0L0BODrOa/
 LhNCZgveql1IeGW8dfmyIoOhptnkkDvBeBwf9+AFkUtQrYBdAAjff/d/ykd8oxmRvPjC
 pvXLA4fv/IDHngHNIg4lITNdpRKmv4c08WvggySWAYzUsdTOJjnpH6PemsQg1JJ8qvfR
 KS9Zw+jclm90H6YALWwpD+z8pICe9X4GedZNcePFE1gmo50b52uwi6A30JWpLz8q2z3P
 QlnQ==
X-Gm-Message-State: AOJu0Ywj82+sIwCfmh48OJjjstb+0C7pXW0DNsun5fueoasTdbJVxc4P
 k6vf9juAysGLm+nQp9CVkgauZL8whpeQe5X1tPtMxKK0fwGi8D/jEn4mXF0T
X-Received: by 2002:a25:ade0:0:b0:dbc:da55:b37d with SMTP id
 d32-20020a25ade0000000b00dbcda55b37dmr1220787ybe.121.1702550963467; Thu, 14
 Dec 2023 02:49:23 -0800 (PST)
MIME-Version: 1.0
From: Nikita Ostrenkov <n.ostrenkov@gmail.com>
Date: Thu, 14 Dec 2023 13:49:12 +0300
Message-ID: <CAC8KSA2v9+yabrkxL1BNdPZQU8jVwh-a0J1+tERWzACcxJV+QQ@mail.gmail.com>
Subject: [PATCH v3] fsl-imx: add simple RTC emulation for i.MX6 and i.MX7
 boards
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000063c16a060c7609be"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=n.ostrenkov@gmail.com; helo=mail-yb1-xb30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: U4mwZy0vyyxz

--00000000000063c16a060c7609be
Content-Type: text/plain; charset="UTF-8"

Signed-off-by: Nikita Ostrenkov <n.ostrenkov@gmail.com>
---
 hw/misc/imx7_snvs.c         | 91 ++++++++++++++++++++++++++++++++++---
 hw/misc/trace-events        |  4 +-
 include/hw/misc/imx7_snvs.h |  7 ++-
 3 files changed, 92 insertions(+), 10 deletions(-)

diff --git a/hw/misc/imx7_snvs.c b/hw/misc/imx7_snvs.c
index a245f96cd4..7769c39499 100644
--- a/hw/misc/imx7_snvs.c
+++ b/hw/misc/imx7_snvs.c
@@ -13,28 +13,98 @@
  */

 #include "qemu/osdep.h"
+#include "qemu/bitops.h"
+#include "qemu/timer.h"
+#include "migration/vmstate.h"
 #include "hw/misc/imx7_snvs.h"
 #include "qemu/module.h"
+#include "sysemu/sysemu.h"
 #include "sysemu/runstate.h"
 #include "trace.h"

+#define RTC_FREQ    32768ULL
+
+static const VMStateDescription vmstate_imx7_snvs = {
+    .name = TYPE_IMX7_SNVS,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT64(tick_offset, IMX7SNVSState),
+        VMSTATE_UINT64(lpcr, IMX7SNVSState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static uint64_t imx7_snvs_get_count(IMX7SNVSState *s)
+{
+    int64_t ticks = muldiv64(qemu_clock_get_ns(rtc_clock), RTC_FREQ,
+                             NANOSECONDS_PER_SECOND);
+    return s->tick_offset + ticks;
+}
+
 static uint64_t imx7_snvs_read(void *opaque, hwaddr offset, unsigned size)
 {
-    trace_imx7_snvs_read(offset, 0);
+    IMX7SNVSState *s = IMX7_SNVS(opaque);
+    uint64_t ret = 0;
+
+    switch (offset) {
+    case SNVS_LPSRTCMR:
+        ret = extract64(imx7_snvs_get_count(s), 32, 15);
+        break;
+    case SNVS_LPSRTCLR:
+        ret = extract64(imx7_snvs_get_count(s), 0, 32);
+        break;
+    case SNVS_LPCR:
+        ret = s->lpcr;
+        break;
+    }

-    return 0;
+    trace_imx7_snvs_read(offset, ret, size);
+
+    return ret;
+}
+
+static void imx7_snvs_reset(DeviceState *dev)
+{
+    IMX7SNVSState *s = IMX7_SNVS(dev);
+
+    s->lpcr = 0;
 }

 static void imx7_snvs_write(void *opaque, hwaddr offset,
                             uint64_t v, unsigned size)
 {
-    const uint32_t value = v;
-    const uint32_t mask  = SNVS_LPCR_TOP | SNVS_LPCR_DP_EN;
+    trace_imx7_snvs_write(offset, v, size);
+
+    IMX7SNVSState *s = IMX7_SNVS(opaque);

-    trace_imx7_snvs_write(offset, value);
+    uint64_t new_value = 0, snvs_count = 0;

-    if (offset == SNVS_LPCR && ((value & mask) == mask)) {
-        qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
+    if (offset == SNVS_LPSRTCMR || offset == SNVS_LPSRTCLR) {
+        snvs_count = imx7_snvs_get_count(s);
+    }
+
+    switch (offset) {
+    case SNVS_LPSRTCMR:
+        new_value = deposit64(snvs_count, 32, 32, v);
+        break;
+    case SNVS_LPSRTCLR:
+        new_value = deposit64(snvs_count, 0, 32, v);
+        break;
+    case SNVS_LPCR: {
+        s->lpcr = v;
+
+        const uint32_t mask  = SNVS_LPCR_TOP | SNVS_LPCR_DP_EN;
+
+        if ((v & mask) == mask) {
+            qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
+        }
+        break;
+    }
+    }
+
+    if (offset == SNVS_LPSRTCMR || offset == SNVS_LPSRTCLR) {
+        s->tick_offset += new_value - snvs_count;
     }
 }

@@ -59,17 +129,24 @@ static void imx7_snvs_init(Object *obj)
 {
     SysBusDevice *sd = SYS_BUS_DEVICE(obj);
     IMX7SNVSState *s = IMX7_SNVS(obj);
+    struct tm tm;

     memory_region_init_io(&s->mmio, obj, &imx7_snvs_ops, s,
                           TYPE_IMX7_SNVS, 0x1000);

     sysbus_init_mmio(sd, &s->mmio);
+
+    qemu_get_timedate(&tm, 0);
+    s->tick_offset = mktimegm(&tm) -
+        qemu_clock_get_ns(rtc_clock) / NANOSECONDS_PER_SECOND;
 }

 static void imx7_snvs_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);

+    dc->reset = imx7_snvs_reset;
+    dc->vmsd = &vmstate_imx7_snvs;
     dc->desc  = "i.MX7 Secure Non-Volatile Storage Module";
 }

diff --git a/hw/misc/trace-events b/hw/misc/trace-events
index 05ff692441..85725506bf 100644
--- a/hw/misc/trace-events
+++ b/hw/misc/trace-events
@@ -116,8 +116,8 @@ imx7_gpr_read(uint64_t offset) "addr 0x%08" PRIx64
 imx7_gpr_write(uint64_t offset, uint64_t value) "addr 0x%08" PRIx64 "value
0x%08" PRIx64

 # imx7_snvs.c
-imx7_snvs_read(uint64_t offset, uint32_t value) "addr 0x%08" PRIx64 "value
0x%08" PRIx32
-imx7_snvs_write(uint64_t offset, uint32_t value) "addr 0x%08" PRIx64
"value 0x%08" PRIx32
+imx7_snvs_read(uint64_t offset, uint64_t value, unsigned size) "i.MX SNVS
read: offset 0x%08" PRIx64 " value 0x%08" PRIx64 " size %u"
+imx7_snvs_write(uint64_t offset, uint64_t value, unsigned size) "i.MX SNVS
write: offset 0x%08" PRIx64 " value 0x%08" PRIx64 " size %u"

 # mos6522.c
 mos6522_set_counter(int index, unsigned int val) "T%d.counter=%d"
diff --git a/include/hw/misc/imx7_snvs.h b/include/hw/misc/imx7_snvs.h
index 14a1d6fe6b..1272076086 100644
--- a/include/hw/misc/imx7_snvs.h
+++ b/include/hw/misc/imx7_snvs.h
@@ -20,7 +20,9 @@
 enum IMX7SNVSRegisters {
     SNVS_LPCR = 0x38,
     SNVS_LPCR_TOP   = BIT(6),
-    SNVS_LPCR_DP_EN = BIT(5)
+    SNVS_LPCR_DP_EN = BIT(5),
+    SNVS_LPSRTCMR = 0x050, /* Secure Real Time Counter MSB Register */
+    SNVS_LPSRTCLR = 0x054, /* Secure Real Time Counter LSB Register */
 };

 #define TYPE_IMX7_SNVS "imx7.snvs"
@@ -31,6 +33,9 @@ struct IMX7SNVSState {
     SysBusDevice parent_obj;

     MemoryRegion mmio;
+
+    uint64_t tick_offset;
+    uint64_t lpcr;
 };

 #endif /* IMX7_SNVS_H */
-- 
2.34.1

--00000000000063c16a060c7609be
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Signed-off-by: Nikita Ostrenkov &lt;<a href=3D"mailto:n.os=
trenkov@gmail.com">n.ostrenkov@gmail.com</a>&gt;<br>---<br>=C2=A0hw/misc/im=
x7_snvs.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 91 ++++++++++++++++++++++++++++++++=
++---<br>=C2=A0hw/misc/trace-events =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A04 +-=
<br>=C2=A0include/hw/misc/imx7_snvs.h | =C2=A07 ++-<br>=C2=A03 files change=
d, 92 insertions(+), 10 deletions(-)<br><br>diff --git a/hw/misc/imx7_snvs.=
c b/hw/misc/imx7_snvs.c<br>index a245f96cd4..7769c39499 100644<br>--- a/hw/=
misc/imx7_snvs.c<br>+++ b/hw/misc/imx7_snvs.c<br>@@ -13,28 +13,98 @@<br>=C2=
=A0 */<br>=C2=A0<br>=C2=A0#include &quot;qemu/osdep.h&quot;<br>+#include &q=
uot;qemu/bitops.h&quot;<br>+#include &quot;qemu/timer.h&quot;<br>+#include =
&quot;migration/vmstate.h&quot;<br>=C2=A0#include &quot;hw/misc/imx7_snvs.h=
&quot;<br>=C2=A0#include &quot;qemu/module.h&quot;<br>+#include &quot;sysem=
u/sysemu.h&quot;<br>=C2=A0#include &quot;sysemu/runstate.h&quot;<br>=C2=A0#=
include &quot;trace.h&quot;<br>=C2=A0<br>+#define RTC_FREQ =C2=A0 =C2=A0327=
68ULL<br>+<br>+static const VMStateDescription vmstate_imx7_snvs =3D {<br>+=
 =C2=A0 =C2=A0.name =3D TYPE_IMX7_SNVS,<br>+ =C2=A0 =C2=A0.version_id =3D 1=
,<br>+ =C2=A0 =C2=A0.minimum_version_id =3D 1,<br>+ =C2=A0 =C2=A0.fields =
=3D (VMStateField[]) {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINT64(tick_=
offset, IMX7SNVSState),<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_UINT64(lpcr=
, IMX7SNVSState),<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0VMSTATE_END_OF_LIST()<br>=
+ =C2=A0 =C2=A0}<br>+};<br>+<br>+static uint64_t imx7_snvs_get_count(IMX7SN=
VSState *s)<br>+{<br>+ =C2=A0 =C2=A0int64_t ticks =3D muldiv64(qemu_clock_g=
et_ns(rtc_clock), RTC_FREQ,<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 NANOSECONDS_PER_SEC=
OND);<br>+ =C2=A0 =C2=A0return s-&gt;tick_offset + ticks;<br>+}<br>+<br>=C2=
=A0static uint64_t imx7_snvs_read(void *opaque, hwaddr offset, unsigned siz=
e)<br>=C2=A0{<br>- =C2=A0 =C2=A0trace_imx7_snvs_read(offset, 0);<br>+ =C2=
=A0 =C2=A0IMX7SNVSState *s =3D IMX7_SNVS(opaque);<br>+ =C2=A0 =C2=A0uint64_=
t ret =3D 0;<br>+<br>+ =C2=A0 =C2=A0switch (offset) {<br>+ =C2=A0 =C2=A0cas=
e SNVS_LPSRTCMR:<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D extract64(imx7_snv=
s_get_count(s), 32, 15);<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>+ =C2=A0=
 =C2=A0case SNVS_LPSRTCLR:<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D extract6=
4(imx7_snvs_get_count(s), 0, 32);<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br=
>+ =C2=A0 =C2=A0case SNVS_LPCR:<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D s-&=
gt;lpcr;<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>+ =C2=A0 =C2=A0}<br>=C2=
=A0<br>- =C2=A0 =C2=A0return 0;<br>+ =C2=A0 =C2=A0trace_imx7_snvs_read(offs=
et, ret, size);<br>+<br>+ =C2=A0 =C2=A0return ret;<br>+}<br>+<br>+static vo=
id imx7_snvs_reset(DeviceState *dev)<br>+{<br>+ =C2=A0 =C2=A0IMX7SNVSState =
*s =3D IMX7_SNVS(dev);<br>+<br>+ =C2=A0 =C2=A0s-&gt;lpcr =3D 0;<br>=C2=A0}<=
br>=C2=A0<br>=C2=A0static void imx7_snvs_write(void *opaque, hwaddr offset,=
<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0uint64_t v, unsigned size)<br>=C2=A0{<br>=
- =C2=A0 =C2=A0const uint32_t value =3D v;<br>- =C2=A0 =C2=A0const uint32_t=
 mask =C2=A0=3D SNVS_LPCR_TOP | SNVS_LPCR_DP_EN;<br>+ =C2=A0 =C2=A0trace_im=
x7_snvs_write(offset, v, size);<br>+<br>+ =C2=A0 =C2=A0IMX7SNVSState *s =3D=
 IMX7_SNVS(opaque);<br>=C2=A0<br>- =C2=A0 =C2=A0trace_imx7_snvs_write(offse=
t, value);<br>+ =C2=A0 =C2=A0uint64_t new_value =3D 0, snvs_count =3D 0;<br=
>=C2=A0<br>- =C2=A0 =C2=A0if (offset =3D=3D SNVS_LPCR &amp;&amp; ((value &a=
mp; mask) =3D=3D mask)) {<br>- =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_system_shutd=
own_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);<br>+ =C2=A0 =C2=A0if (offset =
=3D=3D SNVS_LPSRTCMR || offset =3D=3D SNVS_LPSRTCLR) {<br>+ =C2=A0 =C2=A0 =
=C2=A0 =C2=A0snvs_count =3D imx7_snvs_get_count(s);<br>+ =C2=A0 =C2=A0}<br>=
+<br>+ =C2=A0 =C2=A0switch (offset) {<br>+ =C2=A0 =C2=A0case SNVS_LPSRTCMR:=
<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0new_value =3D deposit64(snvs_count, 32, 32=
, v);<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>+ =C2=A0 =C2=A0case SNVS_LP=
SRTCLR:<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0new_value =3D deposit64(snvs_count,=
 0, 32, v);<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>+ =C2=A0 =C2=A0case S=
NVS_LPCR: {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;lpcr =3D v;<br>+<br>+ =C2=
=A0 =C2=A0 =C2=A0 =C2=A0const uint32_t mask =C2=A0=3D SNVS_LPCR_TOP | SNVS_=
LPCR_DP_EN;<br>+<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0if ((v &amp; mask) =3D=3D =
mask) {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0qemu_system_shutdown_=
request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0}<b=
r>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0break;<br>+ =C2=A0 =C2=A0}<br>+ =C2=A0 =C2=
=A0}<br>+<br>+ =C2=A0 =C2=A0if (offset =3D=3D SNVS_LPSRTCMR || offset =3D=
=3D SNVS_LPSRTCLR) {<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0s-&gt;tick_offset +=3D=
 new_value - snvs_count;<br>=C2=A0 =C2=A0 =C2=A0}<br>=C2=A0}<br>=C2=A0<br>@=
@ -59,17 +129,24 @@ static void imx7_snvs_init(Object *obj)<br>=C2=A0{<br>=
=C2=A0 =C2=A0 =C2=A0SysBusDevice *sd =3D SYS_BUS_DEVICE(obj);<br>=C2=A0 =C2=
=A0 =C2=A0IMX7SNVSState *s =3D IMX7_SNVS(obj);<br>+ =C2=A0 =C2=A0struct tm =
tm;<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0memory_region_init_io(&amp;s-&gt;mmio,=
 obj, &amp;imx7_snvs_ops, s,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0TYPE_IMX7_SNVS, 0x10=
00);<br>=C2=A0<br>=C2=A0 =C2=A0 =C2=A0sysbus_init_mmio(sd, &amp;s-&gt;mmio)=
;<br>+<br>+ =C2=A0 =C2=A0qemu_get_timedate(&amp;tm, 0);<br>+ =C2=A0 =C2=A0s=
-&gt;tick_offset =3D mktimegm(&amp;tm) -<br>+ =C2=A0 =C2=A0 =C2=A0 =C2=A0qe=
mu_clock_get_ns(rtc_clock) / NANOSECONDS_PER_SECOND;<br>=C2=A0}<br>=C2=A0<b=
r>=C2=A0static void imx7_snvs_class_init(ObjectClass *klass, void *data)<br=
>=C2=A0{<br>=C2=A0 =C2=A0 =C2=A0DeviceClass *dc =3D DEVICE_CLASS(klass);<br=
>=C2=A0<br>+ =C2=A0 =C2=A0dc-&gt;reset =3D imx7_snvs_reset;<br>+ =C2=A0 =C2=
=A0dc-&gt;vmsd =3D &amp;vmstate_imx7_snvs;<br>=C2=A0 =C2=A0 =C2=A0dc-&gt;de=
sc =C2=A0=3D &quot;i.MX7 Secure Non-Volatile Storage Module&quot;;<br>=C2=
=A0}<br>=C2=A0<br>diff --git a/hw/misc/trace-events b/hw/misc/trace-events<=
br>index 05ff692441..85725506bf 100644<br>--- a/hw/misc/trace-events<br>+++=
 b/hw/misc/trace-events<br>@@ -116,8 +116,8 @@ imx7_gpr_read(uint64_t offse=
t) &quot;addr 0x%08&quot; PRIx64<br>=C2=A0imx7_gpr_write(uint64_t offset, u=
int64_t value) &quot;addr 0x%08&quot; PRIx64 &quot;value 0x%08&quot; PRIx64=
<br>=C2=A0<br>=C2=A0# imx7_snvs.c<br>-imx7_snvs_read(uint64_t offset, uint3=
2_t value) &quot;addr 0x%08&quot; PRIx64 &quot;value 0x%08&quot; PRIx32<br>=
-imx7_snvs_write(uint64_t offset, uint32_t value) &quot;addr 0x%08&quot; PR=
Ix64 &quot;value 0x%08&quot; PRIx32<br>+imx7_snvs_read(uint64_t offset, uin=
t64_t value, unsigned size) &quot;i.MX SNVS read: offset 0x%08&quot; PRIx64=
 &quot; value 0x%08&quot; PRIx64 &quot; size %u&quot;<br>+imx7_snvs_write(u=
int64_t offset, uint64_t value, unsigned size) &quot;i.MX SNVS write: offse=
t 0x%08&quot; PRIx64 &quot; value 0x%08&quot; PRIx64 &quot; size %u&quot;<b=
r>=C2=A0<br>=C2=A0# mos6522.c<br>=C2=A0mos6522_set_counter(int index, unsig=
ned int val) &quot;T%d.counter=3D%d&quot;<br>diff --git a/include/hw/misc/i=
mx7_snvs.h b/include/hw/misc/imx7_snvs.h<br>index 14a1d6fe6b..1272076086 10=
0644<br>--- a/include/hw/misc/imx7_snvs.h<br>+++ b/include/hw/misc/imx7_snv=
s.h<br>@@ -20,7 +20,9 @@<br>=C2=A0enum IMX7SNVSRegisters {<br>=C2=A0 =C2=A0=
 =C2=A0SNVS_LPCR =3D 0x38,<br>=C2=A0 =C2=A0 =C2=A0SNVS_LPCR_TOP =C2=A0 =3D =
BIT(6),<br>- =C2=A0 =C2=A0SNVS_LPCR_DP_EN =3D BIT(5)<br>+ =C2=A0 =C2=A0SNVS=
_LPCR_DP_EN =3D BIT(5),<br>+ =C2=A0 =C2=A0SNVS_LPSRTCMR =3D 0x050, /* Secur=
e Real Time Counter MSB Register */<br>+ =C2=A0 =C2=A0SNVS_LPSRTCLR =3D 0x0=
54, /* Secure Real Time Counter LSB Register */<br>=C2=A0};<br>=C2=A0<br>=
=C2=A0#define TYPE_IMX7_SNVS &quot;imx7.snvs&quot;<br>@@ -31,6 +33,9 @@ str=
uct IMX7SNVSState {<br>=C2=A0 =C2=A0 =C2=A0SysBusDevice parent_obj;<br>=C2=
=A0<br>=C2=A0 =C2=A0 =C2=A0MemoryRegion mmio;<br>+<br>+ =C2=A0 =C2=A0uint64=
_t tick_offset;<br>+ =C2=A0 =C2=A0uint64_t lpcr;<br>=C2=A0};<br>=C2=A0<br>=
=C2=A0#endif /* IMX7_SNVS_H */<br>-- <br>2.34.1<br></div>

--00000000000063c16a060c7609be--
