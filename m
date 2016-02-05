Received: by 10.25.159.19 with SMTP id i19csp44288lfe;
        Fri, 5 Feb 2016 09:04:59 -0800 (PST)
X-Received: by 10.55.25.169 with SMTP id 41mr18135694qkz.15.1454691898852;
        Fri, 05 Feb 2016 09:04:58 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f106si15715810qge.29.2016.02.05.09.04.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 05 Feb 2016 09:04:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49527 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aRjoY-000658-Bi
	for alex.bennee@linaro.org; Fri, 05 Feb 2016 12:04:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50929)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jl4312@columbia.edu>) id 1aRjoH-0005mc-Sy
	for qemu-arm@nongnu.org; Fri, 05 Feb 2016 12:04:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jl4312@columbia.edu>) id 1aRjoC-0001mB-Nc
	for qemu-arm@nongnu.org; Fri, 05 Feb 2016 12:04:41 -0500
Received: from millet.cc.columbia.edu ([128.59.72.250]:34611)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jl4312@columbia.edu>) id 1aRjoC-0001kb-Jj
	for qemu-arm@nongnu.org; Fri, 05 Feb 2016 12:04:36 -0500
Received: from hazelnut (hazelnut.cc.columbia.edu [128.59.213.250])
	by millet.cc.columbia.edu (8.13.8/8.13.8) with ESMTP id u15H2jo7009764
	for <qemu-arm@nongnu.org>; Fri, 5 Feb 2016 12:04:30 -0500
Received: from hazelnut (localhost.localdomain [127.0.0.1])
	by hazelnut (Postfix) with ESMTP id E758480
	for <qemu-arm@nongnu.org>; Fri,  5 Feb 2016 12:04:30 -0500 (EST)
Received: from paneer.cc.columbia.edu (paneer.cc.columbia.edu [128.59.29.4])
	by hazelnut (Postfix) with ESMTP id D0BFC7E
	for <qemu-arm@nongnu.org>; Fri,  5 Feb 2016 12:04:30 -0500 (EST)
Received: from mail-io0-f174.google.com (mail-io0-f174.google.com
	[209.85.223.174])
	by paneer.cc.columbia.edu (8.14.4/8.14.3) with ESMTP id u15H4Uqv006269
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=NOT)
	for <qemu-arm@nongnu.org>; Fri, 5 Feb 2016 12:04:30 -0500 (EST)
Received: by mail-io0-f174.google.com with SMTP id 9so135589482iom.1
	for <qemu-arm@nongnu.org>; Fri, 05 Feb 2016 09:04:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=xSdqxOa1+BFxHaNwTV6zsoP5iLIfVqN/1W4taAHAKd0=;
	b=QFuxu2ifMm870/FyEnkIDinriGQfFcktysgdElNPpyBubMcE9jmRbCwfT3x+n6kRFY
	35arrlKPlMJroGnLcpSn5cVVG9OFxirA203YCfZHpx5w/x3icLaYgf8NM6U9JHq0lDZL
	Con7J4RkKDs7nkBVrW2m1/BFogBkX+P1bX5jYeEEHoeGFaj68xZ5MPb4hHhxcyVgn0Rf
	Xz+fikbiZQx7mDk2o4syM6BoxvDc9TTk4z/dl4HXoLN3KybzhXngUKG5oboEV5frpmtr
	4hdmCtV3RRfQ+j8DLqaaYPnoueBDGjlKZpn8fAvZqANc5GSwAG0QzbhkuwADoc8Q6Nwv
	iHqw==
X-Gm-Message-State: AG10YORRVQvGYa9YWcAqGgYg8zp2jWe5gUsPCCgFhQ8TzjjQKqLqRDBvN2iJXUl63gqhPRciQVZkNJLxF+9uzKp9wmMMRG/h3qhGmvI/+omzsSA+egVvjh1Qgf6KTXB6XtHp5/M=
X-Received: by 10.107.16.17 with SMTP id y17mr18731626ioi.119.1454691870167;
	Fri, 05 Feb 2016 09:04:30 -0800 (PST)
X-Received: by 10.107.16.17 with SMTP id y17mr18731595ioi.119.1454691869905;
	Fri, 05 Feb 2016 09:04:29 -0800 (PST)
Received: from mail-ig0-f169.google.com (mail-ig0-f169.google.com.
	[209.85.213.169]) by smtp.gmail.com with ESMTPSA id
	m4sm10879100igv.10.2016.02.05.09.04.28 for <qemu-arm@nongnu.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 05 Feb 2016 09:04:28 -0800 (PST)
Received: by mail-ig0-f169.google.com with SMTP id mw1so17888979igb.1
	for <qemu-arm@nongnu.org>; Fri, 05 Feb 2016 09:04:28 -0800 (PST)
MIME-Version: 1.0
X-Received: by 10.50.78.234 with SMTP id e10mr15799980igx.7.1454691868152;
	Fri, 05 Feb 2016 09:04:28 -0800 (PST)
Received: by 10.50.239.2 with HTTP; Fri, 5 Feb 2016 09:04:28 -0800 (PST)
In-Reply-To: <CAFEAcA9P7OBcL4sAnLLoppUo8q40yEeyAt_5M_MYnNgJAxB7RA@mail.gmail.com>
References: <CAHyh4xiVysLUreprtNnKMOLf0VUH2bTsF4thPwbkeFOfpDXFCw@mail.gmail.com>
	<CAFEAcA9P7OBcL4sAnLLoppUo8q40yEeyAt_5M_MYnNgJAxB7RA@mail.gmail.com>
Date: Fri, 5 Feb 2016 12:04:28 -0500
X-Gmail-Original-Message-ID: <CAHyh4xhsVft40MXZa2vc4Osx0LyY2bs35UX3gf51vzcYSh_aSA@mail.gmail.com>
Message-ID: <CAHyh4xhsVft40MXZa2vc4Osx0LyY2bs35UX3gf51vzcYSh_aSA@mail.gmail.com>
From: Jintack Lim <jintack@cs.columbia.edu>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary=089e013c65e00f1cdd052b08d89b
X-No-Spam-Score: Local
X-Scanned-By: MIMEDefang 2.68 on 128.59.29.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 128.59.72.250
Cc: qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christofferdall@gmail.com>
Subject: Re: [Qemu-arm] Adding sp804 timer to the virtboard
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: L/N2juZN8YOF

--089e013c65e00f1cdd052b08d89b
Content-Type: text/plain; charset=UTF-8

Hi Peter,

On Fri, Feb 5, 2016 at 5:52 AM, Peter Maydell <peter.maydell@linaro.org>
wrote:

> On 3 February 2016 at 20:57, Jintack Lim <jintack@cs.columbia.edu> wrote:
> > I'd like to replace an arm arch timer with sp804 timer in the virtboard.
> > What would be the easiest way to do that?
>
> (I'm assuming this is all just for local testing purposes, rather than
> with any intention of upstreaming a patch to add an sp804.)
>

That's right.


>
> Do you need to actually remove the arch timers, or just provide
> the sp804 as well?
>

I just need to provide sp804, don't need to remove the arch timer.


>
> (You can't remove the architected timers easily from emulated,
> or at all if you're using KVM, but you can straightforwardly
> comment out the bits of code in virt.c that advertise them in the dtb.)
>
> > I'm thinking to add sp804 node to DT as follows which is from
> > arch/arm/boot/dts/vexpress-v2m.dtsi.
> > v2m_timer01: timer@11000 {
> >         compatible = "arm,sp804", "arm,primecell";
> >         reg = <0x11000 0x1000>;
> >         interrupts = <2>;
> >         clocks = <&v2m_sysctl 0>, <&v2m_sysctl 1>, <&smbclk>;
> >         clock-names = "timclken1", "timclken2", "apb_pclk";
> > };
> >
> > The values of reg and interrupts will be replaced properly.
> > About the clock property, should I also add the original clock providers
> > such as sp810 and in turn 32k, 1M and smb clocks?
> > Or canI just use apb-pclk, which is an existing clock provider in the
> > virtboard, for all three clocks?
>
> For a virtual machine the clocks are all irrelevant anyway, I think
> (we don't actually have any kind of 24MHz clock) -- we just provide
> them because the kernel insists that the dtb says something about
> clocks. So I would start by just borrowing the apb-pclk and seeing
> if that works.
>
> thanks
> -- PMM
>
>

--089e013c65e00f1cdd052b08d89b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Peter,<br><div class=3D"gmail_extra"><br><div class=3D"=
gmail_quote">On Fri, Feb 5, 2016 at 5:52 AM, Peter Maydell <span dir=3D"ltr=
">&lt;<a href=3D"mailto:peter.maydell@linaro.org" target=3D"_blank">peter.m=
aydell@linaro.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color=
:rgb(204,204,204);border-left-style:solid;padding-left:1ex"><span class=3D"=
">On 3 February 2016 at 20:57, Jintack Lim &lt;<a href=3D"mailto:jintack@cs=
.columbia.edu">jintack@cs.columbia.edu</a>&gt; wrote:<br>
&gt; I&#39;d like to replace an arm arch timer with sp804 timer in the virt=
board.<br>
&gt; What would be the easiest way to do that?<br>
<br>
</span>(I&#39;m assuming this is all just for local testing purposes, rathe=
r than<br>
with any intention of upstreaming a patch to add an sp804.)<br></blockquote=
><div><br></div><div>That&#39;s right.</div><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px=
;border-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1e=
x">
<br>
Do you need to actually remove the arch timers, or just provide<br>
the sp804 as well?<br></blockquote><div><br></div><div>I just need to provi=
de sp804, don&#39;t need to remove the arch timer.<br></div><div>=C2=A0</di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid=
;padding-left:1ex">
<br>
(You can&#39;t remove the architected timers easily from emulated,<br>
or at all if you&#39;re using KVM, but you can straightforwardly<br>
comment out the bits of code in virt.c that advertise them in the dtb.)<br>
<span class=3D""><br>
&gt; I&#39;m thinking to add sp804 node to DT as follows which is from<br>
&gt; arch/arm/boot/dts/vexpress-v2m.dtsi.<br>
&gt; v2m_timer01: timer@11000 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0compatible =3D &quot;arm,sp804&quot;,=
 &quot;arm,primecell&quot;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0reg =3D &lt;0x11000 0x1000&gt;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0interrupts =3D &lt;2&gt;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clocks =3D &lt;&amp;v2m_sysctl 0&gt;,=
 &lt;&amp;v2m_sysctl 1&gt;, &lt;&amp;smbclk&gt;;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clock-names =3D &quot;timclken1&quot;=
, &quot;timclken2&quot;, &quot;apb_pclk&quot;;<br>
&gt; };<br>
&gt;<br>
&gt; The values of reg and interrupts will be replaced properly.<br>
&gt; About the clock property, should I also add the original clock provide=
rs<br>
&gt; such as sp810 and in turn 32k, 1M and smb clocks?<br>
&gt; Or canI just use apb-pclk, which is an existing clock provider in the<=
br>
&gt; virtboard, for all three clocks?<br>
<br>
</span>For a virtual machine the clocks are all irrelevant anyway, I think<=
br>
(we don&#39;t actually have any kind of 24MHz clock) -- we just provide<br>
them because the kernel insists that the dtb says something about<br>
clocks. So I would start by just borrowing the apb-pclk and seeing<br>
if that works.<br>
<br>
thanks<br>
-- PMM<br>
<br>
</blockquote></div><br></div></div>

--089e013c65e00f1cdd052b08d89b--

