Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp3807183ejc;
        Tue, 29 Aug 2023 10:07:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGTEXuPtQlZLkSBdlMF3kpitdWT3PKWAxBHGhmLtiRsIGEb8PvvwIX2TgzoFlTDyqu/nLO3
X-Received: by 2002:a0c:9799:0:b0:651:5bf4:22d with SMTP id l25-20020a0c9799000000b006515bf4022dmr7875664qvd.32.1693328830260;
        Tue, 29 Aug 2023 10:07:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1693328830; cv=none;
        d=google.com; s=arc-20160816;
        b=J3zsIbYZUVpmW5Om725Q8HzZefCfMCzdaDQTBJLmqRNVvqr7AeAveI/6/KyF8kHnE9
         YlW9ALWwxn+hLEmVFKNupsVkxZYc9n3lwpKC/cqdhyh6nhwwQcKEguLCSRDT7kFq2ZNN
         Yz6IdEsnRgoE1zx6vBXJVpMyXgiN9rf/X2wV33AAdTGlbgZF30j3v0NB6Qi2n+4vyhmy
         JSqlzjela8Wur15LzFpGKVOi5Iiwg8EwHETPoAmWKLugHAzo1NpBAI/5btzTrGYNjIU0
         rWOQKOw8vvMG7v40qmn+oaLgOaBldp37hrqu6q8ICsW4b2PXBiv0yGjPi8IlB1EmTVgN
         Jajg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=EJC4Q2Dzht6beo+iKRy2G8JGKTP6kbfY7xvxXxJ8pEQ=;
        fh=m6ro60Caf406s+3x8XRYfXkytlG/CXnsTlMqP0udiBw=;
        b=TZ+0PrAXzxwkXfBC8a8RI8X8TWI5B1m4zJfIDunrmPe6DzFUltDKkooSdnTqI9aVZU
         G8vvshNBhvbYsbG+9R+V1/zdnldfMA9yRbbFORlvQb+6lS9LD0yVFUqclGAClbXJM+5A
         IRQmOJ+MKS3rcpqMz5Sn4fhbOKoQU4hlWOrZ/ycnYPP0iDGEbl1R995Xr4ZibTp3cCTX
         APpbhNW9eHyqfr/K1ZUVs45mep5sy8MEul6Bf4HsEar5rSt1ilPmyi9JJks9g1Ud7ZU3
         cxXbnGsxqqphPZQElkY1yVbA5MMyUyB0KIJIEhoS2V7k+0ZNcerj40uo2DySc0S0OAcK
         2gSQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=melWkinx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b14-20020a0ccd0e000000b0064f9108e360si1099617qvm.535.2023.08.29.10.07.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Aug 2023 10:07:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=melWkinx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qb2BD-0001Xu-Gu; Tue, 29 Aug 2023 13:07:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qb2BB-0001P8-9G
 for qemu-arm@nongnu.org; Tue, 29 Aug 2023 13:07:01 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qb2B8-0006Qo-3T
 for qemu-arm@nongnu.org; Tue, 29 Aug 2023 13:07:00 -0400
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1bf7a6509deso24141115ad.3
 for <qemu-arm@nongnu.org>; Tue, 29 Aug 2023 10:06:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693328816; x=1693933616;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=EJC4Q2Dzht6beo+iKRy2G8JGKTP6kbfY7xvxXxJ8pEQ=;
 b=melWkinxTKChj1PD0p3TEEAy6yR6thnnhXyd9u7hob/f0SvShyT2JawUXJgKcGHCLt
 Qj8nTNxWfRyOUKIT7z/3JSeDg6Ury/n1lp6FznLVtYng2NHEy0K9ng8M68K1NxIEEXci
 bV1n2jAbL56ehq0K1JGxhWSJNDHua6ckfGiNBvvjc013c6Yc9k/BKWlxzS7JkhaPw/nn
 DkTvr6QxxAY9Z/Md9d51tT797UYysYjJu0NRq0vafmnlJtJ7eg37fvBNsDAM07cvc9sH
 SxEkzcU5mtBhZZOZ1o6alVADwuVB0gnOSGek5esSug2ybSA3x1SrzcNbEmYpy3HZMxsX
 CCXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693328816; x=1693933616;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=EJC4Q2Dzht6beo+iKRy2G8JGKTP6kbfY7xvxXxJ8pEQ=;
 b=KINtIhIMTgO84fhUDTrlOiCfnu50O5I17gQ60gcSk8RpgvGbuv7tzLr4Mqk8UBZfoZ
 GTHVDj+6ml/OubXH57FpNfPDgoUMK3TnQFAioMptoPBkPZfdaQp5o9ZX2H18NR6/QiYC
 K9vhdCeLOANpw7mJi6FWbezUHt1fc2U7GusF+oor1Qyi288z9Q0nj5MZEoRT5PdOWXcl
 tENLKofUChmWr/GCZ4vjsTXFW8tCuyH6xwZ62EmDr7KkQv1zoJArSfjEscX7TE4gbSWu
 e/2Csxg4Gtz2rj4kXW5lOkVHU0/tBTnhlkNWYYWEh3jSN7/IgAWYRn9vOiDg2jQ7bFiS
 MHCw==
X-Gm-Message-State: AOJu0Yy0jdKnudAY7bvhD01z2jdD4swcWD3X0b4K2Vn1SNhZK04XUSZF
 Xa17aXurq0qCRnlGp7edwEZyjg==
X-Received: by 2002:a17:902:e550:b0:1c2:5db:7f16 with SMTP id
 n16-20020a170902e55000b001c205db7f16mr1730352plf.67.1693328816674; 
 Tue, 29 Aug 2023 10:06:56 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.131.115])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a170902d38400b001c1f161949fsm3769980pld.96.2023.08.29.10.06.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Aug 2023 10:06:56 -0700 (PDT)
Message-ID: <b4879b28-d038-5123-87e8-52f75aa0e12b@linaro.org>
Date: Tue, 29 Aug 2023 10:06:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 09/11] target/xtensa: Include missing 'qemu/atomic.h'
 header
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-s390x@nongnu.org,
 qemu-ppc@nongnu.org
References: <20230828221314.18435-1-philmd@linaro.org>
 <20230828221314.18435-10-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230828221314.18435-10-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
X-Spam_score_int: -7
X-Spam_score: -0.8
X-Spam_bar: /
X-Spam_report: (-0.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.242,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUSPICIOUS_RECIPS=2.51 autolearn=no autolearn_force=no
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
X-TUID: GNkhJ5yr3iAc

On 8/28/23 15:13, Philippe Mathieu-Daudé wrote:
> Since commit fa92bd4af7 ("target/xtensa: fix access to
> the INTERRUPT SR") these files use QEMU atomic API.
> Explicit the header inclusion instead of relying on
> implicit and indirect inclusion.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
>   hw/xtensa/pic_cpu.c        | 1 +
>   target/xtensa/exc_helper.c | 1 +
>   target/xtensa/op_helper.c  | 1 +
>   3 files changed, 3 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
