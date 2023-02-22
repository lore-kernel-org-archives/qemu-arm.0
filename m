Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp4130510ejb;
        Wed, 22 Feb 2023 01:50:34 -0800 (PST)
X-Google-Smtp-Source: AK7set+5BvTz3Nr/0Hy9za/5q9YWWBTcPnnaSWip9KU1WTnxbt4BWyLC0A5NRTQWpdLIc64oqluo
X-Received: by 2002:ad4:5c62:0:b0:570:5389:2216 with SMTP id i2-20020ad45c62000000b0057053892216mr16211814qvh.22.1677059434754;
        Wed, 22 Feb 2023 01:50:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677059434; cv=none;
        d=google.com; s=arc-20160816;
        b=zu8lP9/LMrfSc0yiOadsVVAP6FSRI2i0tBWPToMfj6XTtXo9TD850bQbZqSJ8tcd/O
         uhVivGD2uIrOSnAiiG0Dx5WXH6IhBSWLnf6e3lX/0WsuyFmIpfav0Ilf7eaxQQlrHtRr
         JTfdy4IXYVAsFv0M57MHK2wKt3VxXFzqrdaOcoQRb9cJPYUdYXk9AnHWaTZxPg2nVBcq
         DhFQYU9EmdpTBwKaaFht6ZhUhMSH3Kaj5AzhsIxtQi55/jjTBgq0gSczht9c1wh0rR3H
         T495G5QTaKWqiPu8pXFeGC7ifP8TLuFmN/bIo4vFm7gkJBj5nVYVC7moOF0Fmuv63EpV
         wfKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=0zOMvep8EVw3eDW5CBkP343w7vBheRjU+5z6wO3rcOo=;
        b=nu8HQh7TRzVBlo0n9V7Xg1FIP72PQtx60eYDOUXo/UXlJ4ZCmHg/QFkUWLujviQDzB
         4DTBqsIU81IERdjwcPh/hNsr8tDm72YXDdtJEHclmKS2JCQ1jXOgYpAnQq2MiRL1VWSf
         CD2VbRSl1m6XiIrxIULxe8UAeCTPcbJYr+B1AvkICl6DlcuTm4+9U6Q3YXJvdTG5oNNl
         Qd3d90tCyEDTQltXKsDbmEaPdilEkCXF3gyB57J4coMTeNa6MMOSfNzcq+ROTUI70SGr
         uN5caf5RRx9Cq3vD0SNzHqMXOlzRd7KoxFd9Ig9i+zXDQmTf9rs8ZD3RnTjmz+lxPDKQ
         4Neg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="NIC/5NfV";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v14-20020a05620a0f0e00b007061b5908bfsi2976713qkl.347.2023.02.22.01.50.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 22 Feb 2023 01:50:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="NIC/5NfV";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pUllW-0004uR-D9; Wed, 22 Feb 2023 04:50:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUllT-0004ke-IT
 for qemu-arm@nongnu.org; Wed, 22 Feb 2023 04:50:20 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUllR-0003oL-Qp
 for qemu-arm@nongnu.org; Wed, 22 Feb 2023 04:50:19 -0500
Received: by mail-wr1-x431.google.com with SMTP id bo30so6535382wrb.0
 for <qemu-arm@nongnu.org>; Wed, 22 Feb 2023 01:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0zOMvep8EVw3eDW5CBkP343w7vBheRjU+5z6wO3rcOo=;
 b=NIC/5NfVv7IHBeCCe8h5Mqy6JxIdiXDwwbSjvnJ1A5Frl0WGmd8cPmBpjV9rh+P0V0
 676/Qouw3Kt/nysJb9fP3RrP3hZjb2Wn+9mda3QFaINZpKtyPV9YV6LzomnP5BBe2dUR
 wVmsCuSFzNixP+NdgPtcd+g0Rw5NNKUD0u/qZWtbFWKDO13oPy1kvQ3PS2stL6uKZPA7
 eKlbgU4XcYlKqecDnm6j83u4g1R2nqVauhBtNc5eeCvGa+k5nJZlVdVDWJE9PF+LXR7L
 oYgMA4/G5vqEGK4yoGbN3OEn8mN2/YvRLn+qV3HLjCeAh1LM/zG6EEoIwtjhhh314ve8
 yfxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0zOMvep8EVw3eDW5CBkP343w7vBheRjU+5z6wO3rcOo=;
 b=fLBN80G4dbWRdyY+Mw36rrU+WtdpBbAz3SV9gY2ggWVxYKW9ga3pPe4ZhGPBEFR4o3
 WqfW90/4jaD1w5byRUSO5opn2YWiyMhVJ11LDkbKrg95yj3j+ItOZPpaiyf8XWnEqLlR
 EtO2uAK/sNwvuKMhAojOHyYsDExflV1HEz/EaV5aSbEsAKlplR/mhv1uskOueMEYCc4x
 7B7b4COREZRiaTrlHC/RQorJPUgtFuuFJjD3zLbf8KM7+lFXrslX+GGQy69MYpbckSrq
 hi9rlcelVgh7gUvpa5uLdsT/UhWC865XzknZQM0OmIK92HnGR2oE2PgJoxf28XnsBGQG
 CHuQ==
X-Gm-Message-State: AO0yUKV5ZO+DMtmszfmDG91gOwYm+qCSrHivl45p4usRvSPly7Qb8vfB
 pzQep7h3QS5NNibJf47ASfC9hA==
X-Received: by 2002:a05:6000:1086:b0:2c7:454:ed41 with SMTP id
 y6-20020a056000108600b002c70454ed41mr4793173wrw.71.1677059416522; 
 Wed, 22 Feb 2023 01:50:16 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 a16-20020adffb90000000b002c54c92e125sm5814608wrr.46.2023.02.22.01.50.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Feb 2023 01:50:16 -0800 (PST)
Message-ID: <effda1ed-c2ad-fd2c-de0c-f2785d3e46f4@linaro.org>
Date: Wed, 22 Feb 2023 10:50:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v3 20/25] target/arm: Use get_phys_addr_with_struct for
 stage2
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20230222023336.915045-1-richard.henderson@linaro.org>
 <20230222023336.915045-21-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230222023336.915045-21-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: MAFG2oo8gmOo

On 22/2/23 03:33, Richard Henderson wrote:
> This fixes a bug in which we failed to initialize
> the result attributes properly after the memset.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/ptw.c | 11 +----------
>   1 file changed, 1 insertion(+), 10 deletions(-)
> 
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index 6fa3d33a4e..7e1aa34d24 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -37,10 +37,6 @@ typedef struct S1Translate {
>       void *out_host;
>   } S1Translate;
>   
> -static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
> -                               uint64_t address, MMUAccessType access_type,
> -                               GetPhysAddrResult *result, ARMMMUFaultInfo *fi);
> -
>   static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
>                                         target_ulong address,
>                                         MMUAccessType access_type,
> @@ -2859,12 +2855,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
>       cacheattrs1 = result->cacheattrs;
>       memset(result, 0, sizeof(*result));
>   
> -    if (arm_feature(env, ARM_FEATURE_PMSA)) {
> -        ret = get_phys_addr_pmsav8(env, ipa, access_type,
> -                                   ptw->in_mmu_idx, is_secure, result, fi);
> -    } else {
> -        ret = get_phys_addr_lpae(env, ptw, ipa, access_type, result, fi);
> -    }
> +    ret = get_phys_addr_with_struct(env, ptw, ipa, access_type, result, fi);
>       fi->s2addr = ipa;
>   
>       /* Combine the S1 and S2 perms.  */

LGTM but better have Peter double-check ;)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

