Received: by 2002:a05:6512:b9e:0:0:0:0 with SMTP id b30csp4784791lfv;
        Wed, 3 Nov 2021 06:17:23 -0700 (PDT)
X-Received: by 2002:a17:907:96a4:: with SMTP id hd36mr20362936ejc.407.1635945443024;
        Wed, 03 Nov 2021 06:17:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635945443; cv=none;
        d=google.com; s=arc-20160816;
        b=CzNDdZQSPK6yDuH8mykHVAhtMcqk6bfgFYRXJKU9BFRopysE1dYz723SXzQNp5vo8K
         8ESM7E0h3l6OwWa01URie5064zqnlhljcgg0Ka1/7LSfVlJOwwVK1T4tCSGlJf5AYtwl
         HFng0OWzqqXFr1IqWqJHrPhU0NoFRHOaH2odyo5g2/ibaazMfiLLs62eh2Eg1Cxdt+g6
         DETS7HwEpexu3gkk3OuzZ1Ta1k7WbNmP9OB8sdLKefsAm9IXzrNibsItGg99TKaslaVD
         cN8NMwbsTw0eaGGmv3zWTiv5826OXeAFUvDN3b4QiK26PZORZedunDL7D72dIRcdFU50
         ADOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=to3VWalT1oF8s8W0kCuV93KO1EvHg21dh734ZDF3AaA=;
        b=c3Jdr0cF8osnZH2VMqegfgi6Y/0Tuf7nTNcNG1A0ucqzFrL+R5kKCDBR6gYCVB/8rM
         FwCUmbQPHrYGps595Qxofc582tyPdkwPi0H5rPaKso0AjpghvlbmyMcMPYASa+8SVn1W
         vXE170n+7qHmvP7tp4vhSMf0hEzoAAiLNbZKWmZSJSh1SdR0BRh4QCAgNjsETeRwqy8S
         UEQw0vZ86pWf0/YV0dHsbc+FMpvtla2PhKxo9vpdzZTHpXbCpsNsaSUWI0QP6p6l5OaO
         Zyf5jFf9TyXMXS+Bo56SgCHtfEtruXIkH1hrMwse7MvqomJZDwc5DuCEs+6trrJHB+2R
         C/5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oo9j4sQC;
       spf=pass (google.com: domain of francois.ozog@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=francois.ozog@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <francois.ozog@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id y19sor153589edc.20.2021.11.03.06.17.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 03 Nov 2021 06:17:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of francois.ozog@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=oo9j4sQC;
       spf=pass (google.com: domain of francois.ozog@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=francois.ozog@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=to3VWalT1oF8s8W0kCuV93KO1EvHg21dh734ZDF3AaA=;
        b=oo9j4sQCKbP5KcU2bPOd3CAA5jliX7rShMdbIDLJ25RUxikTN9+nzO7lRWVjmOb//s
         xxObJCGSOvelf01MxPpKOrg50eUAQLq8L72aab1DfmwzRQKPeV3xSRt0eMxqSkAAeuBD
         jZMQwYlKMZs9DnyylUB/rvp02+vQacnjqjHT8uakVQO+YId7xisHgYkyvBm5SlVba52d
         vMMXBm3AfRJyLHncYX0l2WAIk+rjx6TrIx75ROaJF7tZ+K8762r61/xai+apfxmX5HcG
         TuJjkOGIBDXHiy3rjtzq57vx7i27wR2OMqxVZujxK8GWDUFmw636LFyfQu6yb6Q20mpe
         26cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=to3VWalT1oF8s8W0kCuV93KO1EvHg21dh734ZDF3AaA=;
        b=tjZ3lH6XYdplz1C/AHdV+Xo3BtOThwnG287t1j0ONQZLMGzse9vdf76fYJYZYT4vYd
         Y3tPRJ9DyVX4H/GyShLyR+lK4sPoYpRqPo1zmolNE4DwwEvbU+Payf4ME35t1dQeQ1Ul
         w0lb8i/hGDGGqVItLnHMJapnfzgSjzV7PudtxLHB9Y/pTRMKTNQqIUIELwxEnqz68Q9V
         Z97w+TTqdSfKtkYP8fFrk/0BjO9ItA98aLLYUdqdUh92AoyGuRTM+65xvyLMQ+wKk6UT
         RgkByoODsL18LiLh0zs8V9YI+Ke8F1ee+9kvDUk/ptPfRRO732BpcOzQ8shTwBuM3V+s
         KJgw==
X-Gm-Message-State: AOAM530J1LJ+lKsMEGW+Yv34t1H1iX5y8NW7tSfKAH7kxzDSDhJMnZZJ
	t8Tu+VsKpV9dpvvphyuPTYD8aeQ9qTFiH1fzCeAf7z7KB6UUqmlK
X-Google-Smtp-Source: ABdhPJyHubuDOvvl030FWLo8+pqEXE6ssozLlSN4us8fQx2VpTXE2RN81N4g3riFy816kMm8x/c9aKR9LtA+1eSW6DU=
X-Received: by 2002:a05:6402:2707:: with SMTP id y7mr6527730edd.26.1635945442589;
 Wed, 03 Nov 2021 06:17:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210926183410.256484-1-sjg@chromium.org> <CAFEAcA8S2=7rOKxeqcW+kw0BVPO3PUJGSUH-ioN7=c=U7zQxvg@mail.gmail.com>
 <CAPnjgZ2NCRVxKULWR1JjZU+D9saJ7fbZ=yHmWTSr3ufHxLYg-g@mail.gmail.com>
 <CAFEAcA9n+2JDFv8BezeEMA4e2Zhr0ENAvzLjBS6YXRoW9P-JXQ@mail.gmail.com>
 <CAPnjgZ1AO8575LYbwmuouNR5=dgNam6EFDC1_bai=8xAHdw7-Q@mail.gmail.com>
 <CAFEAcA8FsPcBELEZxiRMuFbKtmKTFgDHABePQ33hdxYRq0C0ig@mail.gmail.com> <87ilx9jw7t.fsf@linaro.org>
In-Reply-To: <87ilx9jw7t.fsf@linaro.org>
From: =?UTF-8?Q?Fran=C3=A7ois_Ozog?= <francois.ozog@linaro.org>
Date: Wed, 3 Nov 2021 14:17:11 +0100
Message-ID: <CAHFG_=VYK3=bCfiFW9aYZRMbHApPzg3+Zj4NDbArmjs0uzFvvQ@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt: Allow additions to the generated device tree
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, Simon Glass <sjg@chromium.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>, 
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>, qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary="000000000000fa63aa05cfe23afb"
X-TUID: TLbg1w26d3iv

--000000000000fa63aa05cfe23afb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks Alex to patch me in.

I'd like to present another perspective on the motivation as I can't really
comment on the actual "how".

On real Arm boards, firmware is often assembled into a FIP.
That FIP can contain quite a good deal of things, including an
NT_FW_CONFIG, NonTrusted_FirmWare_CONFIGuration (NT_FW =3D BL33 which is
U-Boot in our case).
So the expected typical content for that section is a DT fragment/overlay.
That section is to be used in different ways but one is
https://trustedfirmware-a.readthedocs.io/en/latest/components/fconf/index.h=
tml
.
For SystemReady systems we will almost inevitably put a device tree
fragment in this section and have BL2 merge it with the board DT before
handing it over to BL33 (U-Boot is one of them).
In some real world examples based on carrier board + som for instance, it
may contain SerDes configuration for U-Boot that will result in appropriate
PCI lanes or MDIO lanes for the booted OS.

So I could say there is precedence in Simon's effort.

In any case, when we will have made the changes in TFA for the SystemReady
boards we work on, booting the full SystemReady stack (TFA, OP-TEE, U-Boot)
on Qemu will allow that late merge based through the FIP.

Other boot flows such as VBE (without TFA but with TPL/SPL/U-Boot proper)
need a similar facility.

Hence I am supporting Simon's proposal at least on the intent. On the how
exactly, that is outside my skillset.

future comments below


On Wed, 3 Nov 2021 at 12:48, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:

>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Mon, 27 Sept 2021 at 16:18, Simon Glass <sjg@chromium.org> wrote:
> >> On Mon, 27 Sept 2021 at 02:48, Peter Maydell <peter.maydell@linaro.org=
>
> wrote:
> >> > So what is missing in the QEMU-provided DTB that it needs?
> >>
> >> Quite a lot. Here are some examples:
> >>
> >> U-Boot has limited pre-relocation memory so tries to avoid
> >> binding/probing devices that are not used before relocation:
> >>
> >>
> https://u-boot.readthedocs.io/en/latest/develop/driver-model/design.html#=
pre-relocation-support
> >
> > It's up to u-boot to decide what it wants to touch and
> > what it does not. QEMU tells u-boot what all the available
> > devices are; I don't think we should have extra stuff saying
> > "and if you are u-boot, do something odd".
> >
> >> There is a configuration node (which is likely to change form in
> >> future releases, but will still be there)
> >>
> >>
> https://github.com/u-boot/u-boot/blob/master/doc/device-tree-bindings/con=
fig.txt
> >
> > I think u-boot should be storing this kind of thing somewhere
> > else (e.g. as part of the binary blob that is u-boot itself,
> > or stored in flash or RAM as a separate blob).
> >
> >> Then there are various features which put things in U-Boot's control
> >> dtb, such as verified boot, which adds public keys during signing:
> >>
> >>
> https://github.com/u-boot/u-boot/blob/master/doc/uImage.FIT/signature.txt=
#L135
> >>
> >> More generally, the U-Boot tree has hundreds of files which add
> >> properties for each board, since we try to keep the U-Boot-specific
> >> things out of the Linux tree:
> >>
> >> $ find . -name *u-boot.dtsi |wc -l
> >> 398
> >
> > If any of this is actual information about the hardware then you
> > should sort out getting the bindings documented officially
> > (which I think is still in the Linux tree), and then QEMU can
> > provide them.
> >
> >> Quite a bit of this is to do with SPL and so far it seems that QEMU
> >> mostly runs U-Boot proper only, although I see that SPL is starting to
> >> creep in too in the U-Boot CI.
> >>
> >> So at present QEMU is not able to support U-Boot fully.
> >
> > My take is that this is u-boot doing weird custom things with
> > the DTB that aren't "describe the hardware". You should be able
> > to boot u-boot by putting those custom DTB extra things in a
> > separate blob and having u-boot combine that with the
> > actual DTB when it starts.
>
> It's not entirely without precedent - for SPL (which I hope is secondary
> program loading) we have things like the guest loader which expands the
> plain HW DTB with some information needed by the bootloader and the
> primary OS to load additional blobs which have been put into memory.
>
> In effect the DTB is being expanded as a signalling mechanism similar to
> things like fw_cfg and other things we use to control boot up. Whether
> this affects the "purity" of DTB as a "just the HW" description is
> probably a philosophical question.
>
> More than a philosophical question: a key aspect of supply chain that nee=
d
change from
quite inflexible and tightly coupled to loosely coupled.
 A key aspect of it is to maintain "pure" hardware description DTBs at rest=
.
Composition of DTBs at build time (for products) or runtime (for
development boards) should be a simple thing.
Another aspect to take into account is System Device Trees. U-Boot only
deal with Cortex-As on a platform,
so there are multiple device trees for each compute domain. Communities are
working on System Device Tree
to define the overall platform with its power and clock domains. A tool
"lopper" is being developed to slide the SDT into diverse domain DTs.
One of them being included into the FIP as the basis for the computing
element (Carrier, SoM...).
Those attempts to cleanup passed DTBs from configuration data (drivers,
bootloaders...) is not incompatible
with merging fragments at runtime (for dev boards) or build time (for
products).

> I agree with Peter that just allowing the merging of arbitrary data into
> the QEMU generated DTB is going to lead to confusion and breakages.
> Indeed I wrote the guest-loader because instructions for booting Xen up
> until that point involved dumpdtb and hand hacking the data which was
> silly because this is stuff QEMU already knew about.
>
> >
> > -- PMM
>
>
> --
> Alex Benn=C3=A9e
>


--=20
Fran=C3=A7ois-Fr=C3=A9d=C3=A9ric Ozog | *Director Business Development*
T: +33.67221.6485
francois.ozog@linaro.org | Skype: ffozog

--000000000000fa63aa05cfe23afb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi,<div><br></div><div>Thanks Alex to pat=
ch me in.</div><div><br></div><div>I&#39;d like to present another perspect=
ive on the motivation as I can&#39;t really comment on the actual &quot;how=
&quot;.</div><div><br></div><div>On real Arm boards, firmware is often asse=
mbled into a FIP.=C2=A0</div><div>That FIP can contain quite a good deal of=
 things, including an NT_FW_CONFIG, NonTrusted_FirmWare_CONFIGuration (NT_F=
W =3D BL33 which is U-Boot in our case).</div><div>So the expected typical =
content for that section is a DT fragment/overlay.</div><div>That section i=
s to be used in different ways but one is=C2=A0<a href=3D"https://trustedfi=
rmware-a.readthedocs.io/en/latest/components/fconf/index.html" target=3D"_b=
lank">https://trustedfirmware-a.readthedocs.io/en/latest/components/fconf/i=
ndex.html</a>.</div><div>For SystemReady systems we will almost inevitably =
put a device tree fragment in this section and have BL2 merge it with the b=
oard DT before handing it over to BL33 (U-Boot is one of them).</div><div>I=
n some real world examples based on carrier board + som for instance, it ma=
y contain SerDes configuration for U-Boot that will result in appropriate P=
CI lanes or MDIO lanes for the booted OS.</div><div><br></div><div>So I cou=
ld say there is precedence in Simon&#39;s effort.</div><div><br></div><div>=
In any case, when we will have made the changes in TFA for the SystemReady =
boards we work on, booting the full SystemReady stack=C2=A0(TFA, OP-TEE, U-=
Boot) on Qemu will allow that late merge based through the FIP.</div><div><=
br></div><div>Other boot flows such as VBE (without TFA but with TPL/SPL/U-=
Boot proper) need a similar facility.=C2=A0</div><div><br></div><div>Hence =
I am supporting Simon&#39;s proposal at least on the intent. On the how exa=
ctly, that is outside my skillset.</div><div><br></div><div>future comments=
 below</div><div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Wed, 3 Nov 2021 at 12:48, Alex Benn=C3=A9e &l=
t;<a href=3D"mailto:alex.bennee@linaro.org" target=3D"_blank">alex.bennee@l=
inaro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;=
border-left-color:rgb(204,204,204);padding-left:1ex"><br>
Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org" target=3D"_bl=
ank">peter.maydell@linaro.org</a>&gt; writes:<br>
<br>
&gt; On Mon, 27 Sept 2021 at 16:18, Simon Glass &lt;<a href=3D"mailto:sjg@c=
hromium.org" target=3D"_blank">sjg@chromium.org</a>&gt; wrote:<br>
&gt;&gt; On Mon, 27 Sept 2021 at 02:48, Peter Maydell &lt;<a href=3D"mailto=
:peter.maydell@linaro.org" target=3D"_blank">peter.maydell@linaro.org</a>&g=
t; wrote:<br>
&gt;&gt; &gt; So what is missing in the QEMU-provided DTB that it needs?<br=
>
&gt;&gt;<br>
&gt;&gt; Quite a lot. Here are some examples:<br>
&gt;&gt;<br>
&gt;&gt; U-Boot has limited pre-relocation memory so tries to avoid<br>
&gt;&gt; binding/probing devices that are not used before relocation:<br>
&gt;&gt;<br>
&gt;&gt; <a href=3D"https://u-boot.readthedocs.io/en/latest/develop/driver-=
model/design.html#pre-relocation-support" rel=3D"noreferrer" target=3D"_bla=
nk">https://u-boot.readthedocs.io/en/latest/develop/driver-model/design.htm=
l#pre-relocation-support</a><br>
&gt;<br>
&gt; It&#39;s up to u-boot to decide what it wants to touch and<br>
&gt; what it does not. QEMU tells u-boot what all the available<br>
&gt; devices are; I don&#39;t think we should have extra stuff saying<br>
&gt; &quot;and if you are u-boot, do something odd&quot;.<br>
&gt;<br>
&gt;&gt; There is a configuration node (which is likely to change form in<b=
r>
&gt;&gt; future releases, but will still be there)<br>
&gt;&gt;<br>
&gt;&gt; <a href=3D"https://github.com/u-boot/u-boot/blob/master/doc/device=
-tree-bindings/config.txt" rel=3D"noreferrer" target=3D"_blank">https://git=
hub.com/u-boot/u-boot/blob/master/doc/device-tree-bindings/config.txt</a><b=
r>
&gt;<br>
&gt; I think u-boot should be storing this kind of thing somewhere<br>
&gt; else (e.g. as part of the binary blob that is u-boot itself,<br>
&gt; or stored in flash or RAM as a separate blob).<br>
&gt;<br>
&gt;&gt; Then there are various features which put things in U-Boot&#39;s c=
ontrol<br>
&gt;&gt; dtb, such as verified boot, which adds public keys during signing:=
<br>
&gt;&gt;<br>
&gt;&gt; <a href=3D"https://github.com/u-boot/u-boot/blob/master/doc/uImage=
.FIT/signature.txt#L135" rel=3D"noreferrer" target=3D"_blank">https://githu=
b.com/u-boot/u-boot/blob/master/doc/uImage.FIT/signature.txt#L135</a><br>
&gt;&gt;<br>
&gt;&gt; More generally, the U-Boot tree has hundreds of files which add<br=
>
&gt;&gt; properties for each board, since we try to keep the U-Boot-specifi=
c<br>
&gt;&gt; things out of the Linux tree:<br>
&gt;&gt;<br>
&gt;&gt; $ find . -name *u-boot.dtsi |wc -l<br>
&gt;&gt; 398<br>
&gt;<br>
&gt; If any of this is actual information about the hardware then you<br>
&gt; should sort out getting the bindings documented officially<br>
&gt; (which I think is still in the Linux tree), and then QEMU can<br>
&gt; provide them.<br>
&gt;<br>
&gt;&gt; Quite a bit of this is to do with SPL and so far it seems that QEM=
U<br>
&gt;&gt; mostly runs U-Boot proper only, although I see that SPL is startin=
g to<br>
&gt;&gt; creep in too in the U-Boot CI.<br>
&gt;&gt;<br>
&gt;&gt; So at present QEMU is not able to support U-Boot fully.<br>
&gt;<br>
&gt; My take is that this is u-boot doing weird custom things with<br>
&gt; the DTB that aren&#39;t &quot;describe the hardware&quot;. You should =
be able<br>
&gt; to boot u-boot by putting those custom DTB extra things in a<br>
&gt; separate blob and having u-boot combine that with the<br>
&gt; actual DTB when it starts.<br>
<br>
It&#39;s not entirely without precedent - for SPL (which I hope is secondar=
y<br>
program loading) we have things like the guest loader which expands the<br>
plain HW DTB with some information needed by the bootloader and the<br>
primary OS to load additional blobs which have been put into memory.<br>
<br>
In effect the DTB is being expanded as a signalling mechanism similar to<br=
>
things like fw_cfg and other things we use to control boot up. Whether<br>
this affects the &quot;purity&quot; of DTB as a &quot;just the HW&quot; des=
cription is<br>
probably a philosophical question.<br>
<br></blockquote><div>More than a philosophical question: a key aspect of s=
upply chain that need change from</div><div>quite inflexible and tightly co=
upled to loosely coupled.</div><div>=C2=A0A key aspect of it is to maintain=
 &quot;pure&quot; hardware description DTBs at rest.</div><div>Composition =
of DTBs at build time (for products) or runtime (for development boards) sh=
ould be a simple thing.</div><div>Another aspect to take into account is Sy=
stem Device Trees. U-Boot only deal with Cortex-As on a platform,=C2=A0</di=
v><div>so there are multiple device trees for each compute domain. Communit=
ies are working on System Device Tree</div><div>to define the overall platf=
orm with its power and clock domains. A tool &quot;lopper&quot; is being de=
veloped to slide the SDT into diverse domain DTs.</div><div>One of them bei=
ng included into the FIP as the basis for the computing element (Carrier, S=
oM...).</div><div>Those attempts to cleanup passed DTBs from configuration =
data (drivers, bootloaders...) is not incompatible=C2=A0</div><div>with mer=
ging fragments at runtime (for dev boards) or build time (for products).</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left-width:1px;border-left-style:solid;border-left-color:rgb(204,204,204=
);padding-left:1ex">
I agree with Peter that just allowing the merging of arbitrary data into<br=
>
the QEMU generated DTB is going to lead to confusion and breakages.<br>
Indeed I wrote the guest-loader because instructions for booting Xen up<br>
until that point involved dumpdtb and hand hacking the data which was<br>
silly because this is stuff QEMU already knew about.<br>
<br>
&gt;<br>
&gt; -- PMM<br>
<br>
<br>
-- <br>
Alex Benn=C3=A9e<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=
=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr">=
<div><div><div><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><table st=
yle=3D"font-size:small" border=3D"0" cellpadding=3D"0" cellspacing=3D"0"><t=
body><tr><td style=3D"padding-right:10px" valign=3D"top"><img src=3D"https:=
//static.linaro.org/common/images/linaro-logo-web.png"></td><td valign=3D"t=
op"><table border=3D"0" cellpadding=3D"0" cellspacing=3D"0"><tbody><tr><td =
style=3D"font-family:Arial,Helvetica,&quot;Sans Serif&quot;;white-space:now=
rap;font-size:9pt;padding-top:0px;color:rgb(87,87,87)" valign=3D"top"><span=
 style=3D"font-weight:bold">Fran=C3=A7ois-Fr=C3=A9d=C3=A9ric Ozog</span>=C2=
=A0<span style=3D"color:rgb(161,161,161)">|</span>=C2=A0<i>Director Busines=
s Development</i></td></tr><tr><td style=3D"font-family:Arial,Helvetica,&qu=
ot;Sans Serif&quot;;white-space:nowrap;font-size:9pt;padding-top:2px;color:=
rgb(87,87,87)" valign=3D"top">T:=C2=A0<a value=3D"+393384075993" style=3D"c=
olor:rgb(17,85,204)">+33.67221.6485</a><br><a href=3D"mailto:francois.ozog@=
linaro.org" style=3D"color:rgb(87,87,87);text-decoration:none" target=3D"_b=
lank">francois.ozog@linaro.org</a>=C2=A0<span style=3D"color:rgb(161,161,16=
1)">|</span>=C2=A0Skype:=C2=A0ffozog</td></tr></tbody></table></td></tr></t=
body></table></div></div></div></div></div><div><div><br style=3D"font-size=
:small"></div></div></div></div></div></div></div></div></div></div></div><=
/div></div></div></div></div></div>
</div>

--000000000000fa63aa05cfe23afb--
