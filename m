Received: by 2002:a17:505:1f8d:b0:1be9:327d:8ee3 with SMTP id pt13csp457576njb;
        Thu, 5 Sep 2024 04:48:36 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV0Fijg2NavsfwIQzFySiGOM9aL62hKN8oetoqhEc0I2YbSz+BFhQIaqOHHTx5Bpwygmtdi6A2jbyp6NA==@linaro.org
X-Google-Smtp-Source: AGHT+IE7P0k4dbzI345UGrDMuFSyxNrkOq7hx90/XDkDzsHfRYwSCTAXjx+rucqcWJvCZtAaaH9k
X-Received: by 2002:a05:622a:4893:b0:453:5f8b:9372 with SMTP id d75a77b69052e-457f8bd3bc5mr91785101cf.15.1725536916419;
        Thu, 05 Sep 2024 04:48:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725536916; cv=none;
        d=google.com; s=arc-20240605;
        b=fNJbbyGa4hk8Y3rHpujJbdSrKRlI/dsOWUgbAUl9kg38j1XVnjduUFjteHUOAPK8PU
         xy/TPBpzjyJr0LhzQyEWTRl42YL2qIBA+KTYAsQRA+vO8TPUhUL0DDqXwQ0JBciz+Bq0
         juQVtiTYdUurgrm4EUDIjWErsyZLveUVx0EuKE2FmgNxqJzpx35xBlhqMbRYpLRWthW3
         GLtJU/bCVmxtpr2M3O+gjaMA0Vhl0QBQkrbUcbRZglcOGQ2opZxHTKfhBzTA08z9TOSr
         EDbIV8HgZurNti82hV1PHhGZCr666JI3KFCoKIkgXmZrcABbwV9B4PKwE8WdS2sdhJwe
         d13Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=12l9s4B89MeqT235OtJWJugeyF+7i4Pp5Amv9d5gRdY=;
        fh=sCEBoppuGanqijTcthCmUEYDSW4U+drgIn/9JxmdNm8=;
        b=SJ1PjTYXVsfz5oSjQGmCTSPB88zVIC1FHY/bfAi68KSW2rS+d5RGybol75B6y5LcAe
         qAXsA7tHvxw2Z4GLe6WmTp4ZxCblVo1VimdI8eCA9whDH73RR/a7oqVNOJ3sIHqUzTEN
         Qd9vv8y3zEBE8QnUbcozd5B8Mnqpgzt7CdHcdc8nDupr43w9jb/E2VkvJwXYJIUEsnCm
         0k1I8A49xsiuzyVr2rjAxU40+ViXHs9Z5xiWRwMbhmF1Zcuarf7NPa6H1o2fNBFshgRz
         rosdwvgrPHS3gjuZVFVBqXdIOQAj1/fzZL/CHld2Y19ACmpHr3jRsOM0qlv1MgCq1gVH
         e7Mg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uPJW1jhl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-45809ca4286si2207841cf.708.2024.09.05.04.48.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Sep 2024 04:48:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uPJW1jhl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1smAyE-00085B-ET; Thu, 05 Sep 2024 07:48:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1smAxz-0007vI-Tp
 for qemu-arm@nongnu.org; Thu, 05 Sep 2024 07:47:59 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1smAxy-0000sY-5Z
 for qemu-arm@nongnu.org; Thu, 05 Sep 2024 07:47:59 -0400
Received: by mail-wr1-x434.google.com with SMTP id
 ffacd0b85a97d-374c962e5adso356546f8f.1
 for <qemu-arm@nongnu.org>; Thu, 05 Sep 2024 04:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725536876; x=1726141676; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=12l9s4B89MeqT235OtJWJugeyF+7i4Pp5Amv9d5gRdY=;
 b=uPJW1jhlPxrg1+UDPgDMoA7naWGyuZJDVRXMellGRM6EdO20ZPhzth23seR4Ngt8zl
 Q8VI462K4ZVclQ3zRJ6xfoDUs4vRvL1QiNtRBgxOjthglXdChnH5re3bRyJyNdPUndBF
 3s9Oz4ux8wSkRmfPbM+gPE/rXMz0K2dxZwWl4ZmFemU/i+oG/PEZHKaiGAKjcB2OuQ+n
 /3eobR8n+ja/oLysEn2F/79d8LrpADCwjRfsCBmIkizyLBDh4VbfLMre6z3RFBQYgTp+
 KDNLb51zBNbNAkgRnxT6YrwWZyO3is62UMThzZLvNrsz2X5dLUvJgNn/9GPQD747Bx3I
 f6mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725536876; x=1726141676;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=12l9s4B89MeqT235OtJWJugeyF+7i4Pp5Amv9d5gRdY=;
 b=RECAMmYaDT3Cr15w8iUpxs25wZTyvRz6ZvKsGyL8YJw2keYkiElzOwZ8z7KxpQwtw9
 tebj/l5B0ClGhiE/2ILMKuQUWrM5DQM8oEpent1SUn6JsNrT5xuZO0GRpxBRSXrrbUlz
 vWq63bz0SURKpLVL1OeXzkPOhLvRZhlpy1XjybjYXZ1wU9dcup+qvtnsb4PFa9HmYAPS
 ucaJ37LaptgxGhIONTfjKEPMLWtklcuc1Op0dIVKhBgPT9BgfTHamzlayZuG8tKJCOs1
 Z7F6Y4m2xhQ53vwwRorjnw/6Ge/0LDMOjTG7DS1rhD+GUuApZN0dd7EbGUq9qY9NTEwv
 V/XA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5/HxlDoRrhReNaa7ywPpoAP9TnyoP7EqmzkFT3Gakw3d/ZGgE+Vw8HEsbrh4hxW6TPHNq5U6Cig==@nongnu.org
X-Gm-Message-State: AOJu0YxTglvdEq+Zvxr4/JKvBwLhMDf5C+hYrAeJ1C70QBQmXjiziolN
 Aa9K8zYVgeG84LZMO8Tzdhur/MLurQ8Qgp/Ik1Q2uVJuygUw9YPhFZtn/4fH6WivjBlMfWEjIH+
 9G1c=
X-Received: by 2002:a5d:55ca:0:b0:374:c11c:5024 with SMTP id
 ffacd0b85a97d-3779a612bdcmr3515127f8f.16.1725536876237; 
 Thu, 05 Sep 2024 04:47:56 -0700 (PDT)
Received: from [192.168.1.67] ([78.196.4.158])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3749ee4d391sm19276932f8f.3.2024.09.05.04.47.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Sep 2024 04:47:55 -0700 (PDT)
Message-ID: <5801aaa7-7e8f-4cc7-ad86-1545e5eba4cd@linaro.org>
Date: Thu, 5 Sep 2024 13:47:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-9.2 20/53] hw/pcmcia: Remove pxa2xx pcmcia device
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240903160751.4100218-1-peter.maydell@linaro.org>
 <20240903160751.4100218-21-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240903160751.4100218-21-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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
X-TUID: S9N6GxnwlnFQ

On 3/9/24 18:07, Peter Maydell wrote:
> Remove the pxa2xx specific pcmcia device.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   include/hw/arm/pxa.h  |   8 --
>   hw/pcmcia/pxa2xx.c    | 248 ------------------------------------------
>   hw/pcmcia/meson.build |   1 -
>   3 files changed, 257 deletions(-)
>   delete mode 100644 hw/pcmcia/pxa2xx.c

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

