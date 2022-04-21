Received: by 2002:a19:e348:0:0:0:0:0 with SMTP id c8csp500035lfk;
        Thu, 21 Apr 2022 10:00:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxaxBtTlr/P3FknUtVyIKmYc+5xs15ArDl6dlhozX16JekYi32xlUpzuqx5kAOuxPwT5sy7
X-Received: by 2002:a25:b19b:0:b0:641:af55:af7 with SMTP id h27-20020a25b19b000000b00641af550af7mr631800ybj.5.1650560407822;
        Thu, 21 Apr 2022 10:00:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650560407; cv=none;
        d=google.com; s=arc-20160816;
        b=e0R753UH8gTMKEnVw+J07dePASoP7DZyrpGdnzyDDqBj20MA0LUB+XO/XEqepUbyRc
         Mg7GkbRgw1aDLKGg8zOgYFmPBQtGq5TROcjqW3yLNXjQFPiu3yg016w+KwJ8mq2V4I6T
         HiRa9B89bU8epYzf1TeQVo8wPKzYphJH+KUyP+dDnV6EI/bZduhvhnAMHAfUomx6YoE3
         8YDMyLQmh7fXczjbfl5Nm76P9liH4BCB4oHqDsVUaeFVmcgFjkgj63UuBvSzTgKyTzW1
         WTbH0h3siHPIMw65SqG4uKCpL88xS/tQDfWpq5FEDxCSj68RWBiiOzXSQfDzM83ZLeXY
         zAig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=znBKvg3giJox/+l1U0D+DU7ji91IfgGnbpk8ZV1xZAE=;
        b=D7OJAC2teVqOfOto+9oUhsuo69O3tfQwtAWriG93gVIkrp/lkPm0n7mvXiX3G41N/5
         FTDtY7O4Rd2ZVp/AaxOXOtbRZOvTY+VQ5HS/RWcsGpFJykdE+v9nZu/Yu6TPGGGuvFtS
         NpyUByTp048Kfml/ejXohr1QTvLcEq00iRSN64whNagnanXF4nLcBd1XgsPPmFii1rIU
         myHacI3csNtxHksMHr5xQ37Zhxf03r1KA+zOTCs0zuYKb4iKWCH6AVGHvBCVRJh1+qQN
         VOL/9xRcBoRtsfqOPJ/0Ngz/yM1Of9aWkCyZBw3Ncm2PuP3W6ShskFsdx29bx10QsdTH
         7T6A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="KjD1fKD/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j80-20020a252353000000b0064523680056si2851901ybj.93.2022.04.21.10.00.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Apr 2022 10:00:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="KjD1fKD/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nhaA3-0001eK-2q
	for alex.bennee@linaro.org; Thu, 21 Apr 2022 13:00:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhZSj-0007DZ-R7
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 12:15:22 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:43798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhZSi-000767-3n
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 12:15:21 -0400
Received: by mail-yb1-xb35.google.com with SMTP id f17so9601686ybj.10
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 09:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=znBKvg3giJox/+l1U0D+DU7ji91IfgGnbpk8ZV1xZAE=;
 b=KjD1fKD/FErKl1TySts9oDW3+GSy6KVZVxq9SI2Q5bui9xigZheHqwDHg5BjauOEPz
 JcJzdmm7JYSk4JdQIL0eHTSSs58UbLvUErdSs9HiZh7nC6rpllAMDETv5XndOokHpbWa
 k4Lwsv/jRbRyEdrIF/2LNuV21Mh3f39MpDbaRrzzaorFITVuMB4Lfu5ZbL66GgLYJi+u
 uqvsg3CubIsPDj7CSBqgdV73HOgt4THkwLalNp43zso1MA+6CkeFLDB1of9f1SQYk2br
 QKee7nj9ESmiBzENyid+R1+un2mtH+UnB5hUSB6/J0rCamr+YnLN3OxwbPFoIesfXr7x
 Nxlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=znBKvg3giJox/+l1U0D+DU7ji91IfgGnbpk8ZV1xZAE=;
 b=spvJR/GfY+Og3gOmuUKU00zX+0ERsNy7bFifFFI2MVRy+xMtolI2669UsFHiN2CKFs
 +qzLCZ/vS/cEnpH65/fs1+/3936oGeZhc3iQ7ua9f9GfxaAD8j2Tpkb843mb25JwtpCB
 LacyRjnludoOOx3k7M71wgu51N//iXLiVFxckZPZ6sahvlLVc+P8PtTYUDN6B6OC/APw
 8ABsFKxH+Cx4PiFU7FUer3KjiVpkFasqgCPfbsXLcZK67Qi5QbNM5TjbgFbVxoaUlCLh
 L+RRX1zfq2NPWNBexJW79Pzpd1JeDygtIR0wvI3iePEZFCOG2QOGWJQSzzJElcqz8Mfk
 Kd0w==
X-Gm-Message-State: AOAM532OFr8ApOU6+hJJFVrDLDxnAHcTLO6F9vd49K7X44wd4mABgJX/
 IXF5coNHtJVd8T5M9CGn4LmC8KnJ93SdyM6GTHc+ZQ==
X-Received: by 2002:a05:6902:390:b0:645:7d46:f1db with SMTP id
 f16-20020a056902039000b006457d46f1dbmr423765ybs.85.1650557719017; Thu, 21 Apr
 2022 09:15:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220417174426.711829-1-richard.henderson@linaro.org>
 <20220417174426.711829-8-richard.henderson@linaro.org>
In-Reply-To: <20220417174426.711829-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 21 Apr 2022 17:15:08 +0100
Message-ID: <CAFEAcA_vFKkznV-heaWimT-R6QNzH39+=tcS4ZXQ4Y7zMMu0gg@mail.gmail.com>
Subject: Re: [PATCH v3 07/60] target/arm: Extend store_cpu_offset to take
 field size
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5QVJ4BSSVidN

On Sun, 17 Apr 2022 at 18:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Currently we assume all fields are 32-bit.
> Prepare for fields of a single byte, using sizeof.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a32.h | 13 +++++--------
>  target/arm/translate.c     | 21 ++++++++++++++++++++-
>  2 files changed, 25 insertions(+), 9 deletions(-)
>
> diff --git a/target/arm/translate-a32.h b/target/arm/translate-a32.h
> index 5be4b9b834..f593740a88 100644
> --- a/target/arm/translate-a32.h
> +++ b/target/arm/translate-a32.h
> @@ -61,17 +61,14 @@ static inline TCGv_i32 load_cpu_offset(int offset)
>
>  #define load_cpu_field(name) load_cpu_offset(offsetof(CPUARMState, name))
>
> -static inline void store_cpu_offset(TCGv_i32 var, int offset)
> -{
> -    tcg_gen_st_i32(var, cpu_env, offset);
> -    tcg_temp_free_i32(var);
> -}
> +void store_cpu_offset(TCGv_i32 var, int offset, int size);
>
> -#define store_cpu_field(var, name) \
> -    store_cpu_offset(var, offsetof(CPUARMState, name))
> +#define store_cpu_field(var, name)                              \
> +    store_cpu_offset(var, offsetof(CPUARMState, name),          \
> +                     sizeof(((CPUARMState *)NULL)->name))

compiler.h defines sizeof_field, so you can write
  sizeof_field(CPUARMState, name)
here.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
