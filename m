Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp427282ocs;
        Wed, 28 Sep 2022 09:52:39 -0700 (PDT)
X-Received: by 2002:a17:902:8214:b0:178:95c9:bd5d with SMTP id x20-20020a170902821400b0017895c9bd5dmr748708pln.106.1664383958866;
        Wed, 28 Sep 2022 09:52:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664383958; cv=none;
        d=google.com; s=arc-20160816;
        b=emwInOMa1+LjT0FxdCSJ70ByP2VtdGGNxvcB4BKANGnHpMsUWEmYcQ5CJjtVtZ5Kbx
         UWdIxj9PyUyoOERxjlBnvpXgyXBsIwnvTryBE5oVkX/YefFoErlJYhFa66Iw/nqUBV8h
         vd1TFas6VC+/WARIHH4gFqDBBRLe+B1qOBFMjDxBXlpUtIf8+F+MX+t6HZryPWIvM653
         dzZsEVnR9ybJq3GWGTom1D+3rB/yZVrWA2dI2Y0BQh3wWboaaP0iYRcHGM9sgqwQcOX6
         2wORqB3w0cxn5cmX5oxjW0Qj1kHXE1s6QX8XsIHkQrs8fawVw/X3oMM8/ugHwZ4Vabaf
         YlvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=zbzryDewVpE0zsNwPmWj4WQt6orDR/cL0kQ7Gc204R4=;
        b=x6j7omWJQuq7ZEWON08Wd0ODDaofr0cyP9yRaljmJrZQJbvY0WZmHkrZ7q4tiTIb/+
         7SDIY8L/p/OM2gr3gU5s0tHf/yhmGzqW0GMw35y8WY4wiVTZLbaTCFKBTp6NIEOKcWC4
         qUtaRDquUlCgtQR2QTV+3uzwQ4/MrDu98Q5NCq/lNfVBsa/j8j9AfgDsE1/m9P3t5Qgc
         FOgvvQAlIGaFyFJlvNpiy1RPdQTCOyX0x29YQ/pw7h302KvYzL/YByjb1edMxQtGQhTp
         ttxkeO2mXoFu74Uh8NoVMea664fTIVy8TqCdi/OgxEOb7M1TWeMHCZATsB9suWTqmQjq
         UG7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nqxlqOtJ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id y2-20020a62ce02000000b005409e286d00sor2910338pfg.82.2022.09.28.09.52.38
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 28 Sep 2022 09:52:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nqxlqOtJ;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=zbzryDewVpE0zsNwPmWj4WQt6orDR/cL0kQ7Gc204R4=;
        b=nqxlqOtJYP0KtBJK1rREKMXheggD61HdDIQO8IoM9efC6r6RrPpwjFPfxn7BwYfVRS
         2PgBsvll4CyLGV+8JC1XHOnv3s0Ou1mA1eo98wsUQjHRuaAXCRYiizxdIAU0MbRSyqA9
         mffdpmK/Yj7aojh26yAuf3dWJibQcpghdcjcgxIotKGK58amrg1UH+azE+VirD+SuFa/
         XTxVnd3Iaq3Mgh9hm2Q5HvzS0wp+zVby30VdwlSAUP+u6BI/NQXsM1Y8G96TkH/rdLby
         nz91uQviB+1IwFumL8JSwiRgs7PS/hnp/mUFnljeOM6t6S4UCCKtw9UMBlW67jEpBwHC
         1rjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=zbzryDewVpE0zsNwPmWj4WQt6orDR/cL0kQ7Gc204R4=;
        b=ZDy3p70A5EoQ6ejuUFFGXQBV+MLqA9n8W3qMtWMTJRuAcc4SZymbh9Te/rR5CaGzkF
         BC8xv2+qAHWZD2CexMz85cYKIYX7S1iWmixbbTUEFFePAsa6lSA3iSZV96z6V9WX8OGt
         clnuOvTO832GZqAzzZfPessQFbQ0fm8ij1EjIK78WV3V3g0f6L+cNNuBZf3mXklopI11
         xaL5Fmrxhx0zYMCqqN8F4KT7i0qHEELgxY+iTVZtmGDdhDUda/Xi5SYYrVCaGgTmk2fQ
         PQ7nNTPU+bBz2AkLCF6iwG49O6aelXUshKCqfzkh/7x+JSOyvtLngP6dJ31O4v3OoMdP
         mhtQ==
X-Gm-Message-State: ACrzQf1GN0vx0LhrNypPrSRONf/uxsVk5h8+60pDQvBHzyR2g+7nvExg
	8gv2NGGB4TYiwWx3Lvfdx8HPGq/ZgRfHPUES
X-Google-Smtp-Source: AMsMyM6lXk9JlO2TuDPv/ZHn2rvDFCvfBnxcNeOL6clNHVbfzrM7oW5tp8oe9EqAda1EC+4sCWexuA==
X-Received: by 2002:aa7:9107:0:b0:553:92a4:d930 with SMTP id 7-20020aa79107000000b0055392a4d930mr35178043pfh.72.1664383958467;
        Wed, 28 Sep 2022 09:52:38 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:47:d49d:ec01:986f:cb56:6709:4057? ([2602:47:d49d:ec01:986f:cb56:6709:4057])
        by smtp.gmail.com with ESMTPSA id u2-20020a170902bf4200b00178b6ccc8a0sm3961587pls.51.2022.09.28.09.52.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Sep 2022 09:52:37 -0700 (PDT)
Message-ID: <58228f3a-cd6f-32e0-bd82-0fbe6a1364b3@linaro.org>
Date: Wed, 28 Sep 2022 09:52:36 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 05/15] target/arm: ensure ptw accesses set appropriate
 MemTxAttrs
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
References: <20220927141504.3886314-1-alex.bennee@linaro.org>
 <20220927141504.3886314-6-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220927141504.3886314-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: HjxKcjcrIi7g

On 9/27/22 07:14, Alex Bennée wrote:
> @@ -2289,8 +2289,8 @@ bool get_phys_addr(CPUARMState *env, target_ulong address,
>       ARMMMUIdx s1_mmu_idx = stage_1_mmu_idx(mmu_idx);
>       bool is_secure = regime_is_secure(env, mmu_idx);
>   
> -    attrs->requester_type = MEMTXATTRS_CPU;
> -    attrs->requester_id = env_cpu(env)->cpu_index;
> +    result->attrs.requester_type = MTRT_CPU;
> +    result->attrs.requester_id = env_cpu(env)->cpu_index;

This hunk shouldn't compile, or the earlier patch shouldn't.
I think you have a rebase error in there somewhere.


> @@ -280,7 +280,7 @@ static uint64_t arm_ldq_ptw(CPUARMState *env, hwaddr addr, bool is_secure,
>                              ARMMMUIdx mmu_idx, ARMMMUFaultInfo *fi)
>  {
>      CPUState *cs = env_cpu(env);
> -    MemTxAttrs attrs = {};
> +    MemTxAttrs attrs = MEMTXATTRS_CPU(cs);
>      MemTxResult result = MEMTX_OK;
>      AddressSpace *as;
>      uint64_t data;

Would be handled by a new patch introducing MEMTXATTRS_CPU, as described earlier.


r~
