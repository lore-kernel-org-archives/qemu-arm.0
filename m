Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp1371568lfm;
        Wed, 29 Apr 2020 20:56:41 -0700 (PDT)
X-Google-Smtp-Source: APiQypKnWTp3SDE+xYw9h8Cd+1l5YYh1W4CyaBK0bJdGg3d0WOmeP8fVn2MuX+5XmsxtD1XXYzuH
X-Received: by 2002:a50:cb84:: with SMTP id k4mr976242edi.89.1588219001363;
        Wed, 29 Apr 2020 20:56:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588219001; cv=none;
        d=google.com; s=arc-20160816;
        b=MabQX8kGGfgHu6W51KQrErELBW8L38YerNvHuShycB55sz7V0+T8YUl6t4MG4OWZn2
         gmcUClSz0dpUmRCRp2kwaFilbam0B3x81NV4l+/26VCurIZzTKSvA0lBKDUKZTzg+Yjy
         StwR3U+aXvADIZ9c1K9Qv5g8cBSeR/l3wf+RBYTxtzteBO6jw+Dh9wIhxMa2MeoCaju1
         qcvMPadoMTOnBpUndi8a8u5vmwD7XV1/KrP++ptoT+yj5kGcQBslBqwpI87zhVmbfbZ2
         i65dgGjbh2b5rwNx6Ah3ku6IGFR3+sM988GutZizISKjGq86NQHHOdLXI+KdCbNZdJbZ
         UuYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject;
        bh=1uDq7sN7kZ1ZrBFOk/8f9Soxv+WnxmAR0ywLrrKcZj8=;
        b=IidV7yfWLI2RgfZY4olk86Qmxx7PmNUHrSdPvBOYpTfehH4rmxVDlb0OPtnMtbmESh
         H2PrglDF1k/Pb+6xzA0QVwJ2fK1qjITmf1ND4zvUooBjXGzADaeg5Irdrr9M/kRdJOeD
         xkAzu3clzqpDnzzxnY9SMOnj6koPx5wSM8NGflmJ9DmFp99Nz3NXFy4DbYXkl3H6Iy6J
         mB7O9L7+/AoQDCD4voniUQlXpjZQhy7Ck1eD2mawuyJC3K4Qvh5NSyOTafvPvFCp32yc
         SZQJlsZOdB6zF6iHtMjT/w5D8kGpOk2HxJzj2TXZcPrfBoqAcvUYbNulQ+w8MpXBcvz5
         Zj1A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [23.128.96.18])
        by mx.google.com with ESMTP id b26si4680082edx.291.2020.04.29.20.56.40;
        Wed, 29 Apr 2020 20:56:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) client-ip=23.128.96.18;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726420AbgD3D4j (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Wed, 29 Apr 2020 23:56:39 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:58390 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726180AbgD3D4j (ORCPT <rfc822;kvm@vger.kernel.org>);
        Wed, 29 Apr 2020 23:56:39 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id A6D59A3098E671D7117D;
        Thu, 30 Apr 2020 11:56:37 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.487.0; Thu, 30 Apr 2020
 11:56:27 +0800
Subject: Re: [PATCH v25 00/10] Add ARMv8 RAS virtualization support in QEMU
To:     Peter Maydell <peter.maydell@linaro.org>
CC:     Fam Zheng <fam@euphon.net>,
        Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
        kvm-devel <kvm@vger.kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
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
From:   gengdongjiu <gengdongjiu@huawei.com>
Message-ID: <9906359a-cc13-fd7f-1cd3-c80c0ee90d09@huawei.com>
Date:   Thu, 30 Apr 2020 11:56:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9oNuDf=bdSSE8mZWrB23+FegD5NeSAmu8dGWhB=adBQg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.142.68.147]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: HsjujjfVogJF



On 2020/4/17 21:32, Peter Maydell wrote:
> On Fri, 10 Apr 2020 at 12:46, Dongjiu Geng <gengdongjiu@huawei.com> wrote:
>>
>> In the ARMv8 platform, the CPU error types includes synchronous external abort(SEA)
>> and SError Interrupt (SEI). If exception happens in guest, host does not know the detailed
>> information of guest, so it is expected that guest can do the recovery. For example, if an
>> exception happens in a guest user-space application, host does not know which application
>> encounters errors, only guest knows it.
>>
>> For the ARMv8 SEA/SEI, KVM or host kernel delivers SIGBUS to notify userspace.
>> After user space gets the notification, it will record the CPER into guest GHES
>> buffer and inject an exception or IRQ to guest.
>>
>> In the current implementation, if the type of SIGBUS is BUS_MCEERR_AR, we will
>> treat it as a synchronous exception, and notify guest with ARMv8 SEA
>> notification type after recording CPER into guest.
> 
> Hi. I left a comment on patch 1. The other 3 patches unreviewed
> are 5, 6 and 8, which are all ACPI core code, so that's for
> MST, Igor or Shannon to review.

Ping MST, Igor and Shannon, sorry for the noise.

> 
> Once those have been reviewed, please ping me if you want this
> to go via target-arm.next.
> 
> thanks
> -- PMM
> 
> .
> 
