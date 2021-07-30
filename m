Received: by 2002:a19:c144:0:0:0:0:0 with SMTP id r65csp551494lff;
        Fri, 30 Jul 2021 13:27:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxbxKs+aNK9u+qHH6u2qef72186qcH4wmmPsvwcyCGDV738H3cHh7LDYwyliJZWW7E8PKcV
X-Received: by 2002:a25:a489:: with SMTP id g9mr5225583ybi.266.1627676854140;
        Fri, 30 Jul 2021 13:27:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1627676854; cv=none;
        d=google.com; s=arc-20160816;
        b=EllQ73qRXSt1vtvkLl47dQWrTnkB+It0q6UqVW9Jx5Gq4haDhl0Nc+qR1+nvtiN3QJ
         K86R3GtfXTw78uHiZLUqKH2sHJvqYOb9P0YxoO//iK/LzxzLhMGtM7ou7KyQwnBhpEap
         ewVRcCK4HaPAVI/EnuntoXnm5nktT5/jNFgS1TrPwRYykStnOSYKlCl9YOEpj1ql2hNW
         tNW3iKXjWeDOrme7BrAt7JekDcCNG+DoU/GhcPRdAxUmtkHGbZvkaozpcRBIwY2Mupa0
         pfEKdiW4VqfhgsVtfD5OpVvYcmH6Sm1k9ba8rXbhszxrCgFK7lQzvuilfaTleBw2nnpY
         LH7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=3w9RyQbLqyNnWIHeU7IeYXzqWdT3r7DenwCKfapmhRc=;
        b=qXfqr0+wFbil+6DgiUmCngFLulcUYKky0eK9NTzyThVly2XZ9RjH88ZdBKOU07Av95
         pe609r7lYK+uXE36mMs8lAT1snCtpQ3Rz58EXzVnJbFMeuZARA0XwKp2alw4sAb+kBl9
         5Ip9ZB6fiqIPd4pf93BJMf5nfYT1wadkWvnQVewIr6808rhMA42qYvpOBKZ8WpJr8lT3
         rmzXxJFrFrQHckVpicmT2+MpGA3kN5M7xrCRna2s2D4xf1XsN4yp3gbkRjapGWePcS06
         u2vYG4Grqb0lKkXMX+dNzQb+sb70h6ISWL2hvxfcSXWLlJf5mb2U1/YOoxs8MORQ3U1H
         iPyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RetsUmMz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d68si3292873ybi.175.2021.07.30.13.27.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 30 Jul 2021 13:27:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RetsUmMz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m9Z6T-0001Yt-EE
	for alex.bennee@linaro.org; Fri, 30 Jul 2021 16:27:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9Z0f-00021c-BQ
 for qemu-arm@nongnu.org; Fri, 30 Jul 2021 16:21:33 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:38835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m9Z0c-0002Re-N4
 for qemu-arm@nongnu.org; Fri, 30 Jul 2021 16:21:33 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 mz5-20020a17090b3785b0290176ecf64922so22414453pjb.3
 for <qemu-arm@nongnu.org>; Fri, 30 Jul 2021 13:21:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=3w9RyQbLqyNnWIHeU7IeYXzqWdT3r7DenwCKfapmhRc=;
 b=RetsUmMzBT3zhU6Rt+GzPokUC3La6NJDzeDBxKVX2rOOlV1BAlIUrCugAjcXkRYjpo
 G3xi5OI6ZArn+lB1S3wq23eY+KRVFUVLdOLOK3t/3CDeRsMpTXXXKuidlqZ18H+HAbbF
 4avmokZ6ehCx2caiSFXjQ9x7tXMx5p28TsbvY+7kVzpb/Swsvip/bIcF+QtonHUnI7US
 9XeQs115h1iDf8/jG823YNxDe0LQgUNv2LWY2+BvHmd1lo2cu80MeeSFzFIQv/olMXVo
 QGTcQb032gW8w07YlskNPjdcG9NnH4ZlnYBr2Fb8RwX/SdxhfvtZncIE+Zx8FEFhVvjQ
 Erew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3w9RyQbLqyNnWIHeU7IeYXzqWdT3r7DenwCKfapmhRc=;
 b=CZwpzjalbL7OnUU/HhVLAN5sGiEmWktGnQB34yGIXmBp9tbhbq5qon4VnvlDko4FOy
 X59PyJbcbFvAxNk1P6EtM8Y7pz/LnKJCDWZeTrOWK/Z7ghdF30J8ehkglGfi3rTA2Z8r
 fIv9glcoaODehS1ohugzhxnstfu04f2ReZEuTI1MEAyPGZlwFURs4Cz7eS5DxL5S3NO3
 yPIH694t4Er8uQ8p4YuH0TGwtH0tQArowE5ulY9DZjVkhI3HStjKPiNZyAtIcxQKPkRx
 GDCKuTp+Kc/D6r9OPmzBLX/BI4Hjy8gNWve+zameKUlcvUBbg3fJ8Hh460QwYWMHZklR
 ZmDg==
X-Gm-Message-State: AOAM533FTZSbefLQ4cjMILl6gjf0GDBgpUNynGotfqk28DaLdZ0f2wWE
 /2nRQp+K/Kkg+TwSeYKvVmlyYw==
X-Received: by 2002:a17:90a:4884:: with SMTP id
 b4mr4844085pjh.173.1627676489314; 
 Fri, 30 Jul 2021 13:21:29 -0700 (PDT)
Received: from ?IPv6:2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe?
 (2603-800c-3202-ffa7-c4c7-6719-c57e-8ffe.res6.spectrum.com.
 [2603:800c:3202:ffa7:c4c7:6719:c57e:8ffe])
 by smtp.gmail.com with ESMTPSA id lt14sm3304936pjb.2.2021.07.30.13.21.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Jul 2021 13:21:28 -0700 (PDT)
Subject: Re: [PATCH for-6.2 46/53] target/arm: Implement MVE fp vector
 comparisons
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210729111512.16541-1-peter.maydell@linaro.org>
 <20210729111512.16541-47-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c0912ef0-2109-ca0c-7b72-3161dbad3699@linaro.org>
Date: Fri, 30 Jul 2021 10:21:25 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210729111512.16541-47-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.125,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: XrEZoc/hviJ2

On 7/29/21 1:15 AM, Peter Maydell wrote:
> Implement the MVE fp vector comparisons VCMP and VPT.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/helper-mve.h    | 18 +++++++++++
>   target/arm/mve.decode      | 39 +++++++++++++++++++----
>   target/arm/mve_helper.c    | 64 ++++++++++++++++++++++++++++++++++++++
>   target/arm/translate-mve.c | 22 +++++++++++++
>   4 files changed, 137 insertions(+), 6 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
