Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43712C5CFDB
	for <qemu-arm@archiver.kernel.org>; Thu, 13 Aug 2026 21:10:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wuchD-0006bk-MH; Thu, 13 Aug 2026 17:10:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1wuchC-0006b7-Gn
 for qemu-arm@nongnu.org; Thu, 13 Aug 2026 17:10:38 -0400
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <nieklinnenbank@gmail.com>)
 id 1wuchA-0007x1-HJ
 for qemu-arm@nongnu.org; Thu, 13 Aug 2026 17:10:38 -0400
Received: by mail-oo1-xc2e.google.com with SMTP id
 006d021491bc7-6aea94f96c4so263759eaf.2
 for <qemu-arm@nongnu.org>; Thu, 13 Aug 2026 14:10:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786655435; cv=none;
 d=google.com; s=arc-20260327;
 b=VInJcFCH9lxjbg7kidSs+gJAjrCbfxJpaTHj+H++GNP5CwdGc5UAJvln2oRQZPIyGA
 5J3cgK7y1moQN7ipBLOA6PcGRt1f6LHAWi3/LttmzsEwkmCE3mIlZG7oWA1WiuFdQTPV
 qBbfrHhTUF7y2dXoLiUK3no88YOoxzDk98Uo5t31PnQ/0wDeI1bBcatAnmBqU86ygH8V
 ZeUNOT/QKkuX6x4BkeqbfmDiCU1o1YxSiPQbFlqlYLEER1Jw1u2FdoFgA8aClvQsosKg
 z5Yy2DfNkSjZ2mPaIDeYKF8GVE16a8kCqHBSF7VtTxjIhVyfrfWtRt0yoLH0bK0NGzkN
 jFmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=f56CoFxFguticBzD2aaadsF5hA52TrO6cNg9NRRTkBw=;
 fh=5cnTeUERQlkPIHs/23eL05ogKCjeVNFOHoyzDntxoqI=;
 b=ptKKD0O/0P5PtSyscJbNVgByXT3pC8ypKYo3mKCySDZxuJCLzCjhYzAXMzmUYNnpoO
 lUBoMtb3PHMhVB1uD6IqDsRqyF19iNfSeKVk2C6HGcPb15cvL1Yqh96whWLNyLXwGHyb
 6UQxvK2cizFDE6M5lL2vute2cYA7QXBvE9zi0GgmxnY8Vx9WX07Som//TLkA1Je1zBjR
 RIzmT67ZZ+0QejXFrfgQzRKcDNqj+LmjKGOUo/M/+34mNNQ2E9jHHgUCyoQyQ9dQESKe
 jPiyQbF0JUCRcbDKEXyfBAKaITm2UFfjdG1oPIS7TUIMpp5k0IfFkVUgBZ4SvDn1mR/6
 xy4w==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1786655435; x=1787260235; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=f56CoFxFguticBzD2aaadsF5hA52TrO6cNg9NRRTkBw=;
 b=QIDAyOV8xBZd64D5lT5e/y0RboNXl3XQgpJ64VtPoHWDyaTHBvrfLc3+D/ZXMzMS4v
 aTxYxnj5Eh4wMMuW/lkXHCh1uGzuA08GvdeJZVprJuuWSknpu6r+G4KxIw0iqAJoACqx
 hSLq2m1uNAVkWAH/FBVVajfJEDpFO2uTMxS8qyO7pMFMdI1HHfxhFlAYPRfMbKr0/w5k
 bkxoSLDCgKxI7i5aULHo+pX8UHYJRAHllX3v0CgkkKZqOlgqKfbrrXGgs7Bs7RyeKLOx
 a2LqV+gvvN6iikvM7ZHLuDrybLNOCORRFrCUDMuQPuuBMGC08AtDy/zzVD22QmLT2vMi
 QzlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786655435; x=1787260235;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=f56CoFxFguticBzD2aaadsF5hA52TrO6cNg9NRRTkBw=;
 b=BhbOTeJUaJZTP+fssfumrNbnwLrrtAszfMsXf3xDjJ/4txdMVlC+vpG5fmAXSsOcKW
 pLUpgsu3EiDJkxzUODxIuVauY52BYREvQIdABjLz2+Mhvo/1HT21M+pEZAftwVq7ogwI
 BsebK9jZXJ/ke45cjPHI9M0zj32FFAt8TSsqUDv/DQxRVc1rHKWsy7AZ1UReDdtfzKCO
 /Ed+Uiyt7BimDhNJcdTxDTvp2dYgun9bedjDB+JgsBGF9uKQnqaH6wkUU1lL99kijHSl
 zVJKSEBcx+ru0Vt7cUf9FCgiyaOZNEdSPYEX0mTpaQ46TmPgfoxdwiUH8UEr/2Otl0dO
 XtvQ==
X-Forwarded-Encrypted: i=1;
 AHgh+RoVYpFZoSNaZ7BDFQ7hzQFvRr72/49uyXRH5VgQhLdZqT9+C7y62Ai6MQMSmgr0fLnwTZph0XebQg==@nongnu.org
X-Gm-Message-State: AOJu0YznfqONlLXyz/TdlryLYCkX9IAXchD33JOhuH3/+RBL4QoQfWnx
 OpaaXVM8XxesRe7xxeLCbpLkldx3yIc4jmttWXSc/s/4TAWi8Nh46mQdD3uI2TzOhF/YCATy051
 4G9fcNUD7ud+Dg5uxbRFUJ4Mm2THRbmg=
X-Gm-Gg: AR+sD12A6jMPRz0Qlffb6T1697QypkQqrzqQE9MLARLvXFrdZAsg4QJ04ve15ZhegGt
 9U9DDOHSb/6WQBc8O0mUHRRRsG0Wsr75lv3DmQOuH+Bd9+9MFZVNc814qRx7o4wfW6a/6HjAOAG
 YS32dBzI85vn1QONyMsYfS2YQiyBz4TQ5dHr6UWC628GQ6lwbmMdXpB9eDEvaMgxw2R1ZOvSEHT
 cI2G7aQKpAcivEmdvk75ISJaeKwZsQMfaKvkAEdKm54GeYeplFWgAa30dPn8alSVwuxs9IjTo1M
 8lb938LltwWdpmUHNJV8vk1vNWpWj656svtNzH/rRJsYh9jEjvpjuIkv76mSVMAaRNXao8ue0bt
 w2sWTCJljmmBWLbkuNQcmm0j+rE/2Vg==
X-Received: by 2002:a05:6820:4ccc:b0:6a3:7341:f6ed with SMTP id
 006d021491bc7-6b0d5fca9famr1250294eaf.1.1786655434868; Thu, 13 Aug 2026
 14:10:34 -0700 (PDT)
MIME-Version: 1.0
References: <20260813154918.996812-1-bin.meng@processmission.com>
 <20260813154918.996812-17-bin.meng@processmission.com>
In-Reply-To: <20260813154918.996812-17-bin.meng@processmission.com>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Thu, 13 Aug 2026 23:10:23 +0200
X-Gm-Features: AUfX_mxetUI3LzQGsQe_zY8IZFIeRFbSFh3N1oolDgO64cqiD4UkDiLhv3x6PYQ
Message-ID: <CAPan3WoTubzEHGdCKs0tbDKLAms3Y9JG2QVd2Uydh4sVec7u4w@mail.gmail.com>
Subject: Re: [PATCH 16/20] hw/arm: orangepi: Store boot info in the machine
 state
To: Bin Meng <bin.meng@processmission.com>
Cc: QEMU <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, 
 qemu-arm <qemu-arm@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000880a240658f42277"
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2e;
 envelope-from=nieklinnenbank@gmail.com; helo=mail-oo1-xc2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

--000000000000880a240658f42277
Content-Type: text/plain; charset="UTF-8"

Op do 13 aug. 2026 17:51 schreef Bin Meng <bin.meng@processmission.com>:

> arm_load_kernel() keeps a pointer to the boot info struct for the
> lifetime of the VM, so the struct logically belongs to the machine
> rather than to a file scoped static object.
>
> Move it into a new OrangePiMachineState and register the machine type
> explicitly instead of through the DEFINE_MACHINE_ARM macro.
>
> As in the xlnx-zcu102 and raspi machines, the boot info belongs to
> the machine rather than to a static object:
>
> 4d1ac883a7 ("hw/arm: xlnx-zcu102: Move arm_boot_info into XlnxZCU102")
> 0f15c6e338 ("hw/arm/raspi: Move arm_boot_info structure to
> RaspiMachineState")
>
> Signed-off-by: Bin Meng <bin.meng@processmission.com>
>
Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>

---
>
>  hw/arm/orangepi.c | 37 ++++++++++++++++++++++++++++++-------
>  1 file changed, 30 insertions(+), 7 deletions(-)
>
> diff --git a/hw/arm/orangepi.c b/hw/arm/orangepi.c
> index d84443bb7b..5b2c13f364 100644
> --- a/hw/arm/orangepi.c
> +++ b/hw/arm/orangepi.c
> @@ -28,10 +28,18 @@
>  #include "hw/arm/boot.h"
>  #include "hw/arm/machines-qom.h"
>
> -static struct arm_boot_info orangepi_binfo;
> +#define TYPE_ORANGEPI_MACHINE MACHINE_TYPE_NAME("orangepi-pc")
> +OBJECT_DECLARE_SIMPLE_TYPE(OrangePiMachineState, ORANGEPI_MACHINE)
> +
> +struct OrangePiMachineState {
> +    MachineState parent;
> +
> +    struct arm_boot_info bootinfo;
> +};
>
>  static void orangepi_init(MachineState *machine)
>  {
> +    OrangePiMachineState *opms = ORANGEPI_MACHINE(machine);
>      AwH3State *h3;
>      DriveInfo *di;
>      BlockBackend *blk;
> @@ -98,14 +106,16 @@ static void orangepi_init(MachineState *machine)
>          /* Use Boot ROM to copy data from SD card to SRAM */
>          allwinner_h3_bootrom_setup(h3, blk);
>      }
> -    orangepi_binfo.loader_start = h3->memmap[AW_H3_DEV_SDRAM];
> -    orangepi_binfo.ram_size = machine->ram_size;
> -    orangepi_binfo.psci_conduit = QEMU_PSCI_CONDUIT_SMC;
> -    arm_load_kernel(&h3->cpus[0], machine, &orangepi_binfo);
> +    opms->bootinfo.loader_start = h3->memmap[AW_H3_DEV_SDRAM];
> +    opms->bootinfo.ram_size = machine->ram_size;
> +    opms->bootinfo.psci_conduit = QEMU_PSCI_CONDUIT_SMC;
> +    arm_load_kernel(&h3->cpus[0], machine, &opms->bootinfo);
>  }
>
> -static void orangepi_machine_init(MachineClass *mc)
> +static void orangepi_machine_class_init(ObjectClass *oc, const void *data)
>  {
> +    MachineClass *mc = MACHINE_CLASS(oc);
> +
>      static const char * const valid_cpu_types[] = {
>          ARM_CPU_TYPE_NAME("cortex-a7"),
>          NULL
> @@ -125,4 +135,17 @@ static void orangepi_machine_init(MachineClass *mc)
>      mc->auto_create_sdcard = true;
>  }
>
> -DEFINE_MACHINE_ARM("orangepi-pc", orangepi_machine_init)
> +static const TypeInfo orangepi_machine_typeinfo = {
> +    .name = TYPE_ORANGEPI_MACHINE,
> +    .parent = TYPE_MACHINE,
> +    .class_init = orangepi_machine_class_init,
> +    .instance_size = sizeof(OrangePiMachineState),
> +    .interfaces = arm_machine_interfaces,
> +};
> +
> +static void orangepi_machine_register_types(void)
> +{
> +    type_register_static(&orangepi_machine_typeinfo);
> +}
> +
> +type_init(orangepi_machine_register_types)
> --
> 2.53.0
>
>

--000000000000880a240658f42277
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div><br></div><div class=3D"gmail_quote gmail_quote=
_container"><div dir=3D"ltr" class=3D"gmail_attr">Op do 13 aug. 2026 17:51 =
schreef Bin Meng &lt;<a href=3D"mailto:bin.meng@processmission.com">bin.men=
g@processmission.com</a>&gt;:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">arm_l=
oad_kernel() keeps a pointer to the boot info struct for the<br>
lifetime of the VM, so the struct logically belongs to the machine<br>
rather than to a file scoped static object.<br>
<br>
Move it into a new OrangePiMachineState and register the machine type<br>
explicitly instead of through the DEFINE_MACHINE_ARM macro.<br>
<br>
As in the xlnx-zcu102 and raspi machines, the boot info belongs to<br>
the machine rather than to a static object:<br>
<br>
4d1ac883a7 (&quot;hw/arm: xlnx-zcu102: Move arm_boot_info into XlnxZCU102&q=
uot;)<br>
0f15c6e338 (&quot;hw/arm/raspi: Move arm_boot_info structure to RaspiMachin=
eState&quot;)<br>
<br>
Signed-off-by: Bin Meng &lt;<a href=3D"mailto:bin.meng@processmission.com" =
target=3D"_blank" rel=3D"noreferrer">bin.meng@processmission.com</a>&gt;<br=
></blockquote></div></div><div dir=3D"auto">Reviewed-by: Niek Linnenbank &l=
t;<a href=3D"mailto:nieklinnenbank@gmail.com">nieklinnenbank@gmail.com</a>&=
gt;</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_=
quote gmail_quote_container"><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
---<br>
<br>
=C2=A0hw/arm/orangepi.c | 37 ++++++++++++++++++++++++++++++-------<br>
=C2=A01 file changed, 30 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/hw/arm/orangepi.c b/hw/arm/orangepi.c<br>
index d84443bb7b..5b2c13f364 100644<br>
--- a/hw/arm/orangepi.c<br>
+++ b/hw/arm/orangepi.c<br>
@@ -28,10 +28,18 @@<br>
=C2=A0#include &quot;hw/arm/boot.h&quot;<br>
=C2=A0#include &quot;hw/arm/machines-qom.h&quot;<br>
<br>
-static struct arm_boot_info orangepi_binfo;<br>
+#define TYPE_ORANGEPI_MACHINE MACHINE_TYPE_NAME(&quot;orangepi-pc&quot;)<b=
r>
+OBJECT_DECLARE_SIMPLE_TYPE(OrangePiMachineState, ORANGEPI_MACHINE)<br>
+<br>
+struct OrangePiMachineState {<br>
+=C2=A0 =C2=A0 MachineState parent;<br>
+<br>
+=C2=A0 =C2=A0 struct arm_boot_info bootinfo;<br>
+};<br>
<br>
=C2=A0static void orangepi_init(MachineState *machine)<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 OrangePiMachineState *opms =3D ORANGEPI_MACHINE(machine);<br=
>
=C2=A0 =C2=A0 =C2=A0AwH3State *h3;<br>
=C2=A0 =C2=A0 =C2=A0DriveInfo *di;<br>
=C2=A0 =C2=A0 =C2=A0BlockBackend *blk;<br>
@@ -98,14 +106,16 @@ static void orangepi_init(MachineState *machine)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* Use Boot ROM to copy data from SD card=
 to SRAM */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0allwinner_h3_bootrom_setup(h3, blk);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
-=C2=A0 =C2=A0 orangepi_binfo.loader_start =3D h3-&gt;memmap[AW_H3_DEV_SDRA=
M];<br>
-=C2=A0 =C2=A0 orangepi_binfo.ram_size =3D machine-&gt;ram_size;<br>
-=C2=A0 =C2=A0 orangepi_binfo.psci_conduit =3D QEMU_PSCI_CONDUIT_SMC;<br>
-=C2=A0 =C2=A0 arm_load_kernel(&amp;h3-&gt;cpus[0], machine, &amp;orangepi_=
binfo);<br>
+=C2=A0 =C2=A0 opms-&gt;bootinfo.loader_start =3D h3-&gt;memmap[AW_H3_DEV_S=
DRAM];<br>
+=C2=A0 =C2=A0 opms-&gt;bootinfo.ram_size =3D machine-&gt;ram_size;<br>
+=C2=A0 =C2=A0 opms-&gt;bootinfo.psci_conduit =3D QEMU_PSCI_CONDUIT_SMC;<br=
>
+=C2=A0 =C2=A0 arm_load_kernel(&amp;h3-&gt;cpus[0], machine, &amp;opms-&gt;=
bootinfo);<br>
=C2=A0}<br>
<br>
-static void orangepi_machine_init(MachineClass *mc)<br>
+static void orangepi_machine_class_init(ObjectClass *oc, const void *data)=
<br>
=C2=A0{<br>
+=C2=A0 =C2=A0 MachineClass *mc =3D MACHINE_CLASS(oc);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0static const char * const valid_cpu_types[] =3D {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ARM_CPU_TYPE_NAME(&quot;cortex-a7&quot;),=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NULL<br>
@@ -125,4 +135,17 @@ static void orangepi_machine_init(MachineClass *mc)<br=
>
=C2=A0 =C2=A0 =C2=A0mc-&gt;auto_create_sdcard =3D true;<br>
=C2=A0}<br>
<br>
-DEFINE_MACHINE_ARM(&quot;orangepi-pc&quot;, orangepi_machine_init)<br>
+static const TypeInfo orangepi_machine_typeinfo =3D {<br>
+=C2=A0 =C2=A0 .name =3D TYPE_ORANGEPI_MACHINE,<br>
+=C2=A0 =C2=A0 .parent =3D TYPE_MACHINE,<br>
+=C2=A0 =C2=A0 .class_init =3D orangepi_machine_class_init,<br>
+=C2=A0 =C2=A0 .instance_size =3D sizeof(OrangePiMachineState),<br>
+=C2=A0 =C2=A0 .interfaces =3D arm_machine_interfaces,<br>
+};<br>
+<br>
+static void orangepi_machine_register_types(void)<br>
+{<br>
+=C2=A0 =C2=A0 type_register_static(&amp;orangepi_machine_typeinfo);<br>
+}<br>
+<br>
+type_init(orangepi_machine_register_types)<br>
-- <br>
2.53.0<br>
<br>
</blockquote></div></div></div>

--000000000000880a240658f42277--

