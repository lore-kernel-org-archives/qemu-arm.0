Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1609499lfb;
        Wed, 6 May 2020 21:31:02 -0700 (PDT)
X-Google-Smtp-Source: APiQypLvLJ7TMJdmrBM5tA3Xh9M7mT+91rWWXNdfXpcM576hqVfKZ4zxUNUMFsFLw0lUq+4qI4Py
X-Received: by 2002:a05:6402:688:: with SMTP id f8mr10016038edy.233.1588825862037;
        Wed, 06 May 2020 21:31:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588825862; cv=none;
        d=google.com; s=arc-20160816;
        b=HUfXrfv9TelXTkes5L2Vbz/mBqxhss2LybgvbiyW2XXe5bt5PQEMzQt5/V7/nBH8Ku
         4as3wn4ZkHvTdiWFr7IQC+6waam+KIrE8uTNrCH689Hj8v3FE5UuqHDWQ+eBqD6sQlKa
         xpiL5V8rq1qL9aaAbOvtuDftKj0KAoqObcY/HMOF0i5tMn0k4pCOtaQfhHGN/GUr1TM3
         0cA7bQEziWsLM1TytydsQIFVkXy02BHxLJTrkTsdBPIlCyOJvMFKUASDscsR4sV1M9gt
         1MP6Xf3seMRmPw5vjkNpRsryEha15gzJS+seZIfJpcYhdhaN8T5dGTZDZ9rnGTYbN0ZS
         zgZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject;
        bh=gEu6K94JtAUL/bBb5kpOWlzYnMnZF627uRfrWZCDY3A=;
        b=ygqfJ9CQiPoDqPJEGg8lcGK5gFNWAb0IUdaJ20GhWmrGg1NNCiq1x3BwhX6yWkiQSg
         X2CFCE6WNvrddVW99lV8BG+iWR/XSIFw74IPQSq7JRfik/nv0Zh0T1cqr3+PbW3UriKD
         +ZaFrMhQk8EZJ/ADmP7m8bURgURLGtJXjoZv24cYXgNxKv1M3PKwqH84dBmdb8cuF3YA
         TxmaWLdXi8IhbzZffljJDHwUzADhOKptKvucbhLQsvWbunoXFz870ZD7QIy/gA1Ii2e4
         ATEDjrqRIutliJug9AjViFCjDuVgXum24z2qYa+EyAzVXNfQ7J9+cJ9w0QSKydpOS1+V
         7JyA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [23.128.96.18])
        by mx.google.com with ESMTP id t27si2418957edt.42.2020.05.06.21.31.01;
        Wed, 06 May 2020 21:31:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) client-ip=23.128.96.18;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725879AbgEGEbA (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Thu, 7 May 2020 00:31:00 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:3876 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725783AbgEGEbA (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 7 May 2020 00:31:00 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 7DC8BE60F56FF9613629;
        Thu,  7 May 2020 12:30:58 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.487.0; Thu, 7 May 2020
 12:30:50 +0800
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
Message-ID: <934931d5-b8c5-66db-db3d-ea19bdfc30f9@huawei.com>
Date:   Thu, 7 May 2020 12:30:49 +0800
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
X-TUID: wuyMKvXD0JWF

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

Ok, I will do it. thanks.

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
