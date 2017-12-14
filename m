Received: by 10.223.159.74 with SMTP id f10csp5753841wrg;
        Wed, 13 Dec 2017 17:25:03 -0800 (PST)
X-Google-Smtp-Source: ACJfBouqWdKgFH54PdvgPYd53RC+A1tp6yzDw7pnPYcwm4V3aU/jxFUJzCLSgcp/EkdKGgyJxOHW
X-Received: by 10.84.160.203 with SMTP id v11mr3195264plg.412.1513214702933;
        Wed, 13 Dec 2017 17:25:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513214702; cv=none;
        d=google.com; s=arc-20160816;
        b=r9KT/+6ciMlwtRgqhbNsgs1LiDhlEUQUdUphYyS9b6QD4Qo8tLChaQTgXcHr9CdPsr
         k7axztB+UItYLL8Z0eDojY6Vn3SvU06+wqhFsnQ/WhWsKf0cF4Z5naA7w+/GdhxQmY7+
         lx7AhzAe77u9bsVenWHe6QpiU0z0HS0rrBnesR4I8a7e3x82Z0dxE0o1sVYHY35T0i5A
         C/1VNqrFsxROJV0XtMu1sQtvfY8BGvDUYEtgy1dBrNlUhWjvkJPGuUBa4dU51B541zsY
         WhZCP34O5nGwXK0cQH6BOAyk8jf/3ji6LMVvmiLDWOUVxlr5/tnu2W7jHv5O2BedH1eI
         GK3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:arc-authentication-results;
        bh=Kb5L0XnZ25gJUJa17bSY+CB0ZBvzjq1z31bs0J18Jf8=;
        b=WvfIOfq6JOqy65V3P5bXsZn6PadXZzvfpKnnKSogImbRIHOYyRMwh3parIDCwHC1kh
         wl0aq9KJKSMgQxLijaGUTPJJ7temWFyMLDtwxoBIYnqdNJGeDtOouABq+chdBCPc9Swv
         FH8BWG5vtdJlyQN0MNSlxtfe0p06k0NATd1BadlllRg5j5IrqnQcchhJptWyriAcdXxs
         wDbymexeWq3YDUpyXU1zTE42WFe0yotD2rWApenMlTKNoTnL02SexPNoV0Ss3fHMsYTA
         7cpp2zVMSJwygS+uP5A6FCuR1P5SF8AKUiuLrsB+QzBosqWQX/Mlm9ZsnrOGUICcjuBt
         p4hA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id g92si424144plg.642.2017.12.13.17.25.02;
        Wed, 13 Dec 2017 17:25:02 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751042AbdLNBZA (ORCPT <rfc822;francois.ozog@linaro.org>
        + 5 others); Wed, 13 Dec 2017 20:25:00 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2677 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1750819AbdLNBZA (ORCPT <rfc822;kvm@vger.kernel.org>);
        Wed, 13 Dec 2017 20:25:00 -0500
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 06BF5B867D2C;
        Thu, 14 Dec 2017 09:24:46 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.361.1; Thu, 14 Dec 2017
 09:24:38 +0800
Subject: Re: [Qemu-devel] [PATCH v13 00/12] Add ARMv8 RAS virtualization
 support in QEMU
To:     Peter Maydell <peter.maydell@linaro.org>
CC:     Eduardo Habkost <ehabkost@redhat.com>,
        "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Linuxarm <linuxarm@huawei.com>,
        QEMU Developers <qemu-devel@nongnu.org>,
        <xuwei5@hisilicon.com>, Paolo Bonzini <pbonzini@redhat.com>,
        qemu-arm <qemu-arm@nongnu.org>,
        James Morse <james.morse@arm.com>,
        Shannon Zhao <zhaoshenglong@huawei.com>,
        Igor Mammedov <imammedo@redhat.com>,
        Laszlo Ersek <lersek@redhat.com>,
        Christoffer Dall <christoffer.dall@linaro.org>,
        Richard Henderson <rth@twiddle.net>
References: <1511807966-23936-1-git-send-email-gengdongjiu@huawei.com>
 <470c9df5-f2e8-974b-b37f-eff84a6f3d71@huawei.com>
 <18906953-f464-d9f4-23b4-fd7118d45e2f@huawei.com>
 <20171211143220.7a359462@redhat.com>
 <e36ec13c-e597-caae-4ae8-81b320e8f461@huawei.com>
 <CAFEAcA-JmbR3RUMWrH2j5OrSitczu+KskE-NJyhsWrHbJCH_ZA@mail.gmail.com>
From:   gengdongjiu <gengdongjiu@huawei.com>
Message-ID: <500fe8d6-b154-30db-d14b-781f32875dd6@huawei.com>
Date:   Thu, 14 Dec 2017 09:24:36 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-JmbR3RUMWrH2j5OrSitczu+KskE-NJyhsWrHbJCH_ZA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.142.68.147]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: 2IfKxYuh+bqc

Hi peter,

On 2017/12/14 2:12, Peter Maydell wrote:
>> [v13,11/12] hw/arm/virt: Add RAS platform version for migration
>> [v13,12/12] target-arm: kvm64: handle SIGBUS signal from kernel or KVM
> Hi; unfortunately I only have one more working day this year, which
> isn't really enough to get up to speed sufficiently with RAS to
> review this patchset, so the earliest I'm likely to get to it is
> the week beginning 9th Jan.
Ok, thanks.

> 
> Hopefully somebody who understands RAS better than me will
> be able to review it before then.
I also hope somebody can review it before then.

> 
> thanks
> -- PMM
