Received: by 2002:a17:505:3f8c:b0:1be9:327d:8ee3 with SMTP id bm12csp104515njb;
        Tue, 30 Jul 2024 18:51:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX9dx8sFsJK37ivPtlOhnU5A6I8nB050XHkpnsqvgRyIXdAWg0LDcGypH+VR+YJhNMhMXochtQohzVGnt/quyBOjokDaj5y
X-Google-Smtp-Source: AGHT+IGtK42nxmLao6bWtiEaWZL4t5yUTPqqaYEMfT6pDo5Quw7fDl9nWoTFw0u5CqLWdlzMXLaZ
X-Received: by 2002:a05:6214:1246:b0:6b7:aba1:7f79 with SMTP id 6a1803df08f44-6bb55afb213mr165059926d6.39.1722390667490;
        Tue, 30 Jul 2024 18:51:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722390667; cv=none;
        d=google.com; s=arc-20160816;
        b=hDA4O3YegxleRC9Szb7eFLLAaWgmHN4KW+TtmEKFmKU++IwMMo6oMrxttTZ6eSrNCv
         /dZ+7zTisyaY1YuOsXfofMAdhAMW8A48mr2nXvS1NJABcbeYS8snlxye6+4FifVCgQHQ
         eleirwrpzvnwd0IBxaTU/EIo7/uqSaGXdzuMR3Pu2kxn86aoVToWxd0jRkSqNrQUTdYo
         mhyL/rlX1fLb38rISevGX8+3OcAAoUcLGEoU01ajCUl2PW8EMqk+hAeTsip88OsRIe1e
         9X6DaWGWSB41P877m6K9Tvsv5wKR+sfjwxpajX/yg19HnmKRv9svodkm5i77WoMfGo0O
         jJ5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=J2UKc7cPTRStt86upDx05EExx+NbvE56LXjqhdeA9QM=;
        fh=XYwMhG2cZD9V4zNfyKcGf+fb3wg4lCYex2fxGp4Patk=;
        b=q5jYm7Hy1jy8tfRVTwjGcotofAICqNrEP8j1Hug/5YpTOkU0Tg6ihPhhTq+xhB8BBB
         l3M1pbEEklhQZayzvEyF6FUPiizASywQ1GbEKvrgsecEohwN9cd3VVMadAA6YJ0bIFFO
         Rk4TThQGMbCSut9eROalH24WV4ySW3Ho8uNxSqWmBMkKd24qpbRuczFr8bMcLdlPaPLE
         6egA+cziZpsPeV4UWGRMAv1cMHv1s3zl3J52fjRKIOr4SuJEmFUBOfnRyVgCVi1jtPYa
         /dEii/jmYN+audjErwgIbh+ssX1zonO51V2BAWhD6KQbypWxD5I0P0WwEqs3g98GMwkv
         6hWg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z8MDzUbf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6bb3faacd04si144458436d6.369.2024.07.30.18.51.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Jul 2024 18:51:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z8MDzUbf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sYyUQ-0008Ci-M2; Tue, 30 Jul 2024 21:50:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sYyUA-00088G-0h
 for qemu-arm@nongnu.org; Tue, 30 Jul 2024 21:50:44 -0400
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1sYyU5-0001Ed-Ir
 for qemu-arm@nongnu.org; Tue, 30 Jul 2024 21:50:36 -0400
Received: by mail-ot1-x32f.google.com with SMTP id
 46e09a7af769-7093abb12edso3953571a34.3
 for <qemu-arm@nongnu.org>; Tue, 30 Jul 2024 18:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1722390629; x=1722995429; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=J2UKc7cPTRStt86upDx05EExx+NbvE56LXjqhdeA9QM=;
 b=Z8MDzUbfT43yzQp1FzUMvY6oSF4buxUAX721r4LpRta2IqeOcVucmG6nVS43oTRHF9
 zKoaF89ZZuzZJv3WtMHv6jLgjMfduHgu8/hVs5aYEu0232kmdnS7AEiGeqU3Fzs1m3cl
 TnKzRJXO7hWrzIonNREIcjA54u/lm5W+0Caykrr6BsUODUOII/hLvIIVcPERzPII7Bux
 T9D2VA8dipWFJFaqbIsn+Blgpnvv4kNIFmsUSN022oyH9CmCifVewk80l4LDaoEQYU8q
 GUbXgB1Jzl//I0OjxSECB1Efco9TsURYbxi2x29M5sGfvAYYfuUiganPSUshhp33zxo1
 74Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1722390629; x=1722995429;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=J2UKc7cPTRStt86upDx05EExx+NbvE56LXjqhdeA9QM=;
 b=NIsVbtjtMHzsKGW2KKZwJqF0OJEFLkkJRW4siHsFJBMApG3D2DqadSJjXxiDVqI+x7
 ghGRtbXA7hPDYy/itnDgayTfOkwCr17Bpf7NCy95LYFNEn0ixe9plFBzSfsOwd4su4XP
 mmnWwM+ZiC6quSc5kzDJRrKDAr7zlQA8L9hN51a4OPm8wc/6EqS4+v07Rw5jaHC6+Rwa
 2UT4qgbY3I9m2soEAiGZgxAisp/G17M2oRxPYkjbZpRioJpNj0tkScCJI/Jf52xIuxFW
 G/EtBB/V8jlGvNT6M7O9RkdAL9VRAps7hg1pJ4IwONGFj6iL1wqDf3sosqGk+xCNjo4v
 /4oQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVupMyxd2VLA/x8aM6oQ3VDCXfpKYliiVBvqf4/QVSW1ea3yRXYgXRmx7oB4+swktrMjTad/O+K6/44ZHENXCw/qLxm
X-Gm-Message-State: AOJu0YwXvmaxsosAAdt7ORFwLEKwtS2SGvAKCxMaiw3WrZJtapINPa8o
 agjOgceFj/L2dXNqO21uDd3lHTz3qKU9gNM9Y6hF82w82+bt6X86CHv9T95SMVw=
X-Received: by 2002:a05:6830:6307:b0:709:449c:61d8 with SMTP id
 46e09a7af769-709449c6512mr16642865a34.6.1722390628901; 
 Tue, 30 Jul 2024 18:50:28 -0700 (PDT)
Received: from ?IPV6:2403:580a:f89b:0:7406:659b:9ac8:69bb?
 (2403-580a-f89b-0-7406-659b-9ac8-69bb.ip6.aussiebb.net.
 [2403:580a:f89b:0:7406:659b:9ac8:69bb])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-70ead812895sm9060652b3a.102.2024.07.30.18.50.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jul 2024 18:50:28 -0700 (PDT)
Message-ID: <f72574e7-478b-42e9-b3dc-e3d3d0e73f90@linaro.org>
Date: Wed, 31 Jul 2024 11:50:22 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/8] target/arm: Implement FPCR.EBF=1 semantics for
 bfdotadd()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240730160306.2959745-1-peter.maydell@linaro.org>
 <20240730160306.2959745-8-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20240730160306.2959745-8-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32f;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: a7mUt3nazKKg

On 7/31/24 02:03, Peter Maydell wrote:
> Implement the FPCR.EBF=1 semantics for bfdotadd() operations:
>   * is_ebf() sets up fpst and fpst_odd
>   * bfdotadd_ebf() implements the fused paired-multiply-and-add
>     operation that we need
> 
> The paired-multiply-and-add is similar to f16_dotadd() and
> we use the same trick here as in that function, but the inputs
> here are bfloat16 rather than float16.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/tcg/vec_helper.c | 57 +++++++++++++++++++++++++++++++++++--
>   1 file changed, 54 insertions(+), 3 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
