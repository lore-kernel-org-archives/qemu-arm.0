Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp233614lfb;
        Mon, 11 May 2020 07:05:49 -0700 (PDT)
X-Google-Smtp-Source: APiQypLhT2fuaXU2RuYyGlup3nugCWGUDMrOEPJCkx/TkgvMNibElRUobAvXKIkulnVCjaHN851E
X-Received: by 2002:a17:906:ca14:: with SMTP id jt20mr12718663ejb.233.1589205949872;
        Mon, 11 May 2020 07:05:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589205949; cv=none;
        d=google.com; s=arc-20160816;
        b=dS7DSqfHXMydDijkpoNRd8oqqgzwDQ1NIdoFPBEAItNQcuLhFHhoagGBdizAs0Yqo+
         RvUCk6DVZxCOr/giQY2p4t1z/7JObyg9+cNNcnOpTqPzPKTIpP89ylyBVjTCAXN1HgbU
         SPnbH79jWqOc7w7BNoMvcaUn8JOeFupWVqDyCn8bY3hargwiNJVvz9T3SbamNluFeft+
         r7OdbjhujPQGZyxMgVDgFeG7AyNUZPPS8i0XTJ0Vec4VlFIu/gxXm8zWCezbd4/3Tzxq
         y/7QaP6a38FIizHe1pHw1Gso5fqAWjw5lmQvZ0JBBBjVkszBMq0sipLcDJ115iFTfXAz
         mUlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject;
        bh=Uo9xWUqXkMn4hRSAtyXQghKviT1T46g9CupVHCrhBck=;
        b=VJkb5Jy/KUz8A0iT+oBt7Azzjk4Nvdgxby+V8GhqZt/Jzenv/ZuP8dwgkKg73LSJi4
         CZs/I+obOgnefyaghyiPiBJEHELIE1p+F9L+hhJFAVsOAeo/Xqt/dYpXQgu+ZFW1NcLA
         totzYGgHR5uiC9MIwkABoT4/u8FBkAG55UxpDJJAF5C/nvhXTV57wmOAWsZNtLSdW/Ht
         QG3/GZidQ0Hy7ufefvNqmBqANew6Rir48pIKQek8HilL1Tqxm9k/Fp7wbzJjDEefEIxx
         nCNupdOO5i5E+vtbo/tgUeCSL9/W/S6opowIRahEYRJEPSKTll+GadklY5mYClK3UK49
         DubQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [23.128.96.18])
        by mx.google.com with ESMTP id g15si2770914ejo.520.2020.05.11.07.05.49;
        Mon, 11 May 2020 07:05:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) client-ip=23.128.96.18;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730382AbgEKOFl (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Mon, 11 May 2020 10:05:41 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:4332 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730253AbgEKOFk (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 11 May 2020 10:05:40 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id ABE34487DBF92CA12DB6;
        Mon, 11 May 2020 22:05:36 +0800 (CST)
Received: from [127.0.0.1] (10.142.68.147) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.487.0; Mon, 11 May 2020
 22:05:29 +0800
Subject: Re: [PATCH v26 01/10] acpi: nvdimm: change NVDIMM_UUID_LE to a common
 macro
To:     =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
        <imammedo@redhat.com>, <mst@redhat.com>,
        <xiaoguangrong.eric@gmail.com>, <peter.maydell@linaro.org>,
        <shannon.zhaosl@gmail.com>, <pbonzini@redhat.com>,
        <fam@euphon.net>, <rth@twiddle.net>, <ehabkost@redhat.com>,
        <mtosatti@redhat.com>, <qemu-devel@nongnu.org>,
        <kvm@vger.kernel.org>, <qemu-arm@nongnu.org>
CC:     <zhengxiang9@huawei.com>, <linuxarm@huawei.com>,
        <Jonathan.Cameron@huawei.com>
References: <20200507134205.7559-1-gengdongjiu@huawei.com>
 <20200507134205.7559-2-gengdongjiu@huawei.com>
 <4f29e19c-cb37-05e6-0ae3-c019370e090b@redhat.com>
From:   gengdongjiu <gengdongjiu@huawei.com>
Message-ID: <777c44a0-b977-a8fe-a3c6-5b217e9093af@huawei.com>
Date:   Mon, 11 May 2020 22:05:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <4f29e19c-cb37-05e6-0ae3-c019370e090b@redhat.com>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.142.68.147]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: CAAQhd42EdP9

>> +    (node3), (node4), (node5) }
>> +
>>   #define UUID_FMT "%02hhx%02hhx%02hhx%02hhx-" \
>>                    "%02hhx%02hhx-%02hhx%02hhx-" \
>>                    "%02hhx%02hhx-" \
>> diff --git a/slirp b/slirp
>> index 2faae0f..55ab21c 160000
>> --- a/slirp
>> +++ b/slirp
>> @@ -1 +1 @@
>> -Subproject commit 2faae0f778f818fadc873308f983289df697eb93
>> +Subproject commit 55ab21c9a36852915b81f1b41ebaf3b6509dd8ba
> 
> The SLiRP submodule change is certainly unrelated.

Thanks Philippe's review and comments. I submitted another patchset "[PATCH RESEND v26 00/10] Add ARMv8 RAS virtualization support in QEMU" to fix it, please review that patchset.

> 
> 
> .
> 
