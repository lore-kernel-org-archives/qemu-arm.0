Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp4064318lfa;
        Mon, 7 Jun 2021 20:59:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnaAlMMnzkFy/Et2EXbTEiauQq68uHtuSFNCH2IL3NUWm/kLlnR7n/Rsg36HIkRm/cHNjP
X-Received: by 2002:a25:208b:: with SMTP id g133mr26876456ybg.211.1623124794170;
        Mon, 07 Jun 2021 20:59:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623124794; cv=none;
        d=google.com; s=arc-20160816;
        b=CqXTySB3mbtKQYl4LrlhN/pc0ZAwpGLd0EnbC8ujkhJgnz/Us8vgbrJvQahgTLQoki
         jN9/oapb9UCKX60QSfawSld/lFjjhbxhrXu0JgB43d20x64J7E+3SUdER64txKOXWCt5
         UwMjQkQx1p1FrHUSxLt9uODsTEzQ7HLEjQ5KWkJf6+upaS3bl9yGX7AelfFT8/uW9mWE
         /vqcpLe0eKTyb46Sa3LFLvYIneQ95YIjkVGPITgygAd1jGx53QxUtS8aMNmPF5xk6u/s
         MXclp+/u72dcx52yghnCFg4a3APiLdaAGEcoD3EsyzTdDjAvzH5yI4f92qEeHTVbPHxt
         owng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=yT5VkZ9B439MEbMUNDiEraAdMAVseIiFiuMwJ2J1mxo=;
        b=ddCdnZfIkO0gJLuGKk1mANZjkVLaaMwN/+0GMfQK6wxGKtf8BOcwBuk/MuxmYC4sHC
         AlFBZ2v2OCevJE425U6PyKyB6U380K0eSHTRQu85unKJgieJt/0UjLbWfFXiByGssAqc
         NWFEaeHttzQ4NWkkrmfC0uc81Vi65fiofPWkMmPRA2TVcE6SnEyHPXB71vU+cyFRTnG8
         gzFK0XAEghVyBuVDyNY+SS932M6re/t+9xqUaoyxMQ+7n9uyyUBafeZ2dDFg7gwJoT/s
         EZiVhv5O+GLL3ayrTS5+cwKVam8fVf9DtNXuR7HsUePrYQIuv5xQN7pCb2YywGQhXsbk
         kQvA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="h06HXTq/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v9si14523475ybo.388.2021.06.07.20.59.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Jun 2021 20:59:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="h06HXTq/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lqSu9-0000JE-I0
	for alex.bennee@linaro.org; Mon, 07 Jun 2021 23:59:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqSu0-0000Ih-FY
 for qemu-arm@nongnu.org; Mon, 07 Jun 2021 23:59:44 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:35714)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqSty-0002cP-RZ
 for qemu-arm@nongnu.org; Mon, 07 Jun 2021 23:59:44 -0400
Received: by mail-pf1-x42c.google.com with SMTP id h12so11867070pfe.2
 for <qemu-arm@nongnu.org>; Mon, 07 Jun 2021 20:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=yT5VkZ9B439MEbMUNDiEraAdMAVseIiFiuMwJ2J1mxo=;
 b=h06HXTq/VWR8EcXdSWThQ5P4BcC1CR/F6Cqkn4AMxP9qrF7EPrQWtYAL9nZPi4/6Yt
 mok4OxtpKP+CvbPeMiDw6Nz9R13RQDcIqXIrK5x8FZ5/n7Lv/Kyu2G43RMYtVVXieAV8
 FA8NJU46B/u24QFfZr5ANTt726QEUl3NooUZ6tvXe1P6TZzKARGMAwMZnD7v9LCniejb
 LqhTuR+qD/B6cxdY6z+eWYOpbKeAv5ey7x9eI9Pm8igZtwQ+mS0z6rXJkfCIOg63YSwt
 1PNuscW/faS6Pio1RI9OOL4XoGWnUyrGxlsjs1M+HyMsiIoXKqJYb4DNsSznqkw6tcTz
 zu6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yT5VkZ9B439MEbMUNDiEraAdMAVseIiFiuMwJ2J1mxo=;
 b=gux01DiHmc0S522ii6Nb6qCK8OiexaHBvbbuzOPTgGJaBz+wDzkns1emRcR+uDys3k
 G+Q7Cy/TV4sG2ynfdjM89hQqbNm+RdHMjdYxzBfNUg7StjTrtNHsJFZQyGVCT894wUYF
 odKjiaIGeCUegOW2QjCYB8sNNMwkNq6WuGAJXgaFn3y7THmEVolwN9szz3crJh0RRvil
 VyNeesHf4NC4O0KGrV1DAIt42dLTEZCcJafSTPbuqn0NQ/08NtBlAA1V/5HUzF4U9vuq
 sxpljVLjbYOQeL+GjzFYqamCohTqL7/fvhoyWSXsCbi8oQjk20E0DE7xxDMKUfpziKG0
 EP3A==
X-Gm-Message-State: AOAM5332sfPU06FKduLuyOxlT/BDT2ZTSGencMNGbP5LnnlKTbtyHSka
 VN14KMcyc3cHDOeY+4D89HpJbQ==
X-Received: by 2002:a05:6a00:2307:b029:2f0:206a:ee13 with SMTP id
 h7-20020a056a002307b02902f0206aee13mr8421515pfh.79.1623124781096; 
 Mon, 07 Jun 2021 20:59:41 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 q12sm926433pgc.25.2021.06.07.20.59.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 20:59:40 -0700 (PDT)
Subject: Re: [PATCH 10/55] target/arm: Add framework for MVE decode
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-11-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <4fd2cf91-e3e7-6a02-8395-8a2407a7793f@linaro.org>
Date: Mon, 7 Jun 2021 20:59:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-11-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ADweJznn1Z8u

On 6/7/21 9:57 AM, Peter Maydell wrote:
> Add the framework for decoding MVE insns, with the necessary new
> files and the meson.build rules, but no actual content yet.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/translate-a32.h |  1 +
>   target/arm/mve.decode      | 20 ++++++++++++++++++++
>   target/arm/translate-mve.c | 29 +++++++++++++++++++++++++++++
>   target/arm/translate.c     |  1 +
>   target/arm/meson.build     |  2 ++
>   5 files changed, 53 insertions(+)
>   create mode 100644 target/arm/mve.decode
>   create mode 100644 target/arm/translate-mve.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
