Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp376337lfj;
        Fri, 13 May 2022 08:47:41 -0700 (PDT)
X-Received: by 2002:a63:2048:0:b0:3db:7de7:34b4 with SMTP id r8-20020a632048000000b003db7de734b4mr4534315pgm.105.1652456861664;
        Fri, 13 May 2022 08:47:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652456861; cv=none;
        d=google.com; s=arc-20160816;
        b=QhbOdoqAh0MYe6o+1+CJOPgc/Tg6CYgno+bGhQsHheAzqh/0iXu/jKdDrg1KcbSaWC
         0YWfqPnHpu/OqLC0ZeTfgpXMNxIXP4I/59alE2XAepwovC0KQ1BcHhqsjNHhTFO1oyYG
         b46Ji3CwG77zc8DfWeIDFfZSe4QIFkrCWzn9OEXwG0Wgxj5uNqhUdNC5CJQxfJLIosdr
         3sYEt3cX0Q5GRNMr0ns8EDJzj9UG3SN+gZFdngPIXMztATVCWC+NMzLFRU1ELxxOMi0M
         Tccwjq83AdNDa4q/L3E+IfyqYsEZD8teSbjp2VxIf7670jzdkyILEdOlVVLc5Pm3hVEE
         9gDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=2BuXh1qRrTpnzjaMrIL/iTjYhvZkAEAAOeFRevvO4vI=;
        b=o7OlqFpX4ChrM4v4my5oHfOpIvH3jEXoKR/txQjKEkGSf3VpNqyHymbbsG8JssYRGY
         iKNMUd6qv/u3ogpjVP6QzhOhdgBji6ESG1l+jUDUC6wSPWbduMCyzvbMVKaBvcEsECcz
         xeYPOXAoz5L5lSllav5sy9oyVCLL5faHGCEXils8xblo5h/urQ2QAn93Ws28IFCM1u6n
         6c+qn2eQOOe5Nf5O0+kY6hDKF/KGvZWFMmifXEQpZ41V9nwq24G5wXheYXg3KR/f4Ma+
         h6OV0vwQ6mJjdFRzd3mb9mn4mkxFfWOE0kmpbmRNB87Q1hIjRGrWElhbGvwI9oZuDKTb
         tLkg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Zy1oxu++;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id i4-20020a170902cf0400b0015a2343c50csor1443032plg.6.2022.05.13.08.47.41
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 13 May 2022 08:47:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Zy1oxu++;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=2BuXh1qRrTpnzjaMrIL/iTjYhvZkAEAAOeFRevvO4vI=;
        b=Zy1oxu++EfiBIOyfTsrcRPOtf9o/GWlQgFvzz8wAY/Ai5flQnxyErZkb5moLOp0s7j
         FJTNJxUkEetofggrOzDId4I38+2uZQDhyLLAhYJOpBRHls5JrwxRf5JBuB4m9gDtdsPD
         PX9GlrCujWXmeP2HrrFZrcrhA9+mJq5NA44thHDAjijIpHvw/iQwn1DMif/8KEZCkW03
         SSUh5eYEAZXtCwbeqkAv/+ALtd02VBx6JtE1ITKk4D8Kpx0mzoywtl+XkLCZAgTpN/CT
         wWrcVz3D1ulFZncxfEx67x0eUC4qBK1ySEj8GZBigrAx/7kUv4sW/ApuLxs+zbCHXE5G
         +XXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=2BuXh1qRrTpnzjaMrIL/iTjYhvZkAEAAOeFRevvO4vI=;
        b=YpXEHjiU1IaURGfAuXH7uQ6MYSVZlURGZMHKbfbWJofgFhteUliDvG8VtMF9gpgPmz
         8m0BujTF7BRUHPxpi/UL8Y1QdbWy7NgkVSIdVKcafjq5HXbxKXiAXxNc6uld6Vpeq1IU
         zqcfhITFTeJ9jzZacyhj3X2EQGqf4ewv4ryRLQtTdwunKfLY5Q7cgC8Tyse1TnwY8cBY
         vDYyMjicK7PmTTypRcgFckhDjs1BN+Kz0YlPQ0dNGY4tOZRMB5jyoJJ5cB/LbZceRfF3
         etLO2vRpXBJSGgd5NGD96p8MwDTxcGp8r5JSqzCAHJxZj/dL0qz1cQz7gbsW3icsdFMN
         V/aw==
X-Gm-Message-State: AOAM532RBjXJN49b45VoCd5qDQtWevDk/6F2LRh7lLAj2y/hMT92BSn3
	h2z9/N4TW6/Kd9XOt0wVHDAOCoWe7KRtRJOz
X-Google-Smtp-Source: ABdhPJwDhUCtLqZaK5IIdzDei3ZE3tbzvFFfZWOmIKSVsXYINa1DcXDA1ZvgaCgT3isc0T6mVPVYfg==
X-Received: by 2002:a17:90a:9483:b0:1dc:5fb2:9b89 with SMTP id s3-20020a17090a948300b001dc5fb29b89mr16494483pjo.235.1652456861045;
        Fri, 13 May 2022 08:47:41 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2607:fb90:46a:1099:e682:8d73:3200:dae5? ([2607:fb90:46a:1099:e682:8d73:3200:dae5])
        by smtp.gmail.com with ESMTPSA id n13-20020a170903110d00b0015e8d4eb292sm2026628plh.220.2022.05.13.08.47.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 May 2022 08:47:40 -0700 (PDT)
Message-ID: <51639c5c-9092-c4a2-c215-2cbdf110d347@linaro.org>
Date: Fri, 13 May 2022 08:47:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH] target/arm: Make number of counters in PMCR follow the
 CPU
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Shuuichirou Ishii <ishii.shuuichir@fujitsu.com>,
 Itaru Kitayama <itaru.kitayama@gmail.com>
References: <20220513122852.4063586-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220513122852.4063586-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: QyvByisMKcPO

On 5/13/22 05:28, Peter Maydell wrote:
> Currently we give all the v7-and-up CPUs a PMU with 4 counters.  This
> means that we don't provide the 6 counters that are required by the
> Arm BSA (Base System Architecture) specification if the CPU supports
> the Virtualization extensions.
> 
> Instead of having a single PMCR_NUM_COUNTERS, make each CPU type
> specify the PMCR reset value (obtained from the appropriate TRM), and
> use the 'N' field of that value to define the number of counters
> provided.
> 
> This means that we now supply 6 counters instead of 4 for:
>   Cortex-A9, Cortex-A15, Cortex-A53, Cortex-A57, Cortex-A72,
>   Cortex-A76, Neoverse-N1, '-cpu max'
> These CPUs remain with 4 counters:
>   Cortex-A7, Cortex-A8
> This CPU goes down from 4 to 3 counters:
>   Cortex-R5
> 
> TODO: A64FX -- I don't know the correct PMCR_EL0 reset value.
> 
> Note that because we now use the PMCR reset value of the specific
> implementation, we no longer set the LC bit out of reset.  This has
> an UNKNOWN value out of reset for all cores with any AArch32 support,
> so guest software should be setting it anyway if it wants it.
> 
> This change was originally landed in commit f7fb73b8cdd3f7 (during
> the 6.0 release cycle) but was then reverted by commit
> 21c2dd77a6aa517 before that release because it did not work with KVM.
> This version fixes that by creating the scratch vCPU in
> kvm_arm_get_host_cpu_features() with the KVM_ARM_VCPU_PMU_V3 feature
> if KVM supports it, and then only asking KVM for the PMCR_EL0 value
> if the vCPU has a PMU.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
> I'd forgotten that we'd dropped this fix in the 6.0 timeframe
> and never picked it back up again until Alex reminded me of it...
> 
> Changes since original attempt:
>   -- rebased
>   -- fix the code in kvm_arm_get_host_cpu_features() that reads PMCR_EL0
>   -- set PMCR value for new CPUs cortex-a76, neoverse-n1
>   -- set PMCR value for now-separated-out aarch32 -cpu max
>   -- TODO comment for a64fx
> 
> Shuuichirou, Itaru: this is another patch where we need to know
> an A64FX register value...
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
