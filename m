Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1290379lfm;
        Wed, 17 Jun 2020 22:19:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzq1xvVXHhhsQgqBq/UmDDuHtmK9qK/yaZ0c0nW86QJVNpLqqWWlmKLVqgA1CnmZBDPyUmG
X-Received: by 2002:a25:7146:: with SMTP id m67mr3993767ybc.384.1592457540065;
        Wed, 17 Jun 2020 22:19:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592457540; cv=none;
        d=google.com; s=arc-20160816;
        b=ZRuH1bueFW5nckcscTvxI/l/fi7mUD2KUKSmdex0MD72ut6MmAJqdqHig2KPf+T3DJ
         wp23UtFJbfl4D+vmikqd6f9cEC/wfy7MIQ+ZfYrocKYK2blpI1Trmfd4TOFlOBpCuiRi
         wWFOf57/n0wHrxvM7JY2Hwcjid1iil+k6zb2JiwlE7x6HyCoZIVCfeD2mP0k/gXYQ3Bp
         k5ZtHrGsUrv1s0FADwmuqp6G6X8+p9aomEFB2g5FeMKeXzCghQ5sBggkQR50kGicpQ1N
         seUPHJZR8IndAxwSwlCDv94X38yVIWRrNBMvkQnsF9XcTLjXMOxtNjcbNSWZExreccP8
         kPIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=cRkXtAZzmD7NnofcJ9cEx2DKzDMxZP3NojzrQ5SZjF4=;
        b=IIGQgagiNcq3oX1wglXFti4QTlIp8uXNdg+Vk2nkPXmucO1j0PlXwfZhb7KZxADUJK
         d+bYH14s2+NwkdaSiRr83sgQcTQiyphxEI7Zjte/r8EXFvnaTR9fbnNv9z05zKLF4nIP
         hY3XcD8uI8kqw+hD+fYse2s60E9ubgZD3rJJfsvJd0CAituRBW3nmsZtymzdiy3Ahb4u
         P71QXLY6QaRA6lNK0c7tH5SOqxreTv2qti+hEjT97upiQzQq7ZWggLdOm40w4fSKverv
         0nIPa+oQgSi0tQUWxieBoBGTNdQVgLkForJp4xlOK//EhATI3/eJk4KPIkw5+a1EvT1p
         Jr9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=QhQ5hde1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x124si1633903ybc.82.2020.06.17.22.18.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 17 Jun 2020 22:19:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=QhQ5hde1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:47600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlmx1-0002pK-DB
	for alex.bennee@linaro.org; Thu, 18 Jun 2020 01:18:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1jlmtn-0005o7-Hv
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 01:15:39 -0400
Received: from mail-vs1-xe41.google.com ([2607:f8b0:4864:20::e41]:33807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1jlmtk-0002NB-Q0
 for qemu-arm@nongnu.org; Thu, 18 Jun 2020 01:15:39 -0400
Received: by mail-vs1-xe41.google.com with SMTP id q2so2804763vsr.1
 for <qemu-arm@nongnu.org>; Wed, 17 Jun 2020 22:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cRkXtAZzmD7NnofcJ9cEx2DKzDMxZP3NojzrQ5SZjF4=;
 b=QhQ5hde1wf/YZMVzWZLuY5da6qNVSu4et2a4KCRfXkEx3dIh5dw1oioSl+xO/1dAA1
 F57k4mheWusCAexCzcC/+QbwTpYgrmog6EX6OPnFJBEvkIhCtLUXa4tKUfxIlzdYHhuG
 wFS/rFMkJ4CaZZIt0XMYcsD5BjGXEdhVqg1+8LnpX/sDC1IeQspgZL7IlFz24bQVEISo
 yfOt7nbIWHyOZ8nROmf5JlTvsA45qYn4QUq/NJwcXuPh12uQQeKX3baHDnxjNxD6N4nl
 gHVPOkPwi9EOqJhhVk3z8fJkVs46kxI4A2So6X6seMNSTBekd8xgkHkAGiyI2ulh51Se
 w9CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cRkXtAZzmD7NnofcJ9cEx2DKzDMxZP3NojzrQ5SZjF4=;
 b=o0qfIgZf18GkWk+ae7BiJJxOZ44j1ZwuDFLU9QUbL6HzTlVYu+HG774VGIfreIlJYg
 tkNQ/iqCYAdq21SLkYjTV849degQEXa5aHM1ShtDXW1YbWasjD5D4hLbAWq/dx2jCNNb
 enLZTZo19XzH28Cdv3jIKP6C6CNmandbGGJLYHPYclsdMqjBMPA+O7EOYY4XgRF6Q2ji
 XPLk705V0e5+sXqByDL9kmvxd/I7+yynxpAI0q/g3C2RdrqOyZo2fm1ixHR/KK4J5EF/
 EgrJJ/qqKnaXJXlXSDOWh5lYM8gcOASBu9ipFpYUUsaPw+3d/+Rvtr5d0VNJ8GhKaLUj
 2JiA==
X-Gm-Message-State: AOAM531phLI0haVGJiheRY7a1E0rzU5xJHarFyDWPGfSdpdo750P1V8p
 K90iTxIZwAGkMyecVRvyxJLsa8rNRLylvUsxdFYDFw==
X-Received: by 2002:a67:ad16:: with SMTP id t22mr1960651vsl.152.1592457332343; 
 Wed, 17 Jun 2020 22:15:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200611223016.259837-1-hskinnemoen@google.com>
 <49cf918e-7c03-8e51-6080-a136ad25ba0e@kaod.org>
In-Reply-To: <49cf918e-7c03-8e51-6080-a136ad25ba0e@kaod.org>
From: Havard Skinnemoen <hskinnemoen@google.com>
Date: Wed, 17 Jun 2020 22:15:20 -0700
Message-ID: <CAFQmdRbJsAT19QBMiS3BRpiDTWdUL5MocazsvH1FkkPo5eZ7tA@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] Add Nuvoton NPCM730/NPCM750 SoCs and two BMC
 machines
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>, 
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
 IS20 Avi Fishman <Avi.Fishman@nuvoton.com>,
 CS20 KFTing <kfting@nuvoton.com>
Content-Type: multipart/alternative; boundary="0000000000009df81405a854dddd"
Received-SPF: pass client-ip=2607:f8b0:4864:20::e41;
 envelope-from=hskinnemoen@google.com; helo=mail-vs1-xe41.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -185
X-Spam_score: -18.6
X-Spam_bar: ------------------
X-Spam_report: (-18.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001,
 USER_IN_DEF_DKIM_WL=-7.5, USER_IN_DEF_SPF_WL=-7.5 autolearn=_AUTOLEARN
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
X-TUID: E0XRdxLn7a5A

--0000000000009df81405a854dddd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 17, 2020 at 8:54 AM C=C3=A9dric Le Goater <clg@kaod.org> wrote:

> Hello,
>
> On 6/12/20 12:30 AM, Havard Skinnemoen wrote:
> > This patch series models enough of the Nuvoton NPCM730 and NPCM750 SoCs
> to boot
> > an OpenBMC image built for quanta-gsj. This includes device models for:
> >
> >   - Global Configuration Registers
> >   - Clock Control
> >   - Timers
> >   - Fuses
> >   - Memory Controller
> >   - Flash Controller
>
> Do you have a git tree for this patchset ?
>

Yes, but nothing public. I can set up a github fork if you want.


> > These modules, along with the existing Cortex A9 CPU cores and built-in
> > peripherals, are integrated into a NPCM730 or NPCM750 SoC, which in tur=
n
> form
> > the foundation for the quanta-gsj and npcm750-evb machines,
> respectively. The
> > two SoCs are very similar; the only difference is that NPCM730 is
> missing some
> > peripherals that NPCM750 has, and which are not considered essential fo=
r
> > datacenter use (e.g. graphics controllers). For more information, see
> >
> > https://www.nuvoton.com/products/cloud-computing/ibmc/
> >
> > Both quanta-gsj and npcm750-evb correspond to real boards supported by
> OpenBMC.
> > While this initial series uses a stripped-down kernel for testing, futu=
re
> > series will be tested using OpenBMC images built from public sources. I=
'm
> > currently putting the finishing touches on flash controller support,
> which is
> > necessary to boot a full OpenBMC image, and will be enabled by the next
> series.
>
> ok.
>
> It would be nice to be able to download the images from some site
> like we do for Aspeed.
>

It looks like Joel got this covered for gsj. I'll look into
setting something up for npcm750-evb.


>
> > The patches in this series were developed by Google and reviewed by
> Nuvoton. We
> > will be maintaining the machine and peripheral support together.
> >
> > The data sheet for these SoCs is not generally available. Please let me
> know if
> > more comments are needed to understand the device behavior.
> >
> > Changes since v1 (requested by reviewers):
> >
> >   - Clarify the source of CLK reset values.
> >   - Made smpboot a constant byte array, eliinated byte swapping.
>
> I have revived a PPC64 host. We might want to add the swapping back.
>

OK.

Havard

--0000000000009df81405a854dddd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, Jun 17, 2020 at 8:54 AM C=C3=A9dr=
ic Le Goater &lt;<a href=3D"mailto:clg@kaod.org">clg@kaod.org</a>&gt; wrote=
:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">Hello,<br>
<br>
On 6/12/20 12:30 AM, Havard Skinnemoen wrote:<br>
&gt; This patch series models enough of the Nuvoton NPCM730 and NPCM750 SoC=
s to boot<br>
&gt; an OpenBMC image built for quanta-gsj. This includes device models for=
:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0- Global Configuration Registers<br>
&gt;=C2=A0 =C2=A0- Clock Control<br>
&gt;=C2=A0 =C2=A0- Timers<br>
&gt;=C2=A0 =C2=A0- Fuses<br>
&gt;=C2=A0 =C2=A0- Memory Controller<br>
&gt;=C2=A0 =C2=A0- Flash Controller<br>
<br>
Do you have a git tree for this patchset ? <br></blockquote><div><br></div>=
<div>Yes, but nothing public. I can set up a github fork if you want.</div>=
<div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; These modules, along with the existing Cortex A9 CPU cores and built-i=
n<br>
&gt; peripherals, are integrated into a NPCM730 or NPCM750 SoC, which in tu=
rn form<br>
&gt; the foundation for the quanta-gsj and npcm750-evb machines, respective=
ly. The<br>
&gt; two SoCs are very similar; the only difference is that NPCM730 is miss=
ing some<br>
&gt; peripherals that NPCM750 has, and which are not considered essential f=
or<br>
&gt; datacenter use (e.g. graphics controllers). For more information, see<=
br>
&gt; <br>
&gt; <a href=3D"https://www.nuvoton.com/products/cloud-computing/ibmc/" rel=
=3D"noreferrer" target=3D"_blank" class=3D"cremed">https://www.nuvoton.com/=
products/cloud-computing/ibmc/</a><br>
&gt; <br>
&gt; Both quanta-gsj and npcm750-evb correspond to real boards supported by=
 OpenBMC.<br>
&gt; While this initial series uses a stripped-down kernel for testing, fut=
ure<br>
&gt; series will be tested using OpenBMC images built from public sources. =
I&#39;m<br>
&gt; currently putting the finishing touches on flash controller support, w=
hich is<br>
&gt; necessary to boot a full OpenBMC image, and will be enabled by the nex=
t series.<br>
<br>
ok. <br>
<br>
It would be nice to be able to download the images from some site<br>
like we do for Aspeed.<br></blockquote><div><br></div><div>It looks like Jo=
el got this covered for gsj. I&#39;ll look into setting=C2=A0something up f=
or npcm750-evb.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
<br>
&gt; The patches in this series were developed by Google and reviewed by Nu=
voton. We<br>
&gt; will be maintaining the machine and peripheral support together.<br>
&gt; <br>
&gt; The data sheet for these SoCs is not generally available. Please let m=
e know if<br>
&gt; more comments are needed to understand the device behavior.<br>
&gt; <br>
&gt; Changes since v1 (requested by reviewers):<br>
&gt; <br>
&gt;=C2=A0 =C2=A0- Clarify the source of CLK reset values.<br>
&gt;=C2=A0 =C2=A0- Made smpboot a constant byte array, eliinated byte swapp=
ing.<br>
<br>
I have revived a PPC64 host. We might want to add the swapping back.<br></b=
lockquote><div><br></div><div>OK.</div><div><br></div><div>Havard</div></di=
v></div>

--0000000000009df81405a854dddd--
