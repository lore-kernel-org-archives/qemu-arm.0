Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp2025563njc;
        Tue, 11 Mar 2025 10:47:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVwKNF118lFWA7k77p2I6nNFEqL83GpS87YXBfdWEMEOM8tilUwXkHf49KPeIPmfpoedSevfM+ZeSs4yQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFPhVtRZ1hwE3EFJZ7gY4PkIeSBQiPnRwmbE5UfzupbkdtgIcbsT9lnbwn0/sbDOgqN3aAE
X-Received: by 2002:a05:620a:6003:b0:7c5:4c6d:7f95 with SMTP id af79cd13be357-7c55e967b95mr791128785a.48.1741715276107;
        Tue, 11 Mar 2025 10:47:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741715276; cv=none;
        d=google.com; s=arc-20240605;
        b=iDPhGEopDwvm3wprZCdjLzugtwG+5HjVtUpgVMDKYB326zRwWdrTOQH8b68RxnbcF2
         b6+vmarnxYXJueEZWc2smITPs6oYHkRafSiyLI6CrxgVhPg4GHkHXDZD/qvL/LHaacMM
         hcZK/DsphSiUotVdngbcfEUKNGQlDH/QjvhfCic3xZrwYloyF7poVIUKEbTs+lPtJ5nd
         3rnTMDYDvyJDIOzwrtxbKNdsAovkK0o7akipxi1MJlSrR5V2zq82QQ44bk6oZZCVxH5c
         x9UJQ8J7N7xVhCpdPap4h3+qzorhqGTgV7yRjl+10ZvCr5rQ7kHXb3SC9BM5KGffToH8
         3JtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=xMbQfB6FZjsgaL0CpuJkTh1ZPBBTDvDEkwVBdCkUPFk=;
        fh=YfWwqwC4e6E/+47kXeQRyR3Q/fK+Oj/vYDnP/DK3KGY=;
        b=fN96xlBtmN8Sj7FI25Bw0Mx1RM9c+nZlocAyqGLHZJ7oxpq/aFFsrTAIjl3Fu6QfeV
         v7RcZoVBwR7bV0kXPvcq9g7VnRuh/ZNe9veSQls904CooY6MmqQuiV15/aetNrEbSTrJ
         Qf7vQWnheKPGD+HGpWw6C1BMMaD0w6DE+JoOw2SB33EfJjjGVFBYZp8TN9VkrS/oTcWa
         lxmfLBDRUPFN9P3z+b0kE7KBGTY5WpkdRPwVDggM27dolvMDtsGD8doYVDxfrgT3KWPk
         fmjqjeuiBM9A1onTnJIqbZ/gc8up3BKvTB07g3v0b88ldLzl+RoyIaykj+/k4AfY8O7a
         vQiw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D9gXZCCL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c551fc88e7si455542785a.168.2025.03.11.10.47.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Mar 2025 10:47:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=D9gXZCCL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ts3hX-00017u-GW; Tue, 11 Mar 2025 13:47:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ts3h5-00013s-Br
 for qemu-arm@nongnu.org; Tue, 11 Mar 2025 13:47:12 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ts3gr-0000eD-OK
 for qemu-arm@nongnu.org; Tue, 11 Mar 2025 13:47:05 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-2ff087762bbso8724258a91.3
 for <qemu-arm@nongnu.org>; Tue, 11 Mar 2025 10:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741715210; x=1742320010; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=xMbQfB6FZjsgaL0CpuJkTh1ZPBBTDvDEkwVBdCkUPFk=;
 b=D9gXZCCL9iauTJAVaYVB5jJ8yomAJ2B+yaTp5mAsIwnemcd0h/Z5HZgfVGjXYTuOzE
 mbsXEUk3F3pd+1jeyRTwBVmmADP/3ihN2r3Q6wVHOphw4zQgdZcEmo+ytXuInN/I8wOe
 wsrEZP9xWIPFgiRjNC+K5yo2vI3Dnxax4g89+woNusqtjQePio92MrY3530YSwUrQlx3
 Di1JLZcScU+voYGrSZJlVidJHcu6TgQKIKSPQokdGfzqixgfFDDaWXjwbOlUnXwbfhh5
 Sbmvar/DfI7xPg+P0P8VjAzlaTPgRz3CyD9EamdK9REX+JtYlkeP5C/ACxaBFXonIZ+E
 sA/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741715210; x=1742320010;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xMbQfB6FZjsgaL0CpuJkTh1ZPBBTDvDEkwVBdCkUPFk=;
 b=vaFVIUcPPRdOaqvR9GI1CutfejVSZ0T4erVSUFvhDUbq1M/aGftIK3Pw/3yizItXxh
 HcOhwwZKo6xU3jn32xSnwQ6gZc4gtgWbG+deF+RD4V+PUt1bIDQj9/sdaLgVGCF9bHfh
 B+zv81MC31dyA2RP5OtBwhapCXCETr9UrQlYRIjqbF8iHteMeTpZPKMPcF/5AJcnI8+m
 kIgd1wfGYoAtUuh7tscBGijeFzORY4FRovP423qgsnCOLlgaNu4Akg6eFQhvlJveidW/
 1XYeawirtqL5YMn2xAeSInrXAoLBLjn9/tOBcZ7FF0mtPIEo8o+GQNLaXcIKlJFidSZN
 kgDg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWGOEmPQqi+DqkFPc6gkGiYnqGFd1c9/JLd9boECnLo9kpO2FdtIFw8yeziZIllHxVgQQTwRHCXw==@nongnu.org
X-Gm-Message-State: AOJu0YwUBF6QkY1hKZ19JMIPtHIYB0+dxyWJEeqMtY6RjJJrTdBqsk2m
 fPUnMsn3sCqgBKAmD7FG6bxAX5XreYwNglwbekA610lfpB2eX5ZFwKAAfl776vE=
X-Gm-Gg: ASbGncubSb+2n5/Y3nuM5s/0rTeq1pkQEyAjui0uizLPub6ZRU2aFkklMviO0verQsp
 fc7L7wynWo7XcaLIm30qd5cUti6qD4AhZC5a1bLClbRfFwyeNBJ2++35+NhruH+JfUMYEVjHjtL
 QjpoO8X8dePYQgnUkUIsSfN5NxjQmsuDOUNM9LnapgH9S2jVpmXOzQLHB2g/ICXcehdWKoH2UmL
 j5EK5qC7vUU6CkqCnQB8H1fxwrS9RnA0SLYercNrJqs16VM1HRpDQx0PFl5/beIbTWaGb/MLMmD
 KMRp5BKqKScWW1F4GXrGOBdlY0iXGnVn8ClPOrdDBsYC1zxJ2y3WE+9PgU9K5xtZNCLm+ElwnhT
 bpxyYka5C
X-Received: by 2002:a17:90b:2b88:b0:2fe:8902:9ecd with SMTP id
 98e67ed59e1d1-300ff0a9f50mr5373583a91.1.1741715209746; 
 Tue, 11 Mar 2025 10:46:49 -0700 (PDT)
Received: from [192.168.0.4] (174-21-74-48.tukw.qwest.net. [174.21.74.48])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2ff693746b9sm10210115a91.27.2025.03.11.10.46.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Mar 2025 10:46:49 -0700 (PDT)
Message-ID: <003e9831-2d15-4142-81c5-58bd973289e1@linaro.org>
Date: Tue, 11 Mar 2025 10:46:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/14] arm/cpu: Store aa64smfr0 into the idregs array
To: Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
References: <20250311162824.199721-1-cohuck@redhat.com>
 <20250311162824.199721-9-cohuck@redhat.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250311162824.199721-9-cohuck@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102d.google.com
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
X-TUID: ZIyFuNoYfOxl

On 3/11/25 09:28, Cornelia Huck wrote:
> From: Eric Auger<eric.auger@redhat.com>
> 
> Signed-off-by: Eric Auger<eric.auger@redhat.com>
> Signed-off-by: Cornelia Huck<cohuck@redhat.com>
> ---
>   target/arm/cpu-features.h | 6 +++---
>   target/arm/cpu.h          | 1 -
>   target/arm/cpu64.c        | 7 ++-----
>   target/arm/helper.c       | 2 +-
>   target/arm/kvm.c          | 3 +--
>   target/arm/tcg/cpu64.c    | 4 ++--
>   6 files changed, 9 insertions(+), 14 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
