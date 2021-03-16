Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp4657359lfg;
        Tue, 16 Mar 2021 08:07:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwYBh3jHE7VOOs+fHXgABlfcm2OlRJsTlPKba/7ErE42/bZ33lnv5w89WcNmRA0ICj8KqBC
X-Received: by 2002:a2e:8706:: with SMTP id m6mr2933110lji.331.1615907270815;
        Tue, 16 Mar 2021 08:07:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1615907270; cv=none;
        d=google.com; s=arc-20160816;
        b=Q3jG7nhmDqJ7IAKdYXunW5saCPMdA9rVlaIKe/4DPF7HJvD6wdZwJu7dz/9hcpUkap
         8QMSKgg/Hk8hAmHhWsH/3xavwiOdrGPkuqImfNk3nz6COT06/scxvMFNANg2fejV8ASr
         syq0qZ/oYLPE1DHOogZsSPhvPRiaN2o4OtmbQKjwegxRDdNR7I+AXEV1nG8UTrJJw3LD
         tYUaB+VFi7qC3GsKUsw4nFk49GsE0Ifko0QxEyiJNcNiAMOmdXT6Wh2DzrH1Iy0JVx9j
         3XEwYarhkdT2S+U88LBWqj90NthstvK6s9rhfXnJFy7+Ryc6sqdxHmDyyY0F5tuPP0iF
         bu8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=mU2UTvC2h1JsJsvg+raT6xisMpRUMwtOBVGDb4u75UA=;
        b=zpTnRBcFeJ8gQ09+0OdEXokfFMopdx5V6GtRSaht3CZ8W3npf7R04ECXNRXAFOslYA
         TU8huv3BvSw9SB9tmlqKb3IccC6VdBZ360BL2CxpVY2eZ59rcBDgA9UG//9fvWEtl4kB
         cHYMm7z5sUjAdyBZAHcchaXnrDBCdM+dZSMhwwgLWsfCs9pX3+7iwxsFHEpvcG4QxkLK
         4ZEYDyvHL8hJhzFO+UOXapkSamJ9Vay1dvswjHnuYGKNRnj/qSYvBVq1Oeazw2dGx+c+
         yukm0qHvi16hT+t7+9RP1/toD9d8DYSyORh8uxFO5/5zLvh+AU9VG/eiqxIkGLa4Qib7
         7JzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LRPrHWSl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g7si15201341lfu.14.2021.03.16.08.07.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Mar 2021 08:07:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LRPrHWSl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lMBIT-00089Q-P9
	for alex.bennee@linaro.org; Tue, 16 Mar 2021 11:07:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMBIJ-00087v-Vw
 for qemu-arm@nongnu.org; Tue, 16 Mar 2021 11:07:40 -0400
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835]:33519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMBII-00039J-Aa
 for qemu-arm@nongnu.org; Tue, 16 Mar 2021 11:07:39 -0400
Received: by mail-qt1-x835.google.com with SMTP id 94so11850035qtc.0
 for <qemu-arm@nongnu.org>; Tue, 16 Mar 2021 08:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mU2UTvC2h1JsJsvg+raT6xisMpRUMwtOBVGDb4u75UA=;
 b=LRPrHWSlZj314Ih0AKT3MW2crTK5loj3PhrvsxHQDY+nRatyh2onWe33aLHIz4vgP3
 ApoyCiwdt6bTRTdJMX/YByNVUsuTdHlupM2tAvLOgJjdgGbq0d4DPWxQfS3diSzFGkPA
 mCGwjn0drEXNtAlOc2mdIAAEbacvgJKejmmV2lcNWg5HVYwsQqMTdnKzRFv4EKado7jE
 0jnDqnKMSpdmR87GgdT+FbD1Nh6hgHFHO8673sRbWFxbyOVmhJk2Sa8WucOZW9ZCqkjY
 cbJ5GEaJaeRFZny+ut79TyJEslCBEDMLX1xfZ/D5pnvbotgPh1sfxS/H1ZMAESiVb+0k
 MK+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mU2UTvC2h1JsJsvg+raT6xisMpRUMwtOBVGDb4u75UA=;
 b=QOX11xP2LlbrP4WZZHaGYHKm7uQJSq2DaIo3KyDiTyPR3tsxLp1Hn7GrpOOr7cQxLF
 K0JGUp1uqAzh63I2SDiMr8CA6wL+gA1LrCkP0vqhuiRFfwq4Hb0Gk6e5WkQiHmr/ua82
 wpmjcfM2d7eKwl3hwJy8WVxqMQlicX2A0nHicW4HJtKZS6B6tjPyELP23YsRLZlKeugT
 xotxIi4TXHIHdXy1wpfIFN0Z23I7C48cEOtdnwLN+esnhy+x5PkbaDv9SuWm5vREl/Uu
 4fIjy6IdXzjYmqrLGRAGCL/EjRaKcUgD98z2xAW4F1/xCUz2sXjOBGRIYU8SzrB2YCxL
 vsuQ==
X-Gm-Message-State: AOAM5301ktcyEwFmmCsTyHYMZHKYVnXW9i5xzCFMRIM7sXKzKnngsKNb
 QdfSmHu8y4XTICBqEtiuT7aDxQ==
X-Received: by 2002:ac8:44b2:: with SMTP id a18mr89634qto.285.1615907257230;
 Tue, 16 Mar 2021 08:07:37 -0700 (PDT)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id b22sm15422110qkk.45.2021.03.16.08.07.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 08:07:36 -0700 (PDT)
Subject: Re: Bug in tlbi_aa64_vae2is_write: tlbbits_for_regime called with
 swapped ARMMMUIdx_ values?
To: Rebecca Cran <rebecca@nuviainc.com>
References: <54fb8499-0758-a554-6103-5b56d784fda3@nuviainc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fd1e329b-1a1e-f669-95aa-9a35c5311a08@linaro.org>
Date: Tue, 16 Mar 2021 09:07:33 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <54fb8499-0758-a554-6103-5b56d784fda3@nuviainc.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::835;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x835.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HwvYwZmP6jEE

On 3/15/21 11:33 PM, Rebecca Cran wrote:
> I noticed the following in tlbi_aa64_vae2is_write: it appears that when calling 
> tlbbits_for_regime the ARMMMUIdx values are swapped?
> 
> static void tlbi_aa64_vae2is_write(CPUARMState *env, const ARMCPRegInfo *ri,
>                                     uint64_t value)
> {
>      CPUState *cs = env_cpu(env);
>      uint64_t pageaddr = sextract64(value << 12, 0, 56);
>      bool secure = arm_is_secure_below_el3(env);
>      int mask = secure ? ARMMMUIdxBit_SE2 : ARMMMUIdxBit_E2;
>      int bits = tlbbits_for_regime(env, secure ? ARMMMUIdx_E2 : ARMMMUIdx_SE2,

Yep, good catch.

r~

>                                    pageaddr);
> 
>      tlb_flush_page_bits_by_mmuidx_all_cpus_synced(cs, pageaddr, mask, bits);
> }
> 

