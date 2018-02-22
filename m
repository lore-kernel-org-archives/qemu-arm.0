Received: by 10.28.71.27 with SMTP id u27csp1518466wma;
        Wed, 21 Feb 2018 20:09:36 -0800 (PST)
X-Google-Smtp-Source: AH8x227Hu1262n2ptZZWUogFDDw1AHCQkNnDvzmAGqySwiRWq2+KNhk3yOiPMqNJ93n5iQ4HtF1h
X-Received: by 2002:a25:844d:: with SMTP id r13-v6mr2426570ybm.239.1519272576026;
        Wed, 21 Feb 2018 20:09:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519272576; cv=none;
        d=google.com; s=arc-20160816;
        b=Ht4k7/i5nX5xHn3Qy5ym076TwfK/eAcMzoDzNCXCYuB053yBCowm0n4yfmVx3AOFsA
         NtlQf3pOBlSgHpKfdHC6dPXpm0bYk3eE0La80gWsNDdxct+bH+L3xoWQEFoSjPJflqwB
         xCIhmHj9hPdA4CER6fTj8K6+FmPnmeSNwVVuPRcG+8DisAOwCU5cwSBvSQLwFvOx7bDs
         JJtUz1Ksapu3ShqWPswkNdizjT0oRHyXAooQs/8XDuBG7CMeMV5aAxVdd0XKq6qLuetO
         fJq2BPrGkiTRRnZihOfJhaL3EKRuACvqIfGGji+PRfRdwZwcIBMonaZ59uqsrpkhC8Oc
         nIXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:arc-authentication-results;
        bh=nmWHhbdHLHQplUIJeh2rwsIo8zwMwNZdjlVqufRlL+s=;
        b=EdtgdXdOt9RuzNEkohPsNq4kUKL0Psqk+0p/AT9+m4sityi0dhx5xMjZmbg6Cy42T5
         Nffq0cmADTS+77VaKP2va+ofDCT9TkzLEwdJ70dUizPyoCm3BQF/YYwEqSicxvskgc4N
         G8d3uUMiraYYLxdRIkQKiSyiYqyC2LMGi/sezH73EPcSmqlM7Je1aYxO+tKimrUpaW05
         yofu+3merjfxvScjsKdszRmwclmPjy7Dy7h7eeI+/+pwchCtmiupVsdSGh3CCOMfoPd1
         8L4We7BWUx2OjsJuavX72W8iQ5/olRL+R5PN6DU3p+MlCQ99WiLWvcFas37zCyEutSES
         qTfw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=vt.edu
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t7si176831ybg.48.2018.02.21.20.09.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 21 Feb 2018 20:09:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=vt.edu
Received: from localhost ([::1]:35965 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eoiCN-0002k3-5j
	for alex.bennee@linaro.org; Wed, 21 Feb 2018 23:09:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54723)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rdzhang@vt.edu>) id 1eoiCF-0002jk-QS
	for qemu-arm@nongnu.org; Wed, 21 Feb 2018 23:09:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rdzhang@vt.edu>) id 1eoiCC-0003Iz-JO
	for qemu-arm@nongnu.org; Wed, 21 Feb 2018 23:09:27 -0500
Received: from omr2.cc.ipv6.vt.edu ([2607:b400:92:8400:0:33:fb76:806e]:59748
	helo=omr2.cc.vt.edu)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <rdzhang@vt.edu>) id 1eoiCC-0003CR-9Z
	for qemu-arm@nongnu.org; Wed, 21 Feb 2018 23:09:24 -0500
Received: from mr3.cc.vt.edu (mr3.cc.vt.edu
	[IPv6:2607:b400:92:8500:0:7f:b804:6b0a])
	by omr2.cc.vt.edu (8.14.4/8.14.4) with ESMTP id w1M49I16021668
	for <qemu-arm@nongnu.org>; Wed, 21 Feb 2018 23:09:18 -0500
Received: from mail-qk0-f200.google.com (mail-qk0-f200.google.com
	[209.85.220.200])
	by mr3.cc.vt.edu (8.14.7/8.14.7) with ESMTP id w1M49D6A029913
	for <qemu-arm@nongnu.org>; Wed, 21 Feb 2018 23:09:18 -0500
Received: by mail-qk0-f200.google.com with SMTP id b67so3028659qkh.5
	for <qemu-arm@nongnu.org>; Wed, 21 Feb 2018 20:09:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nmWHhbdHLHQplUIJeh2rwsIo8zwMwNZdjlVqufRlL+s=;
	b=BsbMGZzWl08fjssDvzUNMrmTb4wlR4E2D37QkJ9oaMpqKJwnsWKTtCtpTCOw0MDrbJ
	RiNh8AsD0cw2yXsgrEQEQtHgVTtFLcax91L7vrKqFiHSrLW8MGOdru7LdtuVWdx2teQ2
	mRmaQ/pUapSQPD2WSnzFvLQ8kf/VtCHGma19G+0//zNl2ntLQGlAiSkwR1tqhVEgbo3N
	1Sq+ftVR5Df8ad040CzFmrxhdzz3PfbgCsII+/I0nCUXsASvNJDkfYq9dRbPY6QJnCr0
	33oK7SBfK3xGDLp6eYEuLmhtuOgAEcWm9qco9u3FqV6COZitaMyLwB0XCS4KFSSwQ9Fl
	S3tg==
X-Gm-Message-State: APf1xPAw84dzWvtIP5Aoa/H4x99xZWsB9HwoghpGKcjQ9UKhUFIUOLCB
	2MXdZBVxx/dOEmd16/lI3+rZmNh8mYpCJ/1xkUYx//3UdYwqdeg6/CV6I/zoNh/4BQ871Bph6RA
	x7bfXUanUuM4ngEPnMIR/PxgWLCcTWzjj4Gu3qpQ=
X-Received: by 10.55.17.196 with SMTP id 65mr8362673qkr.86.1519272553069;
	Wed, 21 Feb 2018 20:09:13 -0800 (PST)
X-Received: by 10.55.17.196 with SMTP id 65mr8362659qkr.86.1519272552783; Wed,
	21 Feb 2018 20:09:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.39.200 with HTTP; Wed, 21 Feb 2018 20:09:12 -0800 (PST)
In-Reply-To: <CAFEAcA9q=u-wF96WW3oJ=1PDuA7bAn_k-YiGRf2gn8Appj8mBw@mail.gmail.com>
References: <CAFmp02z8NnRq6eSCDa2GYJDXE2-cK6+yS1SKHAbiBDhKV_F2yg@mail.gmail.com>
	<CAFEAcA8fnqL9tKa4tVPDoWTKYsOVKhxZ04c39fvgKNgQ-F+ESg@mail.gmail.com>
	<CAFmp02xLicV+dSFhJjYX8djQMGvVaYtih6hB9HAd4HqnA2=VfQ@mail.gmail.com>
	<CAFEAcA9q=u-wF96WW3oJ=1PDuA7bAn_k-YiGRf2gn8Appj8mBw@mail.gmail.com>
From: Rd Cheung <rdzhang@vt.edu>
Date: Wed, 21 Feb 2018 23:09:12 -0500
Message-ID: <CAFmp02w8XoiRket_sAGziU3bDX3w+NWVwvBkbT0XE_xrbG-TVg@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="001a1146ec84d36f190565c53448"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 2607:b400:92:8400:0:33:fb76:806e
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
X-TUID: xzTx3Q7JC31X

--001a1146ec84d36f190565c53448
Content-Type: text/plain; charset="UTF-8"

 >  Odd. In that case what should happen is that the call to
>  xpsr_write() should cause env->thumb to be set, which is
>  the QEMU internal state that tracks whether we are in Arm
>  or Thumb mode.
>
>  I would recommend adding also int,exec,cpu,unimp to your tracing
>  options. That will allow you to confirm exactly what the CPU
>  state on return from the exception is, because it will print
>  a register state dump to the log. (the 'cpu' and 'exec' logs
>  do slow down the emulation a lot, but hopefully this bug
>  happens early in execution.)

I have turned on the log options and I find out the execution will go
into the same interrupt service routine for multiple times as soon as
it exits from execption handler, before it hits its expected return
address.
So I look into the NVIC registers in cortex M3. I find out the ISPR
register (interrupt set pending registers) in NVIC is not function
normally.

I made a breakpoint just before the code exit the exception handler.
And I use 'x /20xw 0xe000e200' to check the ISPR register. At this point,
the
value is 0x0, and then I type 'si' to gdb, and the code go to the expected
return
 address. Then I 'x /20xw 0xe000e200' again, but this time, the value is
0x10,
which indicates an interrupt is pending. If I type 'c' in gdb, the code
will go to the
interrupt service routine again.

Do you have any idea in mind?

Thanks a lot! I am looking forward to your reply.

Ruide Zhang



On Wed, Feb 21, 2018 at 10:09 AM, Peter Maydell <peter.maydell@linaro.org>
wrote:

> On 21 February 2018 at 14:25, Rd Cheung <rdzhang@vt.edu> wrote:
> > Yes, this looks like misusing ARM mode instead of Thumb mode to me.
> > I just checked the local variable xpsr in function
> do_v7m_exception_exit()
> > by adding a qemu_log_mask line at the end of the function. I turn on log
> by
> > -d in_asm,guest_errors. And the xpsr = 0x1000000, which has its bit 24
> set
> > to 1.
> > And bit 24 is the indicator of Thumb state according to ARM info center.
> So
> > it
> > should be correct, or am I getting something wrong?
>
> Odd. In that case what should happen is that the call to
> xpsr_write() should cause env->thumb to be set, which is
> the QEMU internal state that tracks whether we are in Arm
> or Thumb mode.
>
> I would recommend adding also int,exec,cpu,unimp to your tracing
> options. That will allow you to confirm exactly what the CPU
> state on return from the exception is, because it will print
> a register state dump to the log. (the 'cpu' and 'exec' logs
> do slow down the emulation a lot, but hopefully this bug
> happens early in execution.)
>
> thanks
> -- PMM
>

--001a1146ec84d36f190565c53448
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">

<span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:1=
2.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:nor=
mal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;=
text-transform:none;white-space:normal;word-spacing:0px;background-color:rg=
b(255,255,255);text-decoration-style:initial;text-decoration-color:initial;=
float:none;display:inline">

<span style=3D"color:rgb(80,0,80);font-family:arial,sans-serif;font-size:12=
.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norm=
al;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;t=
ext-transform:none;white-space:normal;word-spacing:0px;background-color:rgb=
(255,255,255);text-decoration-style:initial;text-decoration-color:initial;f=
loat:none;display:inline">&gt;<span>=C2=A0</span></span>

Odd. In that case what should happen is that the call to</span><br style=3D=
"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-sty=
le:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weigh=
t:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform=
:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255)=
;text-decoration-style:initial;text-decoration-color:initial"><span style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-=
style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-we=
ight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transf=
orm:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,2=
55);text-decoration-style:initial;text-decoration-color:initial;float:none;=
display:inline">



<span style=3D"color:rgb(80,0,80);font-family:arial,sans-serif;font-size:12=
.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norm=
al;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;t=
ext-transform:none;white-space:normal;word-spacing:0px;background-color:rgb=
(255,255,255);text-decoration-style:initial;text-decoration-color:initial;f=
loat:none;display:inline">&gt;<span>=C2=A0</span></span>


xpsr_write() should cause env-&gt;thumb to be set, which is</span><br style=
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
;display:inline">

<span style=3D"color:rgb(80,0,80);font-family:arial,sans-serif;font-size:12=
.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norm=
al;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;t=
ext-transform:none;white-space:normal;word-spacing:0px;background-color:rgb=
(255,255,255);text-decoration-style:initial;text-decoration-color:initial;f=
loat:none;display:inline">&gt;<span>=C2=A0</span></span>

the QEMU internal state that tracks whether we are in Arm</span><br style=
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
;display:inline">

<span style=3D"color:rgb(80,0,80);font-family:arial,sans-serif;font-size:12=
.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norm=
al;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;t=
ext-transform:none;white-space:normal;word-spacing:0px;background-color:rgb=
(255,255,255);text-decoration-style:initial;text-decoration-color:initial;f=
loat:none;display:inline">&gt;<span>=C2=A0</span></span>

or Thumb mode.</span><br style=3D"color:rgb(34,34,34);font-family:arial,san=
s-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;fo=
nt-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:sta=
rt;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;=
background-color:rgb(255,255,255);text-decoration-style:initial;text-decora=
tion-color:initial">

<span style=3D"color:rgb(80,0,80);font-family:arial,sans-serif;font-size:12=
.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norm=
al;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;t=
ext-transform:none;white-space:normal;word-spacing:0px;background-color:rgb=
(255,255,255);text-decoration-style:initial;text-decoration-color:initial;f=
loat:none;display:inline">&gt;<span>=C2=A0</span></span>

<br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.=
8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norma=
l;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;te=
xt-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(=
255,255,255);text-decoration-style:initial;text-decoration-color:initial"><=
span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12=
.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norm=
al;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;t=
ext-transform:none;white-space:normal;word-spacing:0px;background-color:rgb=
(255,255,255);text-decoration-style:initial;text-decoration-color:initial;f=
loat:none;display:inline">

<span style=3D"color:rgb(80,0,80);font-family:arial,sans-serif;font-size:12=
.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norm=
al;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;t=
ext-transform:none;white-space:normal;word-spacing:0px;background-color:rgb=
(255,255,255);text-decoration-style:initial;text-decoration-color:initial;f=
loat:none;display:inline">&gt;<span>=C2=A0</span></span>

I would recommend adding also int,exec,cpu,unimp to your tracing</span><br =
style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;=
font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;fo=
nt-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-t=
ransform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,=
255,255);text-decoration-style:initial;text-decoration-color:initial"><span=
 style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px=
;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;f=
ont-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-=
transform:none;white-space:normal;word-spacing:0px;background-color:rgb(255=
,255,255);text-decoration-style:initial;text-decoration-color:initial;float=
:none;display:inline">

<span style=3D"color:rgb(80,0,80);font-family:arial,sans-serif;font-size:12=
.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norm=
al;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;t=
ext-transform:none;white-space:normal;word-spacing:0px;background-color:rgb=
(255,255,255);text-decoration-style:initial;text-decoration-color:initial;f=
loat:none;display:inline">&gt;<span>=C2=A0</span></span>

options. That will allow you to confirm exactly what the CPU</span><br styl=
e=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font=
-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-w=
eight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-trans=
form:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,=
255);text-decoration-style:initial;text-decoration-color:initial"><span sty=
le=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;fon=
t-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-=
weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tran=
sform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255=
,255);text-decoration-style:initial;text-decoration-color:initial;float:non=
e;display:inline">

<span style=3D"color:rgb(80,0,80);font-family:arial,sans-serif;font-size:12=
.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norm=
al;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;t=
ext-transform:none;white-space:normal;word-spacing:0px;background-color:rgb=
(255,255,255);text-decoration-style:initial;text-decoration-color:initial;f=
loat:none;display:inline">&gt;<span>=C2=A0</span></span>

state on return from the exception is, because it will print</span><br styl=
e=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font=
-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-w=
eight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-trans=
form:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,=
255);text-decoration-style:initial;text-decoration-color:initial"><span sty=
le=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;fon=
t-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-=
weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tran=
sform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255=
,255);text-decoration-style:initial;text-decoration-color:initial;float:non=
e;display:inline">

<span style=3D"color:rgb(80,0,80);font-family:arial,sans-serif;font-size:12=
.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norm=
al;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;t=
ext-transform:none;white-space:normal;word-spacing:0px;background-color:rgb=
(255,255,255);text-decoration-style:initial;text-decoration-color:initial;f=
loat:none;display:inline">&gt;<span>=C2=A0</span></span>

a register state dump to the log. (the &#39;cpu&#39; and &#39;exec&#39; log=
s</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-=
size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-ca=
ps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inden=
t:0px;text-transform:none;white-space:normal;word-spacing:0px;background-co=
lor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:in=
itial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font=
-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-c=
aps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inde=
nt:0px;text-transform:none;white-space:normal;word-spacing:0px;background-c=
olor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:i=
nitial;float:none;display:inline">

<span style=3D"color:rgb(80,0,80);font-family:arial,sans-serif;font-size:12=
.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norm=
al;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;t=
ext-transform:none;white-space:normal;word-spacing:0px;background-color:rgb=
(255,255,255);text-decoration-style:initial;text-decoration-color:initial;f=
loat:none;display:inline">&gt;<span>=C2=A0</span></span>

do slow down the emulation a lot, but hopefully this bug</span><br style=3D=
"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-sty=
le:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weigh=
t:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform=
:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255)=
;text-decoration-style:initial;text-decoration-color:initial"><span style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-=
style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-we=
ight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transf=
orm:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,2=
55);text-decoration-style:initial;text-decoration-color:initial;float:none;=
display:inline">

<span style=3D"color:rgb(80,0,80);font-family:arial,sans-serif;font-size:12=
.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norm=
al;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;t=
ext-transform:none;white-space:normal;word-spacing:0px;background-color:rgb=
(255,255,255);text-decoration-style:initial;text-decoration-color:initial;f=
loat:none;display:inline">&gt;<span>=C2=A0</span></span>

happens early in execution.)</span><br style=3D"color:rgb(34,34,34);font-fa=
mily:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligat=
ures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;=
text-align:start;text-indent:0px;text-transform:none;white-space:normal;wor=
d-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initi=
al;text-decoration-color:initial">

<br>I have turned on the log options and I find out the execution will go<d=
iv>into the same interrupt service routine for multiple times as soon as</d=
iv><div>it exits from execption handler, before it hits its expected return=
 address.=C2=A0</div><div>So I look into the NVIC registers in cortex M3. I=
 find out the ISPR=C2=A0</div><div>register (interrupt set pending register=
s) in NVIC is not function normally.=C2=A0</div><div><div style=3D"color:rg=
b(34,34,34);font-family:arial,sans-serif;font-size:small;font-style:normal;=
font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;lett=
er-spacing:normal;text-align:start;text-indent:0px;text-transform:none;whit=
e-space:normal;word-spacing:0px;text-decoration-style:initial;text-decorati=
on-color:initial"><br></div><div style=3D"color:rgb(34,34,34);font-family:a=
rial,sans-serif;font-size:small;font-style:normal;font-variant-ligatures:no=
rmal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-al=
ign:start;text-indent:0px;text-transform:none;white-space:normal;word-spaci=
ng:0px;text-decoration-style:initial;text-decoration-color:initial">I made =
a breakpoint just before the code exit the exception handler.=C2=A0</div><d=
iv style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:smal=
l;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;=
font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text=
-transform:none;white-space:normal;word-spacing:0px;text-decoration-style:i=
nitial;text-decoration-color:initial">And I use &#39;x /20xw 0xe000e200&#39=
; to check the ISPR register. At this point, the</div></div><div style=3D"c=
olor:rgb(34,34,34);font-family:arial,sans-serif;font-size:small;font-style:=
normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:4=
00;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:no=
ne;white-space:normal;word-spacing:0px;text-decoration-style:initial;text-d=
ecoration-color:initial">value is 0x0, and then I type &#39;si&#39; to gdb,=
 and the code go to the expected return</div><div style=3D"color:rgb(34,34,=
34);font-family:arial,sans-serif;font-size:small;font-style:normal;font-var=
iant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spaci=
ng:normal;text-align:start;text-indent:0px;text-transform:none;white-space:=
normal;word-spacing:0px;text-decoration-style:initial;text-decoration-color=
:initial">=C2=A0address. Then I &#39;x /20xw 0xe000e200&#39; again, but thi=
s time, the value is 0x10,=C2=A0</div><div style=3D"color:rgb(34,34,34);fon=
t-family:arial,sans-serif;font-size:small;font-style:normal;font-variant-li=
gatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:norm=
al;text-align:start;text-indent:0px;text-transform:none;white-space:normal;=
word-spacing:0px;text-decoration-style:initial;text-decoration-color:initia=
l">which indicates an interrupt is pending. If I type &#39;c&#39; in gdb, t=
he code will go to the=C2=A0</div><div style=3D"color:rgb(34,34,34);font-fa=
mily:arial,sans-serif;font-size:small;font-style:normal;font-variant-ligatu=
res:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;t=
ext-align:start;text-indent:0px;text-transform:none;white-space:normal;word=
-spacing:0px;text-decoration-style:initial;text-decoration-color:initial">i=
nterrupt service routine again.</div><div><br></div><div>Do you have any id=
ea in mind?</div><div><br></div><div>Thanks a lot! I am looking forward to =
your reply.</div><div><br></div><div>Ruide Zhang<br><div><br></div><div><br=
></div></div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote=
">On Wed, Feb 21, 2018 at 10:09 AM, Peter Maydell <span dir=3D"ltr">&lt;<a =
href=3D"mailto:peter.maydell@linaro.org" target=3D"_blank">peter.maydell@li=
naro.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span cl=
ass=3D"">On 21 February 2018 at 14:25, Rd Cheung &lt;<a href=3D"mailto:rdzh=
ang@vt.edu">rdzhang@vt.edu</a>&gt; wrote:<br>
&gt; Yes, this looks like misusing ARM mode instead of Thumb mode to me.<br=
>
&gt; I just checked the local variable xpsr in function do_v7m_exception_ex=
it()<br>
&gt; by adding a qemu_log_mask line at the end of the function. I turn on l=
og by<br>
&gt; -d in_asm,guest_errors. And the xpsr =3D 0x1000000, which has its bit =
24 set<br>
&gt; to 1.<br>
&gt; And bit 24 is the indicator of Thumb state according to ARM info cente=
r. So<br>
&gt; it<br>
&gt; should be correct, or am I getting something wrong?<br>
<br>
</span>Odd. In that case what should happen is that the call to<br>
xpsr_write() should cause env-&gt;thumb to be set, which is<br>
the QEMU internal state that tracks whether we are in Arm<br>
or Thumb mode.<br>
<br>
I would recommend adding also int,exec,cpu,unimp to your tracing<br>
options. That will allow you to confirm exactly what the CPU<br>
state on return from the exception is, because it will print<br>
a register state dump to the log. (the &#39;cpu&#39; and &#39;exec&#39; log=
s<br>
do slow down the emulation a lot, but hopefully this bug<br>
happens early in execution.)<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div><br></div>

--001a1146ec84d36f190565c53448--
