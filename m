Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp5164435wrm;
        Tue, 8 Oct 2019 06:25:57 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyn1kdDEDSY/mQOm/dcyxjE2VEMVYwZ/sd1iGvUDZN+rRGziSYBan/YkUJYRjce7Bdi2g4T
X-Received: by 2002:a17:906:b283:: with SMTP id q3mr28743234ejz.7.1570541157550;
        Tue, 08 Oct 2019 06:25:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570541157; cv=none;
        d=google.com; s=arc-20160816;
        b=mfoCEAky2bfeO4T9T3kxx3fuJhTm2X4W8UTq2CsMIwNC8m8w2UKgWgZUMFteJLG4bf
         7VbQklKQrwKWSSj2FHLqOIftcGlPwM/ud4jEh/gNy5b/SxFk5N7Mt0EOii/kf+Iq17Cy
         Yl6QNyfMTam1bCxSD2N4cwi4pp5AD5gxaZPeHT5CMsmmmuG+7wrxYOo31cF1fMJiEAyU
         H36piHMUcma0wV4/RcJaSx7Hcum3pwgiK93vtMRQr3HzMUDE5tirsnbcZPBXPcinVOqG
         YSKvycN4Jd7NV97BjZiB4mrVzKfPGmhrwhKxfKfP/+j84Qa1gz1cEIVH1E3QN88hvnvl
         H55A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject;
        bh=rRtQlJHWl2GyDamWCfgvJPz0/oG04xoHIcEJUZ6ylgI=;
        b=0imcEpb2FDnR1C0CTCzl0YLYcnWRzq55j9VDSlOdw6SsVXvk/kWjgkvvhbTojnAP03
         0nYM1CkIo6VbHybxOXKs+A9uE2QS7QU1uheA6v2mXrynV3oYsN4cCX/+Ol9YVr0qvGb+
         acWScqD85n83kT2zGsKlLBCqbkRCbXs7i7mhaDffEPDa/IQBTklq7SuJxqEuIAGbdXlK
         G2qOv16zIhwXxDC9y0JWZDk8ccGJIkbSoo347YOHAFfKve/fuaEX565pobVNWPIsi1Pa
         aLTXmfqlE6MnDKO1AxLXVahWXj+t59pJrnJQLIpQFxN2mulBePyI84naigc0gd9m47D5
         WN+A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id ch6si8895748ejb.275.2019.10.08.06.25.57;
        Tue, 08 Oct 2019 06:25:57 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730797AbfJHNZ4 (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Tue, 8 Oct 2019 09:25:56 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:51390 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730301AbfJHNZ4 (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 8 Oct 2019 09:25:56 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 3AF3468A6E58B3089D74;
        Tue,  8 Oct 2019 21:25:51 +0800 (CST)
Received: from [127.0.0.1] (10.133.224.57) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.439.0; Tue, 8 Oct 2019
 21:25:44 +0800
Subject: Re: [Qemu-devel] [PATCH v18 2/6] docs: APEI GHES generation and CPER
 record description
To:     Igor Mammedov <imammedo@redhat.com>
CC:     <pbonzini@redhat.com>, <mst@redhat.com>,
        <shannon.zhaosl@gmail.com>, <peter.maydell@linaro.org>,
        <lersek@redhat.com>, <james.morse@arm.com>,
        <gengdongjiu@huawei.com>, <mtosatti@redhat.com>, <rth@twiddle.net>,
        <ehabkost@redhat.com>, <jonathan.cameron@huawei.com>,
        <xuwei5@huawei.com>, <kvm@vger.kernel.org>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
        <linuxarm@huawei.com>, <wanghaibin.wang@huawei.com>
References: <20190906083152.25716-1-zhengxiang9@huawei.com>
 <20190906083152.25716-3-zhengxiang9@huawei.com>
 <20191004102051.4e45cbd2@redhat.com>
From:   Xiang Zheng <zhengxiang9@huawei.com>
Message-ID: <70a22014-27f8-0fd0-3547-e814bd1a822a@huawei.com>
Date:   Tue, 8 Oct 2019 21:25:42 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20191004102051.4e45cbd2@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.133.224.57]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: Wnc20g/b9PZs

Hi Igor,

Thanks for your review!

On 2019/10/4 16:20, Igor Mammedov wrote:
> On Fri, 6 Sep 2019 16:31:48 +0800
> Xiang Zheng <zhengxiang9@huawei.com> wrote:
> 
>> From: Dongjiu Geng <gengdongjiu@huawei.com>
>>
> [...]
>> +
>> +(9) When QEMU gets SIGBUS from the kernel, QEMU formats the CPER right into
>> +    guest memory, and then injects whatever interrupt (or assert whatever GPIO
> s/whatever .../platform specific/
> 
> and add concrete impl info like:
>   "in case of arm/virt machine it's ..."

OK, I will add the concrete impl info.

> 
>> +    line) as a notification which is necessary for notifying the guest.
> [...]
> 
> .
> 

-- 

Thanks,
Xiang
