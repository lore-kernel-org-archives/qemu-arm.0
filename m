Received: by 2002:ac2:5e6c:0:0:0:0:0 with SMTP id a12csp274358lfr;
        Wed, 7 Apr 2021 02:27:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzsqcLYN7nFGTdNdd3blIn3myfV+zZcMCK2X/g/vXMpeVlrDj7j8FCxFqhcJGwEZhZqZqtT
X-Received: by 2002:a5b:a8b:: with SMTP id h11mr3310453ybq.159.1617787623951;
        Wed, 07 Apr 2021 02:27:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617787623; cv=none;
        d=google.com; s=arc-20160816;
        b=L91cInnmGOnAmNTgxu7LC3d7lOhojvtOJG2xAzTZJh+md1tBK6bB+b2zhDRtKVRnJb
         VyiBZYZxhmcNbFXjchObefg06qKo2DCO/Kkt9WzFPRyjuiKDIghNhRGZmU8i4AxOsI2D
         K1XvaCX1Cz1kFXK3aD9DQtdu4utPp1aIAThBzxCWjnTaTrmElCl98JkRm5h27dY81LIa
         b1498W4+JjapGOfTcx//qZTe1TqsJ1ezeX8kYkAnaw59dMUMu26CN3J1Lx91nTQ6TNer
         eWUTArQ9eNi/VNIueXzJNzuwhBzd2YpUoHr941X8lXSowoSRP2j5gZNys9MiZHZVG/W+
         LzLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=+YkR62T94tIjA6G+X3q+hJvVfopkUG4m5Fp3Z91NzSg=;
        b=xwRNuSvlf9+eKk7RKZFxjRvf56M3Dz7JXrTJmenwZ1dp3yWsWtyAbmogztrEOixrH2
         FD6N+qQDZSGq2O/m/bbZVOA9+PCS/cA09P3uKSDGCVEgwsgJ4vMsL2ufcP6M/rKrM84+
         kkmi74OFnvk0yxtYBp4Fovye0JL8a10DdfYgOs3g1aV38fMUVuw94Y8Px4bv2CKZOskY
         Lwd+m7MTqv02XTFp3HrJ62/PpNdmUIRQIDftoUoQD7Q3UFmuAeaK/bd9gE3thniwlOFX
         z24wwaGculgDvWmoQc86I0J856X6UcFryjDSK+bEJyjIEcjVBhPz8/e97Y88u8b+miUM
         7wow==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q67si26518331ybc.363.2021.04.07.02.27.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 07 Apr 2021 02:27:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from localhost ([::1]:51636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lU4Sl-0004s6-8H
	for alex.bennee@linaro.org; Wed, 07 Apr 2021 05:27:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lU4SL-0004r0-O5; Wed, 07 Apr 2021 05:26:37 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1lU4SG-0004NF-Gq; Wed, 07 Apr 2021 05:26:37 -0400
Received: from DGGEML401-HUB.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4FFf9M3CDfzRYg8;
 Wed,  7 Apr 2021 17:24:23 +0800 (CST)
Received: from dggema765-chm.china.huawei.com (10.1.198.207) by
 DGGEML401-HUB.china.huawei.com (10.3.17.32) with Microsoft SMTP Server (TLS)
 id 14.3.498.0; Wed, 7 Apr 2021 17:26:24 +0800
Received: from [10.174.185.210] (10.174.185.210) by
 dggema765-chm.china.huawei.com (10.1.198.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2106.2; Wed, 7 Apr 2021 17:26:23 +0800
Subject: Re: A question about the translation granule size supported by the
 vSMMU
To: Auger Eric <eric.auger@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, <linuc.decode@gmail.com>
References: <fa696532-5f04-aeeb-1ba3-6427675c6655@huawei.com>
 <4886d8d0-cca6-d4b2-4139-29ad52020f79@redhat.com>
From: Kunkun Jiang <jiangkunkun@huawei.com>
Message-ID: <d4b8b381-0883-4301-8967-d924ccc61ea0@huawei.com>
Date: Wed, 7 Apr 2021 17:26:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <4886d8d0-cca6-d4b2-4139-29ad52020f79@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-Originating-IP: [10.174.185.210]
X-ClientProxiedBy: dggeme711-chm.china.huawei.com (10.1.199.107) To
 dggema765-chm.china.huawei.com (10.1.198.207)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188;
 envelope-from=jiangkunkun@huawei.com; helo=szxga02-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: Zenghui Yu <yuzenghui@huawei.com>,
 "wanghaibin.wang@huawei.com" <wanghaibin.wang@huawei.com>,
 "open list:ARM SMMU" <qemu-arm@nongnu.org>, Keqian Zhu <zhukeqian1@huawei.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: nuM5Ce+TTJvk

Hi Eric,

On 2021/4/7 3:50, Auger Eric wrote:
> Hi Kunkun,
>
> On 3/27/21 3:24 AM, Kunkun Jiang wrote:
>> Hi all,
>>
>> Recently, I did some tests on SMMU nested mode. Here is
>> a question about the translation granule size supported by
>> vSMMU.
>>
>> There is such a code in SMMUv3_init_regs():
>>
>>>     /* 4K and 64K granule support */
>>>      s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN4K, 1);
>>>      s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN64K, 1);
>>>      s->idr[5] = FIELD_DP32(s->idr[5], IDR5, OAS, SMMU_IDR5_OAS); /* 44
>>> bits */
>> Why is the 16K granule not supported? I modified the code
>> to support it and did not encounter any problems in the
>> test. Although 4K and 64K minimal granules are "strongly
>> recommended", I think vSMMU should still support 16K.😉
>> Are there other reasons why 16K is not supported here?
> no there aren't any. The main reasons were 16KB support is optional and
> supporting it increases the test matrix. Also it seems quite a few
> machines I have access to do support 16KB granule. On the others I get
>
> "EFI stub: ERROR: This 16 KB granular kernel is not supported by your CPU".
>
> Nevertheless I am not opposed to support it as it seems to work without
> trouble. Just need to have an extra look at implied validity checks but
> there shouldn't be much.
>
> Thanks
>
> Eric
Yes, you are right. In my opinion, it is necessary to check whether pSMMU
supports 16K to avoid the situation I mentioned below.
In SMMU nested mode, if vSMMU supports 16K and set pasid table to
pSMMU, it may get errors when pSMMU does translation table walk if
pSMMU doesn't support 16K (not tested). Do you think we need to add
an interface to get some pSMMU info?

Maybe my consideration was superfluous.😁

Thanks,
Kunkun Jiang
>> When in SMMU nested mode, it may get errors if pSMMU
>> doesn't support 16K but vSMMU supports 16K. But we
>> can get some settings of pSMMU to avoid this situation.
>> I found some discussions between Eric and Linu about
>> this [1], but this idea does not seem to be implemented.
>>
>> [1] https://lists.gnu.org/archive/html/qemu-arm/2017-09/msg00149.html
>>
>> Best regards,
>> Kunkun Jiang
>>
>
> .


