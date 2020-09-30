Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp5409913lfq;
        Wed, 30 Sep 2020 04:05:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkTgBg22w3LQx1CE9pLdSp5LGl1jlCTQK+mXbYbDNhfxrpew9jIEc2PeFHzaoZbrhpGGpk
X-Received: by 2002:a25:1ec6:: with SMTP id e189mr2614449ybe.269.1601463943500;
        Wed, 30 Sep 2020 04:05:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601463943; cv=none;
        d=google.com; s=arc-20160816;
        b=nImMqnEI+ModxounFwcR3ymBhd7IAUPqD5yaiytFbgBuO/4D+2T4U5ySN5U/lrEPJA
         e3fRlK/m5BwfbVpqHx2IRi5f8ZQd2kh0bB+EZUa1zzxHGuI6KORa105xhAS23GJ28cpq
         LZnwheaAYIZkMXx3Pcxqhm9DAuz1sCPCDmrktB0aoQEaOPVzxEtOyU+AoJx8EPIAEktb
         nMcB1ogTlHL6yHDe7CwRu3NjOrQj7w7HhJ7yCJVJs3+ZDwlpYsGZdX1xXORkUcMKgqSt
         2UZkCE5n0z9WEdS2e4oAoxuvz7EXf05kze8+qe2dTrN9m2h5ud050MJjb3bvvVgf7MHi
         jWQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=+r8f8u9AIM7+NYnw7Ni1GSQfCtTeNLPwbQ6b6zaOTCk=;
        b=hyQTdSVgKNPfRLiBRjA+2M923Jo9949KsNRKpk9ZQsD0A4jv33UjuPzMxc3Wmt/5Az
         s3xn/HSH0J+ydVtcQtu/Juo0Wzpzb2NphPIu1pICWqofv0CcSwZ+spWivR1YbGBgTgSk
         TpEUXph+/++oSFQ6toamGLghVHFhsHEnoWmbu5gkvPYaHNyjoErBm//O1osQtgTfzNlm
         WubPF+a9cIB2Ungo69DGkgx66GDYqYHFvJA/jDEecaKYn8ZwYtVcZ3jbE0Hm/defV1+w
         M6S2jcXGNqH3Vj0hq4xrdPhgrxVU6PFHMo4oZNnlPJDu+ShrIp3aTLKJMfYeiq9Wspu0
         +e+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v8si1378878ybk.348.2020.09.30.04.05.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Sep 2020 04:05:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kNZva-0000zQ-Re
	for alex.bennee@linaro.org; Wed, 30 Sep 2020 07:05:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gengdongjiu@huawei.com>)
 id 1kNZvL-0000ja-6r; Wed, 30 Sep 2020 07:05:27 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:2937 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gengdongjiu@huawei.com>)
 id 1kNZvI-0001ie-Fh; Wed, 30 Sep 2020 07:05:26 -0400
Received: from dggeme755-chm.china.huawei.com (unknown [172.30.72.57])
 by Forcepoint Email with ESMTP id 7FFA86550E074EF41B34;
 Wed, 30 Sep 2020 19:05:15 +0800 (CST)
Received: from [10.140.157.78] (10.140.157.78) by
 dggeme755-chm.china.huawei.com (10.3.19.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Wed, 30 Sep 2020 19:05:14 +0800
Subject: Re: [PATCH] hw/arm: Restrict APEI tables generation to the 'virt'
 machine
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 <qemu-devel@nongnu.org>
References: <20200929125609.1088330-1-philmd@redhat.com>
 <12be4400-c37f-2b7f-2f15-f8700dad6003@huawei.com>
 <056736d8-dc89-a94b-7e76-93825492c957@redhat.com>
From: Dongjiu Geng <gengdongjiu@huawei.com>
Message-ID: <5b5e1b32-0e9b-8154-e645-9b922119db33@huawei.com>
Date: Wed, 30 Sep 2020 19:05:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <056736d8-dc89-a94b-7e76-93825492c957@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.140.157.78]
X-ClientProxiedBy: dggeme704-chm.china.huawei.com (10.1.199.100) To
 dggeme755-chm.china.huawei.com (10.3.19.101)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=gengdongjiu@huawei.com; helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/30 07:05:16
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
X-TUID: gWyxaVoe2+Cg


On 2020/9/30 18:35, Philippe Mathieu-Daudé wrote:
> On 9/30/20 7:08 AM, Dongjiu Geng wrote:
>> On 2020/9/29 20:56, Philippe Mathieu-Daudé wrote:
>>> As only the Virt machine uses the RAS Virtualization feature (see
>>> commit 2afa8c8519: "hw/arm/virt: Introduce a RAS machine option"),
>>> restrict the APEI tables generation code to the virt machine.
>>
>> APEI is a generic feature for X86 and arm64.  X86 platform also can use it, although currently it was mainly
>> used by ARM64. what is reason that we restrict APEI tables generation to the 'virt' machine?
> 
> It is currently only selected on (all) the ARM machines, not the X86
> ones. I am simply restricting it to the 'virt' machine which is the
> single one enabling the RAS. Without RAS the table is not built, so
> for the case of the SBSA-Ref machine this code is unreachable, no need
> to select ACPI_APEI.
> 
> When a X86 machine configure a RAS it will have to 'select ACPI_APEI'
> to get it built (I'm not forbidding it, I'm restricting it to where
> it is used).

Got it, thanks for the explanation.

Reviewed-by: Dongjiu Geng <gengdongjiu@huawei.com>

BTW：There is a build test error, but it is seems do not related with this patch.
https://patchew.org/logs/20200929125609.1088330-1-philmd@redhat.com/testing.docker-quick@centos7/?type=message

> 
>>
>>>
>>> Fixes: aa16508f1d ("ACPI: Build related register address fields via hardware error fw_cfg blob")
>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>> ---
>>> Cc: Laszlo Ersek <lersek@redhat.com>
>>> Cc: Xiang Zheng <zhengxiang9@huawei.com>
>>> Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>>> Cc: Igor Mammedov <imammedo@redhat.com>
>>> Cc: Dongjiu Geng <gengdongjiu@huawei.com>
>>> Cc: Michael S. Tsirkin <mst@redhat.com>
>>> ---
>>>  default-configs/arm-softmmu.mak | 1 -
>>>  hw/arm/Kconfig                  | 1 +
>>>  2 files changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmmu.mak
>>> index 9a94ebd0be..08a32123b4 100644
>>> --- a/default-configs/arm-softmmu.mak
>>> +++ b/default-configs/arm-softmmu.mak
>>> @@ -43,4 +43,3 @@ CONFIG_FSL_IMX7=y
>>>  CONFIG_FSL_IMX6UL=y
>>>  CONFIG_SEMIHOSTING=y
>>>  CONFIG_ALLWINNER_H3=y
>>> -CONFIG_ACPI_APEI=y
>>> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
>>> index f303c6bead..7d040827af 100644
>>> --- a/hw/arm/Kconfig
>>> +++ b/hw/arm/Kconfig
>>> @@ -26,6 +26,7 @@ config ARM_VIRT
>>>      select ACPI_MEMORY_HOTPLUG
>>>      select ACPI_HW_REDUCED
>>>      select ACPI_NVDIMM
>>> +    select ACPI_APEI
>>>  
>>>  config CHEETAH
>>>      bool
>>>
>>
> 
> .
> 
