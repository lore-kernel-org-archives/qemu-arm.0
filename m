Received: by 2002:a17:907:9874:b0:a31:23a7:2a34 with SMTP id ko20csp789625ejc;
        Fri, 26 Jan 2024 02:39:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHFJFSKemFTTFeShMDnXqnLSZPJdrhfzjKdcQ6emsSFRTtXjU2yY5RyRo1VVYtjSj5DFlc9
X-Received: by 2002:ac8:7d90:0:b0:42a:8533:eea4 with SMTP id c16-20020ac87d90000000b0042a8533eea4mr136588qtd.14.1706265573214;
        Fri, 26 Jan 2024 02:39:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706265573; cv=none;
        d=google.com; s=arc-20160816;
        b=dXU3ykdeN27Di+i72mmj4aOV7jIPrltFVkQ80S/svQEG+3bK3cWa/YJGuK6JtVWtUu
         1tfjEs3956uBrLHAwNUWdb6oWk1O0wT4IRx+dQj4WbNYuArt9y//Dp6tZZgt2sJ0xNSK
         97DWcQLPEqQQW8sjZ5D2f0Q/M1O+5rbmRbu1pHhFgQLtZ5F1+EeFCH1nEqdgFC4KrDpK
         y4ipy17aYBHolGxpIkWYdh8DIMOmnGtWJ8OapjCwpgCxgEd5+sSmp3+czEdz2TOLoKpd
         psccsSUstbMYHMrYcFUbo1t+mKmVEZOgji7psyn5IjEgfpOwbaDHvR3prhEi6eckQA8T
         Afuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=mGEceRpzawgur6mwKEf1okcVHBJoqqu1g4hBfqZOOeY=;
        fh=FNnfFfIIuMzgkPZNHq/Y45QhQ1Qwx4ejqPe3Z0ax2Z0=;
        b=fzDkhetrCwxWfO+UgKJrvPRwaoMpYqtAvYVgomUXdOmVlx6tZZeVdA+9NvzA/HG+Pf
         fMdl/dmzCO7WygAQ0Qk4OWETursAvA0TmVX17cVln/hd4xGkL+MEYt5/zsQFEj1qlFyh
         CeatRqQD/a/3OxMyw9kwq3F7pfcx5WCys2EYSpU7doP2i0qW1gAud7E7duQ7EIOznW58
         EEeiEe6QjnAJ2M3BMKDxT6oZx7KCIOdKzCvLdfK0P/cLgxv25XYUYiekIfw7OnAtdxnm
         JUezyXwZx+FZbED5BhU8JyGURjaZDeUAp2wLRA/8+688DEBvkcl8Dh+rbXxFXdP3FYwC
         Q1vg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jmM5MHg+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v8-20020ac85788000000b0042a4d823f1csi917269qta.444.2024.01.26.02.39.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 26 Jan 2024 02:39:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jmM5MHg+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rTJbo-0006hA-Ii; Fri, 26 Jan 2024 05:38:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rTJbn-0006gv-SH
 for qemu-arm@nongnu.org; Fri, 26 Jan 2024 05:38:51 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rTJbm-0006i1-3H
 for qemu-arm@nongnu.org; Fri, 26 Jan 2024 05:38:51 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40eccf4a91dso2920485e9.2
 for <qemu-arm@nongnu.org>; Fri, 26 Jan 2024 02:38:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706265528; x=1706870328; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=mGEceRpzawgur6mwKEf1okcVHBJoqqu1g4hBfqZOOeY=;
 b=jmM5MHg+HCL/wFtSuS36zLq1iC8Tk85l10ycVUqQ86cB2Dg0y/FZgK/uT/UGsaPhG1
 7kVT80lp0p6nLtLtAtqmcltO2AZfF9GpslKko9+hNz6Yst8k5nL8UMv4mMMf++zS/+r/
 xevIdq6oFZtoFG3qK0z2E34VtMdf3WQFCj0kZj5t/XnXtSj99s0keLi6Kiyl0Fz8VmdI
 AlK44+PApKybOPMac6UYxyXFwWn7zf8D2MnW0GtWHZJMY2RjheZQND3bjwdzk36w5fow
 QCf7/Q3NAfVXh7o3uU1PWVbd0T1qkjSiCK7iYUXD+RYe2NmLo1ShOhk14HMk+IBBjJbj
 1Ayw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706265528; x=1706870328;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mGEceRpzawgur6mwKEf1okcVHBJoqqu1g4hBfqZOOeY=;
 b=mhb8WpOUkxhnLpA2GY1wWpASpUiPKaK2Ys4Bu7yqpOdXzUjCFWfw5o9bbRR5hVv9Aa
 a9i3/Tg7sqngI5aT/BifIRPtW048o5uT6S6d1uCtaXS22okvSZwokublqCPu2YFnYHYj
 XQry0TmpBUKseS483+PooOe/582GTyv3vrOG3ddP0z5FCt8x4E+AeS+EU+eXaM0U9P9G
 IUIHm9ayTOT9fQLqSy0Oq9+Pn7cE43bBhtnlfkgddSCKz+dVUZ7sUqul7sxTtvPKBapM
 OWILsKLxo3JulJbDxIPvASqF3aJ8R37FbnBEV56sH4CAaxCklrFQUfqAvlBnvMzOm+cy
 C5lg==
X-Gm-Message-State: AOJu0YwUoRoc+DHRssGwivzefy/E63Mx4K2o48Pviu3p59n+a2lFDYQ0
 uimHY1MWKf4Kvz3jV5wzYU9rwve06sL3ERFCFYloQ7YGR/8Oa7kmNtLSD/UBzYw=
X-Received: by 2002:a7b:c8c9:0:b0:40e:bffb:ba19 with SMTP id
 f9-20020a7bc8c9000000b0040ebffbba19mr731249wml.48.1706265528398; 
 Fri, 26 Jan 2024 02:38:48 -0800 (PST)
Received: from [192.168.69.100] ([176.176.142.39])
 by smtp.gmail.com with ESMTPSA id
 s13-20020a05600c384d00b0040e4a7a7ca3sm1454671wmr.43.2024.01.26.02.38.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Jan 2024 02:38:48 -0800 (PST)
Message-ID: <1128019c-adca-4cd4-aa73-937001ad990a@linaro.org>
Date: Fri, 26 Jan 2024 11:38:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] scripts/coccinelle: Add cpu_env.cocci_template script
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org
References: <20240125165648.49898-1-philmd@linaro.org>
 <20240125165648.49898-2-philmd@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240125165648.49898-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: o1vxqXTCUhDl

On 25/1/24 17:56, Philippe Mathieu-Daudé wrote:
> Add a Coccinelle script to convert the following slow path
> (due to the QOM cast macro):
> 
>    &ARCH_CPU(..)->env
> 
> to the following fast path:
> 
>    cpu_env(..)
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   MAINTAINERS                               |  1 +
>   scripts/coccinelle/cpu_env.cocci_template | 60 +++++++++++++++++++++++
>   2 files changed, 61 insertions(+)
>   create mode 100644 scripts/coccinelle/cpu_env.cocci_template


> diff --git a/scripts/coccinelle/cpu_env.cocci_template b/scripts/coccinelle/cpu_env.cocci_template
> new file mode 100644
> index 0000000000..53aa3a1fea
> --- /dev/null
> +++ b/scripts/coccinelle/cpu_env.cocci_template
> @@ -0,0 +1,60 @@
> +/*
> +
> + Convert &ARCH_CPU(..)->env to use cpu_env(..).
> +
> + Rationale: ARCH_CPU() might be slow, being a QOM cast macro.
> +            cpu_env() is its fast equivalent.
> +
> + SPDX-License-Identifier: GPL-2.0-or-later
> + SPDX-FileCopyrightText: Linaro Ltd 2024
> + SPDX-FileContributor: Philippe Mathieu-Daudé
> +
> + Usage as of v8.2.0:
> +
> + $ for targetdir in target/*; do test -d $targetdir || continue; \
> +       export target=${targetdir:7}; \
> +       sed \
> +           -e "s/__CPUArchState__/$( \
> +               git grep -h --no-line-number '@env: #CPU.*State' \
> +                   target/$target/cpu.h \
> +               | sed -n -e 's/.*\(CPU.*State\).\?/\1/p')/g" \
> +           -e "s/__ARCHCPU__/$( \
> +               git grep -h --no-line-number OBJECT_DECLARE_CPU_TYPE.*CPU \
> +                   target/$target/cpu-qom.h \
> +               | sed -n -e 's/.*(\(.*\), .*, .*)/\1/p')/g" \
> +           -e "s/__ARCH_CPU__/$( \
> +               git grep -h --no-line-number OBJECT_DECLARE_CPU_TYPE.*CPU \
> +                   target/$target/cpu-qom.h \
> +               | sed -n -e 's/.*(.*, .*, \(.*\))/\1/p')/g" \
> +       < scripts/coccinelle/cpu_env.cocci_template \
> +       > $TMPDIR/cpu_env_$target.cocci; \
> +       for dir in hw target/$target; do \
> +           spatch --macro-file scripts/cocci-macro-file.h \
> +                  --sp-file $TMPDIR/cpu_env_$target.cocci \
> +                  --keep-comments \
> +                  --dir $dir \
> +                  --in-place; \
> +       done; \
> +   done
> +
> +*/
> +
> +@ CPUState_arg_used @
> +CPUState *cs;
> +identifier cpu;
> +identifier env;
> +@@
> +-   __ARCHCPU__ *cpu = __ARCH_CPU__(cs);

Here we remove ARCH_CPU(), ...

> +-   __CPUArchState__ *env = &cpu->env;
> ++   __CPUArchState__ *env = cpu_env(cs);
> +    ... when != cpu
> +
> +@ depends on never CPUState_arg_used @
> +identifier obj;
> +identifier cpu;
> +identifier env;
> +@@
> +-   __ARCHCPU__ *cpu = __ARCH_CPU__(obj);
> +-   __CPUArchState__ *env = &cpu->env;
> ++   __CPUArchState__ *env = cpu_env(CPU(obj));

... but here we just change it by a CPU() QOM call.
So this 2nd change is just style cleanup.

> +    ... when != cpu

