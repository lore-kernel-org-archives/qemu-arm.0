Received: by 2002:a17:906:aa04:b0:a46:bbde:2c08 with SMTP id ko4csp1450077ejb;
        Tue, 19 Mar 2024 10:30:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUoj7VUdyJiUik9hddNk/Fa/EjUURf68jToSbJWd806fVRs6AfCqCxgbIogN6RUe2TzgF2VttK0YoRAAyMQz4/q3sy9J2hN
X-Google-Smtp-Source: AGHT+IH6mccqHcsLTCSRQRptjSIwDDi9V075ZuJzqALy88MKO4qz2ipet6AaDXcGIGyst2coe2J+
X-Received: by 2002:a05:6102:30b8:b0:476:6d3:dec1 with SMTP id y24-20020a05610230b800b0047606d3dec1mr2686019vsd.17.1710869444098;
        Tue, 19 Mar 2024 10:30:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1710869444; cv=none;
        d=google.com; s=arc-20160816;
        b=pWgPI0MHnx6KNu2EL8WZXuAtfwADZEN0mDpr6srhHgA6PVqmFXa3gUkXQ+69/UlxeW
         DFyJBvr0KWmz/HQPFh8yHQNu076B42PQQZEYZu8GDLkAvgQrdLK6xgfKriqAuMS2+hX+
         vJ1F08xT0azHpfdeG7l/TXiFch9UUKvWXtqLeTRU0iPwEp9dO89swOwVEtUUH3s1qBs7
         LwkmwG78x6ZQpkVDi17OaMjI2DMsxqIfF85zkS5xMtAWSmBqfGYkk3FKbu5/odeUnQ+C
         iXXBHg7qH7r+XThUsFoOpZsRn3dLUqQ5kI/ZeRX9tHpcCggVneIuPmtnX943AdA9Vnl8
         OxcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=JdpTIk9+f5e71+MYsNfHufuXiNazSlSND9bnfl+T+Sw=;
        fh=HPQo30ZycSLnqCfw+VFWwlI8ThGHRUYyS5YZBLvdSjI=;
        b=oUBEaN3cYueH5rynBkax4vw6xBo6rjrgPsNweljbxVeYJWtQcPczWorxL9YrTlUL/H
         2RMngS8Lns3ivbVGBoz/XYEu2zq8fwvipZnn/fB+Q7ql7AEoshCaEUBUzegh46phRj3N
         nmxnJxcIUF615GNcR71Roi+1aDTQxGn9DmIs9COMgY95ztPyTMXmSQHqT8kmcLXdMnRg
         2/YLV5l57r47JPbclLMJs8XiNsx7aGEnYKWn1gs45yepW1KYW30ZPnD4AwbDfsznp1ra
         MFKCJ1LpXHMCA+8wKwAPCsebaIj0x4JerZ/yFaQEXxHRZfCcKRMcvJhwbwupLjKD8zaI
         ctZg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="dUuAM/ur";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ij13-20020a0561025e8d00b00474ceab278fsi536511vsb.686.2024.03.19.10.30.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 19 Mar 2024 10:30:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="dUuAM/ur";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rmdIK-0006Gf-0w; Tue, 19 Mar 2024 13:30:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rmdIG-0006FV-Sf
 for qemu-arm@nongnu.org; Tue, 19 Mar 2024 13:30:32 -0400
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rmdIF-0001Dg-4V
 for qemu-arm@nongnu.org; Tue, 19 Mar 2024 13:30:32 -0400
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-56a9f5694dcso2684480a12.1
 for <qemu-arm@nongnu.org>; Tue, 19 Mar 2024 10:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710869429; x=1711474229; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JdpTIk9+f5e71+MYsNfHufuXiNazSlSND9bnfl+T+Sw=;
 b=dUuAM/ur1TQAyA2FjuGsbgQNwBCNEdnLXW8Njk+t2+t1wD0F3G+X/zHEfMg3aPrHm9
 hM8ysJ1k/U2jmLN6p1ypQ6Q8hzbmT+It2c8e/9PU6+ugSfT2/Vm6thDuiSFwrk9Xshdc
 HAmB5IQb2+UbMgQnX10hfRPhSVdYr0tKEOxKLbJaK7NAEhkSQaSCRlHHiY+WWaMskpH7
 5tj690Vk+PqTQ3xd3sVpvSchzicuSRO+CjZg5Gz41YyDEonXWALG1i5DcfPk/tAAXV8l
 2Tlqduz5RAhm9KtjggncPk0B+iHs4jJiDNsVfN+itZFwOmv51FpXE/BazTe6LJlqNbxF
 RHFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710869429; x=1711474229;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JdpTIk9+f5e71+MYsNfHufuXiNazSlSND9bnfl+T+Sw=;
 b=o6B5MvLvKL3+airXU7wk5wpZNI6u/Fgb2AKy2tfU70n7XedHjfkH6Jfa0HyBnpX4UR
 Jqysz7X4IUpe/DadTs7OYr5SF+c+CTK4SzgMaX5gJAmWeoRlzkgL4G6rrcLaB9oStnN7
 9kMS0CQ5raDOqtD7nfmcZyy/OJ93iRxN/kswjz53Rz1NSffGZojSJJAeTh6R2vKVMDRR
 c38TUW3oYIeMs73SXVoUWisM83Gnf/EcEHaUVBpBcGGl9BG/KwYgembYaKlHroebYQxp
 dzUHxBON3ka166hoIZkNyHgom4zFsCLiJiiGTbiAiLeWcZvV7iQme5kEt5dxZ8NSSAeQ
 ju3g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKqXO79dsG/K6o1fm/CBLCqK1wpOCo0IzAi2013V2khrNfZi3GioRjD9xmo6FYU4+OoJq/ylQ3BZIasrIsBaM5HAmT
X-Gm-Message-State: AOJu0YyI0E7xNRHAlXOw2brCBwJBdC7ueObpxbPii6mCIQHay/OcFsOb
 NhfVgk6rk+hfiv5i6pqqWgyE/xDEwqyBI+EpBi2AsfspyDfQjAk5WainCKw4LnGejA+t1/1X3HE
 Ck0CSFviFnYoiqhZahhu6bVW5CSwuc8y9I/fbxg==
X-Received: by 2002:a05:6402:2421:b0:566:f5d6:4b4 with SMTP id
 t33-20020a056402242100b00566f5d604b4mr2332387eda.12.1710869428791; Tue, 19
 Mar 2024 10:30:28 -0700 (PDT)
MIME-Version: 1.0
References: <20240318093546.2786144-1-ruanjinjie@huawei.com>
 <20240318093546.2786144-6-ruanjinjie@huawei.com>
In-Reply-To: <20240318093546.2786144-6-ruanjinjie@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 19 Mar 2024 17:30:18 +0000
Message-ID: <CAFEAcA9LnJJDsC8WZzd2ZYGgwqYkbH-FmxKHy0CXKcS2tEonJA@mail.gmail.com>
Subject: Re: [RFC PATCH v8 05/23] target/arm: Support MSR access to ALLINT
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: eduardo@habkost.net, marcel.apfelbaum@gmail.com, philmd@linaro.org, 
 wangyanan55@huawei.com, richard.henderson@linaro.org, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52c.google.com
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
X-TUID: x8J29MufXcCS

On Mon, 18 Mar 2024 at 09:37, Jinjie Ruan <ruanjinjie@huawei.com> wrote:
>
> Support ALLINT msr access as follow:
>         mrs <xt>, ALLINT        // read allint
>         msr ALLINT, <xt>        // write allint with imm
>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v5:
> - Add Reviewed-by.
> v4:
> - Remove arm_is_el2_enabled() check in allint_check().
> - Change to env->pstate instead of env->allint.
> v3:
> - Remove EL0 check in aa64_allint_access() which alreay checks in .access
>   PL1_RW.
> - Use arm_hcrx_el2_eff() in aa64_allint_access() instead of env->cp15.hcrx_el2.
> - Make ALLINT msr access function controlled by aa64_nmi.
> ---
>  target/arm/helper.c | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index b19a0178ce..aa0151c775 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -4752,6 +4752,36 @@ static void aa64_daif_write(CPUARMState *env, const ARMCPRegInfo *ri,
>      env->daif = value & PSTATE_DAIF;
>  }
>
> +static void aa64_allint_write(CPUARMState *env, const ARMCPRegInfo *ri,
> +                              uint64_t value)
> +{
> +    env->pstate = (env->pstate & ~PSTATE_ALLINT) | (value & PSTATE_ALLINT);
> +}
> +
> +static uint64_t aa64_allint_read(CPUARMState *env, const ARMCPRegInfo *ri)
> +{
> +    return env->pstate & PSTATE_ALLINT;
> +}
> +
> +static CPAccessResult aa64_allint_access(CPUARMState *env,
> +                                         const ARMCPRegInfo *ri, bool isread)
> +{
> +    if (arm_current_el(env) == 1 && (arm_hcrx_el2_eff(env) & HCRX_TALLINT)) {
> +        return CP_ACCESS_TRAP_EL2;
> +    }
> +    return CP_ACCESS_OK;

Forgot to note in my earlier email: HCRX_EL2.TALLINT traps
only writes to ALLINT, not reads, so the condition
here needs to also look at 'isread'.

> +}

thanks
-- PMM
