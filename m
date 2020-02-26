Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp3283053lfg;
        Wed, 26 Feb 2020 08:35:15 -0800 (PST)
X-Google-Smtp-Source: APXvYqynqxMSkd7QKExwSZEFF/6XY00aTbZvToIXXx8M2HMfpLzfdZoToOdNNxF8RAnJEKCAj9kg
X-Received: by 2002:a05:6808:4c2:: with SMTP id a2mr3639763oie.118.1582734915753;
        Wed, 26 Feb 2020 08:35:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582734915; cv=none;
        d=google.com; s=arc-20160816;
        b=WCEE+wwqcsAj5B6+k1X+9vukzu6bROqvYVIf2wZeQlN9SWvgDeHkiNxJ5T0TbFGTKf
         0qg8StpLHLxzuGlCdxxO28JRu60bNyP1TxmJflxPZuUSji10A64b4dAx+a2bUVi03LOy
         IlmFP8oeHfkOYhb5MwD+i4bqY34cJs+ZAxJm4EszkSspfavWUJhMimmfT5SqdzAQcbF1
         o+jryiZQsuePopmYKEHEg+31w+BiS+GFBBsxkIW6IfvjGHKMrXnMNqqz92M5Btw0E8f8
         ovNrj56f7rQD+FyYOqUHV/POMzd13+WMhDpfL9Nesb7mrXcMnEwST1UMljKbjJ/NNXU0
         LYvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject;
        bh=bR8Lx8gdOCgJjrek+EhXjk/uhdBxazHdlEGUnLdyWYU=;
        b=IbHHyrWyAUjWdbOJIldGtxTVT7zg4++bj9NdsWkz0z9GLsThbG7At7yCSUOtjmoinU
         oGXIi3Oh+G4WxA1LtGagepUkOLsYzDMMnKLo/uSbLEOYmhjb8fsJV8WWISxkAeeTU93q
         5Ed6JbpFJRxE53pSAtwvo0B77qccFShO6tOtJElPv4P8ESlzgTYYjbTQg8aqo1F7+dFD
         E2+S/LVebMA27OOLUo+m27T0Sie1mMm4WqgdhdqIjUYtixYpUiSiUahPvLLFhkKaj2lM
         kDGGnPspKC9dra0XUwzgd3EwxabTw+Of10hEz0KkXi4+V6WO+FofJPgnq7D1RafWH12A
         RKTw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id v18si34879otq.209.2020.02.26.08.35.15;
        Wed, 26 Feb 2020 08:35:15 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727060AbgBZQfO (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Wed, 26 Feb 2020 11:35:14 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:11113 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726631AbgBZQfO (ORCPT <rfc822;kvm@vger.kernel.org>);
        Wed, 26 Feb 2020 11:35:14 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id A81A06B3A77E2ABFB80C;
        Thu, 27 Feb 2020 00:34:59 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.439.0; Thu, 27 Feb 2020
 00:34:53 +0800
Subject: Re: [PATCH v24 00/10] Add ARMv8 RAS virtualization support in QEMU
To:     Igor Mammedov <imammedo@redhat.com>
CC:     Peter Maydell <peter.maydell@linaro.org>,
        Fam Zheng <fam@euphon.net>,
        "Xiao Guangrong" <xiaoguangrong.eric@gmail.com>,
        kvm-devel <kvm@vger.kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        QEMU Developers <qemu-devel@nongnu.org>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Shannon Zhao <shannon.zhaosl@gmail.com>,
        Zheng Xiang <zhengxiang9@huawei.com>,
        qemu-arm <qemu-arm@nongnu.org>,
        James Morse <james.morse@arm.com>,
        Shameerali Kolothum Thodi 
        <shameerali.kolothum.thodi@huawei.com>,
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        "Laszlo Ersek" <lersek@redhat.com>,
        Richard Henderson <rth@twiddle.net>
References: <20200217131248.28273-1-gengdongjiu@huawei.com>
 <CAFEAcA9xd8fHiigZFFM7Symh0Mkm-jQ_aGJ7ifRCrXZvFY4DqQ@mail.gmail.com>
 <acd194e5-81d8-afa7-fb6d-6b7d744b5d81@huawei.com>
 <20200225175918.5a81506f@redhat.com>
From:   gengdongjiu <gengdongjiu@huawei.com>
Message-ID: <5bceff96-8681-e33e-8edd-70fd121c055a@huawei.com>
Date:   Thu, 27 Feb 2020 00:34:40 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20200225175918.5a81506f@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.142.68.147]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: /Nfb3Mtm1VdE



On 2020/2/26 0:59, Igor Mammedov wrote:
> On Mon, 24 Feb 2020 16:37:44 +0800
> gengdongjiu <gengdongjiu@huawei.com> wrote:
> 
>> On 2020/2/21 22:09, Peter Maydell wrote:
>>> On Mon, 17 Feb 2020 at 13:10, Dongjiu Geng <gengdongjiu@huawei.com> wrote:  
>>>>
>>>> In the ARMv8 platform, the CPU error types includes synchronous external abort(SEA) and SError Interrupt (SEI). If exception happens in guest, host does not know the detailed information of guest, so it is expected that guest can do the recovery.
>>>> For example, if an exception happens in a guest user-space application, host does
>>>> not know which application encounters errors, only guest knows it.
>>>>
>>>> For the ARMv8 SEA/SEI, KVM or host kernel delivers SIGBUS to notify userspace.
>>>> After user space gets the notification, it will record the CPER into guest GHES
>>>> buffer and inject an exception or IRQ to guest.
>>>>
>>>> In the current implementation, if the type of SIGBUS is BUS_MCEERR_AR, we will
>>>> treat it as a synchronous exception, and notify guest with ARMv8 SEA
>>>> notification type after recording CPER into guest.  
>>>
>>> Hi; I have reviewed the remaining arm bit of this series (patch 9),
>>> and made some comments on patch 1. Still to be reviewed are
>>> patches 4, 5, 6, 8: I'm going to assume that Michael or Igor
>>> will look at those.  
>>
>> Thanks very much for Peter's review.
>> Michael/Igor, hope you can review patches 4, 5, 6, 8, thank you very much in advance.
> 
> done

Thanks a lot, do you think whether it is ready to merge if the comments that you mentioned are fixed?
If there are some other places that still needs to modify, hope you can pointed it out, so that in next patch series it can be ready to merge. thanks.

> 
>>>
>>> thanks
>>> -- PMM
>>>
>>> .
>>>   
>>
> 
> .
> 
