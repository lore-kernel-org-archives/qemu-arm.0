Received: by 10.25.208.194 with SMTP id h185csp190279lfg;
        Thu, 21 Apr 2016 06:43:15 -0700 (PDT)
X-Received: by 10.55.11.4 with SMTP id 4mr20634297qkl.92.1461246195800;
        Thu, 21 Apr 2016 06:43:15 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v202si403006qke.165.2016.04.21.06.43.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Apr 2016 06:43:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41463 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1atEt1-0007hH-BG
	for alex.bennee@linaro.org; Thu, 21 Apr 2016 09:43:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45808)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1atEst-0007TU-Bz
	for qemu-arm@nongnu.org; Thu, 21 Apr 2016 09:43:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1atEss-0001vz-2x
	for qemu-arm@nongnu.org; Thu, 21 Apr 2016 09:43:07 -0400
Received: from mail-vk0-x236.google.com ([2607:f8b0:400c:c05::236]:36128)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1atEsr-0001vk-Ul
	for qemu-arm@nongnu.org; Thu, 21 Apr 2016 09:43:06 -0400
Received: by mail-vk0-x236.google.com with SMTP id n67so86006810vkf.3
	for <qemu-arm@nongnu.org>; Thu, 21 Apr 2016 06:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=K1R71qc5FaSc4iSWTZQbyOBttDgNQzv6ecxbWKIDws0=;
	b=h2ie1w/nXZ0ADrPVuNHEMCAbxoHNRfSTwV9w08p5WZvNn6G7TMoLuLov+Q6NTk9Wb7
	JNQWLEyaNvba04oiJWIY/fyBhA0fnFw+sOuaMAVEiQjgZAmTLgkSs45+g00EvkWeszjN
	UmohDsQnjvVulVqDO5jZPpk5RPzjVDWTjvYA4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=K1R71qc5FaSc4iSWTZQbyOBttDgNQzv6ecxbWKIDws0=;
	b=nEu0qy9x5UI8RBK9Pq3hIav6Zg7t30eB1Csl7zw5YGJeDJpe4cu3XVP0yfjTROp2XB
	BMmw3nIFOKUxmPLxhvWoKWRDOHUOF/7/E6xzKtBZ0kODlHWoecB1uE4qIBLTi57gZEaS
	TpUylfwRemV79HhSmt5R/Rd0qnMeu3m6hqSgbYzYCvv2nXG1m95iFPCf5qBqHGl/Jvo7
	D2v5rrHXvf92fr2bl/yhLSrCk5XyxVYse568huuOLkPGZ3l8TDptLy3gMm3jQ9FhW/oV
	j/3ofM1B8ogaQVNremLlMvJvW5f7ojyWpvCTOclNESgQf+k9kvaWCsGoB3dwZmnSZwfc
	DcOQ==
X-Gm-Message-State: AOPr4FXI7y/zUoKuVVJQyATugkZlDVOlnTm0s31xUzjSSzPOSGYjGA+X/lD+rv3pF8hHsjKFnQH+TiWgHhPVv1dx
X-Received: by 10.31.47.207 with SMTP id v198mr7897858vkv.6.1461246184156;
	Thu, 21 Apr 2016 06:43:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.216.1 with HTTP; Thu, 21 Apr 2016 06:42:44 -0700 (PDT)
In-Reply-To: <A03258E3-4CFE-49F8-8601-1467CD70AC29@sylvaingarrigues.com>
References: <1461235306-3393-1-git-send-email-sylvain@sylvaingarrigues.com>
	<CAFEAcA8mLk+3t+ypR96WPG9yMsvbJ4hmgk1NwfxPLHzk0R=Dwg@mail.gmail.com>
	<DD3027E2-6F96-4D87-B2C5-02E9926AA402@sylvaingarrigues.com>
	<CAFEAcA_nE2Ee_Ky+upz4veasmkyiVSHqyUe2-brtfopJA2-=_g@mail.gmail.com>
	<A03258E3-4CFE-49F8-8601-1467CD70AC29@sylvaingarrigues.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Apr 2016 14:42:44 +0100
Message-ID: <CAFEAcA-yDZKEgZfFmtgn3+j3qCKo_zUJwp40BRERF4rF-tjASw@mail.gmail.com>
To: Sylvain Garrigues <sylvain@sylvaingarrigues.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::236
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
Cc: Markus Armbruster <armbru@redhat.com>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cssXI5e4vXUa

On 21 April 2016 at 14:15, Sylvain Garrigues
<sylvain@sylvaingarrigues.com> wrote:
> Le 21 avr. 2016 =C3=A0 14:54, Peter Maydell <peter.maydell@linaro.org> a =
=C3=A9crit :
>> On 21 April 2016 at 13:50, Sylvain Garrigues
>> <sylvain@sylvaingarrigues.com> wrote:
>>> BTW, would be great to be able to set the load addr on the command
>>> line, wouldn=E2=80=99t it?
>>
>> The booting protocol does not mandate any particular address
>> that the kernel has to be loaded at:
>> https://www.kernel.org/doc/Documentation/arm/Booting
>
> I didn=E2=80=99t know qemu would blindly follow and stick to Linux rules,
> but I understand. I use qemu for baremetal and *BSD emulation, I wish
> it would be easier to change the loading address (and not stick with
> Linux rules like so many people again) :-)

-kernel for a non-ELF file is specifically "boot a Linux kernel according
to the Linux kernel booting protocol". Your other options for booting
are (1) provide -kernel with an ELF file, which we will load at whatever
start address the ELF header specifies, or (2) on boards which have a
flash device, use -bios or -pflash options to specify a flash image to
go in that flash device (I don't think raspi2 has this yet though).
For bare metal testing either of those last two seem like a better
approach; you should also be able to wrap the FreeBSD kernel in an
ELF file to get it to work like that (you'll need to handle SMP
secondary boot yourself though; or just stick a relocation shim
on the front of the FreeBSD kernel).

The reason I'm a bit reluctant to add extra bells and whistles to
the builtin bootloader is that it can quickly get out of hand:
should we support all of Linux, FreeBSD, NetBSD, OpenBSD, Windows,
etc etc etc? At some point the right answer becomes "run the real
guest bootloader like u-boot from flash and let that start the
kernel".

There may be something we can do here to make FreeBSD's life
easier, but we definitely can't do it on the eve of a release.

>> If the FreeBSD kernel can't handle being loaded wherever
>> we put it, that sounds like a FreeBSD bug to me=E2=80=A6
>
> I would not say it is a bug, but an explicit assumption. Indeed, the
> kernel expects it is loaded on a 2 MB page boundary.
> I=E2=80=99m no expert, but I believe it was made so that we could remove =
the
> need for setting the physical address in the building process. The
> virtual to physical offset is computed more simply with that assumption.

> With the patch you committed for me earlier today (b4850e5), the patch
> we are talking about in this email (which is not a feature but a bug
> fix in my opinion)

FWIW, I agree this is a bug fix; it's just that we're hours away from
tagging the final RC for this release cycle, so the bar for "is this
bug important enough to put in now?" is quite high...

thanks
-- PMM
