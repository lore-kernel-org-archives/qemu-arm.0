Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp509216dyc;
        Thu, 3 Jul 2025 05:45:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWiKppmup9CTQNb/6cUN9F2K8QHNyJJzuT5yxuLcZiavMHs73vpjbZC4YzwkJ8z3lao4uPeiPcLjH3hpQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEj4rsvkoJhzrFppeNGvo61v/DTSNV1bxAarojJFcssONnIQaihWQ9si6arnPjbvFILwSiH
X-Received: by 2002:ad4:5c4c:0:b0:6ff:a74b:c691 with SMTP id 6a1803df08f44-702b1a8d7e4mr103802976d6.17.1751546747484;
        Thu, 03 Jul 2025 05:45:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751546747; cv=none;
        d=google.com; s=arc-20240605;
        b=ke8FJUqDfl2bzTdnGUZMwesCyEudJZL48mP6ukVpNX21PWYhcwAWveiU+T45dKfmX7
         x7C+7qrrNkhXoyaXnmSCgorITVo3fMwZv/YSuEyBK4YeV389qvzg/C++FA0PwA1rTnEW
         n7CmrNBwoQmMy0bArOHGgcPCrgPuPbExxTwxr60XoUwrNVdquRv9zsW2FfB58vgaNUWG
         89gxH0AgPy7IX9XiE4sqF/Qx6YxzdU+KeRhCU8Z9Fqsqk4Qz+IuMu1APZhOI/mkUWxy8
         1QJPW3jd/NkYDaKXV8CboeeyD2ZntRd8UrKbBQuh9Psv7rApaTOpp5KKjR8l7t/jn/6Z
         ZAyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=ZnAvfqlFdC/Hotog3YjSC/GOMBzdYbRz/WSMurliVYI=;
        fh=WoPRPZmeZuG2qznYH4Px8+CBeOvkt46IAHz3jX4CQS4=;
        b=AjjS1dzRbGhvgbd2d+uPO7awvHzUYK04UeKw8Jz1kjYWhnCOUH/9TFv+0nVhVIRF/K
         ihQfrqkRqcbr0/fCgmCwz1qYa3gZHKTyt2hJWStKR7ZNjqFgrY5edJGsJQg6VPU2l81x
         BU4Obu2UVyUIf6a8CVg2RLwDu7X1AAgowEABP87QDb0pSmgLn6nEFPFfsYoNiIdVdNyO
         eza1BwStsDKdDb8QjxhFAyeu1vmRTduutpxwdsexLn35nfPAKyy/+17INEf5PwrzD/cm
         4s3pUHjL1gDjx5YFdI2AmmJqx+Ma06Fwm1ftnBb/I0l9ACxzpta+1qAoD4/QWcOx6lhJ
         z7aw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ht2gHAHH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd7736983bsi179534576d6.278.2025.07.03.05.45.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Jul 2025 05:45:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ht2gHAHH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uXJIM-0000py-36; Thu, 03 Jul 2025 08:44:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXJGw-0006hi-BO
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 08:42:46 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uXJGt-0003Zc-Ot
 for qemu-arm@nongnu.org; Thu, 03 Jul 2025 08:42:38 -0400
Received: by mail-yb1-xb30.google.com with SMTP id
 3f1490d57ef6-e898de36cfbso1076228276.1
 for <qemu-arm@nongnu.org>; Thu, 03 Jul 2025 05:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751546553; x=1752151353; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZnAvfqlFdC/Hotog3YjSC/GOMBzdYbRz/WSMurliVYI=;
 b=ht2gHAHHaz/ELy2Y0oxAvQf6B6rdYL4Tt7sGFvwWyKJPju23uu9B5Iiv8Ol4lvHWJh
 0SAfC5OawLBhVqokbbWpOfTTKhppz2k1erE1vn0rkCQAPE7qmLHVj+gDusHQYybDpKND
 h2SfamWGd50H6L+uQpcRn4cB0S6yWFiMsxkRnnAdiFEk8Hl/l1ZtvmTwvRCRIFP2eXyZ
 0l1dzq8WUa/+XXrYoFl8ZKiXHAYQvYDpgoWF7lHZLaMvkQJUVVLrmAW3ORl8Fi0XToiz
 Go8kj+AAqdxoVmBkCpB6VnwTgjACDGcm/XwgH1QXYAZInxHnoBHM/NlIqcx4ZTOJ6jxU
 PUIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751546553; x=1752151353;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZnAvfqlFdC/Hotog3YjSC/GOMBzdYbRz/WSMurliVYI=;
 b=NpaS6jaSetEHCOPm6pnZObV45RVTiU1ttlGf+eg4Z+bnATZzPCZyJLIqYjhlvK0iTf
 DmVsxNi8zmvjpYYFm3+49JLqasyHyWdLcGbMjxuhtbSz2/0mUI52bCGX6pjVj1G9W2tS
 gWNvaXOMSFbTqJEtzOZwF5oseEBWCzaOzLQ1ycgX6sQEYsuPxkEvc2K/ZNgPo+2OB2Ux
 3z+GVREwklJp/3uDMVulm2KJB0zPAViTwkjsGAjZ1LRV76UbudDc2qfHgWFdft9nAOeO
 TJ3pqHBSQ06vFjlwSO2JngTocAiT4t2b2PKBsbiPHxbTADYRKOkUG53a4y3qdaQIrGP/
 ubvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUSw2cWlwpi42lHVKRFhbaS37eaXf9ZhUngtW+F4Wej92q4IW5LD0PRZfekZF5T0liBI42vAGJb0A==@nongnu.org
X-Gm-Message-State: AOJu0Yy2wWCbRlTC6FOCHAY0IXFCtKlZSHI5ehXNOpQvl1OFZMaV/jAu
 uc7SRN5OICf1igu9TtU2kqQ4N8SuNqNore/CxzDqpcybGvK0p2N9grzI1NGp0d/wF/uEXS1np4Z
 Wot88jG7bTUZrORfUVR9UIpFL3LbkrUjwOx8s5POEtA==
X-Gm-Gg: ASbGncs6MGF17Opy/ZRt77QCyGG/SSla7J98NThGOibVqAJIm6UNZ0kss42PLC3n6SL
 q3FNfK1HWN+tHe1avVYX0c4jqZHLCIXH8fjTe/uO8GLteVWkv9wZW/NuinxDBCBnOipP2tbhTbw
 KFv8HhAyDKoIZ/GJDM2F2f8qGYUVDHuot9CZoTtMDALr+XksCPWCDBSr8=
X-Received: by 2002:a05:690c:6608:b0:70e:7663:8bb4 with SMTP id
 00721157ae682-7164d467d9bmr87649087b3.25.1751546553274; Thu, 03 Jul 2025
 05:42:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250702123410.761208-1-richard.henderson@linaro.org>
 <20250702123410.761208-90-richard.henderson@linaro.org>
In-Reply-To: <20250702123410.761208-90-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Jul 2025 13:42:20 +0100
X-Gm-Features: Ac12FXyKa-H0v56oPo_H9mi3YqAWh39rBr-vIxDbeNTlrFsFUf0Mck0yQppJk2I
Message-ID: <CAFEAcA_1+R93TR350TmieVZbYErQ+g34RyPWjd-8rRatJm-Sug@mail.gmail.com>
Subject: Re: [PATCH v3 89/97] target/arm: Implement LUTI2,
 LUTI4 for SME2/SME2p1
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb30.google.com
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
X-TUID: 8I5xJUvLNXUZ

On Wed, 2 Jul 2025 at 13:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---


> diff --git a/target/arm/tcg/vec_internal.h b/target/arm/tcg/vec_internal.h
> index 236927c640..ad3bfabc34 100644
> --- a/target/arm/tcg/vec_internal.h
> +++ b/target/arm/tcg/vec_internal.h
> @@ -337,6 +337,22 @@ bfloat16 helper_sme2_ah_fmin_b16(bfloat16 a, bfloat16 b, float_status *fpst);
>  float32 sve_f16_to_f32(float16 f, float_status *fpst);
>  float16 sve_f32_to_f16(float32 f, float_status *fpst);
>
> +/* Extract @len bits from an array of uint64_t at offset @pos bits. */
> +static inline uint64_t extractn(uint64_t *p, unsigned pos, unsigned len)
> +{
> +    uint64_t x;
> +
> +    p += pos / 64;
> +    pos = pos % 64;
> +
> +    x = p[0];
> +    if (pos + len > 64) {
> +        x = (x >> pos) | (p[1] << (-pos & 63));
> +        pos = 0;
> +    }
> +    return extract64(x, pos, len);
> +}

We added this in patch 79, I think, so we could put it in
vec_internal.h from the start (with the comment).

Otherwise

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
