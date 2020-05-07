Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1981438lfb;
        Thu, 7 May 2020 06:46:41 -0700 (PDT)
X-Google-Smtp-Source: APiQypJNzsnrKbfAo2jK2CWM1fG814XqdTyMLZ3ReDautmmVWfKA1a5doG/CS2D1eg1IHdrnadbt
X-Received: by 2002:a50:88a1:: with SMTP id d30mr1696679edd.88.1588859201350;
        Thu, 07 May 2020 06:46:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588859201; cv=none;
        d=google.com; s=arc-20160816;
        b=nndmll9kvGKKPKhteR4577b8JAd6yyfOT93w7hEprCza7PkNIZdSRZ6Bs3rvKXh2YL
         aqgxSBx581iFra/22Y4A1n6X7Iz2mpzW17LjIe8T5cwbt5C/rFjB+Zzxve53RhyeqN68
         vQCBIIL61X5/yQrVUW5nPiw58PSDRh7xjZ9uRBxmsmFkXXR+b6P1mJNQJMJV/gSmEyCj
         IuGqkqU3lobNbDLAx/By1co8eVkwZ5g8yTN6w8AceDs9l8lhVlMK5/qf08ByYXcNYRlA
         j7n2tDyYyeLWOrW+ZRGBSOuWOwm/7zWtAUf/6NCH+5am1A+fDVmJWTPl+pW55heu4SOf
         WuPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject;
        bh=p917Rv/lLyfecNGoC7lmNKpZxTtoOqWWNZPvv9Fjmpo=;
        b=gb+HP+OLWzHBuPPuVgFAY+ZDZGUJVhENpIMrxIx4akgo429kR9ADeecRXp16WUv2Xi
         P8C2P+KMFS0/r0Xhvz+4mKxpIGXI2vA0L0G5tAxdGU/9e9GmYIm49wYG8pfimfK9Hhmo
         9ut1qzgAPd/IdBv5j+6jL3NMqrgVOEX7/vYmWvq96veSABgtb62PEThEnc5TU0sxzN8w
         PevyABVO6UMakYwFxULA5FXfHzuNdBq603TWPrtKJIkuGvrO0inij9HDZkzs5I2T4uje
         kKDCse+hMNwGVH4oqzOEMDXH0Ra1+EQQmL6n6wsu66kzuDecGJ3FEFgwi2Pfk+sFjnfs
         fX3g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [23.128.96.18])
        by mx.google.com with ESMTP id dx23si3405571ejb.181.2020.05.07.06.46.41;
        Thu, 07 May 2020 06:46:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) client-ip=23.128.96.18;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727083AbgEGNqk (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Thu, 7 May 2020 09:46:40 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:45464 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726218AbgEGNqj (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 7 May 2020 09:46:39 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id BD7ED9A4637A1595BE71;
        Thu,  7 May 2020 21:46:37 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.487.0; Thu, 7 May 2020
 21:46:30 +0800
Subject: Re: [PATCH v25 00/10] Add ARMv8 RAS virtualization support in QEMU
To:     "Michael S. Tsirkin" <mst@redhat.com>
CC:     Peter Maydell <peter.maydell@linaro.org>,
        Fam Zheng <fam@euphon.net>,
        "Xiao Guangrong" <xiaoguangrong.eric@gmail.com>,
        kvm-devel <kvm@vger.kernel.org>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        QEMU Developers <qemu-devel@nongnu.org>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Linuxarm <linuxarm@huawei.com>,
        Shannon Zhao <shannon.zhaosl@gmail.com>,
        Zheng Xiang <zhengxiang9@huawei.com>,
        qemu-arm <qemu-arm@nongnu.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        "Igor Mammedov" <imammedo@redhat.com>,
        Richard Henderson <rth@twiddle.net>
References: <20200410114639.32844-1-gengdongjiu@huawei.com>
 <CAFEAcA9oNuDf=bdSSE8mZWrB23+FegD5NeSAmu8dGWhB=adBQg@mail.gmail.com>
 <da3cbdfd-a75d-c87f-3ece-616278aa64d5@huawei.com>
 <20200506162439-mutt-send-email-mst@kernel.org>
From:   gengdongjiu <gengdongjiu@huawei.com>
Message-ID: <9198eac5-87ac-839c-f5dd-598880748b8e@huawei.com>
Date:   Thu, 7 May 2020 21:46:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20200506162439-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.142.68.147]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: 67UXHistwOG6



On 2020/5/7 4:25, Michael S. Tsirkin wrote:
> On Wed, May 06, 2020 at 07:42:19PM +0800, gengdongjiu wrote:
>> On 2020/4/17 21:32, Peter Maydell wrote:
>>> On Fri, 10 Apr 2020 at 12:46, Dongjiu Geng <gengdongjiu@huawei.com> wrote:
>>>>
>>>> In the ARMv8 platform, the CPU error types includes synchronous external abort(SEA)
>>>> and SError Interrupt (SEI). If exception happens in guest, host does not know the detailed
>>>> information of guest, so it is expected that guest can do the recovery. For example, if an
>>>> exception happens in a guest user-space application, host does not know which application
>>>> encounters errors, only guest knows it.
>>>>
>>>> For the ARMv8 SEA/SEI, KVM or host kernel delivers SIGBUS to notify userspace.
>>>> After user space gets the notification, it will record the CPER into guest GHES
>>>> buffer and inject an exception or IRQ to guest.
>>>>
>>>> In the current implementation, if the type of SIGBUS is BUS_MCEERR_AR, we will
>>>> treat it as a synchronous exception, and notify guest with ARMv8 SEA
>>>> notification type after recording CPER into guest.
>>>
>>> Hi. I left a comment on patch 1. The other 3 patches unreviewed
>>> are 5, 6 and 8, which are all ACPI core code, so that's for
>>> MST, Igor or Shannon to review.
>>>
>>> Once those have been reviewed, please ping me if you want this
>>> to go via target-arm.next.
>>
>> Hi Peter,
>>    Igor have reviewed all ACPI core code. whether you can apply this series to target-arm.next I can make another patches to solve your comments on patch1 and another APCI comment.
>> Thanks very much in advance.
> 
> Given it all starts with patch 1, it's probably easier to address the
> comment and repost.

  Done.

  Hi Peter,
      Please review the patch 1 in the patchset v26. Thanks.
> 
> 
>>>
>>> thanks
>>> -- PMM
>>>
>>> .
>>>
> 
> .
> 
