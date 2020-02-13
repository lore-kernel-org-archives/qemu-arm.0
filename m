Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp683563lfp;
        Thu, 13 Feb 2020 06:38:22 -0800 (PST)
X-Google-Smtp-Source: APXvYqwTELgrWHj/1OAbYE03QoOG7NOqqbXWWVQZ1Nz78RHrknxHkKYacV/n3Hi3JJ6wlwjpDk3r
X-Received: by 2002:aed:33e2:: with SMTP id v89mr24278707qtd.162.1581604702389;
        Thu, 13 Feb 2020 06:38:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581604702; cv=none;
        d=google.com; s=arc-20160816;
        b=KTZuxEhSxj4Cvd7vYRBRJiQqku4zwrAvAcExkMZZdJzsqBfoiAMjRQi735Y54Ornxx
         HnC71XD0krhXBAQPIrWXUwwmHehV68BGEXqi3AQLWHTh4BE48Pjw9PFygXZp47hq5HWQ
         VkYmszx+nG9T07fbDx69UelQ/yfXUPjNlzTQV105/DJfGh+aziZzvD7bTNqkqXuG092Q
         CiFyslUAhcoiEq7Ao6YW4rDvsLWTc2iCUjyTsxZurADNclX0lWhBchhTrAN3ccWcoFQh
         XpNDq8NZL3BtsLDFnonI/3Oo1QXUkAJJHeIO3GLKAQCcLwv7VY1xORwfgigI78obe35/
         lAmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=zAI1e94//zbKhI9IURh5jRFx5EjhSpKeNLs/9PV0su8=;
        b=TWKeAiEwxvLTfwu7XzG941OiaOPTo6gX6d+2coOHMXqDEcApAsuxalXm6r0GhjGRf+
         taxKllYIAqS3aWXqL+j3nGnIPr/bpzMEknN0jhDRCPlPoHKxu4NHBRhtCKy0/f8ViFwE
         nEL/PemOl7Iq3DFdQa2RkLbL27A718siwm91TooGmkHIWsG/kRxnESA3l+2frnfQbf5V
         Y1vNRN9yZbauvf+FPbC9oC6PmacX1K+/tcLCB3JvV23ZeNDRFbKHQfPi/WtoHE5cPE/I
         xVyuAC3g3HtInZpgCh6GwUPFgx2m+reFLehwijlHlMo2CS5z2tr+IA/MZ4WVU+Dy8zIG
         FAdA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x53si1248479qtc.8.2020.02.13.06.38.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 Feb 2020 06:38:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j2FdE-0001RY-SS
	for alex.bennee@linaro.org; Thu, 13 Feb 2020 09:38:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59284)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <fangying1@huawei.com>) id 1j2Fd5-0001RN-Fg
 for qemu-arm@nongnu.org; Thu, 13 Feb 2020 09:38:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <fangying1@huawei.com>) id 1j2Fd2-0002Xc-7k
 for qemu-arm@nongnu.org; Thu, 13 Feb 2020 09:38:11 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2706 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <fangying1@huawei.com>)
 id 1j2Fd1-0002Ia-QY; Thu, 13 Feb 2020 09:38:08 -0500
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 3819C89C6ADD71460F86;
 Thu, 13 Feb 2020 22:37:57 +0800 (CST)
Received: from [127.0.0.1] (10.133.205.53) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.439.0; Thu, 13 Feb 2020
 22:37:50 +0800
Subject: Re: [PATCH v2 0/4] arm64: Add the cpufreq device to show cpufreq info
 to guest
To: Andrew Jones <drjones@redhat.com>
References: <20200213073630.2125-1-fangying1@huawei.com>
 <20200213081854.ewkk23yhnog23upj@kamzik.brq.redhat.com>
From: fangying <fangying1@huawei.com>
Message-ID: <68b913c3-76d8-c559-ea71-1510635bcbbd@huawei.com>
Date: Thu, 13 Feb 2020 22:37:48 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20200213081854.ewkk23yhnog23upj@kamzik.brq.redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
X-Originating-IP: [10.133.205.53]
X-CFilter-Loop: Reflected
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.190
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, zhang.zhanghailiang@huawei.com, mst@redhat.com,
 i.mitsyanko@gmail.com, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, guoheyi@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zYgfqPT0DwNJ



On 2020/2/13 16:18, Andrew Jones wrote:
> On Thu, Feb 13, 2020 at 03:36:26PM +0800, Ying Fang wrote:
>> On ARM64 platform, cpu frequency is retrieved via ACPI CPPC.
>> A virtual cpufreq device based on ACPI CPPC is created to
>> present cpu frequency info to the guest.
>>
>> The default frequency is set to host cpu nominal frequency,
>> which is obtained from the host CPPC sysfs. Other performance
>> data are set to the same value, since we don't support guest
>> performance scaling here.
>>
>> Performance counters are also not emulated and they simply
>> return 1 if read, and guest should fallback to use desired
>> performance value as the current performance.
>>
>> Guest kernel version above 4.18 is required to make it work.
>>
>=20
> This is v2 of the series, but I don't see a changelog.
>=20
Hi Andrew, please forgive my carelessness, I forget to add the changelog =
here.
Actually v2 is slightly modified with a few fixes for compilation
warning and a commit message.

> Can you please describe the motivation for this? If I understand
> correctly, all of this is just to inform the guest of the host's
> CPU0 nominal or max (if nominal isn't present?) frequency. Why
> do that?=20

Yes, you are right.

The motivation is that there seems no other formal way than the CPPC
feature for arm64 to present cpu frequency info to the OS. However on
x86 platform we have the CPUID method to do that. Some of our VM customer=
s
and cloud developers want that information to do something. So we come up
with the virtual cpufreq device way.

> What happens if the guest migrates somewhere where the
> frequency is different?=20

If the guest is migrated to any host where the frequency is different,
a next read on the CPPC related register may return the new cpufreq info.

> If this is for a special use case, then
> why not come up with a different channel (guest agent?) to pass
> this information?

Maybe some userspace apps need it to do perf tuning or they
want to know the accurate cpu nominal frequency by using tools
like lshw.

We use the CPPC cpufreq way because we think this is a much more
standard way to do that.
>=20
> Thanks,
> drew
>=20
>=20
> .
>=20

Thanks=EF=BC=8C
Ying

