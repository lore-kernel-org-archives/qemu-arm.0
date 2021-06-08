Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp4888541lfa;
        Tue, 8 Jun 2021 16:33:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxvGeotpSReXk+ZaeYsI9nG3Y/gOFU+icfOBDUPx/fMIPwuSISbbirOP5TQGSGf1GgbSDSY
X-Received: by 2002:a67:e355:: with SMTP id s21mr3099282vsm.20.1623195209393;
        Tue, 08 Jun 2021 16:33:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623195209; cv=none;
        d=google.com; s=arc-20160816;
        b=trlVOsPVgnti07IG4Z11rzuw0H8wpRFmz7fFlb9oma+To7dlfPV5SPjgMZ+7EXNv0W
         xidSOHRSl7aqFUdK+Itae4Lm3jcIkPF+8QQNyKyunsSmQ0K3hIl0x9REq6rcU56Z+Epm
         1RGdJwr0C7B2yppR+0U1wilIkD1b9wGARycRVdvuqnkeFEqVESYzJPl9l70LW6/SYsTL
         ximSL/3t5qH3Q/gQ0+Aadu7Tn/Qzvj7yk06r8DtqVxN2FW9Vv5yi+DssXTmXKTfQ/Atu
         UXQaMmDLsMcPMGoIRQj/gTDRnUFRklcym3XIm2BEXriuR7y9F9IJcan5lQotckwTV5Zt
         MgjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=CUZTVnY7lLlstnGgY0dxFO+o86r4EUiQP53gXzFV09g=;
        b=W+by4xSEYQ3JkEGSQAxMrrDoHiMSBqgrIhkbQ2i+Itfhx1aBYysur0W2ohet3ceEKK
         bpMJ0HDSd7m7v3XfbmXG/8nu9Uy6quuj1XF2UHC74cwKnjCYQbZEFnpIKRd27SJrd/qO
         Uxov+XdJfmKiTvJ/Ik5Dgj5juNzWAtjwRnP+BbuM50Ahe5eImDekZtHb9LlOYOAWusWZ
         p6TGs695nLBvpJG2Nu0av/hfsEtU8xG9kuPY/nUdNHbakPoFPnZixyGXA5/OhsMnvsM/
         YntMs0Kj1Vpbd3HUiNbL5wYJkL/3dSA6TU0xQ7BAc2ISPMHqJAv7aRHuNyChqGok6dnJ
         m83g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Lg9tyWO2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o9si7069213uap.24.2021.06.08.16.33.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Jun 2021 16:33:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Lg9tyWO2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:32818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lqlDs-00010c-LT
	for alex.bennee@linaro.org; Tue, 08 Jun 2021 19:33:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqlDV-00010K-VE
 for qemu-arm@nongnu.org; Tue, 08 Jun 2021 19:33:06 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:45602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqlDU-0001tC-Io
 for qemu-arm@nongnu.org; Tue, 08 Jun 2021 19:33:05 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 z3-20020a17090a3983b029016bc232e40bso268079pjb.4
 for <qemu-arm@nongnu.org>; Tue, 08 Jun 2021 16:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=CUZTVnY7lLlstnGgY0dxFO+o86r4EUiQP53gXzFV09g=;
 b=Lg9tyWO2Lc61vlT6/K0E0xbODGFkImV20q5uH+VAiBpsOqF7TnK8y0zFcbgp+z2TEo
 G3wBaZho52wF85tpuI/0dW6u6PeLlV1yzM+20ag3qbjzKVeu3QUEYk8CjjIQNfmbLYCb
 wU1j5XTCoGDfuycFw6PuQk/e807BvquNWbKD4rVKzLdNSQRBGCzPbVNFAWpvIOobwAB0
 Tc8MXiZxULYUCzoWDTiBYGz+Rtv7DOwL6pSoWL7lQDj4D39L2gZyF0Uvi9kqCVqzxASu
 7wNd2as2Nr8no0Bi6Bfo+p38cn6Tc7TeI5M/CPnbOQyxf+Dz0AkXV6lqz/Kh6xQDTuyp
 zAzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CUZTVnY7lLlstnGgY0dxFO+o86r4EUiQP53gXzFV09g=;
 b=jcHQREFGrEmYqMwKOOZvLt6sAa1EUKh+lN2x0TVbtU4nQ9OMfAMoCOmv3bZZYtwPXl
 Q+qoZRLR1pEQY4PGHIyuOVeyNu9f7rZkDq/dH2d/gX2At0OvcH5B0jGHxzQmWFlvJvl+
 mPbRg7S4zHLXCphYzQKgKCw4vUWP9ayKi3eBKJ7DxHF/Npbldrq9MBbapKuqPJsQx/yR
 /7Z4k1nVsj7/9OhnIeeQXQc2IZg2cABhwDQPlmNaTLJ+2zoXblBJ+9N60JYuxo0zaIrh
 3zBhrOCMGfaJOfhoq2l8BBaOkXhWHfAUJfqdLSlwIB7Ds+Ot+O91TPBQTk3QXEUMFYmD
 lMnQ==
X-Gm-Message-State: AOAM533D4SgfjUiGwmWKlIKz/HVS+CZMHAVSUt4/fI1QWMYGJHXmWB39
 XluqYj9BPgYrMD0guZ9amt95tRNTlnkPGA==
X-Received: by 2002:a17:902:d2cc:b029:113:2a1e:2b5f with SMTP id
 n12-20020a170902d2ccb02901132a1e2b5fmr2149260plc.43.1623195183030; 
 Tue, 08 Jun 2021 16:33:03 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 j16sm3102980pjn.55.2021.06.08.16.33.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 16:33:02 -0700 (PDT)
Subject: Re: [PATCH 24/55] target/arm: Implement MVE VRMULH
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-25-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d6e085c3-b8b5-fa7f-f578-788e05cf5f87@linaro.org>
Date: Tue, 8 Jun 2021 16:33:01 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-25-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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
X-TUID: RSqfIILTS+6n

On 6/7/21 9:57 AM, Peter Maydell wrote:
> Implement the MVE VRMULH insn, which performs a rounding multiply
> and then returns the high half.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    |  7 +++++++
>   target/arm/mve.decode      |  3 +++
>   target/arm/mve_helper.c    | 22 ++++++++++++++++++++++
>   target/arm/translate-mve.c |  2 ++
>   4 files changed, 34 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
