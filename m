Received: by 10.28.71.27 with SMTP id u27csp1948041wma;
        Thu, 22 Feb 2018 05:19:50 -0800 (PST)
X-Google-Smtp-Source: AH8x224SWwz8CrpFid+7XQkw8HAfIB4RfEJkHPT1gTiOBFGzKq1N0bNTpzDb+pKchAXhG83BFek+
X-Received: by 10.13.216.194 with SMTP id a185mr3451922ywe.193.1519305590452;
        Thu, 22 Feb 2018 05:19:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519305590; cv=none;
        d=google.com; s=arc-20160816;
        b=DQ2EMaWJ7ADcPf5Q51TPaGUv6mTv8p6raSuMap40aJBT/4mPW4Vn5vIURJLdBiRvRu
         LludTS2lb2FpV3xiXKrPTFOrkUYVrzOK+2OaChKJdoTP7PF118EIG9Okoc+leyHsz5DL
         MGs8Xkzu4MNzb012a+LXwOzrJBWQVK8XYec1eiJDsbg5E11s8+Dz5txB51g97tUk2PzA
         eXosp6BLKJh8Isk+hKFpRmnSoHMH/HuWGBdWe65rqe46g+xswdNbHAZChG29dfZFxjbo
         0bNRhjyPp19QOwCxuI9JkrdL4myuDylZFdHrhwIgezrKfx6MdbQ5KFdSYFQWjK4V1HdL
         IAyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:arc-authentication-results;
        bh=ALLZphrpYaIbwD7bRvpfht8Fb/dOhRv/5Dw5h9sEF6E=;
        b=qJlE0itFe+wi6DOXKMJBpiQsw3DoV6OTbh0SOX2i835iszYnO1+lUsGyOv5puQHSnz
         /wuVNz1EGeiNgrJ3SOp1zS5fUSNY8jIQGLejtkgWE6zdokkswBnCgGzO7vFUqVKr+VT9
         9pJq7ox0GO/yFHRSHsfwaqRGtRU2C3rWGiFK3NfWZ5ieB+IOkxha1rAGCURHpBxMNVWr
         eaXKiRCqZQuIfcnRZifSUBR8TCFyFaMVx6xr+Q8T100BXhdXcvmrQ+yARBXDI4946bT/
         QJy5h2iPBCXj6sa6LKT/ByKq0vdGuTLn0H/JqYTbVtq4cLy68mLuQVnB2OI3Y4JtstAM
         Cy9w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=vt.edu
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b3-v6si9419ybn.643.2018.02.22.05.19.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Feb 2018 05:19:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=vt.edu
Received: from localhost ([::1]:38219 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eoqmr-0004EP-T0
	for alex.bennee@linaro.org; Thu, 22 Feb 2018 08:19:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34321)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rdzhang@vt.edu>) id 1eoqmh-0004EA-1H
	for qemu-arm@nongnu.org; Thu, 22 Feb 2018 08:19:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rdzhang@vt.edu>) id 1eoqmd-0001bs-RE
	for qemu-arm@nongnu.org; Thu, 22 Feb 2018 08:19:39 -0500
Received: from omr1.cc.ipv6.vt.edu ([2607:b400:92:8300:0:c6:2117:b0e]:58516
	helo=omr1.cc.vt.edu)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <rdzhang@vt.edu>) id 1eoqmd-0001bD-EO
	for qemu-arm@nongnu.org; Thu, 22 Feb 2018 08:19:35 -0500
Received: from mr5.cc.vt.edu (mr5.cc.ipv6.vt.edu
	[IPv6:2607:b400:92:8400:0:72:232:758b])
	by omr1.cc.vt.edu (8.14.4/8.14.4) with ESMTP id w1MDJY37004615
	for <qemu-arm@nongnu.org>; Thu, 22 Feb 2018 08:19:34 -0500
Received: from mail-qt0-f198.google.com (mail-qt0-f198.google.com
	[209.85.216.198])
	by mr5.cc.vt.edu (8.14.7/8.14.7) with ESMTP id w1MDJT8K006053
	for <qemu-arm@nongnu.org>; Thu, 22 Feb 2018 08:19:34 -0500
Received: by mail-qt0-f198.google.com with SMTP id p11so3959710qtg.19
	for <qemu-arm@nongnu.org>; Thu, 22 Feb 2018 05:19:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ALLZphrpYaIbwD7bRvpfht8Fb/dOhRv/5Dw5h9sEF6E=;
	b=l686mLaSppi3h+to3VgX2BPQY+OMRxaj+6tsNpTzjWllj2Ii4PBlMXwEgYfWDcr/sS
	SK7m/F2SchuOqix8gk7m13PJ7RbPtG+sryeYlUWRgb5aTWk6eTAxNEjaHtyxr3OZTwDR
	GFALIusKDsvcytVa1B2CQBs+UeQjF96glMw/zf4CohIZ2Gq0BmFWYKbwIpXkWd9/k3c0
	8sNMClQYjfsJC2X1evRQLgN5c5lgtG/zZeXvSKW1t81eG8oQRErdWwNny6u1QUuJjbDZ
	fxtDXs8cW1UH/2ZX5nvmnC6xD143xlGtl0mnvJzcafxgjbNGY6SYCoQJPDhYSdU9j8Vb
	idCg==
X-Gm-Message-State: APf1xPCOPmIIxoVhWOzjlhdcqE3Qafx+xqlu/XZ2BU33F7EmeBRgqGC8
	OxZXXyg0opIi1wZBMmhubAmtKWn3JeGHtqZS+gWhV6qwQzXRXP1MIkDoKzneCX7kxHaNmH2iuO/
	6MHNIf5fsVXQTLsrwoamamSHCNT6DJb3uw7fI7gw=
X-Received: by 10.55.79.19 with SMTP id d19mr10937915qkb.328.1519305569415;
	Thu, 22 Feb 2018 05:19:29 -0800 (PST)
X-Received: by 10.55.79.19 with SMTP id d19mr10937891qkb.328.1519305569151;
	Thu, 22 Feb 2018 05:19:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.39.200 with HTTP; Thu, 22 Feb 2018 05:19:28 -0800 (PST)
In-Reply-To: <CAFEAcA9xv06hquekGd-6+MNn_U1FYan11ihccy03U0cuzx+c2g@mail.gmail.com>
References: <CAFmp02z8NnRq6eSCDa2GYJDXE2-cK6+yS1SKHAbiBDhKV_F2yg@mail.gmail.com>
	<CAFEAcA8fnqL9tKa4tVPDoWTKYsOVKhxZ04c39fvgKNgQ-F+ESg@mail.gmail.com>
	<CAFmp02xLicV+dSFhJjYX8djQMGvVaYtih6hB9HAd4HqnA2=VfQ@mail.gmail.com>
	<CAFEAcA9q=u-wF96WW3oJ=1PDuA7bAn_k-YiGRf2gn8Appj8mBw@mail.gmail.com>
	<CAFmp02w8XoiRket_sAGziU3bDX3w+NWVwvBkbT0XE_xrbG-TVg@mail.gmail.com>
	<CAFEAcA9xv06hquekGd-6+MNn_U1FYan11ihccy03U0cuzx+c2g@mail.gmail.com>
From: Rd Cheung <rdzhang@vt.edu>
Date: Thu, 22 Feb 2018 08:19:28 -0500
Message-ID: <CAFmp02y=n4RQQKvd1NEeDjX5OoX4sao-bULfSO_3iSHksEnpzg@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="001a114a8332c14f620565cce4a6"
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
X-TUID: lY+X0FttC03w

--001a114a8332c14f620565cce4a6
Content-Type: text/plain; charset="UTF-8"

 > What device is the interrupt handler for? Sometimes you can get
> this behaviour in QEMU for timer interrupts if the guest code
> programs the timer for a fast interrupt rate that is faster
> than QEMU's emulation speed can handle.

The interrupt handler is for a real time clock device and the interrupt
number is 5. I trim the gptm code for stellaris because the firmware
image only need real time clock for now. I set up a  qemu_log_mask
right before the device use qemu_set_irq to raise an interrupt. And
from the log, the qemu_set_irq is triggered only once. I guess fast
interrupt rate would not affect in this case, since it is not
continuously triggering an interrupt.

And from the log in previous email, I assume the interrupt has been
cleared during exit, because the IABR (interrupt active bit register)
is cleared after exit. I am confused about why ISPR (interrupt set
pending register) is set after exception exit. The proper behavior shall
not include this.

> If you're dealing with interrupt numbers larger than 32 you'll
> need the bug fix in master in commit 12fbf1a1639ed91, which
> fixed problems with ISPR for larger interrupt numbers.

The interrupt number is 5, so I guess it is not for this reason.

> Especially if you're stepping in gdb this can happen for timers,
> because the timer will expire while you're stopped in gdb, and
> then fire as soon as you let QEMU run.

As I mentioned above, the qemu_set_irq is trigger once. I donot
understand why the execution flow keep going into 'Taking exception5'
after it 'Taking exception 8 [QEMU v7M exception exit]' for multiple times.
I am using qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL), so the
timer should stop counting when I stop in gdb if I am understanding
correctly.


Thank you! I am looking forward to your reply.

Ruide Zhang



On Thu, Feb 22, 2018 at 5:00 AM, Peter Maydell <peter.maydell@linaro.org>
wrote:

> On 22 February 2018 at 04:09, Rd Cheung <rdzhang@vt.edu> wrote:
> > I have turned on the log options and I find out the execution will go
> > into the same interrupt service routine for multiple times as soon as
> > it exits from execption handler, before it hits its expected return
> address.
>
> What device is the interrupt handler for? Sometimes you can get
> this behaviour in QEMU for timer interrupts if the guest code
> programs the timer for a fast interrupt rate that is faster
> than QEMU's emulation speed can handle.
>
> > So I look into the NVIC registers in cortex M3. I find out the ISPR
> > register (interrupt set pending registers) in NVIC is not function
> normally.
>
> If you're dealing with interrupt numbers larger than 32 you'll
> need the bug fix in master in commit 12fbf1a1639ed91, which
> fixed problems with ISPR for larger interrupt numbers.
>
> > I made a breakpoint just before the code exit the exception handler.
> > And I use 'x /20xw 0xe000e200' to check the ISPR register. At this point,
> > the
> > value is 0x0, and then I type 'si' to gdb, and the code go to the
> expected
> > return
> >  address. Then I 'x /20xw 0xe000e200' again, but this time, the value is
> > 0x10,
> > which indicates an interrupt is pending. If I type 'c' in gdb, the code
> will
> > go to the
> > interrupt service routine again.
>
> Especially if you're stepping in gdb this can happen for timers,
> because the timer will expire while you're stopped in gdb, and
> then fire as soon as you let QEMU run.
>
> thanks
> -- PMM
>

--001a114a8332c14f620565cce4a6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">

<span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:1=
2.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:nor=
mal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;=
text-transform:none;white-space:normal;word-spacing:0px;background-color:rg=
b(255,255,255);text-decoration-style:initial;text-decoration-color:initial;=
float:none;display:inline">&gt; What device is the interrupt handler for? S=
ometimes you can get</span><br style=3D"color:rgb(34,34,34);font-family:ari=
al,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:nor=
mal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-ali=
gn:start;text-indent:0px;text-transform:none;white-space:normal;word-spacin=
g:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text-=
decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-family:ar=
ial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:no=
rmal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-al=
ign:start;text-indent:0px;text-transform:none;white-space:normal;word-spaci=
ng:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text=
-decoration-color:initial;float:none;display:inline">

<span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:1=
2.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:nor=
mal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;=
text-transform:none;white-space:normal;word-spacing:0px;background-color:rg=
b(255,255,255);text-decoration-style:initial;text-decoration-color:initial;=
float:none;display:inline">&gt;<span>=C2=A0</span></span>this behaviour in =
QEMU for timer interrupts if the guest code</span><br style=3D"color:rgb(34=
,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;fon=
t-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-=
spacing:normal;text-align:start;text-indent:0px;text-transform:none;white-s=
pace:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decorat=
ion-style:initial;text-decoration-color:initial"><span style=3D"color:rgb(3=
4,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;fo=
nt-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter=
-spacing:normal;text-align:start;text-indent:0px;text-transform:none;white-=
space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decora=
tion-style:initial;text-decoration-color:initial;float:none;display:inline"=
>

<span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:1=
2.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:nor=
mal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;=
text-transform:none;white-space:normal;word-spacing:0px;background-color:rg=
b(255,255,255);text-decoration-style:initial;text-decoration-color:initial;=
float:none;display:inline">&gt;<span>=C2=A0</span></span>programs the timer=
 for a fast interrupt rate that is faster</span><br style=3D"color:rgb(34,3=
4,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-=
variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-sp=
acing:normal;text-align:start;text-indent:0px;text-transform:none;white-spa=
ce:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decoratio=
n-style:initial;text-decoration-color:initial"><span style=3D"color:rgb(34,=
34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font=
-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-s=
pacing:normal;text-align:start;text-indent:0px;text-transform:none;white-sp=
ace:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decorati=
on-style:initial;text-decoration-color:initial;float:none;display:inline">

<span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:1=
2.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:nor=
mal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;=
text-transform:none;white-space:normal;word-spacing:0px;background-color:rg=
b(255,255,255);text-decoration-style:initial;text-decoration-color:initial;=
float:none;display:inline">&gt;</span><span style=3D"color:rgb(34,34,34);fo=
nt-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-=
ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:no=
rmal;text-align:start;text-indent:0px;text-transform:none;white-space:norma=
l;word-spacing:0px;text-decoration-style:initial;text-decoration-color:init=
ial">=C2=A0</span>than QEMU&#39;s emulation speed can handle.</span><div><b=
r></div><div>The interrupt handler is for a real time clock device and the =
interrupt=C2=A0</div><div>number is 5. I trim the gptm code for stellaris b=
ecause the firmware=C2=A0</div><div>image only need real time clock for now=
. I set up a=C2=A0 qemu_log_mask</div><div>right before the device use qemu=
_set_irq to raise an interrupt. And=C2=A0</div><div>from the log, the qemu_=
set_irq is triggered only once. I guess fast=C2=A0</div><div>interrupt rate=
 would not affect in this case, since it is not</div><div>continuously trig=
gering an interrupt.=C2=A0</div><div><br></div><div>And from the log in pre=
vious email, I assume the interrupt has been=C2=A0</div><div>cleared during=
 exit, because the IABR (interrupt active bit register)=C2=A0</div><div>is =
cleared after exit. I am confused about why ISPR (interrupt set=C2=A0</div>=
<div>pending register) is set after exception exit. The proper behavior sha=
ll=C2=A0</div><div>not include this.</div><div><br><div>

<span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:1=
2.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:nor=
mal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;=
text-transform:none;white-space:normal;word-spacing:0px;background-color:rg=
b(255,255,255);text-decoration-style:initial;text-decoration-color:initial;=
float:none;display:inline">

<span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:1=
2.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:nor=
mal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;=
text-transform:none;white-space:normal;word-spacing:0px;background-color:rg=
b(255,255,255);text-decoration-style:initial;text-decoration-color:initial;=
float:none;display:inline">&gt;</span><span style=3D"color:rgb(34,34,34);fo=
nt-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-=
ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:no=
rmal;text-align:start;text-indent:0px;text-transform:none;white-space:norma=
l;word-spacing:0px;text-decoration-style:initial;text-decoration-color:init=
ial">=C2=A0</span>If you&#39;re dealing with interrupt numbers larger than =
32 you&#39;ll</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans=
-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;fon=
t-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:star=
t;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;b=
ackground-color:rgb(255,255,255);text-decoration-style:initial;text-decorat=
ion-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,san=
s-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;fo=
nt-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:sta=
rt;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;=
background-color:rgb(255,255,255);text-decoration-style:initial;text-decora=
tion-color:initial;float:none;display:inline">

<span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:1=
2.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:nor=
mal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;=
text-transform:none;white-space:normal;word-spacing:0px;background-color:rg=
b(255,255,255);text-decoration-style:initial;text-decoration-color:initial;=
float:none;display:inline">&gt;</span><span style=3D"color:rgb(34,34,34);fo=
nt-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-=
ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:no=
rmal;text-align:start;text-indent:0px;text-transform:none;white-space:norma=
l;word-spacing:0px;text-decoration-style:initial;text-decoration-color:init=
ial">=C2=A0</span>need the bug fix in master in commit 12fbf1a1639ed91, whi=
ch</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font=
-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-c=
aps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inde=
nt:0px;text-transform:none;white-space:normal;word-spacing:0px;background-c=
olor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:i=
nitial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fon=
t-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-=
caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-ind=
ent:0px;text-transform:none;white-space:normal;word-spacing:0px;background-=
color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:=
initial;float:none;display:inline">

<span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:1=
2.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:nor=
mal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;=
text-transform:none;white-space:normal;word-spacing:0px;background-color:rg=
b(255,255,255);text-decoration-style:initial;text-decoration-color:initial;=
float:none;display:inline">&gt;</span><span style=3D"color:rgb(34,34,34);fo=
nt-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-=
ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:no=
rmal;text-align:start;text-indent:0px;text-transform:none;white-space:norma=
l;word-spacing:0px;text-decoration-style:initial;text-decoration-color:init=
ial">=C2=A0</span>fixed problems with ISPR for larger interrupt numbers.</s=
pan><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size=
:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:n=
ormal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0p=
x;text-transform:none;white-space:normal;word-spacing:0px;background-color:=
rgb(255,255,255);text-decoration-style:initial;text-decoration-color:initia=
l">

<br></div><div>The interrupt number is 5, so I guess it is not for this rea=
son.</div><div><br></div><div>

<span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:1=
2.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:nor=
mal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;=
text-transform:none;white-space:normal;word-spacing:0px;background-color:rg=
b(255,255,255);text-decoration-style:initial;text-decoration-color:initial;=
float:none;display:inline">

<span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:1=
2.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:nor=
mal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;=
text-transform:none;white-space:normal;word-spacing:0px;background-color:rg=
b(255,255,255);text-decoration-style:initial;text-decoration-color:initial;=
float:none;display:inline">&gt;</span><span style=3D"color:rgb(34,34,34);fo=
nt-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-=
ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:no=
rmal;text-align:start;text-indent:0px;text-transform:none;white-space:norma=
l;word-spacing:0px;text-decoration-style:initial;text-decoration-color:init=
ial">=C2=A0</span>Especially if you&#39;re stepping in gdb this can happen =
for timers,</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-s=
erif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-=
variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;=
text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;bac=
kground-color:rgb(255,255,255);text-decoration-style:initial;text-decoratio=
n-color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-=
serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font=
-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start=
;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;ba=
ckground-color:rgb(255,255,255);text-decoration-style:initial;text-decorati=
on-color:initial;float:none;display:inline">

<span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:1=
2.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:nor=
mal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;=
text-transform:none;white-space:normal;word-spacing:0px;background-color:rg=
b(255,255,255);text-decoration-style:initial;text-decoration-color:initial;=
float:none;display:inline">&gt;</span><span style=3D"color:rgb(34,34,34);fo=
nt-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-=
ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:no=
rmal;text-align:start;text-indent:0px;text-transform:none;white-space:norma=
l;word-spacing:0px;text-decoration-style:initial;text-decoration-color:init=
ial">=C2=A0</span>because the timer will expire while you&#39;re stopped in=
 gdb, and</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-ser=
if;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-va=
riant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;te=
xt-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backg=
round-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-=
color:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-se=
rif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-v=
ariant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;t=
ext-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;back=
ground-color:rgb(255,255,255);text-decoration-style:initial;text-decoration=
-color:initial;float:none;display:inline">

<span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:1=
2.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:nor=
mal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;=
text-transform:none;white-space:normal;word-spacing:0px;background-color:rg=
b(255,255,255);text-decoration-style:initial;text-decoration-color:initial;=
float:none;display:inline">&gt;</span><span style=3D"color:rgb(34,34,34);fo=
nt-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-=
ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:no=
rmal;text-align:start;text-indent:0px;text-transform:none;white-space:norma=
l;word-spacing:0px;text-decoration-style:initial;text-decoration-color:init=
ial">=C2=A0</span>then fire as soon as you let QEMU run.</span><br style=3D=
"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-sty=
le:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weigh=
t:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform=
:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255)=
;text-decoration-style:initial;text-decoration-color:initial"></div><div><b=
r></div><div>As I mentioned above, the qemu_set_irq is trigger once. I dono=
t=C2=A0</div><div>understand why the execution flow keep going into &#39;Ta=
king exception5&#39;</div><div>after it &#39;Taking exception 8 [QEMU v7M e=
xception exit]&#39; for multiple times.</div><div>I am using qemu_clock_get=
_ns(QEMU_CLOCK_VIRTUAL), so the=C2=A0</div><div>timer should stop counting =
when I stop in gdb if I am understanding=C2=A0</div><div>correctly.</div><d=
iv><br></div><div><br></div><div>Thank you! I am looking forward to your re=
ply.</div><div><br></div><div>Ruide Zhang</div><div><br></div><div><br></di=
v></div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On =
Thu, Feb 22, 2018 at 5:00 AM, Peter Maydell <span dir=3D"ltr">&lt;<a href=
=3D"mailto:peter.maydell@linaro.org" target=3D"_blank">peter.maydell@linaro=
.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D=
"">On 22 February 2018 at 04:09, Rd Cheung &lt;<a href=3D"mailto:rdzhang@vt=
.edu">rdzhang@vt.edu</a>&gt; wrote:<br>
&gt; I have turned on the log options and I find out the execution will go<=
br>
&gt; into the same interrupt service routine for multiple times as soon as<=
br>
&gt; it exits from execption handler, before it hits its expected return ad=
dress.<br>
<br>
</span>What device is the interrupt handler for? Sometimes you can get<br>
this behaviour in QEMU for timer interrupts if the guest code<br>
programs the timer for a fast interrupt rate that is faster<br>
than QEMU&#39;s emulation speed can handle.<br>
<span class=3D""><br>
&gt; So I look into the NVIC registers in cortex M3. I find out the ISPR<br=
>
&gt; register (interrupt set pending registers) in NVIC is not function nor=
mally.<br>
<br>
</span>If you&#39;re dealing with interrupt numbers larger than 32 you&#39;=
ll<br>
need the bug fix in master in commit 12fbf1a1639ed91, which<br>
fixed problems with ISPR for larger interrupt numbers.<br>
<span class=3D""><br>
&gt; I made a breakpoint just before the code exit the exception handler.<b=
r>
&gt; And I use &#39;x /20xw 0xe000e200&#39; to check the ISPR register. At =
this point,<br>
&gt; the<br>
&gt; value is 0x0, and then I type &#39;si&#39; to gdb, and the code go to =
the expected<br>
&gt; return<br>
&gt;=C2=A0 address. Then I &#39;x /20xw 0xe000e200&#39; again, but this tim=
e, the value is<br>
&gt; 0x10,<br>
&gt; which indicates an interrupt is pending. If I type &#39;c&#39; in gdb,=
 the code will<br>
&gt; go to the<br>
&gt; interrupt service routine again.<br>
<br>
</span>Especially if you&#39;re stepping in gdb this can happen for timers,=
<br>
because the timer will expire while you&#39;re stopped in gdb, and<br>
then fire as soon as you let QEMU run.<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div><br></div>

--001a114a8332c14f620565cce4a6--
