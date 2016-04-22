Received: by 10.25.208.194 with SMTP id h185csp593369lfg;
        Fri, 22 Apr 2016 00:17:55 -0700 (PDT)
X-Received: by 10.55.77.202 with SMTP id a193mr801642qkb.48.1461309474982;
        Fri, 22 Apr 2016 00:17:54 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m134si3017112qhb.91.2016.04.22.00.17.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Apr 2016 00:17:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:55961 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1atVLe-0004El-Ey
	for alex.bennee@linaro.org; Fri, 22 Apr 2016 03:17:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55324)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1atVLb-00044H-1P
	for qemu-arm@nongnu.org; Fri, 22 Apr 2016 03:17:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1atVLZ-0005BH-UG
	for qemu-arm@nongnu.org; Fri, 22 Apr 2016 03:17:50 -0400
Received: from mail-ob0-x232.google.com ([2607:f8b0:4003:c01::232]:33429)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1atVLZ-0005BD-OA; Fri, 22 Apr 2016 03:17:49 -0400
Received: by mail-ob0-x232.google.com with SMTP id tz8so44734378obc.0;
	Fri, 22 Apr 2016 00:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-transfer-encoding;
	bh=D9W5/0OBOQ4BGX4kXq6UH9f4LGssvgyR1PnLxKetlo8=;
	b=DZvATcahiJuyMkCFb+fzIkTuUHBV8ez8P2fkqg/g/JgsKDQyItYErHB8k2MwWnlout
	RMNQqIXiwnbAcxV0j59p44R6dijI7TAMAS6mJWe+/juVoH6kHjEbbTGgr0LERHFBl9Fb
	mQl3g5vC4tir9O3LTR8RB3PF18usttam1zN3LM7PGBwFZHaKAc35XI2VNCGrcGF2cIYv
	d4wiyTYYaEeza9zT/4CJsJfmqDtVOlt462xk6NvVc9uRLXiCdvd6JllDZ/hZVDrDoJgk
	h36Qww6zW3wN2Ffx04oZGE2HkEd6lMlGxJaQq93LgCv1q7VvW6w/Zt8aWgwO2hSbx6jl
	aiZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-transfer-encoding;
	bh=D9W5/0OBOQ4BGX4kXq6UH9f4LGssvgyR1PnLxKetlo8=;
	b=jP8BdxTdizpBySuY1KIDz+kb7/fYuDE/iR6nsJhja1gJcz/NyVW4EtzG5ifmfV0ap6
	DgWI9fGxFkpzx5vXW0dhlHQY53SWbym1AMHCdkcEslKzyP7tcMXC1K1d46e9N2AdI3Dg
	rl4h568yD4biv28DLnxdCXKPzWwXY9C8SZmUjuUQmA/u7Jsuzi+Gusc3CfFRBwDaOiey
	j25w+RidDrBtsWioGn4kifr2zCXuCuTbBkEX2cBKGfCtKIwxFB6vhahuMJXVVCybSOE5
	OjV2G6pZ2ZMp4NIx/PJXON0TUsgFFAkLnU1fgzLrFV3dRHc6rYjdH+0A+D1e+3rUlsBa
	hw6A==
X-Gm-Message-State: AOPr4FXJUkX7pUT3OXe/wjwjHoRRXt8alwWKdOlV8zjee8SUIpXY9OJTHUlJ+Vg+Zo1V/7+IkDUBh7JgZyHJWg==
MIME-Version: 1.0
X-Received: by 10.182.48.37 with SMTP id i5mr8389183obn.55.1461309469094; Fri,
	22 Apr 2016 00:17:49 -0700 (PDT)
Received: by 10.157.44.196 with HTTP; Fri, 22 Apr 2016 00:17:49 -0700 (PDT)
In-Reply-To: <5718FA7F.5030903@wwwdotorg.org>
References: <1461235306-3393-1-git-send-email-sylvain@sylvaingarrigues.com>
	<CAFEAcA8mLk+3t+ypR96WPG9yMsvbJ4hmgk1NwfxPLHzk0R=Dwg@mail.gmail.com>
	<DD3027E2-6F96-4D87-B2C5-02E9926AA402@sylvaingarrigues.com>
	<CAFEAcA_nE2Ee_Ky+upz4veasmkyiVSHqyUe2-brtfopJA2-=_g@mail.gmail.com>
	<A03258E3-4CFE-49F8-8601-1467CD70AC29@sylvaingarrigues.com>
	<CAFEAcA-yDZKEgZfFmtgn3+j3qCKo_zUJwp40BRERF4rF-tjASw@mail.gmail.com>
	<DED29353-D9CE-45F5-990F-0A32DB57B4AE@sylvaingarrigues.com>
	<5718FA7F.5030903@wwwdotorg.org>
Date: Fri, 22 Apr 2016 00:17:49 -0700
Message-ID: <CAPokK=qiaGkd3oZ+r_cLNov4gvAF6Qtv-p6NwxHkY_m4_NrqRg@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Stephen Warren <swarren@wwwdotorg.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c01::232
Subject: Re: [Qemu-arm] [PATCH] bcm2835_property: use cached values when
 querying framebuffer
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Markus Armbruster <armbru@redhat.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Sylvain Garrigues <sylvain@sylvaingarrigues.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Vay2uvRGiKQ3

On Thu, Apr 21, 2016 at 9:06 AM, Stephen Warren <swarren@wwwdotorg.org> wro=
te:
> On 04/21/2016 08:07 AM, Sylvain Garrigues wrote:
>>
>> Le 21 avr. 2016 =C3=A0 15:42, Peter Maydell <peter.maydell@linaro.org> a=
 =C3=A9crit
>> :
>>>
>>>
>>> There may be something we can do here to make FreeBSD's life
>>> easier, but we definitely can't do it on the eve of a release.
>>
>>
>> I didn=E2=80=99t know it was release day, my timing is not perfect then,=
 sorry
>> about that, I didn=E2=80=99t intend to put stress on you guys today.
>> Like you mentioned, the Linux boot protocol doesn=E2=80=99t mandate any =
loading
>> address, hence the possibility to set it on the command line.
>> It would benefit not only to FreeBSD (which is strictly Linux boot ABI
>> compliant BTW - that is how I found the qemu bootloader bug and fixed it=
 in
>> b4850e5) but all other OS.
>> On the real hardware Raspberry Pi, there is the kernel_address firmware
>> feature which enable to set the kernel load address. Would be neat to ha=
ve
>> it *someday* in qemu for any board if it is not too hard to implement.
>
>
> It would indeed be nice if qemu for the Pi implemented the exact same
> bootloader setup as real HW does. That is, loading boot images from the F=
AT
> partition on the SD card, parsing config.txt, etc.
>
> Ideally as was mentioned earlier this would be done by simply executing t=
he
> existing bootloader under emulation, rather than building all that code i=
nto
> qemu. However, in the Pi case, the bootloader runs on the VideoCore (a
> separate non-ARM CPU), so isn't (and likely won't be since IIUC it isn't
> fully documented) emulated by qemu. by the time the ARM CPU runs, everyth=
ing
> (kernel, DTB/ATAGS, ARM boot stub, ...) is already loaded into RAM, the
> display is already probed over HDMI and the controller scanning out a dum=
my
> image, etc.
>
> So I think if that were to be supported, it'd have to be coded into qemu.=
 Is
> that something that could happen, or would such patches not fit qemu's mo=
del
> well?

I made half a start on this project but had to shelve it.

The hard part is the FAT filesystem. The basic approach I started on
was to link in the relevant bits of the GNU mtools so QEMU can poke
around in a FAT filesystem hosted on a block device. Then just mount
the SD card and emulate the boot logic of the VideoCore bootloader.
This amount of new code should actually be pretty small, as the FS
driver is handled by mtools and the SDHCI can be shorted by just
having this alternate bootloader go direct to the block device (fish
the blockdev out from the SD card).

Regards,
Peter

>
