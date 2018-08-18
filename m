Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp804200wrd;
        Fri, 17 Aug 2018 18:29:37 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPxiSxTXgMC10MpIoFyv/0DmCl8c1rsLTIInaEBAvCqfpeA1NG2J4P6NPgglJMY8RGftZ8Wk
X-Received: by 2002:ac8:6c8:: with SMTP id j8-v6mr35083864qth.314.1534555777583;
        Fri, 17 Aug 2018 18:29:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534555777; cv=none;
        d=google.com; s=arc-20160816;
        b=gBJoSXprPRCjVhazHFQcTNa7PYV2dwe09iwCdpd47ZFOMTOds+cx/xkPeTnIPs3ZMB
         te5qUy58bymVIYMbDMpL0M8iJ9s8ciIddl0u9lSuLpaanCFWamF56FdBM3nTxYy2wiPh
         6j1GFK1dBWYpGqRJizObgN+bX3zxe7Rct0qO1cWZaTG+8A076LX0lmno4Gzj/ksK9pyf
         ZwEEvUyNzQhpMdQheDhneacDFjOjN/kM9BO/r7oHITALfeeqUXpOdYAbkagfp5BASpuE
         Qcq880Y2RTTLZ3J4kHdgaPeHmqhnJTONakHbfIGQmnQmNIn3WGASGGpMFOEPvPa5xrnR
         Dm1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=ifquiz5JnNiX9Thehb7YEW5C8/bmJoiWLmnpZQSQZJ4=;
        b=v/7i4erZOp6q1uYga+qr2/F0FC3KWY+f08cd8b0m7Va5TSLH5LXom7Znl83/CcGJvd
         SiVcEEZ75ZCrza8dC+PaG5ftt845kYDtEagO/AbzBKrgYs5j507PxIVX+ylu1CocS+Qp
         WLrzj+uh8tpxr0Dc/WovRN4ZuCxom7KijQKLueZ69kxi9kJyHcM0Nw0tKtFMU9ZLIKbA
         ZEVdU/oawU5WTIPteNajRnAcwnkTa0ByRsA/6A/xImCTwUK3QpZp3ErDH3A2rrf+mvAj
         Dp+Vkr9mQsM6GQ8ygKJNUkP5kdUgYPlWvw3HVJM+yrN63FlX8nWn1H62jF6O1WiJxpyB
         nDCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rgkjqTMZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c31-v6si3381993qtb.13.2018.08.17.18.29.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 17 Aug 2018 18:29:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=rgkjqTMZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:37127 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fqq3d-0002ld-4T
	for alex.bennee@linaro.org; Fri, 17 Aug 2018 21:29:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42732)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fqq3U-0002ky-Dc
	for qemu-arm@nongnu.org; Fri, 17 Aug 2018 21:29:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fqq3T-0007Ys-GC
	for qemu-arm@nongnu.org; Fri, 17 Aug 2018 21:29:28 -0400
Received: from mail-vk0-x242.google.com ([2607:f8b0:400c:c05::242]:40622)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fqq3M-0007PA-81; Fri, 17 Aug 2018 21:29:21 -0400
Received: by mail-vk0-x242.google.com with SMTP id q184-v6so4063441vke.7;
	Fri, 17 Aug 2018 18:29:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ifquiz5JnNiX9Thehb7YEW5C8/bmJoiWLmnpZQSQZJ4=;
	b=rgkjqTMZF/WYrnER1viCyE3cJ5JuLxhOsAQCVbaz+Wg7NYa5A0tIVxztNKpl1GxSUn
	rZ0J7uGOZUDu46QJK6MbRw8JcXUl5MHVqAZACGrgSEyn+XMRuBKBXuh/dNIeHAaohBhI
	+e7KCQti3n37dHl4ZPrqhWejvX35WURw3eYMA90jxQcqne2c8ybi4q9g3iEZh1AQTPyV
	A5ktF5n9EyV8CijkjBsuU0VGdYBV7iJpGO7/8NZyJGs/H6hRhhB3EpSLWdVv1ZvODwUd
	qbS8/4PkQ2oEvrb5NTh5iiLLFTCclOo/NpiDhi/YFJgqUxJw/crq6zDhGtTTyppC0NPM
	BXHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=ifquiz5JnNiX9Thehb7YEW5C8/bmJoiWLmnpZQSQZJ4=;
	b=nxA1UToghqPBSq2Q6W+k9EoloxIZba6Hw69majy1Ak2KNDYHqmrHuZwA1ukH/zISHd
	OEbWzQHFG3GS3rDw9L67AsZLZHWb/ek8wHaD8Ms/yCQZpb0mQSlcA/9SXDeA1HFhjlhl
	XZ73JFWxo9R5+7QXjwO6bD0tms77Caz+6tpG0XwuWuN8a1hu+y11e6BgdbQCd4UEKJ8p
	thOEoJnjjc1CZwrT5/4Yuwaw99Od8ryHzo06wyCoRY/sr02Og0K/JP1n1p2sYDu4khT8
	sPy63tHDLvwoMcuCelildoRLSC/DLL51sKpix0LeXl6vjnkBCsRE+QL2unVgBCWH5fXT
	Sbbw==
X-Gm-Message-State: AOUpUlHB7P5tTWJklI1Vzub8AZUL7XTS3Jar4r1uXronO7Kd8b2JNn39
	dBY5ZwxOLsQWasvw3a1DI5A=
X-Received: by 2002:a1f:3a95:: with SMTP id
	h143-v6mr24894119vka.42.1534555758648; 
	Fri, 17 Aug 2018 18:29:18 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	j11-v6sm2901152uah.46.2018.08.17.18.29.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 Aug 2018 18:29:18 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
	QEMU Developers <qemu-devel@nongnu.org>
References: <20180809130115.28951-1-peter.maydell@linaro.org>
	<CAFEAcA-AD=cxpGzgyZDU3vhCwthVaPg+WKWNLH+gjP=devvWZw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Autocrypt: addr=f4bug@amsat.org; prefer-encrypt=mutual; keydata=
	mQINBDU8rLoBEADb5b5dyglKgWF9uDbIjFXU4gDtcwiga9wJ/wX6xdhBqU8tlQ4BroH7AeRl
	u4zXP0QnBDAG7EetxlQzcfYbPmxFISWjckDBFvDbFsojrZmwF2/LkFSzlvKiN5KLghzzJhLO
	HhjGlF8deEZz/d/G8qzO9mIw8GIBS8uuWh6SIcG/qq7+y+2+aifaj92EdwU79apZepT/U3vN
	YrfcAuo1Ycy7/u0hJ7rlaFUn2Fu5KIgV2O++hHYtCCQfdPBg/+ujTL+U+sCDawCyq+9M5+LJ
	ojCzP9rViLZDd/gS6jX8T48hhidtbtsFRj/e9QpdZgDZfowRMVsRx+TB9yzjFdMO0YaYybXp
	dg/wCUepX5xmDBrle6cZ8VEe00+UQCAU1TY5Hs7QFfBbjgR3k9pgJzVXNUKcJ9DYQP0OBH9P
	ZbZvM0Ut2Bk6bLBO5iCVDOco0alrPkX7iJul2QWBy3Iy9j02GnA5jZ1Xtjr9kpCqQT+sRXso
	Vpm5TPGWaWljIeLWy/qL8drX1eyJzwTB3A36Ck4r3YmjMjfmvltSZB1uAdo1elHTlFEULpU/
	HiwvvqXQ9koB15U154VCuguvx/Qnboz8GFb9Uw8VyawzVxYVNME7xw7CQF8FYxzj6eI7rBf2
	Dj/II6wxWPgDEy3oUzuNOxTB7sT3b/Ym76yOJzWX5BylXQIJ5wARAQABtDFQaGlsaXBwZSBN
	YXRoaWV1LURhdWTDqSAoRjRCVUcpIDxmNGJ1Z0BhbXNhdC5vcmc+iQI+BBMBAgAoBQI3aGSw
	AhsPBQkmUJgABgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRDj4yws3q3A3nS+EACxKosO
	3DZdwdVPXLVvSAA5y3Ohr2ByWN06RlVEkKWkOxm0lQ96LxBOZ03mDC+He/36DHaP+fujPBTz
	XjTXygWWZUtk0flDWR1w0a4yhX/JHfL5yloMZrxifCwouf2Sv9Yd6D46pzMeGsq8aCvbZYSf
	lDi3KXsVHc+jbmRwxtzJxz7366dsTC1tOJmjVSxc8bE55pHnPFOT1KKM9fxGWZFYx0UqAL/1
	NkrOKP5eXdJ51EhQa5pjivJw6dQlfWMQURG4o4e2+aLe4TkS2FI0r6nTgmoDmTT74u35NzZW
	Q3xjqcfqUX52+0drwlta22guNDbcJ4J+/I6FBF1C7CoSysBiIrldZQ6cJZ19st3jb7NHAoNk
	DcUt5I3gt4EpaiijWEEYAhw1/NSagm9bfn9veBqzVHNQrz76NZMiy2kP2vAxKOvo1XVlcEl0
	8MQ+IAUvYcLvU6yHRB4da7ts+ufqriNI5WBpvoLPRRa0wFDTj0nX/CfWFX9UkTwHA6/SWlhE
	hHau4xrpzFENwF5UDFtMkleo/u5Ipv7q8wYNs5JBpSXGmm4oSV9BbW0gp28D8fY4GGv1+6Dz
	BNDeuIdPf2NX0X55uyphpB0J4d70uNszAWXr7VqGOBbGrHcNHeT62BvoRd8bUQhaEyiJwOyC
	Ny4YIWW+I8W2wXkW+vSrZfEro2GZjQ==
Message-ID: <e72958cc-88c1-67d9-2869-16e6c2578277@amsat.org>
Date: Fri, 17 Aug 2018 22:29:14 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-AD=cxpGzgyZDU3vhCwthVaPg+WKWNLH+gjP=devvWZw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c05::242
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 00/16] arm: Implement MPS2
 watchdogs and DMA
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
Cc: "patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0KbELvGkBRm5

On 08/16/2018 03:02 PM, Peter Maydell wrote:
> Ping for code review, please?

I let patch #7 for someone else (or later) and few comments before
adding R-b for the rest.

> 
> (It's only been a week so this is a little bit eager, but
> I have some more MPS patches which wire up the PL022 SPI
> controllers, which I'm holding off on posting until this
> and the preceding FPGAIO set get reviewed and committed, so
> as not to have too many MPS patches in flight at once.)
> 
> thanks
> -- PMM
> 
> On 9 August 2018 at 14:00, Peter Maydell <peter.maydell@linaro.org> wrote:
>> This patchset adds some more missing devices to the MPS2 AN505
>> board model:
>>
>> Patches 1-3 implement and wire up the CMSDK APB watchdog devices.
>>
>> Patch 4 adds a CMSDK timer device that had been forgotten.
>>
>> Ppatches 5-6 implement and wire up the "system control element",
>> which is some simple control/ID registers in the IoTKit
>>
>> Patches 7-16 are the meat of the patchset, and add support
>> for the DMA controllers and their associated Master Security
>> Controllers. A TrustZone MSC sits in front of a device which
>> can be a bus master (such as a DMA controller) and allows secure
>> software to configure it to either pass through or reject transactions
>> made by that bus master. Rejected transactions may be configured to
>> either be aborted, or to behave as RAZ/WI. An interrupt can be
>> signalled for a rejected transaction. The AN505 has four
>> PL081 DMA controllers, each with its own MSC.
>>
>> Patches 10-15 are various minor cleanups and bugfixes in
>> the PL081 model that are needed for its use in the AN505.
>> In particular the PL081 was previously entirely broken as
>> it would hw_error() as soon as the guest enabled the DMA
>> engine. I assume this was either accidentally left-in debug code,
>> or a deliberate choice to guard a never-tested implementation
>> so as to be able to identify when we had guest code to test it
>> with. (Linux for the realview/versatile boards never tries to
>> use the PL08x there for DMA.)
>>
>> This patchset is sufficient for the "DMA" test in the AN505
>> self-test binary to pass. (I suspect it is not giving the
>> PL081 or MSC a very thorough workout, though.)
>>
>> Based-on: <20180730162458.23186-1-peter.maydell@linaro.org>
>> ("[PATCH 0/5] mps2: Implement FPGAIO counters and dual-timer")
>>
>> thanks
>> -- PMM
>>
>> Peter Maydell (16):
>>   hw/watchdog/cmsdk_apb_watchdog: Implement CMSDK APB watchdog module
>>   nvic: Expose NMI line
>>   hw/arm/iotkit: Wire up the watchdogs
>>   hw/arm/iotkit: Wire up the S32KTIMER
>>   hw/misc/iotkit-sysctl: Implement IoTKit system control element
>>   hw/misc/iotkit: Wire up the system control element
>>   hw/misc/tz-msc: Model TrustZone Master Security Controller
>>   hw/misc/iotkit-secctl: Wire up registers for controlling MSCs
>>   hw/arm/iotkit: Wire up the lines for MSCs
>>   hw/dma/pl080: Allow use as embedded-struct device
>>   hw/dma/pl080: Support all three interrupt lines
>>   hw/dma/pl080: Don't use CPU address space for DMA accesses
>>   hw/dma/pl080: Provide device reset function
>>   hw/dma/pl080: Correct bug in register address decode logic
>>   hw/dma/pl080: Remove hw_error() if DMA is enabled
>>   hw/arm/mps2-tz: Create PL081s and MSCs
>>
>>  Makefile.objs                            |   1 +
>>  hw/misc/Makefile.objs                    |   2 +
>>  hw/watchdog/Makefile.objs                |   1 +
>>  include/hw/arm/iotkit.h                  |  20 +-
>>  include/hw/dma/pl080.h                   |  71 +++++
>>  include/hw/misc/iotkit-secctl.h          |  14 +
>>  include/hw/misc/iotkit-sysctl.h          |  50 ++++
>>  include/hw/misc/tz-msc.h                 |  79 ++++++
>>  include/hw/watchdog/cmsdk-apb-watchdog.h |  59 ++++
>>  hw/arm/armv7m.c                          |   1 +
>>  hw/arm/iotkit.c                          |  99 ++++++-
>>  hw/arm/mps2-tz.c                         | 101 ++++++-
>>  hw/arm/realview.c                        |   8 +-
>>  hw/arm/versatilepb.c                     |   9 +-
>>  hw/dma/pl080.c                           | 113 ++++----
>>  hw/intc/armv7m_nvic.c                    |  19 ++
>>  hw/misc/iotkit-secctl.c                  |  73 ++++-
>>  hw/misc/iotkit-sysctl.c                  | 324 ++++++++++++++++++++++
>>  hw/misc/tz-msc.c                         | 308 +++++++++++++++++++++
>>  hw/watchdog/cmsdk-apb-watchdog.c         | 326 +++++++++++++++++++++++
>>  MAINTAINERS                              |   7 +
>>  default-configs/arm-softmmu.mak          |   3 +
>>  hw/intc/trace-events                     |   1 +
>>  hw/misc/trace-events                     |  16 ++
>>  hw/watchdog/trace-events                 |   6 +
>>  25 files changed, 1632 insertions(+), 79 deletions(-)
>>  create mode 100644 include/hw/dma/pl080.h
>>  create mode 100644 include/hw/misc/iotkit-sysctl.h
>>  create mode 100644 include/hw/misc/tz-msc.h
>>  create mode 100644 include/hw/watchdog/cmsdk-apb-watchdog.h
>>  create mode 100644 hw/misc/iotkit-sysctl.c
>>  create mode 100644 hw/misc/tz-msc.c
>>  create mode 100644 hw/watchdog/cmsdk-apb-watchdog.c
>>  create mode 100644 hw/watchdog/trace-events
>>
>> --
>> 2.17.1
> 
