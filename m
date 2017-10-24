Received: by 10.223.161.27 with SMTP id o27csp469885wro;
        Tue, 24 Oct 2017 04:06:50 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+QUDP3fys27ZHvYYmhPvsSNppW46bWFs3nq21vWkFJf1TYP4hjhRUNOvvli6Sf7fhRdg+dE
X-Received: by 10.129.53.205 with SMTP id c196mr10132483ywa.82.1508843210520;
        Tue, 24 Oct 2017 04:06:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508843210; cv=none;
        d=google.com; s=arc-20160816;
        b=qrLLVyPAXPKgPtfXWFHO8JbxYmEg5xWbkrWoikFOgDoSp5PbVL1vJGfL1uExlZnIO0
         uqyy9IJZfCaMY2C1xNl4rk09JrBtsNMlmG7A6+BzqVlIyJsnneP3jVURqTy0hpzokRaK
         smlYjX+iQS5RiGXzuzQ+Ino/3jJJKCqFbaR0uTXu8VXhaPxay72MyXBT97Wqm+7f2vov
         ruqADyWBksBl0TZTN88vyO/9HgMexCrUqTYKKSaOEYQfsVkEslCK45sdMlfIFzgG0VqU
         9ow3z6DWBKVcRpoJC60BTQNrCuy1mRoWj6z5VJcz7hAUgiES8wnpAWc2WYX/lUu0q8jL
         oSSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :references:message-id:in-reply-to:to:from:date
         :arc-authentication-results;
        bh=IW6lRgE+yDgYBrZ0/D1760tlg5RkyU/lN6b3tmr5/Oc=;
        b=V0nm61QdoGeYLFfqD4KBDgoqQI78TFAzTJvD65oi/iBjZLqKrWWQLLnzTbzLZ+Iz82
         RIVV3gOudbkCo+KRdmvTm1joa+1QJVgQbLQRUX5pVcZlN/83QOAN7iGsf7JhQOUB3ITT
         7qfifos6/C/lNiZHGRT9vr8/lgm/n+jrbNoF0RHhPClQ2Ga2DcbVbFc4UUuHzd4b+3vm
         /akdB4V6MNRBBAm5+7nKWEsn+fMUktge0XTGO9/8vuO1IYZv+bM9loVQMqD7SUDM9TM2
         Tg1fTtj9SWmcyI1osWszQl9HXoEZPmkCX0dtaasUXDqEb+EpZzRA7IyezXE/a/NMaNfu
         A32Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e30si3784ybi.512.2017.10.24.04.06.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 24 Oct 2017 04:06:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43164 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e6x2o-0007AU-0D
	for alex.bennee@linaro.org; Tue, 24 Oct 2017 07:06:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56018)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1e6x1o-0006rb-0p
	for qemu-devel@nongnu.org; Tue, 24 Oct 2017 07:05:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1e6x1m-000144-58
	for qemu-devel@nongnu.org; Tue, 24 Oct 2017 07:05:48 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:15867)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
	id 1e6x1h-0000yv-3m; Tue, 24 Oct 2017 07:05:41 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
	by localhost (Postfix) with SMTP id 3E2B17456B1;
	Tue, 24 Oct 2017 13:05:33 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
	id C47237456A0; Tue, 24 Oct 2017 13:05:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zero.eik.bme.hu (Postfix) with ESMTP id C3DE77456AF;
	Tue, 24 Oct 2017 13:05:32 +0200 (CEST)
Date: Tue, 24 Oct 2017 13:05:32 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: bzt bzt <bztemail@gmail.com>
In-Reply-To: <CADYoBw1ksGDo26-PC4eMnyqxZQoZkXNLDeGoWfcRHs-SfTCJkw@mail.gmail.com>
Message-ID: <alpine.BSF.2.21.1710241246330.82180@zero.eik.bme.hu>
References: <CADYoBw2dogvU6-3vChG4js0BNdyTPG8eDvMSRoU50eTX_9DdEQ@mail.gmail.com>
	<MWHPR21MB01590CD596A992C93E01B5079E460@MWHPR21MB0159.namprd21.prod.outlook.com>
	<CADYoBw1ksGDo26-PC4eMnyqxZQoZkXNLDeGoWfcRHs-SfTCJkw@mail.gmail.com>
User-Agent: Alpine 2.21 (BSF 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 152.66.115.2
Subject: Re: [Qemu-devel] [PATCH] BCM2837 and machine raspi3
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xFdrl3FVYz49

On Tue, 24 Oct 2017, bzt bzt wrote:
> On Mon, Oct 23, 2017 at 6:34 PM, Andrew Baumann <Andrew.Baumann@microsoft.com> wrote:
>>> +/* According to
>>> https://www.raspberrypi.org/documentation/hardware/raspberrypi/bcm2837/
>>> README.md
>>> + * The underlying architecture of the BCM2837 is identical to the
>> BCM2836.
>>> The only significant
>>> + * difference is the replacement of the ARMv7 quad core cluster with a
>>> quad-core ARM Cortex A53
>>> + * (ARMv8) cluster. So we use cortex-a53- here. */
>>
>> Are there any changes from bcm2836 other than the CPU model?
>
>
>> Duplicating the whole file just to have a different CPU seems like a bad
>> idea to me. I would suggest parameterising the CPU model in bcm2836 (and
>> maybe noting in header comments etc. that it can also model 2837), and then
>> instantiating it from raspi.c with the correct CPU type depending on which
>> machine is being used. That will also reduce the size of the patch
>> significantly, which will make it easier to get it reviewed.
>>
>
> For now, there's no more difference in the emulation than the CPU, but
> BCM2837 has a lot more to offer (40 bit address space, wifi, bluetooth
> etc.). So sooner or later it will need it's own source file to support all
> of that without getting the code messy. I have asked Peter whether it does
> worth writing future proof code, or keep the change at the bare minimum,
> but had no answer yet.
>
>
>>
>> (Alternatively, if there are minor but non-trivial differences between
>> 2836 and 2837 other than the CPU model, you may want to create something
>> like bcm2835_peripherals that contains all the functionality common to
>> both. But I suspect that isn't the case here.)
>>
>
> Well, bcm2837 is backward compatible with the bcm2836, but has a lot more
> registers and a different boot up process (different address and no atags).
> The common functionality is already in bcm2835_peripherals, and the MMIO
> address change from bcm2835 to bcm2836 has already been added by you.
> What's different is a lot more devices, which imho would be unwise to add
> to bcm2835 or either to bcm2836. So to be future proof I've created a
> separated file, but you are right at the current level of emulation it's
> not necessary.
[...]
>> Similarly, this looks like a clone of raspi2_init. I think it would be
>> better to have one function, parametrised if needed.
>>
>
> For now, yes. But the extra devices bcm2837 have will need extra
> initialization, and I though it would be clearer to separate in advance.
> Again, I've asked Peter about this, but had no response. As I see having a
> parametrised single function is simplier for now, but could lead to a messy
> code later when all the SoC features will be added. But I'm ain't no expert
> on qemu source, this is my first patch, so I'm open to suggestions! :-)
>
> Summa summarum, which one is preferred? Think of the future or keep it at a
> bare minimum?

I don't feel I have a deciding word in this but to share my opinion I 
think it's better to keep it in one file avoiding too much code 
duplication as long as those features that would make the implementations 
different aren't added now. Then when those features are added the files 
could be split or the best way can be decided at that point based on how 
those features will be implemented so no need to think that far ahead now. 
This would make patches easier to review now and maintaining the common 
code easier until they are different enough so a split needs to be done.

Regrads,
BALATON Zoltan
