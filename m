Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp911374lfb;
        Wed, 6 May 2020 04:42:37 -0700 (PDT)
X-Google-Smtp-Source: APiQypJWEoybUK8NSFOpTwPQ4+bMc9GXXuAK7SeCQlqoDN5JMAZ66FaZfqhlYOXiuvkTt+9f/nNx
X-Received: by 2002:a05:6402:14c1:: with SMTP id f1mr6521678edx.221.1588765357084;
        Wed, 06 May 2020 04:42:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588765357; cv=none;
        d=google.com; s=arc-20160816;
        b=I8cffqfMeB71mgN+9uIXi6sMetSCLPeRw+KTRcb+LiUJIyKGsiMcXrMzEbEhfFdlGa
         Sa0vhENvIGIrqO/59MUbldd2fRutKilEiHiUGs5WSQnw5bQBlV6DgRDLnv9yDbbRSC3/
         wHlgxgjy3D0WOwLkslbm26OVl3kyCxxfbjKUcBNUSYfSZP1K1wwqpQANxECc3N9WBNMV
         MRHCo+UT5dY29jehgkGMzSWisICrT9FM2vN/Ib/i3f3jOsnktVdyta8a7MFsb2HGYRI4
         kf3Cu9dRpBIOSPuD0usYLqoDZcRqNh1b7LbiVQQdqZ1k9qF/uefH51CC/Kqws7ZHSv3M
         SNbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject;
        bh=EpxXxjKzY6k0Qi9WYGdbruLAUU60PFZdMUip0Jg5e2E=;
        b=0RRyR2gauQAajnHMimKy3vYs4cRwF9zORjKfN1vh+N0gbzZMVv515yBvy3tMlpIbSX
         jTEVWomGPBP0kBBrlKWSnwtJrZx8/4zX9y1Vq1JPh0E/ovMUYUgPFtd3XED6rNVtfOsb
         xKsBP7JPLOd06H+pYzheqQUnPpYxukwx1KwXBXhr+3xswQzlipkiWmy1O/eUN3mPoSRB
         XTMncmcaZdvrgvH1cprrJiamUOiOeTXeuDRtUhLmL1zexOQjTA2+u9kUp+LSRPfzBVgx
         MURoc2aSvLJtdLezvtpF9C3+xmqK11jCGqIVopnxB07Y8ihzlLHZmmIUhFnCR5mgj9zb
         PR8w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [23.128.96.18])
        by mx.google.com with ESMTP id w18si910758edr.474.2020.05.06.04.42.36;
        Wed, 06 May 2020 04:42:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) client-ip=23.128.96.18;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728051AbgEFLmg (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Wed, 6 May 2020 07:42:36 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:3819 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726734AbgEFLmf (ORCPT <rfc822;kvm@vger.kernel.org>);
        Wed, 6 May 2020 07:42:35 -0400
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 1A14C7508B45178499CB;
        Wed,  6 May 2020 19:42:34 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.487.0; Wed, 6 May 2020
 19:42:22 +0800
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
Message-ID: <da3cbdfd-a75d-c87f-3ece-616278aa64d5@huawei.com>
Date:   Wed, 6 May 2020 19:42:19 +0800
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
X-TUID: Jqb8bn1Pcpiw

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
> 
> Once those have been reviewed, please ping me if you want this
> to go via target-arm.next.

Hi Peter,
   Igor have reviewed all ACPI core code. whether you can apply this series to target-arm.next? I can make another patches to solve your comments on patch1 and another APCI comment.
Thanks very much in advance.

> 
> thanks
> -- PMM
> 
> .
> 
