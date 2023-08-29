Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp3632072ejc;
        Tue, 29 Aug 2023 05:40:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH5bO7d7+GTBflMN/d8NkKwA7pu0+nqbXCzjVedmScyUs97hYCkKAGuSsNmCx0OJIcmxYDA
X-Received: by 2002:a05:620a:672:b0:76f:24bd:fef1 with SMTP id a18-20020a05620a067200b0076f24bdfef1mr565656qkh.30.1693312818114;
        Tue, 29 Aug 2023 05:40:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693312818; cv=none;
        d=google.com; s=arc-20160816;
        b=VQ4tUg3NYiSQ+mWAPHd+jb34BaDF5LzUmiKqkLDC/bWvgrChCgdMVb+hxZJKTPFg7G
         +91LnUd1G01Rxlq0BDvwIFuSSMfwZMnjHB0u94NNjXh+MppVLDtpjaYSHIt1Fxe1jyv7
         5pFD5F9MBVw50mlCmV2q7dUxbW/iyf+768tnTy4Fz0BJc3DYtJtaOso9YR75/RCMkWKM
         R/iHdiIy5SWrt30bW7SVkMi8gz/e1nZTiE3Q8QXofBcgBfvse4vieCq/NnuYy7GwzTW0
         2bpkeVbUfW6ITtSjTLhF44+tRHZMfXjxgUTvJR5W9nwM+7pWLLULbwZCbxmLJISftxsv
         1xhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=xZG8uaKcPAMVy0Ke2IMkNxH7jZBTQ/7D2hYKfosjHu4=;
        fh=/ftcwOPYeEIhzseC7WF42kR+xVR/IJiWpLC1+A7SOWQ=;
        b=aoVM5IkDhDs3GeL9iCrm38/4vXUuRqSKBTE0yk84eh1CWKMBo105adNBcIO+K73Muq
         YhQx3o3VOEx9gkhfULkYtnesRL2x+9gjSDsm7rXAVO3/KIZYoiO5siBTTLE/+wA5lWuw
         5sErQabgoonyzJVwoPgZyj9VU5jXJxofUZqi0+Dzc2+4UYCltD2IVbKwWDJHeo5lB5wa
         ceiAS0+QF57FVBGUdQJXe3NE84JoSCWWgmF19uVGFrTSjVezEAkR4VMepc9icz2Tff13
         SoSGO/817YbNX+JYO59aRMN/CTjd6rEJjerZMOgalud7TKsFwnT/S6opbyZ5aJs9kPSg
         iwmA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZDMcXaHD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id tn19-20020a05620a3c1300b007672b5d6f96si6018802qkn.17.2023.08.29.05.40.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Aug 2023 05:40:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZDMcXaHD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qay0r-0001BT-AN; Tue, 29 Aug 2023 08:40:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qay0Z-00012Z-OT
 for qemu-arm@nongnu.org; Tue, 29 Aug 2023 08:39:48 -0400
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qaxzu-0000H8-Gd
 for qemu-arm@nongnu.org; Tue, 29 Aug 2023 08:39:46 -0400
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-5008faf4456so6833416e87.3
 for <qemu-arm@nongnu.org>; Tue, 29 Aug 2023 05:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693312745; x=1693917545;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xZG8uaKcPAMVy0Ke2IMkNxH7jZBTQ/7D2hYKfosjHu4=;
 b=ZDMcXaHDdLb11U1CldA5tuBUelgVt258ehZRjoEpXBj3S8Ehf9ymeIjHWjqlOBY3DX
 uQVVP8Gsh5OL7Y5mcpmiCP7wWvfD3BSecmoBYKPKtpxo8HCggqCoao5YdoYkqckANwe1
 dTrES3qM5m0TAqNCE1/r77SQrMQMGuuPmyGawgjCxwrBQJT2yVX8TfO6DauzEEegF6BS
 A2addOHwjtXazBr2lUHVwLtvwAwDK6aOd9RDh229KUYNklTSr9vGzG0aaHg4wYMqGPfy
 x9U77Ku1EQw7G8tFOWCRivok3ysSkg2BoYA4i2kceuuaKNKPyQMmLbIvPzVmnhdKnTos
 00Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693312745; x=1693917545;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xZG8uaKcPAMVy0Ke2IMkNxH7jZBTQ/7D2hYKfosjHu4=;
 b=HN1kAS6KkUTWpMxz1l+SO/zySTQNGUyqZnEsUGoQMYLYXp5rGsv0HQ4c8j9B76AnlI
 1Y13CJ+WkgQYazTZXTCG2Stt/TMlpl70QD1dtmkMsQPFjLoE/Aga4oYuIZnBsAOWYMo6
 EHx7Vzyw9LTa8J6MCXibueetfQQMp7gqeaYk7TvF/RsGWApReqPYZHI2HuoP78anNM2n
 c1Lc1lmSYufFPJn9Y8xfoJR7Nil5bHFKyq8f4MGpDWS+ufBBzpo30mymFRu7ZwSALK7G
 ulvCrwg70xwVypfWACjk/qnalS8B27EcFGkZqAuZpKz84M0ytdzjjeVv6M7cWb1+AnRv
 8ZOw==
X-Gm-Message-State: AOJu0YyPk+scqTRV8gutJcIuGVDkO3Il3PHNZsvEO0Ue4CjzPrJKVJH4
 IQznbjgRTN7VZkRPf2crV5tisiL8x7c2+WN6o6mWPA==
X-Received: by 2002:ac2:4e0d:0:b0:4f8:77db:1d9e with SMTP id
 e13-20020ac24e0d000000b004f877db1d9emr24715379lfr.12.1693312744647; Tue, 29
 Aug 2023 05:39:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230811214031.171020-1-richard.henderson@linaro.org>
 <20230811214031.171020-12-richard.henderson@linaro.org>
In-Reply-To: <20230811214031.171020-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Aug 2023 13:38:53 +0100
Message-ID: <CAFEAcA-XXC1WJgp8EvviC9Pz+C-LHNmsUqzK4sjM13Q75wbJgQ@mail.gmail.com>
Subject: Re: [PATCH v2 11/11] target/arm: Implement cortex-a710
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=peter.maydell@linaro.org; helo=mail-lf1-x135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: k1gbthPi45/F

On Fri, 11 Aug 2023 at 22:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The cortex-a710 is a first generation ARMv9.0-A processor.

> diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
> index b12e10d3ab..81c27c70e8 100644
> --- a/target/arm/tcg/cpu64.c
> +++ b/target/arm/tcg/cpu64.c
> @@ -758,6 +758,239 @@ static void aarch64_neoverse_v1_initfn(Object *obj)
>      aarch64_add_sve_properties(obj);
>  }
>
> +static bool trap_tidcp(CPUARMState *env)
> +{
> +    return arm_current_el(env) < 2 && (arm_hcr_el2_eff(env) & HCR_TIDCP);
> +}
> +
> +static CPAccessResult access_tidcp(CPUARMState *env, const ARMCPRegInfo *r,
> +                                   bool read)
> +{
> +    return trap_tidcp(env) ? CP_ACCESS_TRAP_EL2 : CP_ACCESS_OK;
> +}
> +
> +static CPAccessResult access_tidcp_actlr_w(CPUARMState *env,
> +                                           const ARMCPRegInfo *r, bool read)
> +{
> +    if (trap_tidcp(env)) {
> +        return CP_ACCESS_TRAP_EL2;
> +    }
> +    return access_actlr_w(env, r, read);
> +}

HCR_EL2.TIDCP traps accesses to a whole IMPDEF range, not
just to the registers that the implementation happens to
define. We should implement this in translate.c, translate-a64.c
and op_helper.c in a similar way to what we do for the aa64_ids
feature, so that we correctly prioritize the trap over the
UNDEF for registers in the space that don't exist, and so
that we don't need to explicitly add the TICDP check to
every IMPDEF register.

Since we already don't implement this correctly for the
other CPUs, we don't need to gate Cortex-A710 on doing
it right.

thanks
-- PMM
