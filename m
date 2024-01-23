Received: by 2002:a17:906:568b:b0:a2e:1324:ea5c with SMTP id am11csp421976ejc;
        Tue, 23 Jan 2024 08:18:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGWoVRH43Ph0Oyv2D+qCeGUDvdznlNhOdL7DQFZww1Z7QQQk/k9lrXByBFMKPMKi/QjPBTc
X-Received: by 2002:a05:620a:2005:b0:783:8701:5181 with SMTP id c5-20020a05620a200500b0078387015181mr7373473qka.95.1706026727816;
        Tue, 23 Jan 2024 08:18:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706026727; cv=none;
        d=google.com; s=arc-20160816;
        b=H/KFsI8tFoYurWZc2Y+Lma1QvsIi2A4FUwdjJc+Jil3v9GxPNaRCj8YYopHDiEGh9v
         z1l0n4dl18iMH2Txq/CsjVBuy9TuOwAGoWhQqhjdU0lE4eA24oIJY1wvAHj5+jzFU9Q2
         RktEYr8IXmRHUWvvTR+qV4hxyVpvEu6JafawjJykMaXg047JsuxqtWsnXYumIz3VJy4e
         FrPO7m1Af754A3DTmTZdtS48HHvFTuizruLGsb7CDi2gRZTyIr9plFONAYdcn8KsKMIs
         cvg9RNyDf2rJIgc3UeaJkHLRhTubxJlvJFkAlrxqh2jizs3Z32vLs/a4DyVQXhS9Tb28
         91OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=zPfNttPXTR9h5tB3nJI+pxcAw/vTz53KQbJKMTMP5ys=;
        fh=PRoHjD/djUAHQXeMIrzpgUv27otx4sratw48fpw7M0k=;
        b=yOLgKdM08vEDLuqMYg0NEcnZwfKKb2d6LytK+iJfprBTvGvfaLJPly+jaSIYYyRr4y
         GmjcvrDB8OEJnhJ3v1VcZONU5Le8tdZDqy3PeP5VOGMplo+VjjyW+Ickardc7uTEvILb
         zJkjNbsGpjDLg+28SOLLItqa1A2Q1oI2peDAXlcqM6MH3BcZmgbv+ApG5mKX641yB3j2
         l3XrVRxNwqJ0UB5GECup2J03kJ42zb/IExDPZYbsD35kbfAXwgejC29gfO/00RlBLI3/
         YqS/NyK8K1uAW3d7vZm31bRHTBW9gnSZQB/7UOtTH61Opyau07gDZIRLHO4SA2mpcZf3
         TrDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zFm3Gv1m;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y4-20020a05620a09c400b00783ae0a39aesi960041qky.319.2024.01.23.08.18.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jan 2024 08:18:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zFm3Gv1m;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rSJTM-0003oP-Ms; Tue, 23 Jan 2024 11:18:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rSJTL-0003mU-PI
 for qemu-devel@nongnu.org; Tue, 23 Jan 2024 11:17:59 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1rSJTJ-0007eL-0r
 for qemu-devel@nongnu.org; Tue, 23 Jan 2024 11:17:59 -0500
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-6dd7debc476so457642b3a.3
 for <qemu-devel@nongnu.org>; Tue, 23 Jan 2024 08:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706026675; x=1706631475; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zPfNttPXTR9h5tB3nJI+pxcAw/vTz53KQbJKMTMP5ys=;
 b=zFm3Gv1mj6WNUx9NCLb3SaRTSujup3cVnjVW+UCUqXanqVFJajrJEC7W2xMwLMLiNf
 lEjWw9757cn5wJGk2EFE+uQRItrUe+GKQZ3wWss3L6lIjF2QIG3k/ghWT5lbAr46tzGy
 W9+JPlYPhs5OtlOpT2Rg+xwh5324MUmk3QbhPGFNkBEoOGcwfMpS2koJp2IFjRM+gimC
 seHw4+Rthv1+UZHcZ6Dd16NCTHqOxJ5eXuwsGhi8etuTLN8iz6e52eQVMXIVMylOuGKO
 Q99bC1ANKlhqCFHhJ4cuDN1bodf5fQ/JQHBUxvTQ8UaueYUzwwl85m4YAbQIfm8fIzeK
 BP4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706026675; x=1706631475;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zPfNttPXTR9h5tB3nJI+pxcAw/vTz53KQbJKMTMP5ys=;
 b=GslJz+iYco3iY/UeNqXdKyhZpRqH+hP/inxsAVuv8qYUwxWAJ3lGgqIjEZxuTie25o
 9f6osrzLfL2fJyv+EzyXYr9Yr9prIR8taxcWljdx/PQ3fg8VdlX1OxmwBevHk232YC3J
 cx/IUK3rLOmGG1lKFBeuVHoCbrC7jaMqhtQzf1EsObBUkVICuQvf9LWUFjNhHgaU67j8
 AtRO8bWS82X4krzpBPk+H6wFKvGtESx4bvx6wzk9eGpXsOkzhALqzSmmSVsOw3bgMZEa
 cw9Qdetq6krNAjhXZdzXFdSLrdEHTKMPZW0oHGqsxB2SqGXhebsoW2ocFRs8me6XbkcC
 a3ZQ==
X-Gm-Message-State: AOJu0YxfYqQsYJQdIBq4Db1rZl9ZyUtY9/eGzQ3JXAt9ozf4DbMtLZCz
 HGtylml7R9cBAUgHU/W9GCk845V3oJpGPSxKACSKqTuQb4NCDvFVlC0C27Tg7Os=
X-Received: by 2002:a05:6a00:238d:b0:6db:6fc9:5e79 with SMTP id
 f13-20020a056a00238d00b006db6fc95e79mr4064280pfc.3.1706026675448; 
 Tue, 23 Jan 2024 08:17:55 -0800 (PST)
Received: from ?IPV6:2001:44b8:2176:c800:94f0:22fe:dda1:1842?
 (2001-44b8-2176-c800-94f0-22fe-dda1-1842.static.ipv6.internode.on.net.
 [2001:44b8:2176:c800:94f0:22fe:dda1:1842])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a056a00244500b006da19433468sm11799778pfj.61.2024.01.23.08.17.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Jan 2024 08:17:54 -0800 (PST)
Message-ID: <20117cb1-b167-425d-ae7c-a5e149264f70@linaro.org>
Date: Wed, 24 Jan 2024 02:17:49 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] target/arm: Fix A64 scalar SQSHRN and SQRSHRN
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org
References: <20240123153416.877308-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240123153416.877308-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42d.google.com
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
X-TUID: M2GGRto55HO/

On 1/24/24 01:34, Peter Maydell wrote:
> In commit 1b7bc9b5c8bf374dd we changed handle_vec_simd_sqshrn() so
> that instead of starting with a 0 value and depositing in each new
> element from the narrowing operation, it instead started with the raw
> result of the narrowing operation of the first element.
> 
> This is fine in the vector case, because the deposit operations for
> the second and subsequent elements will always overwrite any higher
> bits that might have been in the first element's result value in
> tcg_rd.  However in the scalar case we only go through this loop
> once.  The effect is that for a signed narrowing operation, if the
> result is negative then we will now return a value where the bits
> above the first element are incorrectly 1 (because the narrowfn
> returns a sign-extended result, not one that is truncated to the
> element size).
> 
> Fix this by using an extract operation to get exactly the correct
> bits of the output of the narrowfn for element 1, instead of a
> plain move.
> 
> Cc:qemu-stable@nongnu.org
> Fixes: 1b7bc9b5c8bf374dd3 ("target/arm: Avoid tcg_const_ptr in handle_vec_simd_sqshrn")
> Resolves:https://gitlab.com/qemu-project/qemu/-/issues/2089
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/tcg/translate-a64.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
