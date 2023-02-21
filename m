Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp3030276ejb;
        Tue, 21 Feb 2023 00:01:30 -0800 (PST)
X-Google-Smtp-Source: AK7set+pIZGxf1zs0/Fs0gTcbf+9XvG8Q1PZuN+gnuoaJWuYnGxhE4tIz/fZ3sN6NkQt46LQZWzd
X-Received: by 2002:ac8:5896:0:b0:3b6:3f4a:8154 with SMTP id t22-20020ac85896000000b003b63f4a8154mr22108534qta.65.1676966490681;
        Tue, 21 Feb 2023 00:01:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676966490; cv=none;
        d=google.com; s=arc-20160816;
        b=r74LwTXqsY1EhoE3d7xvtN5X0U0cwbLgEkYAz69+wLcda5GddV5woZjAb9lCB5tSLX
         +85EW/rFnD21Z9Rx7us1ufNirNN8JTGB16jhlobdJ1LxYoCCWWcLOxTOG9+7a5gkrO0F
         0GPwAwa7++TAD1DJc1LnmB8DXTMwLWr6U6AZsAv02Wv8UaqtHKR52vGaZPVfzhFLrHdV
         u+2bXX/q0ubLsnkokumNQonvjcQ2dtyFhv9KqX0pZZIaVulwKb1x+Iqk6d+th/EpYlCR
         WY/6/r6VKb8FzSpUjRZBq+vbYPgEzBlvyzAGwD2sYx/PdcsaEBEOK1j2a/p1BaMSDibW
         bcPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=HAcfC9786N1eWYX1X9Q+nPdpXUymxoc3uknfRJNSbXg=;
        b=glyU1ZHLXUWRoCS98F4PRmyMPtdOdC5cn5wSHbgS28ny8FfAVhT2L06dxceUHHtl7t
         BM+dbrK0pHRM+W6716vjslBg02XFYPgqc+KYZQFBHj4QckVMCsh19R4DG0z8epCkd5vN
         sxB3iqLmnXU81TsN0tvlMtPx6kHRdkZsRwgleVLdpoxolbb8kxMNuUWlIrK2EAHzmFc6
         2BJL8Gr7xwHPd8CeWk9cspoA3fnSRwng0pbdj4Rry6hSQhw1N+cp6DjrIxW8aV2Trp6H
         cBYfhSu5oje1ID8zVcA0vxye9x+mjtuPCtNjXzbseGdHIbJZeORjuPKbNIZHacuk71QD
         2+0A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KbqgUTVy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h13-20020a05620a284d00b00732e4f596c3si12035690qkp.99.2023.02.21.00.01.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Feb 2023 00:01:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KbqgUTVy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUNaQ-000671-PP; Tue, 21 Feb 2023 03:01:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUNaO-00063x-1V
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 03:01:16 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUNaL-0002XL-Vo
 for qemu-arm@nongnu.org; Tue, 21 Feb 2023 03:01:15 -0500
Received: by mail-wr1-x433.google.com with SMTP id l1so3119973wry.10
 for <qemu-arm@nongnu.org>; Tue, 21 Feb 2023 00:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HAcfC9786N1eWYX1X9Q+nPdpXUymxoc3uknfRJNSbXg=;
 b=KbqgUTVyIOjnpXumZ5k9JwjhUl92YtNT3PksfYTsregNz4R6QOw9X6sj+FE++MPCVo
 E4RSRHh6jRlkNdYZbHOrNG0t1aOJe6Eb6VKMGjxqXVv/npiCnIWfWNBF3RzIqKn6xRpZ
 s0LVpwHfliM9k8VH+FJlsUObwV1S3Fo69cerbVTkuTYidVJJZhXv1tZc4OXdH2zMS/aN
 UVBq6uB1z1SCS5KCj9X/e0ABPOPBQS44esnChABknSfVjf0Pu1An8tbXKEi9ujqFBlDX
 IrEm0Nztl8XbWB7TZyQNmAC/YIzFlqbsr+DfPBPkMh9YzS7bUQ/b+E+XrgyF+ugVyT+A
 0Rzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HAcfC9786N1eWYX1X9Q+nPdpXUymxoc3uknfRJNSbXg=;
 b=FNXzk2V6Aqsat3WJMuEYY4uw27C/W7rZ4rmEyXsLJ2jXhnr9oUyVPdzV0Myj30n669
 DjUzrDIXZpOzdFur0kjyLSo5e0AUkwBJOzJyNROihP8MEeYZSOkPrdCon9NJQ6B0MeMF
 j3pQR3gjIEDzBfVC7BKyb+dLO4uS9fpbQ6KbyA186wSoRoeZWvHlD6n4ssCqMo7sxWr+
 bRoKK2ObKnbVqvGHahDqbzohq9c50rB0RNdiRBgz3mvO6wkwNAmqN3CXQiw6R65auXEz
 L/DMTKuSBTdkZrspBMvLO3Vg/ows5uX6ewnRbj0dl82hwn+0CpuoFL/7Jz+BJi0rozie
 5v4Q==
X-Gm-Message-State: AO0yUKVVtsU0F8VKKR7sPUOqAfpCvy+v2NLJy6j6pCEg8QIHb9Q6xXUs
 4WfhrLQDgtLHFpWdOwizJifoCA==
X-Received: by 2002:adf:f390:0:b0:2c5:8353:e0ec with SMTP id
 m16-20020adff390000000b002c58353e0ecmr3104693wro.10.1676966472429; 
 Tue, 21 Feb 2023 00:01:12 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 o24-20020a5d58d8000000b002c7066a6f77sm441810wrf.31.2023.02.21.00.01.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 00:01:11 -0800 (PST)
Message-ID: <f0fd8c19-6660-7fdf-1db7-05537b45b91a@linaro.org>
Date: Tue, 21 Feb 2023 09:01:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 2/2] target/arm: Fix arm_cpu_get_phys_page_attrs_debug for
 m-profile
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20230221034122.471707-1-richard.henderson@linaro.org>
 <20230221034122.471707-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230221034122.471707-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: QiAAXUeNagpt

On 21/2/23 04:41, Richard Henderson wrote:
> M-profile is not supported by arm_is_secure, so using it as
> a replacement when bypassing get_phys_addr was incorrect.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1421
> Fixes: 4a35855682ce ("target/arm: Plumb debug into S1Translate")
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/ptw.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index cb073ac477..057cc9f641 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -2974,9 +2974,10 @@ hwaddr arm_cpu_get_phys_page_attrs_debug(CPUState *cs, vaddr addr,
>   {
>       ARMCPU *cpu = ARM_CPU(cs);
>       CPUARMState *env = &cpu->env;
> +    ARMMMUIdx mmu_idx = arm_mmu_idx(env);
>       S1Translate ptw = {
> -        .in_mmu_idx = arm_mmu_idx(env),
> -        .in_secure = arm_is_secure(env),
> +        .in_mmu_idx = mmu_idx,
> +        .in_secure = regime_is_secure(env, mmu_idx),
>           .in_debug = true,
>       };
>       GetPhysAddrResult res = {};

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

