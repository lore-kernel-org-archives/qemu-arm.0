Received: by 2002:adf:db01:0:0:0:0:0 with SMTP id s1csp4021123wri;
        Tue, 29 Oct 2019 00:06:54 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyzgnUaiacGcLdl91wCJ3j26ljxVK0s/8WRnaipPt+7XrfhaJILHl6TvOupoSsYWJW8L9jl
X-Received: by 2002:a05:6402:154f:: with SMTP id p15mr10811736edx.114.1572332814342;
        Tue, 29 Oct 2019 00:06:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1572332814; cv=none;
        d=google.com; s=arc-20160816;
        b=zTPjefWOZ9rPwIcEzG0avrkuDxdshSLKOuv9Iz1IoePD4UShW6+Cin3BHutbth6vYN
         SIzPDgavXbZb9JT2t17u2cMDarC2JNNH2E8PHgOdRd9CSpwDK1TCu8hXsqHfhbrq602s
         U0YRQVCBRSdj9ieTdDElrBqLTcJ664U7w1aN8ZsG8HYdIVvT0jJJFsWZnUeb8QzuY/j4
         MV/wjX1ztIBktMIQkEE6qIE4ncMgSTCIkIkFK8pxfwhcy7Kw5rXwVarKhkWLPxRVk1cN
         Tj0stJg6DtgAq7nXab44raxRuJX/eVPfO6DGZDICmeGtL556b0qUSk/kFwf/HYghG/pg
         nP3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject;
        bh=5RV7FFq6L5s+sdRd59hs5G8Vv1R4Ls47IcuVAdkXwjc=;
        b=0XipPRz/Z66khyEoj7m9b/HzQ3q6BVPevFozPXxIK7e3YovH6G5L+wC+KW2AtX8BW1
         bnr5SPoXa0Clf+NK/SgHHk4lx2bc63PdH3vJmKW+Pwr8JzGY322WUA8WnfB9bkr64wQh
         vg6NEXQKhqMOLUGDF/uc/EpJbT6aYqddRGBJUf46x9HPBqvPLovXRv5NyUm0iHFTBhMv
         s+kjvPv3g1016/yghEfewnD+H9yOZSxkkV/tDW4KTN5jLPGU65BhRRfUrlVB7fZyUIKO
         pe7IiRut3PR71tk6OacOLApiUOpUhKlZfwoA6GKsW4PddBeDiIsAnaWoNB3Y+sotTDC2
         qlaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id p5si7649597ejx.100.2019.10.29.00.06.54;
        Tue, 29 Oct 2019 00:06:54 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726442AbfJ2HGu (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Tue, 29 Oct 2019 03:06:50 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:52804 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726222AbfJ2HGt (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 29 Oct 2019 03:06:49 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id BA2A1F28D5842D3484E9;
        Tue, 29 Oct 2019 15:06:47 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.439.0; Tue, 29 Oct 2019
 15:06:42 +0800
Subject: Re: [PATCH v20 0/5] Add ARMv8 RAS virtualization support in QEMU
To:     Peter Maydell <peter.maydell@linaro.org>
CC:     "Michael S. Tsirkin" <mst@redhat.com>,
        Eduardo Habkost <ehabkost@redhat.com>,
        kvm-devel <kvm@vger.kernel.org>, <wanghaibin.wang@huawei.com>,
        Marcelo Tosatti <mtosatti@redhat.com>,
        "QEMU Developers" <qemu-devel@nongnu.org>,
        Linuxarm <linuxarm@huawei.com>,
        "Shannon Zhao" <shannon.zhaosl@gmail.com>,
        Xiang Zheng <zhengxiang9@huawei.com>,
        qemu-arm <qemu-arm@nongnu.org>,
        James Morse <james.morse@arm.com>,
        "Jonathan Cameron" <jonathan.cameron@huawei.com>,
        Igor Mammedov <imammedo@redhat.com>,
        Paolo Bonzini <pbonzini@redhat.com>,
        "xuwei (O)" <xuwei5@huawei.com>,
        "Laszlo Ersek" <lersek@redhat.com>,
        Richard Henderson <rth@twiddle.net>
References: <20191026032447.20088-1-zhengxiang9@huawei.com>
 <20191027061450-mutt-send-email-mst@kernel.org>
 <6c44268a-2676-3fa1-226d-29877b21dbea@huawei.com>
 <20191028042645-mutt-send-email-mst@kernel.org>
 <1edda59a-8b3d-1eec-659a-05356d55ed22@huawei.com>
 <20191028104834-mutt-send-email-mst@kernel.org>
 <a16f00df-98cd-3469-1c64-d9d7a6ccaccf@huawei.com>
 <CAFEAcA9fTOoOpeHfnhgy1p-tXk3b8p-e8T02jWkhhBmjv3OnDA@mail.gmail.com>
From:   gengdongjiu <gengdongjiu@huawei.com>
Message-ID: <371db98f-1412-818c-fb96-a75530cde4d0@huawei.com>
Date:   Tue, 29 Oct 2019 15:06:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9fTOoOpeHfnhgy1p-tXk3b8p-e8T02jWkhhBmjv3OnDA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.142.68.147]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: D9OXQ9CQlooH

On 2019/10/28 23:16, Peter Maydell wrote:
>> Hi Peter,
>>     what do you think about it?
> I suggest you just use R: for the moment. The code will all end up going
> through my tree or perhaps Michael's anyway, so it doesn't make much
> practical difference.

ok, got it, thanks.

> 
> thanks
> -- PMM
> .
> 
