Received: by 10.182.158.201 with SMTP id ww9csp1535213obb;
        Wed, 18 Nov 2015 11:36:02 -0800 (PST)
X-Received: by 10.31.16.230 with SMTP id 99mr494885vkq.135.1447875362461;
        Wed, 18 Nov 2015 11:36:02 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u14si567839vkd.188.2015.11.18.11.36.02
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Wed, 18 Nov 2015 11:36:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:37951 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1Zz8WQ-000570-2y
	for alex.bennee@linaro.org; Wed, 18 Nov 2015 14:36:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47488)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1Zz8Vx-0004j4-4M
	for qemu-devel@nongnu.org; Wed, 18 Nov 2015 14:35:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1Zz8Vv-0006Cp-8m
	for qemu-devel@nongnu.org; Wed, 18 Nov 2015 14:35:32 -0500
Received: from mail-wm0-x22d.google.com ([2a00:1450:400c:c09::22d]:36239)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1Zz8Vu-0006Cl-W2; Wed, 18 Nov 2015 14:35:31 -0500
Received: by wmww144 with SMTP id w144so211272271wmw.1;
	Wed, 18 Nov 2015 11:35:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=3YLWOlMW2qOZWpbU7l9SFhF49VZDy2VohDMzzXS4OLY=;
	b=YveD2ie7XuNODyyO9wH1CERlNJrcBnrBaUSCz/rM05lbf6E4SQw7RmV8V10DFoFe3G
	atoBTXHvaqkd8uee9Yz5JnntXnPix98NPypu2SI1u0sI3ZpjBu1Z/9bxJHPEGHyFyvb0
	2fFsiPA50o+swsVbuvyFgh5FHVZzNGv6snyI3EpO2Ju8INJDXoNv1CSLLG2gPvhBdVha
	Oc60AxV18HT31cpm9JXh+DpPAUEjj5sQNLJqWRmFVZCjyn3IBSLEn0YHsPUp8yRpuV4Z
	HAjDYm4sUeDqcUrOTz1sWuVJ0u4vrQe6yA4UuM58Ji7zN40rgCChbTP1Vadehmh8B7Jd
	qSgg==
MIME-Version: 1.0
X-Received: by 10.28.18.9 with SMTP id 9mr10897083wms.96.1447875330381; Wed,
	18 Nov 2015 11:35:30 -0800 (PST)
Received: by 10.28.88.11 with HTTP; Wed, 18 Nov 2015 11:35:30 -0800 (PST)
In-Reply-To: <BLUPR0301MB20346C0A5ADAA0A130BECB989E1C0@BLUPR0301MB2034.namprd03.prod.outlook.com>
References: <BLUPR0301MB20343673123489A408C987859E1E0@BLUPR0301MB2034.namprd03.prod.outlook.com>
	<CAPokK=q3RDOU8-QhYz9xEHEyqb4-Bxu+Xvp0hDxmgUa-AgQb6g@mail.gmail.com>
	<BLUPR0301MB20346C0A5ADAA0A130BECB989E1C0@BLUPR0301MB2034.namprd03.prod.outlook.com>
Date: Wed, 18 Nov 2015 11:35:30 -0800
Message-ID: <CAPokK=pv1CdRojAz5v9xiy=f2WYGOPP1xTCFJJQD6dbqGaYGuA@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c09::22d
Cc: =?UTF-8?Q?Gr=C3=A9gory_ESTRADE?= <gregory.estrade@gmail.com>,
	Stefan Weil <sw@weilnetz.de>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	=?UTF-8?B?SmFuIFBldHJvdcWh?= <jan.petrous@tieto.com>,
	Sai Pavan Boddu <saipava@xilinx.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-devel] RFC: raspberry pi / pi2 / Windows-on-ARM support
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Ng7cU80Fsneq

On Wed, Nov 18, 2015 at 10:16 AM, Andrew Baumann
<Andrew.Baumann@microsoft.com> wrote:
> Hi Peter,
>
> Thanks for your feedback!
>
> From: Peter Crosthwaite [mailto:crosthwaitepeter@gmail.com]
> Sent: Tuesday, 17 November 2015 23:51
>> I haven't looked beyond the diffstat yet, but a top level
>> architectural comment, I only see the one file in hw/arm. We are
>> promoting the split of board and SoC now as two separate objects. Each
>> of the patch series linked above demonstrates this. The BCM SoC would
>> be an object in its own right, then the board instantiates the SoC as
>> a composite device.
>
> I understand the rationale here, but is there much value pursuing this fo=
r the Pi? As far as I know, the Pi1/2 SOCs (bcm2835 and 2836) are one-off d=
esigns used only in the Pi. Moreover, the 2836 is basically a copy of the 2=
835 with the addition of a new block for a multi-core interrupt controller =
and mailboxes, so trying to split those out into two separate SOC definitio=
n files would require either lots of duplication, or a tight coupling betwe=
en the two.

Duplication is not right. You can code share by either having a QOM
inheritance between the two SoCs (the QOM object oriented model allows
this) from a common abstraction, or a QOM property that drives the
needed iffery. Even if the board is thin, I would still do it split,
and several of the in-tree machine models are like this. If anyone
wants to model the lower level stuff like the power supplies or play
with the GPIOs etc there some framework there. If the board ever gets
cloned and modded then the SoC is ready to go.

> Finally, there is basically nothing on the board besides the SoC and RAM =
(just a USB-Ethernet adapter), so the actual board definition files would b=
e almost empty.

USB-Ethernet is non trivial though isn't it? I'm looking at the
schematic and my gut is the lan9152 warrants a board/SoC split.

> As it is, I've already factored out all the common devices within hw/arm/=
raspi.c -- my feeling is that this is a cleaner way to do it for the Pi.
>

You will probably find that the way to do it is covert your board as
it stands to SoC, rebadging rPi as BCM SoC then put a thin rPI board
around it that sets just the RAM initially.

>> It is big. Work of this magnitude is generally better managed as
>> multiple series (each of multiple patches). A general approach with
>> new ARM boards is the first series is the bare minimum needed to get a
>> linux boot over the UART console. This usually means any CPU
>> customisations, timer, UART, intc, SoC and boards, maybe the
>> system/power controllers (if the kernel touches them in boot) and
>> optionally network or emmc. With network you can do an NFS root (this
>> was the only option on Allwinner/cubieboard for quite some time) and
>> with emmc you can do your root=3D/dev/mmcblk0p2 style boot as normal. If
>> you are using existing lan9118, network first might be a clear win,
>> although emmc is more realistic. Can always do both.
>>
>> The you can follow up with the USB, DMA, AUX, ... each independently
>> or as a follow up series'.
>>
>> Any core code and ARM CPU work that is a bugfix or stands in its own
>> right, you should send straight up as a separate work.
>
> Ok, understood. Even following this guidance, the first patch will be big=
 -- Pi has custom interrupt and DMA controllers, and the GPU gets itself in=
volved in the boot process. I think we could probably leave out fb/usb and =
maybe also dma, mphi, vchiq and power, but most of the rest will be needed =
to boot anything.
>
> BTW, I used lan9118 as a kludge for Windows, but it isn't present on a re=
al Pi, and the device definition no longer instantiates it. At present, the=
re is no usable network device.
>

Ok I guess just start with emmc. If that diff to sd.c is for emmc card
support (currently missing), I would start early and send that
straight away.

>> Curious, does rPi kernel support device tree boot? This would be nice
>> for testing with a generic kernel.
>
> I believe it does on recent Raspbian images (I see a number of dtb files =
in Raspbian's boot partition), but I haven't tried to figure out how to use=
 them. In general, we have limitations where the bootloader is concerned. O=
n Pi HW, the boot process is driven by the GPU, which reads a plethora of o=
ptions from config files (config.txt and cmdline.txt) on the boot partition=
. We don't emulate any of that stuff... instead, the previous raspi code di=
d just enough to boot Linux using qemu's Linux loader support, and I figure=
d out how to make UEFI happy on raspi2 so it can boot Windows, but that's a=
bout all.
>
> I will take a look at the patches you referred to, and try to refactor th=
e devices accordingly.
>
> BTW, my main goal here is Windows support (surprise! :), so if anyone els=
e is willing to help out with Linux that would be much appreciated. The ker=
nel currently limps into early userspace before crashing on a SETEND instru=
ction, and is clearly not as happy as it was when the original Pi1 support =
was being actively developed ~2 years ago.
>

Yeh I think Paolo tried to fix that with the ARM BE support. I
reworked that recently but for v7+ ARM, so I didn't have the BE32
support anymore (I had no test cases). That BE work really needs to go
up as you are at least the 4th person to need it.

Regards,
Peter

> Thanks,
> Andrew
