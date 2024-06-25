Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp601471njc;
        Tue, 25 Jun 2024 00:12:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVf1ccYmwSreKKLplEsCGyzzWfxRKbwP6yWGrXQdn0aZKAUgFWB8/TVNWBznTc21TjIhsNfoVTGIpDgUAVSG8TFRR+zxtT6
X-Google-Smtp-Source: AGHT+IG/xL0QRDvGnMImfWL4LO+6MZvo5hh1x7B4P6kpADu32yCJnDbBixMonrdJoPOOTF/M9qUN
X-Received: by 2002:a05:620a:46a6:b0:795:5546:5d7d with SMTP id af79cd13be357-79be6d5a16dmr802262485a.17.1719299571647;
        Tue, 25 Jun 2024 00:12:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719299571; cv=none;
        d=google.com; s=arc-20160816;
        b=mf+WrddCRaU1AABpJUFc4FjQrHXGGqccnU4gtsSPkkujjGfglc4v6e/aNnTwI9kAVP
         1HKStpOm0m6O2lq+71K271YB2rKab/wJp69Ny2a2/1CsOnSaJlvPz4UVR5usuI1oOjE9
         isTOoHPwWDMoVlLuf0W41jFgVJvr0t3bnXRKhL5E/W6FKH4BYtezy//aWnZbhcIZW7UQ
         wwXjtunmKfyMdNCj0YvWXln49IhVFpFqtUZbE1tjJ5Hf/aa79N3MulC2Kwz4KhbDQTt0
         j1juPHmy19v1YSSkaHDMc6rOXEvAN3GFYyn2hUTS4y728lSg5DYxO6dKU9jjwxoNsgWU
         HRtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=raG4cteYJraVdb7UcG9T/DTMnavOPjxxWaC9g1jlx3s=;
        fh=u6T+sp2cm/8Fy80F11MmNKOa5j5u6bBtVab20JhpfN8=;
        b=aIWvzNlFFKcdj+IwVjeYK3/0vZ8jxu0zWQWMc6ID+tMUkP6kq64/CyIImaSnKmRhAj
         2jY0GxPNTJfFpBbr8+AFrA1yxXFEzUW9FlpxzKxhRkBxhn2XYo9llSBVrWXBKwv11LlZ
         QzbWyfwUfNc8ls65PJM0X9Z26KfoRmu3anCN7fM+1vZ7m4zlLuEz5O2l3ZJ6T8F3M75S
         3txSu3LnyS8YA1H1gHXg/EcXchgrpj4zi667JGVViouYWlluN72C57oC7tgjfA1D6X/h
         QMR5tNm6tba6gf2as7nIT5K2G6YxjSl1py8t9v+Nwo8Z+GsvTfQFhM9g1vhfYCDmFlj5
         zlng==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zdyC7m2b;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79bce95dd9esi1017576885a.766.2024.06.25.00.12.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Jun 2024 00:12:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zdyC7m2b;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1sM0Ln-00046F-F6; Tue, 25 Jun 2024 03:12:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sM0Lm-00045u-2h
 for qemu-devel@nongnu.org; Tue, 25 Jun 2024 03:12:22 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sM0Lk-0008BB-Fh
 for qemu-devel@nongnu.org; Tue, 25 Jun 2024 03:12:21 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-361785bfa71so3984420f8f.2
 for <qemu-devel@nongnu.org>; Tue, 25 Jun 2024 00:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719299538; x=1719904338; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=raG4cteYJraVdb7UcG9T/DTMnavOPjxxWaC9g1jlx3s=;
 b=zdyC7m2bNcIh38mwiMerj7xsmiW63h8cQPch/lnAx8wPDI7URFS/v3FVfhNiwwtCLO
 T4/1F1tvYFNBh1tzEYDMiLgmGSLH/Uo2IzcqTYVzpAUt6ef1l5IL43lo+N4RXeJ7eb1S
 MBin6VCR8hgE+UMprH1z0EP97oYoiBI5zNOZQBRADQhdc9wqULC8YeC6//RUQRGy8LmO
 ULcWLaeUlAB240mvXkpzGgB5DgPKi6SXUEhZ9ThMc3MxlOoAyj5DrE9FKBNDBD1TAsPK
 DG4velSAKaDzZJHX0PpNTzM/qNa3EIcNNoeqTUKHaI9VkDgfPePZKDwXnOPQcv5KYxrh
 ufbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719299538; x=1719904338;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=raG4cteYJraVdb7UcG9T/DTMnavOPjxxWaC9g1jlx3s=;
 b=tOKzbNYIzD6nrgEYFCEaLgvUXqWALRW3LUFs4nbxJG19HlaTpC+iPqLIfGOpa2REvT
 FJufvrcGEWAXsruD3KAos8/oz2MpOhGII7fPky1J6NX2m8KWh/yhz9I2nDDI8xzTX2LB
 B8BNLZ4P3gsRshTDaaLLxXyyRSFPs6Xp76vCQi339Bb/WGImtYMVWQDOXJ7lqKzLrmg0
 Za4ibUszB29bVVEGiFb5DJfWfTNLbXiXKvipNGz3zZN4+ldoAsEZ2ESxtG8ph+tGN2mu
 +ZkqmEnr7j8n7zue/HysbD5Iob32VbDdVWSHuVS3qc9uffKUoJ38HpZetSJfbXnKTu3S
 7yKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWzKxJm/QEWiOs3S9VmnOVjSMuxFZgzrAdsZzv0JMz2Q86KO6MTNLr/UP88fIxomMoaDLkDKRFVFwaxKGyvL5ubaIJeSSo=
X-Gm-Message-State: AOJu0YxFqTmRGrrcyUS6X5Q0sVtaL6vY4VvE0VbMHwfK/t/lIwuTfov+
 H9cTnVaBekUwkqquo7e6WpAb5TuUutimu24Sm03L/8wcdib7xRK1x9EB/f6bW8roURH6Im1Vfea
 /
X-Received: by 2002:a5d:694c:0:b0:366:f323:f59b with SMTP id
 ffacd0b85a97d-366f323f70fmr2892417f8f.1.1719299538417; 
 Tue, 25 Jun 2024 00:12:18 -0700 (PDT)
Received: from [192.168.69.100] (mau49-h01-176-184-41-129.dsl.sta.abo.bbox.fr.
 [176.184.41.129]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3663ada00e7sm12058484f8f.112.2024.06.25.00.12.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jun 2024 00:12:18 -0700 (PDT)
Message-ID: <a9283599-403c-440a-9880-05fb382162a0@linaro.org>
Date: Tue, 25 Jun 2024 09:12:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] aspeed: Deprecate the tacoma-bmc machine
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>
References: <20240625070830.492251-1-clg@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240625070830.492251-1-clg@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: HPQRuAwdYPjc

On 25/6/24 09:08, Cédric Le Goater wrote:
> The tacoma-bmc machine was a board including an AST2600 SoC based BMC
> and a witherspoon like OpenPOWER system. It was used for bring up of
> the AST2600 SoC in labs. It can be easily replaced by the rainier-bmc
> machine which is part of a real product offering.
> 
> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> ---
> 
>   Changes since v2:
>   - rephrased deprecation reason
>   - remove extra line in docs
>   
>   docs/about/deprecated.rst | 8 ++++++++
>   hw/arm/aspeed.c           | 2 ++
>   2 files changed, 10 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

