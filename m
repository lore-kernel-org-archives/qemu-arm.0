Received: by 10.25.208.211 with SMTP id h202csp134479lfg;
        Wed, 16 Mar 2016 16:56:58 -0700 (PDT)
X-Received: by 10.140.252.197 with SMTP id x188mr10427189qhc.81.1458172618487;
        Wed, 16 Mar 2016 16:56:58 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n39si5412031qkh.9.2016.03.16.16.56.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 Mar 2016 16:56:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59368 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1agLJC-0000Fg-3V
	for alex.bennee@linaro.org; Wed, 16 Mar 2016 19:56:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34519)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tuxillo@quantumachine.net>) id 1agLIp-0008HI-Nd
	for qemu-devel@nongnu.org; Wed, 16 Mar 2016 19:56:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <tuxillo@quantumachine.net>) id 1agLIo-0000zG-Ev
	for qemu-devel@nongnu.org; Wed, 16 Mar 2016 19:56:35 -0400
Received: from mailrelay.quantumachine.net ([37.59.103.225]:42366)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <tuxillo@quantumachine.net>)
	id 1agLIh-0000uW-UM; Wed, 16 Mar 2016 19:56:28 -0400
Received: from mail.quantumachine.net (217.216.96.133.dyn.user.ono.com
	[217.216.96.133])
	by mailrelay.quantumachine.net (Postfix) with ESMTP id 97468C60573;
	Thu, 17 Mar 2016 00:56:25 +0100 (CET)
Received: by mail.quantumachine.net (Postfix, from userid 1005)
	id 5194E59EDD; Thu, 17 Mar 2016 00:56:25 +0100 (CET)
Received: from sector.int (web.sector.int [192.168.4.12])
	by mail.quantumachine.net (Postfix) with ESMTPSA id 084D059EC7;
	Thu, 17 Mar 2016 00:56:24 +0100 (CET)
	(envelope-from tuxillo@quantumachine.net)
Received: from mini.sector.int (mini.sector.int [192.168.4.169]) by
	www.quantumachine.net (Horde Framework) with HTTP;
	Wed, 16 Mar 2016 23:56:24 +0000
Date: Wed, 16 Mar 2016 23:56:23 +0000
Message-ID: <20160316235624.Horde.Sfrbn81OOiihM82NxnhpZK5@www.quantumachine.net>
From: Antonio Huete =?utf-8?b?Smltw6luZXo=?= <tuxillo@quantumachine.net>
To: Andrew Baumann <Andrew.Baumann@microsoft.com>
References: <20160316223950.Horde.KwhTM79StVPD_tK29LK3XzF@www.quantumachine.net>
	<BLUPR0301MB20345CF84190AF36081E3C579E8A0@BLUPR0301MB2034.namprd03.prod.outlook.com>
	<20160316232331.Horde.17881eG_ZrMF5c2qIT3qgCa@www.quantumachine.net>
	<BLUPR0301MB2034E6D47DF99360913C5AA99E8A0@BLUPR0301MB2034.namprd03.prod.outlook.com>
In-Reply-To: <BLUPR0301MB2034E6D47DF99360913C5AA99E8A0@BLUPR0301MB2034.namprd03.prod.outlook.com>
User-Agent: Horde Application Framework 5
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 37.59.103.225
Cc: qemu-arm <qemu-arm@nongnu.org>, qemu-devel@nongnu.org
Subject: Re: [Qemu-devel] Timer interrupts for -M raspi2
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
X-TUID: lO9lnyndEFOT

Hi Andrew,

Yeah, that's what I think. I believe I must be overlooking something =20
but I just can't find what.

With regards to the ARM Generic timer, I have set the enable bit[0] =20
for CNTP_CTL and also I've set CNTP_TVAL, that's why I think the =20
interrupt is triggered on the real hardware.

I'm hoping anywone here can give me a hint on what I might be doing wrong=
.

In any case thanks a lot for your help and patience :-)

Best regards,
Antonio Huete

Andrew Baumann <Andrew.Baumann@microsoft.com> escribi=C3=B3:

> Hi Antonio,
>
>> From: Antonio Huete Jim=C3=A9nez [mailto:tuxillo@quantumachine.net]
>> Sent: Wednesday, 16 March 2016 4:24 PM
>>
>> Hi Andrew,
>>
>> I thought the timer that was not implemented was the local timer
>> (located at 0x40000034) and that the core timers interrupt control
>> registers starting at 0x40000040 were the per-core timers.
>
> Oh, sorry, you're right; I replied too quickly.
>
> Yes, that should work. Bits 0 and 3 are wired up to what qemu refers =20
> to as GTIMER_PHYS and GTIMER_VIRT respectively. (The other two =20
> timers aren't currently connected; I can't remember if that's =20
> because they weren't modelled by core QEMU when I was implementing =20
> the device model, or just because I wasn't sure how to route them =20
> and never came back to fix it.)
>
> If you are seeing interrupts on real hardware and not on qemu, then =20
> it may be because the board performs some additional setup that you =20
> are relying on. I'm hardly an expert on ARM, but I would imagine you =20
> need to also need to setup the timer's control and count registers =20
> (using mcr/mrc) to get it ticking. The write to 0x40000040 simply =20
> enables the interrupt.
>
>> Can you please point me to the documentation about this ARM per-core
>> timers?
>
> Here's a starting point to some docs (just from a quick search):
> http://infocenter.arm.com/help/index.jsp?topic=3D/com.arm.doc.ddi0438c/=
BGBBIJCB.html
>
> Cheers,
> Andrew
>
>> Andrew Baumann <Andrew.Baumann@microsoft.com> escribi=C3=B3:
>>
>> > Hi Antonio,
>> >
>> >> From: Antonio Huete Jim=C3=A9nez [mailto:tuxillo@quantumachine.net]
>> >> Sent: Wednesday, 16 March 2016 3:40 PM
>> >>
>> >> Hi,
>> >>
>> >> I am experiencing what I think it's an issue with -M raspi2 and
>> >> interrupts in a baremetal application.
>> >>
>> >> According to this document
>> >>
>> (https://www.raspberrypi.org/documentation/hardware/raspberrypi/bcm2
>> >> 836/QA7_rev3.4.pdf), and if I understood it correctly, you can enab=
le
>> timer
>> >> interrupts for core0 by setting bit 0 at 0x40000040 and you can tri=
gger
>> them
>> >> by using the ARM Generic
>> >> Timer.
>> >>
>> >> With this procedure I can reliably trigger that timer interrupt in =
the
>> >> real hardware by setting CNTP_CTL and CNTP_TVAL but on qemu it
>> doesn't
>> >> seem to be triggered.
>> >>
>> >> Can somebody please tell me what I might be doing wrong?
>> >
>> > I don't think you're doing anything wrong; we just don't model this
>> > timer hardware yet (neither Linux nor Windows needs it). If you want
>> > to take a stab at adding it, the relevant hardware emulation is
>> > hw/intc/bcm2836_control.c.
>> >
>> > If you're willing to use different timer sources, then I suggest
>> > looking at the ARM per-core timers. I also have Gregory's emulation
>> > code for the other bcm2835 timers in my private github, and I hope
>> > to submit to upstream qemu after the current freeze, since it is
>> > needed for pi1 Linux support.
>> >
>> > Cheers,
>> > Andrew
>>



