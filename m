Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1160258lfc;
        Wed, 11 Mar 2020 12:44:49 -0700 (PDT)
X-Received: by 2002:a92:c68b:: with SMTP id o11mr2422468ilg.209.1583955889393;
        Wed, 11 Mar 2020 12:44:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583955889; cv=none;
        d=google.com; s=arc-20160816;
        b=QkbxxF/IKzMMCvTfEK6zuC6ue7DcAazcnWo9vz5J/dhPGmp6jqRhkQ1N3rz1YvooMX
         JLgk+aKgLpEe7Eezevi0wMUkPS0PwPxKF/xuPaUxhD5myanD2T+ap1kynA5hDc7gGkp0
         5AYb4tqbgrKJyqVrq3TrxvqFt6NhbdscpdwfDKypLTuTLxUoyrTQopIjrX4Res02xDAy
         PRznhC6sTl4omJz+ZwF0OpAP/7g5xwLyXj3QcHKNF03OArS8c7Y92GxCWqXj4syZp8Sb
         UCaBefQyKioR9aTsAja8sI9bq8wmlCYFgp9h6w++5fopq1dr53vaQGx2uSuuCKXqOfch
         5U2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sStzUROPFbNgloBsdUZk7FIRcE4lmU9fOgPFV9ssxS4=;
        b=eoHjB5+5DhKH72V1NIO5uEeIdwr17/H2yAaswrfPAwPsIbxYVJD9Yt42P60eghRHnP
         pl2TatWD8ZUagZ68gLLpnnJ2x2IASJUMYuz43z3X30j+JvKDhc31JKvhwrdTkiis/kQu
         NpmPfW+xuBhSNIa2gG8z8pkLFZIQOQrXrdzBZPVkLHf1OZTOJz1NGh1X6aYVozH3fx9G
         lBLa8/o6K/OTH+aKLXKM6avo9xqDZ8s/h6DhJTb/2JIGYw4eW4D0buobja/7a38jI8bQ
         2VjhEzlvqWTwV5LIAxSfT52iMcsZXFfnoDUBpzbUkwBYvaGwKnZittytnNRG8ig3ppLV
         X8Og==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=p2qbtuge;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id d14sor4670019jah.12.2020.03.11.12.44.48
        (Google Transport Security);
        Wed, 11 Mar 2020 12:44:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=p2qbtuge;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sStzUROPFbNgloBsdUZk7FIRcE4lmU9fOgPFV9ssxS4=;
        b=p2qbtugeBILQGO4pSkJxkVpz/SmS7SqAPQ6lr+fGC5haRlBSVR5MfQ22itCe4/8OKn
         eDDtzAN9u+HsIKi4qJuW8QuL6lVt0cXg8O9rl5fTm5q5nvFfkvm0iTeu1p5tuiEdJx3M
         2S+8YbwOL+2OTpdv9IEOrgSSL79UrUfdtwrZOOYNhDjmMxHhxan3UZdDhtA2XYfmeDd5
         1Jpg1D1nLXshx6wt1Q63GeLKsGjFGuGKBgYjftcVTqlqcvhL3PiZThd1MkjkRz7qvKHK
         KKQPZ2N7PX4Pv0rdXHDsPlPu/lmU1NsshcFT8MB/jnUI4p0wDr+FjbjvhYjr+8R54srg
         BGiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sStzUROPFbNgloBsdUZk7FIRcE4lmU9fOgPFV9ssxS4=;
        b=hskhp3B1Jr0ZhQULLKwBPsyGTgbKlS/U/WBkSte6HuSoFepCqDfQ6gjcM7nmXnE4On
         VtIRWbywctj40KGMnII8qh8mHTUwfCmpKqDim2kAqpILjYjczAB3w0q+Amm6qrPrB+kx
         sKkt9PWepWxS/quYdbmMDiP0dU0XZawi0XdsL0U4434BDTSxwaIiOS4P/0NPWMlPMg82
         MsL+o1cGb5A0znnutVfM69vkPnnabAGPtPxcyiTV4LqrrAGBJ1BJGnvls/hBpcX+C/Zs
         BEKWpuNkMRJwE51PykM5cgPyRFlpSf6tYjiiVQxKZ4bHClxjYP94WDvZMWIvTPZMTEl5
         8K/Q==
X-Gm-Message-State: ANhLgQ2seAhSuAGqKisxhkDcbFPUH2WWc92PLSSBcQS2LfLPzK41zdAM
	eA2qmXwr25j1m9OA80kuMfZS9EoU59jkJbPnPDCjSg==
X-Google-Smtp-Source: ADFU+vtm7ewqMrLdb8tycFjLtjWP91VMIM3UTnsa9gbf9gYxP6H+yTd9pYTUX2q8quHQ0ZeIYojLsESU4pMASx8DyxY=
X-Received: by 2002:a02:cf1b:: with SMTP id q27mr4269831jar.99.1583955888556;
 Wed, 11 Mar 2020 12:44:48 -0700 (PDT)
MIME-Version: 1.0
References: <20200310213203.18730-1-nieklinnenbank@gmail.com>
 <20200310213203.18730-11-nieklinnenbank@gmail.com> <87eetzgfim.fsf@linaro.org>
In-Reply-To: <87eetzgfim.fsf@linaro.org>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Wed, 11 Mar 2020 20:44:37 +0100
Message-ID: <CAPan3Wpebnx0Reikv156Z1R_05WnGHTxBh2pr4yiNJC9zo69ZA@mail.gmail.com>
Subject: Re: [PATCH v7 10/18] hw/arm/allwinner-h3: add Boot ROM support
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Peter Maydell <peter.maydell@linaro.org>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
	Beniamino Galvani <b.galvani@gmail.com>, Jason Wang <jasowang@redhat.com>, 
	Igor Mammedov <imammedo@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000013cf7f05a0997845"
X-TUID: CKX43bXXtuqd

--00000000000013cf7f05a0997845
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2020 at 2:58 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:

>
> Niek Linnenbank <nieklinnenbank@gmail.com> writes:
>
> > A real Allwinner H3 SoC contains a Boot ROM which is the
> > first code that runs right after the SoC is powered on.
> > The Boot ROM is responsible for loading user code (e.g. a bootloader)
> > from any of the supported external devices and writing the downloaded
> > code to internal SRAM. After loading the SoC begins executing the code
> > written to SRAM.
> >
> > This commits adds emulation of the Boot ROM firmware setup functionalit=
y
> > by loading user code from SD card in the A1 SRAM. While the A1 SRAM is
> > 64KiB, we limit the size to 32KiB because the real H3 Boot ROM also
> rejects
> > sizes larger than 32KiB. For reference, this behaviour is documented
> > by the Linux Sunxi project wiki at:
> >
> >   https://linux-sunxi.org/BROM#U-Boot_SPL_limitations
> >
> > Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
> > ---
> >  include/hw/arm/allwinner-h3.h | 21 +++++++++++++++++++++
> >  hw/arm/allwinner-h3.c         | 18 ++++++++++++++++++
> >  hw/arm/orangepi.c             |  5 +++++
> >  3 files changed, 44 insertions(+)
> >
> > diff --git a/include/hw/arm/allwinner-h3.h
> b/include/hw/arm/allwinner-h3.h
> > index f9b9a02373..d338003724 100644
> > --- a/include/hw/arm/allwinner-h3.h
> > +++ b/include/hw/arm/allwinner-h3.h
> > @@ -46,6 +46,7 @@
> >  #include "hw/sd/allwinner-sdhost.h"
> >  #include "hw/net/allwinner-sun8i-emac.h"
> >  #include "target/arm/cpu.h"
> > +#include "sysemu/block-backend.h"
> >
> >  /**
> >   * Allwinner H3 device list
> > @@ -129,4 +130,24 @@ typedef struct AwH3State {
> >      MemoryRegion sram_c;
> >  } AwH3State;
> >
> > +/**
> > + * Emulate Boot ROM firmware setup functionality.
> > + *
> > + * A real Allwinner H3 SoC contains a Boot ROM
> > + * which is the first code that runs right after
> > + * the SoC is powered on. The Boot ROM is responsible
> > + * for loading user code (e.g. a bootloader) from any
> > + * of the supported external devices and writing the
> > + * downloaded code to internal SRAM. After loading the SoC
> > + * begins executing the code written to SRAM.
> > + *
> > + * This function emulates the Boot ROM by copying 32 KiB
> > + * of data from the given block device and writes it to
> > + * the start of the first internal SRAM memory.
> > + *
> > + * @s: Allwinner H3 state object pointer
> > + * @blk: Block backend device object pointer
> > + */
> > +void allwinner_h3_bootrom_setup(AwH3State *s, BlockBackend *blk);
> > +
> >  #endif /* HW_ARM_ALLWINNER_H3_H */
> > diff --git a/hw/arm/allwinner-h3.c b/hw/arm/allwinner-h3.c
> > index d1245d2b01..56b5c563a8 100644
> > --- a/hw/arm/allwinner-h3.c
> > +++ b/hw/arm/allwinner-h3.c
> > @@ -29,6 +29,7 @@
> >  #include "hw/char/serial.h"
> >  #include "hw/misc/unimp.h"
> >  #include "hw/usb/hcd-ehci.h"
> > +#include "hw/loader.h"
> >  #include "sysemu/sysemu.h"
> >  #include "hw/arm/allwinner-h3.h"
> >
> > @@ -170,6 +171,23 @@ enum {
> >      AW_H3_GIC_NUM_SPI       =3D 128
> >  };
> >
> > +void allwinner_h3_bootrom_setup(AwH3State *s, BlockBackend *blk)
> > +{
> > +    const int64_t rom_size =3D 32 * KiB;
> > +    uint8_t *buffer =3D g_new0(uint8_t, rom_size);
>
> There is an opportunity to use g_autofree here so you can skip..
>
> > +    g_free(buffer);
> > +}
> > +
> <snip>
>

Thanks Alex, I'll use g_autofree here.

Regards,
Niek


>
> Otherwise:
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> --
> Alex Benn=C3=A9e
>


--=20
Niek Linnenbank

--00000000000013cf7f05a0997845
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 11, 2020 at 2:58 PM Alex =
Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org">alex.bennee@linar=
o.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><br>
Niek Linnenbank &lt;<a href=3D"mailto:nieklinnenbank@gmail.com" target=3D"_=
blank">nieklinnenbank@gmail.com</a>&gt; writes:<br>
<br>
&gt; A real Allwinner H3 SoC contains a Boot ROM which is the<br>
&gt; first code that runs right after the SoC is powered on.<br>
&gt; The Boot ROM is responsible for loading user code (e.g. a bootloader)<=
br>
&gt; from any of the supported external devices and writing the downloaded<=
br>
&gt; code to internal SRAM. After loading the SoC begins executing the code=
<br>
&gt; written to SRAM.<br>
&gt;<br>
&gt; This commits adds emulation of the Boot ROM firmware setup functionali=
ty<br>
&gt; by loading user code from SD card in the A1 SRAM. While the A1 SRAM is=
<br>
&gt; 64KiB, we limit the size to 32KiB because the real H3 Boot ROM also re=
jects<br>
&gt; sizes larger than 32KiB. For reference, this behaviour is documented<b=
r>
&gt; by the Linux Sunxi project wiki at:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://linux-sunxi.org/BROM#U-Boot_SPL_limitat=
ions" rel=3D"noreferrer" target=3D"_blank">https://linux-sunxi.org/BROM#U-B=
oot_SPL_limitations</a><br>
&gt;<br>
&gt; Signed-off-by: Niek Linnenbank &lt;<a href=3D"mailto:nieklinnenbank@gm=
ail.com" target=3D"_blank">nieklinnenbank@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 include/hw/arm/allwinner-h3.h | 21 +++++++++++++++++++++<br>
&gt;=C2=A0 hw/arm/allwinner-h3.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 18 ++++=
++++++++++++++<br>
&gt;=C2=A0 hw/arm/orangepi.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 5 +++++<br>
&gt;=C2=A0 3 files changed, 44 insertions(+)<br>
&gt;<br>
&gt; diff --git a/include/hw/arm/allwinner-h3.h b/include/hw/arm/allwinner-=
h3.h<br>
&gt; index f9b9a02373..d338003724 100644<br>
&gt; --- a/include/hw/arm/allwinner-h3.h<br>
&gt; +++ b/include/hw/arm/allwinner-h3.h<br>
&gt; @@ -46,6 +46,7 @@<br>
&gt;=C2=A0 #include &quot;hw/sd/allwinner-sdhost.h&quot;<br>
&gt;=C2=A0 #include &quot;hw/net/allwinner-sun8i-emac.h&quot;<br>
&gt;=C2=A0 #include &quot;target/arm/cpu.h&quot;<br>
&gt; +#include &quot;sysemu/block-backend.h&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 /**<br>
&gt;=C2=A0 =C2=A0* Allwinner H3 device list<br>
&gt; @@ -129,4 +130,24 @@ typedef struct AwH3State {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 MemoryRegion sram_c;<br>
&gt;=C2=A0 } AwH3State;<br>
&gt;=C2=A0 <br>
&gt; +/**<br>
&gt; + * Emulate Boot ROM firmware setup functionality.<br>
&gt; + *<br>
&gt; + * A real Allwinner H3 SoC contains a Boot ROM<br>
&gt; + * which is the first code that runs right after<br>
&gt; + * the SoC is powered on. The Boot ROM is responsible<br>
&gt; + * for loading user code (e.g. a bootloader) from any<br>
&gt; + * of the supported external devices and writing the<br>
&gt; + * downloaded code to internal SRAM. After loading the SoC<br>
&gt; + * begins executing the code written to SRAM.<br>
&gt; + *<br>
&gt; + * This function emulates the Boot ROM by copying 32 KiB<br>
&gt; + * of data from the given block device and writes it to<br>
&gt; + * the start of the first internal SRAM memory.<br>
&gt; + *<br>
&gt; + * @s: Allwinner H3 state object pointer<br>
&gt; + * @blk: Block backend device object pointer<br>
&gt; + */<br>
&gt; +void allwinner_h3_bootrom_setup(AwH3State *s, BlockBackend *blk);<br>
&gt; +<br>
&gt;=C2=A0 #endif /* HW_ARM_ALLWINNER_H3_H */<br>
&gt; diff --git a/hw/arm/allwinner-h3.c b/hw/arm/allwinner-h3.c<br>
&gt; index d1245d2b01..56b5c563a8 100644<br>
&gt; --- a/hw/arm/allwinner-h3.c<br>
&gt; +++ b/hw/arm/allwinner-h3.c<br>
&gt; @@ -29,6 +29,7 @@<br>
&gt;=C2=A0 #include &quot;hw/char/serial.h&quot;<br>
&gt;=C2=A0 #include &quot;hw/misc/unimp.h&quot;<br>
&gt;=C2=A0 #include &quot;hw/usb/hcd-ehci.h&quot;<br>
&gt; +#include &quot;hw/loader.h&quot;<br>
&gt;=C2=A0 #include &quot;sysemu/sysemu.h&quot;<br>
&gt;=C2=A0 #include &quot;hw/arm/allwinner-h3.h&quot;<br>
&gt;=C2=A0 <br>
&gt; @@ -170,6 +171,23 @@ enum {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 AW_H3_GIC_NUM_SPI=C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 12=
8<br>
&gt;=C2=A0 };<br>
&gt;=C2=A0 <br>
&gt; +void allwinner_h3_bootrom_setup(AwH3State *s, BlockBackend *blk)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 const int64_t rom_size =3D 32 * KiB;<br>
&gt; +=C2=A0 =C2=A0 uint8_t *buffer =3D g_new0(uint8_t, rom_size);<br>
<br>
There is an opportunity to use g_autofree here so you can skip..<br>
<br>
&gt; +=C2=A0 =C2=A0 g_free(buffer);<br>
&gt; +}<br>
&gt; +<br>
&lt;snip&gt;<br></blockquote><div><br></div><div>Thanks Alex, I&#39;ll use =
g_autofree here.</div><div><br></div><div>Regards,</div><div>Niek<br></div>=
<div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Otherwise:<br>
<br>
Reviewed-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org"=
 target=3D"_blank">alex.bennee@linaro.org</a>&gt;<br>
<br>
-- <br>
Alex Benn=C3=A9e<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><div>Niek Linnenbank<br><br></div></div></=
div></div>

--00000000000013cf7f05a0997845--
