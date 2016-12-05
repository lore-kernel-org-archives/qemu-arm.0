Received: by 10.25.159.131 with SMTP id i125csp1722930lfe;
        Mon, 5 Dec 2016 11:35:17 -0800 (PST)
X-Received: by 10.55.69.68 with SMTP id s65mr50608010qka.314.1480966517354;
        Mon, 05 Dec 2016 11:35:17 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t73si9634991qki.337.2016.12.05.11.35.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Dec 2016 11:35:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@dgtlrift-com.20150623.gappssmtp.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:44048 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cDz2i-0004iZ-NO
	for alex.bennee@linaro.org; Mon, 05 Dec 2016 14:35:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37745)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jhanley@dgtlrift.com>) id 1cDxQR-00010m-GW
	for qemu-arm@nongnu.org; Mon, 05 Dec 2016 12:51:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jhanley@dgtlrift.com>) id 1cDxQQ-0007U9-6y
	for qemu-arm@nongnu.org; Mon, 05 Dec 2016 12:51:39 -0500
Received: from mail-vk0-x243.google.com ([2607:f8b0:400c:c05::243]:35388)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <jhanley@dgtlrift.com>)
	id 1cDxQP-0007U2-Vi
	for qemu-arm@nongnu.org; Mon, 05 Dec 2016 12:51:38 -0500
Received: by mail-vk0-x243.google.com with SMTP id x186so16577445vkd.2
	for <qemu-arm@nongnu.org>; Mon, 05 Dec 2016 09:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=dgtlrift-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=OMmHRDc9HmAQ68PpUNBVyUWMxzcN35Ihs8P+97vLIf0=;
	b=PoCoARkGj9Qy+Sk2bnxuDmIVhYppWENd+DIKHSBuW5hDEHUJW2+rM+gqhXRFQ7vSDD
	ST1HdJWhZcqwxHnxYoz3krOawhHPpl02lLxIH5qFl/oXGvoPX2Zk+j5ngVxIZ1HT4HB7
	BhFzZ0yfmA1kz4qW2j79n2aaY5cu5MOea0DNh/qJX6emJR2L0cdY0SGXMlz/YVmvyJyV
	CQakLMvkJbkV/HxMxHyRU9Z85neVbkbv8THcqjk7avt1629anu14JrSNb7PNItXNKeBa
	NxZVkLdaQg4Yz1Lxem5gUWwzr9nSbBvz3jj6LMzIp85/kLxmPCbJeeHxMsSP9z04vCu2
	lXpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=OMmHRDc9HmAQ68PpUNBVyUWMxzcN35Ihs8P+97vLIf0=;
	b=TBHIvGXtDhMWhsD130Wx6RheGm/Zqu5jooYJ2kxX9DNZiRKAVuZEbSHDpls5xYEEUd
	yGTTmdtl6dcphKHb7vdpTy7Mnk3gygTEUS+Q1EF/94EJZqjv372kDyyEOlWfHBvck6K0
	3U1YYlcZoiL0zC8Ejhkr8ifXNC4XNnQNk1WhQIJzMmF83+LwOJ8swUd5s+AO7CilulRR
	zjYL1i50RdHqsBtvy/o0dxWxzGe4+YnjZ9d6tJ7aQYl0CCpxsLGfjyLkvJXOy3U5J6Hl
	xNv2qlyHleJ6oU8KbwurI2Np8fC88NgU5L9hE+C4nfu5vJTmcR5Gh9Z6BO4SWb4CTozZ
	6mDA==
X-Gm-Message-State: AKaTC02j8v9r7aaJwEXQqKoWhtJ211ll/SpSxOQii5dJBhN0hNCP/4NCZEd3w+AeXr/jhC8gtxSBm1gOF6kezA==
X-Received: by 10.31.7.200 with SMTP id 191mr22934059vkh.132.1480960296911;
	Mon, 05 Dec 2016 09:51:36 -0800 (PST)
MIME-Version: 1.0
Received: by 10.103.129.151 with HTTP; Mon, 5 Dec 2016 09:51:36 -0800 (PST)
In-Reply-To: <1dda2994-dc9d-d8f6-fb42-856f2b992484@redhat.com>
References: <CAF++6AOJ_kiPyeCO3WO84d4UTrV9v=iK8CJx72ERJ5N_AKj64g@mail.gmail.com>
	<1dda2994-dc9d-d8f6-fb42-856f2b992484@redhat.com>
From: James Hanley <jhanley@dgtlrift.com>
Date: Mon, 5 Dec 2016 12:51:36 -0500
Message-ID: <CAF++6APMs+eshFxV=wxV9N9zmyyLtU8Gz0v0CAgCWkOnC88dpg@mail.gmail.com>
To: qemu-arm@nongnu.org
Content-Type: multipart/alternative; boundary=001a1143d3186cf0f80542ecf055
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::243
X-Mailman-Approved-At: Mon, 05 Dec 2016 14:34:36 -0500
Subject: Re: [Qemu-arm] [Qemu-discuss] Custom board with DTS/DTB
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iCgPPMaW9U/2

--001a1143d3186cf0f80542ecf055
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

I'm moving my query to QEMU-Arm since it seems more applicable here.
   1) It seems that the -dtb option is not what I thought it was, but would
something like what I thought was the intent of the option be of value to
QEMU, that is to define the board support package for the system using DTC
to compile and pass into QEMU to define a generic board from the tree,
rather then defining the hardware within the code base of QEMU?  I
understand that there will always be some need for device support and
deginition from within the codebase, but this was more to allow the user to
define hardware board profiles without having to change source code.
   2) Right now, I'm trying to run our embedded application (EmbOS RTOS
with DLib with our application support all targeted for Cortex-M4 MPU) and
it seems like QEMU (at least from variable names) wants to believe that
under boot.c and loader.c that the passed in application (using --kernel
option) is linux.  Is this proper behavior - or is there someway to pass
the statically linked code-flash binary to execute? Our binary is note
Linux, and is running EmbOS an RTOS. Note that this CM4 module executes
from code flash.

Thanks much,
-Jim


On Sat, Nov 19, 2016 at 2:48 AM, Thomas Huth <thuth@redhat.com> wrote:

> On 17.11.2016 23:14, James Hanley wrote:
> > I saw the presentation on =E2=80=9CCustom Hardware Modeling for FPGAs a=
nd
> > Embedded Linux Platforms with QEMU=E2=80=9D via
> > http://free-electrons.com/pub/video/2010/elc/elc2010-
> williams-iglesias-fpga-qemu.ogv
> > and was trying to apply the concepts described against our custom board
> > design, and defining the board using dts.  I haven't been able to reall=
y
> > get far and was looking for some guidance if this is the right directio=
n.
> > The mcu is a cortex-m4 (Atmel)
> > The target firmware is running an RTOS (not Linux)
> >
> > QEMU emulator version 2.7.50 (v2.7.0-1890-g83c83f9-dirty)
> > Copyright (c) 2003-2016 Fabrice Bellard and the QEMU Project developers
> >
> > It's my understanding that the dtb option passes a file that includes
> > details of the machine that qemu can use to map out peripherals for it
> > without having to compile the machine into qemu - is this a
> > misunderstanding?
>
> As far as I know, the -dtb parameter only passes the device tree blob to
> the kernel image. I think QEMU does not look at the contents of that file=
.
> So you've got to instantiate the corresponding devices manually with the
> "-device" parameter of QEMU. Simply run QEMU with "-device ?" for a list
> of supported devices.
> However, I'm not familiar with ARM machines of QEMU, not sure whether
> you can successfully populate a "none" machine that way. So you rather
> might need to modify the source code by copying one of the existing
> boards and adapting it to your needs.
>
> > When I attempt to connect to qemu from gdb the qemu instance segfaults.
>
> That should not happen. Can you get a backtrace to see where this happene=
d?
>
>  Thomas
>
>

--001a1143d3186cf0f80542ecf055
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;m moving my query to QEMU-Arm since it seems more ap=
plicable here.<div>=C2=A0 =C2=A01) It seems that the -dtb option is not wha=
t I thought it was, but would something like what I thought was the intent =
of the option be of value to QEMU, that is to define the board support pack=
age for the system using DTC to compile and pass into QEMU to define a gene=
ric board from the tree, rather then defining the hardware within the code =
base of QEMU?=C2=A0 I understand that there will always be some need for de=
vice support and deginition from within the codebase, but this was more to =
allow the user to define hardware board profiles without having to change s=
ource code.</div><div>=C2=A0 =C2=A02) Right now, I&#39;m trying to run our =
embedded application (EmbOS RTOS with DLib with our application support all=
 targeted for Cortex-M4 MPU) and it seems like QEMU (at least from variable=
 names) wants to believe that under boot.c and loader.c that the passed in =
application (using --kernel option) is linux.=C2=A0 Is this proper behavior=
 - or is there someway to pass the statically linked code-flash binary to e=
xecute? Our binary is note Linux, and is running EmbOS an RTOS. Note that t=
his CM4 module executes from code flash.</div><div><br></div><div>Thanks mu=
ch,</div><div>-Jim</div><div>=C2=A0 =C2=A0</div><div><div class=3D"gmail_ex=
tra"><br><div class=3D"gmail_quote">On Sat, Nov 19, 2016 at 2:48 AM, Thomas=
 Huth <span dir=3D"ltr">&lt;<a href=3D"mailto:thuth@redhat.com" target=3D"_=
blank">thuth@redhat.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">On 17.11.2016 23:14, James Hanley wrote:<br>
&gt; I saw the presentation on =E2=80=9CCustom Hardware Modeling for FPGAs =
and<br>
&gt; Embedded Linux Platforms with QEMU=E2=80=9D via<br>
&gt; <a href=3D"http://free-electrons.com/pub/video/2010/elc/elc2010-willia=
ms-iglesias-fpga-qemu.ogv" rel=3D"noreferrer" target=3D"_blank">http://free=
-electrons.com/pub/<wbr>video/2010/elc/elc2010-<wbr>williams-iglesias-fpga-=
qemu.<wbr>ogv</a><br>
&gt; and was trying to apply the concepts described against our custom boar=
d<br>
&gt; design, and defining the board using dts.=C2=A0 I haven&#39;t been abl=
e to really<br>
&gt; get far and was looking for some guidance if this is the right directi=
on.<br>
&gt; The mcu is a cortex-m4 (Atmel)<br>
&gt; The target firmware is running an RTOS (not Linux)<br>
&gt;<br>
&gt; QEMU emulator version 2.7.50 (v2.7.0-1890-g83c83f9-dirty)<br>
&gt; Copyright (c) 2003-2016 Fabrice Bellard and the QEMU Project developer=
s<br>
&gt;<br>
&gt; It&#39;s my understanding that the dtb option passes a file that inclu=
des<br>
&gt; details of the machine that qemu can use to map out peripherals for it=
<br>
&gt; without having to compile the machine into qemu - is this a<br>
&gt; misunderstanding?<br>
<br>
As far as I know, the -dtb parameter only passes the device tree blob to<br=
>
the kernel image. I think QEMU does not look at the contents of that file.<=
br>
So you&#39;ve got to instantiate the corresponding devices manually with th=
e<br>
&quot;-device&quot; parameter of QEMU. Simply run QEMU with &quot;-device ?=
&quot; for a list<br>
of supported devices.<br>
However, I&#39;m not familiar with ARM machines of QEMU, not sure whether<b=
r>
you can successfully populate a &quot;none&quot; machine that way. So you r=
ather<br>
might need to modify the source code by copying one of the existing<br>
boards and adapting it to your needs.<br>
<br>
&gt; When I attempt to connect to qemu from gdb the qemu instance segfaults=
.<br>
<br>
That should not happen. Can you get a backtrace to see where this happened?=
<br>
<span class=3D"HOEnZb"><font color=3D"#888888"><br>
=C2=A0Thomas<br>
<br>
</font></span></blockquote></div><br></div></div></div>

--001a1143d3186cf0f80542ecf055--
