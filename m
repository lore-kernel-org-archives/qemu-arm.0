Received: by 2002:a17:505:1909:b0:1be9:327d:8ee3 with SMTP id az9csp1013787njb;
        Mon, 9 Sep 2024 10:58:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVs52R8n7pw/3o2Ae3bDe8FBT6s6A6JRk2Bxa/Or0NcevW1XTXxid7CBoWiJflnuQ/enoFEyY90ZbAeOA==@linaro.org
X-Google-Smtp-Source: AGHT+IHu8HnRZu+8675p9spKK7OMHB0pwMwF1cdI2FKNSnTzCzDA1Z323bWIHBN8ZB+MKbYlAVIu
X-Received: by 2002:a05:6214:5d0f:b0:6c5:51ee:4c79 with SMTP id 6a1803df08f44-6c551ee4d53mr21547796d6.21.1725904685800;
        Mon, 09 Sep 2024 10:58:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1725904685; cv=none;
        d=google.com; s=arc-20240605;
        b=CLzPUx+cOq6dJODOO2g+mL2jhoZnNfzRU0n7XsdFJHQ839+isyLRWuKkwZWeyPQmh2
         2QlKWpiMXTOmTc2v6joXvycPU5i6WTg/AVe33ZAkez/+YeAK21WVPz1YW15P8+71E6v7
         D/b9aybbQuF6tnZrSCQ4Qs+IrEa841IfXxjlmUWP2Yyk9b/+j5ff0jbAwL1Y2a1UpLLP
         WoLX2qums2tJVcTPF3WQUOF2u8DLuwucVdEdbp+Q8WCo/Ml/OT7RJsWpPaOjHY1w0Qr8
         Z5mBdKd3lES2cs0CYHmLiqP9NqS/CTq0oJejikQkw5EIJP4xklbVp0xu0RzSFHo2p7AR
         Dw0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=0paHbpejSENVQX5QhJH2kVydFzGP6Ub5wr6GqAXUY/Y=;
        fh=wRP/ivw6oM2fCR/pUeLdePU6QB+80zoaHPexEfbLCWE=;
        b=f05UkN+DxRCzVp5whhONf+iW3NUOTkPoHl68gr5Qdrg108aB8U9doyXhwzpAzmQNO7
         A+elSC3DAnQ34Udj37fui4+25EzLCzAhN/bXtLK4oOiWkhcaBFKHFF1U/csbigWAsUHj
         Ctcv0XbUFMFUjSj6DcwYbwgXLUyENC+zhBoSau/2MN06amOWY+PtGtz2ygMC8wpZwWJf
         I9cLB5M7gU8XOuWBZgk8svA0gHMIL7L56aOxOfexC229iZ4WNM/B4m0teCrT9VDIWNdn
         c14Iv06NjCUPP3XbHry/DZBP+lHzLoy3v3b71BVqZDMW+pwPSTbP0qQUMrezX7ajRT0M
         I2Ng==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ILsVLUYl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c534782a14si60187846d6.361.2024.09.09.10.58.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Sep 2024 10:58:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ILsVLUYl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1snieH-0002CB-UH; Mon, 09 Sep 2024 13:58:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1snieG-00022K-Ec
 for qemu-arm@nongnu.org; Mon, 09 Sep 2024 13:58:00 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1snieE-0000mo-VH
 for qemu-arm@nongnu.org; Mon, 09 Sep 2024 13:58:00 -0400
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-374c3400367so3967979f8f.2
 for <qemu-arm@nongnu.org>; Mon, 09 Sep 2024 10:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1725904677; x=1726509477; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=0paHbpejSENVQX5QhJH2kVydFzGP6Ub5wr6GqAXUY/Y=;
 b=ILsVLUYlF3FKCz1V40KQ3d3u3L262qDHQYG7lsf6mOkLzQO9zWU5jgnuy8U2gTbo3B
 PafIeoyJQKWPuzPqqwbQtlTW5TgbTlerUkZoj7y6/ip7Ml1tqdA+uyqbN4dygd24adeD
 B4c9II6FpMk8lnY5dQ5CnHwYlBcL81VLraaBoEp2m+V83vAzxHLZqzzsNFcyhDNVizvm
 XYg5rs1nS2a3utuEqfPLg+75168/CAGhqHCk900mC0QLlAzCanidfjQzQIktkN47Th24
 fr5JFa0ZRgmR/iLyFndWgHSRTYxu+sjtT4zi6qILYFJJIkjouFeWNTkCq45mRvT5Vc6I
 5ZqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725904677; x=1726509477;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0paHbpejSENVQX5QhJH2kVydFzGP6Ub5wr6GqAXUY/Y=;
 b=Md6HpK5Io+XzgvOdLcIn+laNRMrpGfXRPYEao3Al4q5mxK6E+5VlZJdaaUKo7xDHpM
 1auBgFNMCtUnHYF1cKJm6UKoF8i/TUVu4+5Be90KK5xlFMtU+TdPbXUY0rCjm8efklZN
 VDj8N0qJt+0OZCIUhubcjgbFPROgkxUu29SpJzg5npDsG7nOpAihhs5OI3oaMXDRRL9l
 zE/xZtRjaHfXObURocX3oiFbcWg0BCzJlEu0Jr705L03I4lWAZ94wI+/Pbsd/DtmtfMV
 ikMlVGP4u/D8iWvblNgnLN+mnjSY0LT3rROdGH0tQQqwnLv9vSOtzMcS7MrKitwf7DnU
 MV0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmmY0zcZCcGNh5aiN5FJw7fgx9mPQOvFizpW3GFDyP7r0JW77iNFqQy93DpUIIreI6RVWxRapt2g==@nongnu.org
X-Gm-Message-State: AOJu0YwvfW2CySIb9w/95bkOmgZD3ZeeE1MBYzWtjHw51cVuV6S4FKSJ
 hJDBx2lwYwctetiK9yHIqXeZdF7+dh7nV8XiV2i0YJMo6nDkkZsGAB/i6qF2WN/2IZCQ5XfON36
 m
X-Received: by 2002:adf:ef43:0:b0:374:d07a:c136 with SMTP id
 ffacd0b85a97d-378922d62bamr6450053f8f.36.1725904677314; 
 Mon, 09 Sep 2024 10:57:57 -0700 (PDT)
Received: from [192.168.69.100] (nsg93-h02-176-184-54-166.dsl.sta.abo.bbox.fr.
 [176.184.54.166]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a8d25926ee8sm372557866b.50.2024.09.09.10.57.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Sep 2024 10:57:56 -0700 (PDT)
Message-ID: <cac430b5-fda4-4667-ae16-f93aad8dd2f5@linaro.org>
Date: Mon, 9 Sep 2024 19:57:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-9.2 52/53] hw/dma: Remove omap_dma4 device
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240903160751.4100218-1-peter.maydell@linaro.org>
 <20240903160751.4100218-53-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240903160751.4100218-53-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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
X-TUID: OoXnHj1+fgvI

On 3/9/24 18:07, Peter Maydell wrote:
> The omap_dma4 device was only used in the OMAP2 SoC, which has
> been removed.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   include/hw/arm/omap.h |   1 -
>   hw/dma/omap_dma.c     | 451 +-----------------------------------------
>   2 files changed, 3 insertions(+), 449 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Tested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
