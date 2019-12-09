Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp4430409lff;
        Mon, 9 Dec 2019 06:12:47 -0800 (PST)
X-Google-Smtp-Source: APXvYqyfsdVQRMjm76YMNTHPohb+WpCNBjTasYwfn8rCD7mBTDmCJaVj35iRrH3UwGOva0A5xrG4
X-Received: by 2002:aca:1106:: with SMTP id 6mr18684615oir.75.1575900767443;
        Mon, 09 Dec 2019 06:12:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575900767; cv=none;
        d=google.com; s=arc-20160816;
        b=hLr/8Fmmc3s+i1dyN05zX44O+i+IYA9rdUonRfMnwvXi7Trg9im0z/pVD1KlcVEtAg
         BAOC6sR2su2ZzqVxvcGzqt/Sr2NWrSU8nYAmKOoMzSuLwk7xw/8168VYOb+YdvCAX94K
         LgMGnr4eCkv18dj6wLQUGsR+SmlG179jlJkRhLqptpF+hk35YRwRuGJNOn9QpeIebhl/
         DWwxgKnwnPifdMz7OE2iHJtwxE4fnOc8jc3bf16auAzzo97Vzc3FZlykX3mZirw44klV
         CYgdNallDuowW00B3lDd1woGTbZpqUAboTn+RZPDBEYcdWD0QdPKk7sAZ8ovrpDWh6/U
         kDWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject;
        bh=Gnpf9t/d4RwkLgH9ihO5BqIYEGFxKcOkOYCNvmtTjwQ=;
        b=xvJ7QS5NFp6hSXvNrygjLF6KVHACAp+A1ed5FUdj78N9wiNBGzutWI2NrQKPbMIaaR
         K8xSoM8CcIrUU2oByDs3hg3uEKXYKviTfpuVFm+6KT4QTq5v+tCQXSaeLXqDwcw+LXKB
         JkSESl7ttdg0oYP7Rg2RMLVmgzGN2B2NP3NWBT0ukoJKF09ahLTTLsqGBXPwLRAfp+S4
         PsDdCLX9HX+0KWBb8Ai4peTl6mVYc+v9Hk5qVo9fJzqnwu/Pq+tdZi+b+4r1Sx2kv2Oh
         HTYvVwmQcf4N58TZ+nNhMXNEYyLISFpr3Bk96MHm+v2DqmK/SBqE29zqWS5bN5OTgO1S
         F81w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id v49si4755491otb.253.2019.12.09.06.12.47;
        Mon, 09 Dec 2019 06:12:47 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727903AbfLIOMq (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Mon, 9 Dec 2019 09:12:46 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:38252 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727572AbfLIOMq (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 9 Dec 2019 09:12:46 -0500
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id D162478339045A5766C6;
        Mon,  9 Dec 2019 22:12:42 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.439.0; Mon, 9 Dec 2019
 22:12:37 +0800
Subject: Re: [RESEND PATCH v21 5/6] target-arm: kvm64: handle SIGBUS signal
 from kernel or KVM
To:     Beata Michalska <beata.michalska@linaro.org>
CC:     Xiang Zheng <zhengxiang9@huawei.com>, <pbonzini@redhat.com>,
        <mst@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
        <shannon.zhaosl@gmail.com>,
        Peter Maydell <peter.maydell@linaro.org>,
        "Laszlo Ersek" <lersek@redhat.com>, <james.morse@arm.com>,
        <mtosatti@redhat.com>, <rth@twiddle.net>, <ehabkost@redhat.com>,
        <jonathan.cameron@huawei.com>, <xuwei5@huawei.com>,
        <kvm@vger.kernel.org>, <qemu-devel@nongnu.org>,
        <qemu-arm@nongnu.org>, <linuxarm@huawei.com>,
        <wanghaibin.wang@huawei.com>
References: <20191111014048.21296-1-zhengxiang9@huawei.com>
 <20191111014048.21296-6-zhengxiang9@huawei.com>
 <CADSWDztF=eaUDNnq8bhnPyTKW1YjAWm4UBaH-NBPkzjnzx0bxg@mail.gmail.com>
 <238ea7b3-9d6d-e3f7-40c9-e3e62b5fb477@huawei.com>
 <CADSWDzvFvS6mYiMhXu2J+u+sUxZaKcCE78EuSggv-VOY7zEN_w@mail.gmail.com>
From:   gengdongjiu <gengdongjiu@huawei.com>
Message-ID: <650e26cf-e007-1e31-cd0a-4042bb9fa6a8@huawei.com>
Date:   Mon, 9 Dec 2019 22:12:33 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CADSWDzvFvS6mYiMhXu2J+u+sUxZaKcCE78EuSggv-VOY7zEN_w@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.142.68.147]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: swI1LHGEPvov



On 2019/12/9 21:05, Beata Michalska wrote:
>> Here we set the FnV to not valid, not to set it to valid.
>> because Guest will use the physical address that recorded in APEI table.
>>
> To be precise : the FnV is  giving the status of FAR - so what you are setting
> here is status of 0b0 which means FAR is valid, not FnV on it's own.
> And my point was that you are changing the prototype for syn_data_abort_no_iss
> just for this case only so I was just thinking that it might not be
> worth that, instead
> you could just set it here ... or to be more flexible , provide a way
> to set specific bits
> on demand.

No, I set the FnV to 0b1, not 0b0, the whole esr_el1's value is 0x96000410, as shown below log:
I remember changing the prototype for syn_data_abort_no_iss is suggested by Peter Maydell.


[1]:
[   62.851830] Internal error: synchronous external abort: 96000410 [#1] PREEMPT SMP
[   62.854465] Modules linked in:



> 
