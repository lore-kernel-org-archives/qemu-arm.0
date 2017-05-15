Received: by 10.25.0.6 with SMTP id 6csp1627524lfa;
        Mon, 15 May 2017 16:20:55 -0700 (PDT)
X-Received: by 10.55.137.133 with SMTP id l127mr7450502qkd.113.1494890454979;
        Mon, 15 May 2017 16:20:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494890454; cv=none;
        d=google.com; s=arc-20160816;
        b=ZXds3VdpP58bFwh2wz29Rxaim1kL6SzI2zRKuZl9xr20L9Awmji34unKFZBRJIGw1A
         i6pejTH3TRj2hy/3hoxwMhfG8c/1qNTZTsgBN5o159RcwXnbhZKWRJNEo+d3uNfAKvlG
         aChDwr3h3YrZ++heJVNYIPAQ9ojEc0FAsm2ZsSREnGfFXKLqOADR+YIPrQjTTM0TCHA3
         hez7uXxC/0z0vUs2eEfk38dS+9Du9KZHH+pLqOFPCVwEicpurISExB1111y5ATIc803N
         H2gIQhcncXaLq6WUcTTtp5Puy4VJadCojTyyvzkYYkDzDSCo9T4pA8aRXCA1NZvapRYq
         javw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=AERJQtHnOm/hoD+YFH+HEMvIolfSuneZjxbUtDf0hR8=;
        b=uPSOWhwEpmpwz+VkDnTBGTMcjPZUhuMU5J9lETQoX42NJW3CsGbAV9fC05jawIy0Os
         bL+La4FgbmIanVlLf89WJ3mwIWYnSn0SimXhpE9YWlF+nGDg7EN8N6XE2wmjuge+Ntrv
         CBZUdST/eBECnYE2EzK0aH+H9SAE3FI/FvhWgjxPgGzoz2NLoLavuq50iSOyO8SbQ/4L
         9kBAqJsPKHedV0ByksJkg2McpTrZRS+XnkfUr678wFuWrwdQHxRH+OIzwYjk2EXUzw1H
         BW3zSmv7T58OLeciz2zxSDWgUbPx9nKQ5DHXmc0HoMG6QsJn6p7+3EJaNMfM6Y0rzkCk
         h3Xw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a23si12257170qtc.106.2017.05.15.16.20.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 May 2017 16:20:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39212 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dAPIM-000629-F3
	for alex.bennee@linaro.org; Mon, 15 May 2017 19:20:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43685)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dAPIH-000624-Kn
	for qemu-arm@nongnu.org; Mon, 15 May 2017 19:20:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dAPID-0002uq-LR
	for qemu-arm@nongnu.org; Mon, 15 May 2017 19:20:49 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:34763)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dAPID-0002uH-FY; Mon, 15 May 2017 19:20:45 -0400
Received: by mail-qt0-x241.google.com with SMTP id l39so18274709qtb.1;
	Mon, 15 May 2017 16:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=AERJQtHnOm/hoD+YFH+HEMvIolfSuneZjxbUtDf0hR8=;
	b=itkXaOmFH9t/AxmqfmDfIVYSLSzCDi0eRXpamOtDOz2P7nirGzSMiNLlCEKioCowMx
	0nReASD77KwEutiJIjD5kHv0Zq8JYE5zZ5Oj+wpd9Ex4E6FiSJlrC9UmmlDOjw9ZIgjC
	JR+84iCE0yhIkP0HFZ7hp5+odl3+eAy5790bGGtV9P4YbqHeYpovFt6egfVOg6RBPTvP
	bguXVYDWEg44YMr+mG1QQ1/O33TuC+uNqG+oA+HwOmYLMfl3GKN5WBeAhPJIF5ONFU8/
	FuV3g5gwtngqQtLZSHmyzXcJNvw/t6njWS3L6akYhvq37uOPh9H+Vzp+OqToEGW0cTTj
	d+8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=AERJQtHnOm/hoD+YFH+HEMvIolfSuneZjxbUtDf0hR8=;
	b=MPqMHTD5FvC0vkz26Uv/EjDc7m8FtGaw6tybN/Jq+kG0Pd4m6NImsSeaInBeHuX+oK
	8nKn4pKuco551BnZZkYWZyNQDzEsnec2KXomiSSRQLeguYo6+sjal3mvgCOgrSBJOHYW
	xzdn1UFDpxH70VtWB+voi85Vp0a1fdcyjpqtQDItnKF52dpDdyuggK9r8NMzM8oDlReb
	i6xhwsUNVF0wh5CtwzdAr1uJCzi7STcdatnWF4eWxdTIj40NXpCFLPKGXaUPEI8AacIV
	2reotHXu1iCoI+gzc8z1GiR84EgC0sLLwsun0CWsNZil6p9E3gdquZ3kK8MEu8LqmgCf
	8HOw==
X-Gm-Message-State: AODbwcDsLEH6s5GfAp/DCMQI7zbTB2H8Vtf3DzY9cpLiHSKoXzearcOI
	Ff1SEXibErNVKA==
X-Received: by 10.237.37.209 with SMTP id y17mr8758097qtc.140.1494890444916;
	Mon, 15 May 2017 16:20:44 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id 29sm3707979qkz.38.2017.05.15.16.20.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 May 2017 16:20:44 -0700 (PDT)
To: John Bradley <flypie1@yahoo.com>,
	Alistair Francis <alistair.francis@xilinx.com>
References: <757990479.60759.1494722527715.ref@mail.yahoo.com>
	<757990479.60759.1494722527715@mail.yahoo.com>
	<CAKmqyKPy35OuMkixGnDXOvApAu82uXrtQStSz4GzHNRStdFFNA@mail.gmail.com>
	<1337329283.3100470.1494870647989@mail.yahoo.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <90703952-bc99-ecfe-96c7-810bb1784dce@amsat.org>
Date: Mon, 15 May 2017 20:20:40 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <1337329283.3100470.1494870647989@mail.yahoo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: Re: [Qemu-arm] [Qemu-devel] Changes to Broadcom(BCM) files and
 Raspberry Pi files. Addition of PanelEmu
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
Cc: Laurent Vivier <lvivier@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	John Bradley <flypie@rocketmail.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nQ5qEFZ759hc

Hi John,

> That is going to be very difficult as a lot of the changes are
> interlinked the vast majority of the patch is new files.

I rebased your branch on latest qemu/master here:

https://github.com/philmd/qemu/tree/flypie-GDummyPanel-rebased

It is much easier to follow now, the big XML files you added/removed 
also disappeared (gitk was crashing 'Out Of Memory' trying to look at 
your tree).

I hope it can help you to continue reordering in smaller patches.

Regards,

Phil.

On 05/15/2017 01:46 PM, Alistair Francis wrote:
>
> Hey John,
>
> Thanks for the patch!
>
> Unfortunately this patch is too long to review, you need to split the
> patch up into shorter more readable patches. Otherwise it's too hard
> to people to understand what you are changing and why.
>
> There are some details here:
> http://wiki.qemu.org/Contribute/SubmitAPatch
> <http://wiki.qemu.org/Contribute/SubmitAPatch>about how to split up
> patches. Each patch applied in order shouldn't break any compilation
> or runtime. Generally the flow is to add the logic in earlier patches
> and then connect it and switch it on in the later patches.
>
> Try splitting up adding/editing each individual device and send that
> our first. That is generally the easiest to review/accept.
>
> Thanks,
>
> Alistair
>
>> ---
>> .gitignore                          |  54 ++
>> hw/arm/Makefile.objs                |    2 +-
>> hw/arm/bcm2835.c                    |  114 ++++
>> hw/arm/bcm2835_peripherals.c        |  104 ++++
>> hw/arm/bcm2836.c                    |    3 +-
>> hw/arm/raspi.c                      |  77 ++-
>> hw/gpio/bcm2835_gpio.c              |  333 ++++++-----
>> hw/misc/Makefile.objs                |    2 +
>> hw/misc/bcm2835_mphi.c              |  163 ++++++
>> hw/misc/bcm2835_power.c              |  106 ++++
>> hw/timer/Makefile.objs              |    2 +
>> hw/timer/bcm2835_st.c                |  202 +++++++
>> hw/timer/bcm2835_timer.c            |  224 +++++++
>> hw/usb/Makefile.objs                |    4 +-
>> hw/usb/bcm2835_usb.c                |  604 +++++++++++++++++++
>> hw/usb/bcm2835_usb_regs.h            | 1061
> ++++++++++++++++++++++++++++++++++
>> hw/usb/dev-network.c                |    2 +-
>> include/hw/arm/bcm2835.h            |  37 ++
>> include/hw/arm/bcm2835_peripherals.h |  10 +
>> include/hw/gpio/bcm2835_gpio.h      |    5 +
>> include/hw/intc/bcm2835_control.h    |  53 ++
>> include/hw/intc/bcm2836_control.h    |    2 +
>> include/hw/misc/bcm2835_mphi.h      |  28 +
>> include/hw/misc/bcm2835_power.h      |  22 +
>> include/hw/timer/bcm2835_st.h        |  25 +
>> include/hw/timer/bcm2835_timer.h    |  32 +
>> include/hw/usb/bcm2835_usb.h        |  78 +++
>> include/qemu/PanelEmu.h              |  53 ++
>> util/Makefile.objs                  |    1 +
>> util/PanelEmu.c                      |  293 ++++++++++
>> 30 files changed, 3547 insertions(+), 149 deletions(-)
>> create mode 100644 hw/arm/bcm2835.c
>> create mode 100644 hw/misc/bcm2835_mphi.c
>> create mode 100644 hw/misc/bcm2835_power.c
>> create mode 100644 hw/timer/bcm2835_st.c
>> create mode 100644 hw/timer/bcm2835_timer.c
>> create mode 100644 hw/usb/bcm2835_usb.c
>> create mode 100644 hw/usb/bcm2835_usb_regs.h
>> create mode 100644 include/hw/arm/bcm2835.h
>> create mode 100644 include/hw/intc/bcm2835_control.h
>> create mode 100644 include/hw/misc/bcm2835_mphi.h
>> create mode 100644 include/hw/misc/bcm2835_power.h
>> create mode 100644 include/hw/timer/bcm2835_st.h
>> create mode 100644 include/hw/timer/bcm2835_timer.h
>> create mode 100644 include/hw/usb/bcm2835_usb.h
>> create mode 100644 include/qemu/PanelEmu.h
>> create mode 100644 util/PanelEmu.c
>>
>
>
