Received: by 2002:a17:505:1f8d:b0:1be9:327d:8ee3 with SMTP id pt13csp457653njb;
        Thu, 5 Sep 2024 04:48:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXaHU33tjRI2up+63S4guDRBxGoAPYngKno4cbwo/1nwpvvIhvUVLyXMnicwlNHKGLDnaOs7k1uUvR7WQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHyiPvtdPf0wiTaW7ylY8rFv6ydO6n+abIv8F6JR5l3Kz9BdlHCXpeodds3Z04ugtWmkQBG
X-Received: by 2002:a05:6808:3c97:b0:3d9:2b45:1585 with SMTP id 5614622812f47-3e020e8f10fmr1201569b6e.22.1725536935090;
        Thu, 05 Sep 2024 04:48:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725536935; cv=none;
        d=google.com; s=arc-20240605;
        b=CJXK3TBOukVXOWLMKW938Gz3PyA50LYEkK9Rn2CtOfN6O+cFVHnEWSxyf//1PFHvZP
         qmPho2Anst/R4tX4Ki0eE+dTXY+DcnxqSG09hfDeQleNQkaRTYfxiqVK6vcYIRMxa2DM
         QuI7vr7Of/3EYsAe4ELOeIAMZdqikrmFUfclg/QnwILs71tEQfCppY5dh+SD9xAgscnE
         0YeB8bz+JiaDXLRpRDq5IKKOsws6Mzp5g/xYA9dXZtk+3Hsfo35A9R/oYfGi6ugUlReT
         ciYQmVLc3F0tZu/745mXLzUKZ75AD/7JgajoWk2IyBp91cRmPYaLSwU2zM/h82XyaOy6
         EO3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=o3LeNeqFA1chLo4v9reQ6Zo07hWo9a7KOgJu8yzKmoE=;
        fh=dCgu6qWlYds3Re4Wa2RxBDeYuRPmg5nsuDLTpaMFLR4=;
        b=jnJIJ8gIM+Cp0kpDK9AT0tnEvx/HQIwgaeTgAswapNOaERE5w3jYzUjrmBCl4eay9z
         3ga7ion24aK+5Hq9G0yCk4tkcNqO18STe+emt/KqbLusro1q8aRHIFX0aHX4nB0nWKdM
         rFQBuItDjdUhw1A0vP1nD10KkFbHIcCTmeg67aVcewjql8k31KPz9s+uQdpIvUeoP2B3
         l2EATcnJEfiRkEdVS189yCywKXLEgazrNkea3qQ7tn988KG8wbVHhYaRww+KNMWuoaJh
         wk8lLaYdea9m0NBGEoKHwaeJt3jFmFNhkeZUdjkZyYg7oIfwLlyxsflIJ/q5Ovwr2Blq
         YZpA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yqhxsVgc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45809c86c6dsi2234241cf.257.2024.09.05.04.48.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Sep 2024 04:48:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yqhxsVgc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1smAyY-0000G8-RP; Thu, 05 Sep 2024 07:48:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1smAyX-0000Aa-Jf
 for qemu-arm@nongnu.org; Thu, 05 Sep 2024 07:48:33 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1smAyW-000167-2g
 for qemu-arm@nongnu.org; Thu, 05 Sep 2024 07:48:33 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-42bbe908380so5489265e9.2
 for <qemu-arm@nongnu.org>; Thu, 05 Sep 2024 04:48:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725536910; x=1726141710; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=o3LeNeqFA1chLo4v9reQ6Zo07hWo9a7KOgJu8yzKmoE=;
 b=yqhxsVgckAPb4FGnlnjZG7t0KuR9MHhmDW+8NE30fYklRXEDqlwn8N00KPyhuAnwNC
 PqS0mcuRa37apaU46AHwciV3I8WRicyhzUFZ5z7WmrI/pReZ2twDUDhfS1OXo5TcUFpG
 Yxp/oCV7NMX9x+NLXErlzXZopjGdmo4Si0tJE7/MNoZ3VnnFjHGlfdwqbpzxeMTIsmaj
 2wwN/0jxdY4J/aSE1Z4lHyDQ0P4A4DvUNAaPgr31EIryyOk4b8JRRq5WK312K+RNvHdN
 VJgkrtlnfT1dnqnMcGPZGUKP6x8uLU084JZluo6FjIVImNafmm1boN9nHoAwXdmtWyWK
 HTtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725536910; x=1726141710;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o3LeNeqFA1chLo4v9reQ6Zo07hWo9a7KOgJu8yzKmoE=;
 b=n7y26YFH+A1SM1B+oBhPOkdprl5xS0ZZ1rd2jn6dXfZvM/u/iYaD5fhT9in+oyvUON
 KRpQ5Kvoyvly7CJB2zP6WiFdro3a4cMfK7Cp6vH6fXWR9XTzk28PGMzmcf7ysoHJqdOo
 NvgfL4bk/682SdRNCX5XderxVdJTNqGH6GW2BlAfWX9f9z9jNIgMIQ9d9op1mpWPT+Cq
 QAyTf1+D6gCiGtBQnCztkEjYLIv/Ng0T8aewTc7PeqKN2GM/trI9sBSVzTk7Ar40pt8D
 RpzNr3tJhOcFm38SouA9lPLOav/nbpyXZOffvrku5+qSDVRDo3lLl7zIIqvAbCVz/ozS
 Pt+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWiSarCpc3eGhpW529lTaaiEhApmCVOBaUiEHpbdDllJ958gDdYeita7x24wklnic7qpKK7qgpiqQ==@nongnu.org
X-Gm-Message-State: AOJu0YzFcKqdHQmyywhBcZr7QDLwCvW4KZ6yYvLn1CVKyhRN/4qGmCzw
 E4Rps6J4YNG5L8SevYjaPeQr/UXVAqU+S3rTQcn/34rRKDD6OQ1j6oJmgPIvBBA=
X-Received: by 2002:a05:600c:154d:b0:429:cc03:6450 with SMTP id
 5b1f17b1804b1-42bd731ee10mr132357145e9.7.1725536910347; 
 Thu, 05 Sep 2024 04:48:30 -0700 (PDT)
Received: from [192.168.1.67] ([78.196.4.158])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42c9a5ed98csm16992855e9.0.2024.09.05.04.48.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Sep 2024 04:48:29 -0700 (PDT)
Message-ID: <2a70e589-50fd-404c-9d7c-b34942d904ee@linaro.org>
Date: Thu, 5 Sep 2024 13:48:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-9.2 21/53] hw/arm: Remove pxa2xx_gpio
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240903160751.4100218-1-peter.maydell@linaro.org>
 <20240903160751.4100218-22-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240903160751.4100218-22-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: cBN4NX4ptcvM

On 3/9/24 18:07, Peter Maydell wrote:
> Remove the pxa2xx-specific GPIO device.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   include/hw/arm/pxa.h |   5 -
>   hw/arm/pxa2xx_gpio.c | 365 -------------------------------------------
>   hw/arm/meson.build   |   2 +-
>   3 files changed, 1 insertion(+), 371 deletions(-)
>   delete mode 100644 hw/arm/pxa2xx_gpio.c

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

