Received: by 2002:a17:906:4a55:b0:9d0:bf65:29fa with SMTP id a21csp1168496ejv;
        Wed, 8 Nov 2023 10:00:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEP1AFKyskQZxRKcBjEHxYVxDlCRXk/0qnQnfPtJ6CJ21MRRHyGiiRt4x8XciG5bcmwHOnk
X-Received: by 2002:a05:620a:4413:b0:76c:ea67:38e4 with SMTP id v19-20020a05620a441300b0076cea6738e4mr3910502qkp.12.1699466440296;
        Wed, 08 Nov 2023 10:00:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699466440; cv=none;
        d=google.com; s=arc-20160816;
        b=bdfIekKLJEXqHhm2dNqp9HWDLRAO3M+ZVvQiH9/KAuSQ53480dOPuWT51LkVjV5lQB
         X71HgOKKxJFk42N07TSR09gbNWH1hPfStsLMirQOpvnCXUM6b8u01U9KlqTHzHEVYKBW
         N2WmER+bfJF0fB1YhYST4dUwSO4CEcPR1+w1NWjfMIrXWyZxrcSUxsu3I/w+DM0PqI3w
         PZO3eq7DiUsRBgogLxHfAQDNvmVgpPeMdsWywJ56KzVQD5dqmBwYParFNRozJ6A4nzNV
         wusgoYVwIMwupedSodrxALOfG2HqjTu0OeV5Km5b6b+5AfkDss3Hg55lIp3fHeGUILZl
         MRrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=zCIV6xhOEy9e0/ump87scJTxEKubosmfb6SjXkR8ygA=;
        fh=j5doSKGod8oyUESooY4x4uPb0J6wbivLP2rgXSRQ1/o=;
        b=e68D7m8NP2zihuLkZe8RkXICjNKEggxlymZ4Ny3uYWO8i55vamGIjHjyRtVkvBi8u+
         Uu9TFegt3haS/bNaS9O/KC3dKPwD6N3bgP2INXBh1PhBaJS/m1V7AyTgYxj8dil57N/F
         NFQU43Jz1zxrrEUSFPyjNBmUgc68jlComVq24qMa0GVr6BK+m/jDFX6GQITogWXp/OVb
         QMmIG5KU+iTr7XidqfIuyt605l7WJFAFu+hhKn8fBVamWei+WRaspaRBXbPytpmBxw0g
         OnFoQ9w62WkxWGEbOIk49LbfE42V/xBgz7GL4gGB62f//FPSvex9qub6zt7K54xAWMUf
         NfQA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eZScp0Ds;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c6-20020a05620a268600b0076da7802c1csi1817167qkp.59.2023.11.08.10.00.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 08 Nov 2023 10:00:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eZScp0Ds;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1r0mq5-0003P3-FE; Wed, 08 Nov 2023 12:59:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r0mpq-0003Ec-HH
 for qemu-devel@nongnu.org; Wed, 08 Nov 2023 12:59:29 -0500
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r0mpn-00055R-QW
 for qemu-devel@nongnu.org; Wed, 08 Nov 2023 12:59:26 -0500
Received: by mail-ej1-x62e.google.com with SMTP id
 a640c23a62f3a-9becde9ea7bso230454466b.0
 for <qemu-devel@nongnu.org>; Wed, 08 Nov 2023 09:59:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1699466360; x=1700071160; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zCIV6xhOEy9e0/ump87scJTxEKubosmfb6SjXkR8ygA=;
 b=eZScp0DsAYKLUHY38/aaergN2iNLsRYskutobN92uNvh5rO5vxUGxWatpaPya4gZ8z
 0+m3/NHf1FUTg0U1+S5LxmWTOS4ZHrqX/vgBELEGFv4jKWW+5eqH9RGJBw8bdvSOrVmR
 rGRBJe0tKziiMYqXjM5bYeUrW72oKWY51A0ZjGWvwHAuE07JGDA7/GDJEB0MMoo/zTel
 ZaXR3+ebJwfcqJb2AmsiXsX8IGkrBR6m8cK8x9tqt/OOxO81NVmOJ3FTk5PDZTr+Adrw
 JN23mdxsTtMdb9Iyms+8lKr5B3WnY+7+9FOrpQHyYFXvg6zt8s2xJNWlp9iarTlOTiia
 J6YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699466360; x=1700071160;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zCIV6xhOEy9e0/ump87scJTxEKubosmfb6SjXkR8ygA=;
 b=bAF4JtPdMTglSQNsjgvUFXrIZPlAdqr1pG5bgygPJynEhqOBvnIQEiTAWEf/K7hdGs
 kM+smEGx1CtZZhjvYmP0g6LY984D5j0bELQOgC7MxJwchsEx4y3fKsUOIEGurxoKkoY3
 us4N/tw3pYSNsT1n2VHATOI+SHMBISdJYf5vrPx4stvrd53++TNYUd9Ct06MbyHaVrh8
 tmBQMgxD/WIitlUgfRYoJjKwqPVbK/esIPGzw8YiOi++LgyBQ3JO0E/py37SGl5TduIx
 r6/5DEd2EJTKx3DSE7KHj50+kPwDlSTA9NA2Gmb4mgAyFk+LN6BuqO8CW5Ir6PItffsr
 RPVA==
X-Gm-Message-State: AOJu0Yz9q7teDMu+Nnt2MS4yVhNbRBUs8U+C0Q5e7ueEDQ0K2v6C07m5
 nHTw1btqvW1fxg4H5/DTXrFKQI0CPSVjgvxSBxc=
X-Received: by 2002:a17:907:7246:b0:9a9:f0e6:904e with SMTP id
 ds6-20020a170907724600b009a9f0e6904emr2745557ejc.16.1699466360431; 
 Wed, 08 Nov 2023 09:59:20 -0800 (PST)
Received: from [192.168.69.115] ([176.187.199.60])
 by smtp.gmail.com with ESMTPSA id
 lv19-20020a170906bc9300b009a9fbeb15f5sm1372376ejb.46.2023.11.08.09.59.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 08 Nov 2023 09:59:19 -0800 (PST)
Message-ID: <9ba58d8f-0554-439e-b93d-b6e06fafe3d0@linaro.org>
Date: Wed, 8 Nov 2023 18:59:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 11/35 2/2] tcg/arm: Support TCG_COND_TST{EQ,NE}
Content-Language: en-US
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
References: <20231028194522.245170-12-richard.henderson@linaro.org>
 <20231108145244.72421-2-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231108145244.72421-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: j6BiAYMHI2fC

On 8/11/23 15:52, Philippe Mathieu-Daudé wrote:
> From: Richard Henderson <richard.henderson@linaro.org>
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Message-Id: <20231028194522.245170-12-richard.henderson@linaro.org>
> [PMD: Split from bigger patch, part 2/2]
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   tcg/arm/tcg-target.c.inc | 29 ++++++++++++++++++++++++++++-
>   1 file changed, 28 insertions(+), 1 deletion(-)
> 
> diff --git a/tcg/arm/tcg-target.c.inc b/tcg/arm/tcg-target.c.inc
> index 66d71af8bf..0fc7273b16 100644
> --- a/tcg/arm/tcg-target.c.inc
> +++ b/tcg/arm/tcg-target.c.inc
> @@ -1194,7 +1194,27 @@ static void tcg_out_mb(TCGContext *s, TCGArg a0)
>   static TCGCond tcg_out_cmp(TCGContext *s, TCGCond cond, TCGReg a,
>                              TCGArg b, int b_const)
>   {
> -    tcg_out_dat_rIN(s, COND_AL, ARITH_CMP, ARITH_CMN, 0, a, b, b_const);
> +    if (!is_tst_cond(cond)) {
> +        tcg_out_dat_rIN(s, COND_AL, ARITH_CMP, ARITH_CMN, 0, a, b, b_const);
> +        return cond;
> +    }
> +
> +    cond = tcg_tst_eqne_cond(cond);
> +    if (b_const) {
> +        int imm12 = encode_imm(b);
> +
> +        /*
> +         * The compare constraints allow rIN, but TST does not support N.
> +         * Be prepared to load the constant into a scratch register.
> +         */
> +        if (imm12 >= 0) {
> +            tcg_out_dat_imm(s, COND_AL, ARITH_TST, 0, a, imm12);
> +            return cond;
> +        }
> +        tcg_out_movi32(s, COND_AL, TCG_REG_TMP, b);
> +        b = TCG_REG_TMP;
> +    }
> +    tcg_out_dat_reg(s, COND_AL, ARITH_TST, 0, a, b, SHIFT_IMM_LSL(0));
>       return cond;
>   }

To the best of my knowledge,

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

