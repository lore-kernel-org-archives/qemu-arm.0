Received: by 10.28.173.206 with SMTP id w197csp4502041wme;
        Tue, 9 Jan 2018 21:22:56 -0800 (PST)
X-Google-Smtp-Source: ACJfBovl1lqNnSMKzi6qrQaP4CFHrWTvJjM3KQro8HqkSLkCYuTosZDl0Dvm0vB4m7YvHx67VV4b
X-Received: by 10.84.248.145 with SMTP id q17mr12954092pll.184.1515561776183;
        Tue, 09 Jan 2018 21:22:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515561776; cv=none;
        d=google.com; s=arc-20160816;
        b=iCmYP8YHtGGRjLsEVVpz3MRbMuucoOqeAn5I9N4HiOQnrIn1ojtuWzBh4cmXvPlm8u
         8uSVmsu5URPE5qXnttPukltopjYyvKEvJkz1/b8u2CP7yNwsaRFoNDyUv0eT8OOFCEpm
         iqfxIcCF8nRCc2xJBWYIFUZhMM4AoWZQ1hS0rrvG1hSwVV71vJXglnQpRqxgxDvz4SXi
         A2bAdBDAkeAKzESW0u8wyQ3D8DWQggIwJHxWckpxWLsP1cJuGkvHQk7zuwCfjH+4uoZM
         jn/m7MbW0c5PRkU8NPSefLXx2ceg/3WpSxPMhtP07UkMOe82378pcUYNbtG3OSp/lPmJ
         vsCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:arc-authentication-results;
        bh=WB6FYWalIrXgMzhaQywwX904x5YiM50JhqLL5nKcM30=;
        b=X5hTbw8+kz6+/jxnzVg5/dyoDtteXKfBN0cLvvT6qUNNx9Gk3vrHe5T2G+5HaQc6Ug
         dTRSmrtPN/DxChjD9mU64OxzkdBPFNRTodb0yBspSXrwnRyYolOher7jXTjH3DAgJP8m
         4ugfRis1tGjW/M258RRDezt9I6Cjv/e/HwKGdmBrye2wwQZK58zAZ0kcUzzLg+9TSKOA
         d2WAFSn/pbT1zCTpTzM9lAihiTokhdP8j1cV8ZwghDCp6HbPd93XKHwiiR92FF9m3Zt/
         Pd8IWqzCZdA7K90FhRthCu2e8ad42CvpiDCMHLOdPY4OVC1yNkwk+lPE7aZbYR1RsXX/
         Bvlw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id u128si11144154pfu.261.2018.01.09.21.22.55;
        Tue, 09 Jan 2018 21:22:56 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752884AbeAJFWx (ORCPT <rfc822;francois.ozog@linaro.org>
        + 5 others); Wed, 10 Jan 2018 00:22:53 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:3709 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752473AbeAJFWx (ORCPT <rfc822;kvm@vger.kernel.org>);
        Wed, 10 Jan 2018 00:22:53 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 7113714084A8A;
        Wed, 10 Jan 2018 13:22:36 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.361.1; Wed, 10 Jan 2018
 13:22:30 +0800
Subject: Re: [PATCH v14 2/9] ACPI: Add APEI GHES table generation and CPER
 record support
To:     Peter Maydell <peter.maydell@linaro.org>
CC:     Igor Mammedov <imammedo@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Shannon Zhao <zhaoshenglong@huawei.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        "Richard Henderson" <rth@twiddle.net>,
        Eduardo Habkost <ehabkost@redhat.com>,
        "James Morse" <james.morse@arm.com>,
        Christoffer Dall <christoffer.dall@linaro.org>,
        Marc Zyngier <marc.zyngier@arm.com>,
        kvm-devel <kvm@vger.kernel.org>,
        "QEMU Developers" <qemu-devel@nongnu.org>,
        qemu-arm <qemu-arm@nongnu.org>,
        Huangshaoyu <huangshaoyu@huawei.com>,
        "Zhengqiang (turing)" <zhengqiang10@huawei.com>,
        Xu Wei <xuwei5@hisilicon.com>
References: <1514440458-10515-1-git-send-email-gengdongjiu@huawei.com>
 <1514440458-10515-3-git-send-email-gengdongjiu@huawei.com>
 <20171228151809.10495a90@igors-macbook-pro.local>
 <10087bbd-28b0-b5ad-101a-e6d5ac648548@huawei.com>
 <CAFEAcA--f5eK0_zij55o09M+FyRUVH+Pnwc3tsT6rLm1kpvbBw@mail.gmail.com>
From:   gengdongjiu <gengdongjiu@huawei.com>
Message-ID: <c45372c1-dd9a-8224-9745-49f56188ec8c@huawei.com>
Date:   Wed, 10 Jan 2018 13:22:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA--f5eK0_zij55o09M+FyRUVH+Pnwc3tsT6rLm1kpvbBw@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.142.68.147]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: gD+vivFCKY2X

Peter,
  Thank you very much for your time to review it and give some comments.

On 2018/1/10 0:51, Peter Maydell wrote:
>> the error type to Multi-bit ECC.
>>
>> [1]:
>> UEFI Spec 2.6 Errata A:
>>
>> "N.2.5 Memory Error Section"
>> -----------------+---------------+--------------+-------------------------------------------+
>>         Mnemonic |   Byte Offset |  Byte Length |        Description                        |
>> -----------------+---------------+--------------+-------------------------------------------+
>>         ........ |  ............ |  .........   |        ...........                        |
>> -----------------+---------------+--------------+-------------------------------------------+
>> Memory Error Type|     72        |       1      |Identifies the type of error that occurred:|
>>                  |               |              | 0 – Unknown                              |
>>                  |               |              | 1 – No error                             |
>>                  |               |              | 2 – Single-bit ECC                       |
>>                  |               |              | 3 – Multi-bit ECC                        |
>>                  |               |              | 4 – Single-symbol ChipKill ECC           |
>>                  |               |              | 5 – Multi-symbol ChipKill ECC            |
>>                  |               |              | 6 – Master abort                          |
>>                  |               |              | 7 – Target abort                          |
>>                  |               |              | 8 – Parity Error                          |
>>                  |               |              | 9 – Watchdog timeout                      |
>>                  |               |              | 10 – Invalid address                      |
>>                  |               |              | 11 – Mirror Broken                        |
>>                  |               |              | 12 – Memory Sparing                       |
>>                  |               |              | 13 - Scrub corrected error                |
>>                  |               |              | 14 - Scrub uncorrected error              |
>>                  |               |              | 15 - Physical Memory Map-out event        |
>>                  |               |              | All other values reserved.                |
>> -----------------+---------------+--------------+-------------------------------------------+
>>         ........ |  ............ |  .........   |        ...........                        |
>> -----------------+---------------+--------------+-------------------------------------------+
> There's a value specified for "we don't know what the error type is",
> which is "0 - Unknown". I think we should use that rather than claiming
> that we have a particular type of error when we don't actually know that.
Agree peter's suggestion. It seems "0 - Unknown" makes sense.

> 
> I agree with James that we don't want to report a particular type of
> error to the guest anyway -- the VM is a virtual environment, and
> the exact reason why the hardware/firmware/host kernel have decided
> that a bit of RAM isn't usable any more doesn't matter to the guest.
> We just want to report "this RAM has gone away, sorry" to it.
Agree with peter, appreciate for the comments.

> 
> thanks
> -- PMM
