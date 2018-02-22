Received: by 10.28.71.27 with SMTP id u27csp2022633wma;
        Thu, 22 Feb 2018 06:31:34 -0800 (PST)
X-Google-Smtp-Source: AH8x227vcBM13LtLcpYmxf/W5beh/si61VMetLQ78N30t+JXofQCPksEa9TjG7th7djtY0Gi0AMm
X-Received: by 10.129.84.69 with SMTP id i66mr4870456ywb.264.1519309894722;
        Thu, 22 Feb 2018 06:31:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519309894; cv=none;
        d=google.com; s=arc-20160816;
        b=CG5ObdsRKN/WmUQNo5Ui8PF2MoUJkg6O4WR9MNoMff8VnmDnHzRF9OmAM5a2Lr5C9u
         oZJS/ZLGYsj7WY2sZqO2lIRRX4FN6f1qlG+TUZzdK4CtZDDrzaIAZObrjmp78kVk2k78
         V6pOlbqlhtno7lLybRNUI8ChbdOCD/OehYCs7nWV99+WMuXIjWlpMMHxAsyaHXGC7Kv6
         fyOpcck1mnLTvhUpJ+ijZ6xNYyoVDrU8eebLHOpkyika8WKP3vi04XltGjVhElY+fHt3
         Fn4j0yDyPp95vJY5N0XRlvsSYIn3b2mCYdWdhGvJYAaP5H0aKMKXygiXSetTG+QB2hOY
         SHAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:arc-authentication-results;
        bh=EdYOayBBQ76GTOeJt3UE0sJgg8uOazxisLlzRRz5Bts=;
        b=uSEZi/5keGjw+FH4RSU2HRC/niAzFyhQqp4r7cXy3IjAGsM/OXkS6rcawbCl1jMLWE
         m8vDBXeqfZv1g/YSjDgCJCuUmwiDNb9Cx2mVcBWFhlILVRfyApDBoXOEFsMcp8JMU50f
         XnqJLEpopbNDWzLB/HZDdCMUdZyljkKPOvaOZmLyA6urrwIqtPgjzue8gVKcyj1oVxIN
         SlMW9P/myG4ccEFQLgTiMBSaPTR8wiDVITZPjAlsGIS+jLTs1d6c43s01xklUal6qoIs
         K/7uEG7N1ag4Xw+DVXapRgK6ED3Dyiphh0Tkos17kUOAlXwbPmjUOS29o57CvtE57YLZ
         ZUHA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=vt.edu
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p17-v6si29797ybd.653.2018.02.22.06.31.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Feb 2018 06:31:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=vt.edu
Received: from localhost ([::1]:38598 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eoruI-0003I2-4v
	for alex.bennee@linaro.org; Thu, 22 Feb 2018 09:31:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51964)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rdzhang@vt.edu>) id 1eoru6-0003HA-Dg
	for qemu-arm@nongnu.org; Thu, 22 Feb 2018 09:31:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rdzhang@vt.edu>) id 1eoru3-0006yB-60
	for qemu-arm@nongnu.org; Thu, 22 Feb 2018 09:31:22 -0500
Received: from omr1.cc.ipv6.vt.edu ([2607:b400:92:8300:0:c6:2117:b0e]:36860
	helo=omr1.cc.vt.edu)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <rdzhang@vt.edu>) id 1eoru2-0006xD-V6
	for qemu-arm@nongnu.org; Thu, 22 Feb 2018 09:31:19 -0500
Received: from mr2.cc.vt.edu (mr2.cc.ipv6.vt.edu
	[IPv6:2607:b400:92:8400:0:90:e077:bf22])
	by omr1.cc.vt.edu (8.14.4/8.14.4) with ESMTP id w1MEVI8w019895
	for <qemu-arm@nongnu.org>; Thu, 22 Feb 2018 09:31:18 -0500
Received: from mail-qt0-f197.google.com (mail-qt0-f197.google.com
	[209.85.216.197])
	by mr2.cc.vt.edu (8.14.7/8.14.7) with ESMTP id w1MEVDgZ005241
	for <qemu-arm@nongnu.org>; Thu, 22 Feb 2018 09:31:18 -0500
Received: by mail-qt0-f197.google.com with SMTP id n25so4118200qtl.13
	for <qemu-arm@nongnu.org>; Thu, 22 Feb 2018 06:31:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=EdYOayBBQ76GTOeJt3UE0sJgg8uOazxisLlzRRz5Bts=;
	b=eMYaUhe0EXCq/VNXM4Woi+njHO3K+8ablyd7Ru/GFEvkETLiELyezbwiUmXMvYqb5w
	C+q/cBgtPPwqDo7p51jlomGR/A4jvJaAjrNA1bGgYx+8/n6txQBp9NGvIvJ8C88E1bFF
	cGBG+AC6PJrY90/0CittmwLATEqMVMpRskrnv5sIjooHR3X7dD7xjmqVRpMDAS+CXuHa
	oZHyI/se1G6wAdNNXRi9EGS54gg77nvOXn1+VRqO28I+fA9V9e8TEouUzB9O/J5KMVkv
	ZuXAPGz3QEFV9NUMFxghhO31g6X2H9jgxZyyvF0abKeBcAI5F/0NkgVtewbeRuyz9CF1
	GiTw==
X-Gm-Message-State: APf1xPBGd8XtE7gBoApzwmnlOKGHemzvzcmvEOzxVaEo4QO9ZJxw+r4Q
	J4gRU2mXR9+8+mtP83X+A+BW1OTZMAby/JB76IsOIsC/8vaKF197h0HnPVSHDk878zgfA3K8whb
	bOZe+6yZXb5Dqlw/CiqZR0IE39Pvlc+mikEzwicc=
X-Received: by 10.55.118.6 with SMTP id r6mr11504723qkc.211.1519309872858;
	Thu, 22 Feb 2018 06:31:12 -0800 (PST)
X-Received: by 10.55.118.6 with SMTP id r6mr11504702qkc.211.1519309872606;
	Thu, 22 Feb 2018 06:31:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.39.200 with HTTP; Thu, 22 Feb 2018 06:31:11 -0800 (PST)
In-Reply-To: <CAFEAcA9En65ctWd6RigQmBz+ECV_TF-WOG9DGWWNLjFDhcs7Ww@mail.gmail.com>
References: <CAFmp02z8NnRq6eSCDa2GYJDXE2-cK6+yS1SKHAbiBDhKV_F2yg@mail.gmail.com>
	<CAFEAcA8fnqL9tKa4tVPDoWTKYsOVKhxZ04c39fvgKNgQ-F+ESg@mail.gmail.com>
	<CAFmp02xLicV+dSFhJjYX8djQMGvVaYtih6hB9HAd4HqnA2=VfQ@mail.gmail.com>
	<CAFEAcA9q=u-wF96WW3oJ=1PDuA7bAn_k-YiGRf2gn8Appj8mBw@mail.gmail.com>
	<CAFmp02w8XoiRket_sAGziU3bDX3w+NWVwvBkbT0XE_xrbG-TVg@mail.gmail.com>
	<CAFEAcA9xv06hquekGd-6+MNn_U1FYan11ihccy03U0cuzx+c2g@mail.gmail.com>
	<CAFmp02y=n4RQQKvd1NEeDjX5OoX4sao-bULfSO_3iSHksEnpzg@mail.gmail.com>
	<CAFEAcA9En65ctWd6RigQmBz+ECV_TF-WOG9DGWWNLjFDhcs7Ww@mail.gmail.com>
From: Rd Cheung <rdzhang@vt.edu>
Date: Thu, 22 Feb 2018 09:31:11 -0500
Message-ID: <CAFmp02x0-RbgVyPbPeGpWWnMnfK-ZJ-BhX=cPv3A4PTHs=Jp=g@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="94eb2c06273842ba580565cde53b"
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
X-TUID: TCh6ETwnGer0

--94eb2c06273842ba580565cde53b
Content-Type: text/plain; charset="UTF-8"

 >  Is the device also clearing the interrupt status by calling
>  qemu_set_irq() with a level of 0 (this should happen when your
>  guest's interrupt handler does whatever it needs to do to the
>  device to clear the interrupt) ? If the device is still asserting
>  the interrupt when the ISR returns, the M profile CPU architecture
>  requires that it is automatically made pending again (so it will
>  likely be taken immediately). This is documented in the ARMv7M
>  Architecture Reference Manual (DDI0403E.b) in section B3.4.1
>  "NVIC operation". QEMU implements this in the armv7m_nvic_complete_irq()
>  function.

Yes, it turns out the device does not clear the interrupt line when the
guest code tells it to. When it is fixed, this issue is solved! I can now
move on to solving other issues.

>  I think you're seeing the correct CPU behaviour here, and the
>  problem is that the device isn't deasserting the interrupt line.
>  Either the device code is wrong, or the guest code is wrong and
>  not doing what it should to tell the device to stop asserting the
>  interrupt line.

Yes, you are absolutely right. The interrupt line is not cleared, so I
am seeing pending there.

Thank you for your help and patience, I really appreciate it!

Cheers,
Ruide Zhang


On Thu, Feb 22, 2018 at 8:42 AM, Peter Maydell <peter.maydell@linaro.org>
wrote:

> On 22 February 2018 at 13:19, Rd Cheung <rdzhang@vt.edu> wrote:
> >> What device is the interrupt handler for? Sometimes you can get
> >> this behaviour in QEMU for timer interrupts if the guest code
> >> programs the timer for a fast interrupt rate that is faster
> >> than QEMU's emulation speed can handle.
> >
> > The interrupt handler is for a real time clock device and the interrupt
> > number is 5. I trim the gptm code for stellaris because the firmware
> > image only need real time clock for now. I set up a  qemu_log_mask
> > right before the device use qemu_set_irq to raise an interrupt. And
> > from the log, the qemu_set_irq is triggered only once. I guess fast
> > interrupt rate would not affect in this case, since it is not
> > continuously triggering an interrupt.
>
> Is the device also clearing the interrupt status by calling
> qemu_set_irq() with a level of 0 (this should happen when your
> guest's interrupt handler does whatever it needs to do to the
> device to clear the interrupt) ? If the device is still asserting
> the interrupt when the ISR returns, the M profile CPU architecture
> requires that it is automatically made pending again (so it will
> likely be taken immediately). This is documented in the ARMv7M
> Architecture Reference Manual (DDI0403E.b) in section B3.4.1
> "NVIC operation". QEMU implements this in the armv7m_nvic_complete_irq()
> function.
>
> > And from the log in previous email, I assume the interrupt has been
> > cleared during exit, because the IABR (interrupt active bit register)
> > is cleared after exit. I am confused about why ISPR (interrupt set
> > pending register) is set after exception exit. The proper behavior shall
> > not include this.
>
> I think you're seeing the correct CPU behaviour here, and the
> problem is that the device isn't deasserting the interrupt line.
> Either the device code is wrong, or the guest code is wrong and
> not doing what it should to tell the device to stop asserting the
> interrupt line.
>
> thanks
> -- PMM
>

--94eb2c06273842ba580565cde53b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">

<span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:1=
2.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:nor=
mal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;=
text-transform:none;white-space:normal;word-spacing:0px;background-color:rg=
b(255,255,255);text-decoration-style:initial;text-decoration-color:initial;=
float:none;display:inline">&gt;=C2=A0 Is the device also clearing the inter=
rupt status by calling</span><br style=3D"color:rgb(34,34,34);font-family:a=
rial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:n=
ormal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-a=
lign:start;text-indent:0px;text-transform:none;white-space:normal;word-spac=
ing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;tex=
t-decoration-color:initial"><span style=3D"color:rgb(34,34,34);font-family:=
arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:=
normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-=
align:start;text-indent:0px;text-transform:none;white-space:normal;word-spa=
cing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;te=
xt-decoration-color:initial;float:none;display:inline">

<span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:1=
2.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:nor=
mal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;=
text-transform:none;white-space:normal;word-spacing:0px;background-color:rg=
b(255,255,255);text-decoration-style:initial;text-decoration-color:initial;=
float:none;display:inline">&gt;<span>=C2=A0</span></span>

qemu_set_irq() with a level of 0 (this should happen when your</span><br st=
yle=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;fo=
nt-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font=
-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tra=
nsform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,25=
5,255);text-decoration-style:initial;text-decoration-color:initial"><span s=
tyle=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;f=
ont-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;fon=
t-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tr=
ansform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,2=
55,255);text-decoration-style:initial;text-decoration-color:initial;float:n=
one;display:inline">

<span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:1=
2.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:nor=
mal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;=
text-transform:none;white-space:normal;word-spacing:0px;background-color:rg=
b(255,255,255);text-decoration-style:initial;text-decoration-color:initial;=
float:none;display:inline">&gt;<span>=C2=A0</span></span>

guest&#39;s interrupt handler does whatever it needs to do to the</span><br=
 style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px=
;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;f=
ont-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-=
transform:none;white-space:normal;word-spacing:0px;background-color:rgb(255=
,255,255);text-decoration-style:initial;text-decoration-color:initial"><spa=
n style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8p=
x;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;=
font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text=
-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(25=
5,255,255);text-decoration-style:initial;text-decoration-color:initial;floa=
t:none;display:inline">

<span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:1=
2.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:nor=
mal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;=
text-transform:none;white-space:normal;word-spacing:0px;background-color:rg=
b(255,255,255);text-decoration-style:initial;text-decoration-color:initial;=
float:none;display:inline">&gt;<span>=C2=A0</span></span>

device to clear the interrupt) ? If the device is still asserting</span><br=
 style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px=
;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;f=
ont-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-=
transform:none;white-space:normal;word-spacing:0px;background-color:rgb(255=
,255,255);text-decoration-style:initial;text-decoration-color:initial"><spa=
n style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8p=
x;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;=
font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text=
-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(25=
5,255,255);text-decoration-style:initial;text-decoration-color:initial;floa=
t:none;display:inline">

<span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:1=
2.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:nor=
mal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;=
text-transform:none;white-space:normal;word-spacing:0px;background-color:rg=
b(255,255,255);text-decoration-style:initial;text-decoration-color:initial;=
float:none;display:inline">&gt;<span>=C2=A0</span></span>

the interrupt when the ISR returns, the M profile CPU architecture</span><b=
r style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8p=
x;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;=
font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text=
-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(25=
5,255,255);text-decoration-style:initial;text-decoration-color:initial"><sp=
an style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8=
px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal=
;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;tex=
t-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(2=
55,255,255);text-decoration-style:initial;text-decoration-color:initial;flo=
at:none;display:inline">

<span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:1=
2.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:nor=
mal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;=
text-transform:none;white-space:normal;word-spacing:0px;background-color:rg=
b(255,255,255);text-decoration-style:initial;text-decoration-color:initial;=
float:none;display:inline">&gt;<span>=C2=A0</span></span>

requires that it is automatically made pending again (so it will</span><br =
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
:none;display:inline"><span style=3D"color:rgb(34,34,34);font-family:arial,=
sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal=
;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:=
start;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0=
px;background-color:rgb(255,255,255);text-decoration-style:initial;text-dec=
oration-color:initial;float:none;display:inline"><span>

<span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:1=
2.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:nor=
mal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;=
text-transform:none;white-space:normal;word-spacing:0px;background-color:rg=
b(255,255,255);text-decoration-style:initial;text-decoration-color:initial;=
float:none;display:inline">&gt;<span>=C2=A0</span></span>
l</span></span>ikely be taken immediately). This is documented in the ARMv7=
M</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-=
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

<span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:1=
2.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:nor=
mal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;=
text-transform:none;white-space:normal;word-spacing:0px;background-color:rg=
b(255,255,255);text-decoration-style:initial;text-decoration-color:initial;=
float:none;display:inline">&gt;<span>=C2=A0</span></span>

Architecture Reference Manual (DDI0403E.b) in section B3.4.1</span><br styl=
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

<span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:1=
2.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:nor=
mal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;=
text-transform:none;white-space:normal;word-spacing:0px;background-color:rg=
b(255,255,255);text-decoration-style:initial;text-decoration-color:initial;=
float:none;display:inline">&gt;<span>=C2=A0</span></span>

&quot;NVIC operation&quot;. QEMU implements this in the armv7m_nvic_complet=
e_irq()</span><br style=3D"color:rgb(34,34,34);font-family:arial,sans-serif=
;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-vari=
ant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text=
-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgro=
und-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-co=
lor:initial"><span style=3D"color:rgb(34,34,34);font-family:arial,sans-seri=
f;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-var=
iant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;tex=
t-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgr=
ound-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-c=
olor:initial;float:none;display:inline">

<span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:1=
2.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:nor=
mal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;=
text-transform:none;white-space:normal;word-spacing:0px;background-color:rg=
b(255,255,255);text-decoration-style:initial;text-decoration-color:initial;=
float:none;display:inline">&gt;<span>=C2=A0</span></span>

function.</span>

<br><div><br></div><div>Yes, it turns out the device does not clear the int=
errupt line when the</div><div>guest code tells it to. When it is fixed, th=
is issue is solved! I can now</div><div>move on to solving other issues.</d=
iv><div><br></div><div>

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
float:none;display:inline">&gt;<span>=C2=A0</span></span>

I think you&#39;re seeing the correct CPU behaviour here, and the</span><br=
 style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px=
;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;f=
ont-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-=
transform:none;white-space:normal;word-spacing:0px;background-color:rgb(255=
,255,255);text-decoration-style:initial;text-decoration-color:initial"><spa=
n style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8p=
x;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;=
font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text=
-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(25=
5,255,255);text-decoration-style:initial;text-decoration-color:initial;floa=
t:none;display:inline">

<span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:1=
2.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:nor=
mal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;=
text-transform:none;white-space:normal;word-spacing:0px;background-color:rg=
b(255,255,255);text-decoration-style:initial;text-decoration-color:initial;=
float:none;display:inline">&gt;<span>=C2=A0</span></span>

problem is that the device isn&#39;t deasserting the interrupt line.</span>=
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

<span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:1=
2.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:nor=
mal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;=
text-transform:none;white-space:normal;word-spacing:0px;background-color:rg=
b(255,255,255);text-decoration-style:initial;text-decoration-color:initial;=
float:none;display:inline">&gt;<span>=C2=A0</span></span>

Either the device code is wrong, or the guest code is wrong and</span><br s=
tyle=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;f=
ont-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;fon=
t-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tr=
ansform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,2=
55,255);text-decoration-style:initial;text-decoration-color:initial"><span =
style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;=
font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;fo=
nt-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-t=
ransform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,=
255,255);text-decoration-style:initial;text-decoration-color:initial;float:=
none;display:inline">

<span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:1=
2.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:nor=
mal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;=
text-transform:none;white-space:normal;word-spacing:0px;background-color:rg=
b(255,255,255);text-decoration-style:initial;text-decoration-color:initial;=
float:none;display:inline">&gt;<span>=C2=A0</span></span>

not doing what it should to tell the device to stop asserting the</span><br=
 style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px=
;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;f=
ont-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-=
transform:none;white-space:normal;word-spacing:0px;background-color:rgb(255=
,255,255);text-decoration-style:initial;text-decoration-color:initial"><spa=
n style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8p=
x;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;=
font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text=
-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(25=
5,255,255);text-decoration-style:initial;text-decoration-color:initial;floa=
t:none;display:inline">

<span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:1=
2.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:nor=
mal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;=
text-transform:none;white-space:normal;word-spacing:0px;background-color:rg=
b(255,255,255);text-decoration-style:initial;text-decoration-color:initial;=
float:none;display:inline">&gt;<span>=C2=A0</span></span>

interrupt line.</span><br style=3D"color:rgb(34,34,34);font-family:arial,sa=
ns-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;f=
ont-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:st=
art;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px=
;background-color:rgb(255,255,255);text-decoration-style:initial;text-decor=
ation-color:initial">

<br></div><div>Yes, you are absolutely right. The interrupt line is not cle=
ared, so I=C2=A0</div><div>am seeing pending there.</div><div><br></div><di=
v>Thank you for your help and patience, I really appreciate it!</div><div><=
br></div><div>Cheers,</div><div>Ruide Zhang</div><div><br></div></div><div =
class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Thu, Feb 22, 2018 a=
t 8:42 AM, Peter Maydell <span dir=3D"ltr">&lt;<a href=3D"mailto:peter.mayd=
ell@linaro.org" target=3D"_blank">peter.maydell@linaro.org</a>&gt;</span> w=
rote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On 22 February 201=
8 at 13:19, Rd Cheung &lt;<a href=3D"mailto:rdzhang@vt.edu">rdzhang@vt.edu<=
/a>&gt; wrote:<br>
&gt;&gt; What device is the interrupt handler for? Sometimes you can get<br=
>
&gt;&gt; this behaviour in QEMU for timer interrupts if the guest code<br>
&gt;&gt; programs the timer for a fast interrupt rate that is faster<br>
&gt;&gt; than QEMU&#39;s emulation speed can handle.<br>
&gt;<br>
&gt; The interrupt handler is for a real time clock device and the interrup=
t<br>
&gt; number is 5. I trim the gptm code for stellaris because the firmware<b=
r>
&gt; image only need real time clock for now. I set up a=C2=A0 qemu_log_mas=
k<br>
&gt; right before the device use qemu_set_irq to raise an interrupt. And<br=
>
&gt; from the log, the qemu_set_irq is triggered only once. I guess fast<br=
>
&gt; interrupt rate would not affect in this case, since it is not<br>
&gt; continuously triggering an interrupt.<br>
<br>
</span>Is the device also clearing the interrupt status by calling<br>
qemu_set_irq() with a level of 0 (this should happen when your<br>
guest&#39;s interrupt handler does whatever it needs to do to the<br>
device to clear the interrupt) ? If the device is still asserting<br>
the interrupt when the ISR returns, the M profile CPU architecture<br>
requires that it is automatically made pending again (so it will<br>
likely be taken immediately). This is documented in the ARMv7M<br>
Architecture Reference Manual (DDI0403E.b) in section B3.4.1<br>
&quot;NVIC operation&quot;. QEMU implements this in the armv7m_nvic_complet=
e_irq()<br>
function.<br>
<span class=3D""><br>
&gt; And from the log in previous email, I assume the interrupt has been<br=
>
&gt; cleared during exit, because the IABR (interrupt active bit register)<=
br>
&gt; is cleared after exit. I am confused about why ISPR (interrupt set<br>
&gt; pending register) is set after exception exit. The proper behavior sha=
ll<br>
&gt; not include this.<br>
<br>
</span>I think you&#39;re seeing the correct CPU behaviour here, and the<br=
>
problem is that the device isn&#39;t deasserting the interrupt line.<br>
Either the device code is wrong, or the guest code is wrong and<br>
not doing what it should to tell the device to stop asserting the<br>
interrupt line.<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div><br></div>

--94eb2c06273842ba580565cde53b--
