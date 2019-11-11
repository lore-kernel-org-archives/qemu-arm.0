Received: by 2002:adf:fb8f:0:0:0:0:0 with SMTP id a15csp710681wrr;
        Sun, 10 Nov 2019 17:23:13 -0800 (PST)
X-Google-Smtp-Source: APXvYqxga0wc+u14TJfB0CmYJdXjxd9affjmzNsgN+as4IDOgM/tV9GuKdPojTyHcxW8tpKlPG8k
X-Received: by 2002:a17:906:4dd5:: with SMTP id f21mr20246671ejw.203.1573435393803;
        Sun, 10 Nov 2019 17:23:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573435393; cv=none;
        d=google.com; s=arc-20160816;
        b=KGRcGbY8ckp1Aj6hMha1lSMgf3jz+L1vIAwVJM/e91T0pGBKPoGvqXCaNVqisUhLoQ
         mcTiFNP+uRfVHAMU711+b3TtnDUtiSQf6QEBZzQh3mXJHbjsrsZnvEDEYZCbHSuLgGRX
         rDlnaPAuDAwCT1UCSst/U9v9aBq0A2R9YGm7X8NE7+6SEFjqrEoLbtOdVtQb1+vD76nO
         DbMXoEz+1GJvI0unHmUCQjrdc84b1oK5Oj1dcmfuXcjEB+DmFOnTNRLxZza4ARJX4O2d
         L8XPGtwri8P0OtsY+rN9Ona5ZK9g0Il+AC9q+CkbWrFzqrNELNNPecHXjOzEeteVg7KN
         W2WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject;
        bh=jhha4+2njcSipcCGWcEyR7/IrgESxCm+gtC9wIUvqTQ=;
        b=sxj5FXQ6y/eR3BoBK2g8EXqkQC9G4PzEyKZ2388b4MAN5ZoxLvKSMpeLG6dRZQhKdn
         orNR60FcCUC8JCRZe7MlR7TAbBoNOs3qcCWAB23Rgs/EMcMjWgp103yy/Talee3ve5ym
         cL1PZ9MoL7wzLWHwuo/r8JYWo2DMWSHES/afT2R81bzPUY1OqEJvnNTQzbP1iC7exLHo
         FDQJtcFETQGOqA9rkxcEzSBlGGXZya5kIKKo+6dZKvgUcE11+iUnEp+5mj5Yn9K6ildQ
         lvmV3cIgErT+Af9OyI109OdKVlpXTTsVR5tv1FSfE+K+QRFumG5MHbw8YRm4N4BeD/0W
         B7+g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id x19si8350723ejv.94.2019.11.10.17.23.13;
        Sun, 10 Nov 2019 17:23:13 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726754AbfKKBXM (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Sun, 10 Nov 2019 20:23:12 -0500
Received: from szxga06-in.huawei.com ([45.249.212.32]:37792 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726275AbfKKBXM (ORCPT <rfc822;kvm@vger.kernel.org>);
        Sun, 10 Nov 2019 20:23:12 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 0AEF27CCDDD5308E8303;
        Mon, 11 Nov 2019 09:23:10 +0800 (CST)
Received: from [127.0.0.1] (10.133.224.57) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.439.0; Mon, 11 Nov 2019
 09:23:02 +0800
Subject: Re: [PATCH v21 3/6] ACPI: Add APEI GHES table generation support
To:     gengdongjiu <gengdongjiu@huawei.com>
CC:     <pbonzini@redhat.com>, <mst@redhat.com>, <imammedo@redhat.com>,
        <shannon.zhaosl@gmail.com>, <peter.maydell@linaro.org>,
        <lersek@redhat.com>, <james.morse@arm.com>, <mtosatti@redhat.com>,
        <rth@twiddle.net>, <ehabkost@redhat.com>,
        <jonathan.cameron@huawei.com>, <xuwei5@huawei.com>,
        <kvm@vger.kernel.org>, <qemu-devel@nongnu.org>,
        <qemu-arm@nongnu.org>, <linuxarm@huawei.com>,
        <wanghaibin.wang@huawei.com>
References: <20191104121458.29208-1-zhengxiang9@huawei.com>
 <20191104121458.29208-4-zhengxiang9@huawei.com>
 <3068b1f2-7175-485a-a9a1-dcba0bf82dea@huawei.com>
From:   Xiang Zheng <zhengxiang9@huawei.com>
Message-ID: <b32dec90-93c7-a811-f521-470dee75e5b8@huawei.com>
Date:   Mon, 11 Nov 2019 09:23:00 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <3068b1f2-7175-485a-a9a1-dcba0bf82dea@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.133.224.57]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: 91Jf/vO2pSZx



On 2019/11/8 16:11, gengdongjiu wrote:
> On 2019/11/4 20:14, Xiang Zheng wrote:
>> From: Dongjiu Geng <gengdongjiu@huawei.com>
>>
>> This patch implements APEI GHES Table generation via fw_cfg blobs. Now
>> it only supports ARMv8 SEA, a type of GHESv2 error source. Afterwards,
>> we can extend the supported types if needed. For the CPER section,
>> currently it is memory section because kernel mainly wants userspace to
>> handle the memory errors.
>>
>> This patch follows the spec ACPI 6.2 to build the Hardware Error Source
>> table. For more detailed information, please refer to document:
>> docs/specs/acpi_hest_ghes.rst
>>
>> Suggested-by: Laszlo Ersek <lersek@redhat.com>
>> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
>> Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>
> 
> Hi Xiang,
>    please add "Reviewed-by: Michael S. Tsirkin <mst@redhat.com> " which from Michael, thanks.
> 

OK, I will add it.

> 
> .
> 

-- 

Thanks,
Xiang
