Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp4786905wro;
        Mon, 29 Oct 2018 15:17:35 -0700 (PDT)
X-Google-Smtp-Source: AJdET5cG2dXkd0vB90Qfto5cvMv6+4ky8H4h8C+6aNGTYzsyRSVjCpZRfpYtDM9qtsymi1YtAQ4Z
X-Received: by 2002:ac8:1a3b:: with SMTP id v56-v6mr203522qtj.362.1540851455733;
        Mon, 29 Oct 2018 15:17:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540851455; cv=none;
        d=google.com; s=arc-20160816;
        b=pD6iUdCH8j0ogjEQ/3llG0rHokXJOddHAM6yFwK1Qz3ybNTZeXfJvXKSrhY1Mswy74
         5Tyenb5iX8dFWAyIDtnR/VkpOCVZgMu2yO6rKiOv+Gs8f7mSKM5ah9a4gA6ltWUFFkgc
         EQnsLSCBfkQgQeXrhN9Fowohycm/Y3nH//i2fSpT9rJrgcDkwfwN+mzwcHviEyLkKXYW
         n64gtSNpeybuKWQcyOeGodM/e1A3io3tbHr16sNrODJbLjrBfcLi5ZN59IneAuDuVCwl
         3sUuOD3VswSHNQjgI6vgVxvdjMUxQi38Xp1YKDPKWGY1Mm1ByZXuqBTAnfyKmrU0uS2I
         bS6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=uYuhyeXnysTy1Aqzbhz0qPZwY/cQNY+NBAGUVLgI+NQ=;
        b=DND8Z0AYU0GJ8dXVhhp4mC25Qi08qX4zGmqOqPHAKXujLvZBsCrD94ppfqTgKOqW4Q
         8aZPlvaWNvZJfJg7atIHG1aowa24I+eTOtTCcjVX7E/ln9Q1Y0YPTD8hO5VVAIO9yVzI
         BvDxwKBHQRyDLCFVtrn6zHdmWSnrRXpyB/51EVIPCQBS1aDbKGaQfBPaDZodbmX1CmXJ
         wHO6LpjwQIazUUrERcvv3YdisnwDLPOs8ds7u8MZ60Ar/Y+hLU9Zl1syMfJtYpiw1J2b
         LJRu3UC6CnCqCTGdQKAa4G4HiaQ2qVRpGS7uyjhbC+4IjGIrhhiLi1fJKwUD25wgxazH
         IR5g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b187-v6si3844951qkd.218.2018.10.29.15.17.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 29 Oct 2018 15:17:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49308 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gHFqo-00014O-Kk
	for alex.bennee@linaro.org; Mon, 29 Oct 2018 18:17:34 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60715)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gHFqW-00013Y-4z
	for qemu-arm@nongnu.org; Mon, 29 Oct 2018 18:17:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gHFqS-00071a-2X
	for qemu-arm@nongnu.org; Mon, 29 Oct 2018 18:17:16 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:36940)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gHFqR-00071A-PF
	for qemu-arm@nongnu.org; Mon, 29 Oct 2018 18:17:11 -0400
Received: by mail-wm1-f68.google.com with SMTP id p2-v6so9469035wmc.2
	for <qemu-arm@nongnu.org>; Mon, 29 Oct 2018 15:17:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=uYuhyeXnysTy1Aqzbhz0qPZwY/cQNY+NBAGUVLgI+NQ=;
	b=jv5eCeCaD9jDGQ8IGr42I8OxVM4bzdqWLeNK3D70VIQM/kzz7XJsaf36mfj+NM2wPJ
	qZaJKchkozWAdNU06mP1MvppjV8oFFWGPXfetiFIJmnthRn2xzJy5g0TqVxd/jbmvqM9
	hGKG0Gjz2LYeP9rBLRICPVFk0AfzzSJxNUFXXbrkgyZLvBfd+aRe/CHar3JnTKJx8mVd
	zLx1Jt9jpJUxWkkQFWNe3HkIIBUGtd60iktTbzRJ7MY+GeKs9RQjXBT2BrqQbRuLvssq
	faUEwIBdj9wO5yVhyFehaHZTL5HTz+2anjILIORpSo/2ry8XMu217fc4aKx3bKZ0wKrf
	yEFA==
X-Gm-Message-State: AGRZ1gL7q7yKwvnaflE2hYyzJcTxiG0YWTv2P+bRhoifkJs7/ZXDfeAZ
	z1R4d+bnNTDii3rsZedECnQYRg==
X-Received: by 2002:a1c:ee89:: with SMTP id j9-v6mr2781289wmi.58.1540851430622;
	Mon, 29 Oct 2018 15:17:10 -0700 (PDT)
Received: from [192.168.1.130] ([139.47.13.138])
	by smtp.gmail.com with ESMTPSA id
	l67-v6sm40118891wma.20.2018.10.29.15.17.07
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Oct 2018 15:17:09 -0700 (PDT)
To: Guenter Roeck <linux@roeck-us.net>
References: <1540548409-22560-1-git-send-email-thuth@redhat.com>
	<CAFEAcA8EubWya8ey9VxhaCw4m2U=KA+i2C-R9P-p+P6oEBBLew@mail.gmail.com>
	<7fc49925-36ff-bd9a-0cd7-e5f8d4bb3672@roeck-us.net>
	<CAFEAcA-UF+SyXvcU+NGZsbqBF2qg+s_x4HPU7yvf7B2G-=HPOg@mail.gmail.com>
	<b4f6cbd2-68fe-5b07-e8fb-93b1c4d8a6de@roeck-us.net>
	<2eb2b4ef-725d-cbee-1676-feb6bd800aea@redhat.com>
	<20181029202450.GB24689@roeck-us.net>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <034785b2-0126-e480-2f3f-2295152b11ae@redhat.com>
Date: Mon, 29 Oct 2018 23:17:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181029202450.GB24689@roeck-us.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 0/2] Deprecate the "collie"
 machine and Strongarm devices
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zs8BmDHUlMxB

On 29/10/18 21:24, Guenter Roeck wrote:
> On Mon, Oct 29, 2018 at 04:03:40PM +0100, Philippe Mathieu-Daudé wrote:
>> On 29/10/18 15:09, Guenter Roeck wrote:
>>> On 10/29/18 6:24 AM, Peter Maydell wrote:
>>>> On 27 October 2018 at 12:04, Guenter Roeck <linux@roeck-us.net> wrote:
>>>>> On 10/26/18 3:12 AM, Peter Maydell wrote:
>>>>>> Hi Guenter; there's a proposal here to deprecate (and eventually
>>>>>> remove) the 'collie' board (strongarm) from QEMU. Is that one of
>>>>>> the ones you're currently using in your automated testing of Linux
>>>>>> kernels on QEMU?
>>>>>>
>>>>>
>>>>> Yes. I can run the test with older versions of qemu, so it is ok for me
>>>>> if it is removed (as long as that removal is not backported).

[...]

>>> Though not all of them are supported by upstream qemu. For some of them I
>>> carry local patches,
>>> for others I use out-of-tree versions of qemu (beagle/beaglexm).
>>
>> Are these patches upstream-able?
>>
> 
> Some of the patches (eg to be able to boot a Linux kernel image for mps2-an385
> directly from qemu, or zynq CPU clock rate changes to be able to do the same)
> have been rejected. A few patches were submitted at some point but got lost.
> I don't keep track, so I don't know the exact number. For some patches, such
> as basic BCM283x CPRMAN support (needed to boot raspi2), a better
> implementation was suggested, but didn't go anywhere as far as I know.
> 
> Some machines, such as beagle support, are from Linaro's tree and were never
> upstreamed by Linaro. The Linaro branch is based off qemu 2.3, so applying
> the changes to upstream qemu would be a major effort. I also use the m68k
> branch from github.com:vivier/qemu-m68k.git for m68k tests.
> 
> I carry some 20+ patches locally in my qemu tree. Some may be obsolete or
> not or no longer needed (my understanding of qemu is evolving). Sometimes,
> if and when I find the time, I pick some and try to upstream, but I often
> don't follow up if there is no response or if the requested changes are
> too substantial.
> 
> Please feel free to have a look at https://github.com/groeck/qemu
> (check the <version>-local branches) and let me know what might be
> upstreamable. I'll be happy to (re-)submit the respective patches.
> Note that I won't be able to make any substantial changes, though.
> Time is a scarce commodity nowadays, unfortunately.

Thank you for pointing your work, I'll try to salvage what I can.

Regards,

Phil.
