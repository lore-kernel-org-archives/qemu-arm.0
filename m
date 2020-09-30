Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp5431985lfq;
        Wed, 30 Sep 2020 04:34:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwQ7Ioo1ZWq8N5wDcC85niYkqIab4L6AJWXAAO/nh0b1toE6a/VZ3nBAt2RGDBp51glFyg6
X-Received: by 2002:a25:d988:: with SMTP id q130mr2650702ybg.9.1601465673803;
        Wed, 30 Sep 2020 04:34:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601465673; cv=none;
        d=google.com; s=arc-20160816;
        b=kiQ8fHenr1OTE95Kb5luEUd03s83arZIyRLvRbs63g+nxFZKECH54HJCiv+awPs5j4
         MUztOI2Xr2H0s06xGLjSb+A37iitU8W3X8QxUHKILzLJ5EPqvgcY1pEWpCAxoOTWYLQ3
         ZV0mqBqaxwpqW+vzlAFR1l7xfXl+nyKYxEeqZXWvLHfKRALF223dYqhEqauff/UaPnWA
         WCK7MQ2dvP9Wny0lYUkdGT0TSKhjGwPLw89UvcDyi5eFpDaxarhfzJbrIPcCxhqok/4r
         84ZCflCF1GBhn8xnuWgkI2wWEZDfto9PVlc3TwGB1miCmBWQ0qXcse0GlRrkokrdnday
         4K+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:to:subject:dkim-signature;
        bh=yGzZAb6CUUfvuB+rABpzetf5qwBH7y5IfxJJd8oY32Y=;
        b=OyvnJYmyE1grm8/rXfFWfTdOA/NbklyTvFQU9q+juQmQg7d00xbjGd+SojAp9T2GHp
         evWYb8DYuacJ1vGGRJxMyPnnZUzB6Mfjc4LuWpunztLBaIdMOCCZZuyx+ROwkxHGZAGb
         IZk5+59y/3gQ2nWum10nix8Pqf3UGnqMp8hMDFxNh7q+r7CVZgDSWPF1q/g1r8hc1xsE
         oATZFitXRMYCXBXPQrBLhYdZriIuR+fqxUKBh9mAdv5ZYI+SPAQ0Gd48iAcLEx8OZE4y
         pRFTbEYeI8qJK61MROWqHyXa13Bxsdznlh/H6VFT0sFZ7BLvkF1iCNuqtiuwouFmPXaO
         TLoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KU05lpqw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c3si1561421yba.139.2020.09.30.04.34.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Sep 2020 04:34:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=KU05lpqw;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kNaNV-0007lG-2h
	for alex.bennee@linaro.org; Wed, 30 Sep 2020 07:34:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kNaNF-0007iz-8n
 for qemu-arm@nongnu.org; Wed, 30 Sep 2020 07:34:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kNaN8-0004C1-Cm
 for qemu-arm@nongnu.org; Wed, 30 Sep 2020 07:34:15 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601465648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=yGzZAb6CUUfvuB+rABpzetf5qwBH7y5IfxJJd8oY32Y=;
 b=KU05lpqwUylMBQ1JUI5o4oRuxy0X9Lre8EZyEEQ4VbZVH0cIIRuCVfsAjzNLSUPlV7q7AR
 4LG5w34DXxWEAQTw0M5qJgvKKiur3V0Gtzes4e9oxoMkFaoG1ceP6yB6XuvKFpP8fEbYhD
 4q6VgCcoqnr2/Zt2P+LCKOaEWZ+bR5Y=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-DQd6pszbNCa2Texz2Jq3bA-1; Wed, 30 Sep 2020 07:34:04 -0400
X-MC-Unique: DQd6pszbNCa2Texz2Jq3bA-1
Received: by mail-wm1-f71.google.com with SMTP id x6so514391wmi.1
 for <qemu-arm@nongnu.org>; Wed, 30 Sep 2020 04:34:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=yGzZAb6CUUfvuB+rABpzetf5qwBH7y5IfxJJd8oY32Y=;
 b=XEjpMPuKH0KQwB6L3e8ZS5u00cReK2h0TMxNowu8jLEk1qw7x9yka/9jVbPcGKf59F
 V1smGPPEZqpuTtpdVI98B/pwaTz/xGBvwgvlFinDB6R8KSnS7uni+c6TGguGFbPWXAmB
 jUeyWA/f1rOyI88FrWtDf455PCsQrMa4UXPvWH12GS2ze07sVdxKtR+QD3OWI1Zncf0i
 r8mW0NOpDprxYhL+WG4n/Oqn+4zQkr9KrLaa3TWbFdwm+yr9mvV38XiPkiis6JIvsixc
 CPAqZi+uiMAD+xl4iECkgEU+lRHB8D+jB0nzdGtGg3RegvNMX05sPoyFh9yv901JOPbT
 4WqA==
X-Gm-Message-State: AOAM5331MG8ulfRgNTyJV+b/NqbZYbXbWUjtByMTdaDT0NizIP3kHitE
 U3R64CsbS35a1KtrnmjY247fUVNsK8qzQosgEU6snTKLsG5mBEcfakAaetKLtttD7//tnS9gaXo
 1ttWNkti02FWd
X-Received: by 2002:adf:ab46:: with SMTP id r6mr2782764wrc.360.1601465643250; 
 Wed, 30 Sep 2020 04:34:03 -0700 (PDT)
X-Received: by 2002:adf:ab46:: with SMTP id r6mr2782743wrc.360.1601465643018; 
 Wed, 30 Sep 2020 04:34:03 -0700 (PDT)
Received: from [192.168.1.36] (74.red-83-53-161.dynamicip.rima-tde.net.
 [83.53.161.74])
 by smtp.gmail.com with ESMTPSA id 92sm2673330wra.19.2020.09.30.04.34.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Sep 2020 04:34:02 -0700 (PDT)
Subject: Re: [PATCH] hw/arm: Restrict APEI tables generation to the 'virt'
 machine
To: Dongjiu Geng <gengdongjiu@huawei.com>, qemu-devel@nongnu.org
References: <20200929125609.1088330-1-philmd@redhat.com>
 <12be4400-c37f-2b7f-2f15-f8700dad6003@huawei.com>
 <056736d8-dc89-a94b-7e76-93825492c957@redhat.com>
 <5b5e1b32-0e9b-8154-e645-9b922119db33@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Autocrypt: addr=philmd@redhat.com; keydata=
 mQINBDXML8YBEADXCtUkDBKQvNsQA7sDpw6YLE/1tKHwm24A1au9Hfy/OFmkpzo+MD+dYc+7
 bvnqWAeGweq2SDq8zbzFZ1gJBd6+e5v1a/UrTxvwBk51yEkadrpRbi+r2bDpTJwXc/uEtYAB
 GvsTZMtiQVA4kRID1KCdgLa3zztPLCj5H1VZhqZsiGvXa/nMIlhvacRXdbgllPPJ72cLUkXf
 z1Zu4AkEKpccZaJspmLWGSzGu6UTZ7UfVeR2Hcc2KI9oZB1qthmZ1+PZyGZ/Dy+z+zklC0xl
 XIpQPmnfy9+/1hj1LzJ+pe3HzEodtlVA+rdttSvA6nmHKIt8Ul6b/h1DFTmUT1lN1WbAGxmg
 CH1O26cz5nTrzdjoqC/b8PpZiT0kO5MKKgiu5S4PRIxW2+RA4H9nq7nztNZ1Y39bDpzwE5Sp
 bDHzd5owmLxMLZAINtCtQuRbSOcMjZlg4zohA9TQP9krGIk+qTR+H4CV22sWldSkVtsoTaA2
 qNeSJhfHQY0TyQvFbqRsSNIe2gTDzzEQ8itsmdHHE/yzhcCVvlUzXhAT6pIN0OT+cdsTTfif
 MIcDboys92auTuJ7U+4jWF1+WUaJ8gDL69ThAsu7mGDBbm80P3vvUZ4fQM14NkxOnuGRrJxO
 qjWNJ2ZUxgyHAh5TCxMLKWZoL5hpnvx3dF3Ti9HW2dsUUWICSQARAQABtDJQaGlsaXBwZSBN
 YXRoaWV1LURhdWTDqSAoUGhpbCkgPHBoaWxtZEByZWRoYXQuY29tPokCVQQTAQgAPwIbDwYL
 CQgHAwIGFQgCCQoLBBYCAwECHgECF4AWIQSJweePYB7obIZ0lcuio/1u3q3A3gUCXsfWwAUJ
 KtymWgAKCRCio/1u3q3A3ircD/9Vjh3aFNJ3uF3hddeoFg1H038wZr/xi8/rX27M1Vj2j9VH
 0B8Olp4KUQw/hyO6kUxqkoojmzRpmzvlpZ0cUiZJo2bQIWnvScyHxFCv33kHe+YEIqoJlaQc
 JfKYlbCoubz+02E2A6bFD9+BvCY0LBbEj5POwyKGiDMjHKCGuzSuDRbCn0Mz4kCa7nFMF5Jv
 piC+JemRdiBd6102ThqgIsyGEBXuf1sy0QIVyXgaqr9O2b/0VoXpQId7yY7OJuYYxs7kQoXI
 6WzSMpmuXGkmfxOgbc/L6YbzB0JOriX0iRClxu4dEUg8Bs2pNnr6huY2Ft+qb41RzCJvvMyu
 gS32LfN0bTZ6Qm2A8ayMtUQgnwZDSO23OKgQWZVglGliY3ezHZ6lVwC24Vjkmq/2yBSLakZE
 6DZUjZzCW1nvtRK05ebyK6tofRsx8xB8pL/kcBb9nCuh70aLR+5cmE41X4O+MVJbwfP5s/RW
 9BFSL3qgXuXso/3XuWTQjJJGgKhB6xXjMmb1J4q/h5IuVV4juv1Fem9sfmyrh+Wi5V1IzKI7
 RPJ3KVb937eBgSENk53P0gUorwzUcO+ASEo3Z1cBKkJSPigDbeEjVfXQMzNt0oDRzpQqH2vp
 apo2jHnidWt8BsckuWZpxcZ9+/9obQ55DyVQHGiTN39hkETy3Emdnz1JVHTU0Q==
Message-ID: <4f2f3b35-a0a9-1a2e-4d14-b6aad728d6a6@redhat.com>
Date: Wed, 30 Sep 2020 13:34:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <5b5e1b32-0e9b-8154-e645-9b922119db33@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/30 00:31:59
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.469,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, Xiang Zheng <zhengxiang9@huawei.com>,
 qemu-arm@nongnu.org, Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ksIZO8i/wovX

On 9/30/20 1:05 PM, Dongjiu Geng wrote:
> 
> On 2020/9/30 18:35, Philippe Mathieu-Daudé wrote:
>> On 9/30/20 7:08 AM, Dongjiu Geng wrote:
>>> On 2020/9/29 20:56, Philippe Mathieu-Daudé wrote:
>>>> As only the Virt machine uses the RAS Virtualization feature (see
>>>> commit 2afa8c8519: "hw/arm/virt: Introduce a RAS machine option"),
>>>> restrict the APEI tables generation code to the virt machine.
>>>
>>> APEI is a generic feature for X86 and arm64.  X86 platform also can use it, although currently it was mainly
>>> used by ARM64. what is reason that we restrict APEI tables generation to the 'virt' machine?
>>
>> It is currently only selected on (all) the ARM machines, not the X86
>> ones. I am simply restricting it to the 'virt' machine which is the
>> single one enabling the RAS. Without RAS the table is not built, so
>> for the case of the SBSA-Ref machine this code is unreachable, no need
>> to select ACPI_APEI.
>>
>> When a X86 machine configure a RAS it will have to 'select ACPI_APEI'
>> to get it built (I'm not forbidding it, I'm restricting it to where
>> it is used).
> 
> Got it, thanks for the explanation.
> 
> Reviewed-by: Dongjiu Geng <gengdongjiu@huawei.com>

Thanks, I'll reword the description, ...

> 
> BTW：There is a build test error, but it is seems do not related with this patch.
> https://patchew.org/logs/20200929125609.1088330-1-philmd@redhat.com/testing.docker-quick@centos7/?type=message

... and look at that error before posting.

> 
>>
>>>
>>>>
>>>> Fixes: aa16508f1d ("ACPI: Build related register address fields via hardware error fw_cfg blob")
>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>>> ---
>>>> Cc: Laszlo Ersek <lersek@redhat.com>
>>>> Cc: Xiang Zheng <zhengxiang9@huawei.com>
>>>> Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>>>> Cc: Igor Mammedov <imammedo@redhat.com>
>>>> Cc: Dongjiu Geng <gengdongjiu@huawei.com>
>>>> Cc: Michael S. Tsirkin <mst@redhat.com>
>>>> ---
>>>>  default-configs/arm-softmmu.mak | 1 -
>>>>  hw/arm/Kconfig                  | 1 +
>>>>  2 files changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
>>>> index 9a94ebd0be..08a32123b4 100644
>>>> --- a/default-configs/arm-softmmu.mak
>>>> +++ b/default-configs/arm-softmmu.mak
>>>> @@ -43,4 +43,3 @@ CONFIG_FSL_IMX7=y
>>>>  CONFIG_FSL_IMX6UL=y
>>>>  CONFIG_SEMIHOSTING=y
>>>>  CONFIG_ALLWINNER_H3=y
>>>> -CONFIG_ACPI_APEI=y
>>>> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
>>>> index f303c6bead..7d040827af 100644
>>>> --- a/hw/arm/Kconfig
>>>> +++ b/hw/arm/Kconfig
>>>> @@ -26,6 +26,7 @@ config ARM_VIRT
>>>>      select ACPI_MEMORY_HOTPLUG
>>>>      select ACPI_HW_REDUCED
>>>>      select ACPI_NVDIMM
>>>> +    select ACPI_APEI
>>>>  
>>>>  config CHEETAH
>>>>      bool
>>>>
>>>
>>
>> .
>>
> 

