Received: by 10.25.208.211 with SMTP id h202csp385845lfg;
        Thu, 7 Apr 2016 02:14:16 -0700 (PDT)
X-Received: by 10.140.22.212 with SMTP id 78mr2169237qgn.77.1460020456101;
        Thu, 07 Apr 2016 02:14:16 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m69si5202556qge.48.2016.04.07.02.14.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Apr 2016 02:14:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=pass (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48473 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ao610-0002QB-VT
	for alex.bennee@linaro.org; Thu, 07 Apr 2016 05:14:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44595)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ao60x-0002MA-Fq
	for qemu-arm@nongnu.org; Thu, 07 Apr 2016 05:14:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ao60w-00072K-Hv
	for qemu-arm@nongnu.org; Thu, 07 Apr 2016 05:14:11 -0400
Received: from mail-vk0-x231.google.com ([2607:f8b0:400c:c05::231]:32775)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ao60w-00072G-BE
	for qemu-arm@nongnu.org; Thu, 07 Apr 2016 05:14:10 -0400
Received: by mail-vk0-x231.google.com with SMTP id k1so91215326vkb.0
	for <qemu-arm@nongnu.org>; Thu, 07 Apr 2016 02:14:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Qqnx1tXKbTZOFjZirQ7OBWDEXdbu6rcJTnyXdoqDDtc=;
	b=G0a7TDC1wuC9Nnntl0CC86Wn/Iu6gfzgF+M4IdeX3wzFYv9FeV3DjG2k2A9o9WbQrm
	CJn7skgriEA0onSI1N8CrLy0wSZBy6B3uxPLanq2JnChRnjLp4RK8PwOcpN3LWgM8oXh
	XemcJmlYyyMEkMbTS56DO/S2fPxzUWO3brYOw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Qqnx1tXKbTZOFjZirQ7OBWDEXdbu6rcJTnyXdoqDDtc=;
	b=YMDvGR8K/gXCMzOeqfquwu+8dOgvS9hhncXr6OYF/q4ChogHcCdUWX6DsC6oyXvWXa
	z+dQ5zsoENlMYUSIZxxeaZu42ycCU6Wb7wNMwt3mObQAkhiPKUbO3Qi0xErBGNl2XOva
	if7lGNwTgXOJn8C/xYXTchoB42auhK51OA5frgilHrRpW/aq4Vg62kSTTNFWtXT7zigC
	acwXBs82mTNxY7nY7++J3x33BdkPL902Z2jmG8jNIHawrWNbSC3IMHoycyeir5lAiDq/
	Heo5TopFSq/LXJVsRzePbg/m6AYws9T/7AlahZFoqoRKvdS/1XD0QVzUqeT8Qv1is+d1
	L5XA==
X-Gm-Message-State: AD7BkJJr3clx79+qpRNJpnYwP1ywQwYN1DwexQASQ9kDYnn53dz86IgGw3VZgwYl1C5/vZLDLB7cgP5QxhlRNVpM
X-Received: by 10.31.52.147 with SMTP id b141mr871456vka.82.1460020449607;
	Thu, 07 Apr 2016 02:14:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Thu, 7 Apr 2016 02:13:50 -0700 (PDT)
In-Reply-To: <CAOw6FignpsMNGhNA5uQw-C1J2WTYbvAAAR_7kw-4sOoMUDcp-g@mail.gmail.com>
References: <CAOw6FiiPvuAx8=+DOptEFcnk4otm7M=eVxNB0VXfTihfQf1KzA@mail.gmail.com>
	<CAFEAcA8A=Q5yYHKWe5VFdV-n67RdSOnLXgcQM3MocfeNxRxwmQ@mail.gmail.com>
	<CAOw6FignpsMNGhNA5uQw-C1J2WTYbvAAAR_7kw-4sOoMUDcp-g@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 7 Apr 2016 10:13:50 +0100
Message-ID: <CAFEAcA8G764R2aKM+i23aS73YUhap6XP0pwbS_vg5Q7iY92K2g@mail.gmail.com>
To: dharmik thakkar <dharmikthakkar16@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::231
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
X-TUID: +yjUdzAsW2Jz

On 7 April 2016 at 07:47, dharmik thakkar <dharmikthakkar16@gmail.com> wrote:
> Hi Peter,
> I am trying to run arm based kernel using qemu on mac. I have build the
> kernel image using linux 4.4.6 for arm architecture. I am using the below
> command but I don't see kernel booting. While building the kernel i used the
> defconfig for arm which was versatile_defconfig.
>
> Try 1:
> qemu-img create -f qcow2 linuxarm.qcow2 10G
> qemu-system-arm -hda linuxarm.qcow2 -kernel vmlinuz-4.4.6 -initrd
> initrd.img-4.4.6 -m 1024 -M versatilepb
>
> A black blank screen appears without displaying anything.
>
> Try 2:
>
> qemu-img create -f qcow2 linuxarm.qcow2 10G
> qemu-system-arm -hda linuxarm.qcow2 -kernel vmlinuz-4.4.6 -initrd
> initrd.img-4.4.6 -m 1024 -M versatilepb -cdrom 2015-04-06-ubuntu-trusty.zip
> -boot d

versatilepb can't support more than 256 MB of guest RAM -- trying
to specify more is going to cause problems.

> A black blank screen appears without displaying anything.

Check whether there's anything on the guest serial output (I think
you can get this via the View menu; or use -serial stdio to send
it to the terminal window).

Other than that, "nothing happens on guest boot" usually means
QEMU is emulating OK but the guest kernel has crashed or failed
to init, in much the same way that it can on real hardware.
Enable any earlyprintk/earlycon options, that sometimes lets the
kernel print out an error before stopping.

For Mac hosts, it's also worth checking that the same command
line/image/etc also fail on a Linux host -- occasionally the
Mac port has issues Linux doesn't, because it gets much less use,
development and testing. (I don't think that's the problem here,
but if you have a Linux box it's easy to rule out.)

thanks
-- PMM
