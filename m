Received: by 10.25.0.6 with SMTP id 6csp1771603lfa;
        Tue, 16 May 2017 01:57:33 -0700 (PDT)
X-Received: by 10.200.55.29 with SMTP id o29mr9314839qtb.120.1494925053404;
        Tue, 16 May 2017 01:57:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494925053; cv=none;
        d=google.com; s=arc-20160816;
        b=Us7JCwh3/FMjIoQy/6YkZozqGOQkCAQTrXe2l7O2srww6+jsX6P2mvl2IEEWxPMIve
         wS+K4lnbjXRLFYFSeCiCGblVnsLl9hIGAYc7lGc/mUXzUHWCgSlLuy6GmMTkgOKLylew
         qcRb9EYv++q2Mp4UUDkRdyW4KmP/QKxX91h5+lLtEHcSBylP/9XYpiZUP9uzbJNwr8Nb
         1s/ox0ZveZ/CHpRFomfBuYDkT6QXRNu3PsOECWI4NlP6x61BJbYGAdWIdR0EPc+3YNEm
         0LrcvNKgkxE9cwowwp9HwHRkwEKm3vULY9LGIYA4z8kiRc2QpiRpCvnoo34NDErdkVs3
         5JJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:arc-authentication-results;
        bh=SsnYYfvpBpfFexAn0Ev4G4FJMPfCo6XzESmRTDZsviI=;
        b=BLuAMYKarYEs3JWL2+07oeyjVGUJXu4ZkG1n4FR/O6f4wR4qDEC6055uRSH6TIZupK
         vEiTeqClqEW2YOm3UTMfu3beb+Zk6vsgy79vZAtl2CGdsfp8/cXKy/3d5kZVEuTGquJE
         nbdzn04Gz63u8FPZGTEdUw563fRoFx3tJSB9TxOSVmPGnfK7ZW30+4WA13gKUy/6T1hA
         TcscAtxj/RLEu8f+1qNmxWF9RF4jE8OJMhRmdoWhxfxOHU1/0Y9k8e/IOAMP/x08QTde
         E/71wOruzFedLIBWN8UdmDmhu43SWeGTTpFL8bd2m8ymd/rlz6VH0GBCJ9VVSChidGny
         Mqkw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 31si13024385qtn.87.2017.05.16.01.57.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 May 2017 01:57:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:40532 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dAYIO-0008Ob-SL
	for alex.bennee@linaro.org; Tue, 16 May 2017 04:57:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39196)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gm.ijewski@web.de>) id 1dAYHH-0007qr-HN
	for qemu-devel@nongnu.org; Tue, 16 May 2017 04:56:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gm.ijewski@web.de>) id 1dAYHG-0006tC-9F
	for qemu-devel@nongnu.org; Tue, 16 May 2017 04:56:23 -0400
Received: from mout.web.de ([212.227.15.4]:53240)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <gm.ijewski@web.de>)
	id 1dAYHA-0006mx-SN; Tue, 16 May 2017 04:56:17 -0400
Received: from [192.168.2.125] ([217.94.10.216]) by smtp.web.de (mrweb004
	[213.165.67.108]) with ESMTPSA (Nemesis) id 0MN87U-1d3vUz3d6W-006cGE;
	Tue, 16 May 2017 10:55:34 +0200
To: John Bradley <flypie1@yahoo.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
	<f4bug@amsat.org>, Alistair Francis <alistair.francis@xilinx.com>
References: <757990479.60759.1494722527715.ref@mail.yahoo.com>
	<757990479.60759.1494722527715@mail.yahoo.com>
	<CAKmqyKPy35OuMkixGnDXOvApAu82uXrtQStSz4GzHNRStdFFNA@mail.gmail.com>
	<1337329283.3100470.1494870647989@mail.yahoo.com>
	<90703952-bc99-ecfe-96c7-810bb1784dce@amsat.org>
	<1901691584.9094.1494892886522@mail.yahoo.com>
From: Geert Martin Ijewski <gm.ijewski@web.de>
Message-ID: <96776f9a-ab8c-b92a-fd07-f69f495d0381@web.de>
Date: Tue, 16 May 2017 10:55:18 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1901691584.9094.1494892886522@mail.yahoo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K0:iXwF74thKnQJDyfEklN2L5NwowfPGIk6v5HeBJzBMHj98jPgefD
	hfo5L9p+KZYNwO+KzDRU+oyxdZs9otKvy0E7C9G2B6RxZ3pdna5v3x6NQYcEJssYZmh0ap1
	3fyj6l96cYoEzZPZkeIrKcZWjiSZX/foe6uDvTwQAG5Pgv4eMdaUU+WzCpMVzx7mzlOXVJT
	nMFD3rSPnOQCGA2ZnE+3Q==
X-UI-Out-Filterresults: notjunk:1;V01:K0:92YcfRlb9+A=:zuTIuqwwBu2aQcyi/6LN97
	7BlUntlJfFFph4y/mUR5ubvofQw8xXrWnPwYf+aWkEOr5xPJRsHHJRi6NHqTgKKg7tQFcLJcl
	J0Vaa3ZKg7rNizYq7wyn2rUH60OMNSYvdzEdqWKqyNQTwNlTch63Rhj5/qi7lnQhAc/uSTq8H
	83ohAMTJ+5Unw4Tea4v41UgePxRrdweKaQtCvIWAR25o8N7AOzEqCCpJlu+jdSW+dETSywvOj
	1M3QbqgcxKLE9SJk7FDblmncLxtjLTOEQxQQbVX5T1Q0/z5+Z3ifUcjiFOixgl4PSpUkFUZ84
	ma7yUOSeFf72TgpnxBRfj4qSwnU63zmpI20w0RwBlF9F+aPNH1k8mkKF5sD5qOO/jIqlBGhj1
	3++u7MBD7JWK6NNrXfq8PSGiIyJZCe3mM8o0N3kiJQ5yAXGTn6IzpID2llPxEoVGcB5jqjou4
	nj9+Vp9hM6U7sN6zrKdKQF/L/AhCs/R8OAVPpe52dWx68657vzHCjHJSpzoyFwYsw1UBsijWk
	cK27qN6tnkON+vw+fig/oY3CH+1rPQFfwwIq6OpQbvHkcg4nUfqoQlTMiJATSl8WINtUQVn9i
	x/ew3KxSE5APvppaiJNrXbSJkpk1ongflHB87OCPuB7V4eV43N9CijMxdG+51QU6nEOdr8j3y
	M0PWD3HRujz7nll2+qnvbcNC5dDQyUpZHilCH4NUqFURuv3yuadiwFvBtyirQu2idKcGucQpk
	d1Z288NUNE/zw0jYbplJkdbvmCniiaxGMKZge8NTopATT4nFOq+9aSY+u4PMtka0EHRJ63bUE
	gxAxz3p
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 212.227.15.4
Subject: Re: [Qemu-devel] [Qemu-arm] Changes to Broadcom(BCM) files and
 Raspberry Pi files. Addition of PanelEmu
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	John Bradley <flypie@rocketmail.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Pk2OtyUimqTn

Am 16.05.2017 um 02:01 schrieb John Bradley via Qemu-devel:
> Hi,
> The XML files in the base are not in the patch. They where net beans files. I can easily get it into 3 files, one large at 91KB but contains only new files and so is easy to read. Could be smaller but seems pointless.
>
I think what Alistar meant was something along the lines of:
patch/commit 1) add the remaining bcm2835 devices from Markus 
Armbruster's code to QEMU (btw: any reason why that hasn't been done? 
The USB stuff does seem nice to have)
-- with a more meaningful commit title
2) add utils/panelemu.c and the include
3) bcm2835 now uses the emupanel
and then your other commits e.g.
4) USB CDC Ethernet driver dropped packets
5) emupanel: fixed compilation errors on linux
6) emupanel: removed last blocking I/O

Along the way you also seem to fix indentation in other code a lot, that 
makes following the patches more confusing than they need to be.
It's harder to gauge at a quick glance whether you changed something 
meaingul or not.

Maybe even send a RFC just detailing the protocol, because it's probably 
important to get that right from the start.

Geert
> another which is about 19KB of quite simple changes to mostly make files.
> Then one 15KB which quite straight forward when you look at it. Applying them in that order should allow step wise addition. I've uploaded them to a share if anyone wants to comment.
>
> The 3 files are new.patch
>
> |
> |
> |
> |   |    |
>
>    |
>
>   |
> |
> |    |
> new.patch
>  Shared with Dropbox  |   |
>
>   |
>
>   |
>
>
>  mod1.patch
>
>
> |
> |
> |
> |   |    |
>
>    |
>
>   |
> |
> |    |
> mod1.patch
>  Shared with Dropbox  |   |
>
>   |
>
>   |
>
>
>
> and
>  a_hw_gpio_bcm2835_gpio.c.patch
>
> |
> |
> |
> |   |    |
>
>    |
>
>   |
> |
> |    |
> a_hw_gpio_bcm2835_gpio.c.patch
>  Shared with Dropbox  |   |
>
>   |
>
>   |
>
>
>
>
>
> John BradleyTel: 07896 839635Skype: flypie125 125B Grove StreetEdge Hill Liverpool L7 7AF
>
>     On Tuesday, 16 May 2017, 0:20, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>
>
>  Hi John,
>
>> That is going to be very difficult as a lot of the changes are
>> interlinked the vast majority of the patch is new files.
>
> I rebased your branch on latest qemu/master here:
>
> https://github.com/philmd/qemu/tree/flypie-GDummyPanel-rebased
>
> It is much easier to follow now, the big XML files you added/removed
> also disappeared (gitk was crashing 'Out Of Memory' trying to look at
> your tree).
>
> I hope it can help you to continue reordering in smaller patches.
>
> Regards,
>
> Phil.
>
> On 05/15/2017 01:46 PM, Alistair Francis wrote:
>>
>> Hey John,
>>
>> Thanks for the patch!
>>
>> Unfortunately this patch is too long to review, you need to split the
>> patch up into shorter more readable patches. Otherwise it's too hard
>> to people to understand what you are changing and why.
>>
>> There are some details here:
>> http://wiki.qemu.org/Contribute/SubmitAPatch
>> <http://wiki.qemu.org/Contribute/SubmitAPatch>about how to split up
>> patches. Each patch applied in order shouldn't break any compilation
>> or runtime. Generally the flow is to add the logic in earlier patches
>> and then connect it and switch it on in the later patches.
>>
>> Try splitting up adding/editing each individual device and send that
>> our first. That is generally the easiest to review/accept.
>>
>> Thanks,
>>
>> Alistair
>>
>>> ---
>>> .gitignore                          |  54 ++
>>> hw/arm/Makefile.objs                |    2 +-
>>> hw/arm/bcm2835.c                    |  114 ++++
>>> hw/arm/bcm2835_peripherals.c        |  104 ++++
>>> hw/arm/bcm2836.c                    |    3 +-
>>> hw/arm/raspi.c                      |  77 ++-
>>> hw/gpio/bcm2835_gpio.c              |  333 ++++++-----
>>> hw/misc/Makefile.objs                |    2 +
>>> hw/misc/bcm2835_mphi.c              |  163 ++++++
>>> hw/misc/bcm2835_power.c              |  106 ++++
>>> hw/timer/Makefile.objs              |    2 +
>>> hw/timer/bcm2835_st.c                |  202 +++++++
>>> hw/timer/bcm2835_timer.c            |  224 +++++++
>>> hw/usb/Makefile.objs                |    4 +-
>>> hw/usb/bcm2835_usb.c                |  604 +++++++++++++++++++
>>> hw/usb/bcm2835_usb_regs.h            | 1061
>> ++++++++++++++++++++++++++++++++++
>>> hw/usb/dev-network.c                |    2 +-
>>> include/hw/arm/bcm2835.h            |  37 ++
>>> include/hw/arm/bcm2835_peripherals.h |  10 +
>>> include/hw/gpio/bcm2835_gpio.h      |    5 +
>>> include/hw/intc/bcm2835_control.h    |  53 ++
>>> include/hw/intc/bcm2836_control.h    |    2 +
>>> include/hw/misc/bcm2835_mphi.h      |  28 +
>>> include/hw/misc/bcm2835_power.h      |  22 +
>>> include/hw/timer/bcm2835_st.h        |  25 +
>>> include/hw/timer/bcm2835_timer.h    |  32 +
>>> include/hw/usb/bcm2835_usb.h        |  78 +++
>>> include/qemu/PanelEmu.h              |  53 ++
>>> util/Makefile.objs                  |    1 +
>>> util/PanelEmu.c                      |  293 ++++++++++
>>> 30 files changed, 3547 insertions(+), 149 deletions(-)
>>> create mode 100644 hw/arm/bcm2835.c
>>> create mode 100644 hw/misc/bcm2835_mphi.c
>>> create mode 100644 hw/misc/bcm2835_power.c
>>> create mode 100644 hw/timer/bcm2835_st.c
>>> create mode 100644 hw/timer/bcm2835_timer.c
>>> create mode 100644 hw/usb/bcm2835_usb.c
>>> create mode 100644 hw/usb/bcm2835_usb_regs.h
>>> create mode 100644 include/hw/arm/bcm2835.h
>>> create mode 100644 include/hw/intc/bcm2835_control.h
>>> create mode 100644 include/hw/misc/bcm2835_mphi.h
>>> create mode 100644 include/hw/misc/bcm2835_power.h
>>> create mode 100644 include/hw/timer/bcm2835_st.h
>>> create mode 100644 include/hw/timer/bcm2835_timer.h
>>> create mode 100644 include/hw/usb/bcm2835_usb.h
>>> create mode 100644 include/qemu/PanelEmu.h
>>> create mode 100644 util/PanelEmu.c
>>>
>>
>>
>
>
>
>

