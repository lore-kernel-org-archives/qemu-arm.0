Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp58789lfp;
        Thu, 23 Sep 2021 04:09:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyRJJ8Dn8XqslxvGBqu8sqvJgCLw6YIfjK/a+cZj6MpYDVZhYw7+b3uuSam64Q9SxDsBZta
X-Received: by 2002:a05:6102:222d:: with SMTP id d13mr3289484vsb.2.1632395377592;
        Thu, 23 Sep 2021 04:09:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632395377; cv=none;
        d=google.com; s=arc-20160816;
        b=wLvVpkC+LIEd/7V836Br2LyojPqIqHNj6wvWN9z7gPKIK12IJ7QjL/ochnGSq4u7hs
         xPGkTv8vIRvzE2LMKNnxdlgAPlhEpl00GzPbW2Yfy8vMykTZGqECdw+nbG9DFvXOzY/z
         tdhueQAwyq89AMahdq/8B1ChaFZTDaALBcfCoke4imWSQ6VcIKcFs4nlnzAoMV3jCgrF
         YSz7IiUn30N+OTmk8Ta+7md+UHVy36bUZ9tvZ0s42cjQkLCkfi6ro69PlewMFFovbir3
         sIsrgHW44royjf/iEDiI0jB1uH5iMVUleUbz8zeMQqBd8g6PypVcRkbJI5e71/G9NrZB
         vOIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tEDhWSGZWAsWXkT8KJtlYMdlGChvsonvqKodSpUdLD8=;
        b=e7uq4lJj2MhiUOpffP/Y9BKXWs6b889y+wSXwrQTK12EYN0Mc8hwcopHzjyMv+GN6h
         taZZjqQkSya37RzcZdlcCTngMI5avABxqBX+YUib68O2GTGT3+PuAYEjDENnYwu85+dV
         kcwJqnAANuiVLkpKZY2iOdO8syXyVyGMzx0wZBGkDk6Lk+X+w3Uu5s9FNHGXsi00RCei
         kE5li1opvZFaM+NI/vsEN7hVQpBHmJu98HGRt/4CFUDJ9W5V5ErKyxehgnb3qHm5CVqj
         35kK4G8nFNaEf0/1zfkcwhMD2zBoa9chPtxaF2qmyvntED9J78h2kyxHW/JGP2GrtGLe
         +wCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b="XLs/sKPJ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d11si186724vsr.450.2021.09.23.04.09.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Sep 2021 04:09:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b="XLs/sKPJ";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:50782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mTMbg-0006fU-Sw
	for alex.bennee@linaro.org; Thu, 23 Sep 2021 07:09:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <irakatz51@gmail.com>)
 id 1mTMbH-0006Wr-Ah
 for qemu-arm@nongnu.org; Thu, 23 Sep 2021 07:09:14 -0400
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129]:40826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <irakatz51@gmail.com>)
 id 1mTMbC-00047R-IE
 for qemu-arm@nongnu.org; Thu, 23 Sep 2021 07:09:09 -0400
Received: by mail-lf1-x129.google.com with SMTP id b15so24578139lfe.7
 for <qemu-arm@nongnu.org>; Thu, 23 Sep 2021 04:09:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tEDhWSGZWAsWXkT8KJtlYMdlGChvsonvqKodSpUdLD8=;
 b=XLs/sKPJcFF0DUUmoUKeCzlfTsYkfc9vLm8fmDKOsTlSUEaSPU3NPz+ndU58Hj8Z/y
 qkWIJ7PHewPcvY+JVgO4Hqw2R3k58J8BqPI0CmRVq4y+HDVXZ20BqxazKCmEEMx3iY4q
 TP6vbXKKsk5BWHqyb/voWI+c9uGjiPfGyTwI6yoN6yM7kMg8TEUZLlP+KD32muLupd98
 6tc8de8V9ItFm9wIigzH6tBC59SMK43vFI177dkC9XaXWRLcGZZ36y1W8DRbnmQ8DzwC
 BeUiPrrsAwUwsclxo9qIdjXst1jhSGjtg0dOmPkSzyfeaIyh9mfcjB76OT1Eb5FV4x3Y
 do3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tEDhWSGZWAsWXkT8KJtlYMdlGChvsonvqKodSpUdLD8=;
 b=LpZUo2+x6kNvnGETpGT/2PAZMpr5qaZsJ7ux1C/uZwlAZ51ICkooldSMfHnKs8WXv6
 pQSAia8F4CeRwKQQzHZBE+/MhfM/Hswv13zIKRNb+Ds0A7zwbp2Ub4L3q7MNQLORXYNl
 pDyRDQPZFBhvp3HH2is9sDYTX5InS6FvoLybVACLLVl7OWp8PhtMwirn7nk9w39Z0gOj
 hX6pUrxfhu8IaSO7/kA2GEV/XhNK4bsDvJaNFdBswfMe3dYru+Gv21oLI2vcAvX1XtfY
 uaZnC/nWNzndVT/tiW42AnsTcMwnZJvPyvifL3Mum1ZQPtT4LKAc+BtBsyCACE0ncCcD
 IxKA==
X-Gm-Message-State: AOAM532YE4QkUe9u/yBa+H7ASivTbozNBJCpFZj3sLjYuBZc0w/tQIlc
 UPj9wbCLsBHNF90+wQepZHY1dNjN92BNeHmAo8A=
X-Received: by 2002:a05:6512:22d5:: with SMTP id
 g21mr3558550lfu.270.1632395344546; 
 Thu, 23 Sep 2021 04:09:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAFLP=uCeyj+MK_a_BgC27Gr_=MC7w+-_08xJsrUC+bHvV8KWWw@mail.gmail.com>
 <CAFEAcA-vpTqu+dX=CFCihWVC1FQSbXvQPdyPHg3P+0Rd40wdWA@mail.gmail.com>
In-Reply-To: <CAFEAcA-vpTqu+dX=CFCihWVC1FQSbXvQPdyPHg3P+0Rd40wdWA@mail.gmail.com>
From: Chenxu Wang <irakatz51@gmail.com>
Date: Thu, 23 Sep 2021 19:08:53 +0800
Message-ID: <CAFLP=uCmE71pVfB5xNUvF6sZn+srqnK4Qo4KwGJ-QhT79jr0qA@mail.gmail.com>
Subject: Re: Failed to execute "SMC" call on Guest OS.
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="000000000000a50dbb05cca7a80f"
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=irakatz51@gmail.com; helo=mail-lf1-x129.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hPQeP5A8A53l

--000000000000a50dbb05cca7a80f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

In my FVP, I want to write a Trusted Application (TA) and want my Guest OS
to call the application. Therefore, I require Guest OS to use "SMC"
instruction.

So if I want to provide a TA interface to Guest OS, what should I do?  Must
I modify KVM, or QEMU, or both?

Sincerely
Wang Chenxu

PS: I Still do not know how to reply to the thread in the mailing list,
maybe cc the mailing list is OK?


Peter Maydell <peter.maydell@linaro.org> =E4=BA=8E2021=E5=B9=B49=E6=9C=8823=
=E6=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=885:16=E5=86=99=E9=81=93=EF=BC=
=9A

> On Thu, 23 Sept 2021 at 08:38, Chenxu Wang <irakatz51@gmail.com> wrote:
> >
> > Hi all,
> >
> > In the Host OS, I make a smc call and get the correct return.
> > Also, the Host OS enables KVM support. (specifically, it supports VHE,
> so Host is running on EL2)
> >
> > Then I run a qemu-system-aarch64 to run a guest OS, with KVM support.
> Here I use a QEMU v2.9. I pre-load a helloworld module in the ramdisk.img=
,
> in the module it contains a SMC call.
> >
> > My booting instructions are listed below.
> >
> > ./qemu-system-aarch64 -nographic -kernel Image -initrd ramdisk.img -m
> 512 -machine virt,accel=3Dkvm -cpu host -append "console=3DttyAMA0
> init=3D/liunxrc root=3D/dev/ram0 rw rootfstype=3Dext4"
> >
> > Then I execute the module, it says
> >
> > insmod[1086]: undefined instruction: pc=3Dffff0000008b5060
> > Code: 95e2c44a 580002e0 95e2c448 18000360 (d4000003)
>
> This happens because your guest is making an SMC call, which
> it should not be doing. Inside the VM, your guest is running
> on the "virt" board. The DTB tells the guest that it should
> use the HVC call to make PSCI calls. There is nothing that tells
> the guest that SMC will do anything sensible.
>
> I don't know what your guest code expects the SMC to do, but
> QEMU and KVM are unlikely to be able to provide it. (The behaviour
> of KVM has changed in this area for different host kernel versions:
> older kernels made the SMC UNDEF; newer ones make it set X0 to -1
> and advance the PC past the SMC. TCG QEMU currently still UNDEFs.)
>
> thanks
> -- PMM
>

--000000000000a50dbb05cca7a80f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<div><br></div><div><div>In my FVP, I want to write=
 a Trusted Application (TA) and want my Guest OS to call the application. T=
herefore, I require Guest OS to use &quot;SMC&quot; instruction.</div><div>=
<br></div><div>So if I want to provide a TA=C2=A0interface to=C2=A0Guest=C2=
=A0OS, what=C2=A0should I do?=C2=A0 Must I modify KVM, or QEMU,=C2=A0or bot=
h?</div><div><br></div><div>Sincerely</div><div>Wang Chenxu</div></div><div=
><br></div><div>PS: I Still do not know how to reply to the thread in the m=
ailing list, maybe cc the mailing list=C2=A0is OK?</div><div><br></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Peter Mayd=
ell &lt;<a href=3D"mailto:peter.maydell@linaro.org" target=3D"_blank">peter=
.maydell@linaro.org</a>&gt; =E4=BA=8E2021=E5=B9=B49=E6=9C=8823=E6=97=A5=E5=
=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=885:16=E5=86=99=E9=81=93=EF=BC=9A<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">On Thu, 23 Sept 2021 at 0=
8:38, Chenxu Wang &lt;<a href=3D"mailto:irakatz51@gmail.com" target=3D"_bla=
nk">irakatz51@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi all,<br>
&gt;<br>
&gt; In the Host OS, I make a smc call and get the correct return.<br>
&gt; Also, the Host OS enables KVM support. (specifically, it supports VHE,=
 so Host is running on EL2)<br>
&gt;<br>
&gt; Then I run a qemu-system-aarch64 to run a guest OS, with KVM support. =
Here I use a QEMU v2.9. I pre-load a helloworld module in the ramdisk.img, =
in the module it contains a SMC call.<br>
&gt;<br>
&gt; My booting instructions are listed below.<br>
&gt;<br>
&gt; ./qemu-system-aarch64 -nographic -kernel Image -initrd ramdisk.img -m =
512 -machine virt,accel=3Dkvm -cpu host -append &quot;console=3DttyAMA0 ini=
t=3D/liunxrc root=3D/dev/ram0 rw rootfstype=3Dext4&quot;<br>
&gt;<br>
&gt; Then I execute the module, it says<br>
&gt;<br>
&gt; insmod[1086]: undefined instruction: pc=3Dffff0000008b5060<br>
&gt; Code: 95e2c44a 580002e0 95e2c448 18000360 (d4000003)<br>
<br>
This happens because your guest is making an SMC call, which<br>
it should not be doing. Inside the VM, your guest is running<br>
on the &quot;virt&quot; board. The DTB tells the guest that it should<br>
use the HVC call to make PSCI calls. There is nothing that tells<br>
the guest that SMC will do anything sensible.<br>
<br>
I don&#39;t know what your guest code expects the SMC to do, but<br>
QEMU and KVM are unlikely to be able to provide it. (The behaviour<br>
of KVM has changed in this area for different host kernel versions:<br>
older kernels made the SMC UNDEF; newer ones make it set X0 to -1<br>
and advance the PC past the SMC. TCG QEMU currently still UNDEFs.)<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div></div>

--000000000000a50dbb05cca7a80f--
