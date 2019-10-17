Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp515611wrm;
        Wed, 16 Oct 2019 23:20:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyYDYjUyG43WTfyzWstdi+YTj8Ix+2HT+zxZyH0b2S1ZFORlTYsez+GUHijbV9+SwN7vXSe
X-Received: by 2002:aa7:c603:: with SMTP id h3mr2045781edq.44.1571293256356;
        Wed, 16 Oct 2019 23:20:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571293256; cv=none;
        d=google.com; s=arc-20160816;
        b=bw4eU/gvg22Duah+FfKX1narwHydrrfMi/LuxaS9EEp+d6h/V1dkyQlyV81ec1mh2W
         dtnJGDneLuv3ThRax1gMiD+hM8AFbq0dzFMVzM8jzLgtOrl8SpL/uFi5AlduwQ9L2JnQ
         33e7vZl03Hwd8y3w98Wd8jfq9/FdNCiCw2lJPoc2eGW2BigzP3UD/vUjES1fcEGidL0P
         29dwcsrkTzLTtSedf/QHPr+WZYF8HBvczwEXQaNChmoUzFm0ItypnUpV8bRxsEbbhhbQ
         zef4XywIu0904I9zlHBFgI3/zSmlCbxnA4y7Iw6HhwKz/qbxD8kK7Ux+J7aGubeCyVYT
         WUXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject;
        bh=YDf1tT1C3GcxN8R/Fnls6CPdhtK61y8joOXZBgavQF4=;
        b=Dc9R0e9oFvG75FVf1UTh/DrxXrHDkKkXAsLg0ftrLDqlN0/lDpG9mjQD9ih21ccKI7
         n4grWCSPNcPtWunPIgLtfMR1F5xd7rrYF/MN+Bu2TpooKJWWDv08X/qJP8pjqLKDyy3w
         nZGv+JqiW76zgGuaKnn3JNb5MmuDuqHMYRHUzorEuKHgYS/j+/Vec0kMpyY4+hRyNCv8
         ntOaeSDJmkMkPNJ41xBDbaSZhUsmdluefWItTll+8WRQGIQcT/jWXiSDhiK0tDS0DL6d
         SYhkuBq9lUvMScoNDobxBqr2iRZ/7GXgXb+uwwYDmvUHmA/i/QEF2Jzo0+k4yoBzQzGS
         OHow==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id a24si840612ejg.127.2019.10.16.23.20.56;
        Wed, 16 Oct 2019 23:20:56 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437123AbfJQGUw (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Thu, 17 Oct 2019 02:20:52 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:37056 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731726AbfJQGUv (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 17 Oct 2019 02:20:51 -0400
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id EE5F4266ADB1D7F2B102;
        Thu, 17 Oct 2019 14:20:49 +0800 (CST)
Received: from [127.0.0.1] (10.133.224.57) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.439.0; Thu, 17 Oct 2019
 14:20:39 +0800
Subject: Re: [PATCH v19 3/5] ACPI: Add APEI GHES table generation support
To:     Peter Maydell <peter.maydell@linaro.org>
CC:     Paolo Bonzini <pbonzini@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Igor Mammedov <imammedo@redhat.com>,
        Shannon Zhao <shannon.zhaosl@gmail.com>,
        Laszlo Ersek <lersek@redhat.com>,
        James Morse <james.morse@arm.com>,
        gengdongjiu <gengdongjiu@huawei.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        Richard Henderson <rth@twiddle.net>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        "xuwei (O)" <xuwei5@huawei.com>, kvm-devel <kvm@vger.kernel.org>,
        "QEMU Developers" <qemu-devel@nongnu.org>,
        qemu-arm <qemu-arm@nongnu.org>, Linuxarm <linuxarm@huawei.com>,
        <wanghaibin.wang@huawei.com>
References: <20191015140140.34748-1-zhengxiang9@huawei.com>
 <20191015140140.34748-4-zhengxiang9@huawei.com>
 <CAFEAcA9CWPKF5XibFtZRwavVj4PboGoaM5368Omje6qrOjV3AQ@mail.gmail.com>
From:   Xiang Zheng <zhengxiang9@huawei.com>
Message-ID: <f35f10ec-c5e0-bcdc-48a9-ceb754cf1fc1@huawei.com>
Date:   Thu, 17 Oct 2019 14:20:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9CWPKF5XibFtZRwavVj4PboGoaM5368Omje6qrOjV3AQ@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.133.224.57]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: sHZO1FH9tUTn



On 2019/10/15 22:52, Peter Maydell wrote:
> On Tue, 15 Oct 2019 at 15:02, Xiang Zheng <zhengxiang9@huawei.com> wrote:
>>
>> From: Dongjiu Geng <gengdongjiu@huawei.com>
>>
>> This patch implements APEI GHES Table generation via fw_cfg blobs. Now
>> it only supports ARMv8 SEA, a type of GHESv2 error source. Afterwards,
>> we can extend the supported types if needed. For the CPER section,
>> currently it is memory section because kernel mainly wants userspace to
>> handle the memory errors.
>>
>> This patch follows the spec ACPI 6.2 to build the Hardware Error Source
>> table. For more detailed information, please refer to document:
>> docs/specs/acpi_hest_ghes.rst
>>
>> Suggested-by: Laszlo Ersek <lersek@redhat.com>
>> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
>> Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>
> 
>> +    /* Error Status Address */
>> +    build_append_gas(table_data, AML_SYSTEM_MEMORY, 0x40, 0,
>> +                     4 /* QWord access */, 0);
> 
> Hi; this doesn't seem to compile with clang:
> 
> /home/petmay01/linaro/qemu-from-laptop/qemu/hw/acpi/acpi_ghes.c:330:34:
> error: implicit conversion from
>       enumeration type 'AmlRegionSpace' to different enumeration type
> 'AmlAddressSpace'
>       [-Werror,-Wenum-conversion]
>     build_append_gas(table_data, AML_SYSTEM_MEMORY, 0x40, 0,
>     ~~~~~~~~~~~~~~~~             ^~~~~~~~~~~~~~~~~
> /home/petmay01/linaro/qemu-from-laptop/qemu/hw/acpi/acpi_ghes.c:351:34:
> error: implicit conversion from
>       enumeration type 'AmlRegionSpace' to different enumeration type
> 'AmlAddressSpace'
>       [-Werror,-Wenum-conversion]
>     build_append_gas(table_data, AML_SYSTEM_MEMORY, 0x40, 0,
>     ~~~~~~~~~~~~~~~~             ^~~~~~~~~~~~~~~~~
> 2 errors generated.
> 
> Should these be AML_AS_SYSTEM_MEMORY, or should the build_append_gas()
> function be taking an AmlRegionSpace rather than an AmlAddressSpace ?

Yes, these should be AML_AS_SYSTEM_MEMORY, the first field of Generic Address
Structure(GAS) is Address Space ID. I will fix these compile errors.

> 
> thanks
> -- PMM
> 
> .
> 

-- 

Thanks,
Xiang
