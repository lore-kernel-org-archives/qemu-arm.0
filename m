Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp18620ocs;
        Tue, 27 Sep 2022 21:39:40 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5tCKDX8kGAPotWEMLYRmBTcW5JcvU6FcmTuot8F5ilXsm8qKmigaWHVe7sRLTmWhlFnGDR
X-Received: by 2002:ad4:5761:0:b0:4ad:7271:d2d5 with SMTP id r1-20020ad45761000000b004ad7271d2d5mr14688304qvx.112.1664339980387;
        Tue, 27 Sep 2022 21:39:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664339980; cv=none;
        d=google.com; s=arc-20160816;
        b=nCTXDymNzlMG6J8emek8JxfiuwUJRC4N0BXm6FQTAdiPHTaTop9dA32JbyPPB4cUj8
         XTiLFuvd6pNGczCRd2HIs+gqnQMeVNtfgPBV4rRg5X/LV1cPiNdn3WPX6mGFhhHMdbAr
         rWBP/45EtRT03LBBIIAWjOS1R9dl2hMoto/ttHNTvZWaJaCxPRLz6tSkHcVqSvd1d42T
         +iPwExc/WxiwBuXmoV+xRDbNUlYRqzzeL02pk2Uq6413p6hJd5vaoN2V4cUrInGxOIdr
         lsMUMX1dDuiv5Z1wrx36vN85gqtpfLp7qBCt5cSY5Tv92d/VeIkv0NALlkr7PQO7QzZE
         5qfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:cc:to:subject;
        bh=Hi4zdrXjisvCrr6bkJBuhuLdHKMmfShRYzx7B0WVFBc=;
        b=De+Xy3va9okkT9aq4l9G4zy1FiRkcXGMfWb/EUpHV1Vtr7UEMGehgt59m6y99SDAAi
         kGR5Ae21rc/OUfWN+4xpsPzIJZoWu+CBrixiJrA0cxhVfm9vkW5xd8rAHukN5Ag4suX3
         f/JMaSytZg1pdicddU8qblxo/7erzF1HzGZEWXfN+P0bfhlqHHq8Q22DCPzP0VCTqvk4
         M+ZMrPjPy8tXaBHq9sYGZssJ4CVPpBr8gViF4UQqzzWbcCtHdpz+lP9WeMdI//0jhEMR
         fCvVQPF8s6hEdd+1xaa+ebIGaKF1V65nPJD2BxO9Iantdb1ddG3YakKOqeYB5jSAxbd9
         ZxjA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x23-20020ac84a17000000b0035cb86ab5f2si1935500qtq.731.2022.09.27.21.39.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Sep 2022 21:39:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:48538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1odOrE-0005ay-01
	for alex.bennee@linaro.org; Wed, 28 Sep 2022 00:39:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1odOn3-0008Rj-A4; Wed, 28 Sep 2022 00:35:21 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:6092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuzenghui@huawei.com>)
 id 1odOmx-0000ni-3d; Wed, 28 Sep 2022 00:35:17 -0400
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Mck734fhBzHtcw;
 Wed, 28 Sep 2022 12:30:07 +0800 (CST)
Received: from kwepemm600007.china.huawei.com (7.193.23.208) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 28 Sep 2022 12:34:55 +0800
Received: from [10.174.185.179] (10.174.185.179) by
 kwepemm600007.china.huawei.com (7.193.23.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 28 Sep 2022 12:34:54 +0800
Subject: Re: [PATCH] target/arm: Use the max page size in a 2-stage ptw
To: Richard Henderson <richard.henderson@linaro.org>, Marc Zyngier
 <maz@kernel.org>
CC: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
References: <20220913135643.55728-1-richard.henderson@linaro.org>
Message-ID: <06d21135-7114-a848-1a49-d0aec16597a8@huawei.com>
Date: Wed, 28 Sep 2022 12:34:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20220913135643.55728-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.185.179]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600007.china.huawei.com (7.193.23.208)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.188; envelope-from=yuzenghui@huawei.com;
 helo=szxga02-in.huawei.com
X-Spam_score_int: -64
X-Spam_score: -6.5
X-Spam_bar: ------
X-Spam_report: (-6.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.319,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to:  Zenghui Yu <yuzenghui@huawei.com>
From:  Zenghui Yu via <qemu-arm@nongnu.org>
X-TUID: un+ycz8lsfxB

[ Fix Marc's email address ]

On 2022/9/13 21:56, Richard Henderson wrote:
> We had only been reporting the stage2 page size.  This causes
> problems if stage1 is using a larger page size (16k, 2M, etc),
> but stage2 is using a smaller page size, because cputlb does
> not set large_page_{addr,mask} properly.
> 
> Fix by using the max of the two page sizes.
> 
> Reported-by: Marc Zyngier <marc.zyngier@arm.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> 
> Hi Mark, I think this will fix the issue that you mentioned on Monday.
> It certainly appears to fit the bill vs the described symptoms.
> 
> This is based on my ptw.c rewrite, full tree at
> 
>     https://gitlab.com/rth7680/qemu/-/tree/tgt-arm-rme
> 
> Based-on: 20220822152741.1617527-1-richard.henderson@linaro.org
> ("[PATCH v2 00/66] target/arm: Implement FEAT_HAFDBS")
> 
> 
> r~
> 
> ---
>  target/arm/ptw.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index c81c51f60c..510939fc89 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -2509,7 +2509,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, target_ulong address,
>                                     ARMMMUFaultInfo *fi)
>  {
>      hwaddr ipa;
> -    int s1_prot;
> +    int s1_prot, s1_lgpgsz;
>      bool ret;
>      bool ipa_secure;
>      ARMCacheAttrs cacheattrs1;
> @@ -2550,6 +2550,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, target_ulong address,
>       * prot and cacheattrs later.
>       */
>      s1_prot = result->f.prot;
> +    s1_lgpgsz = result->f.lg_page_size;
>      cacheattrs1 = result->cacheattrs;
>      memset(result, 0, sizeof(*result));
>  
> @@ -2565,6 +2566,14 @@ static bool get_phys_addr_twostage(CPUARMState *env, target_ulong address,
>          return ret;
>      }
>  
> +    /*
> +     * Use the maximum of the S1 & S2 page size, so that invalidation
> +     * of pages > TARGET_PAGE_SIZE works correctly.
> +     */
> +    if (result->f.lg_page_size < s1_lgpgsz) {
> +        result->f.lg_page_size = s1_lgpgsz;
> +    }
> +
>      /* Combine the S1 and S2 cache attributes. */
>      hcr = arm_hcr_el2_eff_secstate(env, is_secure);
>      if (hcr & HCR_DC) {
> 
