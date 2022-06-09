Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp514495lfb;
        Thu, 9 Jun 2022 08:25:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+7WzAoe2SV3V2TAJXJylSamP7j51rwYU18fHbjlQVKYTAQuR5QQvS5DZuKqIKvdUxogb1
X-Received: by 2002:a05:620a:25cd:b0:699:c467:fab0 with SMTP id y13-20020a05620a25cd00b00699c467fab0mr26755347qko.395.1654788304130;
        Thu, 09 Jun 2022 08:25:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654788304; cv=none;
        d=google.com; s=arc-20160816;
        b=HoMlH6Zy86NrVXfqs2yS/ikQXmuP5BX1OqPBD6A2J+VqQ09FBVSZ6ccDotZRuNNkBI
         O/yu+58YvDIGYBMWRyx/oH51x+HBzLs1eC00FTa9qx4Ydui2yXuDCLPMzbfu4XoYJ5EZ
         Sl7jtSPJMBAs05ZPEiyq7cdQirx5cERXlBklT1TcRO7eBPmAHoKPD9FRsmsHFMX7pOOB
         o665AfpsB/HBPIJfRduzAO1QA5Cr5HR6jfCm4iKXbxm08ls1fgcg42Nk3XxrEcZMT0tO
         ckVX5Sv8R4E3ZPa74fQ1Cas9pwYI+x0hM4aZy8BsoNSqm/tywhj6ODgYqLu1PCOmWcXJ
         /3Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=AyICTKbmfFWPtVchwZ2x5SPndxhOMyGcxD9CcnVxnmE=;
        b=xohu3RnoLAW0740iJR2PCRZGLxehJzulIYcpQ1Ev70uqexWfnShsAVlJ7KiITD6r8c
         NkwDl/LRWdBqoaL8q/CGz2+6EQcyN4QvAvjI1WsWbvijN+3WRKF5UGBR0EW1wePxgQmG
         K7dAzIbbXzOqfID9tdnF2/W4SZnuJ2RuzY+dsnWmL0gA//qdfwUPCxt8vomK6G/xnN2X
         e1DryMxIF6vGBg/RdI9r821bKtJsIAs6ARgSCFufK+9v1dguwbSZBLZ2bXxaLRF9hQ5Z
         zxKZ8SOArCNUyo2eDhXi40ZShCqaMfoXsxy4mcMFRcLdsCpvrCYKcQln/ysyooXMw2dA
         8gzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eaLOjCEy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a8-20020a056214062800b0046b938bfa35si3061914qvx.576.2022.06.09.08.25.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jun 2022 08:25:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eaLOjCEy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzK1v-0002O9-J5
	for alex.bennee@linaro.org; Thu, 09 Jun 2022 11:25:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzJqu-0002AI-4M
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 11:13:42 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133]:33465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzJqs-0006J2-LX
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 11:13:39 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-30fa61b1a83so238959207b3.0
 for <qemu-arm@nongnu.org>; Thu, 09 Jun 2022 08:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AyICTKbmfFWPtVchwZ2x5SPndxhOMyGcxD9CcnVxnmE=;
 b=eaLOjCEybBW6jWcLR6qZjYg2TrJLZcgvhYjBhdJ3OIKrpkG4K3rh4sB59RSlqj3IcP
 evmT+/gQl5iMEzDA2vQrb5M0VDWSgcF8lEN+uqEw7WkPZjG83mz1lnyz2coFFni8xQ0L
 T4WwFMGG02i10pgJW/wkvFCF8incizJXe1kVM+3BSSzqjOvKtkhIBou7eDlPlYWKxUUI
 J7uIUae2M3QHDODodHYgotlsQr8nMVgj9va/s3FrA7wZl9K95Udgsos6MP3rTcYLp+Ik
 uYlinx0ovZjfDFbiLYv9CNL4w9S5g8ru2AjBDJfUoQ5WtGcfREgiXPR+nmDLsou6hiGW
 Bfpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AyICTKbmfFWPtVchwZ2x5SPndxhOMyGcxD9CcnVxnmE=;
 b=ZWI2FQO5wkdMj/7oIubtgteH7Uw9jJ5Eh7dpEbvbggBWOJ1VS8SSYVLtFMpWn0rbNR
 +Nj2rmUMswe0DLW6OveElXBJue3i9K2Vp44teJXvpblQrfP6byFVaMBr9rzPnncjLGRI
 BeSVC14XuXEx9ot6Ws2DWwKrbirroOfeNJFjoB5KYqlk1vEXdwTMmpg7vC/wgBQ0wESa
 a/2aGFeH4MWsHhiGqjQRolbtskBdFIRqd0qLG+o03i8LFhnOJ1gPdg0abSjTw2BiteoK
 tEaNSYF4tRLWZK8wEO87Fk+kCYhdvSiP0BECwnAIiw+nLXDXNrudHBeUV8sBo/IwGw4I
 ghHg==
X-Gm-Message-State: AOAM532LaUQRulW8xeGXkCngo6hHaFdMgucexfPbMvVQGz0xTQFfCTIU
 KNBl9IzEjOraXxlAIRMsw/7xK48yhdlpAwLRbkjK8xYMBGs=
X-Received: by 2002:a81:6904:0:b0:2fe:e670:318a with SMTP id
 e4-20020a816904000000b002fee670318amr42262598ywc.329.1654787616959; Thu, 09
 Jun 2022 08:13:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220605161056.293920-1-richard.henderson@linaro.org>
 <20220605161056.293920-3-richard.henderson@linaro.org>
In-Reply-To: <20220605161056.293920-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 16:13:26 +0100
Message-ID: <CAFEAcA-YtGEHj5vsnK31qUXDvc8WerVafPBYzEOA5NH5kyL1-g@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/arm: SCR_EL3.RW is RAO/WI without AArch32
 EL[12]
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: psyoURojUGrK

On Sun, 5 Jun 2022 at 17:16, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Since DDI0487F.a, the RW bit is RAO/WI.  When specifically
> targeting such a cpu, e.g. cortex-a76, it is legitimate to
> ignore the bit within the secure monitor.
>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1062
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h    | 5 +++++
>  target/arm/helper.c | 4 ++++
>  2 files changed, 9 insertions(+)
>
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index c1865ad5da..a7c45d0d66 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -3947,6 +3947,11 @@ static inline bool isar_feature_aa64_aa32_el1(const ARMISARegisters *id)
>      return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, EL1) >= 2;
>  }
>
> +static inline bool isar_feature_aa64_aa32_el2(const ARMISARegisters *id)
> +{
> +    return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, EL2) >= 2;
> +}
> +
>  static inline bool isar_feature_aa64_ras(const ARMISARegisters *id)
>  {
>      return FIELD_EX64(id->id_aa64pfr0, ID_AA64PFR0, RAS) != 0;
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index c262b00c3c..84232a6437 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -1755,6 +1755,10 @@ static void scr_write(CPUARMState *env, const ARMCPRegInfo *ri, uint64_t value)
>          value |= SCR_FW | SCR_AW;      /* RES1 */
>          valid_mask &= ~SCR_NET;        /* RES0 */
>
> +        if (!cpu_isar_feature(aa64_aa32_el1, cpu) &&
> +            !cpu_isar_feature(aa64_aa32_el2, cpu)) {
> +            value |= SCR_RW;           /* RAO/WI*/
> +        }

True in principle, but we probably need to do something to handle
the reset case for AArch32 CPUs, where cpu_isar_feature() will
return false becaese id_aa64pfr0 is zero but the bit should
nonetheless be RES0.

thanks
-- PMM
