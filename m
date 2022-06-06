Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1391632lfb;
        Mon, 6 Jun 2022 07:04:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzEgj5eV9PWKuZhvmL7ACNx8eTt+LhIbQUWtBpQU0vvGWENgFV6GPSPwySbRuGXFE/Sbgpb
X-Received: by 2002:ac8:5cce:0:b0:2f3:cbea:57c0 with SMTP id s14-20020ac85cce000000b002f3cbea57c0mr18350683qta.422.1654524261818;
        Mon, 06 Jun 2022 07:04:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654524261; cv=none;
        d=google.com; s=arc-20160816;
        b=h2epZ5dYsIl0wm2ot3+8/czgt6z+cOHENORx/wIS+8HLuBxUJj+whAA9FXY9+rTW0L
         vMXFJSExeHoVX3i0tKl4wBHEWEkXlzkzdZF1UMo6LbEHbJ9Xt9OADWk6UDoKnHU4PZoH
         nrnnD2XwULr1lbFfrgyk/d5HpzFQFs3+lXVZeB23S3y3UFJ7WbICV35IGQqJtjj5q+7T
         wYU7YasVt8VFBT90n6dYPC3s0VWHiaSG9fuBL/OBLwHMclZfnQnVYcSbcF8TQy/XOmbb
         CBgiczQB2lAwHq3TuTLnVzng0DchXwByB7vuciOP2x7SazfnmGPZP2eX/9etyptJQ53Q
         4qgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=xqZEdcwCEwB2ROOfngB2QAMrrVcmJ7d7F1RvRG/68iM=;
        b=va7TpvWv4670+qn0Inb7KN/zEIjEXPWsqsZ8dphVgdMz+2BG5ppE256qcNV8t97C8T
         J4k9/V+O021jisCm8ox54Cat7taCI1ZNUXspZjTAJPiSvp6JJ8Uw4lGfcKqrlEFjUoXy
         LNkrTCbiK3B8gFXnDU4AIA80+EDu640IPJq3oupnyWUXs++OvHH8drPAmgP768vQaW9H
         54wxCSwK5q0/LMfs6k6H6n5+WGDaAj2CADFi2twbDNFyrYBQ163lAP+o/RBFcYCdJ4fo
         ZYDy7wFvZtg35hsyRjTRK+1mjel2mF+kJ+hcrSmjbm3AsprS833yWJugBcEcJE30pROv
         TCnA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=npdGbr5J;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t12-20020a05622a180c00b002f3dbc85e2dsi8235441qtc.649.2022.06.06.07.04.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 06 Jun 2022 07:04:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=npdGbr5J;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyDLB-0001MH-7N
	for alex.bennee@linaro.org; Mon, 06 Jun 2022 10:04:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyCdf-0000FC-PU
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 09:19:24 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:35712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyCdb-0001Vt-FL
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 09:19:22 -0400
Received: by mail-yb1-xb29.google.com with SMTP id t31so25656999ybi.2
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 06:19:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xqZEdcwCEwB2ROOfngB2QAMrrVcmJ7d7F1RvRG/68iM=;
 b=npdGbr5J+RbuCnBi1basR9oFG2hsEX6odoR4sEfoukcL/UjOEyYkLkO7S7PKr4TpoQ
 5gJ7KPD04x7eFszlcrDw9JOxV2aCICMtMsd+ltcCVEZG3F6UNGYMO3bf6Hhpl+yh2koh
 194glvIo/77TiUW8ezjTC09l7uhX01J6Tx9DeZR/DKE8qUIxPVgrEkzdsIjM3oO5vg8X
 RnxVUWDk3S0JSzW6ibVvIyTQ4PJM03eqkzalnzIWJSysUoXeJp1WIVka1RGqH5h5rSqd
 skzoEw74SgtwztAWaI2kL8eN6ZtBtVtkWmBDLI1IzTlVwgNYNK36cx4X8McGMOEnHsRe
 I26w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xqZEdcwCEwB2ROOfngB2QAMrrVcmJ7d7F1RvRG/68iM=;
 b=7ZnzZkBz8Ov4EL3b+sGFykE3k5KeASfguQJvVUwNxKEtYUaLWgiCB8FjsbL+2wb5hc
 4pxCLhQ+FUsXw2fMg47ffX3+8LmT9Poe8Z6JpAsDpu3MgyUvPpz93qVEY3qovoPwqF7x
 aJZZCAllrSWqy7rCP76Bjd/uGHjhrU1aLyE/xVk1SpU7dZoh+bIg6BAq+AT1r4GQC8DW
 SvAhnE0/AxO1m28XgDC6rZqy43GlxM1IksqT8yZQrJX4p4YTkHmnl+2xnVW37CK4dr+w
 yUl30fZ4Ttp1j4h48yHKwt0fwFE/3eXu92QAhxk9GfpLOvFr0nnqFQqL2kGi61d4ZUYO
 6gAA==
X-Gm-Message-State: AOAM531z9net2nYnoZj8e8DCcSj3HAPkioxKM7jQaJOtsNWtOr3iqKKg
 EYPWYjoXoCrOEutVMJrl2icEpXS901X1sHijV7zs9Q==
X-Received: by 2002:a25:47d4:0:b0:65d:510e:c8de with SMTP id
 u203-20020a2547d4000000b0065d510ec8demr24814181yba.39.1654521548536; Mon, 06
 Jun 2022 06:19:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220602214853.496211-1-richard.henderson@linaro.org>
 <20220602214853.496211-22-richard.henderson@linaro.org>
In-Reply-To: <20220602214853.496211-22-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Jun 2022 14:18:57 +0100
Message-ID: <CAFEAcA-WQOhsEJnQ1f1_91=ReBCkKkHgkgDh=kyQq6pFY78hQw@mail.gmail.com>
Subject: Re: [PATCH 21/71] target/arm: Implement TPIDR2_EL0
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fR7lIKmYLjy6

On Thu, 2 Jun 2022 at 23:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This register is part of SME, but isn't closely related to the
> rest of the extension.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h    |  1 +
>  target/arm/helper.c | 32 ++++++++++++++++++++++++++++++++
>  2 files changed, 33 insertions(+)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 24c5266f35..245d144fa1 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -474,6 +474,7 @@ typedef struct CPUArchState {
>              };
>              uint64_t tpidr_el[4];
>          };
> +        uint64_t tpidr2_el0;
>          /* The secure banks of these registers don't map anywhere */
>          uint64_t tpidrurw_s;
>          uint64_t tpidrprw_s;
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 48534db0bd..204c5cf849 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -6283,6 +6283,35 @@ static const ARMCPRegInfo zcr_reginfo[] = {
>        .writefn = zcr_write, .raw_writefn = raw_write },
>  };
>
> +#ifdef TARGET_AARCH64
> +static CPAccessResult access_tpidr2(CPUARMState *env, const ARMCPRegInfo *ri,
> +                                    bool isread)
> +{
> +    int el = arm_current_el(env);
> +
> +    if (el == 0) {
> +        uint64_t sctlr = arm_sctlr(env, el);
> +        if (!(sctlr & SCTLR_EnTP2)) {
> +            uint64_t hcr = arm_hcr_el2_eff(env);
> +            return hcr & HCR_TGE ? CP_ACCESS_TRAP_EL2 : CP_ACCESS_TRAP;

Do we really need to do this rather than just returning
CP_ACCESS_TRAP and letting the "take trap to EL2 if TGE
enabled" check in raise_exception() do the TGE routing?

> +        }
> +    }
> +    if (el < 3
> +        && arm_feature(env, ARM_FEATURE_EL3)
> +        && !(env->cp15.scr_el3 & SCR_ENTP2)) {
> +        return CP_ACCESS_TRAP_EL3;
> +    }
> +    return CP_ACCESS_OK;
> +}

thanks
-- PMM
