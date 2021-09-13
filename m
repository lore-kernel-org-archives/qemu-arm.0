Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp3474515lfb;
        Mon, 13 Sep 2021 01:53:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyD3plKt2RCEYYLO7MF6d63IDAqz6uBqRrkTjZ+SYNpkS4GrKZPSme5g8fYGKoeGi0VOXFM
X-Received: by 2002:a25:53c8:: with SMTP id h191mr15202421ybb.71.1631523220518;
        Mon, 13 Sep 2021 01:53:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631523220; cv=none;
        d=google.com; s=arc-20160816;
        b=QGXyIifdlXuJDMli9zze/gh/hNzGGAUAi92ROzKu9TpcrjFyoVQxptKEGJoNIFecCO
         7eqB3X8kuDCQd6IEvNvKxkuqgWeZldJvued//Tj+hYh1/aKJ3rv91RJnqCaKMRehz96D
         G2uGpwTJ6llvo+jyAjxb9pk9tBfcMiUOsCKuoylGONlaNxrRHHKEf1kCaaXksGiNs0eN
         z48qExJ8UgZJhcAa+Le95zysUgB+nkspYoAFRsot9nwPcbDtVmclX9AsLIEM6sIFHwnJ
         3ZK4Pmxx6yyBMRaJP6d3wKvbpRlqvIuMd1Pwzcqjvqx0Jc3sUcxfESaddRSH/HqgPB9/
         8waQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ylyqcIhnATU/ADXsXq0Rtx2pBsN6zhCJ3Lrghm5Xi6Q=;
        b=E3bDrupjhTQgiJGQJ3Rm750NtaN2Kl7TR0sJHq7z9iMx2MztvVbQyqlNVQYOtjJ/dn
         fWWq/bbFB1JFwea0ilK8x102cP1dghd0E7f97GnIUAPVGIHp6vrKAFZzLpZuVt60r163
         1u8OZ0I2WrGR0wmX5q7Pn3L2Ls5DDoXqXD3J69MMBGaZWsUsx2dayFez2LOOmDfconbC
         qXTMqdG0W3cVYu9BdWrZ0yBxiY7GHIfhyxYB712Rqxoc6xO2t7yAoZBw+uMYCTprY7GX
         agcJ0wmxwQz66Mv8QnGRNP+3mbxaKg3Q01hfMOQolMwiAreBWiJE8mHIr4AeOfgEcH6A
         KGvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EOOtverx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g186si6895150ybg.462.2021.09.13.01.53.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 13 Sep 2021 01:53:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=EOOtverx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mPhid-0006pw-Ue
	for alex.bennee@linaro.org; Mon, 13 Sep 2021 04:53:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPhiE-0006lP-0V
 for qemu-arm@nongnu.org; Mon, 13 Sep 2021 04:53:14 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:43599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mPhiC-0000Jv-8o
 for qemu-arm@nongnu.org; Mon, 13 Sep 2021 04:53:13 -0400
Received: by mail-wr1-x433.google.com with SMTP id b6so13393396wrh.10
 for <qemu-arm@nongnu.org>; Mon, 13 Sep 2021 01:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ylyqcIhnATU/ADXsXq0Rtx2pBsN6zhCJ3Lrghm5Xi6Q=;
 b=EOOtverxAWkKFlvT5ju2PT+PdTqW3rYZSsZZg/VzazJ2f7LMWsi7SdO1g5rvKIZn+s
 K2jvBCC1YkCni9okY5sgRmWOC5EXqwSv0GzAjuqKpJDWwLRtcy+oOTqc35Z5loMSPLC2
 uUc1k+QG0BtLtQX9Oi1rrJiX6g4zjQuOOZHQk7evxAECHJDnfPPYvodKVBH415AKP7qh
 2nMhW0J5pZ928SVqwD66J+lHaX0P6S/TBFx/TnZyDpELX/45aWUbil39oZUs9RYFs63R
 j48PCTevPbG4IOE0iMe+FfK7uA5h2HKDIoQNCZrT088X0grm9g/p6D/5PFEAgJhLgjWC
 ckrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ylyqcIhnATU/ADXsXq0Rtx2pBsN6zhCJ3Lrghm5Xi6Q=;
 b=A9pvWsB7aZqy5xMTT0eViOygBROelWOwrXC88Dag1xH/1OuI+gBI7mZoSqvhnDqToD
 WE4kCdb/0Mab8rlTVBIjzJxrtY8kuwAry/F8KEsPUNJqwvkTaFlMYphdwikskXNRbksw
 JpdF47lLpS4TKWYU3mdMjMSKNYNyIHmePkTsfBDRIw3uDcFqiBtO3IQzj4K/7CuDjYkR
 gFo7zCjKZeBGKLNpFhYDOExW4ZCzbHIa8vszGuH0ZLFC0l+St570Yu6vYw1jROiV7MSK
 FDxD2uBCQYIx8AQQA29iaDDCd61k6FFEg9VFPYgKHXr4NJmgn3U/BMO+paTcRf9YUxfz
 qOmg==
X-Gm-Message-State: AOAM5319KNELvlUFEvLE1yVbjVnaYdJURLkvKJtpp0Hw+QSXU7K8GOSt
 iqm8x4UQWzrg6ceGLW9YDXHHI0yo27WD0wuifDOieQ==
X-Received: by 2002:adf:fd12:: with SMTP id e18mr7184482wrr.275.1631523190752; 
 Mon, 13 Sep 2021 01:53:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210912230757.41096-1-agraf@csgraf.de>
 <20210912230757.41096-12-agraf@csgraf.de>
In-Reply-To: <20210912230757.41096-12-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 Sep 2021 09:52:20 +0100
Message-ID: <CAFEAcA8x78jKD0EQ0rz_A8YwF4UkBTt8J3khNJ1TMefEP3ejfg@mail.gmail.com>
Subject: Re: [PATCH v9 11/11] hvf: arm: Adhere to SMCCC 1.3 section 5.2
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Peter Collingbourne <pcc@google.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zhhIyQdFYAIi

On Mon, 13 Sept 2021 at 00:08, Alexander Graf <agraf@csgraf.de> wrote:
>
> The SMCCC 1.3 spec section 5.2 says
>
>   The Unknown SMC Function Identifier is a sign-extended value of (-1)
>   that is returned in the R0, W0 or X0 registers. An implementation must
>   return this error code when it receives:
>
>     * An SMC or HVC call with an unknown Function Identifier
>     * An SMC or HVC call for a removed Function Identifier
>     * An SMC64/HVC64 call from AArch32 state
>
> To comply with these statements, let's always return -1 when we encounter
> an unknown HVC or SMC call.
>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
>
> ---
>
> v7 -> v8:
>
>   - fix checkpatch
>
> v8 -> v9:
>
>   - Remove Windows specifics and just comply with SMCCC spec
> ---
>  target/arm/hvf/hvf.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> index b62cfa3976..6a7ccfa91e 100644
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -1177,7 +1177,8 @@ int hvf_vcpu_exec(CPUState *cpu)
>          cpu_synchronize_state(cpu);
>          if (hvf_handle_psci_call(cpu)) {
>              trace_hvf_unknown_hvf(env->xregs[0]);
> -            hvf_raise_exception(cpu, EXCP_UDEF, syn_uncategorized());
> +            /* SMCCC 1.3 section 5.2 says every unknown HVC call returns -1 */
> +            env->xregs[0] = -1;
>          }
>          break;
>      case EC_AA64_SMC:
> @@ -1186,7 +1187,9 @@ int hvf_vcpu_exec(CPUState *cpu)
>              advance_pc = true;
>          } else {
>              trace_hvf_unknown_smc(env->xregs[0]);
> -            hvf_raise_exception(cpu, EXCP_UDEF, syn_uncategorized());
> +            /* SMCCC 1.3 section 5.2 says every unknown SMC call returns -1 */
> +            env->xregs[0] = -1;
> +            advance_pc = true;
>          }
>          break;
>      default:

This should be squashed into whatever earlier patch added this code.

thanks
-- PMM
