Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp5365853ejq;
        Sat, 13 May 2023 04:33:09 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4NSfRV7uwPSwqr1ZHpUQ1jdA9imJbTqEJNpCFu7OLoRsUchRhGUL6wy7cmtLNi5APS+Emb
X-Received: by 2002:a05:6214:dc1:b0:5e0:3825:9ad9 with SMTP id 1-20020a0562140dc100b005e038259ad9mr47648197qvt.2.1683977589732;
        Sat, 13 May 2023 04:33:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683977589; cv=none;
        d=google.com; s=arc-20160816;
        b=Xo1O8f5XDxdDOOIj5/tsxtP0RzygrpNyCO2jAgz/zkPjrWm2AEhElfvHNMXLZHCe0B
         DXh65iEnewE8szeo8i4vvkbPDxwyQ/6Qh38Ea9IzUV8fK3xTOdMJ2AH0hmDsbGnKA9HV
         aonxnaE2jytbs1lpBA8/t3SWHV43gRdLPKMm4P5PBIlsftsTRSscvaZUe7kmsyahggce
         k9YC0FGNmdgdrRh6sFEteoEnrRGxGeyVuqp9R4ifAg5mYtR3W4Z9/qCfDwgYZTqfA1os
         58/BX9X4y3bMWqQmAoVPNg1M1f1oU5pP31zR9Yr6qOz+htFyOWaGw+Ykmu/IKDjv9LI2
         eKMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=V6eHr2REfmKFDuZ5AS9E4L73aJfjavP+6AkXOXsADj4=;
        b=XOZDwAoeXjmhD3JS+JtjKCYl+3nZD6OAGEogrlqTgsIzpzrO1KyP8lmKIs6auLG0eo
         mYT05ar/tq7wsbHv3cyu/Xp8TIy33TcVIbelObsQjAbx/7aAGnNZFwWoppeg8uBvLdBp
         gGqtsQbz645SEuKm0iIVmYLa4xBye4F/1kuvdkHG1bqGPF4VafVjW+rZe0l9S9okSTPB
         C0EGkBXn25xCSDYZthyUTJsi5zkMvydjcxkfMqHWSh2ps0DOIVMSN3nUe3ZNa7N3cyMY
         ZfNuY8AbheMLJvNd0evCosrDkeOTPA0D14pnULP4xSH1xvfxu8heCwNS2S7nUrlbZh1O
         g9zQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L7UMWCRn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k15-20020ad45bef000000b0062101f4791asi6909465qvc.248.2023.05.13.04.33.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 13 May 2023 04:33:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L7UMWCRn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pxnUR-0001e2-PZ; Sat, 13 May 2023 07:32:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pxnUQ-0001dO-Qm
 for qemu-arm@nongnu.org; Sat, 13 May 2023 07:32:42 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pxnUP-0006Ct-9p
 for qemu-arm@nongnu.org; Sat, 13 May 2023 07:32:42 -0400
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-96aa0cab88dso280222466b.1
 for <qemu-arm@nongnu.org>; Sat, 13 May 2023 04:32:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683977559; x=1686569559;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=V6eHr2REfmKFDuZ5AS9E4L73aJfjavP+6AkXOXsADj4=;
 b=L7UMWCRn5N2pyx2APP0pZgAMXOvx09U3Y8nVv/Eq6YCOcgVBZdeRfFG/Q12WAoZP1o
 mUP0TwrXScqQkIFAl8azOGT4CD1OChIUa6qcWe36JwMIPRhY6Akz9LYGGBfzH1AKoLzv
 JFAAYyf6dhvsyzmo/ZIiqoJnZlyxGbA+dKtULTMpA3f41ruxDAUONhORi0Ho5Us6L8ph
 fKgz2tw6lHmGSjk7RpU6HbV6j2QEhgEuF4McBwtc4Jpip5aZ9mqHN/nWszJTd3oM3cUk
 D1XJ9gHnqV8Xwtz99V8KRl2JCydy4FPlprOWtQ64usBx0tdj6qZMPMP0p0H90dQmRU47
 kT8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683977559; x=1686569559;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=V6eHr2REfmKFDuZ5AS9E4L73aJfjavP+6AkXOXsADj4=;
 b=jKyrgOUxb/u1hbdP87qJScKEcNkQztHDSBLZ14pKSJNYxq0+IrUMY/A/97QusiTXJk
 mP0jZ/fiGSzzfRnx6WIut4VUuO+JoIUS5HvjP6mOgdEE/N0tno9BZW8fbUKoYcjUGfKg
 oYnLblVbaT9g4oOr5gSH2y+6rpgFHWA/yALpRjbuwIA64sOlBTRwUbtLrF3KnHCWPDCD
 oZGCE2gnD+FBzksODCzH94S6/FB2nD/PH8d+65xCp9QeMv8hBn8AQVmQ0qMOm00hW0nw
 mpKbyShwqCE9O2Yf1fPXtJSw9KI9DlprnPof82Rl2FNMc+QsaMzPgcyYl5Sk9W6EsHQl
 n7hA==
X-Gm-Message-State: AC+VfDwG5a37hDTuSGVlDyf+3Oom/G8rJipPAVeAtrXj6sTpYTbFqjPo
 IQWLWw1Sw73mD5geTmTwgiQ6SeiFEka8+/OgkbxBqg==
X-Received: by 2002:a17:907:802:b0:94f:7edf:8fa1 with SMTP id
 wv2-20020a170907080200b0094f7edf8fa1mr24834153ejb.32.1683977559571; 
 Sat, 13 May 2023 04:32:39 -0700 (PDT)
Received: from [192.168.190.227] ([109.144.17.21])
 by smtp.gmail.com with ESMTPSA id
 rh2-20020a17090720e200b0094f698073e0sm6608645ejb.123.2023.05.13.04.32.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 13 May 2023 04:32:39 -0700 (PDT)
Message-ID: <f60fb053-4487-6a50-a18d-ff703dcb7c38@linaro.org>
Date: Sat, 13 May 2023 12:32:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 18/20] target/arm: Convert BRA[AB]Z, BLR[AB]Z, RETA[AB] to
 decodetree
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20230512144106.3608981-1-peter.maydell@linaro.org>
 <20230512144106.3608981-19-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230512144106.3608981-19-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.923,
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
X-TUID: gbXVVImCTDDc

On 5/12/23 15:41, Peter Maydell wrote:
> Convert the single-register pointer-authentication variants of BR,
> BLR, RET to decodetree. (BRAA/BLRAA are in a different branch of
> the legacy decoder and will be dealt with in the next commit.)
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/tcg/a64.decode      |   7 ++
>   target/arm/tcg/translate-a64.c | 132 +++++++++++++++++++--------------
>   2 files changed, 84 insertions(+), 55 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
