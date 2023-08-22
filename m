Received: by 2002:a17:906:80c9:b0:9a1:ac8c:26bb with SMTP id a9csp722046ejx;
        Tue, 22 Aug 2023 06:29:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxf5p7hbgNENGZiIZ11lkExYRx0jqGUzS0uqfZB3ev+6LsPVrjrJHJTh+qYjSQLqaBnfpH
X-Received: by 2002:ae9:f70e:0:b0:76a:eeb6:dd7b with SMTP id s14-20020ae9f70e000000b0076aeeb6dd7bmr10051692qkg.75.1692710948318;
        Tue, 22 Aug 2023 06:29:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692710948; cv=none;
        d=google.com; s=arc-20160816;
        b=J6J9bM5pdyCSTGJ4sgm0DHQHy3cjMx7/5v1AAGDZDivu1joK39Jgd40umoqlgR+Dr4
         20MsbxbhbUdvtAp44UWdR38AOKIqyO77OydWAdj7myBjDb809x4aH7yFDS4NseEVZO5k
         zxM8Nhb7ECLs6242hNlNlbsny52yUk1QLu7B16XGaJ7cTJWPZCMY60uevfPKBLYuvrKv
         ro5EHnY4VSVZEC5nMb6lTzyGr6Qlx8vZWEVUv1VZNnAnEAmFLgQ52yHIyQJGXzmbGA4H
         mff634JWmYx3TMAaiNP193pASXEz0kqHfOQzhqNK8HBJxfZXYYbmd0F9kSbBj3Vg34Pz
         FvoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=AdZ6t3FEvjVbC9VbhArQHV+p79IK14MZ5kvSDksimjE=;
        fh=EV9l6mrTVkKkbrkF6N0qEMcrCTp/PBNz/Dv/hSC7viI=;
        b=Bk7izULWbLPYkr0CFN55Kg1WWfvQxkALcrKBe0QD/JKR+2z4CLxLxrXYTB3bKLIGjp
         mg7ac7GLuXnJfuZsk/msn2MequIN0imf9aiWzQgJ2grx+Npe2rT6dYkHIdxsEXPm0Hx/
         SU6WLIzkfFhYZllLHgsP0Kz8TPwWJADZbBW1iu00/fKMwWylAl5FQArxVqM4hBHe16kX
         U39tLCTDvd+A74mUdVgNmxfyHNHq0YOivvifbXr369cCxz30/wUneqjrVLhJUoRzxesY
         L7GhSmixHhZDrOQtrqvCVth/A9JJd9XK8Hwe8ZyvZORnA1kRfez1Dqg7UR45qskXpQmQ
         dcPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aPrAMpnk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x23-20020a05620a0b5700b0076d74037adesi926080qkg.304.2023.08.22.06.29.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Aug 2023 06:29:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aPrAMpnk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qYRRJ-0008HH-7D; Tue, 22 Aug 2023 09:28:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qYRR3-0008Ad-KC
 for qemu-arm@nongnu.org; Tue, 22 Aug 2023 09:28:42 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qYRQz-0003xg-Cg
 for qemu-arm@nongnu.org; Tue, 22 Aug 2023 09:28:41 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3fe12820bffso45006635e9.3
 for <qemu-arm@nongnu.org>; Tue, 22 Aug 2023 06:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692710912; x=1693315712;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AdZ6t3FEvjVbC9VbhArQHV+p79IK14MZ5kvSDksimjE=;
 b=aPrAMpnk3dbgDMp2/civwwTYBCSxLGy2exEJGkXN9whNm9jLkggoyWJe8VftsuXyW0
 ODkteNvqpS7Abp9ORm+d65wEKJmDk6iWoUo8OVJcgJhG7EZVZ9BW1gkAgEdJ9ztOUzap
 HIBzA0EYDOh80eOr1mGcPhdIhgiQCWt36rWNjHOM8Pa39C21hopurjnI/WZWWy0CVTCD
 xoCojjApwaUvsfLarOmi403O3DmVWfStiAtAz8Y48ScDI9Luvv6SXb7Bn5mfZqfz/tCy
 gIT059UJtBqRuU79zUTAp1DYFhSuQ5pWIK/OlFDOgg99MU11KVi63aVjQ6vspRAoxc5v
 ULtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692710912; x=1693315712;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=AdZ6t3FEvjVbC9VbhArQHV+p79IK14MZ5kvSDksimjE=;
 b=RL+mTQHC38mis7LgnGC1xtACfq0Gri8PP0UoD3UIuaIZDcLj28WJI8OnlXKOFyrBZK
 FwwLEZcSmFGCqsKhCF+7TIyVW6ijHPekRdZHy/PtxBjCiRBdeLAClUYSXP3pGl3NqQHg
 6MScVPATC6P06zKhSfcSWtrlLtroRvIQn7sVMrZv1/IovXtVK6jrmCG32LU1w2zsSdVU
 Mw2lK43N0FW3STsTM52/ivNsHYjPFW+9gESWdbmHICNmk0LPYBp2IAWJd9lA/OR/aFXB
 UNJQWOk1lH/S1xZZJJJNZQ/UHQJw7uQtYXf5pEz50i3Uf9FCn0nZTk8FA3+Fq8E4dV8Q
 aqLQ==
X-Gm-Message-State: AOJu0Yz47y9neJv9WNVsUJ0uRm+w0AsSHezoHU4Z0v+USUtXEwDZurpn
 kNSlsiN2BkMO1J1h2mpmvAXZeQ==
X-Received: by 2002:a7b:c8d8:0:b0:3fe:195c:eca3 with SMTP id
 f24-20020a7bc8d8000000b003fe195ceca3mr7107732wml.9.1692710912713; 
 Tue, 22 Aug 2023 06:28:32 -0700 (PDT)
Received: from [10.2.0.2] ([37.19.214.4]) by smtp.gmail.com with ESMTPSA id
 m7-20020a5d6247000000b003195504c754sm15879049wrv.31.2023.08.22.06.28.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Aug 2023 06:28:32 -0700 (PDT)
Message-ID: <8d7b2863-c5e1-4222-3011-1d58157b62a8@linaro.org>
Date: Tue, 22 Aug 2023 15:28:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH 08/12] target/loongarch: Use generic hrev64_i64() in
 REVB.4H opcode
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Song Gao <gaosong@loongson.cn>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz
 <groug@kaod.org>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-ppc@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Nicholas Piggin <npiggin@gmail.com>, Xiaojuan Yang
 <yangxiaojuan@loongson.cn>, qemu-arm@nongnu.org
References: <20230822124042.54739-1-philmd@linaro.org>
 <20230822125122.54991-1-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230822125122.54991-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.767,
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
X-TUID: vHTiDpt7h44U

On 22/8/23 14:51, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/loongarch/insn_trans/trans_bit.c.inc | 15 +--------------
>   1 file changed, 1 insertion(+), 14 deletions(-)
> 
> diff --git a/target/loongarch/insn_trans/trans_bit.c.inc b/target/loongarch/insn_trans/trans_bit.c.inc
> index 95b4ee5bc8..c04806dc21 100644
> --- a/target/loongarch/insn_trans/trans_bit.c.inc
> +++ b/target/loongarch/insn_trans/trans_bit.c.inc
> @@ -124,19 +124,6 @@ static void gen_revb_2h(TCGv dest, TCGv src1)
>       tcg_gen_or_tl(dest, t0, t1);
>   }
>   
> -static void gen_revb_4h(TCGv dest, TCGv src1)
> -{
> -    TCGv mask = tcg_constant_tl(0x00FF00FF00FF00FFULL);
> -    TCGv t0 = tcg_temp_new();
> -    TCGv t1 = tcg_temp_new();
> -
> -    tcg_gen_shri_tl(t0, src1, 8);
> -    tcg_gen_and_tl(t0, t0, mask);
> -    tcg_gen_and_tl(t1, src1, mask);
> -    tcg_gen_shli_tl(t1, t1, 8);
> -    tcg_gen_or_tl(dest, t0, t1);
> -}
> -
>   static void gen_revh_2w(TCGv dest, TCGv src1)
>   {
>       TCGv_i64 t0 = tcg_temp_new_i64();
> @@ -175,7 +162,7 @@ TRANS(clz_d, gen_rr, EXT_NONE, EXT_NONE, gen_clz_d)
>   TRANS(cto_d, gen_rr, EXT_NONE, EXT_NONE, gen_cto_d)
>   TRANS(ctz_d, gen_rr, EXT_NONE, EXT_NONE, gen_ctz_d)
>   TRANS(revb_2h, gen_rr, EXT_NONE, EXT_SIGN, gen_revb_2h)
> -TRANS(revb_4h, gen_rr, EXT_NONE, EXT_NONE, gen_revb_4h)
> +TRANS(revb_4h, gen_rr, EXT_NONE, EXT_NONE, tcg_gen_hrev64_i64)

We should use tcg_gen_hrev64_tl() instead.
