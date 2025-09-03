Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FCE9CA0FF2
	for <qemu-arm@archiver.kernel.org>; Wed,  3 Sep 2025 12:04:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1utmDq-0004gj-9s; Wed, 03 Sep 2025 08:04:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1utmDJ-0004XT-RV
 for qemu-arm@nongnu.org; Wed, 03 Sep 2025 08:03:45 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1utmDH-0002IA-T8
 for qemu-arm@nongnu.org; Wed, 03 Sep 2025 08:03:45 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-61cb9e039d9so12851621a12.1
 for <qemu-arm@nongnu.org>; Wed, 03 Sep 2025 05:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1756901017; x=1757505817; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=algJ480OcxSO7wlz2vQBELrWBE2zSJqUfbtVSEJ4UyE=;
 b=dV/2uYWVRSntWyMV70hoc8i4VHl8I4dLZSBENZ53OiL27P0Y0OU702cuf3Zz2kxdwr
 a+8ig4L45B/CGNFuqmN5pODTTfXL/TrndI8JFQgS4aVl0+zQZUG6DWJx3/EUWWvRwPgT
 z4u0BC3+eke+6eWjWuJJPhPEKdd5DnZkeRIhJ1l9T1MEDA4MadMyewHcubtsogKf+9Gk
 42dYq5UnezT+17qn8UZOOdRkc4wKXH1uhI7HuxTePTPokmBet+7mAkybZcVarpR1Z5HL
 rA28bZYBLDk2ZcfzdVok1XvrKtyOlUn24v2hoAeq/f6Sw027hYx4+O8UrvugHlo7/Q7r
 3TEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756901017; x=1757505817;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=algJ480OcxSO7wlz2vQBELrWBE2zSJqUfbtVSEJ4UyE=;
 b=hPbtYWfzrvaDX82PhD8uvhzfkYGgbKUB71I3ucArBnRai5EvnZaVKscY/wvt9HOxhS
 3Hng43nonW/n/eWMH2+LW5MuKwhi8OCQnoK6cdj8erCUem8FbEQaEkBdcUWGU1J+qnsG
 cT6wCfYNpjDQe4dKZ/bDWen2e4euV+AOW4OVps9n5qlgthHr9oz0dCr2xWhuZ16etxSb
 MQ7Ndj6yyhBJrFvGRhbzP0YEx1sd+0mywUNy9NDSmClL3Kgi7NABHWFMVikC5Nromqsd
 3pWApliHAUqd99w2vCsV6AX9owNpsCCOY4JcUFAjiJE/Oo+cGR9Mp2iwlBb30cSR/0wK
 mtig==
X-Forwarded-Encrypted: i=1;
 AJvYcCVALoJBzzEAGHwP/breDre9415/AROkpGGqskQcr7VjseXtC4TXrwZJG0cNU9PXaYgn0BJQ4ZyE8w==@nongnu.org
X-Gm-Message-State: AOJu0Yz9GvQxt3U9Gts6TSwIaH8VYQ12ULBjQ/9Zlo9ncndUcQOZyLK5
 abNzHTleCky9n12ZSB4A2rhEQmI99NWKqKhg2adLHXQ7KU1MdPc1K3zx7ATaEowD4aU=
X-Gm-Gg: ASbGnct7azNwBSg20FhIX+Nx0vf/CzPgCYRu8+R8gI2jT19s2H+PVKf+ZnbmKIVk0UG
 EB9+wCt8Sg0mTlWBIXcHBTEiNWm4/9mU69kumNaysPf1FCU4bSkh1LEjgTc0lspiJbLHJUnWJnC
 JPeSXsmHGDBgZSLAB5pD08xkXiTjYvPOLSQJjjiLJJoDTWg3yPZPQmzyvyYc7XULvg3C2o8OQsF
 3tamjKNI3KaR4LEbWHk6OxvHwM6LsdBzkpsPKMZNdKUNFT3nN9c0LLXV0BNgVlBKi/6ZBkiXmDY
 sYuBd+N3/uyYbecvZGtdd0e2FtB51FVI1W4lktRb/p+BWOfFZtvpqzqvLJv7xiI2cpH5WC1C4O6
 IuCFX1EM2Dg/lTJovjPJrLBTb30qIRECBw1k+jjdkkUA1JZMBukk9IFD6/4tJO36053QQjjk=
X-Google-Smtp-Source: AGHT+IH5FueLXJi635PAj3vemL/fFpBhdAeNlPFyjhrfLDpYHyzIip8SLYQncJNtUHR+UP1PeybJ3g==
X-Received: by 2002:a05:6402:5243:b0:61c:6386:5398 with SMTP id
 4fb4d7f45d1cf-61d269974f5mr13761959a12.5.1756901017505; 
 Wed, 03 Sep 2025 05:03:37 -0700 (PDT)
Received: from [10.40.6.207] (93-51-222-138.ip268.fastwebnet.it.
 [93.51.222.138]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-61cfc1c7dfesm11909648a12.7.2025.09.03.05.03.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Sep 2025 05:03:36 -0700 (PDT)
Message-ID: <30d20299-1797-4e49-8dba-5ce3ed00162e@linaro.org>
Date: Wed, 3 Sep 2025 14:03:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 15/24] target/arm/hvf: switch
 hvf_arm_get_host_cpu_features to not create a vCPU
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Alexander Graf <agraf@csgraf.de>, qemu-arm@nongnu.org,
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Peter Maydell <peter.maydell@linaro.org>, Mads Ynddal <mads@ynddal.dk>,
 Phil Dennis-Jordan <phil@philjordan.eu>,
 Stefan Hajnoczi <stefanha@redhat.com>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <rbolshakov@ddn.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20250903100702.16726-1-philmd@linaro.org>
 <20250903100702.16726-16-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20250903100702.16726-16-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 9/3/25 12:06, Philippe Mathieu-Daudé wrote:
> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> index 3039c0987dc..fd209d23c1e 100644
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -869,24 +869,25 @@ static bool hvf_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>   {
>       ARMISARegisters host_isar = {};
>       const struct isar_regs {
> -        int reg;
> +        hv_feature_reg_t reg;
>           uint64_t *val;
>       } regs[] = {
> -        { HV_SYS_REG_ID_AA64PFR0_EL1, &host_isar.idregs[ID_AA64PFR0_EL1_IDX] },

Versus the original, I suggested that this should be

	{ HV_SYS_REG_ID_AA64PFR0_EL1, ID_AA64PFR0_EL1_IDX },

etc, so that the data structure could be static const.


r~

