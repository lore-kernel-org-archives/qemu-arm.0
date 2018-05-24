Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp2110305wre;
        Thu, 24 May 2018 10:21:02 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKLQrzhGDPJXMUY4qecV8puO4wLqUq4YCZ5YH8/e1i3vY0LF+AQATtz9F6ODvqrdEbrcq9vO
X-Received: by 2002:aed:374a:: with SMTP id i68-v6mr1079820qtb.129.1527182462009;
        Thu, 24 May 2018 10:21:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527182462; cv=none;
        d=google.com; s=arc-20160816;
        b=XOGo0AyFMUFcJ+RxNg61Yb2mz3WOv8m/WHtxmcMvNMnf5HjPGZ96VLt+nCDj46bt+a
         uBCWKwNm+1F26WT66X2i1L8imO0tKY3Gm8rYMYwc3ej72rVo81XPSxsv4ucv1sahevKm
         wky+5BVZ8rQFrsK3qNL4DollaU4RcVXQCKq1lFz0V9GrgCbkitxKWLeANOi29xejWS9Y
         5xuWir28SEUqczKn9JDHh2VIo9bIHr9qkOqE0kPc59NCIICSik1K34K+P2RPocx0z0Hy
         a0tugc7NDWc7fJZDMTX+zjgpU4a5VXGyyg9j6DQbC+4sqeLf9UT97VeOtxu0xcpZzVCw
         lIdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to
         :arc-authentication-results;
        bh=tkdT2h6D77jNiAs0RArABaz+BPTMwXGURHb35Z29Mek=;
        b=msbNzIpeaVnqOFAy7gyyZf882vWHa7KT0GykfPN92hyha9JM4TkQrXVLYhm2efzPik
         uzKYfF2ExceqZpLQNbvfnMkvijD6xT5BwJ6mKdBo/grlqiwpXPE8Mj8sqFRO0NO1Atd3
         yM+3e/OZZyfi7Th65PMJ2usQVnkCXktjBq9XJ+QmCopgiQV06Xf/V0VF7gU7GoEno9GY
         T4dGApULHt23rFQvrEOB0HzEiCR76okcCksiysklE6fbnB3Eg4nMJYJrauUzKA1W9nJL
         mCAg/4rWdetfwIbkIdn1WPl939fQofSUN28AII8l9q2sbvZEMpAd2Riba81Na1O6h8JI
         5hZA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b26-v6si3045392qto.48.2018.05.24.10.21.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 24 May 2018 10:21:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39922 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fLtvB-0001d7-Hg
	for alex.bennee@linaro.org; Thu, 24 May 2018 13:21:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50101)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1fLtv4-0001cp-As
	for qemu-arm@nongnu.org; Thu, 24 May 2018 13:20:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1fLtuz-0003s4-DQ
	for qemu-arm@nongnu.org; Thu, 24 May 2018 13:20:54 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:34898 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lersek@redhat.com>)
	id 1fLtuz-0003rg-8D; Thu, 24 May 2018 13:20:49 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D2B19BB414;
	Thu, 24 May 2018 17:20:48 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-121-84.rdu2.redhat.com
	[10.10.121.84])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3DFC32026985;
	Thu, 24 May 2018 17:20:47 +0000 (UTC)
To: Ard Biesheuvel <ard.biesheuvel@linaro.org>
References: <1527091418-11874-1-git-send-email-eric.auger@redhat.com>
	<ec6bc0b3-5f0b-bf0c-7d9b-0382e114ee9e@redhat.com>
	<bf99311a-823d-34e8-1892-be27534afc32@redhat.com>
	<22c4e504-a7b4-e6dd-b2cc-618d306b6f0c@redhat.com>
	<CAFEAcA9LMV_-vVAwUkuY=uw2Gf6XLvsgmi8y0PgHPJnQZkWC0w@mail.gmail.com>
	<550464ac-5155-6311-d0f7-92c7c0813f82@redhat.com>
	<CAFEAcA-hobu_=VKhYQ+UZ1WX_JFfwCarkPKQhiBtXc3fre57rg@mail.gmail.com>
	<ee204f5f-600f-2425-a1ff-0418b4611e96@redhat.com>
	<CAKv+Gu8Lp7gUqdurVSYF2wVP0TPHY7Vox5J8ZdT=g0UytoKOUg@mail.gmail.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <e5dc23df-6400-d9ea-ef83-814663b35ef9@redhat.com>
Date: Thu, 24 May 2018 19:20:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CAKv+Gu8Lp7gUqdurVSYF2wVP0TPHY7Vox5J8ZdT=g0UytoKOUg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Thu, 24 May 2018 17:20:48 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Thu, 24 May 2018 17:20:48 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'lersek@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC 0/2] ARM virt: Support up to 256
 PCIe buses
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Auger Eric <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1a4+P8JVn8s8

On 05/24/18 16:14, Ard Biesheuvel wrote:
> On 24 May 2018 at 15:59, Laszlo Ersek <lersek@redhat.com> wrote:
>> On 05/24/18 15:07, Peter Maydell wrote:
>>> On 24 May 2018 at 13:59, Laszlo Ersek <lersek@redhat.com> wrote:
>>>> On 05/24/18 11:11, Peter Maydell wrote:
>>>>> Won't it also break a guest which is just Linux loaded not via
>>>>> firmware which is an aarch32 kernel without LPAE support?
>>>>
>>>> Does such a thing exist? (I honestly have no clue.)
>>>
>>> Yes, it does; LPAE isn't a mandatory kernel config option.
>>> This is why we have the machine 'highmem' option, so that
>>> we can run on those kernels by not putting anything above
>>> the 4G boundary. Looking back at the history on that, we
>>> opted at the time for "default to highmem on, and if you're
>>> running an non-lpae kernel you need to turn it off manually".
>>
>> Ah, OK, I didn't know that.
>>
>>> So we can handle those kernels by just not putting ECAM
>>> above 4G if highmem is false.
>>
>> The problem is we can have a combination of 32-bit UEFI firmware (which
>> certainly lacks LPAE) and a 32-bit kernel which supports LPAE.
>> Previously, you wouldn't specify highmem=off, and things would just work
>> -- the firmware would simply ignore the >=4GB MMIO aperture, and use the
>> 32-bit MMIO aperture only (and use the sole 32-bit ECAM). The kernel
>> could then use both low and high MMIO apertures, however (I gather?).
>>
>> The difference with "high ECAM" is that it is *moved* (not *added*), so
>> the 32-bit firmware is left with nothing for config space access. For
>> booting the same combination as above, you are suddenly forced to add
>> highmem=off, just to keep the ECAM low -- and that, while it keeps the
>> firmware happy, prevents the LPAE-capable kernel from using the high
>> MMIO aperture.
>>
>> So I think "highmem_ecam" should be computed like this:
>>
>>   highmem_ecam = highmem_ecam_machtype_default &&
>>                  highmem &&
>>                  (!firmware_loaded || aarch64);
>>
> 
> Given that the firmware is tightly coupled to the platform, we may
> decide not to care about ECAM for UEFI itself, and invent a secondary
> config space access mechanism that does not consume such a huge amount
> of address space. For instance, legacy PCI uses a pair of I/O ports
> for this, one to set the address and one to perform the actual read or
> write, and we could easily implement something similar (such an
> interface is problematic in SMP context but we don't care about that
> anyway)
> 
> Just a thought - perhaps we don't care enough about 32-bit to go
> through the trouble, but it would be nice if LPAE capable 32-bit
> guests could make use of the expanded PCIe config space as well.

Under the above proposal, they could, they'd just have to be launched
without firmware:

  highmem_ecam_machtype_default = true;
  highmem = true;
  firmware_loaded = false;
  aarch64 = false;

  highmem_ecam = true &&
                 true &&
                 (!false || false);

I see a return to the 0xCF8/0xCFC pattern regressive; I'd rather
restrict the large/high ECAM feature to 64-bit guests (with or without
firmware), and to 32-bit LPAE kernels that are launched without firmware
(which, I think, has been the case for most of their history).

Personally I don't have a stake in 32-bit ARM, so do take my opinion
with a grain of salt. Wearing my upstream ArmVirtQemu co-maintainer hat,
my sole 32-bit interest is in keeping command lines working, *if* they
once worked. Not extending new QEMU features to 32-bit firmware is fine
with me -- in fact I would value that over seeing more quirky firmware
code just for 32-bit's sake.

Side topic: the last subcondition basically says, "IF we use firmware
THEN the VM had better be 64-bit". This is a "logical implication":
A-->B. The C language doesn't have an "implication operator", so I
rewrote it equivalently with the logical negation and logical OR
operators: A-->B is equivalent to (!A || B). (If A is true, then B must
hold; if A is false, then B doesn't matter.)

Thanks,
Laszlo
