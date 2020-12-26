Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp8509133lfq;
        Fri, 25 Dec 2020 17:46:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzjhA6scoga3c0bIRI0Lqho7v18XowNjXiWOSGlPJHM4qh5OkKfHqoNF/til01PwzHyq/Cc
X-Received: by 2002:a25:10c3:: with SMTP id 186mr49938475ybq.195.1608947168917;
        Fri, 25 Dec 2020 17:46:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608947168; cv=none;
        d=google.com; s=arc-20160816;
        b=v5OyGp40IId5EyTrbgTggi0dPnnAks4vM1ghYomQs+PPh4g4caRHt/yLoT90LVxl+D
         szPV7yR7IUNPIlJmKILPCh0oOYpICBroGhaRboxQEhKR8K37fj/f8rouehkWps8J3u/+
         7TEgWbmb8ilZApDI9ffJDjVdsNl3OydtivnUh6+YjlCuFzrKGiyE6NKp9AfUkr1xXtvo
         gWTsHCZ+04oWq/OA47zBP6C99Z3h06OCrVHU/+u9BoC++7OzrfoJuU4HBYK9QPFdBOza
         GsDnA3bocgd2GLKqYw5R/KC1bdYJzxiaCkecLGeUoOCOvzETURYTyN45qA8Tmh0xrWFN
         Zlzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=LgHvrsF0tIuMw9CQL/9QRWCY2Qpr1UEDhHV3eiyLtF8=;
        b=aDL1MkEdE4l/HummLQcHLIpo9nySoqB5BK116oVw8EDsqV7LCbTyqmU19TOFVN1WDm
         aP7Fg6AWq3HYphgD5rsOzbMkTWRl+bCRYLkkS1ZOgsoPBq9MUJyfHxlwAtb5UTGjws6Y
         07WqTYEL/IAujPOpv7PLciV4GdZstGq0wvreOPONV67LU4UwLURsAgJHIBzzO70SmQIi
         WQgqJuF1YR5GyfIdTMy+7GRefmv//TQnBWFI3zPQts3BAPWmJOpE6a2/Nok6Gqt2m68c
         Z6T56631ozObvZ660hGd59Fc70ZGYHqfNLZojQj0d2ccIo84M8PIO1IgmwLKUGmzATwr
         vRMA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e13si29710989ybp.227.2020.12.25.17.46.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 25 Dec 2020 17:46:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ksyem-0005LK-9g
	for alex.bennee@linaro.org; Fri, 25 Dec 2020 20:46:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1ksyeR-0005L5-9z; Fri, 25 Dec 2020 20:45:47 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2836)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1ksyeO-0005Cm-Uj; Fri, 25 Dec 2020 20:45:47 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4D2mnx4rBFzkwTp;
 Sat, 26 Dec 2020 09:44:37 +0800 (CST)
Received: from [10.174.185.179] (10.174.185.179) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.498.0; Sat, 26 Dec 2020 09:45:29 +0800
Subject: Re: [PATCH] hw/arm/smmuv3: Fix addr_mask for range-based invalidation
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <peter.maydell@linaro.org>
References: <20201225095015.609-1-yuzenghui@huawei.com>
From: Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <eb91a3fa-1e51-b1dd-008f-2aace04385a0@huawei.com>
Date: Sat, 26 Dec 2020 09:45:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20201225095015.609-1-yuzenghui@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.185.179]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=yuzenghui@huawei.com;
 helo=szxga04-in.huawei.com
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.561,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UYIpBkzTffhn

On 2020/12/25 17:50, Zenghui Yu wrote:
> @@ -821,6 +821,8 @@ static void smmuv3_notify_iova(IOMMUMemoryRegion *mr,
>               return;
>           }
>           granule = tt->granule_sz;
> +    } else {
> +        guanule = tg * 2 + 10;

I'm embarrassed about that.

s/guanule/granule/

>       }
>   
>       event.type = IOMMU_NOTIFIER_UNMAP;
