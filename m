Received: by 2002:ac2:5485:0:0:0:0:0 with SMTP id t5csp2658065lfk;
        Tue, 6 Jul 2021 18:21:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx4nCsyeKBhX8SFgV7Zf2m7kUvi890t8GLLC9U1qXgKuhxckkfQWWP8pPViMMfKISBxUC1j
X-Received: by 2002:a9f:315c:: with SMTP id n28mr8527193uab.68.1625620903328;
        Tue, 06 Jul 2021 18:21:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625620903; cv=none;
        d=google.com; s=arc-20160816;
        b=dc19zEnf0qPlL6I57VBFwsthsywmM+XiXeMSqHm6R/NXIjgyTBEUbkR7fTQPDX3EUG
         slylPCAhb3+cMn4K4oIo/z1plIZD+35MMrlajoGzTrCLb1nR+Jpa2d4B8ihmG71+GRGm
         fjM7whaO0FnM4bZiSXpgey0VjbyA2a6dD4Swn9RHeDg4sLGeVtTVNvOypb9UtuaEN1Y8
         9Fq/HjoYgCFg6z6IYfyTfZeLURaVF8TNIFgbCFllPScp7cDGXrAC4Ho3ZqXsakMtZxXd
         nk4H+mByDFN5Y0kCiCfpt+6WT+QyFtivAGctBi8Q4CYM7t/CVOnoK+ujn+fKEk8XU7P/
         B9LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=p4YUaGyKEovYejYPOWkDLL8hDwZcVolhUOJwnZV+Jlc=;
        b=Qh19sCsZy0Y0ZTIMCQJ2GQzsQ6y+k3YlgoDbB3hS3RosMcHaEuGG0nJHIhbfSbQz/2
         ZZ8C+Yn2oiBCD+1Ru8xFwOnbzpB/AnSS7a9uaIViLihvw3ceTUV4pCdywl+45ZZn0fMM
         ZEddo2h60FTOpKwZYkZuUgHtfuXePfeRhJ6acPFpN2+Du0gd8OzZNSGOuRC9F3dAz3g4
         QXwzPyf8xgRVHvbm1IyJYWh1D3eY56foNv8gJpyCZE4W076HWHhb4KxU/WHCEFxEMGos
         FWzV1e+hu1KXSvsjtHXfB6fY4AP+AJqIkvNexX4UPPT8Kd7JctpKjDNLvoaL+FJD3ltc
         lfEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zfPFK13G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p16si4156845vsf.270.2021.07.06.18.21.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Jul 2021 18:21:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zfPFK13G;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m0wFy-0000X4-CQ
	for alex.bennee@linaro.org; Tue, 06 Jul 2021 21:21:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0wFn-0000WC-1H
 for qemu-arm@nongnu.org; Tue, 06 Jul 2021 21:21:31 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:40877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m0wFl-00051N-Mo
 for qemu-arm@nongnu.org; Tue, 06 Jul 2021 21:21:30 -0400
Received: by mail-pg1-x52a.google.com with SMTP id g22so558373pgl.7
 for <qemu-arm@nongnu.org>; Tue, 06 Jul 2021 18:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=p4YUaGyKEovYejYPOWkDLL8hDwZcVolhUOJwnZV+Jlc=;
 b=zfPFK13G3URAMlpq/CPsGV8ETqsh7kh7QBYgiq0fjul5o2KM39fR4FBfaiwhyTa59H
 oZzXKJ+9o0sz5CgHKUJec5g2b5kBhmijgQgC/p1EoWDyYseDKR6kpM0Uc+YjOL4XfOIm
 +oBCqzw9c07Lc90zHYnvQqS5ZSBwmJDVnXa0x/B+TVY/nQ6Q2eXrhxi3yDnSiHHkyese
 Vwvo8i1RpYTsAVc52jar2DmFDmB3fen2iockKz4gaSpp20GncwkXOse1nDY/um0xNLi/
 zlgXThyXsYivjczIlfV5B0yBqxCx3ASqWmpVfzyBCByGqfbw1aIGPFMv6mJzGPhI0Q3o
 NKMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=p4YUaGyKEovYejYPOWkDLL8hDwZcVolhUOJwnZV+Jlc=;
 b=hFU2ZQMO/7NAPmlfmgVKEW2aEOVSLX96tKMqfdghXuT1BhIaMwLBhxGqWWNGMc4vcf
 wLy2NN7NIbHmNP5dAPbWdCVuq3xD/fI5HvJbFCVEoW4G52mN0u10LUL+pWWoKsr5Cio9
 xYPKqsJX+HVnoticRFU3h+/TTmXeakN5EmtRRtpd1aKVUjBoBUNRXOqMbeM8++iDXiAD
 dGLxsjmalVzHroYIDt+BAwLFPbBhirPMpqmPDh2vtDJ3OIXfOcFgzoK2tjY6eRyyv1b5
 wO7jL6eNwVPl66ve7bmoA+JeJuxSAT9MJnPOL8T5QlCYXtCn/ZQ+JzhSho8AViunPPe9
 sl9A==
X-Gm-Message-State: AOAM530xCC2FqfVH0kwYPqDTv/R2xjkDB7ccES8APZogCcxa7SmZLYtS
 jdBRgKBHbrvBXkIymanoVH21szCulr0Ijg==
X-Received: by 2002:a62:6444:0:b029:321:2f4f:b03 with SMTP id
 y65-20020a6264440000b02903212f4f0b03mr10466202pfb.60.1625620887994; 
 Tue, 06 Jul 2021 18:21:27 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id g12sm4334173pjk.25.2021.07.06.18.21.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Jul 2021 18:21:27 -0700 (PDT)
Subject: Re: [PATCH 03/11] hw/gpio/pl061: Clean up read/write offset handling
 logic
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210702104018.19881-1-peter.maydell@linaro.org>
 <20210702104018.19881-4-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <dd71af0c-ef7e-4a4f-9e6b-aff09d05be34@linaro.org>
Date: Tue, 6 Jul 2021 18:21:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210702104018.19881-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Maxim Uvarov <maxim.uvarov@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 63jWKgAr0Hl7

On 7/2/21 3:40 AM, Peter Maydell wrote:
> +    case 0x52c ... 0xfcc: /* Reserved */
> +        goto bad_offset;

Any reason to not just use default for these?

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
