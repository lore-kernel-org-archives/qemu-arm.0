Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp558063lfc;
        Tue, 10 Mar 2020 03:19:12 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vu7o3S1JPEYcTIfNJfOT80FBJLPdkeuQXlmnqgybWjvnrFoARO/6Z8+9lMBOYVP8r5xqFcA
X-Received: by 2002:aca:a9d4:: with SMTP id s203mr615049oie.106.1583835552592;
        Tue, 10 Mar 2020 03:19:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583835552; cv=none;
        d=google.com; s=arc-20160816;
        b=xvaBlq12m7zb3gZorf2KJidE7lEU+WR8rA5FmK9RMSqNTfBHG+8zTUM6geFnlVMX45
         3zHuMkAF69fwzVRVzgEx+XSKVN9rbSXsS/jYOvzEi0IMPezF7umm2eR2CwEW9AxdQ9ht
         8MOKfnbIhNkesvDEZJ5lwE3KC4ZHAyOSjOiCFaoVDE3CC8X/GBMJ4ouXN3eBNeHuqfxR
         ISR6ZPZIj0WNn3TOMwZ3uTTyHuHBCEQ6v4wExS7eVMq0itYm7NbcvvuLhwZVmcuCFM9s
         P6r6xjqHmnIdPR/kZwNGN2O7OGe5MXq+ZS0eQzGJJkrWktd2IPiPti0+TvuvUveAnM2R
         HLug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject;
        bh=+p4hsvJjbI9xui00AeEptqJEi+UQFyMFOxMUh/5tAmc=;
        b=xetCDAhraqrJEzFOEPdAVRjF3oXFu6qsc8DUgcqajxXcRXvXsjTjE+4XYGJRuKRnlF
         g5RhO6s66PU/kO7xXPQz9tFhQlXN+OOmNI8vIa++ASzD2L24GKvafuD6Sv0B+wJ/BOnX
         Ka0KRsEyI4PipQ/DK3eUArgtzrV1LD3LwCCJW9ckR/J131VLwAjmxuaK1VKIFhrGALqv
         x0aZa1dfrkjHLfVpEZha0YN+8cqBx8ZUamFtjea1ao5uBW5CFt60iN8uvu+xCiX2JWxm
         RmqAE/5O8ysZHRHD9uCCbX7zwghgE5j2yzTO69yYrtANLwmt1QkrCONwJZN9Xa/F/WQ9
         MqmA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id p9si7712282oth.91.2020.03.10.03.19.12;
        Tue, 10 Mar 2020 03:19:12 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726199AbgCJKTI (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Tue, 10 Mar 2020 06:19:08 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:51360 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726164AbgCJKTI (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 10 Mar 2020 06:19:08 -0400
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id A427CD65A2219E0EC76E;
        Tue, 10 Mar 2020 18:19:05 +0800 (CST)
Received: from [127.0.0.1] (10.173.222.27) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.487.0; Tue, 10 Mar 2020
 18:18:51 +0800
Subject: Re: [kvm-unit-tests PATCH v4 00/13] arm/arm64: Add ITS tests
To:     Andrew Jones <drjones@redhat.com>,
        Eric Auger <eric.auger@redhat.com>
CC:     <eric.auger.pro@gmail.com>, <maz@kernel.org>,
        <kvmarm@lists.cs.columbia.edu>, <kvm@vger.kernel.org>,
        <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>,
        <peter.maydell@linaro.org>, <andre.przywara@arm.com>,
        <thuth@redhat.com>, <alexandru.elisei@arm.com>
References: <20200309102420.24498-1-eric.auger@redhat.com>
 <20200309115741.6stx5tpkb6s6ejzh@kamzik.brq.redhat.com>
 <20200309120012.xkgmlbvd5trm6ewk@kamzik.brq.redhat.com>
From:   Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <5cfe64d3-e609-cd1e-4f92-e24cf5f62c77@huawei.com>
Date:   Tue, 10 Mar 2020 18:18:50 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20200309120012.xkgmlbvd5trm6ewk@kamzik.brq.redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.173.222.27]
X-CFilter-Loop: Reflected
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: a5D6Xj2cIo8d

On 2020/3/9 20:00, Andrew Jones wrote:
> On Mon, Mar 09, 2020 at 12:57:51PM +0100, Andrew Jones wrote:
>> This looks pretty good to me. It just needs some resquashing cleanups.
>> Does Andre plan to review? I've only been reviewing with respect to
>> the framework, not ITS. If no other reviews are expected, then I'll
>> queue the next version.
> 
> Oops, sorry Zenghui, I forgot to ask if you'll be reviewing again as
> well.

I'd like to have a look again this week if time permits :-).  Thanks
for reminding me.


Zenghui
