Received: by 10.25.159.131 with SMTP id i125csp1462246lfe;
        Mon, 5 Dec 2016 01:57:44 -0800 (PST)
X-Received: by 10.55.4.134 with SMTP id 128mr48828739qke.281.1480931864611;
        Mon, 05 Dec 2016 01:57:44 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h64si8517834qtd.325.2016.12.05.01.57.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Dec 2016 01:57:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:38759 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cDq1n-0005Z9-TO
	for alex.bennee@linaro.org; Mon, 05 Dec 2016 04:57:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36298)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mar.krzeminski@gmail.com>) id 1cDq1e-0005UJ-Ej
	for qemu-arm@nongnu.org; Mon, 05 Dec 2016 04:57:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mar.krzeminski@gmail.com>) id 1cDq1c-0000Qm-OD
	for qemu-arm@nongnu.org; Mon, 05 Dec 2016 04:57:34 -0500
Received: from mail-ua0-x243.google.com ([2607:f8b0:400c:c08::243]:34066)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mar.krzeminski@gmail.com>)
	id 1cDq1Y-0000Q8-Lo; Mon, 05 Dec 2016 04:57:28 -0500
Received: by mail-ua0-x243.google.com with SMTP id b35so31162307uaa.1;
	Mon, 05 Dec 2016 01:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=z/f5qnXYHvxqrrGcOT7J4+fRzygHAAzrNOC0nHzlQt0=;
	b=huPQkgYhnnFXKXmSGSIStT1P3lqerohxWFucHAbsSNu3gbBbyQTfTyd/yF+cG2vQdW
	SjkTZIaOyaHG8+W4322ny32iwLpv0GD7oT+i6PTRE+aroc2VoCUtOOFYm/HirMzgNhbW
	ZIceA1vVX1pOeZyuMM4DBv9p2sOhjMuY36En6FnWJC9G3xOpG5z3dQqyCVo6FhrlgW7N
	mTbbVJOMY37Ln0fjnlGqM425kv6DDRjkhEnVng/dNiZUFLiBHLtvLTJ+G6Hkql2gxT/n
	TnQx6q2S2fc8N9AtTCNFpBRM/lJSaNKZsAC5GtNQ+Q9yRw12VwSdz5xS+ObTPJLUAxOJ
	w0FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=z/f5qnXYHvxqrrGcOT7J4+fRzygHAAzrNOC0nHzlQt0=;
	b=Y7WvJqQAb/VXWtd9O7iqOkU07XQUSk8WpY0uWEJbUZtolizCdt+PDcbK6MvSzrvpVj
	6tLc+C4XkHUAxzkYBcci3urXE+2nevUOBquTnWuV8zN/MabwG3+TxtQpY/WytWrf5Arl
	e8PPNYtIvo3kl/r0PJzPmysYXbaiaUX+Dej+gfTip98ZWIlhInObxgDeNliJSJcF/0mS
	z5QClXxG1Om9GUd9Z13lMzmHIuZcuAgmYMSjHmYbon9BPP6ZWR2kRUwqoa2wpxrGGO1m
	2uaEiOZYy31Y2GzmYI05blxsNdgsubMo8XifxudGdhi+juxsqWTvIfVhQREOH3ClZJ2X
	jIYg==
X-Gm-Message-State: AKaTC01+ITmo5u0nS/QD9yALf1YVHAyhegBqzseAHgfPMTbrkhMv5Pcl65LMTJsqkf2nXh19JbvbE+AsE2UV6g==
X-Received: by 10.176.83.100 with SMTP id y33mr41962904uay.130.1480931847918; 
	Mon, 05 Dec 2016 01:57:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.4.81 with HTTP; Mon, 5 Dec 2016 01:57:27 -0800 (PST)
In-Reply-To: <f28b693f-dade-b338-cc86-b5e85f8b1675@kaod.org>
References: <1480434248-27138-1-git-send-email-clg@kaod.org>
	<1480434248-27138-25-git-send-email-clg@kaod.org>
	<4e2db842-7ff6-d7e7-c96c-26ce9c563c83@gmail.com>
	<f28b693f-dade-b338-cc86-b5e85f8b1675@kaod.org>
From: =?UTF-8?Q?Marcin_Krzemi=C5=84ski?= <mar.krzeminski@gmail.com>
Date: Mon, 5 Dec 2016 10:57:27 +0100
Message-ID: <CABc_YGCweFyD8+tZf32_AM6YYYcFWtZS3ejb2A_cUMi0LCsZ0A@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: multipart/alternative; boundary=94eb2c192480bb59210542e6509c
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c08::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH for-2.9 24/30] aspeed: use first
 SPI flash as a boot ROM
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
	Marcin Krzeminski <marcin.krzeminski@nokia.com>,
	Andrew Jeffery <andrew@aj.id.au>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 20b12Q4+MY6b

--94eb2c192480bb59210542e6509c
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2016-12-05 10:36 GMT+01:00 C=C3=A9dric Le Goater <clg@kaod.org>:

> Hello Marcin,
>
> On 12/04/2016 06:00 PM, mar.krzeminski wrote:
> > Hi Cedric,
> >
> > it looks like good idea for now to handle boot from flash.
> > As I understand you are trying to omit bootrom code in Qemu model?
>
> I suppose you mean handling a romd memory region under the m25p80
> object ?
>
It could be that I mess up everything because my understanding how the real
HW
work and boot is wrong. Please correct my assumptions:
1. You are setting boot source to spi-nor (jumper, resistor whatever)
2. There is a small bootrom in SoC (not u-boot) that set eg. reset vector,
configure SMC
and start execude code from flash.
3. Memory mapped flash content is at address 0x1c000000.


>
> > This could lead you to some hacks in device models (eg SMC).
>
> I haven't had to, yet.
>
> > W dniu 29.11.2016 o 16:44, C=C3=A9dric Le Goater pisze:
> >> Fill a ROM region with the flash content to support U-Boot. This is a
> >> little hacky but until we can boot from a MMIO region, it seems
> >> difficult to do anything else.
> >>
> >> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> >> Reviewed-by: Joel Stanley <joel@jms.id.au>
> >> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
> >> ---
> >>  hw/arm/aspeed.c | 41 +++++++++++++++++++++++++++++++++++++++++
> >>  1 file changed, 41 insertions(+)
> >>
> >> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> >> index 40c13838fb2d..a92c2f1c362b 100644
> >> --- a/hw/arm/aspeed.c
> >> +++ b/hw/arm/aspeed.c
> >> @@ -20,6 +20,8 @@
> >>  #include "qemu/log.h"
> >>  #include "sysemu/block-backend.h"
> >>  #include "sysemu/blockdev.h"
> >> +#include "hw/loader.h"
> >> +#include "qemu/error-report.h"
> >>
> >>  static struct arm_boot_info aspeed_board_binfo =3D {
> >>      .board_id =3D -1, /* device-tree-only board */
> >> @@ -104,6 +106,28 @@ static const AspeedBoardConfig aspeed_boards[] =
=3D {
> >>      },
> >>  };
> >>
> >> +#define FIRMWARE_ADDR 0x0
> >> +
> >> +static void write_boot_rom(DriveInfo *dinfo, hwaddr addr, size_t
> rom_size,
> >> +                           Error **errp)
> >> +{
> >> +    BlockBackend *blk =3D blk_by_legacy_dinfo(dinfo);
> >> +    uint8_t *storage;
> >> +
> >> +    if (rom_size > blk_getlength(blk)) {
> >> +        rom_size =3D blk_getlength(blk);
> >> +    }
> > I was not able to attach smaller file as m25p80 storage.
>
> yes that's most probably because m25p80_realize() does :
>
>        if (blk_pread(s->blk, 0, s->storage, s->size) !=3D s->size) {
>             error_setg(errp, "failed to read the initial flash content");
>             return;
>         }
>
> my bad. May be, we could relax a bit the test and allow smaller block
> backends ?
>

I think not, if you have fs on flash (eg. UBI) and smaller image fs will
not mount,
or in worse case you can issue writes outside the file.

>
>
> >> +
> >> +    storage =3D g_new0(uint8_t, rom_size);
> >> +    if (blk_pread(blk, 0, storage, rom_size) < 0) {
> >> +        error_setg(errp, "failed to read the initial flash content");
> >> +        return;
> >> +    }
> >> +
> >> +    rom_add_blob_fixed("aspeed.boot_rom", storage, rom_size, addr);
> >> +    g_free(storage);
> >> +}
> >> +
> >>  static void aspeed_board_init_flashes(AspeedSMCState *s, const char
> *flashtype,
> >>                                        Error **errp)
> >>  {
> >> @@ -135,6 +159,7 @@ static void aspeed_board_init(MachineState *machin=
e,
> >>  {
> >>      AspeedBoardState *bmc;
> >>      AspeedSoCClass *sc;
> >> +    DriveInfo *drive0 =3D drive_get(IF_MTD, 0, 0);
> >>
> >>      bmc =3D g_new0(AspeedBoardState, 1);
> >>      object_initialize(&bmc->soc, (sizeof(bmc->soc)), cfg->soc_name);
> >> @@ -168,6 +193,22 @@ static void aspeed_board_init(MachineState
> *machine,
> >>      aspeed_board_init_flashes(&bmc->soc.fmc, cfg->fmc_model,
> &error_abort);
> >>      aspeed_board_init_flashes(&bmc->soc.spi[0], cfg->spi_model,
> &error_abort);
> >>
> >> +    /* Install first FMC flash content as a boot rom. */
> >> +    if (drive0) {
> >> +        AspeedSMCFlash *fl =3D &bmc->soc.fmc.flashes[0];
> >> +        MemoryRegion *boot_rom =3D g_new(MemoryRegion, 1);
> >> +
> >> +        /*
> >> +         * create a ROM region using the default mapping window size =
of
> >> +         * the flash module.
> >> +         */
> >> +        memory_region_init_rom(boot_rom, OBJECT(bmc),
> "aspeed.boot_rom",
> >> +                               fl->size, &error_abort);
> >> +        memory_region_add_subregion(get_system_memory(),
> FIRMWARE_ADDR,
> >> +                                    boot_rom);
> >> +        write_boot_rom(drive0, FIRMWARE_ADDR, fl->size, &error_abort)=
;
> >
> > Is it possible that fl->size will be bigger than segment size?
> >
> > I think max_size here should be segment size in smc.
>
> I am not sure what you mean by "segment" ?
>
> fl->size holds the default mapping window size on the AHB bus of the
> flash chip CS0. The size can be changed by the guest using the segment
> address registers but for CS0 this should be "autoconfigured" by HW.
>

This is exactly what i meant, I was thinking that fl->size is the size of
the whole flash,
not the size of memory mapped part.

>
> Here, we are just using the default from the specs but we could go a
> little further in the model and setup the mapping window size of CS0
> using the block backend size, and set up the segment registers accordingl=
y.
> There are some checks to be done. It might be a little complex.
>

I do not think there is a reason for doing that yet :)

Thanks,
Marcin

>
> Thanks,
>
> C.
>
>
> > Thanks,
> > Marcin
> >> +    }
> >> +
> >>      aspeed_board_binfo.kernel_filename =3D machine->kernel_filename;
> >>      aspeed_board_binfo.initrd_filename =3D machine->initrd_filename;
> >>      aspeed_board_binfo.kernel_cmdline =3D machine->kernel_cmdline;
> >
>
>

--94eb2c192480bb59210542e6509c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><div class=3D"gmail_quote">=
2016-12-05 10:36 GMT+01:00 C=C3=A9dric Le Goater <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:clg@kaod.org" target=3D"_blank">clg@kaod.org</a>&gt;</span>:<=
br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:soli=
d;padding-left:1ex">Hello Marcin,<br>
<span class=3D"gmail-"><br>
On 12/04/2016 06:00 PM, mar.krzeminski wrote:<br>
&gt; Hi Cedric,<br>
&gt;<br>
&gt; it looks like good idea for now to handle boot from flash.<br>
&gt; As I understand you are trying to omit bootrom code in Qemu model?<br>
<br>
</span>I suppose you mean handling a romd memory region under the m25p80<br=
>
object ?<br></blockquote><div>It could be that I mess up everything because=
 my understanding how the real HW</div><div>work and boot is wrong. Please =
correct my assumptions:</div><div>1. You are setting boot source to spi-nor=
 (jumper, resistor whatever)</div><div>2. There is a small bootrom in SoC (=
not u-boot) that set eg. reset vector, configure SMC</div><div>and start ex=
ecude code from flash.</div><div>3. Memory mapped flash content is at addre=
ss 0x1c000000.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(2=
04,204,204);border-left-style:solid;padding-left:1ex">
<span class=3D"gmail-"><br>
&gt; This could lead you to some hacks in device models (eg SMC).<br>
<br>
</span>I haven&#39;t had to, yet.<br>
<div><div class=3D"gmail-h5"><br>
&gt; W dniu 29.11.2016 o 16:44, C=C3=A9dric Le Goater pisze:<br>
&gt;&gt; Fill a ROM region with the flash content to support U-Boot. This i=
s a<br>
&gt;&gt; little hacky but until we can boot from a MMIO region, it seems<br=
>
&gt;&gt; difficult to do anything else.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: C=C3=A9dric Le Goater &lt;<a href=3D"mailto:clg@kao=
d.org">clg@kaod.org</a>&gt;<br>
&gt;&gt; Reviewed-by: Joel Stanley &lt;<a href=3D"mailto:joel@jms.id.au">jo=
el@jms.id.au</a>&gt;<br>
&gt;&gt; Reviewed-by: Andrew Jeffery &lt;<a href=3D"mailto:andrew@aj.id.au"=
>andrew@aj.id.au</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 hw/arm/aspeed.c | 41 ++++++++++++++++++++++++++++++<wbr>++++=
+++++++<br>
&gt;&gt;=C2=A0 1 file changed, 41 insertions(+)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c<br>
&gt;&gt; index 40c13838fb2d..a92c2f1c362b 100644<br>
&gt;&gt; --- a/hw/arm/aspeed.c<br>
&gt;&gt; +++ b/hw/arm/aspeed.c<br>
&gt;&gt; @@ -20,6 +20,8 @@<br>
&gt;&gt;=C2=A0 #include &quot;qemu/log.h&quot;<br>
&gt;&gt;=C2=A0 #include &quot;sysemu/block-backend.h&quot;<br>
&gt;&gt;=C2=A0 #include &quot;sysemu/blockdev.h&quot;<br>
&gt;&gt; +#include &quot;hw/loader.h&quot;<br>
&gt;&gt; +#include &quot;qemu/error-report.h&quot;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 static struct arm_boot_info aspeed_board_binfo =3D {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 .board_id =3D -1, /* device-tree-only board */=
<br>
&gt;&gt; @@ -104,6 +106,28 @@ static const AspeedBoardConfig aspeed_boards[=
] =3D {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 },<br>
&gt;&gt;=C2=A0 };<br>
&gt;&gt;<br>
&gt;&gt; +#define FIRMWARE_ADDR 0x0<br>
&gt;&gt; +<br>
&gt;&gt; +static void write_boot_rom(DriveInfo *dinfo, hwaddr addr, size_t =
rom_size,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Error **errp)<br>
&gt;&gt; +{<br>
&gt;&gt; +=C2=A0 =C2=A0 BlockBackend *blk =3D blk_by_legacy_dinfo(dinfo);<b=
r>
&gt;&gt; +=C2=A0 =C2=A0 uint8_t *storage;<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 if (rom_size &gt; blk_getlength(blk)) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 rom_size =3D blk_getlength(blk);<br>
&gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt; I was not able to attach smaller file as m25p80 storage.<br>
<br>
</div></div>yes that&#39;s most probably because m25p80_realize() does :<br=
>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0if (blk_pread(s-&gt;blk, 0, s-&gt;storage, s-&gt=
;size) !=3D s-&gt;size) {<br>
<span class=3D"gmail-">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg=
(errp, &quot;failed to read the initial flash content&quot;);<br>
</span>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
my bad. May be, we could relax a bit the test and allow smaller block<br>
backends ?<br></blockquote><div>=C2=A0</div><div>I think not, if you have f=
s on flash (eg. UBI) and smaller image fs will not mount,</div><div>or in w=
orse case you can issue writes outside the file.=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;=
border-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex=
">
<div><div class=3D"gmail-h5"><br>
<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 storage =3D g_new0(uint8_t, rom_size);<br>
&gt;&gt; +=C2=A0 =C2=A0 if (blk_pread(blk, 0, storage, rom_size) &lt; 0) {<=
br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_setg(errp, &quot;failed to read=
 the initial flash content&quot;);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
&gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 rom_add_blob_fixed(&quot;aspeed.<wbr>boot_rom&quot;=
, storage, rom_size, addr);<br>
&gt;&gt; +=C2=A0 =C2=A0 g_free(storage);<br>
&gt;&gt; +}<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 static void aspeed_board_init_flashes(<wbr>AspeedSMCState *s=
, const char *flashtype,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 E=
rror **errp)<br>
&gt;&gt;=C2=A0 {<br>
&gt;&gt; @@ -135,6 +159,7 @@ static void aspeed_board_init(MachineState *ma=
chine,<br>
&gt;&gt;=C2=A0 {<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 AspeedBoardState *bmc;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 AspeedSoCClass *sc;<br>
&gt;&gt; +=C2=A0 =C2=A0 DriveInfo *drive0 =3D drive_get(IF_MTD, 0, 0);<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 bmc =3D g_new0(AspeedBoardState, 1);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 object_initialize(&amp;bmc-&gt;soc, (sizeof(bm=
c-&gt;soc)), cfg-&gt;soc_name);<br>
&gt;&gt; @@ -168,6 +193,22 @@ static void aspeed_board_init(MachineState *m=
achine,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 aspeed_board_init_flashes(&amp;<wbr>bmc-&gt;so=
c.fmc, cfg-&gt;fmc_model, &amp;error_abort);<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 aspeed_board_init_flashes(&amp;<wbr>bmc-&gt;so=
c.spi[0], cfg-&gt;spi_model, &amp;error_abort);<br>
&gt;&gt;<br>
&gt;&gt; +=C2=A0 =C2=A0 /* Install first FMC flash content as a boot rom. *=
/<br>
&gt;&gt; +=C2=A0 =C2=A0 if (drive0) {<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 AspeedSMCFlash *fl =3D &amp;bmc-&gt;s=
oc.fmc.flashes[0];<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 MemoryRegion *boot_rom =3D g_new(Memo=
ryRegion, 1);<br>
&gt;&gt; +<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* create a ROM region using the=
 default mapping window size of<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* the flash module.<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 memory_region_init_rom(boot_<wbr>rom,=
 OBJECT(bmc), &quot;aspeed.boot_rom&quot;,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fl-&gt;size, &amp;error_abo=
rt);<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 memory_region_add_subregion(<wbr>get_=
system_memory(), FIRMWARE_ADDR,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 boot_rom);<b=
r>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 write_boot_rom(drive0, FIRMWARE_ADDR,=
 fl-&gt;size, &amp;error_abort);<br>
&gt;<br>
&gt; Is it possible that fl-&gt;size will be bigger than segment size?<br>
&gt;<br>
&gt; I think max_size here should be segment size in smc.<br>
<br>
</div></div>I am not sure what you mean by &quot;segment&quot; ?<br>
<br>
fl-&gt;size holds the default mapping window size on the AHB bus of the<br>
flash chip CS0. The size can be changed by the guest using the segment<br>
address registers but for CS0 this should be &quot;autoconfigured&quot; by =
HW.<br></blockquote><div><br></div><div>This is exactly what i meant, I was=
 thinking that fl-&gt;size is the size of the whole flash,</div><div>not th=
e size of memory mapped part.</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(20=
4,204,204);border-left-style:solid;padding-left:1ex">
<br>
Here, we are just using the default from the specs but we could go a<br>
little further in the model and setup the mapping window size of CS0<br>
using the block backend size, and set up the segment registers accordingly.=
<br>
There are some checks to be done. It might be a little complex.<br></blockq=
uote><div><br></div><div>I do not think there is a reason for doing that ye=
t :)</div><div><br></div><div>Thanks,</div><div>Marcin</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;=
border-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex=
">
<br>
Thanks,<br>
<br>
C.<br>
<div class=3D"gmail-HOEnZb"><div class=3D"gmail-h5"><br>
<br>
&gt; Thanks,<br>
&gt; Marcin<br>
&gt;&gt; +=C2=A0 =C2=A0 }<br>
&gt;&gt; +<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 aspeed_board_binfo.kernel_<wbr>filename =3D ma=
chine-&gt;kernel_filename;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 aspeed_board_binfo.initrd_<wbr>filename =3D ma=
chine-&gt;initrd_filename;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 aspeed_board_binfo.kernel_<wbr>cmdline =3D mac=
hine-&gt;kernel_cmdline;<br>
&gt;<br>
<br>
</div></div></blockquote></div><br></div></div>

--94eb2c192480bb59210542e6509c--
