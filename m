Received: by 10.25.0.144 with SMTP id 138csp1122190lfa;
        Sun, 16 Apr 2017 20:59:41 -0700 (PDT)
X-Received: by 10.55.221.8 with SMTP id n8mr8111451qki.76.1492401581650;
        Sun, 16 Apr 2017 20:59:41 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k4si9683005qte.234.2017.04.16.20.59.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 16 Apr 2017 20:59:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:34720 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1czxpF-0004eX-6u
	for alex.bennee@linaro.org; Sun, 16 Apr 2017 23:59:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57527)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1czxpA-0004eQ-Qb
	for qemu-arm@nongnu.org; Sun, 16 Apr 2017 23:59:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1czxp8-0002jz-LS
	for qemu-arm@nongnu.org; Sun, 16 Apr 2017 23:59:36 -0400
Received: from mail-io0-x243.google.com ([2607:f8b0:4001:c06::243]:35160)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1czxp8-0002jn-Bs; Sun, 16 Apr 2017 23:59:34 -0400
Received: by mail-io0-x243.google.com with SMTP id d203so22407939iof.2;
	Sun, 16 Apr 2017 20:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=Z/WDADX1Kv+zby6IEh+Zc6lAJBJiOxR3/UdQuUezLtA=;
	b=a/CPNDV7V11Lt5hr9tguZ8oostcoDNd0hTeRwlkocNmnX0A0Xp+UsC0BGa+IWf599n
	/lYjwCYgjO+8zMvgvrjG8fu/8HMaOWiss22pAcFIwLK8CMOAugL6+RXicAv9eALaGVWi
	OlPNmQwaNN+upJo/5syxflJ3JzJ5+1GQYfQ0VbYiedAbuZI+B4iDw7pjI1gVhGJqBcwx
	uDQ87zHWmPFIE6WgUYJ3ewDs5EYG0UozzznV9muXUuO4zfC+x96gnA5YRXq4vaa2LB3c
	vlnj260jAU+utkdFsFHaMD8vgrpsr0VTswhfHC6kLXcOnc+qOUvdeFogzysKlrQpc0La
	i7lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=Z/WDADX1Kv+zby6IEh+Zc6lAJBJiOxR3/UdQuUezLtA=;
	b=LdkthAM2/TLBkJHtCDso52iPBcXKxOh5ZmtTyGM27pqhcvf/EdrHsMpKBpIB34s52o
	txoVyoc0btKNdtFTURQOEhKXkp+ZkprvGMDUluEFPfwsP81i7ckgf6SLKqOKNfCB05bg
	YvEBjG2ZDftDPyzd7X6kgWc9c47hFvvSK2fOfUHDK+28/dtyLWn+wa+lWJR8fDprKXC9
	+maGUAzv6zEgzdejLeELewfzfumCPEyu5cuKYbCjG9RHO4L0RQAcSTwOvxHj7/07TITP
	xFFQAgVKY2Fpa1pOmBcH/HMGYOizeCrwnh24EpW89jBIIegtLEFgnkR9sctyYQm3t1lH
	tYSw==
X-Gm-Message-State: AN3rC/7WchJXh4dUWlPYTwGFk0hBp2wMKJb87ufE4Qqx3hZZBDtUJmT9
	iuTdsxH2aAE+KPQJNrrfh6JqxLioDw==
X-Received: by 10.107.156.8 with SMTP id f8mr937287ioe.9.1492401573555; Sun,
	16 Apr 2017 20:59:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.37.77 with HTTP; Sun, 16 Apr 2017 20:59:33 -0700 (PDT)
In-Reply-To: <1487604965-23220-4-git-send-email-peter.maydell@linaro.org>
References: <1487604965-23220-1-git-send-email-peter.maydell@linaro.org>
	<1487604965-23220-4-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Mon, 17 Apr 2017 00:59:33 -0300
X-Google-Sender-Auth: re41x2ZhGvKD6SKIUfJVcOzgfqw
Message-ID: <CAAdtpL43f=RFUJJ+pOXLUaGpx=Vg=Wy3gML9=EWpCGBAu80nww@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary=001a1140fb2ca796c5054d54d13b
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c06::243
Subject: Re: [Qemu-arm] [PATCH 03/11] armv7m: QOMify the armv7m container
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
Cc: Alistair Francis <alistair23@gmail.com>,
	Michael Davidsaver <mdavidsaver@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3OLwKxYjKxk1

--001a1140fb2ca796c5054d54d13b
Content-Type: text/plain; charset=UTF-8

Hi Peter,



On Mon, Feb 20, 2017 at 12:35 PM, Peter Maydell <peter.maydell@linaro.org>
wrote:

> Create a proper QOM object for the armv7m container, which
> holds the CPU, the NVIC and the bitband regions.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/arm/armv7m.h |  51 ++++++++++++++++++
>  hw/arm/armv7m.c         | 140 ++++++++++++++++++++++++++++++
> +++++++++++++-----
>  2 files changed, 179 insertions(+), 12 deletions(-)
>  create mode 100644 include/hw/arm/armv7m.h
>
> diff --git a/include/hw/arm/armv7m.h b/include/hw/arm/armv7m.h
> new file mode 100644
> index 0000000..193ad71
> --- /dev/null
> +++ b/include/hw/arm/armv7m.h
> @@ -0,0 +1,51 @@
> +/*
> + * ARMv7M CPU object
> + *
> + * Copyright (c) 2017 Linaro Ltd
> + * Written by Peter Maydell <peter.maydell@linaro.org>
> + *
> + * This code is licensed under the GPL version 2 or later.
> + */
> +
> +#ifndef HW_ARM_ARMV7M_H
> +#define HW_ARM_ARMV7M_H
> +
> +#include "hw/sysbus.h"
> +#include "hw/arm/armv7m_nvic.h"
> +
> +#define TYPE_BITBAND "ARM,bitband-memory"
> +#define BITBAND(obj) OBJECT_CHECK(BitBandState, (obj), TYPE_BITBAND)
> +
> +typedef struct {
> +    /*< private >*/
> +    SysBusDevice parent_obj;
> +    /*< public >*/
> +
> +    MemoryRegion iomem;
> +    uint32_t base;
> +} BitBandState;
> +
> +#define TYPE_ARMV7M "armv7m"
> +#define ARMV7M(obj) OBJECT_CHECK(ARMv7MState, (obj), TYPE_ARMV7M)
> +
> +#define ARMV7M_NUM_BITBANDS 2
> +
> +/* ARMv7M container object.
> + * + Unnamed GPIO input lines: external IRQ lines for the NVIC
> + * + Named GPIO output SYSRESETREQ: signalled for guest AIRCR.SYSRESETREQ
> + * + Property "cpu-model": CPU model to instantiate
> + * + Property "num-irq": number of external IRQ lines
> + */
> +typedef struct ARMv7MState {
> +    /*< private >*/
> +    SysBusDevice parent_obj;
> +    /*< public >*/
> +    NVICState nvic;
> +    BitBandState bitband[ARMV7M_NUM_BITBANDS];
> +    ARMCPU *cpu;
> +
> +    /* Properties */
> +    char *cpu_model;
> +} ARMv7MState;
> +
> +#endif
> diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c
> index b2cc6e9..56d02d4 100644
> --- a/hw/arm/armv7m.c
> +++ b/hw/arm/armv7m.c
> @@ -8,6 +8,7 @@
>   */
>
>  #include "qemu/osdep.h"
> +#include "hw/arm/armv7m.h"
>  #include "qapi/error.h"
>  #include "qemu-common.h"
>  #include "cpu.h"
> @@ -120,18 +121,6 @@ static const MemoryRegionOps bitband_ops = {
>      .endianness = DEVICE_NATIVE_ENDIAN,
>  };
>
> -#define TYPE_BITBAND "ARM,bitband-memory"
> -#define BITBAND(obj) OBJECT_CHECK(BitBandState, (obj), TYPE_BITBAND)
> -
> -typedef struct {
> -    /*< private >*/
> -    SysBusDevice parent_obj;
> -    /*< public >*/
> -
> -    MemoryRegion iomem;
> -    uint32_t base;
> -} BitBandState;
> -
>  static void bitband_init(Object *obj)
>  {
>      BitBandState *s = BITBAND(obj);
> @@ -159,6 +148,132 @@ static void armv7m_bitband_init(void)
>
>  /* Board init.  */
>
> +static const hwaddr bitband_input_addr[ARMV7M_NUM_BITBANDS] = {
> +    0x20000000, 0x40000000
> +};
>

What do you think about adding a

#define ARMV7M_BITBAND_[REGION/IOMEM]_SIZE (1ULL << 25) or 0x2000000

and use it at least with memory_region_init_io() and eventually to get the
output base addr?


> +
> +static const hwaddr bitband_output_addr[ARMV7M_NUM_BITBANDS] = {
> +    0x22000000, 0x42000000
> +};
> +
> +static void armv7m_instance_init(Object *obj)
> +{
> +    ARMv7MState *s = ARMV7M(obj);
> +    int i;
> +
> +    /* Can't init the cpu here, we don't yet know which model to use */
> +
> +    object_initialize(&s->nvic, sizeof(s->nvic), "armv7m_nvic");
> +    qdev_set_parent_bus(DEVICE(&s->nvic), sysbus_get_default());
> +    object_property_add_alias(obj, "num-irq",
> +                              OBJECT(&s->nvic), "num-irq", &error_abort);
> +
> +    for (i = 0; i < ARRAY_SIZE(s->bitband); i++) {
> +        object_initialize(&s->bitband[i], sizeof(s->bitband[i]),
> TYPE_BITBAND);
> +        qdev_set_parent_bus(DEVICE(&s->bitband[i]),
> sysbus_get_default());
> +    }
> +}
> +
> +static void armv7m_realize(DeviceState *dev, Error **errp)
> +{
> +    /* here realize our children */
> +    ARMv7MState *s = ARMV7M(dev);
> +    Error *err = NULL;
> +    int i;
> +    char **cpustr;
> +    ObjectClass *oc;
> +    const char *typename;
> +    CPUClass *cc;
> +
> +    cpustr = g_strsplit(s->cpu_model, ",", 2);
> +
> +    oc = cpu_class_by_name(TYPE_ARM_CPU, cpustr[0]);
> +    if (!oc) {
> +        error_setg(errp, "Unknown CPU model %s", cpustr[0]);
> +        g_strfreev(cpustr);
> +        return;
> +    }
> +
> +    cc = CPU_CLASS(oc);
> +    typename = object_class_get_name(oc);
> +    cc->parse_features(typename, cpustr[1], &err);
> +    g_strfreev(cpustr);
> +    if (err) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +
> +    s->cpu = ARM_CPU(object_new(typename));
> +    if (!s->cpu) {
> +        error_setg(errp, "Unknown CPU model %s", s->cpu_model);
> +        return;
> +    }
> +
> +    object_property_set_bool(OBJECT(s->cpu), true, "realized", &err);
> +    if (err != NULL) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +
> +    /* Note that we must realize the NVIC after the CPU */
> +    object_property_set_bool(OBJECT(&s->nvic), true, "realized", &err);
> +    if (err != NULL) {
> +        error_propagate(errp, err);
> +        return;
> +    }
> +
> +    /* Alias the NVIC's input and output GPIOs as our own so the board
> +     * code can wire them up. (We do this in realize because the
> +     * NVIC doesn't create the input GPIO array until realize.)
> +     */
> +    qdev_pass_gpios(DEVICE(&s->nvic), dev, NULL);
> +    qdev_pass_gpios(DEVICE(&s->nvic), dev, "SYSRESETREQ");
> +
> +    /* Wire the NVIC up to the CPU */
> +    sysbus_connect_irq(SYS_BUS_DEVICE(&s->nvic), 0,
> +                       qdev_get_gpio_in(DEVICE(s->cpu), ARM_CPU_IRQ));
> +    s->cpu->env.nvic = &s->nvic;
> +
> +    for (i = 0; i < ARRAY_SIZE(s->bitband); i++) {
> +        Object *obj = OBJECT(&s->bitband[i]);
> +        SysBusDevice *sbd = SYS_BUS_DEVICE(&s->bitband[i]);
> +
> +        object_property_set_int(obj, bitband_input_addr[i], "base", &err);
> +        if (err != NULL) {
> +            error_propagate(errp, err);
> +            return;
> +        }
> +        object_property_set_bool(obj, true, "realized", &err);
> +        if (err != NULL) {
> +            error_propagate(errp, err);
> +            return;
> +        }
> +
> +        sysbus_mmio_map(sbd, 0, bitband_output_addr[i]);
> +    }
> +}
> +
> +static Property armv7m_properties[] = {
> +    DEFINE_PROP_STRING("cpu-model", ARMv7MState, cpu_model),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void armv7m_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->realize = armv7m_realize;
> +    dc->props = armv7m_properties;
> +}
> +
> +static const TypeInfo armv7m_info = {
> +    .name = TYPE_ARMV7M,
> +    .parent = TYPE_SYS_BUS_DEVICE,
> +    .instance_size = sizeof(ARMv7MState),
> +    .instance_init = armv7m_instance_init,
> +    .class_init = armv7m_class_init,
> +};
> +
>  static void armv7m_reset(void *opaque)
>  {
>      ARMCPU *cpu = opaque;
> @@ -264,6 +379,7 @@ static const TypeInfo bitband_info = {
>  static void armv7m_register_types(void)
>  {
>      type_register_static(&bitband_info);
> +    type_register_static(&armv7m_info);
>  }
>
>  type_init(armv7m_register_types)
> --
> 2.7.4
>
>
>

--001a1140fb2ca796c5054d54d13b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Peter,<div><br></div><div><br><div class=3D"gmail_extra=
"><br><div class=3D"gmail_quote">On Mon, Feb 20, 2017 at 12:35 PM, Peter Ma=
ydell <span dir=3D"ltr">&lt;<a href=3D"mailto:peter.maydell@linaro.org" tar=
get=3D"_blank">peter.maydell@linaro.org</a>&gt;</span> wrote:<br><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">Create a proper QOM object for the =
armv7m container, which<br>
holds the CPU, the NVIC and the bitband regions.<br>
<br>
Signed-off-by: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org=
">peter.maydell@linaro.org</a>&gt;<br>
---<br>
=C2=A0include/hw/arm/armv7m.h |=C2=A0 51 ++++++++++++++++++<br>
=C2=A0hw/arm/armv7m.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 140 ++++++++++++++=
++++++++++++++++<wbr>+++++++++++++-----<br>
=C2=A02 files changed, 179 insertions(+), 12 deletions(-)<br>
=C2=A0create mode 100644 include/hw/arm/armv7m.h<br>
<br>
diff --git a/include/hw/arm/armv7m.h b/include/hw/arm/armv7m.h<br>
new file mode 100644<br>
index 0000000..193ad71<br>
--- /dev/null<br>
+++ b/include/hw/arm/armv7m.h<br>
@@ -0,0 +1,51 @@<br>
+/*<br>
+ * ARMv7M CPU object<br>
+ *<br>
+ * Copyright (c) 2017 Linaro Ltd<br>
+ * Written by Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org=
">peter.maydell@linaro.org</a>&gt;<br>
+ *<br>
+ * This code is licensed under the GPL version 2 or later.<br>
+ */<br>
+<br>
+#ifndef HW_ARM_ARMV7M_H<br>
+#define HW_ARM_ARMV7M_H<br>
+<br>
+#include &quot;hw/sysbus.h&quot;<br>
+#include &quot;hw/arm/armv7m_nvic.h&quot;<br>
+<br>
+#define TYPE_BITBAND &quot;ARM,bitband-memory&quot;<br>
+#define BITBAND(obj) OBJECT_CHECK(BitBandState, (obj), TYPE_BITBAND)<br>
+<br>
+typedef struct {<br>
+=C2=A0 =C2=A0 /*&lt; private &gt;*/<br>
+=C2=A0 =C2=A0 SysBusDevice parent_obj;<br>
+=C2=A0 =C2=A0 /*&lt; public &gt;*/<br>
+<br>
+=C2=A0 =C2=A0 MemoryRegion iomem;<br>
+=C2=A0 =C2=A0 uint32_t base;<br>
+} BitBandState;<br>
+<br>
+#define TYPE_ARMV7M &quot;armv7m&quot;<br>
+#define ARMV7M(obj) OBJECT_CHECK(ARMv7MState, (obj), TYPE_ARMV7M)<br>
+<br>
+#define ARMV7M_NUM_BITBANDS 2<br>
+<br>
+/* ARMv7M container object.<br>
+ * + Unnamed GPIO input lines: external IRQ lines for the NVIC<br>
+ * + Named GPIO output SYSRESETREQ: signalled for guest AIRCR.SYSRESETREQ<=
br>
+ * + Property &quot;cpu-model&quot;: CPU model to instantiate<br>
+ * + Property &quot;num-irq&quot;: number of external IRQ lines<br>
+ */<br>
+typedef struct ARMv7MState {<br>
+=C2=A0 =C2=A0 /*&lt; private &gt;*/<br>
+=C2=A0 =C2=A0 SysBusDevice parent_obj;<br>
+=C2=A0 =C2=A0 /*&lt; public &gt;*/<br>
+=C2=A0 =C2=A0 NVICState nvic;<br>
+=C2=A0 =C2=A0 BitBandState bitband[ARMV7M_NUM_BITBANDS];<br>
+=C2=A0 =C2=A0 ARMCPU *cpu;<br>
+<br>
+=C2=A0 =C2=A0 /* Properties */<br>
+=C2=A0 =C2=A0 char *cpu_model;<br>
+} ARMv7MState;<br>
+<br>
+#endif<br>
diff --git a/hw/arm/armv7m.c b/hw/arm/armv7m.c<br>
index b2cc6e9..56d02d4 100644<br>
--- a/hw/arm/armv7m.c<br>
+++ b/hw/arm/armv7m.c<br>
@@ -8,6 +8,7 @@<br>
=C2=A0 */<br>
<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;hw/arm/armv7m.h&quot;<br>
=C2=A0#include &quot;qapi/error.h&quot;<br>
=C2=A0#include &quot;qemu-common.h&quot;<br>
=C2=A0#include &quot;cpu.h&quot;<br>
@@ -120,18 +121,6 @@ static const MemoryRegionOps bitband_ops =3D {<br>
=C2=A0 =C2=A0 =C2=A0.endianness =3D DEVICE_NATIVE_ENDIAN,<br>
=C2=A0};<br>
<br>
-#define TYPE_BITBAND &quot;ARM,bitband-memory&quot;<br>
-#define BITBAND(obj) OBJECT_CHECK(BitBandState, (obj), TYPE_BITBAND)<br>
-<br>
-typedef struct {<br>
-=C2=A0 =C2=A0 /*&lt; private &gt;*/<br>
-=C2=A0 =C2=A0 SysBusDevice parent_obj;<br>
-=C2=A0 =C2=A0 /*&lt; public &gt;*/<br>
-<br>
-=C2=A0 =C2=A0 MemoryRegion iomem;<br>
-=C2=A0 =C2=A0 uint32_t base;<br>
-} BitBandState;<br>
-<br>
=C2=A0static void bitband_init(Object *obj)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0BitBandState *s =3D BITBAND(obj);<br>
@@ -159,6 +148,132 @@ static void armv7m_bitband_init(void)<br>
<br>
=C2=A0/* Board init.=C2=A0 */<br>
<br>
+static const hwaddr bitband_input_addr[ARMV7M_NUM_<wbr>BITBANDS] =3D {<br>
+=C2=A0 =C2=A0 0x20000000, 0x40000000<br>
+};<br>
</blockquote><div><br></div><div>What do you think about adding a</div><div=
><br></div><div>#define ARMV7M_BITBAND_[REGION/IOMEM]_SIZE (1ULL &lt;&lt; 2=
5) or=C2=A00x2000000</div><div><br></div><div>and use it at least with memo=
ry_region_init_io() and eventually to get the output base addr?</div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">+<br>
+static const hwaddr bitband_output_addr[ARMV7M_<wbr>NUM_BITBANDS] =3D {<br=
>
+=C2=A0 =C2=A0 0x22000000, 0x42000000<br>
+};<br>
+<br>
+static void armv7m_instance_init(Object *obj)<br>
+{<br>
+=C2=A0 =C2=A0 ARMv7MState *s =3D ARMV7M(obj);<br>
+=C2=A0 =C2=A0 int i;<br>
+<br>
+=C2=A0 =C2=A0 /* Can&#39;t init the cpu here, we don&#39;t yet know which =
model to use */<br>
+<br>
+=C2=A0 =C2=A0 object_initialize(&amp;s-&gt;nvic, sizeof(s-&gt;nvic), &quot=
;armv7m_nvic&quot;);<br>
+=C2=A0 =C2=A0 qdev_set_parent_bus(DEVICE(&amp;s-<wbr>&gt;nvic), sysbus_get=
_default());<br>
+=C2=A0 =C2=A0 object_property_add_alias(obj, &quot;num-irq&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 OBJECT(&amp;s-&gt;nvic), &quot;num-irq&quot=
;, &amp;error_abort);<br>
+<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; ARRAY_SIZE(s-&gt;bitband); i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 object_initialize(&amp;s-&gt;bitband[<wbr>i], =
sizeof(s-&gt;bitband[i]), TYPE_BITBAND);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qdev_set_parent_bus(DEVICE(&amp;s-<wbr>&gt;bit=
band[i]), sysbus_get_default());<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static void armv7m_realize(DeviceState *dev, Error **errp)<br>
+{<br>
+=C2=A0 =C2=A0 /* here realize our children */<br>
+=C2=A0 =C2=A0 ARMv7MState *s =3D ARMV7M(dev);<br>
+=C2=A0 =C2=A0 Error *err =3D NULL;<br>
+=C2=A0 =C2=A0 int i;<br>
+=C2=A0 =C2=A0 char **cpustr;<br>
+=C2=A0 =C2=A0 ObjectClass *oc;<br>
+=C2=A0 =C2=A0 const char *typename;<br>
+=C2=A0 =C2=A0 CPUClass *cc;<br>
+<br>
+=C2=A0 =C2=A0 cpustr =3D g_strsplit(s-&gt;cpu_model, &quot;,&quot;, 2);<br=
>
+<br>
+=C2=A0 =C2=A0 oc =3D cpu_class_by_name(TYPE_ARM_<wbr>CPU, cpustr[0]);<br>
+=C2=A0 =C2=A0 if (!oc) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;Unknown CPU model %s&qu=
ot;, cpustr[0]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_strfreev(cpustr);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 cc =3D CPU_CLASS(oc);<br>
+=C2=A0 =C2=A0 typename =3D object_class_get_name(oc);<br>
+=C2=A0 =C2=A0 cc-&gt;parse_features(typename, cpustr[1], &amp;err);<br>
+=C2=A0 =C2=A0 g_strfreev(cpustr);<br>
+=C2=A0 =C2=A0 if (err) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, err);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 s-&gt;cpu =3D ARM_CPU(object_new(typename));<br>
+=C2=A0 =C2=A0 if (!s-&gt;cpu) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;Unknown CPU model %s&qu=
ot;, s-&gt;cpu_model);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 object_property_set_bool(<wbr>OBJECT(s-&gt;cpu), true, &quot=
;realized&quot;, &amp;err);<br>
+=C2=A0 =C2=A0 if (err !=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, err);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /* Note that we must realize the NVIC after the CPU */<br>
+=C2=A0 =C2=A0 object_property_set_bool(<wbr>OBJECT(&amp;s-&gt;nvic), true,=
 &quot;realized&quot;, &amp;err);<br>
+=C2=A0 =C2=A0 if (err !=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, err);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /* Alias the NVIC&#39;s input and output GPIOs as our own so=
 the board<br>
+=C2=A0 =C2=A0 =C2=A0* code can wire them up. (We do this in realize becaus=
e the<br>
+=C2=A0 =C2=A0 =C2=A0* NVIC doesn&#39;t create the input GPIO array until r=
ealize.)<br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
+=C2=A0 =C2=A0 qdev_pass_gpios(DEVICE(&amp;s-&gt;<wbr>nvic), dev, NULL);<br=
>
+=C2=A0 =C2=A0 qdev_pass_gpios(DEVICE(&amp;s-&gt;<wbr>nvic), dev, &quot;SYS=
RESETREQ&quot;);<br>
+<br>
+=C2=A0 =C2=A0 /* Wire the NVIC up to the CPU */<br>
+=C2=A0 =C2=A0 sysbus_connect_irq(SYS_BUS_<wbr>DEVICE(&amp;s-&gt;nvic), 0,<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0qdev_get_gpio_in(DEVICE(s-&gt;<wbr>cpu), ARM_CPU_IRQ));<br>
+=C2=A0 =C2=A0 s-&gt;cpu-&gt;env.nvic =3D &amp;s-&gt;nvic;<br>
+<br>
+=C2=A0 =C2=A0 for (i =3D 0; i &lt; ARRAY_SIZE(s-&gt;bitband); i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 Object *obj =3D OBJECT(&amp;s-&gt;bitband[i]);=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 SysBusDevice *sbd =3D SYS_BUS_DEVICE(&amp;s-&g=
t;bitband[i])<wbr>;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 object_property_set_int(obj, bitband_input_add=
r[i], &quot;base&quot;, &amp;err);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (err !=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, err);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 object_property_set_bool(obj, true, &quot;real=
ized&quot;, &amp;err);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (err !=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_propagate(errp, err);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 sysbus_mmio_map(sbd, 0, bitband_output_addr[i]=
);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static Property armv7m_properties[] =3D {<br>
+=C2=A0 =C2=A0 DEFINE_PROP_STRING(&quot;cpu-model&quot;<wbr>, ARMv7MState, =
cpu_model),<br>
+=C2=A0 =C2=A0 DEFINE_PROP_END_OF_LIST(),<br>
+};<br>
+<br>
+static void armv7m_class_init(ObjectClass *klass, void *data)<br>
+{<br>
+=C2=A0 =C2=A0 DeviceClass *dc =3D DEVICE_CLASS(klass);<br>
+<br>
+=C2=A0 =C2=A0 dc-&gt;realize =3D armv7m_realize;<br>
+=C2=A0 =C2=A0 dc-&gt;props =3D armv7m_properties;<br>
+}<br>
+<br>
+static const TypeInfo armv7m_info =3D {<br>
+=C2=A0 =C2=A0 .name =3D TYPE_ARMV7M,<br>
+=C2=A0 =C2=A0 .parent =3D TYPE_SYS_BUS_DEVICE,<br>
+=C2=A0 =C2=A0 .instance_size =3D sizeof(ARMv7MState),<br>
+=C2=A0 =C2=A0 .instance_init =3D armv7m_instance_init,<br>
+=C2=A0 =C2=A0 .class_init =3D armv7m_class_init,<br>
+};<br>
+<br>
=C2=A0static void armv7m_reset(void *opaque)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0ARMCPU *cpu =3D opaque;<br>
@@ -264,6 +379,7 @@ static const TypeInfo bitband_info =3D {<br>
=C2=A0static void armv7m_register_types(void)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0type_register_static(&amp;bitband_<wbr>info);<br>
+=C2=A0 =C2=A0 type_register_static(&amp;armv7m_<wbr>info);<br>
=C2=A0}<br>
<br>
=C2=A0type_init(armv7m_register_<wbr>types)<br>
<span class=3D"gmail-HOEnZb"><font color=3D"#888888">--<br>
2.7.4<br>
<br>
<br>
</font></span></blockquote></div><br></div></div></div>

--001a1140fb2ca796c5054d54d13b--
