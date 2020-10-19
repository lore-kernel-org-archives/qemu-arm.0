Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp3938976lfa;
        Mon, 19 Oct 2020 07:52:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzaCEWv65dX1R9nX+AvZ65yX5UGwZukUofBd3H9RmNIQoxOjdh7AxM+JNjWckkpiRrtJC6n
X-Received: by 2002:a25:2f42:: with SMTP id v63mr3814902ybv.495.1603119140087;
        Mon, 19 Oct 2020 07:52:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603119140; cv=none;
        d=google.com; s=arc-20160816;
        b=qDOZ3NzY/bW+Cm5MYhW/G1waLxebaqXjlfS5uUAJcWgca5nImI9hkYw2iAk8ktX+Qi
         2ywZ1AYzXjQ0n/RfIurf/63gqaDceJANqwhctQ8nj3vKbCMwfTblD02+l5CYmmomazx3
         tbCpXK7rOHheErRVS+/azb4S/bDY35Bk6Nh0UMzqEGc4cIx/t6A3uhE/3h4lxHVGA12y
         5kzm3S0E/3+XAShdvlLklIwI+hBp7FLY9sJjUI01GtGDNtkqPQ1+YpPlRLiroLrw1bej
         asqRgR6360ab0pOf0z+RcboitaRna76zC5TsdhcJH67FUEcYvmEmfrTuq1N9Q8qHyVfD
         gniw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=C3d+9lAkjL4bgsA9015fd7GqTqKmrYxUnjVp4gP/DVU=;
        b=t54q1/HVtMDG+INXY9MDY6WTYgSBFRDw68re0lkTufHP7VDD1di1LZVjtxAcyYNuDN
         Sj8lh84MrJZp0GFajDw5VkJ1u5CaMJREdm/w5kdbFlpl7Av7LfnCgSt05rfbde+lBgql
         J6hQck/fp8zs3WX4MolPn1GnLMiffyaQvlGZJmgfjtwQpJQfCipnsUD7QEc56oSWz6Fb
         j/SeI8SDFpGoC46kXHc3JWX7mZRXQrGvgvRJh7qBVmcyA7Ht8SziwUjtWPuesJAxJLEp
         uR/DNemmpi+C1d9aoi6Hwx3tSyZ2Bah93CUZ1JoN93o5ZpEkGSS49g66fLKO6+Ud1Uib
         lcaA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Mf32AJSa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x61si240397ybh.247.2020.10.19.07.52.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Oct 2020 07:52:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Mf32AJSa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kUWWJ-0007Dk-Ed
	for alex.bennee@linaro.org; Mon, 19 Oct 2020 10:52:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kUWVi-0007CN-N8
 for qemu-arm@nongnu.org; Mon, 19 Oct 2020 10:51:44 -0400
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:33048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kUWVb-0008BW-E0
 for qemu-arm@nongnu.org; Mon, 19 Oct 2020 10:51:39 -0400
Received: by mail-pj1-x1041.google.com with SMTP id p3so105734pjd.0
 for <qemu-arm@nongnu.org>; Mon, 19 Oct 2020 07:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=C3d+9lAkjL4bgsA9015fd7GqTqKmrYxUnjVp4gP/DVU=;
 b=Mf32AJSaxAb9a7vIHNpmmJGAG8kgn8vFEQOtouaxdrCmnBdnu5Bvbg1daQFzJnLRLa
 Pm78GNYdLntY2QcMNgdUT8cy0fQIlAqGC80Qqa72Y66obsyIOPHv+7jKhs4QO2AOz5KI
 FhBlgLjz12Kuc3VNI5yNbbx1whmovKyYSS5D8yaYStt12PTely11q2bSvjDfNLDdalN/
 WMnyC4scNpOcsypvuYu5ASvVTGxdKPRDdzH80W7oyoe21zJm1s0tXccKa0EdD4RNDbyo
 4Ej74BmQZRWvNMJwAww6xHRl2CrGz0My9qdJEkyOu1LleCmOwaBCNfqqeDae3D4gthgQ
 H/IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=C3d+9lAkjL4bgsA9015fd7GqTqKmrYxUnjVp4gP/DVU=;
 b=mDqCaEH7ML3ltkmQt5A7MA9CXimVxpGCQ4KIsF61taHFONPnLyPTZUYwAIEkoZBjrW
 5sSj1bMVUsI4mwBcJZKMOr4N4ZPNrb9JE1mubpS9Ak8MT7/I1IT8xN9cyaT7OCHEGwe9
 gInGI3SwD57pLFQOViBBjwpH2etH4fDcJsxLAZBZrgh+BxrsiIFeC/v4pzsV3VvbjBqP
 Y/wSUk9rck9VOE+f7tbsq/9ovR++woO8EKLW8otO8BBPr1UZ/zYUxvhaBfiGzNOFAh0s
 1SVD9AeVdCaq2aA9srMan3T3a5Aj9FDTOIpnRmY7kDX4ottM3d+1SQZFWfFqV18jY2jU
 MvTA==
X-Gm-Message-State: AOAM533ByF6oDPgTm7fB+ybKt6KdWmLq1HkVQDKzCS10H096fmrQuFGs
 QsMXVxKKleGAR9qKDyL3asy/Tg==
X-Received: by 2002:a17:90b:e13:: with SMTP id
 ge19mr119746pjb.175.1603119093238; 
 Mon, 19 Oct 2020 07:51:33 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id g12sm129664pfb.170.2020.10.19.07.51.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Oct 2020 07:51:32 -0700 (PDT)
Subject: Re: [PATCH] hw/arm/nseries: Fix loading kernel image on n8x0 machines
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201019095148.1602119-1-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <f6ca56ef-d0f7-d059-e4da-5f729650c1c1@linaro.org>
Date: Mon, 19 Oct 2020 07:51:30 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201019095148.1602119-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1041;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1041.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Andrzej Zaborowski <balrogg@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: usdfov9u33Os

On 10/19/20 2:51 AM, Philippe Mathieu-Daudé wrote:
> Commit 7998beb9c2e removed the ram_size initialization in the
> arm_boot_info structure, however it is used by arm_load_kernel().
> 
> Initialize the field to fix:
> 
>   $ qemu-system-arm -M n800 -append 'console=ttyS1' \
>     -kernel meego-arm-n8x0-1.0.80.20100712.1431-vmlinuz-2.6.35~rc4-129.1-n8x0
>   qemu-system-arm: kernel 'meego-arm-n8x0-1.0.80.20100712.1431-vmlinuz-2.6.35~rc4-129.1-n8x0' is too large to fit in RAM (kernel size 1964608, RAM size 0)
> 
> Noticed while running the test introduced in commit 050a82f0c5b
> ("tests/acceptance: Add a test for the N800 and N810 arm machines").
> 
> Fixes: 7998beb9c2e ("arm/nseries: use memdev for RAM")
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  hw/arm/nseries.c | 1 +
>  1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
