Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 857B7CA0EE4
	for <qemu-arm@archiver.kernel.org>; Wed, 20 Aug 2025 12:18:30 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uohlm-0003ZS-PP; Wed, 20 Aug 2025 08:18:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uohlk-0003TG-2G
 for qemu-arm@nongnu.org; Wed, 20 Aug 2025 08:18:20 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uohlg-0001Kp-QJ
 for qemu-arm@nongnu.org; Wed, 20 Aug 2025 08:18:18 -0400
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-3b9df0bffc3so4151949f8f.1
 for <qemu-arm@nongnu.org>; Wed, 20 Aug 2025 05:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755692294; x=1756297094; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ybognoV6WbqtFNmOTPlW6XerDUW2IPPZklmoaINeV34=;
 b=CBpSN7dv68DOUsOZ4yxT88AaJCsPVupHdkIlJ68ei2nkD3hiBIFF06BC11JCT8rESq
 Y3g9j/9jc3+24RGSBgcNqD4ajuCkay/wJZweKJgiuMNy0c99vXPkwrU5hdMaM/T61I7G
 cWsC991hxD3mMWcvE7E+Daw5MnSUQsjcrcWPBQAtQLcElqXRivLC1+aynGYdTVasP1oe
 PAZxwjMbbxKXqMMKkjP0tYjtbq37/9FDt0PbHJf208wOawgH/2qKgSE8ZLZh7nHLazl+
 1z8anU/XDQz1BgugCN8P4/EvGQjzzwiSi9MNlOz7xlSnPZAMtVAd3doaqGc2p/4EoXqy
 QnpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755692294; x=1756297094;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ybognoV6WbqtFNmOTPlW6XerDUW2IPPZklmoaINeV34=;
 b=tPoainTcA7496Yfj8YB6ZH4IwI/nfau0Y2G3Hz1gcnuCXnGEV7Y4Tjd5RPHRBkSRmC
 Eu84db0GcW05sG2ElKQs127M9/qu2wJt/sTgn+nA2iYZ1SzLv+g7khPy4t4cJtcqUr0f
 Px/gB3BuFJ81wsMFxbZtMrxkzoQcwMHzoMAiNCe9BzjIoi3xf6Uce90q5b/+t4FhO2RF
 Pp45luixb376sv1mhhfA69NQrRVQm80E7As7MeDsileZKHz/5PsMr3J4kIlmDDdeCe91
 7E9Vc3bca6NiJzwClnuCb1b9OoFqlcoP4DXm9ZjHFZt0tHnczlUKW2xLIDuuXtnqoZNW
 jLZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW1nW0n1Ap0PyaMXCRe74pMPOjktwIHPIMBwgfpXK+dzNnhZFy1J+vM9QbkK1Dwi87JzPdyr4dOpg==@nongnu.org
X-Gm-Message-State: AOJu0Yx7Ja9AqgC7z51d6nrT7IdDB5YnZ2r4StCAgUwwfrH8fGukUdt0
 KRbWXWA7CHhv6C0JW7uc8bRq2eomv5DGbxV/L9hwxCX27kY9qPUqpk3r67YOoPsKQpA=
X-Gm-Gg: ASbGncu7wRKyb3H28aki/pQAfpwQVRn8pRBKSgmlFhMHP++u3kWQo2ywgPQtK3d0MVe
 yMC0zOe9hDLr3eK17eSOsnQw9wdJqIV6rfQ05fvda8jMjvisJK/bgWIZ39xHDzE2N9C4yCZoVJD
 1w50lZpOke7aU6hh/l86JNotjLvlIEuDhYzfZe9GpiOaEVy8meR1NRY9dFNkiWoF7mptdNLDvXv
 upCvnGKa7GTzngUcVqNMldkLhCoP2uFSzZp1owMxNTonVRwuTlxN5XvJDnZPzbAQXQuMfOVkhFy
 JtCvOeOE3mlSPLzajV2R6rEGW38Pw9jAXIyqrjLK6PyQq5X41TwYMd1Gea2L+CM7584Ud9OMtbp
 18dpgXaD7qo2Q/6wp/JMsS3XMbJyscuwOxxDsxMABmWh1ECdOnRVTYkPvgR37sAggPY3BLa4=
X-Google-Smtp-Source: AGHT+IGTrtULt+ht7dJN6xDGFLeKQ0uTTTVFe8Sh4W/vaIx3TA00s4UfAfoWDUcWEb3t6Zl36S7lAg==
X-Received: by 2002:a05:6000:4284:b0:3b9:a346:6e7b with SMTP id
 ffacd0b85a97d-3c32f664758mr1833684f8f.35.1755692294341; 
 Wed, 20 Aug 2025 05:18:14 -0700 (PDT)
Received: from [192.168.69.208] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3c0771c1a6asm7721965f8f.44.2025.08.20.05.18.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Aug 2025 05:18:13 -0700 (PDT)
Message-ID: <188d2482-6bbd-432d-8ec3-5864d6c821a6@linaro.org>
Date: Wed, 20 Aug 2025 14:18:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 21/47] hw/arm/xlnx-versal: add the mp_affinity property
 to the CPU mapping
To: Luc Michel <luc.michel@amd.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Francisco Iglesias <francisco.iglesias@amd.com>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>,
 Alistair Francis <alistair@alistair23.me>,
 Frederic Konrad <frederic.konrad@amd.com>,
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>
References: <20250820082549.69724-1-luc.michel@amd.com>
 <20250820082549.69724-22-luc.michel@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250820082549.69724-22-luc.michel@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Luc,

On 20/8/25 10:25, Luc Michel wrote:
> Add a way to configure the MP affinity value of the CPUs given their
> core and cluster IDs. For the Versal APU CPUs, the MP affinity value is
> directly given by the core ID.
> 
> Signed-off-by: Luc Michel <luc.michel@amd.com>
> Reviewed-by: Francisco Iglesias <francisco.iglesias@amd.com>
> ---
>   hw/arm/xlnx-versal.c | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 
> diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
> index 5a08ad07b28..35c32de0159 100644
> --- a/hw/arm/xlnx-versal.c
> +++ b/hw/arm/xlnx-versal.c
> @@ -88,10 +88,18 @@ typedef struct VersalCpuClusterMap {
>       size_t num_core;
>       size_t num_cluster;
>       uint32_t qemu_cluster_id;
>       bool dtb_expose;
>   
> +    struct {
> +        uint64_t base;
> +        uint64_t core_mask;
> +        uint64_t core_shift;
> +        uint64_t cluster_mask;
> +        uint64_t cluster_shift;
> +    } mp_affinity;


> @@ -565,23 +578,31 @@ static DeviceState *versal_create_cpu(Versal *s,
>                                         size_t core_idx)
>   {
>       DeviceState *cpu = qdev_new(map->cpu_model);
>       ARMCPU *arm_cpu = ARM_CPU(cpu);
>       Object *obj = OBJECT(cpu);
> +    uint64_t affinity;
>       bool start_off;
>       size_t idx = cluster_idx * map->num_core + core_idx;
>       g_autofree char *name;
>       g_autofree char *node = NULL;
>   
> +    affinity = map->mp_affinity.base;
> +    affinity |= (cluster_idx & map->mp_affinity.cluster_mask)
> +        << map->mp_affinity.cluster_shift;
> +    affinity |= (core_idx & map->mp_affinity.core_mask)
> +        << map->mp_affinity.core_shift;

Could we expand/re-use arm_build_mp_affinity() here?

