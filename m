Received: by 2002:a17:907:2c4d:b0:94e:1233:1117 with SMTP id hf13csp457910ejc;
        Tue, 11 Apr 2023 05:14:34 -0700 (PDT)
X-Google-Smtp-Source: AKy350Z6+c+pms4VVHk6obZFJzFzReiPePFqbFHZWT3uYbtTFSX8Eig53eWHClKbx086J7BNUHTR
X-Received: by 2002:a05:622a:1888:b0:3d5:d9ed:a36b with SMTP id v8-20020a05622a188800b003d5d9eda36bmr21957080qtc.64.1681215274061;
        Tue, 11 Apr 2023 05:14:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681215274; cv=none;
        d=google.com; s=arc-20160816;
        b=KaxJ+NKF25Lt0PaBwHwMOzkIXLFd7WfP27mEO3x+EgsSGJpmyww3eeh92YTjeke+Kv
         sQqIseasZhqtqs9SofiDHFVh+XKQ/7Tlqz9wZXNautyp2M5Nb4PsnIW5gR2hSIj2mPCm
         TXeVUTHMpBNx02hZBmSEcH4x1OzbFkEorfq/LHNEZt2aXimI0mtJAmdHSpWHGcSMYL2t
         IB5Vc/i5xW5jRlXldHv06sBTD2lZQVBD+dsOLwVH3G7iShuHJ9kl1U3l9nJddZWUj+d8
         5hAXgOxJS+N/Y3LjPvCV0rdTVgPAAou/XUtb6rDuVrk1m0cmTUq7XZe5D13A2ueMR7YM
         sxFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=zPOeUlaW68v5F0+HfoZ9nM5o2OGfCIeWCLyL+H57f3g=;
        b=VLi58GUQ2FFZ5ib3/0UOS+1jKucz1qFIGynJ/55NHyBLHndKhAao4tmkfxjxAJLkGh
         0K0pfEUmY3/K4+Ex6rhyARf4mXGDdlDPGBnLyg+Q2LzHCa2BVE/dmg3BEqxgyF/YrDT/
         xJIUAUsuGRolnwU7cQAnfmk/lOieBJA2pNu2I//M6XDvGwE/KpHyM23k6Hb+9MKdxKDZ
         SWV+mM0yFucocqjRttHiH913uxqM/lGDjWLs4RtdqfhtwyiXZx5au3eUvAxlBmI61DGe
         Xv9GAglHHh8WfeT8x1fUk3fMuK0KvSEA49iLHoieecUMRYJHt9YBO4D1FsShlc70EFxu
         3opw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O7EkRVKU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t33-20020a05622a182100b003e38db3f386si9031466qtc.90.2023.04.11.05.14.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Apr 2023 05:14:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=O7EkRVKU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pmCt5-00081n-TH; Tue, 11 Apr 2023 08:14:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pmCt2-00080m-4d
 for qemu-arm@nongnu.org; Tue, 11 Apr 2023 08:14:12 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pmCsz-0005Qg-8I
 for qemu-arm@nongnu.org; Tue, 11 Apr 2023 08:14:11 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 i8-20020a05600c354800b003ee93d2c914so5638777wmq.2
 for <qemu-arm@nongnu.org>; Tue, 11 Apr 2023 05:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681215247;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zPOeUlaW68v5F0+HfoZ9nM5o2OGfCIeWCLyL+H57f3g=;
 b=O7EkRVKUj4VdYaBhcAT96V/1y8eVo0/3TdC23NRbjlcN8FKjhTOUNOYVoScdzVG8D9
 5094K+hMcQ5OBCTC40P3E4XidW++eby/Ef0a+pYWkvthravbj4hUNLku5pH+My/4xpeu
 UiNfrmdtoZZiIj84LnrlPs08B3VtU2myz8HezHZQcysIQGpAYJwuANf5TFktTQ6DM7YY
 QVLFssccpOna3FLAtl+tzk73UDRvxfyY+JAyiMYiVr9bT5BUt01X7cIM+qvIYYoJCF3m
 6Q4i/rkMRxhLCpi9MiONH/Wsrac1kNHpmaGNBi/r7wuJ3BqUrAiOMB9bC9B/fxWwnFIt
 1seQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681215247;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zPOeUlaW68v5F0+HfoZ9nM5o2OGfCIeWCLyL+H57f3g=;
 b=nc00y80ASUbCGCtruIM7g4z60a9UDUDofL19JiGat1dpFkuD16woT88m9rnI2LesXI
 Eua+LerhdvmqTG3cdQ8kOYQo9Da0VwmvfSmc6UJ9ndITa0iS3RJTybz9TWZjCt9mSSdZ
 N1cItGWBJFsENh9+TmojQIex3RyeIiLfl19cA3Vi521Eh4DA6yyIjfpH86HVvxoinG04
 pDslsH2EhHSE5OI/jY0VB6A0yErggwilh7sAqphakg71pGMp9iSozlykc6Q0KMLWNOdB
 IVhk5egDw236OcUPnjAyPvSQUVkkEYEIR3yUYLfcPDe3eE/1Lb8GlNyGkTKiUfYNCEAS
 8MRg==
X-Gm-Message-State: AAQBX9cGg9vOOW71oXWpQhsgLx/4Bplc5KF80dx15TZ6VuLRGlzUqphS
 p+jOGmES8PoveMCLt7QaLY76l/rJ8TKgHOdbq4Q=
X-Received: by 2002:a1c:7914:0:b0:3f0:4428:9445 with SMTP id
 l20-20020a1c7914000000b003f044289445mr6619008wme.14.1681215247244; 
 Tue, 11 Apr 2023 05:14:07 -0700 (PDT)
Received: from [192.168.1.101] ([176.187.195.239])
 by smtp.gmail.com with ESMTPSA id
 m19-20020a7bca53000000b003ede06f3178sm16742878wml.31.2023.04.11.05.14.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 Apr 2023 05:14:06 -0700 (PDT)
Message-ID: <cfd216ad-ab40-bf2a-8f4b-105a5af961cf@linaro.org>
Date: Tue, 11 Apr 2023 14:14:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH 21/42] tcg/aarch64: Rename ext to d_type in tcg_out_qemu_ld
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-riscv@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230408024314.3357414-1-richard.henderson@linaro.org>
 <20230408024314.3357414-23-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230408024314.3357414-23-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.17,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: hD4G/cXi8pQQ

On 8/4/23 04:42, Richard Henderson wrote:
> The new name is slightly more descritive as "data type",
> where "extend", despite the c type, sounds like a bool.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/aarch64/tcg-target.c.inc | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/tcg/aarch64/tcg-target.c.inc b/tcg/aarch64/tcg-target.c.inc
> index 4ec3cf3172..40122e1471 100644
> --- a/tcg/aarch64/tcg-target.c.inc
> +++ b/tcg/aarch64/tcg-target.c.inc
> @@ -1851,7 +1851,7 @@ static void tcg_out_qemu_st_direct(TCGContext *s, MemOp memop,
>   }
>   
>   static void tcg_out_qemu_ld(TCGContext *s, TCGReg data_reg, TCGReg addr_reg,
> -                            MemOpIdx oi, TCGType ext)
> +                            MemOpIdx oi, TCGType d_type)

Since we have 'data_reg', can we use 'data_type'?

Otherwise:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
