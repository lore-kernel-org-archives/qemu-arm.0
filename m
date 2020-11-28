Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3233947lfb;
        Sat, 28 Nov 2020 01:07:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzBAu6jMuNBcTAqFx63SdyVNESvE4zTJP5uD66tSBj8/lkbZoi8Mf+kMLbLBLe61BKIwrA/
X-Received: by 2002:a25:2046:: with SMTP id g67mr14231998ybg.199.1606554472730;
        Sat, 28 Nov 2020 01:07:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606554472; cv=none;
        d=google.com; s=arc-20160816;
        b=jnqawZCpY7LzkkAtH7+jEprHkao3ztYz/YDHR1YYdMwZmSSn7kEzt78Xo3d7lkKjOu
         kGaGpfK9qDvHJrxrUfaWWWg7QQhblHSK0lBRwzHcbvmyCcflTjk6L6YK8miq13psiFpM
         +Vap3y20QviFN2/732X82EhOfbFWU5hS551kPK1C65ORUQQLi2O5Z3CyW61BBIHIWALR
         Xker5A97Usr/agdfeU5qYWMdDvtEifRnnddrCRcudHAhj0BiEqY7X/UerV5emOR/ggQo
         fiojFTwhDuPx3OIwusrxKSxfsjOzUaGPCH8wSLZhSUTK9wnCIo3dWOioDHUMb0vEAq5f
         buww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=RZfJIqoq57W8xxkdd9cOIJ3reEpKiaVqU/3x+GuqSSo=;
        b=VtBgIweNwrruoHCwwgQRQSly4eC4cLreJEglM8O028FxrqerjpmwwBSI/dPXN0MvC+
         Wt2ucgnBGRShHOxlIYaq8Q42alsHd14zR1QO6dqDm7/OXdW8BJlRICtvXtk39xv61VJp
         WmTR1u9jZOIanOIJosf4ehAPRWAiVNfnUf1ltqlre7oTYskiTlDD1AUrqf+vJYdVdDyB
         Z3ZpWhFw2NlT/wffO8HQhY2QKMdk0CNoI42RRcQQkxNtrOVwMQuXl6Id7uYLXG9PzlI2
         PBP6M5trNI8401NZCiznyE2WOdrhZd8qx4qoswXwPrkaliDY6nT+aCQ0BqaF6cIloxWa
         DuWg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u19si11300667ybi.244.2020.11.28.01.07.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 28 Nov 2020 01:07:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kiwCu-0004a1-48
	for alex.bennee@linaro.org; Sat, 28 Nov 2020 04:07:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1kiwCZ-0004Yv-11; Sat, 28 Nov 2020 04:07:31 -0500
Received: from szxga03-in.huawei.com ([45.249.212.189]:2183)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangkunkun@huawei.com>)
 id 1kiwCW-0002iO-U8; Sat, 28 Nov 2020 04:07:30 -0500
Received: from DGGEMM406-HUB.china.huawei.com (unknown [172.30.72.56])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Cjlx94Rrzz4y7d;
 Sat, 28 Nov 2020 17:06:53 +0800 (CST)
Received: from dggema765-chm.china.huawei.com (10.1.198.207) by
 DGGEMM406-HUB.china.huawei.com (10.3.20.214) with Microsoft SMTP Server (TLS)
 id 14.3.487.0; Sat, 28 Nov 2020 17:07:22 +0800
Received: from [10.174.185.137] (10.174.185.137) by
 dggema765-chm.china.huawei.com (10.1.198.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Sat, 28 Nov 2020 17:07:22 +0800
Subject: Re: [PATCH] hw/arm/smmuv3: Fix up L1STD_SPAN decoding
To: Eric Auger <eric.auger@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
References: <20201124023711.1184-1-jiangkunkun@huawei.com>
From: Kunkun Jiang <jiangkunkun@huawei.com>
Message-ID: <57468db1-fb0c-a8f2-3b90-21101b3d4a9a@huawei.com>
Date: Sat, 28 Nov 2020 17:07:11 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201124023711.1184-1-jiangkunkun@huawei.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.174.185.137]
X-ClientProxiedBy: dggeme702-chm.china.huawei.com (10.1.199.98) To
 dggema765-chm.china.huawei.com (10.1.198.207)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.189;
 envelope-from=jiangkunkun@huawei.com; helo=szxga03-in.huawei.com
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
Cc: wanghaibin.wang@huawei.com, Keqian Zhu <zhukeqian1@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: avLoi2I2fvWL

Hi Eric,

Friendly ping... :)

On 2020/11/24 10:37, Kunkun Jiang wrote:
> Accroding to the SMMUv3 spec, the SPAN field of Level1 Stream Table
> Descriptor is 5 bits([4:0]).
>
> Fixes: 9bde7f0674f(hw/arm/smmuv3: Implement translate callback)
> Signed-off-by: Kunkun Jiang <jiangkunkun@huawei.com>
> ---
>   hw/arm/smmuv3-internal.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
> index fa3c088972..b6f7e53b7c 100644
> --- a/hw/arm/smmuv3-internal.h
> +++ b/hw/arm/smmuv3-internal.h
> @@ -633,6 +633,6 @@ static inline uint64_t l1std_l2ptr(STEDesc *desc)
>       return hi << 32 | lo;
>   }
>   
> -#define L1STD_SPAN(stm) (extract32((stm)->word[0], 0, 4))
> +#define L1STD_SPAN(stm) (extract32((stm)->word[0], 0, 5))
>   
>   #endif

Thanks,

Kunkun Jiang

