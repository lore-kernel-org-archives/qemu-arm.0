Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp1109823lfc;
        Thu, 12 Mar 2020 13:02:20 -0700 (PDT)
X-Received: by 2002:a92:8395:: with SMTP id p21mr9748381ilk.14.1584043340269;
        Thu, 12 Mar 2020 13:02:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584043340; cv=none;
        d=google.com; s=arc-20160816;
        b=hJTdCCYPTNFDLz2+TCh7gK0B8xVzVl2fSe1qqzhDM54R0/Tnsmlg48ilMM9QvpUFnO
         z8tK3RdLXcvfuuju8FfNQ99XzHg0Fkzl+IRBPfmt/BZHVSEl5EzJhqg6V0oZ9yHgCGNB
         7Ehnzp2pO3b5mgSN3iASDNu/OL1xpkebNVgz+EeZ7HTdyLs4DZHJFdLiDbH3foz5pVif
         /Ex5JxGEY81zz6XjVK0bszZ1jZ0u6aRZZZtKtgCzpXHaezvuA7wqvdYakv1m2acvR69H
         BzpckgvY5qmpnosH3rHrJoHpD63wIoisgSiL+5EyuKhFcWL915j1GDU6J5Mtwwory747
         F3EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iEExUs14yIhTspSpMTZEiP0XS6fhKXstB4RbOjXMcI8=;
        b=OJ9tEQu0sHS1RsDdNV4HGYlXMBu/K9Gz2f38XFM0zMhKMkGKhz4mcHu12YN4XFMG0p
         TE97n2FQgNIHDXJx94MIlBseY5DjRupA3dWIu6TRHKovHeWmJv8CCFSFSSfpebdnJnIf
         dETMATWwfXUJmjqHXbMOJfTHoPgw+iRY3PwjYfSzLK4X+9mdvvQvj1KLoz/LcdY/k9LN
         5X5pkPJE3oegD91znkECdtO/CdpzdbJ/Pc8N76zXbDDqIBosnpt2Sfk5tB+BbGF8yHOE
         TqcdvZZDDHKhapd37IU4xhmloVX/OdumQ01ek5tCORLc8n7CvLQ8xnumfLwJ0WAnb2Qe
         tmCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=kAcqgkax;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <nieklinnenbank@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k13sor6117789ion.67.2020.03.12.13.02.20
        (Google Transport Security);
        Thu, 12 Mar 2020 13:02:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=kAcqgkax;
       spf=pass (google.com: domain of nieklinnenbank@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=nieklinnenbank@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iEExUs14yIhTspSpMTZEiP0XS6fhKXstB4RbOjXMcI8=;
        b=kAcqgkax3VsBgHjQ/4y69SlZ1Wq95HihuANakTA4nSOEPI0bYWsiqAt4LxCmyxjsok
         Osuj8BudukDevJ+O6y+7UKdDtkZYAgvXr51xFNISG5vHVfimofOJQbWi6b0zJN2eidpg
         6ytMLZVqz2xLmPC3afvyDObHxvua1NQdcPX20gdrfk0z2XunefVaTavFj/lxLTJnF8Uk
         676JqleQ0ICjAAQ9Wo/kBPd+DSOi6+QYYpra9iXi6bl4ltursirehS39kJacP/Pw3OEF
         IFC15iyk/ZzRfd1DOA3/hGEbfyv8H9OWOztk6zDehCFDWWYm6rDtkA8S7S7zrVGtHRao
         XYig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iEExUs14yIhTspSpMTZEiP0XS6fhKXstB4RbOjXMcI8=;
        b=eORD7eAi7GMSdQBdCdOi+iHRAHZ5qAwWN4uJVHnXbchqmu7o6xoGHIknkGNoFDquV4
         x51vZTzgocUP0sO2b4IF4uRFjYGkA73u9uC8bmMmQEsmhnENtgu/40iV/SWkBa5iOLLX
         I+hEBUmEf1XgWG2jidw50ZT+u7tGu4Mjry15xuS+jfivN2c4yZG4ADOmcTBbxA70jRwS
         y3Zx+JPhPftV5uXp8z48cc8ssIruQ9EBPheQRy5LGPrIO10q5sCgOP39JI0kFam33LPt
         i3dqtyILom2Dqn+CM7z/NSn6RCUJ5qqDbuyBiGvBFKkW+p8Tt/6ceR/AWwYpndqTxcRB
         D+5Q==
X-Gm-Message-State: ANhLgQ3GvB9HFKZbPXT+YEPvI/rIkdsA99dfs0wL3C8mKFKSzDIB0nmG
	0VJotFIevjDYc1ne3+H82rBJ6gS04w1gO5EJvhVFfw==
X-Google-Smtp-Source: ADFU+vsZ+8dqR3Tlma42xnqtUmTMantE6dZEz8LVB+6IIJEMvyVz4NMKgWny3j4gp5QLi3vWQkZ/UbUPmyA636srTN0=
X-Received: by 2002:a6b:5406:: with SMTP id i6mr9248179iob.188.1584043339648;
 Thu, 12 Mar 2020 13:02:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200311221854.30370-1-nieklinnenbank@gmail.com> <CAFEAcA9UqDRT-32Qnap8n3uYh8hyK_89KhsTwceHDRiTzihyJg@mail.gmail.com>
In-Reply-To: <CAFEAcA9UqDRT-32Qnap8n3uYh8hyK_89KhsTwceHDRiTzihyJg@mail.gmail.com>
From: Niek Linnenbank <nieklinnenbank@gmail.com>
Date: Thu, 12 Mar 2020 21:02:08 +0100
Message-ID: <CAPan3WpgoCnnQCqxeYC3vPJ692TxFkLxs3dnD1xv9HfCukr7NA@mail.gmail.com>
Subject: Re: [PATCH v8 00/18] Add Allwinner H3 SoC and Orange Pi PC Machine
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
	Beniamino Galvani <b.galvani@gmail.com>, Jason Wang <jasowang@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Igor Mammedov <imammedo@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000009195a605a0add438"
X-TUID: Q+1KRApdNyVA

--0000000000009195a605a0add438
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 12, 2020 at 5:22 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Wed, 11 Mar 2020 at 22:19, Niek Linnenbank <nieklinnenbank@gmail.com>
> wrote:
> >
> > Dear QEMU developers,
> >
> > Hereby I would like to contribute the following set of patches to QEMU
> > which add support for the Allwinner H3 System on Chip and the
> > Orange Pi PC machine. The following features and devices are supported:
> >
> >  * SMP (Quad Core Cortex A7)
> >  * Generic Interrupt Controller configuration
> >  * SRAM mappings
> >  * SDRAM controller
> >  * Real Time Clock
> >  * Timer device (re-used from Allwinner A10)
> >  * UART
> >  * SD/MMC storage controller
> >  * EMAC ethernet
> >  * USB 2.0 interfaces
> >  * Clock Control Unit
> >  * System Control module
> >  * Security Identifier device
>
>
>
> Applied to target-arm.next, thanks.


Great news! And thanks for your support as well Peter!


> (I moved
> the doc into the its new location now that the split-out
> of the arm board docs into separate files has landed.)
>
> Yeah sure, indeed, that makes sense.

Regards,
Niek


> -- PMM
>


-- 
Niek Linnenbank

--0000000000009195a605a0add438
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 12, 2020 at 5:22 PM Peter=
 Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@lina=
ro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Wed, 11 Mar 2020 at 22:19, Niek Linnenbank &lt;<a href=3D"mailto:n=
ieklinnenbank@gmail.com" target=3D"_blank">nieklinnenbank@gmail.com</a>&gt;=
 wrote:<br>
&gt;<br>
&gt; Dear QEMU developers,<br>
&gt;<br>
&gt; Hereby I would like to contribute the following set of patches to QEMU=
<br>
&gt; which add support for the Allwinner H3 System on Chip and the<br>
&gt; Orange Pi PC machine. The following features and devices are supported=
:<br>
&gt;<br>
&gt;=C2=A0 * SMP (Quad Core Cortex A7)<br>
&gt;=C2=A0 * Generic Interrupt Controller configuration<br>
&gt;=C2=A0 * SRAM mappings<br>
&gt;=C2=A0 * SDRAM controller<br>
&gt;=C2=A0 * Real Time Clock<br>
&gt;=C2=A0 * Timer device (re-used from Allwinner A10)<br>
&gt;=C2=A0 * UART<br>
&gt;=C2=A0 * SD/MMC storage controller<br>
&gt;=C2=A0 * EMAC ethernet<br>
&gt;=C2=A0 * USB 2.0 interfaces<br>
&gt;=C2=A0 * Clock Control Unit<br>
&gt;=C2=A0 * System Control module<br>
&gt;=C2=A0 * Security Identifier device<br>
<br>
<br>
<br>
Applied to target-arm.next, thanks. </blockquote><div><br></div><div>Great =
news! And thanks for your support as well Peter!<br></div><div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">(I moved<br>
the doc into the its new location now that the split-out<br>
of the arm board docs into separate files has landed.)<br>
<br></blockquote><div>Yeah sure, indeed, that makes sense.</div><div><br></=
div><div>Regards,</div><div>Niek<br></div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
-- PMM<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><div>Niek Linnenbank<br><br></div></div></=
div></div>

--0000000000009195a605a0add438--
