Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp4468268ejb;
        Mon, 6 Feb 2023 10:39:19 -0800 (PST)
X-Google-Smtp-Source: AK7set8+mv7ctIjdbhdJ0SJjvjGWFWN+AjlT4bZCDBUgiX3Dkz5E7JP3NM3Kyn4kfAtGmjV1BLev
X-Received: by 2002:a05:6214:d6e:b0:54f:c21f:f273 with SMTP id 14-20020a0562140d6e00b0054fc21ff273mr223053qvs.5.1675708758888;
        Mon, 06 Feb 2023 10:39:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675708758; cv=none;
        d=google.com; s=arc-20160816;
        b=vtqM81arBlSj5aJ1f5ENPZAcwcT8BZ0FEG6P4h4gq83Q+UDt5GGz/Pg2yBlNfI6hXn
         5czsWTeXGfaIJLWq6fmrd0CaN99kQEF3KUcVU5dQTo+cuSNK1LBktjC+JG8KyO3NCnBP
         +bI8NUJTNZhJRIBfH7o8mQS5p2deHeWLoeh3YWX9KOsoHubGKHrXBVfyO654k2sOOgu5
         qPw39BImmpW7xhgtCpApxUtZmKyGPW/M6UF7AJll1A5f1phx2eVxnbxKsR/N6LO9P591
         MBb3VBlSaJX+76RlUTdlpEc9CpYXxN2IPRC0vpcNLCbosfqHd+Vq2NHkiTxIgmGLtW6s
         jzHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=565L2xF5k9TqD2ASC6di7Sxu9PLFzcP9o7TCEyUYZDk=;
        b=s05MKJLx8nkzsLKYhSzFJR2wCnYxE8NIceeKTX75PapR2TIuxUPrbiUz27zVUhqMcb
         L9VAWAKHtPrJC5Mms5GwbiB+GBmqpxfZv4g5El2I1H28OwJk/vZeq9wREMqTVX7etyLH
         qP3p/aUbZLc6Kn/66E0BwXhoiyBloTYvQRllLeg+VkMTxHwRGN5Nv3yZNtKZX2IFFdyh
         Pk8pe14j9vymvP27S1KZCCR9v+uXnqCs6FKR5Mc8pnvTgoxYWkflp6uSTEBrqLGK9LtU
         cBZOPBCLjOlZBxeg1FieFszKfy7d94FRsZcjlfstereKkkDfC6udqhd1lxxTC5O+TTqo
         ONrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NvFHrihv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bl26-20020a05620a1a9a00b00706af6626dfsi9279219qkb.750.2023.02.06.10.39.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Feb 2023 10:39:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NvFHrihv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP6OR-0008MQ-02; Mon, 06 Feb 2023 13:39:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pP6O2-00083M-BZ
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 13:38:50 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pP6Nn-0003B2-Ac
 for qemu-devel@nongnu.org; Mon, 06 Feb 2023 13:38:41 -0500
Received: by mail-pl1-x644.google.com with SMTP id u9so8846796plf.3
 for <qemu-devel@nongnu.org>; Mon, 06 Feb 2023 10:38:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=565L2xF5k9TqD2ASC6di7Sxu9PLFzcP9o7TCEyUYZDk=;
 b=NvFHrihvDc5YLt+AdkZTtm49qI6EsYoPDUClg5s8ggIcXDWW+sqUyMaqfxGPfkiSc9
 8O1qK895RbOcJta6kNqnzRC3SFUJSjGUMliNw0ILrnOgRIDpVmCELMWGc6gzU+XHJy2+
 33YrbrvHcGkVGBuxwmLaUptd1heYP7mHQ3Lvvh7wzn6ABLEE6lO0LEmvyeFsPZbzq9YN
 95ZsUj6aM/QgJFOpZdkjKLQzNyeqzBD5GAXAsdTo4brKQm7a1BvDDxsiD2qL1MrRwIYD
 +/q3ISGT75Bd5VE4fZ7C34nCFAd8sQVKXQ1joQw3ZF7nBVHX24qSPHJifD8tC+2FkjjG
 bhyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=565L2xF5k9TqD2ASC6di7Sxu9PLFzcP9o7TCEyUYZDk=;
 b=ZU8P94ilkOeWMdos91rvk+ijCBB+751Gcvkpz1qdeOU5sBLJKdG2hZ0a5LSJLuMGXW
 QpFE8Dy73QKXwLGOPqepydZJMbmx1foGbOD/+gRbRvSkAYEuu9CWGpZrx1m78UN9j5tC
 2HBlhPxeUpHEZ7xvQiy5PDgje94NG0UQ5blgGqy+P5poMl1s9GUcWGgXcRS8DXn3Fggv
 /iZ6Fljxl9nTu5KaOOuIh0V36XhGTZua8DlEkrzpHTHwV535iXO5hB6GGDhRuzSajde0
 AZTA0+bcgTCnZjALdfZGtbCeWDbbASeqWz0uy+5b5RGRtR7zDlk6vYn9pCMsrEkxueAc
 QE6Q==
X-Gm-Message-State: AO0yUKWNJuAJmgnVZ1HPl56uaWOwg8oHGbGOQu4VDNAwTHWuO2ICDJ7K
 gSLWIAiycIUeJMaTtI3EoaS6xA==
X-Received: by 2002:a17:902:c702:b0:194:7d25:cb78 with SMTP id
 p2-20020a170902c70200b001947d25cb78mr16117036plp.46.1675708704283; 
 Mon, 06 Feb 2023 10:38:24 -0800 (PST)
Received: from [192.168.101.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 jf14-20020a170903268e00b001991cff52a8sm1934251plb.28.2023.02.06.10.38.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Feb 2023 10:38:23 -0800 (PST)
Message-ID: <2c0b8a2d-4ef2-f952-adf3-b0605f786fc2@linaro.org>
Date: Mon, 6 Feb 2023 08:38:20 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 2/9] target/arm: Constify ID_PFR1 on user emulation
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20230206121714.85084-1-philmd@linaro.org>
 <20230206121714.85084-3-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230206121714.85084-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::644;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x644.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: C6sE1rQ0aksq

On 2/6/23 02:17, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/arm/helper.c | 12 ++++++++++--
>   1 file changed, 10 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

> 
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 5dbeade787..b58800a1a5 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -7021,6 +7021,7 @@ static void define_pmu_regs(ARMCPU *cpu)
>       }
>   }
>   
> +#ifndef CONFIG_USER_ONLY
>   /*
>    * We don't know until after realize whether there's a GICv3
>    * attached, and that is what registers the gicv3 sysregs.
> @@ -7038,7 +7039,6 @@ static uint64_t id_pfr1_read(CPUARMState *env, const ARMCPRegInfo *ri)
>       return pfr1;
>   }
>   
> -#ifndef CONFIG_USER_ONLY
>   static uint64_t id_aa64pfr0_read(CPUARMState *env, const ARMCPRegInfo *ri)
>   {
>       ARMCPU *cpu = env_archcpu(env);
> @@ -7998,8 +7998,16 @@ void register_cp_regs_for_features(ARMCPU *cpu)
>                 .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 1, .opc2 = 1,
>                 .access = PL1_R, .type = ARM_CP_NO_RAW,
>                 .accessfn = access_aa32_tid3,
> +#ifdef CONFIG_USER_ONLY
> +              .type = ARM_CP_CONST,
> +              .resetvalue = cpu->isar.id_pfr1,
> +#else
> +              .type = ARM_CP_NO_RAW,
> +              .accessfn = access_aa32_tid3,
>                 .readfn = id_pfr1_read,
> -              .writefn = arm_cp_write_ignore },
> +              .writefn = arm_cp_write_ignore
> +#endif
> +            },
>               { .name = "ID_DFR0", .state = ARM_CP_STATE_BOTH,
>                 .opc0 = 3, .opc1 = 0, .crn = 0, .crm = 1, .opc2 = 2,
>                 .access = PL1_R, .type = ARM_CP_CONST,

