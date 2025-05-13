Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp606532njb;
        Tue, 13 May 2025 08:39:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVovbysM8bvtOxLvryd4FWUC/vdYrkhN5h2/K76tDpQHcM5x3AxKjYi/SDBvuJ5Iqctg+Qq+ZSYca+rwQ==@linaro.org
X-Google-Smtp-Source: AGHT+IErsIcbvgDvOiPeGt1AH8Z4bPQwJxZXPZPJ8/y/HoYK0MqK7/WQO/kcQDxYUSZUvksiAUNd
X-Received: by 2002:a05:6214:5197:b0:6f5:473d:e529 with SMTP id 6a1803df08f44-6f6e47bc746mr277554156d6.5.1747150762093;
        Tue, 13 May 2025 08:39:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747150762; cv=none;
        d=google.com; s=arc-20240605;
        b=eyDT7JNWmlEK7xg/KkmCvgfIuiwPBOMBUj/kpv3VQgXUNlgGWGMDnJLco6C/qxgqd/
         GwhCJ/SlwlAyS8NCDix46rG53WIvW9fZllMsyU6ZXlBwGlfEPD8nEqKYVaFVXpxqND2N
         Z96jJSyptWagcPQpvnzyr7zPNij8EXsXAINyrOYPXxdP13MyQ/ezjoG0M/JuBuwBjTFN
         tIE+dOGUpVACGfwKVt8IN3VobyaZ+PePC7nHf4DKTEBFuFpgxKIOVTbMbwuA+hh2BvaG
         qsjI4vpl2u+tin8ZFpc2LiuQvuCw7o2nmg39P6rN4EoLp3rH1WNqMRtFKmyv9K8lU/OB
         lqlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=1aB1bR5uYVtXnisXsyHLAxy/NZGcPHLGwq4sthZMzJY=;
        fh=38yiQ+9kbnqYuU524Fl9lKuUvMUlgh1Zv80JumhNLEM=;
        b=Ln92hZ0uSTHRxeENh152olFEf9fdSdfYKPRHC9eulm1KA7RTE1g+PwNOmnMIUPr/Lm
         3p6So/+562vXWP7cEBdMu6Jqm4bjW//KpWqvnnaQBpjA8iikdTRjgRcDt8wqfTbttsUq
         b1gIiiGP0eqqUJ8KCsN+3romAd1jhTq5AnlUVBrPd8dngGu+YG7OHqFUhZ7Orv/YABR4
         i2mE8J7VcYElb8FIwV/L1KJCxo9EmZqsKIVn2e2enPBP/diIGRTEG6SCdAcvHJ10E3HP
         IdLwfD0nYFcm1saagYm/BuLc3ZDFrR2USu+4iTxKpbISkDTECJ3TdmjTULk99A9zJI5b
         877A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yGTBCOwZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f6e39e6e55si113488176d6.6.2025.05.13.08.39.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 May 2025 08:39:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yGTBCOwZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uEriq-0003R2-GJ; Tue, 13 May 2025 11:39:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uErip-0003Q6-Ov
 for qemu-arm@nongnu.org; Tue, 13 May 2025 11:39:11 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uErik-0007Sc-Qx
 for qemu-arm@nongnu.org; Tue, 13 May 2025 11:39:11 -0400
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3a0b9c371d8so4840953f8f.0
 for <qemu-arm@nongnu.org>; Tue, 13 May 2025 08:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747150745; x=1747755545; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1aB1bR5uYVtXnisXsyHLAxy/NZGcPHLGwq4sthZMzJY=;
 b=yGTBCOwZmzffOhOOah4CQ+WZexD49cZimiriI105xWDBVcyg9sd/X1S1PZphhAB7gY
 ISsTefwsM1PHLh9XoR4iJqFgM2EZEQxtX4Rh59X8gqlGlyKMt7VwsQ4bfGRKAtBWclNW
 z+a9y+4LaX9SNZvnx+CfcIeXQWAAOWy/aDdjC5GCTv50yHSpej341hljkitSSCLtOwL8
 HV2G/jBfOvrpPSCxbeNykyd79obCJHUJ8TqEIDHSdTnQgbsw14+4t6eLwnNAywwsPuqL
 66g1LxDZ4BBTH9JbG7n8fEeJLa1tDayehdmSKvLJukiIUxEROhulTT54ma2YkyQqiXWU
 BggQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747150745; x=1747755545;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1aB1bR5uYVtXnisXsyHLAxy/NZGcPHLGwq4sthZMzJY=;
 b=bxV+gQLTjpe9047/GB92W2EtdGXEvgP0UqAZMUnLTKfQR8rwPZUvPJCYi9f3L60aoT
 l0mlCbzNsBNHowf0ZBHtJ9gpQNw9ZrvLy64YiPj+rJMdmduv3Ox7T4/XYh7IYYOeD2nW
 j7wTja0ZPclgvLIlYfc35E59C/UcAOjuifXgSgGCxYBxvlVytQel0u8n8qDMAr+OQTBp
 RZLimYiav9gwHNUp7Wa27dnmf+Df/I42NAcrZ8JGaoFmYMm532Au6d015QxtZlBhRGhd
 gFGtZnMLCyjxWNqewLGOgbzilYSgIpsyhEBrFErrrjayqGwkZCvsyu9XhkdACOysd6IU
 dNsg==
X-Gm-Message-State: AOJu0Yws6yDxgrKdAgJG1/r1isCC5FbhSaUQDm99OFFEL8l/CrdmsHmR
 6lXpGK8ejeEAwS2ErOeC/dn+MjdmFp+el7L6pTx4hA/foZBdcH2T/xccxgOOziE=
X-Gm-Gg: ASbGncsNfm51EeAfpFyTowDhQNkMSLKKxAXi6d4clCP4uiPpzEIegCI9vO2fExEvGRE
 sjKi2C326Q/T2o7rlUoct7Dw+AMGNy4D2LR/woFbaRcLZNg7ntq8LqGrJiTV4Q30JeLiI7H5B3R
 M974qzH9K1nddGCiu13+2KbzR7RPD2aOL7m36kxlLPDRyZpQzUUQ+tc1PUbVxO7hKi/MEJ/ZRMV
 6RK65hAdY+z0U5YeJBx0ckYMpcV3DfXtzq/ZbC04XpTMr2fp4jvM/jSSe82q13e++gv8k5OLw97
 EiigRkGvjZCk2eE/9Nsdpf03y7MwLhLWuXzV2A1JLlcA/1ED8MxW5mobsSOoi40DiP/rg57/iHE
 E6cFUIpZql+G7
X-Received: by 2002:a5d:64c4:0:b0:3a1:fdff:5394 with SMTP id
 ffacd0b85a97d-3a1fdff552fmr10206373f8f.57.1747150744829; 
 Tue, 13 May 2025 08:39:04 -0700 (PDT)
Received: from [10.61.1.197] (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a1f58f2af7sm16816967f8f.52.2025.05.13.08.39.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 May 2025 08:39:04 -0700 (PDT)
Message-ID: <3314f721-9c5e-479b-9fcc-3b8a021efde9@linaro.org>
Date: Tue, 13 May 2025 16:39:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] hw/intc/arm_gic: introduce a first-cpu-index property
To: =?UTF-8?Q?Cl=C3=A9ment_Chigot?= <chigot@adacore.com>,
 qemu-devel@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, edgar.iglesias@gmail.com,
 alistair@alistair23.me, Frederic Konrad <konrad.frederic@yahoo.fr>
References: <20250513141448.297946-1-chigot@adacore.com>
 <20250513141448.297946-3-chigot@adacore.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250513141448.297946-3-chigot@adacore.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: llJhgV4YWqRe

On 13/5/25 16:14, Clément Chigot wrote:
> From: Frederic Konrad <konrad.frederic@yahoo.fr>
> 
> This introduces a first-cpu-index property to the arm-gic, as some SOCs
> could have two separate GIC (ie: the zynqmp).
> 
> Signed-off-by: Clément Chigot <chigot@adacore.com>
> ---
>   hw/intc/arm_gic.c                | 2 +-
>   hw/intc/arm_gic_common.c         | 1 +
>   include/hw/intc/arm_gic_common.h | 2 ++
>   3 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/intc/arm_gic.c b/hw/intc/arm_gic.c
> index d18bef40fc..899f133363 100644
> --- a/hw/intc/arm_gic.c
> +++ b/hw/intc/arm_gic.c
> @@ -59,7 +59,7 @@ static const uint8_t gic_id_gicv2[] = {
>   static inline int gic_get_current_cpu(GICState *s)
>   {
>       if (!qtest_enabled() && s->num_cpu > 1) {
> -        return current_cpu->cpu_index;
> +        return current_cpu->cpu_index - s->first_cpu_index;

Note, CPUState::cpu_index is meant for accelerators code and shouldn't
be used in hw/ (in particular because it vary when using hotplug).

>       }
>       return 0;
>   }
> diff --git a/hw/intc/arm_gic_common.c b/hw/intc/arm_gic_common.c
> index 0f0c48d89a..ed5be05645 100644
> --- a/hw/intc/arm_gic_common.c
> +++ b/hw/intc/arm_gic_common.c
> @@ -350,6 +350,7 @@ static void arm_gic_common_linux_init(ARMLinuxBootIf *obj,
>   
>   static const Property arm_gic_common_properties[] = {
>       DEFINE_PROP_UINT32("num-cpu", GICState, num_cpu, 1),
> +    DEFINE_PROP_UINT32("first-cpu-index", GICState, first_cpu_index, 0),
>       DEFINE_PROP_UINT32("num-irq", GICState, num_irq, 32),
>       /* Revision can be 1 or 2 for GIC architecture specification
>        * versions 1 or 2, or 0 to indicate the legacy 11MPCore GIC.
> diff --git a/include/hw/intc/arm_gic_common.h b/include/hw/intc/arm_gic_common.h
> index 97fea4102d..93a3cc2bf8 100644
> --- a/include/hw/intc/arm_gic_common.h
> +++ b/include/hw/intc/arm_gic_common.h
> @@ -129,6 +129,8 @@ struct GICState {
>       uint32_t num_lrs;
>   
>       uint32_t num_cpu;
> +    /* cpu_index of the first CPU, attached to this GIC.  */
> +    uint32_t first_cpu_index;
>   
>       MemoryRegion iomem; /* Distributor */
>       /* This is just so we can have an opaque pointer which identifies

Alternative series motivated to remove &first_cpu / qemu_get_cpu():
https://lore.kernel.org/qemu-devel/20231212162935.42910-1-philmd@linaro.org/

