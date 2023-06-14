Received: by 2002:a17:906:ae84:b0:982:368b:d395 with SMTP id md4csp970929ejb;
        Tue, 13 Jun 2023 21:47:13 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4qm9VGQLw+ikRHmZckC0uFM5OBjwqyKfpUqzuvKt+yRj+Zkz7ov2SRz+8HqG7U/+JhO552
X-Received: by 2002:a05:622a:155:b0:3f9:3103:cf29 with SMTP id v21-20020a05622a015500b003f93103cf29mr1138185qtw.61.1686718033492;
        Tue, 13 Jun 2023 21:47:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1686718033; cv=none;
        d=google.com; s=arc-20160816;
        b=VRIhRu5f1zBwXL3cmHpWfw/QZkNq9BnXMkx0VWX9+FWF+a1rU1Fljkr43GjW/5C6oi
         f86O/NYAjPNV9zCCoeeODKl/St13IcNDKyGHc8pFPb6e7i0sOxRnRG3zrhZA1Brw6a0a
         Zys9BsyGGZvX1lSAjB9CDG6ilq0M3j3g4DtH/jYD+p4GXma9XxAwChpId1FlQzvqaiLV
         14fKXD+wB49JN3G67HiDMj+Axk3JqYCQdAY2Aji43ak8dYO6bK2mfMjcfrrDe1Djo4cx
         uGr8Rah9VaWElUF6Cb3cRQEFVOhuNZxbqWHlqazmYpXcVGtzp+sijt+HjFo7bwr6Jh2T
         TA7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=auaPt1hOXoZgw/1+AbAPsk+Tji/EwtfhvVlmV0KomHo=;
        b=DqZXwysfw+SK0qA+rkAAPE3z0qvHk1+lV5puE9FE+gIW+WVwMAwpt9y98xijl3mhd1
         EKL/UCmchUEx3OO4PCM2Ujd+zYfqrjQZUxmBr91StT6KBHLRJbZfNIhcmwmwERwSy7XV
         E3kKPUsHv1DYfSe9iEjofWzHJ+hKur8wDRGYsyNxPs5kRyMIUZZarWs9vj+c8oQQn6ih
         yKu73xcvl5k6Yp3+du1ukKBkZGwXJiRIDYwhNWT7QtPY8S0iJRSVQyAWaeCWJa51PyyR
         Kz2fCJO3cCvpEX6BnwUT5KJiMMIIlJev+urt3Jc4nt4MHnc4oTmoUgc5uIVIf0LEyogB
         o2pg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AGKke7pm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x15-20020a05622a000f00b003f209a855dbsi8472126qtw.42.2023.06.13.21.47.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Jun 2023 21:47:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AGKke7pm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1q9IPN-0007pY-W0; Wed, 14 Jun 2023 00:47:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q9IPL-0007ge-Bf
 for qemu-arm@nongnu.org; Wed, 14 Jun 2023 00:46:59 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q9IPJ-0003ou-Qu
 for qemu-arm@nongnu.org; Wed, 14 Jun 2023 00:46:59 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-30fc90f359fso1655167f8f.3
 for <qemu-arm@nongnu.org>; Tue, 13 Jun 2023 21:46:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686718016; x=1689310016;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=auaPt1hOXoZgw/1+AbAPsk+Tji/EwtfhvVlmV0KomHo=;
 b=AGKke7pms0kdiGmxgKSSspjEoXhF0kF6q4GvRQeU/2K1R1eUSdk1OHhizKPV+0S5JR
 0yUsAP/F7fG8DZRJvuOBxTvvbRUi+tfqYsJIzdJqylzb+VC2fXLRGKAGYD3ZtA1k5F7W
 x22miV0iErXiOp4ccWZHRPLS/6qdKmHUaCzHJavlBDHNJPlU1BOTnwfpXrDptIR8abfr
 KTHFQKaZ76DMMds9/DwAk9XfcA9SSwbA7QF9ccyA02i9cd7hmu8xjD364jtTWYEP3PZl
 UfAiLHoUfyHIz7f6ENiD6+rofRLWy+n68YGoqBZH6AzgBXwgh6Ln9wertjMob0w1vmRf
 Krjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686718016; x=1689310016;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=auaPt1hOXoZgw/1+AbAPsk+Tji/EwtfhvVlmV0KomHo=;
 b=AhYgbnPSmVhBbtOxFFxCIYMqY4Y4/0RzEfDNrfbPcdaprAMFtjoi5If0fcqK2gRRw5
 HE6xkzd5SbCHWa51enhaw4RPN6hdO0rP+oUdJv7qLPtHhO0xEW/0JlPYBOThtGBMcJb6
 3TjEYyNnLTjUiDGLPq7hiGlFjpsmND0aSApBVxKt9kLyz7vz+X3PMNCXnFGFVKn5WCAb
 j7mqQ7mcmJEPDbRzAzFLoi+mZODqcYnVW+UucPJljrqvOyCFP2/J1fcJlnl5U/i93kYv
 Ols1GvsVIpmVvk+l3HW+jzMabXex8yZb8vwkvdzGoitSmtf2E2x6Hgw2TD4Pu3lqUAY8
 7ANw==
X-Gm-Message-State: AC+VfDwkeSrQRPBMrRHKz+tuhnnen2Si+hGGz7ytwkOjl9FJTuN/omeU
 cEQO1bwZ1OzuDcQwWOWdSfi3Ig==
X-Received: by 2002:adf:fc8e:0:b0:30a:d083:d22d with SMTP id
 g14-20020adffc8e000000b0030ad083d22dmr8221592wrr.24.1686718016075; 
 Tue, 13 Jun 2023 21:46:56 -0700 (PDT)
Received: from [192.168.4.112] (90-182-62-66.rcp.o2.cz. [90.182.62.66])
 by smtp.gmail.com with ESMTPSA id
 v18-20020a5d43d2000000b0030ae93bd196sm16929905wrr.21.2023.06.13.21.46.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jun 2023 21:46:55 -0700 (PDT)
Message-ID: <e1d6ae1b-c102-e225-a9eb-2757f6387109@linaro.org>
Date: Wed, 14 Jun 2023 06:46:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v2 10/26] target/arm/tcg: Extract VFP definitions to
 'helper-vfp.h.inc'
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20230611085846.21415-1-philmd@linaro.org>
 <20230611085846.21415-11-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230611085846.21415-11-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.098,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 37pZVEOu2bby

On 6/11/23 10:58, Philippe Mathieu-Daudé wrote:
> helper.h is used by all units, but not all require the VFP
> definitions. Move them to a new header; the next commit will
> remove it from the common helper.h.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
> TODO check recpe/rsqrte/rint* are VFP

Yep.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

