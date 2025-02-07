Received: by 2002:a17:505:5382:b0:1be9:327d:8ee3 with SMTP id ma2csp412481njb;
        Fri, 7 Feb 2025 10:47:03 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUAfYJapD18Lxul6VGuX43lqVNOnXk9xQ4DrYzYXry3Sln2aWUIsP/C7uOq/Z6ZLLqzYXd4ncwiYoKPUQ==@linaro.org
X-Google-Smtp-Source: AGHT+IG1jX89nRs4mX+XHgPhIwoYJyG/HcHdAy1oNz4/sOYTLvRXHKlvNgbcUZzFhlwFUP280ETB
X-Received: by 2002:a05:622a:19a6:b0:467:5082:74bd with SMTP id d75a77b69052e-47167bc5a89mr55539231cf.34.1738954023607;
        Fri, 07 Feb 2025 10:47:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738954023; cv=none;
        d=google.com; s=arc-20240605;
        b=L4GkEjHT1ngJIZJKjYKkPYf37lt2wtajHfFjNOuN76RUE4BvrEnVlmvf9ySK9VofUY
         EJRRQ5dhMzPolQunj9qO8TN223H+eK73tlixIXBQFQRPZvbdSNcmSSZtSmRxtgoAUikm
         NI4XQViP42tbzjGZblFzAqK3jYm/SLRnlDatqpU+na/d9mO4FDsJC5Aao+YhDK9j9yXS
         PiQE7bku++7r+MeWM3PpU33f1woofxRo7in3z30bzjQUV6EDI04O+KFgsbvuvDAZ4p6V
         fxwQ1i2GJlKuejqC1XdfLTsnQQ7EqFBix0grGqRZ7RE4BjOJ91uHWM5V6ivi7Fg/myM5
         RwkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=6PteMFpVHv0SCUiRxwY3z5U3KHwtSW68qytN5IFUi4o=;
        fh=kBdEBoFvN565xfviGRwfv8VUnRFfGxTP2z1IQCKKefY=;
        b=jDzvNYoItPfEE4diauzqfFfIc1xRCGwssyfipkhlFQKgnzYkOZ8FQbs0EUR813yfGd
         eLYUlXFDuq4LIMIu0JdYnAxsv21scAiw2l2jX1OZmIvcC0CDASHa6jpWwtu/0g5tsRiz
         Fl6smIi3GkLu62mYswFnSUWPMPQ0XWomm1aEweHeAdJwKytD/6Q3CdRMpGRGA4X0Ir+c
         8W4dco9PXCTutRr0IxBU/Ig1qA+12n4qGgq6kfFGTzcyBKrH1shDyVZBT7ArJdZmkN93
         N6kkTbuJj7ojlE01o4EgmD+MBiWcoBnsPRA2GrowtmnHmr8jq3pFcJyOTxn1/yyS2/vp
         TKEw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZSgH+CJO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47153bba2basi37499271cf.478.2025.02.07.10.47.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Feb 2025 10:47:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZSgH+CJO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tgTMu-0006aL-2r; Fri, 07 Feb 2025 13:46:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tgTMk-0006ZY-Oy
 for qemu-arm@nongnu.org; Fri, 07 Feb 2025 13:46:14 -0500
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tgTMg-0000Sj-Qk
 for qemu-arm@nongnu.org; Fri, 07 Feb 2025 13:46:12 -0500
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-21f2cfd821eso44939695ad.3
 for <qemu-arm@nongnu.org>; Fri, 07 Feb 2025 10:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1738953969; x=1739558769; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=6PteMFpVHv0SCUiRxwY3z5U3KHwtSW68qytN5IFUi4o=;
 b=ZSgH+CJOhe54o8dKC8Fd2/rHKIWKlEPZj2QG9UwGdF2X6OgP5j6mC2aVOZI3s13qQ/
 /gOXQWFAgxFhXrSz9Rly/YqrB1HFa6ubPbSkQOmmtPu0aZNuOXX3lnFMvFwaqJe6XORW
 HzEIOAF1zgK0S14X95aC9ldugKVTmIPQUBsC92AiwcuCyZ4L8Z83CZMHfmukszrkbYzG
 FObbJaLUozxaJtCF1q0PG04WVYX8J5fmzCALOIheVofflzVAQuUAT0fziQNjJWIHO4h5
 WraESYn52HsVdfu0Re2xwwelXR0KCXMaetg4xqkNeYD1bgCbZ2+mt2h209anYkAW/ySB
 ZqIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738953969; x=1739558769;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6PteMFpVHv0SCUiRxwY3z5U3KHwtSW68qytN5IFUi4o=;
 b=VhLvsDtzhe0v7vGXVpJ5XoVCCnjbCT1XxiadPtRfYy3RQ+22EJlDXLhbUpz0d8olUo
 71ufmscLfAcFLATqI8vlYT0vwT3B2nfT0T4MHb0DP0DbZT5qSKElISzGdqu7NQhF4RZE
 KcSIj3nRyEbMcOYgLGZ+yhbwsCjA+E+EorrjBvqvi0WHSZGuHFekqcqBZIxol+bc5Yku
 CxAvP8LnSQyPRDS/X4n+l5DqaG3ysP8u3az0hDOK3psoeAY0UUWIGjIeWfNYPTMi8WNg
 RFvFPbg160XgB48EWPRpaBG/5DeAbcGKnxrNgz4dN7BgZptKAEKj4hfsA2nsf+yaWQTX
 rFWQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUtOobTRk3xOthlu2y//RklA3txD8kSQ7RxXzURqfwEbiIM6I4XmIxGhzTPjjfQOB9WGujtu3j+1g==@nongnu.org
X-Gm-Message-State: AOJu0Yyso8i5/7WxR9tncStPBy4ZbDo2zw0o+oMohc0DflsUZFiiCnNZ
 kR2IWUY2kijdM1Gd47sjQY1CHW1t7cZxF4eSqydHFIWrq8nP7hZI3ZXXjFzOKyE=
X-Gm-Gg: ASbGncsIjhVdt05D5g8zfpbEcEXxIvaC8SKmakxZc2NHMFvocLPUNHL6BbHgj3k8Z5p
 1O7D+vdi0IE0JPSadoWyUV0mhh+n6xIkUCdh1wla3vUvtfsZSsTWyRfJ5BpMO4D0O8mCQqwxnLT
 lqClEgNYYcNh27nB2H2yDoEygliqioux2bqm9JXNlE373FQL2ogIB2qAFNz8+4Nm3aLsBvB1BdK
 bcM/HbCz8TsTITI2vmoEGq1/q6px6txg8yvTCbtoKDCZJ8yvp+CXnL+lMZfGzonJUEGFvTE9jYr
 dQnkQzBOyQbzHYXkuIyhg7pnskzU1ThCPp/yUykcyA+OFOAyAI2bFhc=
X-Received: by 2002:a17:902:f60d:b0:21a:8dec:e59f with SMTP id
 d9443c01a7336-21f4e7637d1mr58683015ad.39.1738953969123; 
 Fri, 07 Feb 2025 10:46:09 -0800 (PST)
Received: from [192.168.0.4] (71-212-39-66.tukw.qwest.net. [71.212.39.66])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-21f3653baa8sm34150245ad.73.2025.02.07.10.46.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Feb 2025 10:46:08 -0800 (PST)
Message-ID: <1af2d33f-c876-4c23-afb8-be63447960f4@linaro.org>
Date: Fri, 7 Feb 2025 10:46:07 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/15] arm/cpu: Store aa64isar0 into the idregs arrays
To: Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, kvmarm@lists.linux.dev
References: <20250207110248.1580465-1-cohuck@redhat.com>
 <20250207110248.1580465-4-cohuck@redhat.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250207110248.1580465-4-cohuck@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62f.google.com
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
X-TUID: WI5V6zjhqN8l

On 2/7/25 03:02, Cornelia Huck wrote:
> -    t = cpu->isar.id_aa64zfr0;
> +    t = GET_IDREG(idregs, ID_AA64ZFR0);
>       t = FIELD_DP64(t, ID_AA64ZFR0, SVEVER, 1);
>       t = FIELD_DP64(t, ID_AA64ZFR0, AES, 2);       /* FEAT_SVE_PMULL128 */
>       t = FIELD_DP64(t, ID_AA64ZFR0, BITPERM, 1);   /* FEAT_SVE_BitPerm */
> @@ -1252,7 +1262,7 @@ void aarch64_max_tcg_initfn(Object *obj)
>       t = FIELD_DP64(t, ID_AA64ZFR0, I8MM, 1);      /* FEAT_I8MM */
>       t = FIELD_DP64(t, ID_AA64ZFR0, F32MM, 1);     /* FEAT_F32MM */
>       t = FIELD_DP64(t, ID_AA64ZFR0, F64MM, 1);     /* FEAT_F64MM */
> -    cpu->isar.id_aa64zfr0 = t;
> +    SET_IDREG(idregs, ID_AA64ZFR0, t);

This doesn't belong to this patch.


r~
