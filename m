Received: by 2002:a17:504:749a:b0:1be9:327d:8ee3 with SMTP id a26csp239872njk;
        Wed, 16 Apr 2025 10:06:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW7Z3y3RWC3Xsqnzr/VbQTooiuu9Y7ooYVcobTfFd6AOzxknKMYvKv0UsTxqzurNyOMnfrxHnUTwwVy1g==@linaro.org
X-Google-Smtp-Source: AGHT+IFBpOsEL9Y89U9RdbWmMSc6VRKeUxXfyI9ZgfGvN57GRDskV3ABO5pUuogiPQkI4QhZREJp
X-Received: by 2002:a2e:bcc5:0:b0:30b:fe62:2329 with SMTP id 38308e7fff4ca-3107f6bdde6mr11476861fa.11.1744823189341;
        Wed, 16 Apr 2025 10:06:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744823189; cv=none;
        d=google.com; s=arc-20240605;
        b=LET79uMkjEMT3Fs2OLgcrS8p438dcBHTGFGoe1b+Jy3+2/NdNc53+Dmw6kpPSsDImc
         tSk+v4eaaPreckEJ2DytySdyWwibXitM9abJ9quBJ4381VkPBJaFl+Q88NJmLCv40Sqd
         NrrCGcqt4SXSUFxn+GxuL4ZMxr7IOONLqYzStFWTL151VlpW0Wx2aQ2uW44ZspcOLeSx
         aSPUrB0FSoWfJc571EI/377gF9U4W0HZkRnuL7L+i48Ctk0CliprTSA6+cYA38FGC9re
         sX2wjaxHN+CI6+0lz1+MrG/P4aEx+yfJvcf2km8Bp0clth2NpuRagFZgs3nbPMPy5dF8
         HUpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=pm0ody6J58bLDhdIId/qCZ9J43m8pd+bbJSV6OZ7wko=;
        fh=ByE+j3WFt/bqfRKCXjkEli2BXaFike8RKa2xec4M/x4=;
        b=RkmK+SkNOwgSVkGtablKUhpcn0mjdWCV2okYy82OEAKJs9OEQMhDtC0c4fcJmmN5wO
         Y4wfMvakaj2azH4v5blcu2lxfAgCAWpsAu3QHJipYVpQ+Ym6g/NvMHpVpf0QHUwKkblP
         v3+8fZWGYpUBpZXLgaNoAAd03RA8BrvGRS7xWb87DogrVkSdHlWXDcCMqtY6IKs2SjCU
         X17FJ9okMOpR9dTJ2+hDuRyJobic01rZdwW+d5MAot8hdtlrw9PMAwCEXAS0WMY3749B
         UB+mnf7BHdUI5TMlCfV32sWznXx1ElB9flljG2+wW1/8rnRenuIpVhhrssWdewFILdxr
         TLZw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vew8TfrI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 38308e7fff4ca-30f46607d4asi60702331fa.438.2025.04.16.10.06.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Apr 2025 10:06:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vew8TfrI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1u56DI-0002dI-Uv; Wed, 16 Apr 2025 13:06:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1u56DI-0002cy-3L
 for qemu-arm@nongnu.org; Wed, 16 Apr 2025 13:06:16 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1u56DE-0004gV-C0
 for qemu-arm@nongnu.org; Wed, 16 Apr 2025 13:06:15 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-223fd89d036so87656805ad.1
 for <qemu-arm@nongnu.org>; Wed, 16 Apr 2025 10:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1744823171; x=1745427971; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pm0ody6J58bLDhdIId/qCZ9J43m8pd+bbJSV6OZ7wko=;
 b=vew8TfrIrmH/mX75e97UpQLAZhKqmXenfulut+lIfrDu9WvYk+rYhERi45KWR6Yka7
 pWpzYoOyL932o8rq8rR18xovPDDtv5OeQz5hsuLhyn0q4vXBErg1nQQdAJv6I5Z/a/iE
 ulx/ZLxCgFMBesg0IknOIYjEnB/GEeJKOv90DgSrztgpzGZyu+R4wADggMjrsxuIYfOO
 MKfwH48vatcAjtfq2KQchS53X6b2DulUqsXE07+8p2A2Y6DwcCtHzYEwU+DQhZo0Qm3r
 lwMDaQurRIDU7uAToohKx6v5lG3EzEltDij4lHC2v6ENXWsoihwDd6HR8Qbc8m0SrkRX
 s9pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744823171; x=1745427971;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pm0ody6J58bLDhdIId/qCZ9J43m8pd+bbJSV6OZ7wko=;
 b=OGDHxOre0JEsSAVl/yTJ4+cvM3JgTMCEtBg2yX+hBltVSGw5Z78XZzAucPuf/tx1pb
 Cr8m+zw6UMn4K/rThEjBoQv1quQV5WqEVnoeTEym1VoKxDvt/R2czkN/9obY6BKS+a61
 uAzlYv6s6Sc2x+1jHPrdihkBOB8Sddl8ygLJgkJ2My9Ej0ge+3eW3PD5ZEHsRIv1p2ta
 B+/3kE3ea9InTYytrMxqdVx6rd9WnU6rP2Zfolxjl+SGqDLuKckMqwf8JRq9PeXvKQ2q
 AOkJ3IVGyZVOUGWobPKSNSE5pN5dd4hjmJUKXILT33lPf5+H3BKUT/OOnLIyRdAGzudR
 c4BA==
X-Gm-Message-State: AOJu0YwPxU6IrlNOUojIjsgC5BhP3oRMz7O5NQ2U0aXsbhzjM2NkrNt9
 1TyxUZuTY4Dh+3PGrMziBdJ1RPxb/ZbXWMfLmRj4INVXNF7Dz+Re09/Q1BpHoEU=
X-Gm-Gg: ASbGncuxuD9g5SA0wuru0UDWmuuSGDIcxbMtAIdGcmd8JI+/C6U7cq6XVivYzfN9YkW
 WZFWNrOP20FzBjUFLn+VPVOhlI+Dl1fQt265ERCJQc0ZOLz/ox+xfmnYHW5D0lsl28TDn3sMa5Z
 KIjegwy1A1eWqxg99SrP0ibTcWv2S/+6yVuD0c4qTEqbd/B9Bve9lD8BlyAHPn5OdFLGbDyHxfO
 rYL1eIPhJbc9qg77HSieJh4NxNkqA8Xz+27+VMkbrg4FDKT3IOTM3UMyn9q2M1/SB+ncBJH4CbE
 ki9Adw9gG9Z60ZymT5IDSGZpkcuNIbwxvuJHF6yV+MADT+YyTM6ErG7ipEkqocAUip0RERpijeT
 Fvuxrlz0=
X-Received: by 2002:a17:903:2391:b0:216:6901:d588 with SMTP id
 d9443c01a7336-22c358ddc27mr47902835ad.15.1744823170388; 
 Wed, 16 Apr 2025 10:06:10 -0700 (PDT)
Received: from [192.168.0.4] (71-212-47-143.tukw.qwest.net. [71.212.47.143])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-73bd2198a68sm10720483b3a.1.2025.04.16.10.06.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Apr 2025 10:06:09 -0700 (PDT)
Message-ID: <a5da81be-5ad3-4435-b783-385c498f3e56@linaro.org>
Date: Wed, 16 Apr 2025 10:06:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/3] target/arm: Replace target_ulong -> hwaddr in
 ARMMMUFaultInfo
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Anton Johansson <anjo@rev.ng>,
 Peter Maydell <peter.maydell@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>
References: <20250415172246.79470-1-philmd@linaro.org>
 <20250415172246.79470-2-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250415172246.79470-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ruaFEZDL/M1a

On 4/15/25 10:22, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/arm/internals.h | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

> 
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index 28585c07555..175fb792375 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -25,6 +25,7 @@
>   #ifndef TARGET_ARM_INTERNALS_H
>   #define TARGET_ARM_INTERNALS_H
>   
> +#include "exec/hwaddr.h"
>   #include "exec/breakpoint.h"
>   #include "hw/registerfields.h"
>   #include "tcg/tcg-gvec-desc.h"
> @@ -724,8 +725,8 @@ typedef struct ARMMMUFaultInfo ARMMMUFaultInfo;
>   struct ARMMMUFaultInfo {
>       ARMFaultType type;
>       ARMGPCF gpcf;
> -    target_ulong s2addr;
> -    target_ulong paddr;
> +    hwaddr s2addr;
> +    hwaddr paddr;
>       ARMSecuritySpace paddr_space;
>       int level;
>       int domain;

