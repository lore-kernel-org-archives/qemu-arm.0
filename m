Received: by 10.25.208.211 with SMTP id h202csp327077lfg;
        Wed, 6 Apr 2016 23:47:38 -0700 (PDT)
X-Received: by 10.140.177.87 with SMTP id x84mr1589952qhx.39.1460011658043;
        Wed, 06 Apr 2016 23:47:38 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y20si4836295qka.117.2016.04.06.23.47.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 06 Apr 2016 23:47:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:47931 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ao3j7-0008Rn-1M
	for alex.bennee@linaro.org; Thu, 07 Apr 2016 02:47:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42136)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dharmikthakkar16@gmail.com>) id 1ao3j4-0008Rh-72
	for qemu-arm@nongnu.org; Thu, 07 Apr 2016 02:47:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dharmikthakkar16@gmail.com>) id 1ao3j3-0006HL-1s
	for qemu-arm@nongnu.org; Thu, 07 Apr 2016 02:47:34 -0400
Received: from mail-vk0-x241.google.com ([2607:f8b0:400c:c05::241]:36827)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dharmikthakkar16@gmail.com>) id 1ao3j2-0006GI-O8
	for qemu-arm@nongnu.org; Thu, 07 Apr 2016 02:47:32 -0400
Received: by mail-vk0-x241.google.com with SMTP id x190so10607246vka.3
	for <qemu-arm@nongnu.org>; Wed, 06 Apr 2016 23:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=QxR9kOe+jJ9txx09MvYlElnM8P+++vHWf+rYbxs4rAI=;
	b=MNmH59VE9HdvSN0kpctuzIymq5b24wqfXQrw7yCmnpbVPy0VIk/Wf+KjPHWrRZJes2
	puqdzu1asRwiGBta+GuaWvLXN3FU/SYPf5kHjc6os6NN9Z5J6zVsZS35DqSAGqRyChrN
	dlXtbc6xjOnUO+N+EpdLHmGk4giMuhCfZ8oBOIW0+7Ida5Ejhnp3UDe1keM2AJrfWvuW
	2rMZzg5Xb5t/ogkL8ysoULi0VNAHsgmobpaVnFH1H9KjDw93tq5iv9bWi3TsEOZbVcfY
	/n8yD0QCsFMdHlAgYKV1MuJZFaLOr9AbH0+2ZjqB4xebjaDvly4lmROwPnUIkBW9YeFP
	qvjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=QxR9kOe+jJ9txx09MvYlElnM8P+++vHWf+rYbxs4rAI=;
	b=OsOmBIh4aU+61JRVX6o3vbzS6blphSJPw5uRWkPA1sOukFoPbYMgfR/y4bu1Q5I1Fd
	/7uu5BliZ4o2OHVnQ3bVTPVt+O2MBV7+/ByS9ZlLsL7iI3VCSZ9xDcORS4/+N2a9zpwJ
	1Xtl7q1oAWG8qtgNsvqc8qEC/RdPxz7IZKV4YKSMqJsy3G+vnALRHnkzunhGPOYS/Tk1
	I40AgWQVVyCJ4GVZ156ptScRnwFqXK1r+/YsZLMuLG1KUsjtXN1EDOe+3n8NfCJiPUkz
	rBcC+5y2M4ET9tVsyl0I712+CSsMLE6l3Hhv4vpsa8BfuBYcbRQFv+r8gUAXWdQXFRVy
	cc0A==
X-Gm-Message-State: AD7BkJJObrhwS9qHO1iBeN8Iaejg5GObDjgHTY25YLG088djm49xnf+4+tkr27eluOzv1/jPMc5dhBB6i755Lg==
MIME-Version: 1.0
X-Received: by 10.176.2.56 with SMTP id 53mr597511uas.101.1460011651378; Wed,
	06 Apr 2016 23:47:31 -0700 (PDT)
Received: by 10.103.13.7 with HTTP; Wed, 6 Apr 2016 23:47:31 -0700 (PDT)
In-Reply-To: <CAFEAcA8A=Q5yYHKWe5VFdV-n67RdSOnLXgcQM3MocfeNxRxwmQ@mail.gmail.com>
References: <CAOw6FiiPvuAx8=+DOptEFcnk4otm7M=eVxNB0VXfTihfQf1KzA@mail.gmail.com>
	<CAFEAcA8A=Q5yYHKWe5VFdV-n67RdSOnLXgcQM3MocfeNxRxwmQ@mail.gmail.com>
Date: Thu, 7 Apr 2016 12:17:31 +0530
Message-ID: <CAOw6FignpsMNGhNA5uQw-C1J2WTYbvAAAR_7kw-4sOoMUDcp-g@mail.gmail.com>
From: dharmik thakkar <dharmikthakkar16@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary=001a113d1986d93548052fdf7318
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::241
Cc: qemu-arm <qemu-arm@nongnu.org>
Subject: Re: [Qemu-arm] Unable to run QEMU with ubuntu ARM image on mac.
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
X-TUID: dPnyRdJikOlo

--001a113d1986d93548052fdf7318
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Peter,
I am trying to run arm based kernel using qemu on mac. I have build the
kernel image using linux 4.4.6 for arm architecture. I am using the below
command but I don't see kernel booting. While building the kernel i used
the defconfig for arm which was versatile_defconfig.

Try 1:

*qemu-img create -f qcow2 linuxarm.qcow2 10G*
*qemu-system-arm -hda linuxarm.qcow2 -kernel vmlinuz-4.4.6 -initrd
initrd.img-4.4.6 -m 1024 -M versatilepb*

A black blank screen appears without displaying anything.

Try 2:


*qemu-img create -f qcow2 linuxarm.qcow2 10G*
*qemu-system-arm -hda linuxarm.qcow2 -kernel vmlinuz-4.4.6 -initrd
initrd.img-4.4.6 -m 1024 -M versatilepb -cdrom 2015-04-06-ubuntu-trusty.zip
-boot d*

A black blank screen appears without displaying anything.

Point out if I am missing something in the process.

Regards
Dharmik

On Mon, Apr 4, 2016 at 7:05 PM, Peter Maydell <peter.maydell@linaro.org>
wrote:

> On 4 April 2016 at 06:30, dharmik thakkar <dharmikthakkar16@gmail.com>
> wrote:
> > I am trying to run ubuntu for arm using qemu. I have tried using
> different
> > images for ubuntu but have ended up with same error =E2=80=98Trying to =
execute
> code
> > outside RAM or ROM at 0x08000000=E2=80=99.
> >
> > Below are the steps I have followed to run ubuntu on qemu -
> >
> >
> > 1. qemu-img create -f qcow2 linuxarm.qcow2 10G.
> >
> > 2. qemu-system-arm -hda linuxarm.qcow2 -cdrom
> > ~/Downloads/2015-04-06-ubuntu-trusty.zip -boot d -m 512 -M virt
>
> This command line does not specify either:
>    (a) a kernel to boot via -kernel
> or (b) a BIOS image to boot via -bios (like UEFI)
>
> So the emulator starts trying to execute instructions starting at
> address zero, which are all NOPs until it reaches the end of the
> emulated flash memory at 0x800000. Then it gives you this error.
>
> You should change your command line one way or the other.
>
> thanks
> -- PMM
>

--001a113d1986d93548052fdf7318
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Peter,<div>I am trying to run arm based kernel using qe=
mu on mac. I have build the kernel image using linux 4.4.6 for arm architec=
ture. I am using the below command but I don&#39;t see kernel booting. Whil=
e building the kernel i used the defconfig for arm which was versatile_defc=
onfig.=C2=A0</div><div><br></div><div>Try 1:=C2=A0</div><div><b>qemu-img cr=
eate -f qcow2 linuxarm.qcow2 10G<br></b></div><div><b>qemu-system-arm -hda =
linuxarm.qcow2 -kernel vmlinuz-4.4.6 -initrd initrd.img-4.4.6 -m 1024 -M ve=
rsatilepb</b><br></div><div><br></div><div>A black blank screen appears wit=
hout displaying anything.</div><div><br></div><div>Try 2:=C2=A0</div><div><=
br></div><div><b>qemu-img create -f qcow2 linuxarm.qcow2 10G<br></b></div><=
div><b>qemu-system-arm -hda linuxarm.qcow2 -kernel vmlinuz-4.4.6 -initrd in=
itrd.img-4.4.6 -m 1024 -M versatilepb -cdrom 2015-04-06-ubuntu-trusty.zip -=
boot d</b><br></div><div><b><br></b></div><div>A black blank screen appears=
 without displaying anything.<b><br></b></div><div><br></div><div>Point out=
 if I am missing something in the process.</div><div><br></div><div>Regards=
</div><div>Dharmik</div></div><div class=3D"gmail_extra"><br><div class=3D"=
gmail_quote">On Mon, Apr 4, 2016 at 7:05 PM, Peter Maydell <span dir=3D"ltr=
">&lt;<a href=3D"mailto:peter.maydell@linaro.org" target=3D"_blank">peter.m=
aydell@linaro.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><=
span class=3D"">On 4 April 2016 at 06:30, dharmik thakkar &lt;<a href=3D"ma=
ilto:dharmikthakkar16@gmail.com">dharmikthakkar16@gmail.com</a>&gt; wrote:<=
br>
&gt; I am trying to run ubuntu for arm using qemu. I have tried using diffe=
rent<br>
&gt; images for ubuntu but have ended up with same error =E2=80=98Trying to=
 execute code<br>
&gt; outside RAM or ROM at 0x08000000=E2=80=99.<br>
&gt;<br>
&gt; Below are the steps I have followed to run ubuntu on qemu -<br>
&gt;<br>
&gt;<br>
&gt; 1. qemu-img create -f qcow2 linuxarm.qcow2 10G.<br>
&gt;<br>
&gt; 2. qemu-system-arm -hda linuxarm.qcow2 -cdrom<br>
&gt; ~/Downloads/2015-04-06-ubuntu-trusty.zip -boot d -m 512 -M virt<br>
<br>
</span>This command line does not specify either:<br>
=C2=A0 =C2=A0(a) a kernel to boot via -kernel<br>
or (b) a BIOS image to boot via -bios (like UEFI)<br>
<br>
So the emulator starts trying to execute instructions starting at<br>
address zero, which are all NOPs until it reaches the end of the<br>
emulated flash memory at 0x800000. Then it gives you this error.<br>
<br>
You should change your command line one way or the other.<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div><br></div>

--001a113d1986d93548052fdf7318--
