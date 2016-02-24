Received: by 10.25.208.211 with SMTP id h202csp2380633lfg;
        Wed, 24 Feb 2016 09:48:56 -0800 (PST)
X-Received: by 10.140.202.212 with SMTP id x203mr53968318qha.19.1456336135995;
        Wed, 24 Feb 2016 09:48:55 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 68si3374460qkv.24.2016.02.24.09.48.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 24 Feb 2016 09:48:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=pass header.i=@linaro.org
Received: from localhost ([::1]:37411 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aYdYV-0008Qt-HQ
	for alex.bennee@linaro.org; Wed, 24 Feb 2016 12:48:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39511)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aYdYT-0008Qb-F6
	for qemu-arm@nongnu.org; Wed, 24 Feb 2016 12:48:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aYdYS-0006HG-AA
	for qemu-arm@nongnu.org; Wed, 24 Feb 2016 12:48:53 -0500
Received: from mail-vk0-x22a.google.com ([2607:f8b0:400c:c05::22a]:33219)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1aYdYS-0006H5-6R
	for qemu-arm@nongnu.org; Wed, 24 Feb 2016 12:48:52 -0500
Received: by mail-vk0-x22a.google.com with SMTP id k196so24324547vka.0
	for <qemu-arm@nongnu.org>; Wed, 24 Feb 2016 09:48:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	bh=V7o+ni9GASNz2fyoFKhY4t+WTkaArXh7fgiJoI/vdYY=;
	b=BEZvnS5COqEOOkTrPVfuXg/SvN7DPY1ZdHRKZiSY9R5TH+JqmrnUIrjZnDU83+3o74
	+4pxRYldYQnNZDXKJ9m/CztIXniQrQMMRFY0kfxzBjfb0ahRKzg7yCVCdf/r73O/KwGw
	cp3kQ+LJfIvZTt/SnM4bEiApaLL7zFJQjdoMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=V7o+ni9GASNz2fyoFKhY4t+WTkaArXh7fgiJoI/vdYY=;
	b=e/AZXrcd8iVbFC7sjzlICrUOc4JOJOcjduymj3vpVSl3AL3ybze8WLFQeP9CxD0HiF
	SWG/ba2/YX9lnZkmyuV2u8fr5bMR7+gf6Yjjtq0eqLbIxPzxz74p14944u4JvGTkhjAt
	gNL86QZ1nixZ3lcpVLcqxL/o2pdIMeRiXlFzkweRgtOSx02cCEP9OCPvs0mGD5wHhMLi
	xlKjeTFuKaNhJdJYSgglbHMGc67yPPXOJtnUqPbz7A2Yy8NKHuNYGzgeJnjcQElgVW5E
	XzJiEVVt9wH7FdxBvnkkW36xy7/oIY2b3PieSa68wIzwkwbmeZF7Dtsa4BIazv6y1vjk
	ahNg==
X-Gm-Message-State: AG10YORqNrOOEgOFulpveT6yMOHhswtXImrj5DyW69GSBil90IYD/b25hMtnJbKQn6/MjkQde8cUP74DqXtpmVw/
X-Received: by 10.31.131.199 with SMTP id f190mr34015867vkd.90.1456336131355; 
	Wed, 24 Feb 2016 09:48:51 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Wed, 24 Feb 2016 09:48:31 -0800 (PST)
In-Reply-To: <605392182193B84A99A143D9DA347B52FB8AA7@post>
References: <605392182193B84A99A143D9DA347B52FB8AA7@post>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 24 Feb 2016 17:48:31 +0000
Message-ID: <CAFEAcA9xvDiHAc6Tu-PLbjd=RruX1c+vpfZg+ZvtH5t3DSyUOw@mail.gmail.com>
To: Mats Malmberg <mats.malmberg@tritech.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22a
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>
Subject: Re: [Qemu-arm] help on how to emulate rasbperry pi 2
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
X-TUID: UkOYPiizOJyL

On 24 February 2016 at 15:40, Mats Malmberg <mats.malmberg@tritech.se> wrot=
e:
>
> Hello all!
>
> TL;DR : Is the raspi2 machine ready to use? If yes, how do I use it with
> ordinary rpi distros? If not, what is the best way to emulate raspberry
> pi 2 via Qemu?

Hi; I've cc'd the main qemu-devel list and Andrew Baumann who contributed
the rpi2 support. I know there are still some missing pieces to be
added later but I forget the details.

> Host 'uname -a' output:
> Linux user-Precision-M4700 3.19.0-49-generic #55~14.04.1-Ubuntu SMP Fri J=
an 22 11:24:31 UTC 2016 x86_64 x86_64 x86_64 GNU/Linux
>
> Qemu version (via apt-get) 2.5.50
>
>
>
> I have been trying lately to get an emulation going with the raspi2 machi=
ne. I admit that this is my first encounter with trying to use qemu, so per=
haps some of my attempts have been naive in their approach. Still, I've spe=
nt a lot of time googling guides, qemu user documentation, blog posts, git =
repositories etc, but with no success. Now I'm all out of ideas...
>
> I've tried more ways than suitable to describe here, but in short I typic=
ally:
> 1. take a official linux distro for raspberry pi (alpine, raspbian-jessie=
, Hypriot etc) (all of them verified to work on actual target)
> 2. find a (what I think is) a compatible kernel, either by copying from d=
istro's rootfs boot/ directory or by building a qemu kernel from source (ht=
tps://github.com/dhruvvyas90/qemu-rpi-kernel)
> 3. try and start the emulation with
> qemu-system-arm -kernel kernel_file -M raspi2 -hda linux_image_file.img
>
> at this point, the terminal says "VNC server running on '127.0.0.1;5900'
> 4. using vinagre client i connect to the given address, but it only gives=
 me a compat_monitor0 console
>
> Thus I wonder, is the raspi2 machine a feature that is ready to use?
> If so, where do I fail in my attempts? If not, what is a recommended alte=
rnative?
>
> Any help or pointers on how to be able to emulate my target (raspberry pi=
 2) would be very appreciated.

thanks
-- PMM
