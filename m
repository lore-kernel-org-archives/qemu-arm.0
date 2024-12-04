Received: by 2002:a17:504:d692:b0:1be9:327d:8ee3 with SMTP id na18csp51119njb;
        Wed, 4 Dec 2024 00:51:37 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWQE/rp5VbwplbjDbf8R2LePrIdr4YpZI6GWujJnCg+OFhRq6rb3iXiaGE+8uK7ffh9TvQizGqitY2tiQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFmuuujXx0S3SYh3f3iHDStVpOfm7Ul94II9t/Wx3XWbwV3BY9P6nqFxUSPyykKOCIGM85j
X-Received: by 2002:a05:6102:2aca:b0:4af:3fa2:2d0f with SMTP id ada2fe7eead31-4af9728f53bmr7767271137.26.1733302296956;
        Wed, 04 Dec 2024 00:51:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733302296; cv=none;
        d=google.com; s=arc-20240605;
        b=PZ/M5mlylUaf1hyBYARS0qtPMvsvCWz1y6ncr9O+Wd9cCr2ngXN9kMvrRr25dfoqME
         5pHo8EaQLhPXz7GXhpwwzFkJq0/+Q7diBzSJr+ybAn7aFYKU4nhZVgr9SCu3gcG7mwAA
         OR9uqGMSCkO5e/ludL05cffIzfcEKGx87xiG4+0iuBPdjgZIp6z5Nm3dSsKu8fgqZq9T
         1qHghREkmbZDSslifkaJ5O9dp9PYkysiZkN0TBqj46MbAqSS56YCUn1K66BZ1x9qQerv
         KeSna+GO8bVTstiS1PN+P8G8958dgG3Hrg1u2dlLPRfsa9Pi+AXH7x0wrdTXzKZzHNlX
         cfTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=W7sFc6889NF5XQTpNHkkYdysFK+mcsEJBJSdLnQpohI=;
        fh=UMlouvVl3Ph4Ne7UvGTvosqVcNxKyKMHDiGsZppDwks=;
        b=RRsZ1JWjWkvYqoi5T4/5kVnAdBEzhuCPV9A5KoBAAQqai7I25RS9Xi61290WHy9lqb
         owUpxVDJ2uY1X2GMvg7LRklQQ3Y+jsJ54Wv0QMM3Cry7GA0fnBeTKHxeiH4fdk1agAo+
         UWDRNSaGCXM+7SKiqS7fS92KqSfZeq9oF18Ur/VUUxqHc4WJghIC9hJPrqKh++lSUtla
         WFmGusS0BFR/Vco/AfwbCRoULgfWvT92nJl8jZYB9C3CVy5qAw5Z2sINpN6Tz8PHPYpZ
         A4KnA76axinesYAM5DdOGVoviEBzoaCReDotq7nQU8O0HxL2jFJ4NZ0BSXP8nAjN4JtM
         5nZg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TlbVVgzg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6849c27c0si1651910985a.424.2024.12.04.00.51.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Dec 2024 00:51:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TlbVVgzg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tIl6L-0005Xm-G9; Wed, 04 Dec 2024 03:51:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tIl6J-0005Vq-1q
 for qemu-arm@nongnu.org; Wed, 04 Dec 2024 03:51:15 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tIl6H-0002Ve-I4
 for qemu-arm@nongnu.org; Wed, 04 Dec 2024 03:51:14 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-434a95095efso3491425e9.0
 for <qemu-arm@nongnu.org>; Wed, 04 Dec 2024 00:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733302272; x=1733907072; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=W7sFc6889NF5XQTpNHkkYdysFK+mcsEJBJSdLnQpohI=;
 b=TlbVVgzglpaDB/f4v4GHXlTZZeEzcU8dKkrupLxXQgheDfNQSy7y27lPg1LioCmgIq
 RodTXuABjaHaOOEjOqMn9lAVD+k4MJB6j9sE1Q/LpHjEocNaPTiBY3ITmzVIUHy97sTi
 /OwC4lHSVyosJ4NXm4snegY8O9xJAn5jeL/il96FFcx3y3UIqaQe/CnOkmN3Z1NdYnL0
 S0bcPk3a1jLJNSPrPaA/Z5j9t/Rd+8gm9kAraGDGupIvcPUkNdlNTqUUQKUj3HCwqBpn
 +OmGTnTfhvtTO969sBHC7twDr4Zn/VGdfNR1tttIS68ZfQablT/53i4MCyBRfAP9Skf+
 dpog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733302272; x=1733907072;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=W7sFc6889NF5XQTpNHkkYdysFK+mcsEJBJSdLnQpohI=;
 b=aZ2UJa10QrpCVxeCEPPujiVibw2y67/jxPh6lQEJpjNjHGvTfOUc42CHVnQZ8l78zT
 d+KnYuJLkwPHQbkhOcRFS9RMsuO63uhDCIlktw9S/dshUsWvwvblled8S5SjaRe0t/1+
 dgSkvXhoQ/QsSds0+e39YMK9T37F4JK0AFbueLguCTYvwdsryt6oXsZyzoT9NL9bE/CX
 8R1ROQyffcU7GKw9npm+v/jJgZSn48X5ukZy2O3FLoCb88HLQ5nRLJmZso3rVxz7IInS
 WTInae0z+pd5NqV9c4c8voRbkthzGCoREO3vEsTqMC5TH49r4TVcpm1xR7KelDVQrkJu
 go5g==
X-Gm-Message-State: AOJu0YzA6LDdF2+nulA+QieZQtK9VWhOH6ksnvdq6u7/vTEZydgr0jCe
 z8p1oc3K/VLu6Cb73TCnm9r4ibNR8Ub5Uy5HcRPwyh5QLi43srGUMKXvshiGc48=
X-Gm-Gg: ASbGncvp1jSElCC8AhYpAbCBCwOi+a7hFf55U6noSH7yaYFmdejET1fQIqpkaNoqq/p
 w3ZPoxijRZSYjQUnxA2UZ3uf+76FAB/QS5doLKi7CSluP2cYPME/ZIcsjbE9VuQsHEANgckD3bl
 rNfvvUNKph4qpR2jjqC4e8fuHl4NT/lSIGLT1c4nZ+MKsKjzJWsALE8PCrb2K/tsaFxRolWZeU5
 J6AQBAKZgggWId9JnI+gdO6Io6y7AfXGpnEV3fj5KQMogXnPWUk958eH+P4W2bbLTbfvOucV94j
 Iyx8gvHDlzMUzs4RY5YYED+RPMhh/95/ZE+T
X-Received: by 2002:a05:6000:2c2:b0:385:e8e7:d09a with SMTP id
 ffacd0b85a97d-385fd969071mr5515162f8f.2.1733302271874; 
 Wed, 04 Dec 2024 00:51:11 -0800 (PST)
Received: from [192.168.69.223] (sml13-h01-176-184-15-95.dsl.sta.abo.bbox.fr.
 [176.184.15.95]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385ccd3a4bbsm17913424f8f.48.2024.12.04.00.51.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Dec 2024 00:51:10 -0800 (PST)
Message-ID: <21e0d69f-decd-4b50-8a31-c46a3a3fa7f8@linaro.org>
Date: Wed, 4 Dec 2024 09:51:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 25/67] target/arm: Remove helper_sqrt_f16
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20241201150607.12812-1-richard.henderson@linaro.org>
 <20241201150607.12812-26-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241201150607.12812-26-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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
X-TUID: J5zfpBjuqRZG

On 1/12/24 16:05, Richard Henderson wrote:
> This function is identical with helper_vfp_sqrth.
> Replace all uses.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/helper-a64.h    |  1 -
>   target/arm/tcg/helper-a64.c    | 11 -----------
>   target/arm/tcg/translate-a64.c |  4 ++--
>   3 files changed, 2 insertions(+), 14 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

