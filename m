Received: by 10.223.188.70 with SMTP id a6csp1017739wrh;
        Wed, 23 Aug 2017 10:52:40 -0700 (PDT)
X-Received: by 10.55.125.71 with SMTP id y68mr3696069qkc.179.1503510760674;
        Wed, 23 Aug 2017 10:52:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1503510760; cv=none;
        d=google.com; s=arc-20160816;
        b=ODO1GtITjC7KW+ZtaI0h4yeF4CU+56EVKDg5C/mb/VnRqqfMv5o8mud8wtGJNTRqjt
         mcANud9w5g3WMZD7Y7g+keNKurrE/FI6O0GYLyH4KbT/GpBCxqsatsV9v9KIoOHzK9JB
         7HEcC9yC543wsFGU/RUN6dFAQJXJm1gZftSzX1QVxvqvfBpKQMz/1xpz7be6wRDaCENv
         ypraOOJ22W5E0F7k+OwVY9ILD7A/kHW0ig1tYhWYxScMK3kskDcacPbbEPbqr+cLO3Kr
         +Iy2wZEHEdu0ecvosVjqPRV9awNE0D/CeF7cSroZiBQwGeWIimC3wDWXGgfRpDC6TWCp
         FJkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=8PfwyriEYNa0zGIVRQ6YaRuwPvb+aq0huFvVPvxmpOQ=;
        b=ukpE4KGVvY8yiPyrnqlMmDM2iA9miRYlnk4lQUHQyfmHYrZeMZF+LesBasKpdmS202
         iz37FCaYvo60RNxYx55/01qmPxQkdk/rzre/Xpmos4ehQJBG3hB6eb/vbPifphREpzrq
         9PhWXrgDdTN4YkF56oAbE+oWXXGbHzmcXFviJqSierCqibG571kWnZWJmsjDwYreIRDx
         okydRNQy8jJdmCfztpt8sF9dnBIEiYfVuFUruqPkPty1OOEHqe/Ri/BtZ4Au6Q47NOua
         DbkNm9fvr+/Kq1CSGFI5wWP8yXoL+dMH51ZyDuZ0ZaNrNHPuKB97WQBEcHIeLmUDD3md
         wAMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=X6eshzMf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n6si1927010qkn.515.2017.08.23.10.52.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 23 Aug 2017 10:52:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=X6eshzMf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45055 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dkZpW-0001Ee-Bd
	for alex.bennee@linaro.org; Wed, 23 Aug 2017 13:52:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39860)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dkZol-0000eF-Qq
	for qemu-arm@nongnu.org; Wed, 23 Aug 2017 13:51:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1dkZok-0006g3-Uo
	for qemu-arm@nongnu.org; Wed, 23 Aug 2017 13:51:51 -0400
Received: from mail-wr0-x22b.google.com ([2a00:1450:400c:c0c::22b]:33887)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1dkZok-0006fZ-MV
	for qemu-arm@nongnu.org; Wed, 23 Aug 2017 13:51:50 -0400
Received: by mail-wr0-x22b.google.com with SMTP id p14so2785444wrg.1
	for <qemu-arm@nongnu.org>; Wed, 23 Aug 2017 10:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=8PfwyriEYNa0zGIVRQ6YaRuwPvb+aq0huFvVPvxmpOQ=;
	b=X6eshzMfQ+6AoLwfQKwdaw9oJ+SUIQwDYAENleRpSaOs0fLVzvwOHw1Pa+2p6uNfeJ
	rj47mEE3mpxI0xIRHnPeuDm/nI6rHrIUEixjil+iL19uTIXPh9RGFdnOOYOVP9GEpnVX
	mu7NtsuS8qm0244ofmpiNLJiN0wWxjUv804go=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=8PfwyriEYNa0zGIVRQ6YaRuwPvb+aq0huFvVPvxmpOQ=;
	b=nKaa3kZdh4W79iQqc9/FOXMOEVQNAZrr9O0RhPUBvslvva0tBQ2TanldEc+0qRS5SZ
	1TnzPbduwmDp0FFNUxz2bw1lh2KWfCxliEbb2cNDdFfd1R/HnPphp5GCCn27j9GDtQUW
	wVgfyu581ZDrIpL4poS4bIeqz/hs5AC7YNPsHrxUQP3u8OKpaR1LWLT0LkglaQEnq1eX
	3D4OfMnk7DfgN5oKkKQ821bECTXyGFOFWw76IMn6Y/3dWX32x/KhZeqzy5+4yEm53Yik
	eoYrHkuurbgatNDf5SafVSsBpiFUxYXJgWinxOr7ks377CownBPcRbovSBWqsuYak+a5
	CzPA==
X-Gm-Message-State: AHYfb5iswCL5GPQ1rANEq18XoRLEhKnjoCejCvWgNl9SS0uY52/ic327
	tVC9Xor9sT0pJJnhSHLs3e0Pep/3u20Y
X-Received: by 10.223.129.135 with SMTP id 7mr1955578wra.11.1503510709451;
	Wed, 23 Aug 2017 10:51:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.54 with HTTP; Wed, 23 Aug 2017 10:51:28 -0700 (PDT)
In-Reply-To: <20170823172118.GQ19998@localhost.localdomain>
References: <1503416789-32080-1-git-send-email-thuth@redhat.com>
	<20170823172118.GQ19998@localhost.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 23 Aug 2017 18:51:28 +0100
Message-ID: <CAFEAcA-DoQtTwCBFq-_JKPRMxcGq8-2QNnEJBu9STxtPWkB0bw@mail.gmail.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22b
Subject: Re: [Qemu-arm] [PATCH] hw/arm/allwinner-a10: Mark the allwinner-a10
 device with user_creatable = false
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
Cc: Beniamino Galvani <b.galvani@gmail.com>, Thomas Huth <thuth@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ec4DUo5DenxA

On 23 August 2017 at 18:21, Eduardo Habkost <ehabkost@redhat.com> wrote:
> On Tue, Aug 22, 2017 at 05:46:29PM +0200, Thomas Huth wrote:
>> QEMU currently exits unexpectedly when the user accidentially
>> tries to do something like this:
>>
>> $ aarch64-softmmu/qemu-system-aarch64 -S -M integratorcp -nographic
>> QEMU 2.9.93 monitor - type 'help' for more information
>> (qemu) device_add allwinner-a10
>> Unsupported NIC model: smc91c111
>>
>> Exiting just due to a "device_add" should not happen. Looking closer
>> at the the realize and instance_init function of this device also
>> reveals that it is using serial_hds and nd_table directly there, so
>> this device is clearly not creatable by the user and should be marked
>> accordingly.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>  hw/arm/allwinner-a10.c    | 2 ++
>>  scripts/device-crash-test | 1 -
>>  2 files changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
>> index f62a9a3..43a3f01 100644
>> --- a/hw/arm/allwinner-a10.c
>> +++ b/hw/arm/allwinner-a10.c
>> @@ -118,6 +118,8 @@ static void aw_a10_class_init(ObjectClass *oc, void *data)
>>      DeviceClass *dc = DEVICE_CLASS(oc);
>>
>>      dc->realize = aw_a10_realize;
>> +    /* Reason: Uses serial_hds in realize and nd_table in instance_init */
>> +    dc->user_creatable = false;
>
> I assume this patch will be replaced by one changing TYPE_DEVICE
> to default to user_creatable=false, based on the replies to the
> hw/misc/auxbus.c patch?

user-creatable and hotplug are different things -- most
devices are user-creatable, many fewer are hotpluggable.
So the tradeoff for the default doesn't *necessarily* go
the same way.

thanks
-- PMM
