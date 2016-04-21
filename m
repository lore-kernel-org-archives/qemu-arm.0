Received: by 10.25.208.194 with SMTP id h185csp270980lfg;
        Thu, 21 Apr 2016 09:06:34 -0700 (PDT)
X-Received: by 10.55.101.82 with SMTP id z79mr695786qkb.105.1461254794408;
        Thu, 21 Apr 2016 09:06:34 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f143si756751qka.5.2016.04.21.09.06.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 21 Apr 2016 09:06:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43759 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1atH7h-0003qI-TS
	for alex.bennee@linaro.org; Thu, 21 Apr 2016 12:06:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56841)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <swarren@wwwdotorg.org>) id 1atH7f-0003mb-0d
	for qemu-arm@nongnu.org; Thu, 21 Apr 2016 12:06:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <swarren@wwwdotorg.org>) id 1atH7b-0007wA-0e
	for qemu-arm@nongnu.org; Thu, 21 Apr 2016 12:06:30 -0400
Received: from avon.wwwdotorg.org ([70.85.31.133]:56402)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <swarren@wwwdotorg.org>)
	id 1atH7a-0007vj-Rh; Thu, 21 Apr 2016 12:06:26 -0400
Received: from [10.20.204.51] (thunderhill.nvidia.com [216.228.112.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by avon.wwwdotorg.org (Postfix) with ESMTPSA id 15E671C0053;
	Thu, 21 Apr 2016 10:06:22 -0600 (MDT)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.99 at avon.wwwdotorg.org
To: Sylvain Garrigues <sylvain@sylvaingarrigues.com>,
	Peter Maydell <peter.maydell@linaro.org>
References: <1461235306-3393-1-git-send-email-sylvain@sylvaingarrigues.com>
	<CAFEAcA8mLk+3t+ypR96WPG9yMsvbJ4hmgk1NwfxPLHzk0R=Dwg@mail.gmail.com>
	<DD3027E2-6F96-4D87-B2C5-02E9926AA402@sylvaingarrigues.com>
	<CAFEAcA_nE2Ee_Ky+upz4veasmkyiVSHqyUe2-brtfopJA2-=_g@mail.gmail.com>
	<A03258E3-4CFE-49F8-8601-1467CD70AC29@sylvaingarrigues.com>
	<CAFEAcA-yDZKEgZfFmtgn3+j3qCKo_zUJwp40BRERF4rF-tjASw@mail.gmail.com>
	<DED29353-D9CE-45F5-990F-0A32DB57B4AE@sylvaingarrigues.com>
From: Stephen Warren <swarren@wwwdotorg.org>
Message-ID: <5718FA7F.5030903@wwwdotorg.org>
Date: Thu, 21 Apr 2016 10:06:23 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <DED29353-D9CE-45F5-990F-0A32DB57B4AE@sylvaingarrigues.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 70.85.31.133
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
X-TUID: JibYUZC805ty

On 04/21/2016 08:07 AM, Sylvain Garrigues wrote:
> Le 21 avr. 2016 =C3=A0 15:42, Peter Maydell <peter.maydell@linaro.org> =
a =C3=A9crit :
>>
>> There may be something we can do here to make FreeBSD's life
>> easier, but we definitely can't do it on the eve of a release.
>
> I didn=E2=80=99t know it was release day, my timing is not perfect then=
, sorry about that, I didn=E2=80=99t intend to put stress on you guys tod=
ay.
> Like you mentioned, the Linux boot protocol doesn=E2=80=99t mandate any=
 loading address, hence the possibility to set it on the command line.
> It would benefit not only to FreeBSD (which is strictly Linux boot ABI =
compliant BTW - that is how I found the qemu bootloader bug and fixed it =
in b4850e5) but all other OS.
> On the real hardware Raspberry Pi, there is the kernel_address firmware=
 feature which enable to set the kernel load address. Would be neat to ha=
ve it *someday* in qemu for any board if it is not too hard to implement.

It would indeed be nice if qemu for the Pi implemented the exact same=20
bootloader setup as real HW does. That is, loading boot images from the=20
FAT partition on the SD card, parsing config.txt, etc.

Ideally as was mentioned earlier this would be done by simply executing=20
the existing bootloader under emulation, rather than building all that=20
code into qemu. However, in the Pi case, the bootloader runs on the=20
VideoCore (a separate non-ARM CPU), so isn't (and likely won't be since=20
IIUC it isn't fully documented) emulated by qemu. by the time the ARM=20
CPU runs, everything (kernel, DTB/ATAGS, ARM boot stub, ...) is already=20
loaded into RAM, the display is already probed over HDMI and the=20
controller scanning out a dummy image, etc.

So I think if that were to be supported, it'd have to be coded into=20
qemu. Is that something that could happen, or would such patches not fit=20
qemu's model well?
