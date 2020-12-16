Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp653292lfq;
        Wed, 16 Dec 2020 11:58:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyzNPzMDcKspPtU0Kqw7fXZCdQMGm64q9cFOmMlm8pucUSUJasfepvJ9VSzel3KwHCpLPlw
X-Received: by 2002:a25:690c:: with SMTP id e12mr49430641ybc.482.1608148720804;
        Wed, 16 Dec 2020 11:58:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608148720; cv=none;
        d=google.com; s=arc-20160816;
        b=ooWDUj12iKYEBfJVoe0T3kGw+1YLT68aJpQU5/DdjC7GCwaU2/6MKqjTARvZXX8rF3
         5vXChg4KYLMPhBHYJK4RI/jxMGY6p14IUSWgbevnd2FEKERmB4gcHu7TK3069SuR0dg9
         nWzCB5MXYHTSCOyt4j0SCgwWPfcH8t+vAPodheN2BSVQO3kP+OQKJ18YImvjnmZBbsQR
         mt1JTIPODiu5OqE2MgHPLJTVvrF4jmBJwoDjfdUS4SVeR18nDu39JH4I+zIZ/E5FtFVk
         in5Fkbk7izDXV4kzX3nC44RtVrHsgUa815Xz6ZdLDIVOB7XV7qtSfxZvaXoHLuFwqlHy
         4QSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:cc:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:to
         :subject:message-id:date:in-reply-to:references:mime-version
         :dkim-signature;
        bh=BAg5ajEmy6nDCNKoopxLWQprgfoWo+G6KyleFWf9dh0=;
        b=ZemewF70s/suM4UInRQ3oC6Gpun9gv9rqRod8dcTrV1wZdCgo8SK9+P0KXz2yYMsbM
         BvuLCSaNh5JpzblU9lux1C1dmgoTRvPHIDQYczEImDs12RiINr/gOX55+SYblIn2EaKb
         4PN2uRJTlptDm+cUPfw30wK6FEIyR5N+w01KB2NO6qZ1laS5FcPWK5X6zjJ0PllA3EcZ
         z7soR0OqxkwlDy/FcPYELbA4Mi5vIDUZNH1XKLUdjjVp6es5V2fVPipHn8owCB26sT0w
         PWEDHacQWHTxk4G8wNZSmVrbo3awulIuzQS9/xEcMgnCSYLzvuwZhFshRdRyYXJCjRdg
         vTeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b="p/+z677d";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t11si1953099ybj.19.2020.12.16.11.58.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Dec 2020 11:58:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b="p/+z677d";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:53594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kpcwZ-0002ow-WD
	for alex.bennee@linaro.org; Wed, 16 Dec 2020 14:58:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1kpcwK-0002kt-Nu
 for qemu-arm@nongnu.org; Wed, 16 Dec 2020 14:58:26 -0500
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b]:38820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wuhaotsh@google.com>)
 id 1kpcwC-0005Pr-Ly
 for qemu-arm@nongnu.org; Wed, 16 Dec 2020 14:58:23 -0500
Received: by mail-lf1-x12b.google.com with SMTP id h205so7957950lfd.5
 for <qemu-arm@nongnu.org>; Wed, 16 Dec 2020 11:58:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=BAg5ajEmy6nDCNKoopxLWQprgfoWo+G6KyleFWf9dh0=;
 b=p/+z677ddYah1yBw3aIWnlVKJYLhcPm2tjGaAcpAnJKLFb1DUqPaIcOOelKez9u9bs
 9+rUApbhs2tjYJEb3P1Xx341Kn+XyPVYrhd5uosOC7rFQKy/IOdqypr2QhfolyVFJqlP
 FmDxfH4p+BymOL7Jw7ATLDnVi7mFp5hfFQ3Jb9B+kcOnEqT11vPfEeuJQ8mGF8FnJ4K1
 3n2+YiS8p1Fk332Kj8VoMh+FAY1fv1J2jEzNNa3Z6mzIhN6CX6aSGpXmpv5PLoFQatjv
 Gubst1LmdyYoQ+dz9wl1Q2XAJd1pSdbYznv7nneJnKDrlJKWtOYCPAHnZrL1J4rc6NkX
 X97Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BAg5ajEmy6nDCNKoopxLWQprgfoWo+G6KyleFWf9dh0=;
 b=fswD9PYbH7IOyODMfAQVPFI1N4qP8RdKi0Z/ekqUPj3GBsl5oI/Ydfk6Tlei1VKwvu
 h1J4EmN/DIX4JFrA/5rf8ybPBPCZoTKcgrm/ifQT/g5piOT9ZFBDTA40J2dvcWEdK1et
 Cm3Ennj05OiNmjtJkc7Mr9Tle09lsYKEZGNbNcgrB9Bnl+/ZvuG517sF4Os8ZjwA30zT
 ztGLQXV+FVf3bhTZFWbvMmhFfiAa6t4kTSOFQeAIv3S22NnBPEsB7ADexuda5F435EDl
 FA5+CstVSVU0CXeAZbeqjRFnqeDS0giWoxMqtJUyKC3sFhln/LAJQe5Ljc34sFHKEID3
 gRCA==
X-Gm-Message-State: AOAM531x0vrbsqlhVy7QXc99FIzpIMfHBRkx7Ygrj5rNI2Q7BDmgQP9w
 HnIb4+2ZEtPaXrLINR7xttOXq8oWMwYm+3nzLit08g==
X-Received: by 2002:ac2:59ce:: with SMTP id x14mr13562378lfn.545.1608148691054; 
 Wed, 16 Dec 2020 11:58:11 -0800 (PST)
MIME-Version: 1.0
References: <20201215001312.3120777-1-wuhaotsh@google.com>
 <20201215001312.3120777-5-wuhaotsh@google.com>
 <CAFEAcA_Nd0TNjiXkPXp7T29BYO2PnQLQUAFhEg+AR87B8YP+kA@mail.gmail.com>
In-Reply-To: <CAFEAcA_Nd0TNjiXkPXp7T29BYO2PnQLQUAFhEg+AR87B8YP+kA@mail.gmail.com>
Date: Wed, 16 Dec 2020 11:57:59 -0800
Message-ID: <CAGcCb10PXNFT+oxUi1OD=XcvdybOM2s5YHcjDSA+XARSXVNKmw@mail.gmail.com>
Subject: Re: [PATCH v3 4/5] hw/misc: Add a PWM module for NPCM7XX
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000007a766f05b69a4b1f"
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=wuhaotsh@google.com; helo=mail-lf1-x12b.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=unavailable autolearn_force=no
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
Cc: Corey Minyard <minyard@acm.org>, Patrick Venture <venture@google.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 QEMU Developers <qemu-devel@nongnu.org>, CS20 KFTing <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, IS20 Avi Fishman <Avi.Fishman@nuvoton.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to: Hao Wu <wuhaotsh@google.com>
From: Hao Wu via <qemu-arm@nongnu.org>
X-TUID: 1fay8HLysp1r

--0000000000007a766f05b69a4b1f
Content-Type: text/plain; charset="UTF-8"

Thanks for the review. We can add a patch in this patchset to fix this
issue.

On Wed, Dec 16, 2020 at 11:02 AM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Tue, 15 Dec 2020 at 00:13, Hao Wu <wuhaotsh@google.com> wrote:
> >
> > The PWM module is part of NPCM7XX module. Each NPCM7XX module has two
> > identical PWM modules. Each module contains 4 PWM entries. Each PWM has
> > two outputs: frequency and duty_cycle. Both are computed using inputs
> > from software side.
> >
> > This module does not model detail pulse signals since it is expensive.
> > It also does not model interrupts and watchdogs that are dependant on
> > the detail models. The interfaces for these are left in the module so
> > that anyone in need for these functionalities can implement on their
> > own.
> >
> > The user can read the duty cycle and frequency using qom-get command.
> >
> > Reviewed-by: Havard Skinnemoen <hskinnemoen@google.com>
> > Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
> > Signed-off-by: Hao Wu <wuhaotsh@google.com>
>
>
> > +static void npcm7xx_pwm_init(Object *obj)
> > +{
> > +    NPCM7xxPWMState *s = NPCM7XX_PWM(obj);
> > +    SysBusDevice *sbd = &s->parent;
>
> This isn't right. A device shouldn't be poking around
> in the 'parent' or 'parentobj' member of its struct --
> that is a QOM internal. If you want "this device, cast
> to a SysBusDevice", the way to write that is:
>    SysBusDevice *sbd = SYS_BUS_DEVICE(s);
>
> (or you could pass 'obj'; same thing).
>
> Looking at the code currently in the tree it also is making this
> same mistake:
>
> $ git grep -- '->parent' hw/*/npcm*
> hw/arm/npcm7xx_boards.c:    MachineClass *mc = &nmc->parent;
> hw/mem/npcm7xx_mc.c:    sysbus_init_mmio(&s->parent, &s->mmio);
> hw/misc/npcm7xx_clk.c:    sysbus_init_mmio(&s->parent, &s->iomem);
> hw/misc/npcm7xx_gcr.c:    sysbus_init_mmio(&s->parent, &s->iomem);
> hw/misc/npcm7xx_rng.c:    sysbus_init_mmio(&s->parent, &s->iomem);
> hw/nvram/npcm7xx_otp.c:    SysBusDevice *sbd = &s->parent;
> hw/ssi/npcm7xx_fiu.c:    SysBusDevice *sbd = &s->parent;
> hw/timer/npcm7xx_timer.c:    SysBusDevice *sbd = &s->parent;
>
> These all should be using QOM cast macros. Would somebody
> who's working on these devices like to send a patch ?
>
> thanks
> -- PMM
>

--0000000000007a766f05b69a4b1f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks for the review. We can add a patch in this patchset=
 to fix this issue.</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Wed, Dec 16, 2020 at 11:02 AM Peter Maydell &lt;<a hr=
ef=3D"mailto:peter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Tue, 15 D=
ec 2020 at 00:13, Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com" target=
=3D"_blank">wuhaotsh@google.com</a>&gt; wrote:<br>
&gt;<br>
&gt; The PWM module is part of NPCM7XX module. Each NPCM7XX module has two<=
br>
&gt; identical PWM modules. Each module contains 4 PWM entries. Each PWM ha=
s<br>
&gt; two outputs: frequency and duty_cycle. Both are computed using inputs<=
br>
&gt; from software side.<br>
&gt;<br>
&gt; This module does not model detail pulse signals since it is expensive.=
<br>
&gt; It also does not model interrupts and watchdogs that are dependant on<=
br>
&gt; the detail models. The interfaces for these are left in the module so<=
br>
&gt; that anyone in need for these functionalities can implement on their<b=
r>
&gt; own.<br>
&gt;<br>
&gt; The user can read the duty cycle and frequency using qom-get command.<=
br>
&gt;<br>
&gt; Reviewed-by: Havard Skinnemoen &lt;<a href=3D"mailto:hskinnemoen@googl=
e.com" target=3D"_blank">hskinnemoen@google.com</a>&gt;<br>
&gt; Reviewed-by: Tyrone Ting &lt;<a href=3D"mailto:kfting@nuvoton.com" tar=
get=3D"_blank">kfting@nuvoton.com</a>&gt;<br>
&gt; Signed-off-by: Hao Wu &lt;<a href=3D"mailto:wuhaotsh@google.com" targe=
t=3D"_blank">wuhaotsh@google.com</a>&gt;<br>
<br>
<br>
&gt; +static void npcm7xx_pwm_init(Object *obj)<br>
&gt; +{<br>
&gt; +=C2=A0 =C2=A0 NPCM7xxPWMState *s =3D NPCM7XX_PWM(obj);<br>
&gt; +=C2=A0 =C2=A0 SysBusDevice *sbd =3D &amp;s-&gt;parent;<br>
<br>
This isn&#39;t right. A device shouldn&#39;t be poking around<br>
in the &#39;parent&#39; or &#39;parentobj&#39; member of its struct --<br>
that is a QOM internal. If you want &quot;this device, cast<br>
to a SysBusDevice&quot;, the way to write that is:<br>
=C2=A0 =C2=A0SysBusDevice *sbd =3D SYS_BUS_DEVICE(s);<br>
<br>
(or you could pass &#39;obj&#39;; same thing).<br>
<br>
Looking at the code currently in the tree it also is making this<br>
same mistake:<br>
<br>
$ git grep -- &#39;-&gt;parent&#39; hw/*/npcm*<br>
hw/arm/npcm7xx_boards.c:=C2=A0 =C2=A0 MachineClass *mc =3D &amp;nmc-&gt;par=
ent;<br>
hw/mem/npcm7xx_mc.c:=C2=A0 =C2=A0 sysbus_init_mmio(&amp;s-&gt;parent, &amp;=
s-&gt;mmio);<br>
hw/misc/npcm7xx_clk.c:=C2=A0 =C2=A0 sysbus_init_mmio(&amp;s-&gt;parent, &am=
p;s-&gt;iomem);<br>
hw/misc/npcm7xx_gcr.c:=C2=A0 =C2=A0 sysbus_init_mmio(&amp;s-&gt;parent, &am=
p;s-&gt;iomem);<br>
hw/misc/npcm7xx_rng.c:=C2=A0 =C2=A0 sysbus_init_mmio(&amp;s-&gt;parent, &am=
p;s-&gt;iomem);<br>
hw/nvram/npcm7xx_otp.c:=C2=A0 =C2=A0 SysBusDevice *sbd =3D &amp;s-&gt;paren=
t;<br>
hw/ssi/npcm7xx_fiu.c:=C2=A0 =C2=A0 SysBusDevice *sbd =3D &amp;s-&gt;parent;=
<br>
hw/timer/npcm7xx_timer.c:=C2=A0 =C2=A0 SysBusDevice *sbd =3D &amp;s-&gt;par=
ent;<br>
<br>
These all should be using QOM cast macros. Would somebody<br>
who&#39;s working on these devices like to send a patch ?<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div>

--0000000000007a766f05b69a4b1f--
