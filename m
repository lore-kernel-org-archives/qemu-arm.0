Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp3247166wru;
        Mon, 13 Aug 2018 12:11:28 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPwWLFKS/gnQyeEfOoJbzX3ENZwzhGMTDuRko60Pdufh8QuWyY62aBLH/FwTID5h3BiCjPM9
X-Received: by 2002:ac8:177b:: with SMTP id u56-v6mr17896291qtk.31.1534187488583;
        Mon, 13 Aug 2018 12:11:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534187488; cv=none;
        d=google.com; s=arc-20160816;
        b=KX5iVJBrlBmh5WZq4xp4zYFMg06ZUqWdBP35fp48vmpU+UFGyrlJZyiPrrLDZjv4Kd
         WMAYTa1QfzfdZZzhaGhClb0ssnjoJpvstmcc2fKvrEaSsEVjBlh1Z+W8HGIqw55f6Qws
         jeiAcXQsoLu95VIvS4Y6MLa21uvCGD3BmHLXFaQALktGyE3dnz80Xe/ZWaH2OfvJw0SY
         2sU0oPxAqx/g5VXNt5r+fk2WFpraaq8/Lv3yuGEVQwQLd+1af9NrrK3NjZqdeAu8zcp+
         Sh3UD2whMqg3HfCr5CciqQnF0LgW0L4VsqhsBz3D0+8ykvqUt+xlTjm1fJWb+cm/NyiF
         eELw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:arc-authentication-results;
        bh=AN0Qflxu6Xna5D6aO4Qfwzri5RLFGMZLpxuLU9bCCiY=;
        b=ad+WkG9TOpFYXYMAB14fUdVJxaTpcxbtfA69GbTvAxaChexULBS356f5YYHTKf6pHX
         Vo934BUB8/0FcZYOjZD3O16yCRocWYNXfNOb9QQABPczd/CoQsSvuMPrfQLex3jigj1/
         rHaTe8maDY3gs/pdofUxmlARTt7XGH23DaqX6RuPASfyduXBeKw6CU4Upca0Q1REGCAf
         FSgZ/Pudmi1RgX1SUoo466BMNvFI6K+FITe9ImeLks0GZ2ktUmPBVm34oCMcLrj+oiIH
         AxqcT3CDxtBcPv495/EOSV/xyRSHDBTM9+c9ZjqpZUJdQYFlWUuqRHrHBiCFeGFCueP/
         AjVw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m24-v6si4814068qkl.241.2018.08.13.12.11.28
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Aug 2018 12:11:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41133 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fpIFU-00085U-2K
	for alex.bennee@linaro.org; Mon, 13 Aug 2018 15:11:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45150)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1fpHsl-0001s7-P4
	for qemu-arm@nongnu.org; Mon, 13 Aug 2018 14:48:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1fpHsk-0003ya-7e
	for qemu-arm@nongnu.org; Mon, 13 Aug 2018 14:47:59 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:41386 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1fpHsk-0003yU-1J; Mon, 13 Aug 2018 14:47:58 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5833840241C0;
	Mon, 13 Aug 2018 18:47:57 +0000 (UTC)
Received: from localhost (ovpn-116-31.ams2.redhat.com [10.36.116.31])
	by smtp.corp.redhat.com (Postfix) with ESMTP id DCD7320389E0;
	Mon, 13 Aug 2018 18:47:56 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: <qemu-devel@nongnu.org>
Date: Mon, 13 Aug 2018 19:46:19 +0100
Message-Id: <20180813184624.12071-2-stefanha@redhat.com>
In-Reply-To: <20180813184624.12071-1-stefanha@redhat.com>
References: <20180813184624.12071-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Mon, 13 Aug 2018 18:47:57 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Mon, 13 Aug 2018 18:47:57 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'stefanha@redhat.com' RCPT:''
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v5 1/6] hw/arm: make bitbanded IO optional on
 ARMv7-M
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
Cc: Peter Maydell <peter.maydell@linaro.org>, jim@groklearning.com,
	mail@steffen-goertz.de, Su Hang <suhang16@mails.ucas.ac.cn>,
	ilg@livius.net, Alistair Francis <alistair@alistair23.me>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Steffen Gortz <qemu.ml@steffen-goertz.de>, qemu-arm@nongnu.org,
	joel@jms.id.au, Stefan Hajnoczi <stefanha@redhat.com>, jusual@mail.ru
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: A7CIglkG2ur0

Some ARM CPUs have bitbanded IO, a memory region that allows convenient
bit access via 32-bit memory loads/stores.  This eliminates the need for
read-modify-update instruction sequences.

This patch makes this optional feature an ARMv7MState qdev property,
allowing boards to choose whether they want bitbanding or not.

Status of boards:
 * iotkit (Cortex M33), no bitband
 * mps2 (Cortex M3), bitband
 * msf2 (Cortex M3), bitband
 * stellaris (Cortex M3), bitband
 * stm32f205 (Cortex M3), bitband

As a side-effect of this patch, Peter Maydell noted that the Ethernet
controller on mps2 board is now accessible.  Previously they were hidden
by the bitband region (which does not exist on the real board).

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
---
 include/hw/arm/armv7m.h |  2 ++
 hw/arm/armv7m.c         | 37 ++++++++++++++++++++-----------------
 hw/arm/mps2.c           |  1 +
 hw/arm/msf2-soc.c       |  1 +
 hw/arm/stellaris.c      |  1 +
 hw/arm/stm32f205_soc.c  |  1 +
 6 files changed, 26 insertions(+), 17 deletions(-)

diff --git a/include/hw/arm/armv7m.h b/include/hw/arm/armv7m.h
index 78308d1484..2ba24953b6 100644
--- a/include/hw/arm/armv7m.h
+++ b/include/hw/arm/armv7m.h
@@ -43,6 +43,7 @@ typedef struct {
  *   devices will be automatically layered on top of this view.)
  * + Property "idau": IDAU interface (forwarded to CPU object)
  * + Property "init-svtor": secure VTOR reset value (forwarded to CPU ob=
ject)
+ * + Property "enable-bitband": expose bitbanded IO
  */
 typedef struct ARMv7MState {
     /*< private >*/
@@ -63,6 +64,7 @@ typedef struct ARMv7MState {
     MemoryRegion *board_memory;
     Object *idau;
     uint32_t init_svtor;
+    bool enable_bitband;
 } ARMv7MState;
=20
 #endif
diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
index 6b07666057..878613994d 100644
--- a/hw/arm/armv7m.c
+++ b/hw/arm/armv7m.c
@@ -211,25 +211,27 @@ static void armv7m_realize(DeviceState *dev, Error =
**errp)
     memory_region_add_subregion(&s->container, 0xe000e000,
                                 sysbus_mmio_get_region(sbd, 0));
=20
-    for (i =3D 0; i < ARRAY_SIZE(s->bitband); i++) {
-        Object *obj =3D OBJECT(&s->bitband[i]);
-        SysBusDevice *sbd =3D SYS_BUS_DEVICE(&s->bitband[i]);
+    if (s->enable_bitband) {
+        for (i =3D 0; i < ARRAY_SIZE(s->bitband); i++) {
+            Object *obj =3D OBJECT(&s->bitband[i]);
+            SysBusDevice *sbd =3D SYS_BUS_DEVICE(&s->bitband[i]);
=20
-        object_property_set_int(obj, bitband_input_addr[i], "base", &err=
);
-        if (err !=3D NULL) {
-            error_propagate(errp, err);
-            return;
-        }
-        object_property_set_link(obj, OBJECT(s->board_memory),
-                                 "source-memory", &error_abort);
-        object_property_set_bool(obj, true, "realized", &err);
-        if (err !=3D NULL) {
-            error_propagate(errp, err);
-            return;
-        }
+            object_property_set_int(obj, bitband_input_addr[i], "base", =
&err);
+            if (err !=3D NULL) {
+                error_propagate(errp, err);
+                return;
+            }
+            object_property_set_link(obj, OBJECT(s->board_memory),
+                                     "source-memory", &error_abort);
+            object_property_set_bool(obj, true, "realized", &err);
+            if (err !=3D NULL) {
+                error_propagate(errp, err);
+                return;
+            }
=20
-        memory_region_add_subregion(&s->container, bitband_output_addr[i=
],
-                                    sysbus_mmio_get_region(sbd, 0));
+            memory_region_add_subregion(&s->container, bitband_output_ad=
dr[i],
+                                        sysbus_mmio_get_region(sbd, 0));
+        }
     }
 }
=20
@@ -239,6 +241,7 @@ static Property armv7m_properties[] =3D {
                      MemoryRegion *),
     DEFINE_PROP_LINK("idau", ARMv7MState, idau, TYPE_IDAU_INTERFACE, Obj=
ect *),
     DEFINE_PROP_UINT32("init-svtor", ARMv7MState, init_svtor, 0),
+    DEFINE_PROP_BOOL("enable-bitband", ARMv7MState, enable_bitband, fals=
e),
     DEFINE_PROP_END_OF_LIST(),
 };
=20
diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
index c3946da317..0a0ae867d9 100644
--- a/hw/arm/mps2.c
+++ b/hw/arm/mps2.c
@@ -186,6 +186,7 @@ static void mps2_common_init(MachineState *machine)
         g_assert_not_reached();
     }
     qdev_prop_set_string(armv7m, "cpu-type", machine->cpu_type);
+    qdev_prop_set_bit(armv7m, "enable-bitband", true);
     object_property_set_link(OBJECT(&mms->armv7m), OBJECT(system_memory)=
,
                              "memory", &error_abort);
     object_property_set_bool(OBJECT(&mms->armv7m), true, "realized",
diff --git a/hw/arm/msf2-soc.c b/hw/arm/msf2-soc.c
index dbefade644..2702e90b45 100644
--- a/hw/arm/msf2-soc.c
+++ b/hw/arm/msf2-soc.c
@@ -117,6 +117,7 @@ static void m2sxxx_soc_realize(DeviceState *dev_soc, =
Error **errp)
     armv7m =3D DEVICE(&s->armv7m);
     qdev_prop_set_uint32(armv7m, "num-irq", 81);
     qdev_prop_set_string(armv7m, "cpu-type", s->cpu_type);
+    qdev_prop_set_bit(armv7m, "enable-bitband", true);
     object_property_set_link(OBJECT(&s->armv7m), OBJECT(get_system_memor=
y()),
                                      "memory", &error_abort);
     object_property_set_bool(OBJECT(&s->armv7m), true, "realized", &err)=
;
diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index dc521b4a5a..6c69ce79b2 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -1304,6 +1304,7 @@ static void stellaris_init(MachineState *ms, stella=
ris_board_info *board)
     nvic =3D qdev_create(NULL, TYPE_ARMV7M);
     qdev_prop_set_uint32(nvic, "num-irq", NUM_IRQ_LINES);
     qdev_prop_set_string(nvic, "cpu-type", ms->cpu_type);
+    qdev_prop_set_bit(nvic, "enable-bitband", true);
     object_property_set_link(OBJECT(nvic), OBJECT(get_system_memory()),
                                      "memory", &error_abort);
     /* This will exit with an error if the user passed us a bad cpu_type=
 */
diff --git a/hw/arm/stm32f205_soc.c b/hw/arm/stm32f205_soc.c
index c486d06a8b..980e5af13c 100644
--- a/hw/arm/stm32f205_soc.c
+++ b/hw/arm/stm32f205_soc.c
@@ -109,6 +109,7 @@ static void stm32f205_soc_realize(DeviceState *dev_so=
c, Error **errp)
     armv7m =3D DEVICE(&s->armv7m);
     qdev_prop_set_uint32(armv7m, "num-irq", 96);
     qdev_prop_set_string(armv7m, "cpu-type", s->cpu_type);
+    qdev_prop_set_bit(armv7m, "enable-bitband", true);
     object_property_set_link(OBJECT(&s->armv7m), OBJECT(get_system_memor=
y()),
                                      "memory", &error_abort);
     object_property_set_bool(OBJECT(&s->armv7m), true, "realized", &err)=
;
--=20
2.17.1

