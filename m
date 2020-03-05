Received: by 2002:ac2:4942:0:0:0:0:0 with SMTP id o2csp2974618lfi;
        Thu, 5 Mar 2020 06:23:53 -0800 (PST)
X-Google-Smtp-Source: ADFU+vsDLvF5CpioGIpB9Gmwb8dyTOlZWoYKw2rl/mMj9AcWjTiWcxRFGuV/ig1NKMhfg+T3fqWT
X-Received: by 2002:aed:2823:: with SMTP id r32mr7161628qtd.320.1583418233478;
        Thu, 05 Mar 2020 06:23:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1583418233; cv=none;
        d=google.com; s=arc-20160816;
        b=jRqd3K7zXm0hFVESVuxkTfDUzp434BevWZ/mlVNsSV/x0LML6w502R3X3SR482qJ7v
         od7smkxImPe1D30bMB9Ko5tw2TaFDkYKdRAUlWR2AuYcO7UFiEhT/4Ws1Yh8vlH4hdNJ
         q59mF1Jc1jYBovpGtv8ntprjuNhseCnAiLdNlgVkV/mneWC5E8Ff0SqPZ7PF22GAZlTN
         hegK5znzcmfJ6SW8WMPmcgOhphzd4vuBAwngc0fc/9Rn/lM7Q7GKo269goFW+3atCvUg
         BZLoDyIUOXZVoY50URoEy4BM9eQ4DLCT+tgAhaUpxC7OOUKaDKLAiYg+vEoXAM1AmnUR
         yC+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s+7bS6l8n8+BhRIGmgGOgT4La+ye5ARyZS/sNnK/XjA=;
        b=C/SZXNUfaEZmq7kiN9fLL11B/HxQ3mGW6X8olykd7cJnf7shzhNs6uyggEoi7hp/R8
         dcJ1S2phFsS20Ez4qOqRFSL35SCwllDbROXqZZPAdG/yCSCRZjSwc1SMdOODbVC3lSHB
         7EVnRlFiluB+VUrCOdJKnYhLrFxPden2vOXZWrvu9wih63gJ+kIFxnVHYWhpRBxIcExL
         7PllEH/r1MB7gBO25cR+u+neR9537QXFkOoxAEjhp5fzBscyNhdyJaPWLD7k59gDmdf1
         vXEnj1wDczE0F/pv/N+EMGuhPMR+ZuIY2k7m0icaNdyUibpimdhBeNBJH58tQlDVxSW5
         Lbnw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hQDu4BhM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g33si3029267qtc.79.2020.03.05.06.23.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Mar 2020 06:23:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hQDu4BhM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j9rPk-0002vw-TQ
	for alex.bennee@linaro.org; Thu, 05 Mar 2020 09:23:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33562)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j9rPa-0002tX-HA
 for qemu-arm@nongnu.org; Thu, 05 Mar 2020 09:23:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j9rPZ-0004G9-H4
 for qemu-arm@nongnu.org; Thu, 05 Mar 2020 09:23:42 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:44058)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j9rPZ-0004Ff-B5
 for qemu-arm@nongnu.org; Thu, 05 Mar 2020 09:23:41 -0500
Received: by mail-oi1-x244.google.com with SMTP id d62so6078189oia.11
 for <qemu-arm@nongnu.org>; Thu, 05 Mar 2020 06:23:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=s+7bS6l8n8+BhRIGmgGOgT4La+ye5ARyZS/sNnK/XjA=;
 b=hQDu4BhMQpYebD+Gc97l4ygie7llkfAsopNrUeaxpYID7Jzd+7aOhicpWqmai37/hH
 hsr/wVQkmtdqS3SEM9f6bupcGIzgijzVuxnjkEhShtnKHxmyFtpqrt6PlDjlT6SMP4x6
 bvZ7Z0aiabLjlXbcC5GScC5XSIEbl96tzQP7IvhJ2dj+kQ42EKVPdND8gC2EJSO37gM2
 XJ4gflk8W8pmczud2tAWIRjp9HhlEpmG/9cEjtdiKYlk+WmvcOATyM1Pcb1fqr1QhPzy
 6BA06LeQ0egI0MGPhvpGcxwnRhRn0mlpyKcke6/xyX/gbxCaOjac3YUp22yoTydiJF6V
 BoxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=s+7bS6l8n8+BhRIGmgGOgT4La+ye5ARyZS/sNnK/XjA=;
 b=Jhf9xeW4wsoSOySmNnNRX5EdtIhiuNUvfoZiUk8c+kHV1ynPFGF6u7+S6kvMshTrkI
 drIXQm4Vxsqe7MxtYq2O7snvYUS6tl0FNid9trbcMXaoBvbwDHnpRBCC3FG7Rbjd1Zkt
 5YxULz0bps8vYjVWqsxtJ3+Y3R++CnC2akXt5ohK96Bz2ZiceooDGCWDUXCIUMkCR+mC
 3mhC7kh0X4PQ1eYRVTGpAKKK8cEXW1DKAZGShxAeUnz5kWOBnHvs+l6wBPDbIPQ1DTYw
 FoM+82viCFtWQM4rVAyx0wmT7vrKULaSxyoBTejPLxNRkyrTI6d2UptPGUwwubatUCf+
 qrig==
X-Gm-Message-State: ANhLgQ0X2BI6X89n1BCp9XzTSbIfO/7uw6xqbdGPGmM0SFIJCnMCidus
 CxfWKMw+9EvTntOsRvsBFtLa6j8XQzQZ5PXEl6ABBA==
X-Received: by 2002:a05:6808:289:: with SMTP id
 z9mr5602546oic.48.1583418220700; 
 Thu, 05 Mar 2020 06:23:40 -0800 (PST)
MIME-Version: 1.0
References: <20200302175829.2183-1-richard.henderson@linaro.org>
 <20200302175829.2183-4-richard.henderson@linaro.org>
In-Reply-To: <20200302175829.2183-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Mar 2020 14:23:29 +0000
Message-ID: <CAFEAcA_ZRi+F6+KH7y_C_ZbAGjLyDWd9LkbtJkLn6mFNjqkaWg@mail.gmail.com>
Subject: Re: [PATCH v2 3/9] target/arm: Introduce core_to_aa64_mmu_idx
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vL2Vf0p8uBOL

On Mon, 2 Mar 2020 at 17:58, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> If by context we know that we're in AArch64 mode, we need not
> test for M-profile when reconstructing the full ARMMMUIdx.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/internals.h     | 6 ++++++
>  target/arm/translate-a64.c | 2 +-
>  2 files changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index 9f96a2359f..e633aff36e 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -783,6 +783,12 @@ static inline ARMMMUIdx core_to_arm_mmu_idx(CPUARMState *env, int mmu_idx)
>      }
>  }
>
> +static inline ARMMMUIdx core_to_aa64_mmu_idx(int mmu_idx)
> +{
> +    /* AArch64 is always a-profile. */
> +    return mmu_idx | ARM_MMU_IDX_A;
> +}
> +
>  int arm_mmu_idx_to_el(ARMMMUIdx mmu_idx);

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
