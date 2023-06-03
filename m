Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp1608698ejb;
        Fri, 2 Jun 2023 22:55:56 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5boYz03dmMdofknDmMtFYAqVuMyhZY0n2ZaeHh3RVCzaTymybdwAqeyt/J69jH0hNja1Nk
X-Received: by 2002:a05:622a:14cd:b0:3f6:b760:f3dd with SMTP id u13-20020a05622a14cd00b003f6b760f3ddmr762781qtx.33.1685771756122;
        Fri, 02 Jun 2023 22:55:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685771756; cv=none;
        d=google.com; s=arc-20160816;
        b=F1qENNwEbcY5PXmtUzvhR43+0AP55vtDXCS/kFH10bSApJqs5SqXLU2dW3UMK5Np5G
         bAS42ynyFMjKW2AoKOv7Tx0NfJsIkGbJ02CDm/fmgIZ0tyiOoaEeEQxPldaI/RlT4dsJ
         BW/tEmc1YlWfelXOFUNpn4lUvHjhf3vm4wmp5JXQhjeF1GEvKvPkyhM/o0qOiqXHmkZL
         R3mzGDPfjbbzdp1E6wzmXFGz+JNetq0J+xhvpcLfOrnL7EjvpvYuRBAicp1stez7PQLe
         5pfsNsmyyi0P+fhGHm1j7ISV358Jaa3hZmJRyiQl6QzJzcthpVvkocw/3SrZfpS4H6vS
         Yfhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=jttbcJnFZj39GM1LJug9GJjGL1ipDurAc4n00MT/aso=;
        b=gQChLE0jT9V4O8yA5WkL/dFayr9IAMkrqc93GMF60IM2SErofR61/EcfWLLC+WULbK
         a2RP4UzTQNWoVQBYj0IGJxWJz+mgM1uPKoi452g4qKpKgfyLmrIFb9HrHwn2T0UIUbk6
         /FGNNGXjFTFb+XY2mv1HOsa0jcHzsKCaav560pcydnDCF7Fj4i5vdR9l3eWbANt1Kx5E
         9q3ZZb8YLYoy0McdhsBWeeeTSrjjDFH7nZC0QobntnUoY3s28pFcgdmjXodcJQ7L4AZx
         AqgP0vqNwCruzbJgrcP9NHccUpwJ1E5tXBWUOUUGn9/OigYmDYFWWqMu/9PX/mcN66nB
         HPOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZlaYwgEv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u15-20020ac858cf000000b003f4ee23ba04si1818303qta.452.2023.06.02.22.55.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Jun 2023 22:55:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZlaYwgEv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q5KEw-0005fA-0E; Sat, 03 Jun 2023 01:55:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5KEs-0005ef-93
 for qemu-arm@nongnu.org; Sat, 03 Jun 2023 01:55:46 -0400
Received: from mail-oi1-x22c.google.com ([2607:f8b0:4864:20::22c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5KEq-00014K-Jx
 for qemu-arm@nongnu.org; Sat, 03 Jun 2023 01:55:45 -0400
Received: by mail-oi1-x22c.google.com with SMTP id
 5614622812f47-39a3f26688bso2348431b6e.2
 for <qemu-arm@nongnu.org>; Fri, 02 Jun 2023 22:55:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685771742; x=1688363742;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jttbcJnFZj39GM1LJug9GJjGL1ipDurAc4n00MT/aso=;
 b=ZlaYwgEvBKfFlxXVf80aEV9ctcabAaoqK9DimxRwKQKcopMOCyBPPA3q4gRZQKaS2i
 P+DwWxvV+Zx66qIiZXII7jViOWEc3S68XcFfxxnUd97R1TpBTsAsPWoM5wI9a4JRRAYc
 P66+SzDd+otWvHo5ZxlODFlRbTFj7iQrySPPLNODR0Gc9dX5BmfsFnCJoKA80+pYUmvU
 fP7hMXA3QgreT9AbKGLUFIBOQDgLcU2f2hjcJfrmYNSKKZFjsIZx4v0ZYxL+fmZ2oc9H
 mTVj60nX8yoO8u4iyFubZ/p0XJZGX+yO+eTL0sLeMtLeXTq5ufixLcXig/Yo8Pf/2BNE
 NJKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685771742; x=1688363742;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jttbcJnFZj39GM1LJug9GJjGL1ipDurAc4n00MT/aso=;
 b=ExCb/P9+h8SeEu1qWsbi/oVYi86L5ObWTjKH05ZGqYnReWjA7DlyekdYcfgCYGov9L
 Hbm0Z2T7l0YLResIx53IFDuY9wXSIDmF2KbCNXuPWG0JmLOP58FAdeXA3mClsyuxwSx6
 HX0RYnEUHW3WFtOZt023cSh2LKmhsWPGGiiAyAShNYwrZbvYqkWkuevPrQdrlVMeqCvw
 /vmaytRo+3GHXpKho5xfwm2eChE/5CHLgfoBt3MnMPCGlUoTGv5VaIOQOXMyTZamUhBg
 C2yPUn6TOZRUV712NhwLOqEwhzYHroV6tGRHSKvdLWH0wI3QLFXFJS3awC03ysDf4Pq5
 0Cog==
X-Gm-Message-State: AC+VfDwRyrHzinUixHyKPSF2THgXVwfyTJ+NnQQgGbqwAdeKh0nr6z/A
 jNVTFti9zerFu06akDWaXrUAIA==
X-Received: by 2002:aca:2b08:0:b0:398:c78:ab82 with SMTP id
 i8-20020aca2b08000000b003980c78ab82mr2534998oik.19.1685771742128; 
 Fri, 02 Jun 2023 22:55:42 -0700 (PDT)
Received: from ?IPV6:2602:ae:1598:4c01:66a6:82c2:d794:68f6?
 ([2602:ae:1598:4c01:66a6:82c2:d794:68f6])
 by smtp.gmail.com with ESMTPSA id
 ik8-20020a170902ab0800b001a194df5a58sm2345266plb.167.2023.06.02.22.55.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 02 Jun 2023 22:55:41 -0700 (PDT)
Message-ID: <16f864db-7f60-3176-461d-f510243d2d60@linaro.org>
Date: Fri, 2 Jun 2023 22:55:39 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 04/20] target/arm: Convert CFINV, XAFLAG and AXFLAG to
 decodetree
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230602155223.2040685-1-peter.maydell@linaro.org>
 <20230602155223.2040685-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230602155223.2040685-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22c;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22c.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
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
X-TUID: TIqPZOH4OUu0

On 6/2/23 08:52, Peter Maydell wrote:
> Convert the CFINV, XAFLAG and AXFLAG insns to decodetree.
> The old decoder handles these in handle_msr_i(), but
> the architecture defines them as separate instructions
> from MSR (immediate).
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/tcg/a64.decode      |  6 ++++
>   target/arm/tcg/translate-a64.c | 56 ++++++++++++++++++----------------
>   2 files changed, 35 insertions(+), 27 deletions(-)
> 
> diff --git a/target/arm/tcg/a64.decode b/target/arm/tcg/a64.decode
> index 553f6904d9c..26a0b44cea9 100644
> --- a/target/arm/tcg/a64.decode
> +++ b/target/arm/tcg/a64.decode
> @@ -188,3 +188,9 @@ CLREX           1101 0101 0000 0011 0011 imm:4 010 11111
>   DSB_DMB         1101 0101 0000 0011 0011 domain:2 types:2 10- 11111
>   ISB             1101 0101 0000 0011 0011 imm:4 110 11111
>   SB              1101 0101 0000 0011 0011 0000 111 11111
> +
> +# PSTATE
> +
> +CFINV           1101 0101 0000 0 000 0100 0000 000 11111
> +XAFLAG          1101 0101 0000 0 000 0100 0000 001 11111
> +AXFLAG          1101 0101 0000 0 000 0100 0000 010 11111
> diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
> index 09258a9854f..33bebe594d1 100644
> --- a/target/arm/tcg/translate-a64.c
> +++ b/target/arm/tcg/translate-a64.c
> @@ -1809,9 +1809,25 @@ static bool trans_SB(DisasContext *s, arg_SB *a)
>       return true;
>   }
>   
> -static void gen_xaflag(void)
> +static bool trans_CFINV(DisasContext *s, arg_CFINV *a)
>   {
> -    TCGv_i32 z = tcg_temp_new_i32();
> +    if (!dc_isar_feature(aa64_condm_4, s)) {
> +        return false;
> +    }
> +    tcg_gen_xori_i32(cpu_CF, cpu_CF, 1);
> +    s->base.is_jmp = DISAS_NEXT;
> +    return true;
> +}

The settings of is_jmp do not need to be copied across.
That's another benefit of extracting from MSR_i.

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
