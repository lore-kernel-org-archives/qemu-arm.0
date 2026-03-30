Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16697FF4927
	for <qemu-arm@archiver.kernel.org>; Mon, 30 Mar 2026 00:57:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w70wV-0007IR-9n; Sun, 29 Mar 2026 20:57:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1w70wP-0007Eq-M7
 for qemu-arm@nongnu.org; Sun, 29 Mar 2026 20:57:18 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1w70wO-0007Lv-3u
 for qemu-arm@nongnu.org; Sun, 29 Mar 2026 20:57:17 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 98e67ed59e1d1-35c2fe0d90fso1374436a91.1
 for <qemu-arm@nongnu.org>; Sun, 29 Mar 2026 17:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774832233; x=1775437033; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cXbHsVTjTYtOkTdR/uNc6mwdzrausVEMpU8y7SI1HnY=;
 b=Gn1f9kpmNP3p6tZ+poQjwTQCjqA8luZKrhy4IZAyKfLIOxaFkQ0nwh1smSeqr0OeRV
 Ayuhdh6JjoXxZ8wK/gWPiqiTP5U7W58bP21AWSTRAq3+2YFEE//uZGN/EajN36wclsJ0
 M16XlmjHYgYb2jLbG4VjO92gkhHHakWRTcFwdHfmRWJfPTyzY6tuYO9uOU6cDFPEomVF
 hg5IOBT1rmAJntKCXO4zPiJPx5AL/Iapk9+Mnpz3qbvCbojwTpTlClyJSU9MfgUR27Oe
 l+wpIY7EJpir9tqve3ukDqssuTVw96QYkmHCyB4RUcpvwrWz5QwLaFBYJZEBex0fFow3
 nvXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774832233; x=1775437033;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cXbHsVTjTYtOkTdR/uNc6mwdzrausVEMpU8y7SI1HnY=;
 b=dRJ6Ey0UrFQ94rg1ymTlqTkvnqYdPEQ3y/HNn8ZB5wsW0Y3gSDlwJmSgVj2pXJ6dWc
 XKcGA6IMJrQb+OJMRB/lWRKmN6rP2u4autj9iC8Bs1COewB9zDHHrW2r4/8ICRGuW/0y
 W/mjImKXcUFQUEm2GxF8S7J5/UvddLmk1CXyT1UUL5QF4AMJUnAJsJLJ+svlc5V7C0zz
 IPlmwBFWpQWdLc/wUAL/mVKqoCg63okM7m+3ji9DOUHj6T5J41nedzkbvtxeGgh3Vjip
 nyIR1BMTN6JtyWB1zvZvYI/RWv74m5fAEBQUq91HiMO9g9o+yR13Ls0tu36g4Jbc2uJ5
 4mCA==
X-Gm-Message-State: AOJu0YzqbEWBqtCq3GMqmhIo1WrO2oC1KoggnqzYNh4LhOvdy0bdyRo1
 +8EpzTk5W/pIOtuyK69ivb2oS5U7IJ196YYAxHGVoVBtQKOuVBbIPMYFU5UvNkKhu3I=
X-Gm-Gg: ATEYQzy6kz4/Y8hw9AFaX6ee6gUJutSeK00otKnmRMf7R6JqdmtIe3zQ/dFt05JGXi/
 Hq9Sbvp1jHZ2FkFkxEDFYIQJSd3/HlhUUwSX+e38t5OzX1r2Is/FLuhx+RUYm/6m/vEGn96hvfR
 unQ0kTYsFXsDEO8tviIEHnKdslf1sk46/FNl3q4oS+HirBmCPNXTcGy1r6WvUkZ2QXfCWhtaT9n
 VUpOnj1612JMtfKTRfMgispnAKF45TlfDmHpB/eFcOcFU90A7G7aCqxwTw0cbBuAAk3vT9E+dX9
 ebeXX19v8aoMN044NJx6qL7dOedqiX0gMfneNycFxpauogzL3ldDAsYkawYCvvTfNV6kg2Nd0ZN
 hAXRxzRWC0Wvnb/3Y5l4fXE+4iPseKP5qUF8ORH2X+Ar6UrpKmNkgok0NdpkkxVbaMlKepm/lPl
 VWuJfklyaL7cCPRFZz4hRA6XNr67XaHwYr8z688CU=
X-Received: by 2002:a17:90a:d44d:b0:35b:e4f8:7cc5 with SMTP id
 98e67ed59e1d1-35c300b9405mr9111858a91.25.1774832233415; 
 Sun, 29 Mar 2026 17:57:13 -0700 (PDT)
Received: from [192.168.4.112] ([103.73.85.112])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35c2eb708c8sm3772390a91.5.2026.03.29.17.57.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 29 Mar 2026 17:57:12 -0700 (PDT)
Message-ID: <ae109fd2-0cec-4ce5-9333-0db4e0d0595f@linaro.org>
Date: Mon, 30 Mar 2026 10:57:05 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 02/12] target/arm/translate.h: remove tcg-op.h include
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, philmd@linaro.org,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, jim.macarthur@linaro.org
References: <20260327165042.604105-1-pierrick.bouvier@linaro.org>
 <20260327165042.604105-3-pierrick.bouvier@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260327165042.604105-3-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On 3/28/26 02:50, Pierrick Bouvier wrote:
> Include tcg-op-common.h instead, and include target specific tcg-op.h in
> files needing it. This intermediate step allows to clean up every file
> (TCGv, tcg_gen.*_tl.*) in separate commits.
> 
> Signed-off-by: Pierrick Bouvier<pierrick.bouvier@linaro.org>
> ---
>   target/arm/tcg/translate.h     | 2 +-
>   target/arm/tcg/translate-a64.c | 1 +
>   target/arm/tcg/translate-sme.c | 1 +
>   target/arm/tcg/translate-sve.c | 1 +
>   target/arm/tcg/translate.c     | 1 +
>   5 files changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

