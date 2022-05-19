Received: by 2002:a19:ef07:0:0:0:0:0 with SMTP id n7csp1089579lfh;
        Thu, 19 May 2022 05:12:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwfBsvwi0eh47p6YaZBGke9NJjYfExymZrBXgH0+VsOxoY29h8iq3IQgzFBXnleZ7EIS32R
X-Received: by 2002:ac8:58d6:0:b0:2f3:d35c:4ef8 with SMTP id u22-20020ac858d6000000b002f3d35c4ef8mr3463887qta.265.1652962350822;
        Thu, 19 May 2022 05:12:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652962350; cv=none;
        d=google.com; s=arc-20160816;
        b=Ou0jUcM4q/iEIPC2diMsUDcodgeTksrGZhEvFNtvjhXwlfSv8RUpdxeDa+cqjfCpb8
         d2tA/uBA0L4rB3Kena3m/VlF3EeJ3UUwSJ+QA9HW2e+iFWuncUluNmAzyPbWdwmpV59b
         TZE/3JLOCp47aHNCAmOEY9ZgFgHOO0glYJxgvrdcrC8ucpZhMSMI97gvrHaLJH9mKC+H
         /PLAMKP5EHaPjBmN08HjCTFW42BKspVuJTbRo4hY9E2P0uwt8cc8soF8Oj9bAovY5vXg
         +MgnvYTUTLRnaLOhlvRVS5No1U9iI/BzyqJ8ySiNxSlu4c7eLzGQxdyPmYJtrV4P9E2T
         tGCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=3PJk44vaDOdYSg0hvqd7sdJBslmCvhiUXLUx6bbRwdI=;
        b=X64wAku7prnMXosKpsXDQvMyh/Yn3php0Tg26E2gl3hNnLz460ysURigmRPazBItmL
         1IHc0BS5t6pwu8ZYK38PL4UiwbwuFsykxIE+PY/BU9jtHAhEgtJK57jbCmyNqwlaqinn
         4W2QTqUY/Jh0rNdQsMI8zF6p2MbRqmUfo8V4PisZ2ZGiYPHSvMjIqOUBvfDa7zNmuxwf
         jr/i6livEaVH8iMwfPBxEVm05ZaWak4K1WPLXx6O2+0/7rmqHTlO1W6PEBDlrpRKtp/J
         ZxEBGx0/saXgkFnA7rQ0J/FG8LBMgFnyhVcuk0/0LBXyq0MdQ4xElIenXKamjM+I4UB2
         tWmA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qjpjAaW3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f9-20020ac87f09000000b002f3e12ca734si1006604qtk.138.2022.05.19.05.12.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 May 2022 05:12:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qjpjAaW3;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nrf14-0005WC-B0
	for alex.bennee@linaro.org; Thu, 19 May 2022 08:12:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nrf0G-0005QE-0R
 for qemu-arm@nongnu.org; Thu, 19 May 2022 08:11:49 -0400
Received: from mail-yb1-xb2c.google.com ([2607:f8b0:4864:20::b2c]:33480)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nrezf-0000tz-0w
 for qemu-arm@nongnu.org; Thu, 19 May 2022 08:11:33 -0400
Received: by mail-yb1-xb2c.google.com with SMTP id j2so8765462ybu.0
 for <qemu-arm@nongnu.org>; Thu, 19 May 2022 05:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3PJk44vaDOdYSg0hvqd7sdJBslmCvhiUXLUx6bbRwdI=;
 b=qjpjAaW3vk7tXF0d1inspYtblHzxwpR+nzTsm2MQdSUShp7L4qkVJNLjx7+nUkUuMY
 LWFz9awbgNxCpibIHULFU3fGY+Na8QLm+8q7W4d3p56AFm230PYFaCY+dILXRcdq9uQ7
 H8VOuTm6YMjpttDdQnimgn4onRbtL8wVBcU0+o0oIcBoc36TCepLjBQY49Ql3illJXAD
 ot13STi8kk1h47sikpxCDs/nBijNwp/y3FAUkFwuz/QJWf1FvRcsB749Nq8DC7EOZ7JI
 bJ4V2JXwODiJUn1M4aoYDnlqxGD+hyEcQf5KCSZP75vDAMtYZAOaX6PkwuCUn+JegnRy
 SI5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3PJk44vaDOdYSg0hvqd7sdJBslmCvhiUXLUx6bbRwdI=;
 b=Px/8LCB1ThOWGEUBJWuFFhsfZ2L/EVEViI8b6MkyyVmgYz31Gp0s3ySrubtM+HY+fB
 DCu/G4QbfETEpLchXdTP0l8KlcaPJ+RL2L9KWfp4HOlxXrTFDNkPFUH2SyqseEnE32Jb
 AE5iLYSWPGP1zteXmkzYMy7eVTPCDHwzn8wFUeBcIrN4hkjNVtr1R07mN9wRqfV9bGdZ
 29ksz+0wVP1MMQiwWL9AH8+ipbONspXO/7jTOL6BnXqKq58ZSSAS/O5Co6eZdJPm8JLP
 TD/1nQs1FDPoxCgG1dUtsS38GVmtu7d9hrTlDh/XhNYLT19GF8vh9MHrETaaNvDgDvIC
 BYNg==
X-Gm-Message-State: AOAM531M/lXovLXYTkbYvEvZDUa8Dk2NJ4R7n+M7JnnvxhF7xaheJIVU
 1bGmsOGmmz865Lla4Xlv+70vixBBWtAc5yBuAY0vyw==
X-Received: by 2002:a05:6902:102a:b0:64f:4132:9be with SMTP id
 x10-20020a056902102a00b0064f413209bemr1612232ybt.288.1652962252382; Thu, 19
 May 2022 05:10:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220517054850.177016-1-richard.henderson@linaro.org>
 <20220517054850.177016-6-richard.henderson@linaro.org>
In-Reply-To: <20220517054850.177016-6-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 May 2022 13:10:41 +0100
Message-ID: <CAFEAcA-9eTc7DFkCUD2ow=OrNEHD4W0CfxODMtPu=fhfzsOK3w@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] target/arm: Use uint32_t instead of bitmap for sve
 vq's
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Br3YT8a7nmYt

On Tue, 17 May 2022 at 06:59, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The bitmap need only hold 15 bits; bitmap is over-complicated.
> We can simplify operations quite a bit with plain logical ops.
>
> The introduction of SVE_VQ_POW2_MAP eliminates the need for
> looping in order to search for powers of two.  Simply perform
> the logical ops and use count leading or trailing zeros as
> required to find the result.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

>  static void cpu_max_get_sve_max_vq(Object *obj, Visitor *v, const char *name,
> @@ -576,7 +576,7 @@ static void cpu_arm_get_sve_vq(Object *obj, Visitor *v, const char *name,
>      if (!cpu_isar_feature(aa64_sve, cpu)) {
>          value = false;
>      } else {
> -        value = test_bit(vq - 1, cpu->sve_vq_map);
> +        value = (cpu->sve_vq_map >> (vq - 1)) & 1;

Use extract32() here, since you use deposit32() in the _set_ function?

> @@ -998,12 +994,11 @@ static void aarch64_a64fx_initfn(Object *obj)
>      cpu->gic_vpribits = 5;
>      cpu->gic_vprebits = 5;
>
> -    /* Suppport of A64FX's vector length are 128,256 and 512bit only */
> +    /* Suppport of A64FX's vector length are 128, 256 and 512bit only */

If we're going to tweak this comment text we might as well fix
all of the typo/grammar nits:

/* The A64FX supports only 128, 256 and 512 bit vector lengths */

>      aarch64_add_sve_properties(obj);
> -    bitmap_zero(cpu->sve_vq_supported, ARM_MAX_VQ);
> -    set_bit(0, cpu->sve_vq_supported); /* 128bit */
> -    set_bit(1, cpu->sve_vq_supported); /* 256bit */
> -    set_bit(3, cpu->sve_vq_supported); /* 512bit */
> +    cpu->sve_vq_supported = (1 << 0)  /* 128bit */
> +                          | (1 << 1)  /* 256bit */
> +                          | (1 << 3); /* 512bit */

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
