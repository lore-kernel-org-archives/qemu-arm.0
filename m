Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp3268176lff;
        Wed, 4 Aug 2021 01:51:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwSVBsq2jJhH0cKK2eS06qn5M9KlyRsLIMLWEc8zRwn7yQxRcyDQCohV65zsHjgCRzPC7ZC
X-Received: by 2002:a25:7cc3:: with SMTP id x186mr16314988ybc.227.1628067091804;
        Wed, 04 Aug 2021 01:51:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1628067091; cv=none;
        d=google.com; s=arc-20160816;
        b=TfaoaCsSt1wwW4Rn+I19+VeMgqQ8YsGL43+8O64A87ULdq7zrimpZPaapXckpyZHx7
         UzuI2TIXylz2kl2tG3vJkdYE5SJSy5lcDWWsRsTOc4todq7+gPSUX96KFg03V8OqsEJX
         r9bganh8UbXm77dbHzzPVwsX6+IjH1VMFOtmsjzI2HSruDMIFMDCSiUQuFv7jZxZ1yhZ
         KsAy7XOQJChDdjGN2TpYH80mONF5i7KxhT1+FFJNdxj6G1yGrsjDavpgPSrRjUZ90PCY
         qKBwN7e9Np7Jfcdv3nAeEeWvlYuM6Fg6LP0HSHmmym4Xy1pVg4qGZW3CGQnoDg5sdxfA
         pcxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject;
        bh=o7/3LM+PwdUXmJzf6MtZMAe3NubzWQS14ie6dPp5CeA=;
        b=hNYB4X8fOkaNcsxbpbfU7Ttp0MCkdyyZijRr+xHnz3wDwSwQHp/EmxSrTjLGBH+EVr
         wbjg6QxzB4JakQAOf/XL0UZ+VkU1vys5VbmOzFJQon4dw0/L2G1EkuJwVsix0vsQ6R5D
         A+5cPYy5ocTZ7Ax/uxAZTK8d1StqLd/thKSj0FuU09JOQRWMJ+p71/ENcH3LUBcQxNPK
         44hfUxn0ebBzlt7EuRUJvvhFLRYz9LQufw2d9Zv7xsnj796B8ABldJPo1oqAUFk8kBFE
         RL2e5QQ+BfvQH8CiASJo8h4SLkCB53HwrMSDnMuGzEt6cuedXarmKQUG4Z1CafIdYTnm
         fVUg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=hisilicon.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r18si1829557ybb.156.2021.08.04.01.51.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Aug 2021 01:51:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=hisilicon.com
Received: from localhost ([::1]:39852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mBCcd-0001vr-55
	for alex.bennee@linaro.org; Wed, 04 Aug 2021 04:51:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenxiang66@hisilicon.com>)
 id 1mBCcP-0001u7-Mn
 for qemu-arm@nongnu.org; Wed, 04 Aug 2021 04:51:17 -0400
Received: from szxga08-in.huawei.com ([45.249.212.255]:2269)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenxiang66@hisilicon.com>)
 id 1mBCcN-00016f-3m
 for qemu-arm@nongnu.org; Wed, 04 Aug 2021 04:51:17 -0400
Received: from dggeme756-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Gflny4WZQz1CR86;
 Wed,  4 Aug 2021 16:51:02 +0800 (CST)
Received: from [127.0.0.1] (10.40.193.166) by dggeme756-chm.china.huawei.com
 (10.3.19.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 4 Aug
 2021 16:51:08 +0800
Subject: Re: [RFC] hw/arm/smmuv3: add device properties to disable cached iotlb
To: Peter Maydell <peter.maydell@linaro.org>
References: <1628066148-29133-1-git-send-email-chenxiang66@hisilicon.com>
 <CAFEAcA_szNgL0W6D1y6iJNjvxjN4kfFZEePstxn=g6u8TbiL4w@mail.gmail.com>
From: "chenxiang (M)" <chenxiang66@hisilicon.com>
Message-ID: <fe0370ba-75ee-2082-88f0-613515f9045f@hisilicon.com>
Date: Wed, 4 Aug 2021 16:51:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_szNgL0W6D1y6iJNjvxjN4kfFZEePstxn=g6u8TbiL4w@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.40.193.166]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggeme756-chm.china.huawei.com (10.3.19.102)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.255;
 envelope-from=chenxiang66@hisilicon.com; helo=szxga08-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Linuxarm <linuxarm@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DRNw79xgbEZk



在 2021/8/4 16:45, Peter Maydell 写道:
> On Wed, 4 Aug 2021 at 09:41, chenxiang <chenxiang66@hisilicon.com> wrote:
>> From: Xiang Chen <chenxiang66@hisilicon.com>
>>
>> It splits invalidations into ^2 range invalidations in the patch
>> 6d9cd115b(" hw/arm/smmuv3: Enforce invalidation on a power of two range").
>> So for some scenarios such as the size of invalidation is not ^2 range
>> invalidation, it costs more time to invalidate.
>> Currently smmuv3_translate is rarely used (i only see it is used when
>> binding msi), so i think maybe we can disable cached iotlb to promote
>> efficiency of invalidation. So add device property disable_cached_iotlb
>> to disable cached iotlb, and then we can send non-^2 range invalidation
>> directly.
>> Use tool dma_map_benchmark to have a test on the latency of unmap,
>> and we can see it promotes much on unmap when the size of invalidation
>> is not ^2 range invalidation (such as g = 7/15/31/511):
>
> Hi. Can you send all patches to the qemu-devel list, please (you can
> cc qemu-arm if you like)? The automated patch-handling tools and some
> developers only read qemu-devel.
> https://wiki.qemu.org/Contribute/SubmitAPatch has some more detail
> on sending patches.

Ok, thanks for your remind. I will resend it to qemu-devel list.

>
> thanks
> -- PMM
>
> .
>


