Received: by 10.25.208.194 with SMTP id h185csp876195lfg;
        Fri, 22 Apr 2016 09:55:27 -0700 (PDT)
X-Received: by 10.55.134.6 with SMTP id i6mr5669645qkd.185.1461344126942;
        Fri, 22 Apr 2016 09:55:26 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r64si3786588qki.177.2016.04.22.09.55.26
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Apr 2016 09:55:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:36267 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ateMY-0004io-HU
	for alex.bennee@linaro.org; Fri, 22 Apr 2016 12:55:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55257)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ateMV-0004fb-K9
	for qemu-arm@nongnu.org; Fri, 22 Apr 2016 12:55:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ateMU-0002bu-Bc
	for qemu-arm@nongnu.org; Fri, 22 Apr 2016 12:55:23 -0400
Received: from mail-ob0-x22e.google.com ([2607:f8b0:4003:c01::22e]:36201)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1ateMU-0002bq-51; Fri, 22 Apr 2016 12:55:22 -0400
Received: by mail-ob0-x22e.google.com with SMTP id j9so51769550obd.3;
	Fri, 22 Apr 2016 09:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-transfer-encoding;
	bh=U6+9+ScdtB2Lb/ficzClhyf3A3KVfe8qzfy95fTxj7A=;
	b=YJ9Su2bffxGNSAFEzMJbsjZR+UeZvqWcW6sTEs9JakQOcessN0kofht7hI5evJHMYu
	0L9o1k7Jlt6Jq9cVKPRaGccug+pruZPyUrxXZWSJEinKGNk+ZyrxYRLNfUYDhoZ/6b3I
	Ol999KCZxLOnUcb270jhz+NyehamU7pY8zrFcEe4F0gxhAMrwU/5A6HwwI5noRFrDWXH
	dhIzm7XK3yKdRT0Dx2PttvV6BTVerP9fU22VqXhQVXaUFXMrepKQaoNPU7uiL9NZkQPL
	Ta2kepZleROzXTocGMSTjl4rh9SViN4he2HwyCQoffCBpA8Vmw62InkCWXF0mUH3QHge
	bWUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-transfer-encoding;
	bh=U6+9+ScdtB2Lb/ficzClhyf3A3KVfe8qzfy95fTxj7A=;
	b=XT4yOg6nl49aoNwH8fd3Qv2W/ClKzcjeNWRsCbLUHxUpJh/4wYb5cooYzcPplbQZEi
	ZfG8JJeZKlw4wIYMCBd2HYwpvmrtE2bu3HFExfw1M8r59fEBt3wDuTIIShJdbW0Ab4Y9
	35JXtZ367Hx8qRl5ik6myRd9b5B+vS4SAaRC+30ie+L6bDImdaudjsUjrUGdD5g6+mhT
	J/Wn4WMMZlQqgwvOXJZtPiirYxdYcpnKCluKTs1qefLqwQcAeQOHxKQNM5XzxqprYSh/
	t6m9EZcdF7OXqi78zTRvvIwuy4FZwKuAhJkdYbjslvkA3KzqR/kvRQsXBZxe8bWuoQO3
	0nrA==
X-Gm-Message-State: AOPr4FXQS3G31pV2V20WV1OR4SjkjElbTSwOsu4MNzTkXoQaGOYne6JTJruf5Q49Wurc2SJK4czZmmUB0qmGBA==
MIME-Version: 1.0
X-Received: by 10.60.14.232 with SMTP id s8mr9210583oec.66.1461344121549; Fri,
	22 Apr 2016 09:55:21 -0700 (PDT)
Received: by 10.157.44.196 with HTTP; Fri, 22 Apr 2016 09:55:21 -0700 (PDT)
In-Reply-To: <BLUPR0301MB2034E26C749A161446AAB1389E6F0@BLUPR0301MB2034.namprd03.prod.outlook.com>
References: <1461235306-3393-1-git-send-email-sylvain@sylvaingarrigues.com>
	<CAFEAcA8mLk+3t+ypR96WPG9yMsvbJ4hmgk1NwfxPLHzk0R=Dwg@mail.gmail.com>
	<DD3027E2-6F96-4D87-B2C5-02E9926AA402@sylvaingarrigues.com>
	<CAFEAcA_nE2Ee_Ky+upz4veasmkyiVSHqyUe2-brtfopJA2-=_g@mail.gmail.com>
	<A03258E3-4CFE-49F8-8601-1467CD70AC29@sylvaingarrigues.com>
	<CAFEAcA-yDZKEgZfFmtgn3+j3qCKo_zUJwp40BRERF4rF-tjASw@mail.gmail.com>
	<DED29353-D9CE-45F5-990F-0A32DB57B4AE@sylvaingarrigues.com>
	<5718FA7F.5030903@wwwdotorg.org>
	<CAPokK=qiaGkd3oZ+r_cLNov4gvAF6Qtv-p6NwxHkY_m4_NrqRg@mail.gmail.com>
	<BLUPR0301MB2034E26C749A161446AAB1389E6F0@BLUPR0301MB2034.namprd03.prod.outlook.com>
Date: Fri, 22 Apr 2016 09:55:21 -0700
Message-ID: <CAPokK=qt-Pxswp_84Uw4hHZVWs+HUfh6tTpkmQzU4HxY=NeFyg@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c01::22e
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
	Stephen Warren <swarren@wwwdotorg.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Sylvain Garrigues <sylvain@sylvaingarrigues.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Q1YiMu1pxUoR

On Fri, Apr 22, 2016 at 4:44 AM, Andrew Baumann
<Andrew.Baumann@microsoft.com> wrote:
> Hi all,
>
>> From: Peter Crosthwaite [mailto:crosthwaitepeter@gmail.com]
>> Sent: Friday, 22 April 2016 09:18
>>
>> On Thu, Apr 21, 2016 at 9:06 AM, Stephen Warren
>> <swarren@wwwdotorg.org> wrote:
>> > On 04/21/2016 08:07 AM, Sylvain Garrigues wrote:
>> >>
>> >> Le 21 avr. 2016 =C3=A0 15:42, Peter Maydell <peter.maydell@linaro.org=
> a
>> >> =C3=A9crit
>> >> :
>> >>>
>> >>>
>> >>> There may be something we can do here to make FreeBSD's life easier,
>> >>> but we definitely can't do it on the eve of a release.
>> >>
>> >>
>> >> I didn=E2=80=99t know it was release day, my timing is not perfect th=
en,
>> >> sorry about that, I didn=E2=80=99t intend to put stress on you guys t=
oday.
>> >> Like you mentioned, the Linux boot protocol doesn=E2=80=99t mandate a=
ny
>> >> loading address, hence the possibility to set it on the command line.
>> >> It would benefit not only to FreeBSD (which is strictly Linux boot
>> >> ABI compliant BTW - that is how I found the qemu bootloader bug and
>> >> fixed it in
>> >> b4850e5) but all other OS.
>> >> On the real hardware Raspberry Pi, there is the kernel_address
>> >> firmware feature which enable to set the kernel load address. Would
>> >> be neat to have it *someday* in qemu for any board if it is not too h=
ard to
>> implement.
>> >
>> >
>> > It would indeed be nice if qemu for the Pi implemented the exact same
>> > bootloader setup as real HW does. That is, loading boot images from
>> > the FAT partition on the SD card, parsing config.txt, etc.
>> >
>> > Ideally as was mentioned earlier this would be done by simply
>> > executing the existing bootloader under emulation, rather than
>> > building all that code into qemu. However, in the Pi case, the
>> > bootloader runs on the VideoCore (a separate non-ARM CPU), so isn't
>> > (and likely won't be since IIUC it isn't fully documented) emulated by
>> > qemu. by the time the ARM CPU runs, everything (kernel, DTB/ATAGS, ARM
>> > boot stub, ...) is already loaded into RAM, the display is already
>> > probed over HDMI and the controller scanning out a dummy image, etc.
>> >
>> > So I think if that were to be supported, it'd have to be coded into
>> > qemu. Is that something that could happen, or would such patches not
>> > fit qemu's model well?
>>
>> I made half a start on this project but had to shelve it.
>>
>> The hard part is the FAT filesystem. The basic approach I started on was=
 to link
>> in the relevant bits of the GNU mtools so QEMU can poke around in a FAT
>> filesystem hosted on a block device. Then just mount the SD card and emu=
late
>> the boot logic of the VideoCore bootloader.
>> This amount of new code should actually be pretty small, as the FS drive=
r is
>> handled by mtools and the SDHCI can be shorted by just having this alter=
nate
>> bootloader go direct to the block device (fish the blockdev out from the=
 SD
>> card).
>
> You got further on this than I did. I considered a couple of options, of =
varying complexity/compatibility:
>
>  0. The status quo: we support -kernel (for Linux images) and -bios (e.g.=
 Windows), but otherwise all the options that can be set in config.txt are =
treated as the defaults. For example, -bios images are always loaded at 0x8=
000. Additionally, framebuffer parameters can be set directly from the comm=
and line (e.g. Windows wants -global bcm2835-fb.pixo=3D0).
>  1. More pi-specific parameters in the line of the framebuffer parameters=
 above, to control things like the image load address, and maybe to enable =
trustzone boot akin to config.txt's kernel-old=3D1.
>  2. Code to parse config.txt and set the parameters above.
>  3. Code to emulate the bootloader entirely, pulling config.txt and all t=
he relevant boot bits out of an SD image (this is what Peter describes abov=
e).
>  4. An ARM-based reimplementation of the bootloader, running under emulat=
ion.

Setting up U-boot to be #4 could work.

>
> I discarded even considering option 3 because I assumed you wouldn't want=
 a FAT implementation linked into qemu.

rPI is not alone here though. Xilinx Zynq does exactly the same thing
with boot code pulling things out of SD card + FAT so you have at
least two precedents justifying the feature.

Regards,
Peter

> And I'm not inclined to add ini-parsing code, so my gut feeling was to go=
 a little further on option 1 and add parameters to the raspi machines (I a=
ssume this is possible?) for basic things like the load address, and rely o=
n users to translate config.txt settings into command-line parameters.
>
> Andrew
