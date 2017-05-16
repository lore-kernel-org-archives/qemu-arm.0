Received: by 10.25.0.6 with SMTP id 6csp1735100lfa;
        Mon, 15 May 2017 23:40:56 -0700 (PDT)
X-Received: by 10.55.4.4 with SMTP id 4mr8033220qke.253.1494916855965;
        Mon, 15 May 2017 23:40:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494916855; cv=none;
        d=google.com; s=arc-20160816;
        b=I//bAvN7KWyC2+fo7ktDuHW+/kizoSe5MgevvUwwDS2nOnCH77/6bBYyL5BGLAREfh
         lBp4Pt0Kdcv+0dDPPz+tYMgyu1gZ/7o0tiV3frUG/ynusmFGJuLRQb77GT2TStaFFH9K
         cQUWyTpJiMoqnGklnq46owrAsP9N3GIT1fX2ZZTosyfbAqhOBvOW+Ge3SS8g7VGMxA6v
         46tUz8Jovp42b2hr19IbvrOgG7iHGU9mWz2sR8dEWBKALbF09w1vRYCFQmgkDAD+6XCd
         G1kdrXWnKKcGc9uDeE5c7zrHNi5AC+Bpl/t7yzh4p4JfOsy/iVYYJaId8RR2gpySeBBy
         fmMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=tqtu98hdg3IvVdARIjYm12SXuwnAXbtp/qgd95a5LYI=;
        b=vwsmTf+VQQli361y7FQo75vZZ5aaGsuuw5fb+WWN7YQZDDHT2wpyzCXNF/7SIyqwZ0
         FOS2jlLSrZOXL5CWxApxXlWNA8FglJ8OgDI9ksG6hUxiNWbns/NmgSlI2iY0iUwj8YDz
         WJjubEoDjupZkyXoENM09+Sv6OUvesdoUxIJzFsfrJJXrYdEq1ts8ROz7cd1+s6t4WZ4
         0K/NXal0zDl8rFLH6/admYDeYnwY2xxyM4KW/Mo/JiXp4z8ZSXRmXpis6v/dc1ANcYUr
         J61i3lBAiCZeGS02DAbXEZUfNOmHBvRBA9P+vLn6l6BF6Z1p0VS0r7Q34dYRv6QQdG0O
         3ipw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k66si12731521qkl.154.2017.05.15.23.40.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 May 2017 23:40:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:40098 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dAWAB-0000zT-C4
	for alex.bennee@linaro.org; Tue, 16 May 2017 02:40:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36920)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dAWA1-0000yj-P7
	for qemu-arm@nongnu.org; Tue, 16 May 2017 02:40:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sundeep.lkml@gmail.com>) id 1dAW9z-00057a-MP
	for qemu-arm@nongnu.org; Tue, 16 May 2017 02:40:45 -0400
Received: from mail-yb0-x244.google.com ([2607:f8b0:4002:c09::244]:36731)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <sundeep.lkml@gmail.com>)
	id 1dAW9t-00054y-W7; Tue, 16 May 2017 02:40:38 -0400
Received: by mail-yb0-x244.google.com with SMTP id n198so3491830yba.3;
	Mon, 15 May 2017 23:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=tqtu98hdg3IvVdARIjYm12SXuwnAXbtp/qgd95a5LYI=;
	b=oJPIfNQ6CfPZOTSQ/GFH4sO+bILlgow7XI6OdbsPRPB+7Gi5R2Nk8q+hNaNwK9YM0J
	rTFkpAbtPVXshN9GEyqMoMHWQp2mAgPWylbPOHWTTdgTRdaLZXnFeZk0yE9F8k6rGcjt
	JWFsqo0S81LdPtezqs2C9dZDMQHToVM9DZMOb+j1GNF8X6vbuvUEORYGKxOQtCJbAM/L
	+Z3jlXxBYtSosREqK0Ro4rKCV9SAm85GaE0+fAqIEnK70DuS21MoucUcGru4mDnQtqCS
	GwfCBYayKJQt56QZhxELa4yx/boGePmfZHrlAr0yhkST+gGsb1BhfBlakNA3GRrMIc46
	99kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=tqtu98hdg3IvVdARIjYm12SXuwnAXbtp/qgd95a5LYI=;
	b=pws4y94f29cyNcFm6pQJd+LbQKib9DIL89winxQ3YyZS+sEEpwqm4pUwoBeLL9u83z
	5pRpstAlojZWfxP+4HjQvBR/XKL137uXwXOvX9pFnWiQrtMVCKot7+ejSklxySC5ojoB
	lHif5Se3Izn/L+qbikSHs8Puw3mIUuPD0kSsJXH4x0vOexLV05wPLD2GrJukaJZz/aSZ
	qP5zIXwLThI+UcqWkRUIWSw83bA5hP+ZRvNqyLpK9hBe26ydp9Me3NhxX/o8Ty4TqvJt
	tHfCjLGkpyXEZjxZwzQrD9D0ravRoD5Mi6FAmlUlo4u9/YRuRtIKlU1vpTdBVZ2dZCqE
	f2UA==
X-Gm-Message-State: AODbwcCWMW90VdWjVQUP9+LgkGJvCmPHoHdNuirBT7/hnXi9cYjmuwgQ
	N/BG0hoHkoPm+iA67D+laTBxcVEoPQ==
X-Received: by 10.37.13.143 with SMTP id 137mr7841859ybn.53.1494916836840;
	Mon, 15 May 2017 23:40:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.13.244.1 with HTTP; Mon, 15 May 2017 23:40:36 -0700 (PDT)
In-Reply-To: <CAKmqyKMbC67ppDLSXQegXaDZB6O=aSOSzdGtJsfP7RCGxy_rNg@mail.gmail.com>
References: <1494348286-10253-1-git-send-email-sundeep.lkml@gmail.com>
	<1494348286-10253-5-git-send-email-sundeep.lkml@gmail.com>
	<b913e666-8df3-714f-3ff9-e8f4ff9e7098@amsat.org>
	<CALHRZuptHwyzu0Y98VWnNd785W80AZ=+1cr_rfegvDo5amh+3g@mail.gmail.com>
	<7ee4c347-4502-863a-8c9f-faaf8fab17f3@amsat.org>
	<CAKmqyKMbC67ppDLSXQegXaDZB6O=aSOSzdGtJsfP7RCGxy_rNg@mail.gmail.com>
From: sundeep subbaraya <sundeep.lkml@gmail.com>
Date: Tue, 16 May 2017 12:10:36 +0530
Message-ID: <CALHRZup5FtnBHYinuXs=FpfwcLpxXtZ2gwNh2Mv2dA-DWReNGQ@mail.gmail.com>
To: Alistair Francis <alistair23@gmail.com>
Content-Type: multipart/alternative; boundary="001a11c00c68075d71054f9e739d"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4002:c09::244
Subject: Re: [Qemu-arm] [Qemu-devel] [Qemu-devel PATCH 4/5] msf2: Add
 Smartfusion2 SoC.
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ijU8WJWEKg+U

--001a11c00c68075d71054f9e739d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Philippe and Alistair,

On Mon, May 15, 2017 at 10:24 PM, Alistair Francis <alistair23@gmail.com>
wrote:

>  On Thu, May 11, 2017 at 10:02 PM, Philippe Mathieu-Daud=C3=A9
> <f4bug@amsat.org> wrote:
> > On 05/12/2017 12:17 AM, sundeep subbaraya wrote:
> >>
> >> Hi Philippe,
> >>
> >> On Wed, May 10, 2017 at 5:20 PM, Philippe Mathieu-Daud=C3=A9 <
> f4bug@amsat.org>
> >> wrote:
> >>
> >>> Hi Subbaraya,
> >>>
> >>>
> >>> On 05/09/2017 01:44 PM, Subbaraya Sundeep wrote:
> >>>
> >>>> Smartfusion2 SoC has hardened Microcontroller subsystem
> >>>> and flash based FPGA fabric. This patch adds support for
> >>>> Microcontroller subsystem in the SoC.
> >>>>
> >>>> Signed-off-by: Subbaraya Sundeep <sundeep.lkml@gmail.com>
> >>>> ---
> >>>>  default-configs/arm-softmmu.mak |   1 +
> >>>>  hw/arm/Makefile.objs            |   2 +-
> >>>>  hw/arm/msf2-soc.c               | 188 +++++++++++++++++++++++++++++=
+
> >>>> ++++++++++
> >>>>  include/hw/arm/msf2-soc.h       |  60 +++++++++++++
> >>>>  4 files changed, 250 insertions(+), 1 deletion(-)
> >>>>  create mode 100644 hw/arm/msf2-soc.c
> >>>>  create mode 100644 include/hw/arm/msf2-soc.h
> >>>>
> >>>> diff --git a/default-configs/arm-softmmu.mak
> >>>> b/default-configs/arm-softmmu.mak
> >>>> index 78d7af0..7062512 100644
> >>>> --- a/default-configs/arm-softmmu.mak
> >>>> +++ b/default-configs/arm-softmmu.mak
> >>>> @@ -122,3 +122,4 @@ CONFIG_ACPI=3Dy
> >>>>  CONFIG_SMBIOS=3Dy
> >>>>  CONFIG_ASPEED_SOC=3Dy
> >>>>  CONFIG_GPIO_KEY=3Dy
> >>>> +CONFIG_MSF2=3Dy
> >>>> diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs
> >>>> index 4c5c4ee..ae5e4a3 100644
> >>>> --- a/hw/arm/Makefile.objs
> >>>> +++ b/hw/arm/Makefile.objs
> >>>> @@ -1,7 +1,7 @@
> >>>>  obj-y +=3D boot.o collie.o exynos4_boards.o gumstix.o highbank.o
> >>>>  obj-$(CONFIG_DIGIC) +=3D digic_boards.o
> >>>>  obj-y +=3D integratorcp.o mainstone.o musicpal.o nseries.o
> >>>> -obj-y +=3D omap_sx1.o palm.o realview.o spitz.o stellaris.o
> >>>> +obj-y +=3D omap_sx1.o palm.o realview.o spitz.o stellaris.o msf2-so=
c.o
> >>>>
> >>>
> >>> Not a big deal, but since you added CONFIG_MSF2 why not using it here
> and
> >>> the Makefiles you touched (misc/ssi/timer)?
> >>>
> >>> obj-$(CONFIG_MSF2) +=3D msf2-soc.o
> >>>
> >>>   OK. Will change it.
> >>
> >>
> >>>
> >>>  obj-y +=3D tosa.o versatilepb.o vexpress.o virt.o xilinx_zynq.o z2.o
> >>>>
> >>>>  obj-$(CONFIG_ACPI) +=3D virt-acpi-build.o
> >>>>  obj-y +=3D netduino2.o
> >
> > [...]
> >>>>
> >>>> +    MemoryRegion *system_memory =3D get_system_memory();
> >>>> +    MemoryRegion *nvm =3D g_new(MemoryRegion, 1);
> >>>> +    MemoryRegion *nvm_alias =3D g_new(MemoryRegion, 1);
> >>>> +    MemoryRegion *sram =3D g_new(MemoryRegion, 1);
> >>>> +    MemoryRegion *ddr =3D g_new(MemoryRegion, 1);
> >>>> +
> >>>> +    memory_region_init_ram(nvm, NULL, "MSF2.envm", ENVM_SIZE,
> >>>> +                           &error_fatal);
> >>>>
> >>>
> >>> Maybe you can name it "eNVM" to match the documentation.
> >>>
> >>> Also envm_size should be a per-model property.
> >>>
> >>
> >> Ok.
> >>
> >>>
> >>> +    memory_region_init_alias(nvm_alias, NULL, "MSF2.flash.alias",
> >>>>
> >>>> +                             nvm, 0, ENVM_SIZE);
> >>>>
> >>>
> >>> Hmmm well this would be the "Cache Matrix Remap" which happens to be
> >>> mapped by default to eNVM on cold reset.
> >>> Naming it "MSF2.flash.alias" is pretty confusing.
> >>>
> >>
> >> Exactly it is Cache Matrix Remap.
> >> AFAIK currently we cannot remap memory during runtime in Qemu.
> >> So I handled default remap with alias.
> >> Please suggest the name. MSF2.eNVM.alias sounds fine?
> >
> >
> > Hmm Peter, Francis?
> >
> > Personally I prefer "bus_remap.alias" which is explicit.
> >
> > "eNVM.alias" is only true on Cold Reset.
>
> Yeah, I'm pretty sure you can't remap memory (unless that is some new
> feature I missed).
>
> Creating an alias seems like the right idea (you can even
> enable/disable it as needed to pretend we have dynamic remapping).
>
> As for names usually just copy the data sheet. MSF2.eNVM.alias sounds
> fine to me.
>

I will let it be MSF2.eNVM.alias and add comment about default remapping on
reset.

Thanks,
Sundeep

>
> Thanks,
>
> Alistair
>
> >
> >>>
> >>> +    vmstate_register_ram_global(nvm);
> >>>>
> >>>> +
> >>>> +    memory_region_set_readonly(nvm, true);
> >>>> +    memory_region_set_readonly(nvm_alias, true);
> >>>> +
> >>>> +    memory_region_add_subregion(system_memory, ENVM_BASE_ADDRESS,
> nvm);
> >>>> +    memory_region_add_subregion(system_memory, 0, nvm_alias);
> >>>> +
> >>>> +    memory_region_init_ram(ddr, NULL, "MSF2.ddr", DDR_SIZE,
> >>>> +                           &error_fatal);
> >>>>
> >>>
> >>> Wrong, there is no DDR on this SoC.
> >>>
> >> DDR controller is there in Smartfusion2 (different from Smartfusion). =
As
> >> you said below this
> >> should be in board file.
> >
> >
> > There IS a DDRC in this SoC, but here you are registering a DDR 'ram'
> memory
> > region, not a controller. This SoC can be used without any DDR, enough
> using
> > embedded eNVM and eSRAM.
> >
> > Now it happens your SoM board provides a DDR chip connected to this SoC=
.
> >
> >>>
> >>> +    vmstate_register_ram_global(ddr);
> >>>>
> >>>> +    memory_region_add_subregion(system_memory, DDR_BASE_ADDRESS,
> ddr);
> >>>> +
> >>>> +    memory_region_init_ram(sram, NULL, "MSF2.sram", SRAM_SIZE,
> >>>> +                           &error_fatal);
> >>>>
> >>>
> >>> I'd rather like to see it named "eSRAM" somehow, so there is no
> confusion
> >>> possible with external SRAM a SoM/board can map at 0x60000000.
> >>>
> >>> Same comment than envm_size, sram_size should be a per-model property=
.
> >>>
> >>> OK
> >>
> >>
> >>> +    vmstate_register_ram_global(sram);
> >>>>
> >>>> +    memory_region_add_subregion(system_memory, SRAM_BASE_ADDRESS,
> >>>> sram);
> >>>> +
> >>>> +    armv7m =3D DEVICE(&s->armv7m);
> >>>> +    qdev_prop_set_uint32(armv7m, "num-irq", 96);
> >>>>
> >>>
> >>> Can you point me to your datasheet? I thought the SF2 had 240 IRQs.
> >>
> >>
> >>
> >> Please go to link:
> >> https://www.microsemi.com/document-portal/search_form
> >> and provide search keyword as "UG0331". You can the download the spec.
> >> It has 81 irqs I remember when I have given 81 qemu complained not
> >> multiple
> >> of 4.
> >> I checked again with 81 and it is fine. I will change it to 81.
> >
> >
> > Ok :)
> >
> >> +    qdev_prop_set_string(armv7m, "cpu-model", "cortex-m3");
> >>>>
> >>>> +    object_property_set_link(OBJECT(&s->armv7m),
> >>>> OBJECT(get_system_memory()),
> >>>> +                                     "memory", &error_abort);
> >
> > [...]
> >>>>
> >>>> +#define MSF2_NUM_SPIS         2
> >>>> +#define MSF2_NUM_UARTS        2
> >>>> +
> >>>> +#define ENVM_BASE_ADDRESS     0x60000000
> >>>> +#define ENVM_SIZE             (128 * 1024)
> >>>>
> >>>
> >>> The SoC design ENVM_SIZE is 1MB, 128K seems your particular model.
> >>>
> >>
> >>  M2S010 SoC device has 256K eNMV. My bad it should be 256 instead of
> 128.
> >>  The board I have contains M2S010 device in SOM.
> >>
> >
> > What I mean here is on the SF2 the eNVM "region size" (as seen by the A=
HB
> > Bus) is 1MB. Now your SoC M2S010 provides 256KB in this dedicated 1M
> region.
> >
> > I find your #define confusing, what about:
> >
> > #define ENVM_REGION_SIZE      (1 * M_BYTE)
> > #define M2S010_ENVM_SIZE      (256 * K_BYTE)
> >
> > (?_BYTE from "qemu/cutils.h")
> >
> > I wanted to clarify this because you named your functions as it can
> models
> > any SF2 but actually you restrict it to your M2S010.
> >
> > Maybe to start you can rename msf2_soc_x() -> m2s010_sf2_soc_x() then i=
f
> > needed this can be generalized to other SoCs from SF2 family?
> >
> >>> +
> >>>>
> >>>> +#define DDR_BASE_ADDRESS      0xA0000000
> >>>> +#define DDR_SIZE              (64 * 1024 * 1024)
> >>>>
> >>>
> >>> This belongs to the SoM.
> >>> Yes will change it.
> >>>
> >>>> +
> >>>> +#define SRAM_BASE_ADDRESS     0x20000000
> >>>> +#define SRAM_SIZE             (64 * 1024)
> >>>>
> >>>
> >>> Indeed this SoC is designed to have up to 64K of SRAM.
> >>> Luckily your model provides 64K.
> >>>
> >>
> >>
> >> Yes it is 64k :)
> >>
> >
> > Same here, what you have is:
> >
> > #define ESRAM_REGION_SIZE     (64 * K_BYTE)
> > #define M2S010_ESRAM_SIZE     (64 * K_BYTE)
> >
> > which happens to be equal but does not mean the same, do you see the
> > difference?
> >
> >
> >> +
> >>>>
> >>>> +typedef struct MSF2State {
> >>>> +    /*< private >*/
> >>>> +    SysBusDevice parent_obj;
> >>>> +    /*< public >*/
> >>>> +
> >>>> +    ARMv7MState armv7m;
> >>>> +
> >>>> +    MSF2SysregState sysreg;
> >>>> +    MSF2TimerState timer;
> >>>> +    MSF2SpiState spi[MSF2_NUM_SPIS];
> >>>> +} MSF2State;
> >>>> +
> >>>> +#endif
>

--001a11c00c68075d71054f9e739d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Philippe and Alistair,<div class=3D"gmail_extra"><br><d=
iv class=3D"gmail_quote">On Mon, May 15, 2017 at 10:24 PM, Alistair Francis=
 <span dir=3D"ltr">&lt;<a href=3D"mailto:alistair23@gmail.com" target=3D"_b=
lank">alistair23@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">=C2=A0On Thu, May 11, 2017 at 10:02 PM, Philippe=
 Mathieu-Daud=C3=A9<br>
<div><div class=3D"gmail-h5">&lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@a=
msat.org</a>&gt; wrote:<br>
&gt; On 05/12/2017 12:17 AM, sundeep subbaraya wrote:<br>
&gt;&gt;<br>
&gt;&gt; Hi Philippe,<br>
&gt;&gt;<br>
&gt;&gt; On Wed, May 10, 2017 at 5:20 PM, Philippe Mathieu-Daud=C3=A9 &lt;<=
a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.org</a>&gt;<br>
&gt;&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt;&gt; Hi Subbaraya,<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; On 05/09/2017 01:44 PM, Subbaraya Sundeep wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Smartfusion2 SoC has hardened Microcontroller subsystem<br=
>
&gt;&gt;&gt;&gt; and flash based FPGA fabric. This patch adds support for<b=
r>
&gt;&gt;&gt;&gt; Microcontroller subsystem in the SoC.<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; Signed-off-by: Subbaraya Sundeep &lt;<a href=3D"mailto:sun=
deep.lkml@gmail.com">sundeep.lkml@gmail.com</a>&gt;<br>
&gt;&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;&gt;=C2=A0 default-configs/arm-softmmu.<wbr>mak |=C2=A0 =C2=A01=
 +<br>
&gt;&gt;&gt;&gt;=C2=A0 hw/arm/Makefile.objs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 |=C2=A0 =C2=A02 +-<br>
&gt;&gt;&gt;&gt;=C2=A0 hw/arm/msf2-soc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0| 188 ++++++++++++++++++++++++++++++<br>
&gt;&gt;&gt;&gt; ++++++++++<br>
&gt;&gt;&gt;&gt;=C2=A0 include/hw/arm/msf2-soc.h=C2=A0 =C2=A0 =C2=A0 =C2=A0=
|=C2=A0 60 +++++++++++++<br>
&gt;&gt;&gt;&gt;=C2=A0 4 files changed, 250 insertions(+), 1 deletion(-)<br=
>
&gt;&gt;&gt;&gt;=C2=A0 create mode 100644 hw/arm/msf2-soc.c<br>
&gt;&gt;&gt;&gt;=C2=A0 create mode 100644 include/hw/arm/msf2-soc.h<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; diff --git a/default-configs/arm-softmmu.<wbr>mak<br>
&gt;&gt;&gt;&gt; b/default-configs/arm-softmmu.<wbr>mak<br>
&gt;&gt;&gt;&gt; index 78d7af0..7062512 100644<br>
&gt;&gt;&gt;&gt; --- a/default-configs/arm-softmmu.<wbr>mak<br>
&gt;&gt;&gt;&gt; +++ b/default-configs/arm-softmmu.<wbr>mak<br>
&gt;&gt;&gt;&gt; @@ -122,3 +122,4 @@ CONFIG_ACPI=3Dy<br>
&gt;&gt;&gt;&gt;=C2=A0 CONFIG_SMBIOS=3Dy<br>
&gt;&gt;&gt;&gt;=C2=A0 CONFIG_ASPEED_SOC=3Dy<br>
&gt;&gt;&gt;&gt;=C2=A0 CONFIG_GPIO_KEY=3Dy<br>
&gt;&gt;&gt;&gt; +CONFIG_MSF2=3Dy<br>
&gt;&gt;&gt;&gt; diff --git a/hw/arm/Makefile.objs b/hw/arm/Makefile.objs<b=
r>
&gt;&gt;&gt;&gt; index 4c5c4ee..ae5e4a3 100644<br>
&gt;&gt;&gt;&gt; --- a/hw/arm/Makefile.objs<br>
&gt;&gt;&gt;&gt; +++ b/hw/arm/Makefile.objs<br>
&gt;&gt;&gt;&gt; @@ -1,7 +1,7 @@<br>
&gt;&gt;&gt;&gt;=C2=A0 obj-y +=3D boot.o collie.o exynos4_boards.o gumstix.=
o highbank.o<br>
&gt;&gt;&gt;&gt;=C2=A0 obj-$(CONFIG_DIGIC) +=3D digic_boards.o<br>
&gt;&gt;&gt;&gt;=C2=A0 obj-y +=3D integratorcp.o mainstone.o musicpal.o nse=
ries.o<br>
&gt;&gt;&gt;&gt; -obj-y +=3D omap_sx1.o palm.o realview.o spitz.o stellaris=
.o<br>
&gt;&gt;&gt;&gt; +obj-y +=3D omap_sx1.o palm.o realview.o spitz.o stellaris=
.o msf2-soc.o<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Not a big deal, but since you added CONFIG_MSF2 why not using =
it here and<br>
&gt;&gt;&gt; the Makefiles you touched (misc/ssi/timer)?<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; obj-$(CONFIG_MSF2) +=3D msf2-soc.o<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 =C2=A0OK. Will change it.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 obj-y +=3D tosa.o versatilepb.o vexpress.o virt.o xilinx=
_zynq.o z2.o<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt;=C2=A0 obj-$(CONFIG_ACPI) +=3D virt-acpi-build.o<br>
&gt;&gt;&gt;&gt;=C2=A0 obj-y +=3D netduino2.o<br>
&gt;<br>
&gt; [...]<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 MemoryRegion *system_memory =3D get_system_=
memory();<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 MemoryRegion *nvm =3D g_new(MemoryRegion, 1=
);<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 MemoryRegion *nvm_alias =3D g_new(MemoryReg=
ion, 1);<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 MemoryRegion *sram =3D g_new(MemoryRegion, =
1);<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 MemoryRegion *ddr =3D g_new(MemoryRegion, 1=
);<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 memory_region_init_ram(nvm, NULL, &quot;MSF=
2.envm&quot;, ENVM_SIZE,<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;error_fatal);<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Maybe you can name it &quot;eNVM&quot; to match the documentat=
ion.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Also envm_size should be a per-model property.<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Ok.<br>
&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 memory_region_init_alias(nvm_<wbr>alias, NULL, =
&quot;MSF2.flash.alias&quot;,<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0nvm, 0, ENVM_SIZE);<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Hmmm well this would be the &quot;Cache Matrix Remap&quot; whi=
ch happens to be<br>
&gt;&gt;&gt; mapped by default to eNVM on cold reset.<br>
&gt;&gt;&gt; Naming it &quot;MSF2.flash.alias&quot; is pretty confusing.<br=
>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Exactly it is Cache Matrix Remap.<br>
&gt;&gt; AFAIK currently we cannot remap memory during runtime in Qemu.<br>
&gt;&gt; So I handled default remap with alias.<br>
&gt;&gt; Please suggest the name. MSF2.eNVM.alias sounds fine?<br>
&gt;<br>
&gt;<br>
&gt; Hmm Peter, Francis?<br>
&gt;<br>
&gt; Personally I prefer &quot;bus_remap.alias&quot; which is explicit.<br>
&gt;<br>
&gt; &quot;eNVM.alias&quot; is only true on Cold Reset.<br>
<br>
</div></div>Yeah, I&#39;m pretty sure you can&#39;t remap memory (unless th=
at is some new<br>
feature I missed).<br>
<br>
Creating an alias seems like the right idea (you can even<br>
enable/disable it as needed to pretend we have dynamic remapping).<br>
<br>
As for names usually just copy the data sheet. MSF2.eNVM.alias sounds<br>
fine to me.<br></blockquote><div><br></div><div>I will let it be MSF2.eNVM.=
alias and add comment about default remapping on reset.</div><div><br></div=
><div>Thanks,</div><div>Sundeep=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
<br>
Thanks,<br>
<br>
Alistair<br>
<div class=3D"gmail-HOEnZb"><div class=3D"gmail-h5"><br>
&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 vmstate_register_ram_global(<wbr>nvm);<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 memory_region_set_readonly(<wbr>nvm, true);=
<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 memory_region_set_readonly(<wbr>nvm_alias, =
true);<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 memory_region_add_subregion(<wbr>system_mem=
ory, ENVM_BASE_ADDRESS, nvm);<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 memory_region_add_subregion(<wbr>system_mem=
ory, 0, nvm_alias);<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 memory_region_init_ram(ddr, NULL, &quot;MSF=
2.ddr&quot;, DDR_SIZE,<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;error_fatal);<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Wrong, there is no DDR on this SoC.<br>
&gt;&gt;&gt;<br>
&gt;&gt; DDR controller is there in Smartfusion2 (different from Smartfusio=
n). As<br>
&gt;&gt; you said below this<br>
&gt;&gt; should be in board file.<br>
&gt;<br>
&gt;<br>
&gt; There IS a DDRC in this SoC, but here you are registering a DDR &#39;r=
am&#39; memory<br>
&gt; region, not a controller. This SoC can be used without any DDR, enough=
 using<br>
&gt; embedded eNVM and eSRAM.<br>
&gt;<br>
&gt; Now it happens your SoM board provides a DDR chip connected to this So=
C.<br>
&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 vmstate_register_ram_global(<wbr>ddr);<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 memory_region_add_subregion(<wbr>system_mem=
ory, DDR_BASE_ADDRESS, ddr);<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 memory_region_init_ram(sram, NULL, &quot;MS=
F2.sram&quot;, SRAM_SIZE,<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;error_fatal);<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I&#39;d rather like to see it named &quot;eSRAM&quot; somehow,=
 so there is no confusion<br>
&gt;&gt;&gt; possible with external SRAM a SoM/board can map at 0x60000000.=
<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Same comment than envm_size, sram_size should be a per-model p=
roperty.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; OK<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;&gt; +=C2=A0 =C2=A0 vmstate_register_ram_global(<wbr>sram);<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 memory_region_add_subregion(<wbr>system_mem=
ory, SRAM_BASE_ADDRESS,<br>
&gt;&gt;&gt;&gt; sram);<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 armv7m =3D DEVICE(&amp;s-&gt;armv7m);<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 qdev_prop_set_uint32(armv7m, &quot;num-irq&=
quot;, 96);<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Can you point me to your datasheet? I thought the SF2 had 240 =
IRQs.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Please go to link:<br>
&gt;&gt; <a href=3D"https://www.microsemi.com/document-portal/search_form" =
rel=3D"noreferrer" target=3D"_blank">https://www.microsemi.com/<wbr>documen=
t-portal/search_form</a><br>
&gt;&gt; and provide search keyword as &quot;UG0331&quot;. You can the down=
load the spec.<br>
&gt;&gt; It has 81 irqs I remember when I have given 81 qemu complained not=
<br>
&gt;&gt; multiple<br>
&gt;&gt; of 4.<br>
&gt;&gt; I checked again with 81 and it is fine. I will change it to 81.<br=
>
&gt;<br>
&gt;<br>
&gt; Ok :)<br>
&gt;<br>
&gt;&gt; +=C2=A0 =C2=A0 qdev_prop_set_string(armv7m, &quot;cpu-model&quot;,=
 &quot;cortex-m3&quot;);<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 object_property_set_link(<wbr>OBJECT(&amp;s=
-&gt;armv7m),<br>
&gt;&gt;&gt;&gt; OBJECT(get_system_memory()),<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot;memory&quot;, &amp;error_abort);<br>
&gt;<br>
&gt; [...]<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; +#define MSF2_NUM_SPIS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02<=
br>
&gt;&gt;&gt;&gt; +#define MSF2_NUM_UARTS=C2=A0 =C2=A0 =C2=A0 =C2=A0 2<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt; +#define ENVM_BASE_ADDRESS=C2=A0 =C2=A0 =C2=A00x60000000<b=
r>
&gt;&gt;&gt;&gt; +#define ENVM_SIZE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(128 * 1024)<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; The SoC design ENVM_SIZE is 1MB, 128K seems your particular mo=
del.<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 M2S010 SoC device has 256K eNMV. My bad it should be 256 ins=
tead of 128.<br>
&gt;&gt;=C2=A0 The board I have contains M2S010 device in SOM.<br>
&gt;&gt;<br>
&gt;<br>
&gt; What I mean here is on the SF2 the eNVM &quot;region size&quot; (as se=
en by the AHB<br>
&gt; Bus) is 1MB. Now your SoC M2S010 provides 256KB in this dedicated 1M r=
egion.<br>
&gt;<br>
&gt; I find your #define confusing, what about:<br>
&gt;<br>
&gt; #define ENVM_REGION_SIZE=C2=A0 =C2=A0 =C2=A0 (1 * M_BYTE)<br>
&gt; #define M2S010_ENVM_SIZE=C2=A0 =C2=A0 =C2=A0 (256 * K_BYTE)<br>
&gt;<br>
&gt; (?_BYTE from &quot;qemu/cutils.h&quot;)<br>
&gt;<br>
&gt; I wanted to clarify this because you named your functions as it can mo=
dels<br>
&gt; any SF2 but actually you restrict it to your M2S010.<br>
&gt;<br>
&gt; Maybe to start you can rename msf2_soc_x() -&gt; m2s010_sf2_soc_x() th=
en if<br>
&gt; needed this can be generalized to other SoCs from SF2 family?<br>
&gt;<br>
&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; +#define DDR_BASE_ADDRESS=C2=A0 =C2=A0 =C2=A0 0xA0000000<b=
r>
&gt;&gt;&gt;&gt; +#define DDR_SIZE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 (64 * 1024 * 1024)<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; This belongs to the SoM.<br>
&gt;&gt;&gt; Yes will change it.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt; +#define SRAM_BASE_ADDRESS=C2=A0 =C2=A0 =C2=A00x20000000<b=
r>
&gt;&gt;&gt;&gt; +#define SRAM_SIZE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0(64 * 1024)<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Indeed this SoC is designed to have up to 64K of SRAM.<br>
&gt;&gt;&gt; Luckily your model provides 64K.<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Yes it is 64k :)<br>
&gt;&gt;<br>
&gt;<br>
&gt; Same here, what you have is:<br>
&gt;<br>
&gt; #define ESRAM_REGION_SIZE=C2=A0 =C2=A0 =C2=A0(64 * K_BYTE)<br>
&gt; #define M2S010_ESRAM_SIZE=C2=A0 =C2=A0 =C2=A0(64 * K_BYTE)<br>
&gt;<br>
&gt; which happens to be equal but does not mean the same, do you see the<b=
r>
&gt; difference?<br>
&gt;<br>
&gt;<br>
&gt;&gt; +<br>
&gt;&gt;&gt;&gt;<br>
&gt;&gt;&gt;&gt; +typedef struct MSF2State {<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 /*&lt; private &gt;*/<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 SysBusDevice parent_obj;<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 /*&lt; public &gt;*/<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 ARMv7MState armv7m;<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 MSF2SysregState sysreg;<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 MSF2TimerState timer;<br>
&gt;&gt;&gt;&gt; +=C2=A0 =C2=A0 MSF2SpiState spi[MSF2_NUM_SPIS];<br>
&gt;&gt;&gt;&gt; +} MSF2State;<br>
&gt;&gt;&gt;&gt; +<br>
&gt;&gt;&gt;&gt; +#endif<br>
</div></div></blockquote></div><br></div></div>

--001a11c00c68075d71054f9e739d--
