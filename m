Received: by 10.28.173.206 with SMTP id w197csp347792wme;
        Thu, 11 Jan 2018 02:33:56 -0800 (PST)
X-Google-Smtp-Source: ACJfBos2jno5GiIbJGkTkvlMyRmlSKf3aaem0+kjaA5a9cr3xT+oQoUGcl4KSAJmJTNqqzePrpmw
X-Received: by 10.99.128.66 with SMTP id j63mr7449581pgd.254.1515666836342;
        Thu, 11 Jan 2018 02:33:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515666836; cv=none;
        d=google.com; s=arc-20160816;
        b=NUJvCn5tfYuXStGovx4iqlSy81Y3fMRltOwvTkFERB/ROkCrLpyd/dZJJuUM0yFnvy
         8kvLycE+KTg2XyfSpdDt8LzGgJUvOZPtzYv0NU7QNfN1LGoCaJ5SrjzdWqHIjEhvm5wo
         UE5cOzXyPwfdchNhYIvNMZdRLU7OzX1K0dSMeXhX4jnUpTGNUHhnn2gE7iBX5OsQY5Re
         GJ0Ri2fRNlr2joE+0p1gjy1I3yFtnwftNCWU1H1SKM7gk9azMdEOaPswS4CmHdKW6CUn
         vtEszqEantciOVYh2tFYFkoAcE4wZ0BmH4fhhtSH0Ru4VkSH7KUkIAcTkc7PxrpNnY4y
         chZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:arc-authentication-results;
        bh=vjX9LzUfdlF4V3RzpUaSunI2cTgD7FDghC2W9loxWZ0=;
        b=uY8/wbXI1sJ4g3x86PcbV+Rt69nISU00YYzTj2mRRLtIG/0oTpCHXy5uXA91SNBH/S
         pFJKQv5YJYdNnEhJQmzBtE38RSOe9mTl+W1W6Pn/Pta1FE44F7UlKmduU9eWxupmCTFI
         D91sJMNoPDC2ffMeqGdu0jh+rQyL84j9W7kapH5x5Ymhst0H3X8fdT8wZLiArJ7xIbc7
         Lowvi+G2C70GZLj++IIpiDGu5FggM3rnwc3WZtDMIQK43wEtk64MkSzHVTp0NpTrdXPS
         jgLWWDb6X0ZW+j08tNmuoF0pLveC9ZAG3qU0BBhm2oshiXOr04f2uAFwMKSCzL+hFFLf
         9XVg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id m66si13284473pfj.294.2018.01.11.02.33.56;
        Thu, 11 Jan 2018 02:33:56 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S933386AbeAKKdy (ORCPT <rfc822;francois.ozog@linaro.org>
        + 5 others); Thu, 11 Jan 2018 05:33:54 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:3773 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S933058AbeAKKdx (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 11 Jan 2018 05:33:53 -0500
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 6FDCDFD98888E;
        Thu, 11 Jan 2018 18:33:39 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.361.1; Thu, 11 Jan 2018
 18:33:30 +0800
Subject: Re: [Qemu-arm] [PATCH v14 5/9] target-arm: kvm64: inject synchronous
 External Abort
To:     Peter Maydell <peter.maydell@linaro.org>
CC:     Eduardo Habkost <ehabkost@redhat.com>,
        kvm-devel <kvm@vger.kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        QEMU Developers <qemu-devel@nongnu.org>,
        Xu Wei <xuwei5@hisilicon.com>, qemu-arm <qemu-arm@nongnu.org>,
        James Morse <james.morse@arm.com>,
        Huangshaoyu <huangshaoyu@huawei.com>,
        Igor Mammedov <imammedo@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        "Zhengqiang (turing)" <zhengqiang10@huawei.com>,
        Shannon Zhao <zhaoshenglong@huawei.com>,
        Christoffer Dall <christoffer.dall@linaro.org>,
        Richard Henderson <rth@twiddle.net>
References: <1514440458-10515-1-git-send-email-gengdongjiu@huawei.com>
 <1514440458-10515-6-git-send-email-gengdongjiu@huawei.com>
 <CAFEAcA-RC6hUMR5jPrgOB7nkWjXaPxo6dYEXO=kgC=59k7EVrw@mail.gmail.com>
 <558dc576-6d05-50d4-9f7c-73738e28ad26@huawei.com>
 <CAFEAcA-cAgB5TigMWUsnF74YrzWGToDht61HhOnGrSD1QBDNhg@mail.gmail.com>
From:   gengdongjiu <gengdongjiu@huawei.com>
Message-ID: <b44234f4-c63b-21bd-0584-bf7f134a2317@huawei.com>
Date:   Thu, 11 Jan 2018 18:33:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-cAgB5TigMWUsnF74YrzWGToDht61HhOnGrSD1QBDNhg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.142.68.147]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: FyFSN9VJXWzl

On 2018/1/11 17:53, Peter Maydell wrote:
>> we only support AArch64 kernel, not support AArch32
>>  kernel or AArch32 user space.
> Nope, you must handle AArch32 EL1 correctly in some way, even if that
> is only "this guest CPU doesn't support RAS notification and we
> will not notify it". And you must absolutely support AArch32 EL0,
> that's a requirement for getting this merged. It's not difficult.
sure, it needed. I absolutely follow your suggestion and handle AArch32
EL1 correctly in some way. it is not difficult.
