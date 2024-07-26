Received: by 2002:a17:504:5965:b0:1be9:327d:8ee3 with SMTP id xe5csp441538njb;
        Fri, 26 Jul 2024 05:50:33 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCUM+fDoPttgMn4ToAd7sTCRqwFlRhb8TR1fMJsD2FRT+5/ZhxTlLy6wnzyCmHAdA74cDfrF3hRHKSR7WW5vu1IaTd1e6SRw
X-Google-Smtp-Source: AGHT+IHGahUrzHn/9pHoqT2d3FGiGUAqtrx+gy1BtuEHE2snHN+wB+g1y4bugLbhoXLvMvC89EeB
X-Received: by 2002:a17:907:7f24:b0:a7a:a5ae:11ba with SMTP id a640c23a62f3a-a7acb82325bmr402378166b.50.1721998233523;
        Fri, 26 Jul 2024 05:50:33 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1721998233; cv=pass;
        d=google.com; s=arc-20160816;
        b=xlD7A/pdBXdHBNNc4DTheIQ54Z7JXp/REbHQKOxb1ExPdRgmDiXYr/sFiB1htc6jAw
         fc4Q1lxbUT7NU+KnwSIeZDr+RFyRFKArv9SJyt/ex6yQT7yBu5lPA0UOnazEB4O53tyr
         cDizqBnLss0bcqx/ToN8fJUNziJDpNbixwD5/rhemZ8sQF5jIn6OGoFwJXwB9hUBWRD8
         M3ietSHSmA/xKmgxIoWYSD45CXwMtjMBcdlFdRhyG73zkxV9Jfs9A9utCDu5Z6D52N2j
         x+rfL0Q/+FaNyeocMxJUl8VXZN6LxEnoyrFUeTIUmNMjYFztUtkvxm2O/gnPE33kePPA
         B2+g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date;
        bh=0eJlXnLcpFEiqsqJo/GAPYU1rZBZYQXvaqWzJrPDB0M=;
        fh=ltxQo0qXe8er5Nkv7R9m7OZfe5CuTRR2tDe/H5O8YLI=;
        b=ONaMe64KXEmyjKwJjDBUUeQXsJoQLh8LyC3tFiUI+sf1JoBlO2hOZ4AKe9mzE7rIrv
         scLZcBeGbtOlw19Pe9DNhYJLaYpMpJW5z2wPd8AhaMSZUEFqwyi1DRm2cEZIEc9LoZm7
         rpiZmM1RzWpymM6LTP7YuW614Bkc2ocGbRkhLT6jQfiJ/SA9x2O6+hXp4OAWxOxUVDbQ
         znM0T9UW4amsd1oiY5pI4nPwxzn/9aDSccbL97varmX/PhfxQS8P28blsy6WEYyMNvVE
         tgCsAjeth4YXnIgExCqrVvHvhXG04YTC+Febf8DQ1wbaefMp13oa1f9gC01T1P4BM12s
         Wb9Q==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=huawei.com dmarc=pass fromdomain=huawei.com);
       spf=pass (google.com: domain of linux-kernel+bounces-263268-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="linux-kernel+bounces-263268-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=QUARANTINE) header.from=huawei.com
Return-Path: <linux-kernel+bounces-263268-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [147.75.80.249])
        by mx.google.com with ESMTPS id a640c23a62f3a-a7acac69539si239811866b.671.2024.07.26.05.50.33
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 05:50:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-263268-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) client-ip=147.75.80.249;
Authentication-Results: mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=huawei.com dmarc=pass fromdomain=huawei.com);
       spf=pass (google.com: domain of linux-kernel+bounces-263268-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="linux-kernel+bounces-263268-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=QUARANTINE) header.from=huawei.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 228341F2110C
	for <alex.bennee@linaro.org>; Fri, 26 Jul 2024 12:50:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0044617B515;
	Fri, 26 Jul 2024 12:50:24 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC53917B434
	for <linux-kernel@vger.kernel.org>; Fri, 26 Jul 2024 12:50:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721998223; cv=none; b=EAGq94TdsR/+b0revTqzWAWBcHmlWo0pP1j6NiIqRlwj/fSLc10Xy4MFBqzYyrrcnZquY1nIJn7LVHk2uMCoFPzXpqE/fgnh+6Fif/oczT2lfKJ30osnjv9NL1O2n4gHcANoIMKoIwfy3lLkSDTkA4l2MRc+dnwaJ//aCwrzGd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721998223; c=relaxed/simple;
	bh=vbu5wmuE6kiLqfTheOJqcqpBoX82AomStFdgGqq+3ik=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pOCotoGFrtr6GEAsqiUC+pJQ3nvuDU2/zlHwkcqMAbJkWiDMYpyg1G6vLgwu/gHhnXp3N8PyJU8TGYPSj5pdyhsolMHT6jkdWq/X6oW8iX0dEk/2MxQVA+M3kphwUeMFZEg92M5VaZ0GwzyssTRTQKLyWRDVLs6/dGys0oNQDRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WVnbk1YYmz6K5mp;
	Fri, 26 Jul 2024 20:48:02 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 82E13140B63;
	Fri, 26 Jul 2024 20:50:18 +0800 (CST)
Received: from localhost (10.203.174.77) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 26 Jul
 2024 13:50:18 +0100
Date: Fri, 26 Jul 2024 13:50:17 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC: Shiju Jose <shiju.jose@huawei.com>, Peter Maydell
	<peter.maydell@linaro.org>, <linux-kernel@vger.kernel.org>,
	<qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: Re: [PATCH v3 5/7] target/arm: preserve mpidr value
Message-ID: <20240726135017.00003cdb@Huawei.com>
In-Reply-To: <acdc77f8b53ed570aa7a59fdc83fb8ab5f79ca19.1721630625.git.mchehab+huawei@kernel.org>
References: <cover.1721630625.git.mchehab+huawei@kernel.org>
	<acdc77f8b53ed570aa7a59fdc83fb8ab5f79ca19.1721630625.git.mchehab+huawei@kernel.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml100006.china.huawei.com (7.191.160.224) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-TUID: QdehfLki0jQa

On Mon, 22 Jul 2024 08:45:57 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> There is a logic at helper to properly fill the mpidr information.
> This is needed for ARM Processor error injection, so store the
> value inside a cpu opaque value, to allow it to be used.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Seems reasonable to me, but not really my area of expertise.
FWIW
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  target/arm/cpu.h    |  1 +
>  target/arm/helper.c | 10 ++++++++--
>  2 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index a12859fc5335..d2e86f0877cc 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -1033,6 +1033,7 @@ struct ArchCPU {
>          uint64_t reset_pmcr_el0;
>      } isar;
>      uint64_t midr;
> +    uint64_t mpidr;
>      uint32_t revidr;
>      uint32_t reset_fpsid;
>      uint64_t ctr;
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index ce319572354a..2432b5b09607 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -4692,7 +4692,7 @@ static uint64_t mpidr_read_val(CPUARMState *env)
>      return mpidr;
>  }
>  
> -static uint64_t mpidr_read(CPUARMState *env, const ARMCPRegInfo *ri)
> +static uint64_t mpidr_read(CPUARMState *env)
>  {
>      unsigned int cur_el = arm_current_el(env);
>  
> @@ -4702,6 +4702,11 @@ static uint64_t mpidr_read(CPUARMState *env, const ARMCPRegInfo *ri)
>      return mpidr_read_val(env);
>  }
>  
> +static uint64_t mpidr_read_ri(CPUARMState *env, const ARMCPRegInfo *ri)
> +{
> +    return mpidr_read(env);
> +}
> +
>  static const ARMCPRegInfo lpae_cp_reginfo[] = {
>      /* NOP AMAIR0/1 */
>      { .name = "AMAIR0", .state = ARM_CP_STATE_BOTH,
> @@ -9723,7 +9728,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>              { .name = "MPIDR_EL1", .state = ARM_CP_STATE_BOTH,
>                .opc0 = 3, .crn = 0, .crm = 0, .opc1 = 0, .opc2 = 5,
>                .fgt = FGT_MPIDR_EL1,
> -              .access = PL1_R, .readfn = mpidr_read, .type = ARM_CP_NO_RAW },
> +              .access = PL1_R, .readfn = mpidr_read_ri, .type = ARM_CP_NO_RAW },
>          };
>  #ifdef CONFIG_USER_ONLY
>          static const ARMCPRegUserSpaceInfo mpidr_user_cp_reginfo[] = {
> @@ -9733,6 +9738,7 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>          modify_arm_cp_regs(mpidr_cp_reginfo, mpidr_user_cp_reginfo);
>  #endif
>          define_arm_cp_regs(cpu, mpidr_cp_reginfo);
> +        cpu->mpidr = mpidr_read(env);
>      }
>  
>      if (arm_feature(env, ARM_FEATURE_AUXCR)) {

