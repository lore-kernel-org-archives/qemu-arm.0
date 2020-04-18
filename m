Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp1232515lfm;
        Fri, 17 Apr 2020 19:40:49 -0700 (PDT)
X-Google-Smtp-Source: APiQypIq0FFEvWaITstIfXu8oGZgoRKe/pa66xXSknkhRXlFveHOGrXHPvUk4l01ZtBcSQvwdA7m
X-Received: by 2002:a05:6402:1437:: with SMTP id c23mr5774083edx.327.1587177649774;
        Fri, 17 Apr 2020 19:40:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587177649; cv=none;
        d=google.com; s=arc-20160816;
        b=jkrTK8hoeoaC5Kruwozmm6LVnBjFkzAAt3PmQOzaFv8tZX+gjAYTD1EyIs/4MP/jPv
         qb08RK2vK2qCZE61bfZZuZQkk06G86dJpd0YYg+bIeXk0BopBPo5koIHac/QL08Lf6dx
         cKnNEqICnCcw6/0UiSUoYqRh2BU+yVvfiR+dl2WbcSX+i6Z+HZWff3X1ahDYHlLSCxzo
         PclhgIB4v7bj/VPYJABVhsleFuPz/TwM8CpTJbL/PAXe+WwhfwNXIY/3smwboZwkkyHH
         5lIuesu8AKS0LwZreoFy9ADy/DOFMRmx53H3wJArGQosazHpRiUmrg6mgGXEvtCZTo9c
         nNQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject;
        bh=zp7LTpgKxe4h1PFOLlr6oHjlC/parR8sLP6AZwzpjt4=;
        b=KjCKnQhVrmGiVRug6rqko2dFnExBy+QQo5TtzMPLq6NLTg75h1GA5fwcrgrSr8trev
         DcTjbBojWg+4q0fX3Qc5uPZOduzUAW/pKqU8ZHlvCyOWWTZUP8ZmPJtbC/Gpu40d0M7p
         SnpEeq5b1mknxtub4QB+8y2auqNVJsc4y1JKehT69i420frhLfEfr8BO7a841nX0jUp5
         hUKleYPRZ6yU4DD7O4M6XpQvM1/i+v9sAPD2fOhvAh36i16VKaI0QCyPBKokhNFzg7hJ
         7rEJXDOtZMdx/eKGMgy0FOomM/nV1TBg67IZl6tD8Wi/Xb4H2ZU8yWwsUEU7O03PGM8L
         A6yw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [23.128.96.18])
        by mx.google.com with ESMTP id a23si171190ejv.375.2020.04.17.19.40.49;
        Fri, 17 Apr 2020 19:40:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) client-ip=23.128.96.18;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725796AbgDRCkn (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Fri, 17 Apr 2020 22:40:43 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:2355 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725320AbgDRCkn (ORCPT <rfc822;kvm@vger.kernel.org>);
        Fri, 17 Apr 2020 22:40:43 -0400
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id C3B6C5F4BE3AE59A650B;
        Sat, 18 Apr 2020 10:40:39 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.487.0; Sat, 18 Apr 2020
 10:40:33 +0800
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
Message-ID: <e7812ab1-cfaa-de3e-3062-4576665dab54@huawei.com>
Date:   Sat, 18 Apr 2020 10:40:31 +0800
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
X-TUID: QWnM4X0jJQZq



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

Hi MST, Igor or Shannon
    when you have time, could you review 5, 6 and 8? thanks very much in advance.
It seems this series of patches lasted a long time, hope they can be applied soon.

> 
> Once those have been reviewed, please ping me if you want this
> to go via target-arm.next>
> thanks
> -- PMM
> 
> .
> 
