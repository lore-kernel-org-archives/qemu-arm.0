Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp2109580wro;
        Fri, 2 Nov 2018 06:26:57 -0700 (PDT)
X-Google-Smtp-Source: AJdET5eSHH/B34ONochLPYT9Caw+U4rmUwYPbIlTBwMaPyt0jDfYKYFKtNZ5w5mkeEwX+V1cbkQK
X-Received: by 2002:ac8:3181:: with SMTP id h1mr4989059qte.14.1541165217180;
        Fri, 02 Nov 2018 06:26:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1541165217; cv=none;
        d=google.com; s=arc-20160816;
        b=ZqwWQNqJhOdsuZmbTl/S5eb727hUBPx/8bHx3eR35cDs7IV/FMjOM855dtWJEZzhFG
         D7kD8F29wnbAUMAinx33hFLehHFxmz5wySVzYo65k4QHXUu7TOys1AzSAOlBFlExj7sI
         YT3alznDV6hmxrGBUyANp5Xf76qdfu27MNCsRrQM2gFiyywZo6L9pDG0EpWlL7UfJuHj
         8QsCfVpK6YzpY4MZDMQ236E8ZKWQLwypsS7v10/c1+ADTSDjEh64Eh0BKA055kK6k38Z
         BbEGZ3TwCjGy79/7NoPJhGtmJHpqEHjw+L5CEBD4b3qlhI6VsaGlCc7RHVseQEeqgAq7
         /M/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature;
        bh=xi5RCqrPZhs0j7jFYcLR2pDVyaHpXUpxwGY56YmyA0o=;
        b=fDNF/qabOZMvaD31yu6EHw7F8ODJwvAfQm8PJqdhnWyQrZu3asxzCV+E3EgHQEKKrx
         2IuMDIylie6lGHpqQwXj6aHuFcs5i8wNE1HJz7SobJM352AS4m8SfcAPDViozFPmXhAX
         5nwqtH6rvBg9X3CWvZwkYYrRpjpTcnWlDdZXruLgGXjPvNXiTBJ1LCUOE9zXjme5HXFk
         B3UL1UFzpf6itR4UWUFSp8+F1Rl69PoqkEL7BC10Guf30f8iGGXdGw/7KGWrC/P3FLet
         rxYrY9va1S/5Ysh9AAm4Clw5xdXq8bxS20D/32w+qzXnDXa89440H34Pkso9ehF4Q0bs
         q/Vg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fPSTZsgW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x55-v6si982075qth.369.2018.11.02.06.26.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 02 Nov 2018 06:26:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=fPSTZsgW;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51694 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gIZTU-0005H8-LP
	for alex.bennee@linaro.org; Fri, 02 Nov 2018 09:26:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55279)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <groeck7@gmail.com>) id 1gIZTF-0005Fr-S9
	for qemu-arm@nongnu.org; Fri, 02 Nov 2018 09:26:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <groeck7@gmail.com>) id 1gIZTE-0006kV-Oj
	for qemu-arm@nongnu.org; Fri, 02 Nov 2018 09:26:41 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:38830)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <groeck7@gmail.com>)
	id 1gIZTA-0006hK-O1; Fri, 02 Nov 2018 09:26:37 -0400
Received: by mail-pf1-x444.google.com with SMTP id b11-v6so1042426pfi.5;
	Fri, 02 Nov 2018 06:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=xi5RCqrPZhs0j7jFYcLR2pDVyaHpXUpxwGY56YmyA0o=;
	b=fPSTZsgWE2ljbaV4ePVYHHxsIf6RQkeBjVA+32CvEv6FlheSOUxbYrebFhymOGjjlE
	zNvLf/rYn5GNKRW5JJK5fKmRw6dsK6y2OpWy22rwlFD4g62FyDeV6YaAwuBMqdrzQhpx
	fn4kOVaq3y4tQWVoKq/aYNGo1Yh7czv7uFOZdrZtWzhQTp70nNV69etYxAAmOjN8ZrH3
	gqpOtVvlJ7WT333WRb/IZCDnsZiFzHbomcNFLzDwV2JWZ5Q1M0w27eZVXcrKEG3NryK9
	RBdDptjHmT3Mjanx3QONzb2HHELwgfnQh0KSMwkB9easFR+jRb6Vg/CuNiu4of5232jk
	Ulpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=xi5RCqrPZhs0j7jFYcLR2pDVyaHpXUpxwGY56YmyA0o=;
	b=EFYPGU+7mOvtXYF9ApkF2hGdnxCVJAi+zyP6f3dWvQcEk/k13ERUzNQvStqJ9x/Kf+
	eZ8WJxiZ5xHk5HwGU3iDV4u5BEJ7U1OFno5y1UoEjHkQ5vGqvbb83Xa+HbQa8T14HlNp
	3kFFjCzaF1NhtSFxVKbmQiYtmuNirSMCS6NfaQwzeFuM4R70o2OsDQLn5V41MUENbALw
	FsTDrfC6x6cD1I6PxCirwmIon3yPRJYgNb+LWlg89aiLSnYFx/5DOcbQ7QI+ADrtXmHJ
	432lb8DjogwtguB477ebGRzZh3rwCrlx2okNxw1tsjOCRj6RxQwYcUZCK45Ii23oYyHV
	vO6Q==
X-Gm-Message-State: AGRZ1gJmoZj/ziJoVrczM2h70NSD3JmFc+FMndqDxIjV4xxhJubELCKD
	0+IwcEd1TtyrP67/1guzhTKXaC1r
X-Received: by 2002:a63:d40a:: with SMTP id a10mr10792344pgh.394.1541165190055;
	Fri, 02 Nov 2018 06:26:30 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
	by smtp.gmail.com with ESMTPSA id
	i186-v6sm38152303pfc.86.2018.11.02.06.26.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Nov 2018 06:26:29 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20181102001303.32640-1-f4bug@amsat.org>
	<b32bf2a0-08ac-6b16-6372-455f9a239f9f@roeck-us.net>
	<CAAdtpL6VCf+hyK7GGtoiC8KLAL2DJtaYomwhcY7Mz2OxMg2AiA@mail.gmail.com>
	<CAAdtpL776SX0rbO1-dsBmx_7D3gn8e5ukt5Z0STejYRt+oXcEg@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <0515e472-b65e-9b68-7792-75c000d4824a@roeck-us.net>
Date: Fri, 2 Nov 2018 06:26:28 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAAdtpL776SX0rbO1-dsBmx_7D3gn8e5ukt5Z0STejYRt+oXcEg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: Re: [Qemu-arm] [PATCH for 3.2 v2 0/7] hw/arm/bcm2835: Add basic
 support for cprman (clock subsystem)
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gbDk0rAnC/cV

On 11/2/18 12:48 AM, Philippe Mathieu-Daudé wrote:
> On Fri, Nov 2, 2018 at 8:32 AM Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> Hi Guenter,
>>
>> On Fri, Nov 2, 2018 at 3:52 AM Guenter Roeck <linux@roeck-us.net> wrote:
>>>
>>> On 11/1/18 5:12 PM, Philippe Mathieu-Daudé wrote:
>>>> Hi,
>>>>
>>>> This series is a mix of a previous work I had for the raspi, and a patch from
>>>> Guenter: https://lists.gnu.org/archive/html/qemu-devel/2018-07/msg03153.html
>>>>
>>>> The final patch keep Guenter ideas and comments, but is mostly a rewrite.
>>>> I dropped the A2W code from this work, it doesn't seems unuseful to me.
>>>>
>>>> Guenter can you test this series?
>>>>
>>>
>>> arm/raspi2 works, but aarch64/raspi3 stalls.
>>
>> Thanks for testing it!
>>
>> So I suppose the A2W is required. And I'm probably using a too old kernel,
>> I'm using the Buster preview following Peter's post [1]:
>>
>> [    0.000000] Linux version 4.14.0-3-arm64
>> (debian-kernel@lists.debian.org) (gcc version 7.2.0 (Debian 7.2.0-18))
>> #1 SMP Debian 4.14.12-2 (2018-01-06)
>> [    0.000000] Machine model: Raspberry Pi 3 Model B
>> [...]
>> [    8.044215] systemd[1]: Detected architecture arm64.
>> Welcome to Debian GNU/Linux buster/sid!
>>
>> Debian GNU/Linux buster/sid rpi3 ttyAMA0
>>
>> rpi3 login: root
>> Password:
>> Linux rpi3 4.14.0-3-arm64 #1 SMP Debian 4.14.12-2 (2018-01-06) aarch64
>> root@rpi3:~#
>>
>> I'll look for a newer kernel.
> 
> I'm a bit confuse since I can boot a 4.19 kernel:
> 
> [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd034]
> [    0.000000] Linux version 4.19.0 (gokrazy@docker) (gcc version
> 6.3.0 20170516 (Debian 6.3.0-18)) #1 SMP PREEMPT Wed Mar 1 20:57:29
> UTC 2017
> [    0.000000] Machine model: Raspberry Pi 3 Model B
> [    0.000000] earlycon: pl11 at MMIO 0x000000003f201000 (options '')
> [    0.000000] bootconsole [pl11] enabled
> ...
> [    2.722577] Freeing unused kernel memory: 5696K
> [    2.723256] Run /init as init process
> Loading, please wait...
> starting version 236
> ...
> root@rpi3:~# uname -a
> Linux rpi3 4.19.0 #1 SMP PREEMPT Wed Mar 1 20:57:29 UTC 2017 aarch64 GNU/Linux
> 
>>
>> BTW I use these QEMU command line options while testing:
>>
>> qemu-system-aarch64 \
>>    -d unimp,guest_errors \
>>    -trace bcm2835_cprman_rd_\* -trace bcm2835_cprman_wr_\* \
>>    ...
>>
>> And the cmdline suggested by Peter:
>>
>>    -append "rw earlycon=pl011,0x3f201000 console=ttyAMA0 loglevel=8
>> root=/dev/mmcblk0p2 fsck.repair=yes net.ifnames=0 rootwait memtest=1"
>>
>> [1] https://translatedcode.wordpress.com/2018/04/25/debian-on-qemus-raspberry-pi-3-model/
>>
>>>
>>> [   45.683302] Run /sbin/init as init process
> 
> init is ran way after A2W register accesses, so I doubt they are the
> problem here.
> 
> Can you provide me your testing setup?
> 

-append 'earlycon=uart8250,mmio32,0x3f215040 rdinit=/sbin/init panic=-1 console=ttyS1,115200'

On raspi3, ttyAMA0 can not be used as console because it is connected to something else.
I can boot if I use ttyAMA0 as console. Comparing the log output with the output when
using my original patch, tt looks like ttyS1 doesn't come up.

Hope this helps,
Guenter
