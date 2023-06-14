Received: by 2002:a17:906:ae84:b0:982:368b:d395 with SMTP id md4csp984831ejb;
        Tue, 13 Jun 2023 22:30:55 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5lVHb92vMCLmIHVUXXIy9AO3g4MENynsRjzn0I5X5zTy30MfCCKx/T5kcDrDCgeTce/vlG
X-Received: by 2002:a05:622a:113:b0:3f9:ab64:8bd1 with SMTP id u19-20020a05622a011300b003f9ab648bd1mr1305576qtw.7.1686720655495;
        Tue, 13 Jun 2023 22:30:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686720655; cv=none;
        d=google.com; s=arc-20160816;
        b=jljVWSQ1kCHYs9swf8Y7rRLJFKlBIkP9iL24736XMPlA4G7utg7XLmXzAROMwuO52y
         h9sPRsruUcVfO7UZ3m0jb4XDygn52X1XtxRlMhHDhr3OD/tvTcUBVrYpkqrIxRE/2Eu5
         IhhKLqJYk7AJEdKw73vpiJzB1PT7mv74xQGXno4woP86VClyUeRku7jxcvd1UYPZ89ZT
         /NUrOhF/5AMqGcJHxMJWVUdTKyLELuxdOL/WZHa8e3zDnferlLTc0GRm3esXB3yH6v1h
         TeRJb7Mct1ohi8UWKHRgH1GhZoH8GSM+Ee+WyzoMD+TlKepPlbSyKLJWLUR6KqcDK2yH
         9CTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=wPP6mWohKbwSJRTYfbmfdQ92HjL7m75udwbf2upx1hQ=;
        b=PZrcSCY2mPlzEVoNDaOIGOvO9pFZzktk1AtTY/xxIRGqIqYIVNd9ByZ6vnpaoAv0cG
         ToWCb9AjGjfMydB3Gmo854OE0AF/l5SmnUHwZSX8bt6wVlDP5kX3Zds1DvzQ4IHzlcV+
         axL5tbgMyckGApslNcMKS4QdsQgld7tOGC35u230qXT0mTg948DjKTPztp6QO4/ipuGf
         SPyc5+LZHEcYQQZw9UDdLY2e+5B+ERUdSQvXW0tniCvSF4B0OH2QlX7HjSCpTD9HY6BX
         O9k4AMlZaj3vfWCRadV1nBTVZ7EUTGeo7wSmrvELQebTY8Yv5kPoxy0vysiYKpYvdlMt
         W0TQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F5IJafTO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e19-20020ac85993000000b003e4f04bdc48si8363080qte.455.2023.06.13.22.30.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Jun 2023 22:30:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=F5IJafTO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q9J5d-0003m8-QT; Wed, 14 Jun 2023 01:30:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q9J5c-0003lJ-OB
 for qemu-arm@nongnu.org; Wed, 14 Jun 2023 01:30:40 -0400
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q9J5a-0004Cs-Um
 for qemu-arm@nongnu.org; Wed, 14 Jun 2023 01:30:40 -0400
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4f766777605so321024e87.1
 for <qemu-arm@nongnu.org>; Tue, 13 Jun 2023 22:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686720637; x=1689312637;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=wPP6mWohKbwSJRTYfbmfdQ92HjL7m75udwbf2upx1hQ=;
 b=F5IJafTO/gJsFizLV9RLgT3GN0EFg37W5Whb6nYy+UAFh5CyGe+QPKnFXIrbDV/Yg3
 QZOHTiIv/Oe7XjuNJTf5T8Aiw/+tHFeNRewxyCdWv1ehg+Y/JUSFQAeubxDCfFW2Zh1t
 Wh+osVP2aSPfkrMrJkUANA0y9VdToV6ny1XORmyVVUiRLeRh2HiIgAGsPZ5BabteFreA
 rtwmE/cnw4/j4hqnL7xSafkQW613yiMrLd+K3DV5kGcIfsTc8B0DbwxEHM0Yq8fgSCJz
 CD4aoNrmnfTwQfGkxA9CVHutGM/NWWS8mvEiirUuPgs7ICzInliNiJ9oXsaZJQzUl/Nn
 HLCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686720637; x=1689312637;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wPP6mWohKbwSJRTYfbmfdQ92HjL7m75udwbf2upx1hQ=;
 b=TxFPPYbCeiqHwemLhErFqTRG1rJ02t5R1oo8iKctiNEt2nrvTvaN1FU6kltqXN3X+L
 CG7eo/FXXwN7ozFWc9gwGoafoNWoLZ+hQvJrwlDHfvQjT5veeVGq/8dtMASO8qq19O/e
 6MMsGinAlSPeYU1dpnAp81jksV4JTA1G8uHJoDy+gcAzfg2rtPuk+IKrLhlCuQpyu/2I
 EgDx/bGLf88EXmPGoSToAkn9KpeKysifQnXKK4z/rK75PwkFGNdkjEBkLnC7vwbyXdvx
 3VkKbudq3hfx1BEWKhrF4JZ9OOkF7dn6IY7a9R7B91EVfAFtanXY5GuuBV7d/gYpqOFp
 moig==
X-Gm-Message-State: AC+VfDw3M1Zt2dIWBHwdL52/jDBK+fiYgdQnWsUIUT14N9fl0dXJrtXE
 H9sRf6N9wUBAxI+119I4FxTAL4Qc+xYz9U5pGLn/96Z1
X-Received: by 2002:a19:5602:0:b0:4f7:6427:c4e4 with SMTP id
 k2-20020a195602000000b004f76427c4e4mr835615lfb.29.1686720636971; 
 Tue, 13 Jun 2023 22:30:36 -0700 (PDT)
Received: from [192.168.4.112] (90-182-62-66.rcp.o2.cz. [90.182.62.66])
 by smtp.gmail.com with ESMTPSA id
 o16-20020a1c7510000000b003f7e6d7f71esm16283945wmc.36.2023.06.13.22.30.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jun 2023 22:30:36 -0700 (PDT)
Message-ID: <98a4691a-db64-76e4-449f-4b4983cf166e@linaro.org>
Date: Wed, 14 Jun 2023 07:30:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 14/23] target/arm: Convert load/store-pair to decodetree
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230611160032.274823-1-peter.maydell@linaro.org>
 <20230611160032.274823-15-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230611160032.274823-15-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=richard.henderson@linaro.org; helo=mail-lf1-x132.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.098,
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
X-TUID: 35TJJHemKDBO

On 6/11/23 18:00, Peter Maydell wrote:
> Convert the load/store register pair insns (LDP, STP,
> LDNP, STNP, LDPSW, STGP) to decodetree.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> Message-id:20230602155223.2040685-12-peter.maydell@linaro.org
> ---
> This was reviewed in v1, but the underlying code
> changed enough in the atomic-ops work that I've dropped
> the R-by tag.
> ---
>   target/arm/tcg/a64.decode      |  61 +++++
>   target/arm/tcg/translate-a64.c | 425 ++++++++++++++++-----------------
>   2 files changed, 271 insertions(+), 215 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


> +static bool trans_STP(DisasContext *s, arg_ldstpair *a)
> +{
> +    uint64_t offset = a->imm << a->sz;
> +    TCGv_i64 clean_addr, dirty_addr, tcg_rt, tcg_rt2;
> +    MemOp mop = finalize_memop(s, a->sz);
> +
> +    op_addr_ldstpair_pre(s, a, &clean_addr, &dirty_addr, offset, true, mop);
> +    tcg_rt = cpu_reg(s, a->rt);
> +    tcg_rt2 = cpu_reg(s, a->rt2);
> +    /*
> +     * We built mop above for the single logical access -- rebuild it
> +     * now for the paired operation.
> +     *
> +     * With LSE2, non-sign-extending pairs are treated atomically if
> +     * aligned, and if unaligned one of the pair will be completely
> +     * within a 16-byte block and that element will be atomic.
> +     * Otherwise each element is separately atomic.
> +     * In all cases, issue one operation with the correct atomicity.
> +     *
> +     * This treats sign-extending loads like zero-extending loads,
> +     * since that reuses the most code below.
> +     */

Could lose the bit about loads within the store function.


r~
