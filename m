Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CFDBD46C0F
	for <qemu-arm@archiver.kernel.org>; Wed, 28 Jan 2026 23:45:43 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vlFDk-0003ux-5f; Wed, 28 Jan 2026 18:45:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vlFDi-0003tA-OS
 for qemu-arm@nongnu.org; Wed, 28 Jan 2026 18:45:10 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1vlFDh-0003TO-5y
 for qemu-arm@nongnu.org; Wed, 28 Jan 2026 18:45:10 -0500
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-2a79ded11a2so2144925ad.3
 for <qemu-arm@nongnu.org>; Wed, 28 Jan 2026 15:45:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1769643907; x=1770248707; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tbBBnoSakDeJ8pbz5bFCwaZZqQQR8SUKhGzH9AjnICU=;
 b=GEp90okActSRTtcskmMjN7WiMvrVkfr3XNyb4ezuuVZcLqhMC12kAWwPv2Q73mD9+h
 3MgLOMZlrQ9pIuspj/C6z5yvLyxvFnXhZlRfyRty3ckIg5hO/GotNf5efGy4EeUTg8Rj
 U2RLGW5gbmRzeUw2TiXCKLB+A3QqDEHO6g1b3F7Oh1cyFZ7X46JsKydTyz5pOw+ui2Ca
 wqeJx9q133X9RrxncVdwMkqPeR89wbIqd45ARnIT4mtWRvgErePc3YUvVi+J++Cry+bw
 5mTMiCo8hRk/e16xkj4zRigjxPj4W/gJyz1uWTh+/bi4+tXsnYkZH43zMD3u0uKrguhj
 RYeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769643907; x=1770248707;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tbBBnoSakDeJ8pbz5bFCwaZZqQQR8SUKhGzH9AjnICU=;
 b=Xskqy8gi+ScYmkI1jcYA/YbampTfqfs3OjWhfopiDz4pIyrVS1UbAhbp5gpDnssE5J
 rKMh5MV0yzEfsbOq9ZHz4Qlew7U0ORv/r4zAAuSgt1c0cH8zlfcsVMmd68M2jDZnoxK2
 kb4jJ9Yisbq44moGCXmdIpxBdNlEa6F2tJWsMUylgBWtbwwXCWWVYB5vLlnSz2DwaA/v
 j82t3aM7m4qoWvz5vwTJJMfS89FzbiTFtFz0D5SuVZWiBtqGqEiARQJItn8VZ38z4v5H
 wbROqOPWSTVo7o/A44AVek3dOjQB6e77w5IHIFMaywg5h1RGdFaPcQQ5BXnXS8kJU3sy
 R/RA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXx5ADbevLexq8Gr70qHirtsenKEDLVJn6su8qdsQmIsQ3/bv/tPghbRutCLhxXjgC9imIb+G8n9A==@nongnu.org
X-Gm-Message-State: AOJu0YzfBg4jpKEOQIQCoxlnrNPtbUN7ogeduufCEai/8PErg6/MXQII
 RQIrbbUGZUwsJHYRvTITVy6jNTaP3GpojOOrlLr4wBtI46fIe9vWc+9pdae3uFezrMY=
X-Gm-Gg: AZuq6aKRzz0Rqw6r5y4cRvdsgK6loAin93DO9QvnqIFwPJ3K+ApaUi1oayg19J8iYkc
 iRo7of2nZ+D7+YemwpsG+1bnsrrCnr81HEcDIN3ZJNyorPno9rE9xNwx7mthfyEl8ICYWKCCn01
 4lOX8E7xOc+JFDBN+XJOlOx9t9MB6QED4xBsK0jwWwtBXPHWCzSro6szOddKMkZHfWNHNmQ+m+Y
 /12aIQYp/QvABn6YNNXJT6dA63Im3DWWxYqiJJFGiAj3DInlUOIXwac1lAaZlCeM/tuyzbcDtvB
 bUOHVnTcr6lIXAevJlbqy49OCTAga/kcZ5qExHCwRf2+pWRwRWvhlZ0DjHAL25htPsAGbnU9Vlk
 2K86ybMO5Eflgr3pvEfaibdps+90nKQ6+mv6UIamLK0mX6BRlKBwQWW1z1hEKCYYkfcEuXYjUCO
 cb0Z8OaCFkGQB2fPuCtspRHrxoVx5E7A==
X-Received: by 2002:a17:903:40d1:b0:2a0:dabc:1388 with SMTP id
 d9443c01a7336-2a870db46camr72309685ad.28.1769643907237; 
 Wed, 28 Jan 2026 15:45:07 -0800 (PST)
Received: from [192.168.10.140] ([180.233.125.201])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a88b6e5c93sm31846835ad.88.2026.01.28.15.45.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Jan 2026 15:45:06 -0800 (PST)
Message-ID: <716a2c68-9905-4f3f-84da-d07f50e9722c@linaro.org>
Date: Thu, 29 Jan 2026 10:45:00 +1100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] hvf/arm: expose FEAT_SME2 to guest if available
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Phil_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alexander Graf <agraf@csgraf.de>, Mads Ynddal <mads@ynddal.dk>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Mohamed Mediouni <mohamed@unpredictable.fr>
References: <20260115-sme2-hvf-v2-0-2eca481bd7ee@linaro.org>
 <20260115-sme2-hvf-v2-2-2eca481bd7ee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260115-sme2-hvf-v2-2-2eca481bd7ee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On 1/15/26 22:20, Manos Pitsidianakis wrote:
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index bf303813701972648fa6751ffe352ba074ca6442..8dd9eb46c783a799a53891a6ddad40b930e95eb4 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -329,9 +329,20 @@ void arm_cpu_sme_finalize(ARMCPU *cpu, Error **errp)
>   {
>       uint32_t vq_map = cpu->sme_vq.map;
>       uint32_t vq_init = cpu->sme_vq.init;
> -    uint32_t vq_supported = cpu->sme_vq.supported;
> +    uint32_t vq_supported;
>       uint32_t vq;
>   
> +    if (hvf_enabled()) {
> +        if (hvf_arm_sme2_supported()) {
> +            vq_supported = hvf_arm_sme2_get_svl();
> +        } else {
> +            assert(!cpu_isar_feature(aa64_sme, cpu));
> +            vq_supported = 0;
> +        }
> +    } else {
> +        vq_supported = cpu->sme_vq.supported;
> +    }

While this mirrors what we do for kvm and sve, I don't think this is sustainable.  I think 
cpu->sme_vq should be initialized in hvf_arm_set_cpu_features_from_host.


r~

