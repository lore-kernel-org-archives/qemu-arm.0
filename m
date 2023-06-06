Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp3257338ejb;
        Mon, 5 Jun 2023 22:32:04 -0700 (PDT)
X-Received: by 2002:a05:6000:44:b0:304:79c1:725d with SMTP id k4-20020a056000004400b0030479c1725dmr869581wrx.45.1686029523921;
        Mon, 05 Jun 2023 22:32:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686029523; cv=none;
        d=google.com; s=arc-20160816;
        b=jm1/AGLkRsAbqu8X8cTJgHCfOjLxDD/xzcEI5JkDzuf9s9HYmi51Fau9wGUm3MUJRt
         /aFUnFVxMlhgqvSXQaJiCR17R6HOl2AxMEmK7ZFa463NocRCAkZbPdwe8OXSILjZBMom
         pzmyk52NiVY0QgDEm5JXFBfn1+R/I5LuJ7ijH30P7DmBNDdDYzoOX7OAy137Ac1xJVSj
         sisZ4V9HVH7MBVmLSqUgr20Ik2ziMkGvq+AP/zZI6fHzGsE7MhlIEOZ9Z538CDOpUMOz
         GMFLeQsUmEQvlsGuwWnf7g49XgvqluJ9FAmVNlUD/+SfhtQON+kggP6gyW2P/lENmntb
         nOvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=4VfOOJinkjSh0l6gqLPyVdZ8e/+vLTEa7wa66JblaO8=;
        b=kvhPV3CI7FxQsuQv9C0s8I2wgB3vwC3kddK9a6sUcY1Lp02QiWSb9OtTw7fASgEHDM
         qDxeMDJvsLAru0uykGKALaT98Z4I5PyBQ7ymALqxCvkulWBUlqb/a6B0Q073Sz/IrpZC
         cDFhEFJMHariTrHkJJppvoVzz/Ys5c/dt2hj861L3l/cXSgxfePV+haNS/9R4nWL9Dtg
         ki2iioGGfiTqZAS+Msf1CTUGFhMy3g3Kn7dPc5lEBJys8c+G8CSughDlogXk2VYHU7E7
         gQXZlsLVUu/IG4UgyPh8v1Lc/njXpLKMtvkm/RUsoVANe88ZLCazqTU3HDzqDreKF3ZA
         Qg8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wfJmQ+zv;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l7-20020a056000022700b003062e60c2f3sor3138157wrz.1.2023.06.05.22.32.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 Jun 2023 22:32:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wfJmQ+zv;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686029523; x=1688621523;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4VfOOJinkjSh0l6gqLPyVdZ8e/+vLTEa7wa66JblaO8=;
        b=wfJmQ+zvrNbpk09oYfwAqwk9SS0iVDZEAWLyBiOOHlfnE/jQo6QrhdGayqYC4EamnA
         TyBfJJgBV2pBgcKU0fxdDcWtJVV9FjhJnN41c6gCct5d0EHO7X0R/55eN7N4gLKw5MTH
         Zur32UJArgDQEg4Uv8O7jwVBeB4JAjMlhoq3JM3zI9HpZIcP+1bj5VMPjn5FNJknkaBV
         1XsD9hhxvT8QmJrZdpvccHXwUInj/YSPZOMWCL7ELMKezBeYuIDOdl30pfvgEA1ko/zp
         mWWI1LolhPD8bFt0Md3Aclv6P8zxcH12UWHsqwbm1+rx7mS3UrjpeBOsr1oCborWTfwi
         J+TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686029523; x=1688621523;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4VfOOJinkjSh0l6gqLPyVdZ8e/+vLTEa7wa66JblaO8=;
        b=fiDsXS1jYzSIk3nAoatwAcDElJvVqMB6AGsfNnwJLArB3g7Nln8GPtO7uhd2/xUpiq
         ohupG4L+bsngbdypJLfoJPph+PXxlTK+DCrRF56C674BzDgg7sl3ZpHE44P/Dx24vPNP
         c25B5etNrq+UrDdJyZf5J7KjqzVXBoejSBVdhzVlX7LCwcSambyoKRAQFQSoVS5T6SLd
         F/xBQF5qHhcMcJPBFouDMz173ZC0e2XgsqDZGRnh86fiJENUfXsL+zhD9F5ZIMSXSlnS
         9VeC5mPj9TKsUiqnOZlaqS8KBqJ3gBgoF1HJm1/F5RwHj1BPZZU50aDi8DcfpmSxKR/A
         nsUw==
X-Gm-Message-State: AC+VfDwrho3gJHQ0UIIbwMXj/buZZo+JWQs8Zdk+MHvMkQrnuiSmSNQG
	zWhhccAKBwkaHGRpP8JmqLuD/kQi
X-Google-Smtp-Source: ACHHUZ7KW5f46Fu2TwW8RcBsG/OabhqdnHsanr6dWn081cYThqa/uEaRyr5Xt8LyYeDjG1Kl+Ie6Dw==
X-Received: by 2002:adf:e3c8:0:b0:306:2eab:fb8c with SMTP id k8-20020adfe3c8000000b003062eabfb8cmr885316wrm.42.1686029523455;
        Mon, 05 Jun 2023 22:32:03 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] (vbo91-h01-176-184-50-104.dsl.sta.abo.bbox.fr. [176.184.50.104])
        by smtp.gmail.com with ESMTPSA id q12-20020a05600000cc00b003093a412310sm11412127wrx.92.2023.06.05.22.32.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jun 2023 22:32:02 -0700 (PDT)
Message-ID: <98003cfe-742c-d932-5949-499750489663@linaro.org>
Date: Tue, 6 Jun 2023 07:32:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.2
Subject: Re: [PATCH 01/10] sysemu/kvm: Remove unused headers
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 kvm@vger.kernel.org, qemu-ppc@nongnu.org, Paolo Bonzini
 <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>
References: <20230405160454.97436-1-philmd@linaro.org>
 <20230405160454.97436-2-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230405160454.97436-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: LRYyE/cmhNCd

On 5/4/23 18:04, Philippe Mathieu-Daudé wrote:
> All types used are forward-declared in "qemu/typedefs.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   include/sysemu/kvm.h | 3 ---
>   1 file changed, 3 deletions(-)
> 
> diff --git a/include/sysemu/kvm.h b/include/sysemu/kvm.h
> index cc6c678ed8..7902acdfd9 100644
> --- a/include/sysemu/kvm.h
> +++ b/include/sysemu/kvm.h
> @@ -16,9 +16,6 @@
>   #ifndef QEMU_KVM_H
>   #define QEMU_KVM_H
>   
> -#include "qemu/queue.h"
> -#include "hw/core/cpu.h"
> -#include "exec/memattrs.h"

Oops this is incorrect...

   MemTxAttrs kvm_arch_post_run(CPUState *cpu, struct kvm_run *run);

MemTxAttrs is not:
- forward-declared
- used as pointer

Since this is now merged as commit 1e05888ab5 I'll send a fix.

>   #include "qemu/accel.h"
>   #include "qom/object.h"
>   
