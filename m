Received: by 10.28.71.27 with SMTP id u27csp793860wma;
        Wed, 21 Feb 2018 06:26:02 -0800 (PST)
X-Google-Smtp-Source: AH8x2241H8TAKl/ckG3flir4E5lr8aPOdlh+kZy+zhqTFMbs9nkEsdzzCTeaS06+JKT46+Ub27sB
X-Received: by 2002:a25:ae1c:: with SMTP id a28-v6mr2351408ybj.87.1519223162555;
        Wed, 21 Feb 2018 06:26:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519223162; cv=none;
        d=google.com; s=arc-20160816;
        b=gU0nIPnmLo8n28qji8XLo5SHo9ynAvY/S+GK0HJk7bN4jlFhsBf6OsU/rjEM9p6nda
         pWGjqTltf7kEWyaoq8RB006hy5OJfrYe5aHmEFE3a1jQF5wR73idBm8GLCtDxJX3RCCX
         N/N0JFYroc6FB2s5bRvyp3vL008SRZa4SxppryvWiAZVKjgUj0pcczXCbDRDgzxfQkkZ
         plhjd6wJ5f2X2X9MT5EJrIuQyZBGLF+Tf6D0P12iIkLyBLbcO/RBTvBOfZLOHyKCzwew
         oxSXEIuspPpYw+aBorN9L/E6KmTHdFL5dlcfJubaxYidvPWEB2nRAWMMPq7wPNShx1zC
         JDWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:arc-authentication-results;
        bh=gJ9L67Sq2ycY5TXOuWdhepn54D3OELWEfKFNVAL25Og=;
        b=NwDGxxydCTkfo5vhkjy5QVGjui1vqlUp2yKlTQjGmSbbA3fPJqO1Wesz94mx76untN
         tLhtwVwyxsouoZ27ft3zqqR+j2ghEt0srIHJZ2uzEyMVCzxJvQkEeA33vDhHvnNUEgsq
         KrGB96nPz8e5E6Vc+d7yUDwQsW0eJPgmtsyQCHmsMK5N1XCTqQexhvkKWlho+DrbFLrP
         wg8GsKJNSVL+1BCGn4zhsjdCw+94BfBQ+ekwf6o5WLrnX0UsnzNYeY6UxsPEtN+8x2x7
         SIikIjU5W4mJ3LPBpBE386+Ym+KLPBDlqW2jFEE/FNWqmYW+M+ktGnQgtrn8NTnhCei+
         jq5A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=vt.edu
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t1si2484023ybd.24.2018.02.21.06.26.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 21 Feb 2018 06:26:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=vt.edu
Received: from localhost ([::1]:32961 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eoVLN-0002Td-VG
	for alex.bennee@linaro.org; Wed, 21 Feb 2018 09:26:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49881)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rdzhang@vt.edu>) id 1eoVLB-0002RK-Sp
	for qemu-arm@nongnu.org; Wed, 21 Feb 2018 09:25:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rdzhang@vt.edu>) id 1eoVL7-0005Ue-8y
	for qemu-arm@nongnu.org; Wed, 21 Feb 2018 09:25:49 -0500
Received: from omr1.cc.ipv6.vt.edu ([2607:b400:92:8300:0:c6:2117:b0e]:40000
	helo=omr1.cc.vt.edu)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <rdzhang@vt.edu>) id 1eoVL6-0005Tr-VV
	for qemu-arm@nongnu.org; Wed, 21 Feb 2018 09:25:45 -0500
Received: from mr1.cc.vt.edu (smtp.ipv6.vt.edu
	[IPv6:2607:b400:92:9:0:9d:8fcb:4116])
	by omr1.cc.vt.edu (8.14.4/8.14.4) with ESMTP id w1LEPiiS023473
	for <qemu-arm@nongnu.org>; Wed, 21 Feb 2018 09:25:44 -0500
Received: from mail-qt0-f197.google.com (mail-qt0-f197.google.com
	[209.85.216.197])
	by mr1.cc.vt.edu (8.14.7/8.14.7) with ESMTP id w1LEPdsh027653
	for <qemu-arm@nongnu.org>; Wed, 21 Feb 2018 09:25:44 -0500
Received: by mail-qt0-f197.google.com with SMTP id q7so1380248qtl.0
	for <qemu-arm@nongnu.org>; Wed, 21 Feb 2018 06:25:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=gJ9L67Sq2ycY5TXOuWdhepn54D3OELWEfKFNVAL25Og=;
	b=CBk6b9ZpyIUlbLHYft+Ut4os2m3y+BlPcqiN7q1nGdjdAKYkPOgfNQuWJVm2HAHMG9
	QReJsJM+dYjLXq/CGj0e4HKlJkan5uPzYOET0eI5i0uzu1k368xie/u9+QAQRjKt/U8G
	0MeXjiSt/mBozlRWwKP/DNkAAMNUD94i+kEBSEsIkwZRFU0FMabOFogTwzHuZZSXJIda
	eYL4gXvWdEsIDE4IzEL03W4KXqkPFO3ZeUgA89LP/Qp+4CdftQsiW00RGE0ytg8XpEfR
	rLF9uV4ddwb7sUEaL8eMJhbgIG5zXx//GmTwBETppEt0h0W3gt1ZpSRBJJH6sADdC+Oy
	57gA==
X-Gm-Message-State: APf1xPBMTTqJfYt7yVzefABkEY4IQmh444l2u7wQzy8+A+GPGSGeD9SH
	yXdFephd7QRxUNtfffxMyK8zBzCURvWWODAI0d+PMZSiu+2BO/oUExnD3Ys9boLKaAtDdl7nMiB
	kFXQq8rZntdZC/fzVaWxLYIIF8eQCHWOXhUpOP5s=
X-Received: by 10.200.54.151 with SMTP id a23mr5509091qtc.123.1519223138847;
	Wed, 21 Feb 2018 06:25:38 -0800 (PST)
X-Received: by 10.200.54.151 with SMTP id a23mr5509058qtc.123.1519223138561;
	Wed, 21 Feb 2018 06:25:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.39.200 with HTTP; Wed, 21 Feb 2018 06:25:37 -0800 (PST)
In-Reply-To: <CAFEAcA8fnqL9tKa4tVPDoWTKYsOVKhxZ04c39fvgKNgQ-F+ESg@mail.gmail.com>
References: <CAFmp02z8NnRq6eSCDa2GYJDXE2-cK6+yS1SKHAbiBDhKV_F2yg@mail.gmail.com>
	<CAFEAcA8fnqL9tKa4tVPDoWTKYsOVKhxZ04c39fvgKNgQ-F+ESg@mail.gmail.com>
From: Rd Cheung <rdzhang@vt.edu>
Date: Wed, 21 Feb 2018 09:25:37 -0500
Message-ID: <CAFmp02xLicV+dSFhJjYX8djQMGvVaYtih6hB9HAd4HqnA2=VfQ@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="001a114560c282476c0565b9b361"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 2607:b400:92:8300:0:c6:2117:b0e
Subject: Re: [Qemu-arm] ARM cortex-m3 instruction fetch misbehaves during
 do_v7m_exception_exit
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
Cc: qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WjN7Lda7veN7

--001a114560c282476c0565b9b361
Content-Type: text/plain; charset="UTF-8"

Thank you for your response!

>> I am emulating TI RTOS(Texas Instrument real time operating system) on a
>> cortex-M3 device. I have made boot up code work, but I am currently
stuck at
>> exception handler.
>>
>> when the code return from exception handler it goes to:
>> 0x1001c90e:  b401b402  strlt    fp, [r1], #-0x402
>>
>> while it should be:
>> 1001c90e:   B402                push       {r1}
>> 1001c910:   B401                push       {r0}

>That looks like the guest has returned with an incorrect
>XPSR bit that specifies Arm mode, rather than Thumb mode
>(and the guest will take an immediate UsageFault trying to
>execute the next instruction, since M profile CPUs don't
>implement Arm mode).

Yes, this looks like misusing ARM mode instead of Thumb mode to me.
I just checked the local variable xpsr in function do_v7m_exception_exit()
by adding a qemu_log_mask line at the end of the function. I turn on log by
-d in_asm,guest_errors. And the xpsr = 0x1000000, which has its bit 24 set
to 1.
And bit 24 is the indicator of Thumb state according to ARM info center. So
it
should be correct, or am I getting something wrong?

And yes, the execution flow will go to UsageFault after the Arm instruction.

>> I notice the TI RTOS return from an exception with PC with bit 0 set.
But it
>> should not be an issue of current qemu.

>Which version of QEMU are you using? For v7M doing an exception
>return to a PC with bit 0 set is UNPREDICTABLE and this is
>always a bug in your guest code. QEMU will (in more recent
>versions) ignore the set bit, as M3 hardware does. It will
>also print a warning if you pass QEMU the option "-d guest_errors".
>Older QEMU versions would attempt to start execution at the
>odd address, but we can see from the disassembly that that
>hasn't happened in your case.

I am using version 2.11.50 which I forked 2 months ago from the master
branch.
Yes, I can see the UNPREDICTABLE log in my log. And I have checked that
part of code.
It seems that you have updated that behavior in a patch last year by setting
env->regs[15] &= ~1U when it happens.


>However, the PC value doesn't affect whether we think the code
>is in Arm or Thumb mode -- that is determined by the XPSR
>value we pop off the stack, and specifically the XPSR.T bit.
>You should look at what your guest code has set up as the
>XPSR value.

As i mentioned above, I have checked the xpsr in do_v7m_exception_exit().
(at /qemu/target/arm/helper.c) Or shall I check another place?

I am looking forward to your reply!

Thank you,
Ruide Zhang


On Wed, Feb 21, 2018 at 8:41 AM, Peter Maydell <peter.maydell@linaro.org>
wrote:

> On 21 February 2018 at 03:52, Rd Cheung <rdzhang@vt.edu> wrote:
> > I am emulating TI RTOS(Texas Instrument real time operating system) on a
> > cortex-M3 device. I have made boot up code work, but I am currently
> stuck at
> > exception handler.
> >
> > when the code return from exception handler it goes to:
> > 0x1001c90e:  b401b402  strlt    fp, [r1], #-0x402
> >
> > while it should be:
> > 1001c90e:   B402                push       {r1}
> > 1001c910:   B401                push       {r0}
>
> That looks like the guest has returned with an incorrect
> XPSR bit that specifies Arm mode, rather than Thumb mode
> (and the guest will take an immediate UsageFault trying to
> execute the next instruction, since M profile CPUs don't
> implement Arm mode).
>
> > I notice the TI RTOS return from an exception with PC with bit 0 set.
> But it
> > should not be an issue of current qemu.
>
> Which version of QEMU are you using? For v7M doing an exception
> return to a PC with bit 0 set is UNPREDICTABLE and this is
> always a bug in your guest code. QEMU will (in more recent
> versions) ignore the set bit, as M3 hardware does. It will
> also print a warning if you pass QEMU the option "-d guest_errors".
> Older QEMU versions would attempt to start execution at the
> odd address, but we can see from the disassembly that that
> hasn't happened in your case.
>
> However, the PC value doesn't affect whether we think the code
> is in Arm or Thumb mode -- that is determined by the XPSR
> value we pop off the stack, and specifically the XPSR.T bit.
> You should look at what your guest code has set up as the
> XPSR value.
>
> thanks
> -- PMM
>

--001a114560c282476c0565b9b361
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thank you for your response!<div><br></div><div>

<span class=3D"gmail-im" style=3D"color:rgb(80,0,80);font-family:arial,sans=
-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;fon=
t-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:star=
t;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;b=
ackground-color:rgb(255,255,255);text-decoration-style:initial;text-decorat=
ion-color:initial">&gt;&gt; I am emulating TI RTOS(Texas Instrument real ti=
me operating system) on a<br>&gt;&gt; cortex-M3 device. I have made boot up=
 code work, but I am currently stuck at<br>&gt;&gt; exception handler.<br>&=
gt;&gt;<br>&gt;&gt; when the code return from exception handler it goes to:=
<br>&gt;&gt; 0x1001c90e:=C2=A0 b401b402=C2=A0 strlt=C2=A0 =C2=A0 fp, [r1], =
#-0x402<br>&gt;&gt;<br>&gt;&gt; while it should be:<br>&gt;&gt; 1001c90e:=
=C2=A0 =C2=A0B402=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 pu=
sh=C2=A0 =C2=A0 =C2=A0 =C2=A0{r1}<br>&gt;&gt; 1001c910:=C2=A0 =C2=A0B401=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 push=C2=A0 =C2=A0 =C2=
=A0 =C2=A0{r0}<br><br></span><span style=3D"color:rgb(34,34,34);font-family=
:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures=
:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text=
-align:start;text-indent:0px;text-transform:none;white-space:normal;word-sp=
acing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;t=
ext-decoration-color:initial;float:none;display:inline">&gt;That looks like=
 the guest has returned with an incorrect</span><br style=3D"color:rgb(34,3=
4,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-=
variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-sp=
acing:normal;text-align:start;text-indent:0px;text-transform:none;white-spa=
ce:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoratio=
n-style:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,=
34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font=
-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-s=
pacing:normal;text-align:start;text-indent:0px;text-transform:none;white-sp=
ace:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decorati=
on-style:initial;text-decoration-color:initial;float:none;display:inline">&=
gt;XPSR bit that specifies Arm mode, rather than Thumb mode</span><br style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-=
style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-we=
ight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transf=
orm:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,2=
55);text-decoration-style:initial;text-decoration-color:initial"><span styl=
e=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font=
-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-w=
eight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-trans=
form:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,=
255);text-decoration-style:initial;text-decoration-color:initial;float:none=
;display:inline">&gt;(and the guest will take an immediate UsageFault tryin=
g to</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fo=
nt-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant=
-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-in=
dent:0px;text-transform:none;white-space:normal;word-spacing:0px;background=
-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color=
:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;f=
ont-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-varian=
t-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-i=
ndent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgroun=
d-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-colo=
r:initial;float:none;display:inline">&gt;execute the next instruction, sinc=
e M profile CPUs don&#39;t</span><br style=3D"color:rgb(34,34,34);font-fami=
ly:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatur=
es:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;te=
xt-align:start;text-indent:0px;text-transform:none;white-space:normal;word-=
spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initial=
;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-fam=
ily:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatu=
res:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;t=
ext-align:start;text-indent:0px;text-transform:none;white-space:normal;word=
-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initia=
l;text-decoration-color:initial;float:none;display:inline">&gt;implement Ar=
m mode).</span>

<br><div><br></div><div>Yes, this looks like misusing ARM mode instead of T=
humb mode to me.</div><div>I just checked the local variable xpsr in functi=
on=C2=A0do_v7m_exception_exit()</div><div>by adding a qemu_log_mask line at=
 the end of the function. I turn on log by</div><div>-d in_asm,guest_errors=
. And the xpsr =3D 0x1000000, which has its bit 24 set to 1.</div><div>And =
bit 24 is the indicator of Thumb state according to ARM info center. So it<=
/div><div>should be correct, or am I getting something wrong?</div><div><br=
></div><div>And yes, the execution flow will go to UsageFault after the Arm=
 instruction.</div><div><br></div><div>

<span class=3D"gmail-" style=3D"color:rgb(34,34,34);font-family:arial,sans-=
serif;font-size:small;font-style:normal;font-variant-ligatures:normal;font-=
variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;=
text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;bac=
kground-color:rgb(255,255,255);text-decoration-style:initial;text-decoratio=
n-color:initial">&gt;&gt; I notice the TI RTOS return from an exception wit=
h PC with bit 0 set. But it<br>&gt;&gt; should not be an issue of current q=
emu.<br><br></span><span style=3D"color:rgb(34,34,34);font-family:arial,san=
s-serif;font-size:small;font-style:normal;font-variant-ligatures:normal;fon=
t-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:star=
t;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;b=
ackground-color:rgb(255,255,255);text-decoration-style:initial;text-decorat=
ion-color:initial;float:none;display:inline">&gt;Which version of QEMU are =
you using? For v7M doing an exception</span><br style=3D"color:rgb(34,34,34=
);font-family:arial,sans-serif;font-size:small;font-style:normal;font-varia=
nt-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing=
:normal;text-align:start;text-indent:0px;text-transform:none;white-space:no=
rmal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-sty=
le:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34=
);font-family:arial,sans-serif;font-size:small;font-style:normal;font-varia=
nt-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing=
:normal;text-align:start;text-indent:0px;text-transform:none;white-space:no=
rmal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-sty=
le:initial;text-decoration-color:initial;float:none;display:inline">&gt;ret=
urn to a PC with bit 0 set is UNPREDICTABLE and this is</span><br style=3D"=
color:rgb(34,34,34);font-family:arial,sans-serif;font-size:small;font-style=
:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:=
400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:n=
one;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);t=
ext-decoration-style:initial;text-decoration-color:initial"><span style=3D"=
color:rgb(34,34,34);font-family:arial,sans-serif;font-size:small;font-style=
:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:=
400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:n=
one;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);t=
ext-decoration-style:initial;text-decoration-color:initial;float:none;displ=
ay:inline">&gt;always a bug in your guest code. QEMU will (in more recent</=
span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-siz=
e:small;font-style:normal;font-variant-ligatures:normal;font-variant-caps:n=
ormal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0p=
x;text-transform:none;white-space:normal;word-spacing:0px;background-color:=
rgb(255,255,255);text-decoration-style:initial;text-decoration-color:initia=
l"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-siz=
e:small;font-style:normal;font-variant-ligatures:normal;font-variant-caps:n=
ormal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0p=
x;text-transform:none;white-space:normal;word-spacing:0px;background-color:=
rgb(255,255,255);text-decoration-style:initial;text-decoration-color:initia=
l;float:none;display:inline">&gt;versions) ignore the set bit, as M3 hardwa=
re does. It will</span><br style=3D"color:rgb(34,34,34);font-family:arial,s=
ans-serif;font-size:small;font-style:normal;font-variant-ligatures:normal;f=
ont-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:st=
art;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px=
;background-color:rgb(255,255,255);text-decoration-style:initial;text-decor=
ation-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,s=
ans-serif;font-size:small;font-style:normal;font-variant-ligatures:normal;f=
ont-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:st=
art;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px=
;background-color:rgb(255,255,255);text-decoration-style:initial;text-decor=
ation-color:initial;float:none;display:inline">&gt;also print a warning if =
you pass QEMU the option &quot;-d guest_errors&quot;.</span><br style=3D"co=
lor:rgb(34,34,34);font-family:arial,sans-serif;font-size:small;font-style:n=
ormal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:40=
0;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:non=
e;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);tex=
t-decoration-style:initial;text-decoration-color:initial"><span style=3D"co=
lor:rgb(34,34,34);font-family:arial,sans-serif;font-size:small;font-style:n=
ormal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:40=
0;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:non=
e;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);tex=
t-decoration-style:initial;text-decoration-color:initial;float:none;display=
:inline">&gt;Older QEMU versions would attempt to start execution at the</s=
pan><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size=
:small;font-style:normal;font-variant-ligatures:normal;font-variant-caps:no=
rmal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px=
;text-transform:none;white-space:normal;word-spacing:0px;background-color:r=
gb(255,255,255);text-decoration-style:initial;text-decoration-color:initial=
"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size=
:small;font-style:normal;font-variant-ligatures:normal;font-variant-caps:no=
rmal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px=
;text-transform:none;white-space:normal;word-spacing:0px;background-color:r=
gb(255,255,255);text-decoration-style:initial;text-decoration-color:initial=
;float:none;display:inline">&gt;odd address, but we can see from the disass=
embly that that</span><br style=3D"color:rgb(34,34,34);font-family:arial,sa=
ns-serif;font-size:small;font-style:normal;font-variant-ligatures:normal;fo=
nt-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:sta=
rt;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;=
background-color:rgb(255,255,255);text-decoration-style:initial;text-decora=
tion-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sa=
ns-serif;font-size:small;font-style:normal;font-variant-ligatures:normal;fo=
nt-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:sta=
rt;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;=
background-color:rgb(255,255,255);text-decoration-style:initial;text-decora=
tion-color:initial;float:none;display:inline">&gt;hasn&#39;t happened in yo=
ur case.</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-seri=
f;font-size:small;font-style:normal;font-variant-ligatures:normal;font-vari=
ant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text=
-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgro=
und-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-co=
lor:initial"><br>I am using version 2.11.50 which I forked 2 months ago fro=
m the master branch.</div><div>Yes, I can see the UNPREDICTABLE log in my l=
og. And I have checked that part of code.</div><div>It seems that you have =
updated that behavior in a patch last year by setting</div><div>env-&gt;reg=
s[15] &amp;=3D ~1U when it happens.</div><div><br><br style=3D"color:rgb(34=
,34,34);font-family:arial,sans-serif;font-size:small;font-style:normal;font=
-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-s=
pacing:normal;text-align:start;text-indent:0px;text-transform:none;white-sp=
ace:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decorati=
on-style:initial;text-decoration-color:initial"><span style=3D"color:rgb(34=
,34,34);font-family:arial,sans-serif;font-size:small;font-style:normal;font=
-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-s=
pacing:normal;text-align:start;text-indent:0px;text-transform:none;white-sp=
ace:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decorati=
on-style:initial;text-decoration-color:initial;float:none;display:inline">&=
gt;However, the PC value doesn&#39;t affect whether we think the code</span=
><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:sm=
all;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norma=
l;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;te=
xt-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(=
255,255,255);text-decoration-style:initial;text-decoration-color:initial"><=
span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:sm=
all;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norma=
l;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;te=
xt-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(=
255,255,255);text-decoration-style:initial;text-decoration-color:initial;fl=
oat:none;display:inline">&gt;is in Arm or Thumb mode -- that is determined =
by the XPSR</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-s=
erif;font-size:small;font-style:normal;font-variant-ligatures:normal;font-v=
ariant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;t=
ext-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;back=
ground-color:rgb(255,255,255);text-decoration-style:initial;text-decoration=
-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-s=
erif;font-size:small;font-style:normal;font-variant-ligatures:normal;font-v=
ariant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;t=
ext-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;back=
ground-color:rgb(255,255,255);text-decoration-style:initial;text-decoration=
-color:initial;float:none;display:inline">&gt;value we pop off the stack, a=
nd specifically the XPSR.T bit.</span><br style=3D"color:rgb(34,34,34);font=
-family:arial,sans-serif;font-size:small;font-style:normal;font-variant-lig=
atures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:norma=
l;text-align:start;text-indent:0px;text-transform:none;white-space:normal;w=
ord-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:ini=
tial;text-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font=
-family:arial,sans-serif;font-size:small;font-style:normal;font-variant-lig=
atures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:norma=
l;text-align:start;text-indent:0px;text-transform:none;white-space:normal;w=
ord-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:ini=
tial;text-decoration-color:initial;float:none;display:inline">&gt;You shoul=
d look at what your guest code has set up as the</span><br style=3D"color:r=
gb(34,34,34);font-family:arial,sans-serif;font-size:small;font-style:normal=
;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;let=
ter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;whi=
te-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-dec=
oration-style:initial;text-decoration-color:initial"><span style=3D"color:r=
gb(34,34,34);font-family:arial,sans-serif;font-size:small;font-style:normal=
;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;let=
ter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;whi=
te-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-dec=
oration-style:initial;text-decoration-color:initial;float:none;display:inli=
ne">&gt;XPSR value.</span><br style=3D"color:rgb(34,34,34);font-family:aria=
l,sans-serif;font-size:small;font-style:normal;font-variant-ligatures:norma=
l;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align=
:start;text-indent:0px;text-transform:none;white-space:normal;word-spacing:=
0px;background-color:rgb(255,255,255);text-decoration-style:initial;text-de=
coration-color:initial">

<br>As i mentioned above, I have checked the xpsr in=C2=A0<span style=3D"co=
lor:rgb(34,34,34);font-family:arial,sans-serif;font-size:small;font-style:n=
ormal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:40=
0;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:non=
e;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);tex=
t-decoration-style:initial;text-decoration-color:initial;float:none;display=
:inline">do_v7m_exception_exit().</span></div><div><span style=3D"color:rgb=
(34,34,34);font-family:arial,sans-serif;font-size:small;font-style:normal;f=
ont-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;lette=
r-spacing:normal;text-align:start;text-indent:0px;text-transform:none;white=
-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decor=
ation-style:initial;text-decoration-color:initial;float:none;display:inline=
">(at /qemu/target/arm/helper.c)=C2=A0</span>Or shall I check another place=
?</div><div><br></div><div>I am looking forward to your reply!</div><div><b=
r></div><div>Thank you,</div><div>Ruide Zhang</div><div><br></div><div><div=
 class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Wed, Feb 21, 2018 =
at 8:41 AM, Peter Maydell <span dir=3D"ltr">&lt;<a href=3D"mailto:peter.may=
dell@linaro.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt;</span> =
wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><span class=3D"=
gmail-">On 21 February 2018 at 03:52, Rd Cheung &lt;<a href=3D"mailto:rdzha=
ng@vt.edu">rdzhang@vt.edu</a>&gt; wrote:<br>
&gt; I am emulating TI RTOS(Texas Instrument real time operating system) on=
 a<br>
&gt; cortex-M3 device. I have made boot up code work, but I am currently st=
uck at<br>
&gt; exception handler.<br>
&gt;<br>
&gt; when the code return from exception handler it goes to:<br>
&gt; 0x1001c90e:=C2=A0 b401b402=C2=A0 strlt=C2=A0 =C2=A0 fp, [r1], #-0x402<=
br>
&gt;<br>
&gt; while it should be:<br>
&gt; 1001c90e:=C2=A0 =C2=A0B402=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 push=C2=A0 =C2=A0 =C2=A0 =C2=A0{r1}<br>
&gt; 1001c910:=C2=A0 =C2=A0B401=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 push=C2=A0 =C2=A0 =C2=A0 =C2=A0{r0}<br>
<br></span>That looks like the guest has returned with an incorrect<br>XPSR=
 bit that specifies Arm mode, rather than Thumb mode<br>(and the guest will=
 take an immediate UsageFault trying to<br>execute the next instruction, si=
nce M profile CPUs don&#39;t<br>implement Arm mode).<br>
<span class=3D"gmail-"><br>
&gt; I notice the TI RTOS return from an exception with PC with bit 0 set. =
But it<br>
&gt; should not be an issue of current qemu.<br>
<br>
</span>Which version of QEMU are you using? For v7M doing an exception<br>
return to a PC with bit 0 set is UNPREDICTABLE and this is<br>
always a bug in your guest code. QEMU will (in more recent<br>
versions) ignore the set bit, as M3 hardware does. It will<br>
also print a warning if you pass QEMU the option &quot;-d guest_errors&quot=
;.<br>
Older QEMU versions would attempt to start execution at the<br>
odd address, but we can see from the disassembly that that<br>
hasn&#39;t happened in your case.<br>
<br>
However, the PC value doesn&#39;t affect whether we think the code<br>
is in Arm or Thumb mode -- that is determined by the XPSR<br>
value we pop off the stack, and specifically the XPSR.T bit.<br>
You should look at what your guest code has set up as the<br>
XPSR value.<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div><br></div></div></div></div>

--001a114560c282476c0565b9b361--
