Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp9603866lff;
        Fri, 17 Jan 2020 02:17:05 -0800 (PST)
X-Google-Smtp-Source: APXvYqz1kXP0s0ekcmaKD3ia+Q6XdMb5o/4xNWeHPeLAVZQkSwP15vgFs7aRcBYKzC9EuahFPcyP
X-Received: by 2002:a9d:70d9:: with SMTP id w25mr5737119otj.231.1579256225094;
        Fri, 17 Jan 2020 02:17:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579256225; cv=none;
        d=google.com; s=arc-20160816;
        b=y0NKiOcHSPZ/onpxg7pFm6AgCcRHjinYzZql5sBG9iwIwUp/tT1gV2M8bV8peUDQqI
         vQPBJ91PWsaJYbFd7wLFVmUSV+ixQO6dwAq0a/x0eC150UojfYdCUNKX7V+dZb0JEpi5
         tYQHFPAyjMzXbW2XoZgZECe1CIpPZO1Fi1lVT7+qfmpx1NrwiFFg9x+bEuz6V4gYFTTe
         TC2F20i5P2x9LDu4DSiJWxNgruC+JAh35+B1yfS7YiqyAHv35MaQ7jDtnPCm7bAuMGTC
         jGDLfnl/SDVEcCFQ/VeaeHXe90+YSO5ygn+pzHkgc26LC3pAohUEGE+4WVM9CT0TBz/f
         1tnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject;
        bh=7qnZpcFsY7VDcQ3spxhR7fCd1YrNfXhrYbTr8wFLrU0=;
        b=wiyRn0hPJWl7EMC59e6Qof8fnOI/hGfKEPygrtwrqk8BBXeledFAULNyCZ2SThgsmf
         cFWfVJiFw/S4NINgloeVaVr1GRIsZwa4FqWJBdBtVT3DjMGRLtBK5Oa4LiW5s3I9jcA7
         0aFCqMuYfxXrDo2HeJYRLhURSsLIpv6xn2hbkMqsrATp5gLl/SMa/09AnVJB0r4qNZ/q
         rLv2G8G6Y83uzIJ8w3wrujgU/s8Ct+F58Ndzibvsr5sUB/F9knQ9iehkr+nfm+Kn3EKj
         nW8HhbIH4nCAs9jvHVOA0TWwfF9TvY5NyRZoTxNMNn85b5wuzprUfiKfYZnBfHgTl9O/
         IX1A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id r15si14569185ota.264.2020.01.17.02.17.04;
        Fri, 17 Jan 2020 02:17:05 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726409AbgAQKRD (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Fri, 17 Jan 2020 05:17:03 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:53360 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726085AbgAQKRD (ORCPT <rfc822;kvm@vger.kernel.org>);
        Fri, 17 Jan 2020 05:17:03 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 0F497E896FAF0E365F54;
        Fri, 17 Jan 2020 18:17:02 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.439.0; Fri, 17 Jan 2020
 18:16:53 +0800
Subject: Re: [PATCH v22 9/9] MAINTAINERS: Add ACPI/HEST/GHES entries
To:     =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
        Peter Maydell <peter.maydell@linaro.org>
CC:     Fam Zheng <fam@euphon.net>, Eduardo Habkost <ehabkost@redhat.com>,
        kvm-devel <kvm@vger.kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        QEMU Developers <qemu-devel@nongnu.org>,
        Linuxarm <linuxarm@huawei.com>,
        Shannon Zhao <shannon.zhaosl@gmail.com>,
        Zheng Xiang <zhengxiang9@huawei.com>,
        qemu-arm <qemu-arm@nongnu.org>,
        James Morse <james.morse@arm.com>,
        "xuwei (O)" <xuwei5@huawei.com>,
        Igor Mammedov <imammedo@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Richard Henderson <rth@twiddle.net>
References: <1578483143-14905-1-git-send-email-gengdongjiu@huawei.com>
 <1578483143-14905-10-git-send-email-gengdongjiu@huawei.com>
 <CAFEAcA-mLgD8rQ211ep44nd8oxTKSnxc7YmY+nPtADpKZk5asA@mail.gmail.com>
 <1c45a8b4-1ea4-ddfd-cce3-c42699d2b3b9@redhat.com>
From:   gengdongjiu <gengdongjiu@huawei.com>
Message-ID: <d502bd34-79e4-45f8-e1b7-54265623db15@huawei.com>
Date:   Fri, 17 Jan 2020 18:16:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <1c45a8b4-1ea4-ddfd-cce3-c42699d2b3b9@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.142.68.147]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: IQ609869acMb

On 2020/1/17 15:22, Philippe Mathieu-Daudé wrote:
> Hi Peter,
> 
> On 1/16/20 5:46 PM, Peter Maydell wrote:
>> On Wed, 8 Jan 2020 at 11:32, Dongjiu Geng <gengdongjiu@huawei.com> wrote:
>>>
>>> I and Xiang are willing to review the APEI-related patches and
>>> volunteer as the reviewers for the HEST/GHES part.
>>>
>>> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
>>> Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>
>>> ---
>>>   MAINTAINERS | 9 +++++++++
>>>   1 file changed, 9 insertions(+)
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 387879a..5af70a5 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -1423,6 +1423,15 @@ F: tests/bios-tables-test.c
>>>   F: tests/acpi-utils.[hc]
>>>   F: tests/data/acpi/
>>>
>>> +ACPI/HEST/GHES
>>> +R: Dongjiu Geng <gengdongjiu@huawei.com>
>>> +R: Xiang Zheng <zhengxiang9@huawei.com>
>>> +L: qemu-arm@nongnu.org
>>> +S: Maintained
>>> +F: hw/acpi/ghes.c
>>> +F: include/hw/acpi/ghes.h
>>> +F: docs/specs/acpi_hest_ghes.rst
>>> +
>>>   ppc4xx
>>>   M: David Gibson <david@gibson.dropbear.id.au>
>>>   L: qemu-ppc@nongnu.org
>>> -- 
>>
>> Michael, Igor: since this new MAINTAINERS section is
>> moving files out of the 'ACPI/SMBIOS' section that you're
>> currently responsible for, do you want to provide an
>> acked-by: that you think this division of files makes sense?
> 
> The files are not 'moved out', Michael and Igor are still the maintainers of the supported ACPI/SMBIOS subsystem:
> 
> ACPI/SMBIOS
> M: Michael S. Tsirkin <mst@redhat.com>
> M: Igor Mammedov <imammedo@redhat.com>
> S: Supported
> F: include/hw/acpi/*
> F: hw/acpi/*
> 
> Dongjiu and Xiang only add themselves as reviewers to get notified on changes on these specific files. The more eyes the better :)
> 
> The docs/specs/acpi_hest_ghes.rst document has no maintainer, as these others too:
If this file has no maintainer, may be it needs a M tag for this file, otherwise when people change this file, and use "./scripts/get_maintainer.pl xxxxx" to get maintainer, it will be empty.

> 
> - docs/specs/acpi_cpu_hotplug.txt
> - docs/specs/acpi_hw_reduced_hotplug.rst
> - docs/specs/acpi_mem_hotplug.txt
> - docs/specs/acpi_nvdimm.txt
> 
> The only ACPI file reported as maintained in docs/specs/ is acpi_pci_hotplug.txt, from this entry:
> 
> PCI
> M: Michael S. Tsirkin <mst@redhat.com>
> M: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> S: Supported
> F: docs/specs/*pci*
> 
> FWIW:
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> .
> 
