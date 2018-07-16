Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp1529523wru;
        Mon, 16 Jul 2018 06:51:31 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfNTD2iP84BAMnhLingvmCBUGqYY5anxlchTV1C54WXySj05lFqBmZbY1s8xKrTFBnu6LzU
X-Received: by 2002:ac8:1c34:: with SMTP id a49-v6mr14305896qtk.16.1531749091428;
        Mon, 16 Jul 2018 06:51:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531749091; cv=none;
        d=google.com; s=arc-20160816;
        b=Wk8Npkp9onM/NAIz65Q6OmoxrYhL9Z4k7GK5eAUkXkdyIPSPAURzdi/gt9+mupJs97
         JrDJ/5HVWx/agb5OcO69c7GpaEqmrbYJvKY/KEfkYiAXH23FrEZ9RM4/OM8JdDVNSsD0
         Ddt7cdJtQHzaWon4+/427nN/9bJVVzRWU5LO3FZOphOHBSxV/p6j6Pq2Ht9pObqgSKCy
         084bTTDZGtlGLPqV6CLKHMemztLyMAv1gnrufv/djZfz8/46vyY+nomWZFWkbjDsUzqS
         RujdaNeJgpFh5mNFoOJhJpbFmkzK7tDdUVNeMbwujhyPtu+q9x3pVcXD2KWQ5i+oQWPe
         pq4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=CgHx1eH8Vde2GwTQkxcxXg1klQS7ie/tJblF+lVCcJo=;
        b=fSBQr3qJwE2y89fhgtref2/Usa7HV190UfhuTpYYN370liL6pCk0I26GehBeDnoheP
         t/d2aoNNRPLBFmDHtOO7JkRKKl64bHjSvYIT24quXsBBIFQqN85uy49rm6QYtd4xlBBH
         S1XOj/UMH2h1IaLEJr/ewdlxLyYB8sAk0Cf1PfYbO3eM0AGID+ENMdvEeD9QOEyEOoYp
         8LINz+4ti8rYkpn2rAxMc39q1YE+UtV+mC4ksnKboPpjeOn0H7OqQCvl/sO5aSSJnigY
         SzcBJurFu/MkkE/cIiqMBhExsp3blqxtcNXXVYnsQDK0WcYskx82w2a33lWNEJuPjL5Y
         Akmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=B0JzmZe1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p2-v6si11267489qvk.221.2018.07.16.06.51.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 16 Jul 2018 06:51:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=B0JzmZe1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:51866 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ff3uU-00051g-QU
	for alex.bennee@linaro.org; Mon, 16 Jul 2018 09:51:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59373)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <groeck7@gmail.com>) id 1ff3uF-0004zM-Hk
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 09:51:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <groeck7@gmail.com>) id 1ff3uE-0002bf-GM
	for qemu-arm@nongnu.org; Mon, 16 Jul 2018 09:51:15 -0400
Received: from mail-pl0-x243.google.com ([2607:f8b0:400e:c01::243]:40638)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <groeck7@gmail.com>)
	id 1ff3u7-0002Yb-RW; Mon, 16 Jul 2018 09:51:07 -0400
Received: by mail-pl0-x243.google.com with SMTP id s17-v6so5892476plp.7;
	Mon, 16 Jul 2018 06:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=CgHx1eH8Vde2GwTQkxcxXg1klQS7ie/tJblF+lVCcJo=;
	b=B0JzmZe1qkl8wxkOGQgYlUIVv7rws60GRXoqrSgRSL3EBcXMJ5os7yL+TaOHztD2Qz
	OhVR1LZs3Z0C0xfXoRlIh6CyXKUS4ml3xgFd9oSQJKAHp6vJR5Pal5RoiIvlKO8d/EdT
	xdMzIhUirfMjPJTimDWN4i8M7bNNO+2YcD1qiXAiv1jey+T+d13VhcwFYp212pyz9tVH
	8fTQK7VlLSCqirSdaldT7DwmM8r+YqsnXC9FLL+dqtRuOf+QxUEja0L0E/bZTcKy2JON
	vsz6Ee7o3KhHZTqR2q0AHgepwZG74OypnTfOfG8x+jHALe0ObGQiF9ALs8pZf6YdIYXH
	wCBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=CgHx1eH8Vde2GwTQkxcxXg1klQS7ie/tJblF+lVCcJo=;
	b=EetTle4fCSIwTbLRBnSKDXBCgIVcsKTzjB4tVZhGh39kz0IAonloP1TvZYvJ8+xBFP
	3hTuI2yHKRllN5/AdW6MtWimmlRo2xueuyygmYld6bJlrsJs7QpFYGaLqF0j940+MkSf
	Ps26qnF3mK3+utI8A9FfwSA4FOKiCOXukn9EDOxqhwXCo7JW29BYPPXMe46DimZEJV2H
	5yFQsBxNJtfuiLuCn6pykN4vulWlYPzrZ+Chv/44lreEJmhhmWUXvBOdsR+WES9zW+8R
	HkiRgnaE6SZecMgzEjItuGRMMpFKvvgccFMs8c4D0rW/6m9l+sbGAKY3kEtnys0A3dvj
	ldrA==
X-Gm-Message-State: AOUpUlHGw6KjHqXH23186Ec5OOCye20mkUbIumVxZr/8Xx8xLf912VtH
	I+uKB2iqmW14yqJmqUvUxBE=
X-Received: by 2002:a17:902:aa46:: with SMTP id
	c6-v6mr16507477plr.313.1531749066771; 
	Mon, 16 Jul 2018 06:51:06 -0700 (PDT)
Received: from server.roeck-us.net
	(108-223-40-66.lightspeed.sntcca.sbcglobal.net. [108.223.40.66])
	by smtp.gmail.com with ESMTPSA id
	f5-v6sm1555725pga.58.2018.07.16.06.51.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 Jul 2018 06:51:05 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1531692369-1511-1-git-send-email-linux@roeck-us.net>
	<CAFEAcA9W88G8rd4iMq7qsNd2C2fRiYJ32dVooZLyzY10__5piw@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <e893ae38-9294-4b54-e950-6632b6b73532@roeck-us.net>
Date: Mon, 16 Jul 2018 06:51:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9W88G8rd4iMq7qsNd2C2fRiYJ32dVooZLyzY10__5piw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::243
Subject: Re: [Qemu-arm] [RFC PATCH] hw: arm: Add basic support for cprman
 (clock subsystem)
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Pekka Enberg <penberg@iki.fi>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hSdfr7l23Yo1

On 07/16/2018 02:08 AM, Peter Maydell wrote:
> On 15 July 2018 at 23:06, Guenter Roeck <linux@roeck-us.net> wrote:
>> Add basic support for BCM283x CPRMAN. Provide support for reading and
>> writing CPRMAN registers and initialize registers with sensible default
>> values. During runtime retain any written values.
>>
>> Basic CPRMAN support is necessary and sufficient to boot Linux on raspi2
>> and raspi3 systems.
> 
> I can boot Linux on raspi3 with current upstream's level
> of cprman support:
> https://translatedcode.wordpress.com/2018/04/25/debian-on-qemus-raspberry-pi-3-model/

Yes, as long as you use ttyAMA0 as console. Using ttyS1, which is the real console
on raspi3, doesn't work. It doesn't give tracebacks, but it reports

[    8.894257] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    8.973121] bcm2835-aux-uart 3f215040.serial: unable to register 8250 port - -22
[    8.981971] bcm2835-aux-uart: probe of 3f215040.serial failed with error -22

and then there is no console. I have to hack the bcm8250 driver to provide
a dummy clock to get it to work.

> 
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
>> ---
>> I don't seriously expect this patch to get accepted, but I thought
>> it might be valuable enough for others to use it when playing with
>> raspi2 and raspi3 emulations.
> 
> I'm not necessarily going to rule it out entirely, but I'm
> definitely not very happy about having a model of hardware
> that's very clearly "do something that Linux likes". I'd
> really rather see hardware documentation here -- presumably
> whoever is writing the Linux drivers has that?
> 

Maybe, but I don't, and I was unable to find it. The published documentation
only lists information for some of the registers (for the general purpose
clocks).

In this context, I can't get mmc to work with ToT Linux on raspi3.

/ # mount /dev/mmcblk0 /mnt
[   47.099074] sdhost-bcm2835 3f202000.mmc: timeout waiting for hardware interrupt.
[   57.339803] sdhost-bcm2835 3f202000.mmc: timeout waiting for hardware interrupt.
[   57.390449] mmc0: Problem switching card into high-speed mode!
[   67.581559] sdhost-bcm2835 3f202000.mmc: timeout waiting for hardware interrupt.
[   67.587832] print_req_error: I/O error, dev mmcblk0, sector 2
[   67.588908] Buffer I/O error on dev mmcblk0, logical block 1, lost sync page write
[   67.610307] EXT4-fs (mmcblk0): I/O error while writing superblock
[   67.620842] EXT4-fs (mmcblk0): mount failed
[   77.819114] sdhost-bcm2835 3f202000.mmc: timeout waiting for hardware interrupt.
[   88.058917] sdhost-bcm2835 3f202000.mmc: timeout waiting for hardware interrupt.
[   98.298937] sdhost-bcm2835 3f202000.mmc: timeout waiting for hardware interrupt.
[   98.303554] print_req_error: I/O error, dev mmcblk0, sector 2
[   98.306044] Buffer I/O error on dev mmcblk0, logical block 1, lost sync page write

Any idea what the problem might be ?

Thanks,
Guenter
