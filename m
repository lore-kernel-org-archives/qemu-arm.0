Received: by 10.25.0.6 with SMTP id 6csp376352lfa;
        Wed, 17 May 2017 12:04:24 -0700 (PDT)
X-Received: by 10.55.65.133 with SMTP id o127mr287086qka.71.1495047864705;
        Wed, 17 May 2017 12:04:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495047864; cv=none;
        d=google.com; s=arc-20160816;
        b=UMn5OYGfm7wNf+MSt/hRaiK9tx0mY6MgDe+vOVK4wAhOYqW3eo4yz/6K55hw6bpSge
         JJ9e5LURBoeVqQIma3yf1NxYuR0zrZX+tqqwYzgXkei/n7jFKhSCf6DE2UVuR4VSWR74
         RIeNmKK8ZcP1weDXoXOkwncNYDG+UhhAGttf3dUDNfpVTZ76or81gM86rtzs+Xqjbziu
         E2N/K3whY3AQMb8i+UNwlJJtnlY1pdkLzDOJRtgNAJzGMIwadXkDHVbTy0vn29IIaaE5
         lAAOHUn2JpDhA7djfNqIPecxam7fSZ110plu+ZAXSVILpU+eWYHulKrc6auJX6QvRmNP
         ZbBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-filter
         :dmarc-filter:arc-authentication-results;
        bh=1rFe2K8YRcMse7NARcwbPcgEOgV22qopde8mF839AmI=;
        b=DGP9edcv3fCIDqbSTnMEI+bVfUueVuc+Eh6qTfSLNC1G077d2ogQKlT5v//KB582yY
         ypFG8cHFHwQSiTdhvf/mSQ58Ic0/FIO9O9lkOiXNMYjHl8vCJ+LvjoNaB8ZH7di6XFKV
         dFai4wbrHGApiiErOzvvcL/iGNikBL3VvccHWxlwpg0WiELqnF3u01aagzWETUCwFFbW
         jav24Y7+jdocPm2Dve86R0qfB54kCMb9bF7G0aGVFpUmKLxWm9mnDh9luk/uEogqV7T3
         irKWNtmTxfJm5Is2lLN9W8TXt5s17W07gypGVgLaKe2+J7lGhh5OHk8Lh4C5p2xYEG7I
         pkMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d46si2963357qtc.150.2017.05.17.12.04.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 17 May 2017 12:04:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50417 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dB4FE-0008Dh-7L
	for alex.bennee@linaro.org; Wed, 17 May 2017 15:04:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40833)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1dB4FA-0008DY-9x
	for qemu-arm@nongnu.org; Wed, 17 May 2017 15:04:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1dB4F7-0005pj-5x
	for qemu-arm@nongnu.org; Wed, 17 May 2017 15:04:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42998)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jsnow@redhat.com>)
	id 1dB4F6-0005o5-Tn; Wed, 17 May 2017 15:04:17 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BFB0A5F7B6;
	Wed, 17 May 2017 19:04:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com BFB0A5F7B6
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=jsnow@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com BFB0A5F7B6
Received: from scv.usersys.redhat.com (dhcp-17-221.bos.redhat.com
	[10.18.17.221])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 76256189B4;
	Wed, 17 May 2017 19:04:13 +0000 (UTC)
To: Eric Blake <eblake@redhat.com>, John Bradley <flypie1@yahoo.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <684185116.2952708.1495044580181.ref@mail.yahoo.com>
	<684185116.2952708.1495044580181@mail.yahoo.com>
	<3293e70a-71ac-2e6d-433f-06346ad253c9@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <e3ea0ce5-5977-b6c7-ace4-ea5f1caa540f@redhat.com>
Date: Wed, 17 May 2017 15:04:13 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.0
MIME-Version: 1.0
In-Reply-To: <3293e70a-71ac-2e6d-433f-06346ad253c9@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Wed, 17 May 2017 19:04:15 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] Add Markus Armbrusters code for
 Broadcom Perhiperals for ARM.
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
	Geert Martin Ijewski <gm.ijewski@web.de>,
	John Bradley <flypie@rocketmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: H6qdEZAi4+CD



On 05/17/2017 02:27 PM, Eric Blake wrote:
> On 05/17/2017 01:09 PM, John Bradley via Qemu-devel wrote:
>> Also available at 
>>
>> https://www.dropbox.com/s/gwuquw0kirstw7a/0001-Add-Markus-Armbrusters-code-for-Broadcom-Perhiperals.patch?dl=0
> 
> This content belongs...
> 
>>
>> Following suggestions split my original patch up. This the largest monolithic chunk is 
>> additional BCM device support from Markus Armbruster.
>>
>>
>> >From 0b39a04030d5a2cea4fcd2159d365580ca155b78 Mon Sep 17 00:00:00 2001
>> From: John Bradley <flypie@rocketmail.com>
>> Date: Wed, 17 May 2017 18:57:21 +0100
>> Subject: [PATCH] Add Markus Armbrusters code for Broadcom Perhiperals for ARM.

Also, though your patch body says `Subject: [PATCH]`, your actual email
subject does not. It should so that the build bot and maintenance tools
can find it appropriately.

The next version of this that gets sent should also carry the 'v2' tag.

--js

>>
>> Signed-off-by: John Bradley <flypie@rocketmail.com>
> 
> I would expect that if some of this code was written by Markus, then it
> would carry his Signed-off-by.  Or, maybe you just mean that you are
> splitting your patch according to the device Markus gave (in which case,
> a Suggested-by: tag may be appropriate).  Either way, I don't see why
> Markus' name has to be in the subject line (the patch subject should be
> WHAT changed, not WHO suggested the change).
> 
>> ---
> 
> ...here, after the --- separator.  It is useful to reviewers, but should
> not end up as part of the actual commit message.
> 
>> hw/arm/Makefile.objs                 |    2 +-
>> hw/arm/bcm2835.c                     |  114 ++++
>> hw/arm/bcm2835_peripherals.c         |  104 ++++
>> hw/misc/Makefile.objs                |    2 +
>> hw/misc/bcm2835_mphi.c               |  163 ++++++
>> hw/misc/bcm2835_power.c              |  106 ++++
>> hw/timer/Makefile.objs               |    2 +
>> hw/timer/bcm2835_st.c                |  202 +++++++
>> hw/timer/bcm2835_timer.c             |  224 +++++++
>> hw/usb/Makefile.objs                 |    4 +-
>> hw/usb/bcm2835_usb.c                 |  604 +++++++++++++++++++
>> hw/usb/bcm2835_usb_regs.h            | 1061 ++++++++++++++++++++++++++++++++++
> 
> That's still rather large to review in one chunk, especially while
> touching other files.   It can probably still be split up further.
> 
>> include/hw/arm/bcm2835.h             |   37 ++
>> include/hw/arm/bcm2835_peripherals.h |   10 +
>> include/hw/intc/bcm2835_control.h    |   53 ++
>> include/hw/misc/bcm2835_mphi.h       |   28 +
>> include/hw/misc/bcm2835_power.h      |   22 +
>> include/hw/timer/bcm2835_st.h        |   25 +
>> include/hw/timer/bcm2835_timer.h     |   32 +
>> include/hw/usb/bcm2835_usb.h         |   78 +++
>> 20 files changed, 2871 insertions(+), 2 deletions(-)
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
>>
> 
