Received: by 2002:a17:906:5ac8:b0:98d:b2f5:1316 with SMTP id x8csp3263343ejs;
        Sun, 20 Aug 2023 20:01:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGHwGBwMqQJC9aX19aZOOE8mljX8icImlOTAR+RwllpcQSoYbiq48+RFYlncuVPiHAb1voY
X-Received: by 2002:ac8:4e4f:0:b0:40f:ef6d:1a31 with SMTP id e15-20020ac84e4f000000b0040fef6d1a31mr8184676qtw.13.1692586870173;
        Sun, 20 Aug 2023 20:01:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692586870; cv=none;
        d=google.com; s=arc-20160816;
        b=VybvKhkZcUtCMLNgb6RdC0UFtUXQAtYwQhRY8oKVrK/fgvIdx4t3EDrsXEdfw+98Sc
         uLCt4UzwJi67+Q40GZoxYKItdkhmL+BbCcX6/dhATrPx50xUZolz1H89ZPkt3xZM3k8W
         DsuDoQmGZsfBZQAt545DDH8cC2pQZgU9eYzWY75CzuYa2hvOTbbQUnqMsyZCB0pUJCju
         c0wVtCL/pKZkvuXO2LQ5waL3kEEl6iY9wK9UNupolmnfNQR2hMRdLh1W/vVRFlWdbaFs
         /+ih92k0kVQA+R692Mggc1o/ujMa8oSTAW0tZAjQmgcYjfP63auB9F8phNB3x4yE56Pq
         H9Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:content-language:references:cc:to:from:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=MLFy2VcEiZyGdJbuMZZJPz5ki9C5rUQIPSKIggV4tKc=;
        fh=j4Z1An09Ve/stdydd/yoEYU5jCtTlZP/o+LZJGsiADc=;
        b=P0JeQACz+J9wWTv3HHNzXxy14Owm+6W1Gb82NeRqoT51pTc4SCRz9kxPL7lSFNpSZr
         DpsPgRjLHjND3rtDUnVCfG6NMH0lwmCdQUZM7WwVXglYf4yNiC0NVFXEQi1jEywAPLgP
         YbPS0ojHmuvQ8r7UbuL4+Jjo06ufR36ZN3AnTCakuK4iObJVqaDsT/csSYF93/fI4JOd
         rmZGlDbkY//OE+jnE9+N5E3OT4/vTfMpKkBBNSuhYdueHscAN4lmrpOmZ/rs/ZrWYqXz
         jj8ZYATFR9gf5uxtYHizbk12QqGXyF8iXU49fdZZ5eV/kLcCnP4MzBDlhxxnMKA7yUHF
         U8DA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VnahQ0dt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o10-20020a05622a044a00b004103e05ad34si4296104qtx.239.2023.08.20.20.01.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 20 Aug 2023 20:01:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VnahQ0dt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qXv9y-0008DN-Lj; Sun, 20 Aug 2023 23:00:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qXv9o-00082l-9v
 for qemu-arm@nongnu.org; Sun, 20 Aug 2023 23:00:49 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qXv9l-0001Tn-Er
 for qemu-arm@nongnu.org; Sun, 20 Aug 2023 23:00:43 -0400
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1bdcb800594so15572365ad.1
 for <qemu-arm@nongnu.org>; Sun, 20 Aug 2023 20:00:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692586840; x=1693191640;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=MLFy2VcEiZyGdJbuMZZJPz5ki9C5rUQIPSKIggV4tKc=;
 b=VnahQ0dtzdPt5OU3+M9TxWbblEquE6Wqh2jQo5FyIpM2CHDcB0ombkmiJXF5yRirOE
 AoZFRuwL+htzKRVkpbzAE/pXS3057Ra2eNNv2I3/rzT1JF0cclq1SNwS3Nj2d/jYKIh9
 TaiXdWp9tZAGIy6q7IhP/9dVshO8RgNqlVeAek133dVX5qYKZWCCaZ3SD6Z8TE81wYdf
 9pr1sDFh4F7EXdy4u0C9biyY+hat25Nae6BOrDYmfwaqDWrbMZQ8FE2zc+mPTsdG/gf3
 WNdSXITY7/WxLsy3GlnyJx2+6ixSom9JsGVS3jrHnTyyDwdjTCD0mJ0ozHmcgLszYOlV
 gefA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692586840; x=1693191640;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MLFy2VcEiZyGdJbuMZZJPz5ki9C5rUQIPSKIggV4tKc=;
 b=R/X7WbmeBkZJQv4twJvb88UPxRkqZex144aQL/cdoyZc5C+6dZU+VehKhQ3t9C+2M0
 faNWG8/qvoTQeHDSaS5Pws7oHnBs3XodvLGiViM2vJIar9i40+5/xz/souWPI+oOtc8r
 hPVU0dr1eL/+XIfAd5Pi9QH3sr6fla//gUYUH9Kw++xELAc9J5/RdLFFAQFLcyAXPWzO
 nh4ux5+qSYdHPC/xMpq4ewMhdo0moDqbptCWVJ+sC+0/ILGgiTRRPUIMLGTNcY5wlLy3
 vxT2gtmeJ5eE60lSVlDXu0BCuGRvRnXnfyucB2zq7ZetiwQzX9G4EoaA0Wg3sdt2qXKV
 1RJA==
X-Gm-Message-State: AOJu0YyczNORmaeR1PL/t9H07Z3HmpUurY15GCSp+Ndq2AGzA10qfwT0
 4jHmmEWu1Iey/JWvLrtC9FNpRiVnUfjSiEYfDGQ=
X-Received: by 2002:a17:902:f7d5:b0:1bc:2c79:c6a4 with SMTP id
 h21-20020a170902f7d500b001bc2c79c6a4mr2835340plw.56.1692586840009; 
 Sun, 20 Aug 2023 20:00:40 -0700 (PDT)
Received: from ?IPV6:2602:47:d483:7301:7da6:8db:fd7a:4d62?
 ([2602:47:d483:7301:7da6:8db:fd7a:4d62])
 by smtp.gmail.com with ESMTPSA id
 b3-20020a170902d50300b001bdc3768ca5sm5784722plg.254.2023.08.20.20.00.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Aug 2023 20:00:39 -0700 (PDT)
Message-ID: <d2115005-fe67-b934-c2dc-7f2b5f82fd2a@linaro.org>
Date: Sun, 20 Aug 2023 20:00:37 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] target/arm: Fix 64-bit SSRA
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-stable@nongnu.org
References: <20230821022025.397682-1-richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20230821022025.397682-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -63
X-Spam_score: -6.4
X-Spam_bar: ------
X-Spam_report: (-6.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.279,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: y0PMELd1EHgd

On 8/20/23 19:20, Richard Henderson wrote:
> Typo applied byte-wise shift instead of double-word shift.
> 
> Cc: qemu-stable@nongnu.org
> Fixes: 631e565450c ("target/arm: Create gen_gvec_[us]sra")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1779

Bah.  #1737

> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/translate.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
> index b71ac2d0d5..39541ecdf0 100644
> --- a/target/arm/tcg/translate.c
> +++ b/target/arm/tcg/translate.c
> @@ -3053,7 +3053,7 @@ void gen_gvec_ssra(unsigned vece, uint32_t rd_ofs, uint32_t rm_ofs,
>             .vece = MO_32 },
>           { .fni8 = gen_ssra64_i64,
>             .fniv = gen_ssra_vec,
> -          .fno = gen_helper_gvec_ssra_b,
> +          .fno = gen_helper_gvec_ssra_d,
>             .prefer_i64 = TCG_TARGET_REG_BITS == 64,
>             .opt_opc = vecop_list,
>             .load_dest = true,

