Received: by 2002:a17:906:c785:b0:9bd:85f7:2662 with SMTP id cw5csp7167ejb;
        Wed, 25 Oct 2023 16:36:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFrXT1x8TCv+ahmiUq4+xvTdHD+GAPvw/qsPDxl5EzhCvZSqtBL568dKRwSzkorgA2IyWS1
X-Received: by 2002:a05:620a:4724:b0:774:2a7f:fa24 with SMTP id bs36-20020a05620a472400b007742a7ffa24mr20176347qkb.25.1698276968113;
        Wed, 25 Oct 2023 16:36:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698276968; cv=none;
        d=google.com; s=arc-20160816;
        b=C2jWfGcefmaoFyF5XzZ7Ck0eiz+Pb9+NVxEQOkC+FbCNJPkc971QphVh1ZPw4Lh+6O
         lHugTMI8ScP9PG7kwKhWz28sk4/oldz+DdLvY3v7N9E2KENE7BaPyJYYPue8UytCxkUZ
         4dG3Bh+hl8sWRSN2PYETDSw+8U1rsmofrj3k54IML07DmkfbS3m2COOaqhSKx0/vDQiR
         YWMI3mhdgEv5NY5UM1tP2VUSTxQEq/rUoWsJfV7XeM8o1Vc49YqjVM1Mh6ETV6OKjXRY
         KEP+yuW3ZWMc+G/Cy/B6WjIIOYUs4OwsnwxcRZtQ6wXb1qD56ceZ5cFfEi8ah72kra0a
         3jgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=xfHbIuIE65s6lXL7VEVSAZ6Re7Ym0Jcxl+hqAzCqwEc=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=Ul7tVktkQCSJ7OdOFyhwh47WgTLNCUza/KCw50+qWq7UIsq+y2c9xMQwIqJI//pVKZ
         f1gnbMaTf+vMmVlns4LE0gxfj7gQqNKlgcY4lMMoGbZsoO8nehnmdEvjjJpGHbkqlYWD
         Uigi4m+8mbho0eHecH1haaVQCmYwVVjwOA6JbgDqy8C/bytD9J4ZrfdJWlKcl+zTtkuc
         OEX+Z85J4ZXmxKW8N4W4L1kpeRZ7hRVn4xcec6ktfh1p6Ho1yIDg8cEITHeQXUUwagc0
         DQIaD2CMqxUaJFad//IIWxUYN+TE0dYUxMn+BzBsqtVj7ytJmI13c0iKh6XGbGgyOGDO
         BX/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gCQk84rI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s16-20020a05620a255000b007742e8f216dsi9027425qko.392.2023.10.25.16.36.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Oct 2023 16:36:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gCQk84rI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvnPv-0003Zf-6w; Wed, 25 Oct 2023 19:36:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qvnPu-0003Tx-6q
 for qemu-arm@nongnu.org; Wed, 25 Oct 2023 19:36:02 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1qvnPs-0007Od-9X
 for qemu-arm@nongnu.org; Wed, 25 Oct 2023 19:36:01 -0400
Received: by mail-pg1-x529.google.com with SMTP id
 41be03b00d2f7-5b7f3f470a9so298514a12.0
 for <qemu-arm@nongnu.org>; Wed, 25 Oct 2023 16:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698276957; x=1698881757; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xfHbIuIE65s6lXL7VEVSAZ6Re7Ym0Jcxl+hqAzCqwEc=;
 b=gCQk84rIFdYZsMM9TkISZuHekzUu4FzoOf1Oz/gNo5AbXGkHYkNzq9BX1MdB6lJIIz
 Gd2fMUSnpnqPY7d5xFeHlO9YcmB8EbP/wFjF2n5vEVF1/TcKhfY5JKQp+7hAFxLD3Api
 1XVQXGnzT111fm0gla8b32ZbnBu0zOGH4w+bTtikRBAGpDiXN4J7gsgOeb18maUzUvAY
 jMIKOQXqL9ZiXZECqlSuJEZLCpUdPjwJsmVlHsnhbQGMOVvhV+0xOnoGVAvSHpDAXF/T
 m+1r0otOfG/wioC/FDcVHO3nIACs1vpptbb77XWERmhXbd3mhFDMRYSf2AWo4rdKh9Jz
 Jyew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698276957; x=1698881757;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xfHbIuIE65s6lXL7VEVSAZ6Re7Ym0Jcxl+hqAzCqwEc=;
 b=BG3ge/Hd/Ih+m1vTK/SzuY9jJUFayu3awgV1VGdYLFLUKZsbvU5GLmsAnKC6UCsjmQ
 OwPRHvStR1PTzCsr+cIv24MIP6fwRqc4PM6wnypbYwtKIbzAP/kcWdLi1vZ0PdfaR4hI
 TnNWnvR4REb8pqcH+BQ5u+KCVCpxhljqhdgN5/z/Zp6DTUTw3+NEnqdugSLRymaBbXsp
 0N+hU7SH+Mw8QUGmW2+HODDA93An8+RbdxkyH3XrPxaO/m7eXDhoDwomQHDVtIBOzRlD
 pQ9NolRfSXXjZzESW9bxvnW+JJarDtuNwJl8brsN1ORs3C3QKNAzn40MmEymY11bMMF6
 7XVQ==
X-Gm-Message-State: AOJu0Yz+UUnIy69a/0etaXp+CrlR+eCmnwdLN9UD3eEK5nVaSPGRUuVc
 hGH1lV0o/uZRkwVDf4X8eOw04Q==
X-Received: by 2002:a17:90b:4a8f:b0:27d:b885:17f2 with SMTP id
 lp15-20020a17090b4a8f00b0027db88517f2mr13440817pjb.30.1698276957093; 
 Wed, 25 Oct 2023 16:35:57 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.149.95])
 by smtp.gmail.com with ESMTPSA id
 w5-20020a17090a6b8500b00277371fd346sm475304pjj.30.2023.10.25.16.35.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Oct 2023 16:35:56 -0700 (PDT)
Message-ID: <155d6f56-ebcf-4dba-81e6-23cd182fe517@linaro.org>
Date: Wed, 25 Oct 2023 16:35:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] target/arm: Move ID_AA64ISAR* test functions together
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20231024163510.2972081-1-peter.maydell@linaro.org>
 <20231024163510.2972081-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231024163510.2972081-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: mfYLk8ephu4i

On 10/24/23 09:35, Peter Maydell wrote:
> Move the feature test functions that test ID_AA64ISAR* fields
> together.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/cpu-features.h | 70 +++++++++++++++++++--------------------
>   1 file changed, 35 insertions(+), 35 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
