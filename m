Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1074709lfq;
        Sat, 12 Sep 2020 15:25:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxVAKLE+BXH0KKp0upaO2ynS2nM5mx+i2fHe0llKalte025prG2aCVoHTfBIdJ/97WB3aOF
X-Received: by 2002:a25:61cd:: with SMTP id v196mr11761150ybb.103.1599949527328;
        Sat, 12 Sep 2020 15:25:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599949527; cv=none;
        d=google.com; s=arc-20160816;
        b=NLogytYHYXMFRYBac5uLZ4Ryiujbb5r32GmIv74vfbYRjchAdj8Rw166knm5ddUsfC
         JfFlCg6Ai4xD6fQfMPrjX4Vfa7toaoJG90nSyc0BExR/rWGmXqRYs/ZGJNWhsaUyHvm4
         k+u1jJ9psW+ZRjSV6XvIv2FIQ5TieonV3QZTI4Fp6oXBUyYsESamPxc5o6FsAoXol10I
         r/qmfKNry8yoBjBqcaUwnPIca9O84h6M0JCI1bBmeQkNONLvZyvOvZ4WhO+mfNqGkKnr
         kBVehasHqCpR2SzDVBIlgtEqKiFBiWoAtumK8lGMLQSybuXyiJ2kpRdPB04eD+FNQ2Rx
         FZ5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=ZGaX7CsCAWtERESwHJLWurSNk7QjKSPOqUNldqXNN+8=;
        b=ZCtgX+tCCpvgMD9LD8ELHDqi7Z0r3dblRSV4cFKc73mM1XkX8eogXETmJ1qg95tWus
         qfQg24tWtSHI2IUqa6vzgWBZq6n24SWBzjj6IySPmt1PEFNFTYtVkIB+gKLdbC2Elhrq
         uX+QspLxCOT7QkVGok5UP4n4kEUsdoVgv6KmZIWtfrIIuz8qmZKptkK/rbkdHPbjO+LW
         P00REco3DnNE76M0r4BDI+e2HudXkOGyg0PJCUbRKsS2JbDKwQcFEDECbP/VBX2Cn/ij
         9d3J4+yoodX74JfHRSu35GLp4B6P3ALal8IlRptFLvFr71PD4JkuinV+ZZ1HLy8cpRjj
         dCqg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=HsjCNrKr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d80si5839902ybh.392.2020.09.12.15.25.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 12 Sep 2020 15:25:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=HsjCNrKr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:46922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kHDxW-0006ph-MK
	for alex.bennee@linaro.org; Sat, 12 Sep 2020 18:25:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1kHDxN-0006pS-Dw
 for qemu-arm@nongnu.org; Sat, 12 Sep 2020 18:25:17 -0400
Received: from mail-ua1-x944.google.com ([2607:f8b0:4864:20::944]:42639)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1kHDxL-0002Ec-5A
 for qemu-arm@nongnu.org; Sat, 12 Sep 2020 18:25:17 -0400
Received: by mail-ua1-x944.google.com with SMTP id w23so4130725uam.9
 for <qemu-arm@nongnu.org>; Sat, 12 Sep 2020 15:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZGaX7CsCAWtERESwHJLWurSNk7QjKSPOqUNldqXNN+8=;
 b=HsjCNrKrg1lOg8ickXxcAAbpkMteeXxOwnqnjlxRChB5fxpChvMGfykP/rkNGlA2g+
 BR8OVCC35K1a7FAK/wcN1P07I3pMVEDZ/mwkArN+ual6kcIa2+YgPfeyAk2KQlTtLMvP
 HXUyiktDbIEuzpxX8xZHqgR97+Kvxl88KmtUupo95CzLSEcYhy9v7n6sYDh0CUAF8MP+
 f4kW6GgKVyOTYtxigiNlKnsWeqFwZxpxn18E8TCadYCyem8MNTiFowmVqzanztc2paHu
 0GuvwPTGRy/AqiCkmBznPoIoFC4QGqF0F1bQRO+nLFo7xxssn0D+tE+a7wVQeYsmKJYZ
 wUKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZGaX7CsCAWtERESwHJLWurSNk7QjKSPOqUNldqXNN+8=;
 b=ZG/j5bQp7nlFgrHqtTjkcHtQN3QCnlaTwhm8YNk3Qej/U5qK36cTnIRV3JtNLSQJ31
 vniG97XpR16aAoNzQZpNcK3u0m+BbqIMp2yKgz6ELLyNgaJ+f1U/uJ/diNd9khVQDF/t
 sKtgFm+IbdyeH2iir+573zLsMCEJSnaQqiO7fYBc81mKagBmW1pBmdNmRHZCPHs0Oq7p
 63SdeiZIZ78f8B13hnHMIQ6sAzWI2xop7po/z2JreQ3uGemS56IHG4ZPCg7pigSB5eN8
 z0NhToquArOBKDSIdDHDPzjY6XDX+KM2dmaOrRhbqfN4K7jQvB4dBVAMHGJjh97lS9yY
 3HJg==
X-Gm-Message-State: AOAM5303tYf1Ockg6b4bOVRHITUMJKO5DlaKn95gz2NdRa5MbNWhuVEp
 wlUuQiO1QzW/CK3a9q90821ZwWQAaR7yRZmFFM8QJw==
X-Received: by 2002:ab0:2904:: with SMTP id v4mr4017866uap.15.1599949511811;
 Sat, 12 Sep 2020 15:25:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200911052101.2602693-1-hskinnemoen@google.com>
 <20200911052101.2602693-12-hskinnemoen@google.com>
 <e852efda-b8d9-0e41-8b1b-ed7cb01e7f51@amsat.org>
In-Reply-To: <e852efda-b8d9-0e41-8b1b-ed7cb01e7f51@amsat.org>
From: Havard Skinnemoen <hskinnemoen@google.com>
Date: Sat, 12 Sep 2020 15:24:58 -0700
Message-ID: <CAFQmdRbjH7=6VE=dDVNmKGenHoseKnNNr3SLcQojo0doS+gT7Q@mail.gmail.com>
Subject: Re: [PATCH v9 11/14] hw/arm: Wire up BMC boot flash for npcm750-evb
 and quanta-gsj
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
 QEMU Developers <qemu-devel@nongnu.org>,
 IS20 Avi Fishman <Avi.Fishman@nuvoton.com>, 
 CS20 KFTing <kfting@nuvoton.com>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: multipart/alternative; boundary="0000000000004fdb6d05af2546eb"
Received-SPF: pass client-ip=2607:f8b0:4864:20::944;
 envelope-from=hskinnemoen@google.com; helo=mail-ua1-x944.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cjZBxDaoRiKQ

--0000000000004fdb6d05af2546eb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 11, 2020 at 5:46 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g>
wrote:

>
>
> On 9/11/20 7:20 AM, Havard Skinnemoen via wrote:
> > This allows these NPCM7xx-based boards to boot from a flash image, e.g.
> > one built with OpenBMC. For example like this:
> >
> > IMAGE=3D${OPENBMC}/build/tmp/deploy/images/gsj/image-bmc
> > qemu-system-arm -machine quanta-gsj -nographic \
> >       -drive file=3D${IMAGE},if=3Dmtd,bus=3D0,unit=3D0,format=3Draw,sna=
pshot=3Don
> >
> > Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> > Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>
> > Tested-by: C=C3=A9dric Le Goater <clg@kaod.org>
> > Tested-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > Signed-off-by: Havard Skinnemoen <hskinnemoen@google.com>
> > ---
> >  hw/arm/npcm7xx_boards.c | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >
> > diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
> > index b4c772d6b5..79e2e2744c 100644
> > --- a/hw/arm/npcm7xx_boards.c
> > +++ b/hw/arm/npcm7xx_boards.c
> > @@ -20,6 +20,7 @@
> >  #include "hw/arm/npcm7xx.h"
> >  #include "hw/core/cpu.h"
> >  #include "hw/loader.h"
> > +#include "hw/qdev-properties.h"
> >  #include "qapi/error.h"
> >  #include "qemu-common.h"
> >  #include "qemu/units.h"
> > @@ -55,6 +56,22 @@ static void npcm7xx_load_bootrom(MachineState
> *machine, NPCM7xxState *soc)
> >      }
> >  }
> >
> > +static void npcm7xx_connect_flash(NPCM7xxFIUState *fiu, int cs_no,
> > +                                  const char *flash_type, DriveInfo
> *dinfo)
> > +{
> > +    DeviceState *flash;
> > +    qemu_irq flash_cs;
> > +
> > +    flash =3D qdev_new(flash_type);
> > +    if (dinfo) {
> > +        qdev_prop_set_drive(flash, "drive", blk_by_legacy_dinfo(dinfo)=
);
> > +    }
> > +    qdev_realize_and_unref(flash, BUS(fiu->spi), &error_fatal);
> > +
> > +    flash_cs =3D qdev_get_gpio_in_named(flash, SSI_GPIO_CS, 0);
> > +    qdev_connect_gpio_out_named(DEVICE(fiu), "cs", cs_no, flash_cs);
> > +}
> > +
> >  static void npcm7xx_connect_dram(NPCM7xxState *soc, MemoryRegion *dram=
)
> >  {
> >      memory_region_add_subregion(get_system_memory(), NPCM7XX_DRAM_BA,
> dram);
> > @@ -92,6 +109,7 @@ static void npcm750_evb_init(MachineState *machine)
> >      qdev_realize(DEVICE(soc), NULL, &error_fatal);
> >
> >      npcm7xx_load_bootrom(machine, soc);
> > +    npcm7xx_connect_flash(&soc->fiu[0], 0, "w25q256", drive_get(IF_MTD=
,
> 0, 0));
>
> Nitpicking: add definition for '0' magic number
> (consider as future cleanup).
>

Thanks. I've made the change, but won't send it out until this series is
merged, or I'll fold it in if I need to do another iteration for other
reasons.

>      npcm7xx_load_kernel(machine, soc);
> >  }
> >
> > @@ -104,6 +122,8 @@ static void quanta_gsj_init(MachineState *machine)
> >      qdev_realize(DEVICE(soc), NULL, &error_fatal);
> >
> >      npcm7xx_load_bootrom(machine, soc);
> > +    npcm7xx_connect_flash(&soc->fiu[0], 0, "mx25l25635e",
> > +                          drive_get(IF_MTD, 0, 0));
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>
> >      npcm7xx_load_kernel(machine, soc);
> >  }
> >
> >
>

--0000000000004fdb6d05af2546eb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 11, 2020 at 5:46 AM Phili=
ppe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.o=
rg</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><br>
<br>
On 9/11/20 7:20 AM, Havard Skinnemoen via wrote:<br>
&gt; This allows these NPCM7xx-based boards to boot from a flash image, e.g=
.<br>
&gt; one built with OpenBMC. For example like this:<br>
&gt; <br>
&gt; IMAGE=3D${OPENBMC}/build/tmp/deploy/images/gsj/image-bmc<br>
&gt; qemu-system-arm -machine quanta-gsj -nographic \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-drive file=3D${IMAGE},if=3Dmtd,bus=3D0,unit=
=3D0,format=3Draw,snapshot=3Don<br>
&gt; <br>
&gt; Reviewed-by: Tyrone Ting &lt;<a href=3D"mailto:kfting@nuvoton.com" tar=
get=3D"_blank" class=3D"cremed">kfting@nuvoton.com</a>&gt;<br>
&gt; Reviewed-by: C=C3=A9dric Le Goater &lt;<a href=3D"mailto:clg@kaod.org"=
 target=3D"_blank" class=3D"cremed">clg@kaod.org</a>&gt;<br>
&gt; Tested-by: C=C3=A9dric Le Goater &lt;<a href=3D"mailto:clg@kaod.org" t=
arget=3D"_blank" class=3D"cremed">clg@kaod.org</a>&gt;<br>
&gt; Tested-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@ams=
at.org" target=3D"_blank" class=3D"cremed">f4bug@amsat.org</a>&gt;<br>
&gt; Signed-off-by: Havard Skinnemoen &lt;<a href=3D"mailto:hskinnemoen@goo=
gle.com" target=3D"_blank" class=3D"cremed">hskinnemoen@google.com</a>&gt;<=
br>
&gt; ---<br>
&gt;=C2=A0 hw/arm/npcm7xx_boards.c | 20 ++++++++++++++++++++<br>
&gt;=C2=A0 1 file changed, 20 insertions(+)<br>
&gt; <br>
&gt; diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c<br>
&gt; index b4c772d6b5..79e2e2744c 100644<br>
&gt; --- a/hw/arm/npcm7xx_boards.c<br>
&gt; +++ b/hw/arm/npcm7xx_boards.c<br>
&gt; @@ -20,6 +20,7 @@<br>
&gt;=C2=A0 #include &quot;hw/arm/npcm7xx.h&quot;<br>
&gt;=C2=A0 #include &quot;hw/core/cpu.h&quot;<br>
&gt;=C2=A0 #include &quot;hw/loader.h&quot;<br>
&gt; +#include &quot;hw/qdev-properties.h&quot;<br>
&gt;=C2=A0 #include &quot;qapi/error.h&quot;<br>
&gt;=C2=A0 #include &quot;qemu-common.h&quot;<br>
&gt;=C2=A0 #include &quot;qemu/units.h&quot;<br>
&gt; @@ -55,6 +56,22 @@ static void npcm7xx_load_bootrom(MachineState *mach=
ine, NPCM7xxState *soc)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; +static void npcm7xx_connect_flash(NPCM7xxFIUState *fiu, int cs_no,<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const char *flash_type, D=
riveInfo *dinfo)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 DeviceState *flash;<br>
&gt; +=C2=A0 =C2=A0 qemu_irq flash_cs;<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 flash =3D qdev_new(flash_type);<br>
&gt; +=C2=A0 =C2=A0 if (dinfo) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 qdev_prop_set_drive(flash, &quot;drive&qu=
ot;, blk_by_legacy_dinfo(dinfo));<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +=C2=A0 =C2=A0 qdev_realize_and_unref(flash, BUS(fiu-&gt;spi), &amp;er=
ror_fatal);<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 flash_cs =3D qdev_get_gpio_in_named(flash, SSI_GPIO_CS,=
 0);<br>
&gt; +=C2=A0 =C2=A0 qdev_connect_gpio_out_named(DEVICE(fiu), &quot;cs&quot;=
, cs_no, flash_cs);<br>
&gt; +}<br>
&gt; +<br>
&gt;=C2=A0 static void npcm7xx_connect_dram(NPCM7xxState *soc, MemoryRegion=
 *dram)<br>
&gt;=C2=A0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 memory_region_add_subregion(get_system_memory(), N=
PCM7XX_DRAM_BA, dram);<br>
&gt; @@ -92,6 +109,7 @@ static void npcm750_evb_init(MachineState *machine)=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 qdev_realize(DEVICE(soc), NULL, &amp;error_fatal);=
<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 npcm7xx_load_bootrom(machine, soc);<br>
&gt; +=C2=A0 =C2=A0 npcm7xx_connect_flash(&amp;soc-&gt;fiu[0], 0, &quot;w25=
q256&quot;, drive_get(IF_MTD, 0, 0));<br>
<br>
Nitpicking: add definition for &#39;0&#39; magic number<br>
(consider as future cleanup).<br></blockquote><div><br></div><div>Thanks. I=
&#39;ve made the change, but won&#39;t send it out until this series is mer=
ged, or I&#39;ll fold it in if I need to do another iteration for other rea=
sons.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
&gt;=C2=A0 =C2=A0 =C2=A0 npcm7xx_load_kernel(machine, soc);<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; @@ -104,6 +122,8 @@ static void quanta_gsj_init(MachineState *machine)=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 qdev_realize(DEVICE(soc), NULL, &amp;error_fatal);=
<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 npcm7xx_load_bootrom(machine, soc);<br>
&gt; +=C2=A0 =C2=A0 npcm7xx_connect_flash(&amp;soc-&gt;fiu[0], 0, &quot;mx2=
5l25635e&quot;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 drive_get(IF_MTD, 0, 0));<br>
<br>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.=
org" target=3D"_blank" class=3D"cremed">f4bug@amsat.org</a>&gt;<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 npcm7xx_load_kernel(machine, soc);<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; <br>
</blockquote></div></div>

--0000000000004fdb6d05af2546eb--
