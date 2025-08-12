Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4149ACA0EC4
	for <qemu-arm@archiver.kernel.org>; Tue, 12 Aug 2025 06:25:32 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uliRc-0000fF-Kb; Tue, 12 Aug 2025 02:25:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uliRP-0000SP-OL
 for qemu-arm@nongnu.org; Tue, 12 Aug 2025 02:24:59 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1uliRJ-0007At-Ed
 for qemu-arm@nongnu.org; Tue, 12 Aug 2025 02:24:59 -0400
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3b78d729bb8so2928359f8f.0
 for <qemu-arm@nongnu.org>; Mon, 11 Aug 2025 23:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754979887; x=1755584687; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Skp3Sj8ffOqN+1Y0U2M8nclHLhT4M40r5fxgnYMTLgw=;
 b=Aq4Av5j2Dr4A/pxLFGtGBsOIAnJAjlLznSENlJ7Os+Mb8KGuADaS01A75YerGKnQk+
 e276EQQ/10tYvcPbu++dTTu8so4Dxj7bjHS703WD4X05sKFi3mhiYjrJUqK3H3O6YB6Z
 RqnZNBfo/OGHs7o7c8bhL4fNEg+6AJ1HTQrjLWMLnjIR4Rp+soa1uJ3SmhP17G2pOAsU
 2cTcYAf2crBTfjGXcTdx/mQaCc1wfAgcQ8TDOSVJDklEHyUo0BVaizblZ+GDmx3ewunF
 zMkkNjAZ4achJmQ3TtNMJwjgeDdUo+uMNQWV5+TiTy5tff3T4VwpdurzpRcsmu2YyFE/
 H5lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754979887; x=1755584687;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Skp3Sj8ffOqN+1Y0U2M8nclHLhT4M40r5fxgnYMTLgw=;
 b=dinMG6jedIYUxWEZ9FTalvhCsLWZnaBpwLA18f3jBLdytmn3nq+0s/92gywNFhS8fL
 E31M1rwgu20hwNir24DojZ+N9Xpa6ugNuiN6UndDBJTKRuEoXdEM5BYKYSBVjdiQ57wO
 9L0V00s23ZHkaNWX8WUcOpFI9EG+3lbnreULN4mXKnx1eLCUgLX48elgXpUat4+k9jDk
 uBK6jn61hFcH0978W6bhsqlAHjqOlK1FDb1WxPL9F62dBpnrtrxTJgAIGmqTIMH9SM2l
 FtKm6Nw1LKIjBRxABxpKuaQGWaB0EqGoGjKinQ1++z7m1HUruBC+x2gb1nSMHGAMY1ek
 nasg==
X-Gm-Message-State: AOJu0YwwzlVimxX6OTEq9yQaJCpX7FIivmik1hpT/3b+qjt7VWRy1uDv
 ItQvo1Fm2jcIf444GrgkHrJxxRevxjZy5Vg+LfQW+Q1TUnL/RWJh4cvhylhKMDcQaChwGIsCzKX
 ppDoZ
X-Gm-Gg: ASbGncsE90XQU4zt5tyMkoZO9PNPsiLuNxFHhMcoAepfUVLeHTtp01BXhVf4EbDnrVx
 Qj0CYZ5CtThfGGss9tgDkDyrp/IM3Harusc/Ke+9SXoviY7dabrCapHBqHMrenP+ICDUwA21rvD
 LQeJxTl9R76Esi815h6vXSSl/CDhUitR+FJRlNSO5cIdfHfq1M+w+CS7PACYTuoaWMvNxJ1/FQG
 leP1zd9E7klLIUfUYy7P83oCqjD5p2TOLMboHSwnQpyRKPJnDiHLfGNI4pJquXx5frjw/jZupeL
 QA++wQFcWkDYhJCaH95HxEWKaNgSpC+Mwz1gKL4KjLR/F5RsB7NFy0vofqRekaXh7iAkiHWxSoX
 w9qjA4++atxf9/f+HlYuKhWNfEWB8t9OzGbcJN9XlYU78NrbPaOezQC5RA+JY4KB8Bw==
X-Google-Smtp-Source: AGHT+IEs8aaZPvoxHfE1VsVs5vBYqasR45I6HRqYWENtLGXMoSDPYTRpi5WI0CWMe5R+mehXJSy3XQ==
X-Received: by 2002:a05:6000:250a:b0:3b8:ffd3:7a7a with SMTP id
 ffacd0b85a97d-3b900b4db0emr11013056f8f.16.1754979887022; 
 Mon, 11 Aug 2025 23:24:47 -0700 (PDT)
Received: from [192.168.69.210] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b8f8b1bc81sm20903068f8f.69.2025.08.11.23.24.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Aug 2025 23:24:46 -0700 (PDT)
Message-ID: <4d6df871-bbe2-435a-89d3-a1784320c45b@linaro.org>
Date: Tue, 12 Aug 2025 08:24:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 21/85] target/arm: Do not migrate env->exception
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <20250802232953.413294-1-richard.henderson@linaro.org>
 <20250802232953.413294-22-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250802232953.413294-22-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 3/8/25 01:28, Richard Henderson wrote:
> These are not architectural state, only placeholders
> between identifying the exception and delivering it.
> 
> Reviewed-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/machine.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/target/arm/machine.c b/target/arm/machine.c
> index 6986915bee..8dbeca2867 100644
> --- a/target/arm/machine.c
> +++ b/target/arm/machine.c
> @@ -1085,9 +1085,9 @@ const VMStateDescription vmstate_arm_cpu = {
>           VMSTATE_UINT64(env.exclusive_val, ARMCPU),
>           VMSTATE_UINT64(env.exclusive_high, ARMCPU),
>           VMSTATE_UNUSED(sizeof(uint64_t)),
> -        VMSTATE_UINT32(env.exception.syndrome, ARMCPU),
> -        VMSTATE_UINT32(env.exception.fsr, ARMCPU),
> -        VMSTATE_UINT64(env.exception.vaddress, ARMCPU),
> +        VMSTATE_UNUSED(sizeof(uint32_t)),
> +        VMSTATE_UNUSED(sizeof(uint32_t)),
> +        VMSTATE_UNUSED(sizeof(uint64_t)),

Alternatively 4 + 4 + 8 or sizeof() + sizeof() + sizeof().

>           VMSTATE_TIMER_PTR(gt_timer[GTIMER_PHYS], ARMCPU),
>           VMSTATE_TIMER_PTR(gt_timer[GTIMER_VIRT], ARMCPU),
>           {
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


