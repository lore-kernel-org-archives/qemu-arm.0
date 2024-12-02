Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2990727njk;
        Mon, 2 Dec 2024 08:29:42 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXH3CLZFNbbmTYg762Q4r/iSCLtOc0SKGED72U7bcCzctOyzOMVpvq5QsA6IUXdqHgxjSwqoPF5WRH5wA==@linaro.org
X-Google-Smtp-Source: AGHT+IHmOZkSBBcSwXsrGgKdtt9ERcFFox3MNnQPfeviEilOJ1k7uU8xt8EmUH7atVAlVfNbAsd2
X-Received: by 2002:a05:6214:485:b0:6d4:22fc:62f7 with SMTP id 6a1803df08f44-6d864d1abb5mr320441196d6.15.1733156982143;
        Mon, 02 Dec 2024 08:29:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733156982; cv=none;
        d=google.com; s=arc-20240605;
        b=lZp9uZKT/J1eAvZyOCVcyRVZqVDtn3e8qv889XzQ77ldcpfsm6BkfZ1dFXWBQ1nYu6
         sR1Yabrv5w2FQeCl4XvcX5mtuEx07E580Lte6O5f/nN8dUsYbaSAP+uVqiMgoEJ9TzO1
         FXlFS4Mp7ah6/FCz63v4jOgM2qJzBGhJDzUM12jS/XpF1qKPWb2mZQRo+Vm8UtcbF/ji
         YyEcm+YwXhVSv5s6SHbH5oAuoWl+LvkRvX2N/jFbyFtDcNtVBskAup3egdhG/U22ZDvZ
         gAZAkcfmOezBMwqw3RhjYOfiClJnve3vyK31vZwweTpEIUL0lTBVNzsgGDirctSk5hya
         DmWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=dlQbNx+JffZzs6bek1V/fItnLxBAEe17t7iBaX8dCZA=;
        fh=UMlouvVl3Ph4Ne7UvGTvosqVcNxKyKMHDiGsZppDwks=;
        b=YSfxqkjgL8Oun8WoKnrI50Bqn2lIG0myDvYn0ATlSTVWyq6UcRS6BoXdqvU35mIspy
         3qNooZ2IonhXtTo7AwbPpQQqBloYPbIpiF4aTeb0gUocvH+dNVKLcoHoKSRLD2yXB/PP
         X735FvBA5VKbw5eAR6ON4tiAYW0WT/ozmMzF091Jhv3tyOdl1v9da8gnjKm/9M+cIyWS
         mRiooSzH+5AQ+4Fyu1qC4dw7UGWFS1n52cL5gO83X0MkFj5YYK24LQNglXIakqAH+9/E
         ij5eRv73/FU+Z2x82XJMeSoYEsJ6byLhedlX/bgwZ3DveABG4CJFfwssGpas/VxEy87D
         cV8w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MHiND2FN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d875457c8esi114887536d6.296.2024.12.02.08.29.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Dec 2024 08:29:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=MHiND2FN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tI9IZ-000556-L5; Mon, 02 Dec 2024 11:29:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tI9IY-00054c-3Z
 for qemu-arm@nongnu.org; Mon, 02 Dec 2024 11:29:22 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tI9IW-0000RL-BG
 for qemu-arm@nongnu.org; Mon, 02 Dec 2024 11:29:21 -0500
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-385e1fcb0e1so1342901f8f.2
 for <qemu-arm@nongnu.org>; Mon, 02 Dec 2024 08:29:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733156958; x=1733761758; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=dlQbNx+JffZzs6bek1V/fItnLxBAEe17t7iBaX8dCZA=;
 b=MHiND2FNCbt2vFecGRxhOUcBwazSK2Z5zTfe9Bws08ja5l1+cCf0IQsFQ5J1pZGlfo
 OmF1dBNIw9qquNvFvQ9CVOjTdA99uN7xUbs7hLEkpR2OYbq8Ism24aPNu1iTFYdfORXf
 Rt4PxB0DR/+jQ+oheCJ8dNTQel+TykFKOsQ9acEEHjjXBZFUGR0XRM3wrTLyqUHG8vFS
 LvhUOQ3JvUxf32wJgCEj4wrtHtOssxAw9Xlvcg22btk9wIwQNHHi4qeKeFvbaeScWIFH
 W88eajXCw+mjt9kzAWrX+i1Wym68/igVjT7n/tC1vdoBOqUfBJOYn1BhCLtMK7Mrc+AW
 RZTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733156958; x=1733761758;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dlQbNx+JffZzs6bek1V/fItnLxBAEe17t7iBaX8dCZA=;
 b=RO06ejtJboKhkAlQEwEKpMGN75u2DvYxjboak6DR90Ofocl/MDT8NAavl3MdElOQls
 k60l02RwUMvZ7e4/5+qzx5Q9VED0irOIfrQts5y4RzKqDqpC88ydEv6xeV3jadcoqciI
 ufSdXo2uWupov//SpkjpzyQ0wMgQI7nbfW8ZPggcxYrvMyYM0pPa8fI3nuorg4cuukNY
 c8U3raNMU5Hp35TBUaY4haLzVHWkva/TvXMBcu/Upy/IKhliKNpTI+hYcTuvhDp9WsTF
 /WxCjvxbuLln79cxNYV5igpwp9MgbH5AGKEbfX8/xnHIRYJgBpTYOyGN6btOAqr0fL3o
 FP/Q==
X-Gm-Message-State: AOJu0Ywxj5z1QcwwhecF3xhyu6cfoEdZbGa/d1jkfPGkjDVzOn3+lGLx
 d0nhlt5Ch5ciQSgpSdQIuyPl6IHNpT4k44RRijRa4/rjrmXOdLXdDWgxaFidQyK9SQCxMZE8sru
 aoFk=
X-Gm-Gg: ASbGnctEPutg60ZSXDK5X71JZLSHU3JQks9PxCqznvGmYIPgODYcoYOQPiPXQRnQhxD
 3rNREAxFdaIOWN/ydWasqzOuzKTT/0VAA7P4xqqUtHIdZhx08R8mZka2Wu8GpZeYi37fNh7XuYn
 BPOK9Gk6ghVFx3v+JmNt2fc3r7TFhqQXr1dctutL9o462lb7t2z2Woluow38k7Jr2LNJ3+xwd3z
 t0rwi0m8oDifF97p3tODRIaUrMXgXO1ezZAyvqEyZ+XbgZvIZiA2FYpYsu9h8eWUT44qqXSiFxh
 nYuJZRpHFTycPZzW6V4rbcgilzCTuw==
X-Received: by 2002:a05:6000:2ac:b0:385:dd10:215d with SMTP id
 ffacd0b85a97d-385dd1022fbmr14270312f8f.44.1733156958460; 
 Mon, 02 Dec 2024 08:29:18 -0800 (PST)
Received: from [192.168.68.213] (72.red-95-127-54.dynamicip.rima-tde.net.
 [95.127.54.72]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385ccd36557sm12860168f8f.24.2024.12.02.08.29.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Dec 2024 08:29:17 -0800 (PST)
Message-ID: <c0aa6a8b-59f4-4d3a-83c5-aff885a2eaf8@linaro.org>
Date: Mon, 2 Dec 2024 17:29:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 36/67] target/arm: Introduce gen_gvec_cls, gen_gvec_clz
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20241201150607.12812-1-richard.henderson@linaro.org>
 <20241201150607.12812-37-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241201150607.12812-37-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: EZDmkP025Kr9

On 1/12/24 16:05, Richard Henderson wrote:
> Add gvec interfaces for CLS and CLZ operations.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/translate.h      |  5 +++++
>   target/arm/tcg/gengvec.c        | 35 +++++++++++++++++++++++++++++++++
>   target/arm/tcg/translate-a64.c  | 29 +++++++--------------------
>   target/arm/tcg/translate-neon.c | 29 ++-------------------------
>   4 files changed, 49 insertions(+), 49 deletions(-)


> +void gen_gvec_cls(unsigned vece, uint32_t rd_ofs, uint32_t rn_ofs,
> +                  uint32_t opr_sz, uint32_t max_sz)
> +{
> +    static const GVecGen2 g[] = {
> +        { .fni4 = gen_helper_neon_cls_s8,
> +          .vece = MO_8 },
> +        { .fni4 = gen_helper_neon_cls_s16,
> +          .vece = MO_16 },
> +        { .fni4 = tcg_gen_clrsb_i32,

Why do we have tcg_gen_clrsb_i32(), ...

> +          .vece = MO_32 },
> +    };
> +    assert(vece <= MO_32);
> +    tcg_gen_gvec_2(rd_ofs, rn_ofs, opr_sz, max_sz, &g[vece]);
> +}
> +
> +static void gen_clz32_i32(TCGv_i32 d, TCGv_i32 n)

... but not tcg_gen_clz32_i32()?

> +{
> +    tcg_gen_clzi_i32(d, n, 32);
> +}

Anyhow,

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

