Received: by 2002:a17:505:2d08:b0:1be7:c013:c773 with SMTP id xy8csp598428njc;
        Mon, 24 Jun 2024 23:54:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV/JWkbF3NYEHMRaE1aJ3Hli1ZtmIg3fZyRWA8uuw+TsLyI3DMMu20qaZGRiMzQChZh8FomULYmCNw1JkafYeRH8/y83v8m
X-Google-Smtp-Source: AGHT+IEkWotsXsjmUPcWglg7Zwkm8x7/PzaQI59Xjxji7CakfB3Ei7WGvzO4jNn6JW8eRrzGMZDJ
X-Received: by 2002:a05:620a:199a:b0:795:5e01:74f2 with SMTP id af79cd13be357-79be46b75f7mr941298485a.21.1719298480548;
        Mon, 24 Jun 2024 23:54:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719298480; cv=none;
        d=google.com; s=arc-20160816;
        b=D70x/o4MzPlcbwR+AhwOfSDL5iXoqqWjDSpeZQq4piYE8J4yi3kIBqVhBBMqoVD4UB
         1P1yntuCL17PfdT7caKIwIR7BpI60BTdBDN7tGe6OW2YZMKLGXIONhewh9qGYOh44+UX
         erXJo/X33gjdOOVhI4YUaLLS+4sFo/HcpyfJyyAC2XG4i/VXQ12p35wGsO8fwdJlckT1
         j5k9I7NBdjBMTobM3ZrfBzg6MQbBnb5ZL9yFtiuHMyhR+4/HwCwUJ5GiyYIi5X2JeJN/
         7L18TNAnAkhFYqKuAqg7reNYaeosiEOuTHk67B/iu7usWkYV9g4Z+36l3bxTkR9N/52x
         9ESA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=UySjzv+2JdHEvnpXeR3HI1Rtg6290dWP+wYHzkrUzmU=;
        fh=WX5fgx8wk+huxiVsfSNwuHA8Evb9fhcdgegvKjGrDLI=;
        b=sT0cX4xhJw5zVhpwiwntKLdCKC2wNOSfc/gCFiFV4R6sZpZ9c9m5ZJwuT6HOwwDP8z
         xaUe/PH/67rSyhd4xJcrg08AHGdLEXQDyAJ6HzLH1J6PLkpAqlNlHOqCfM9jJLibZDW3
         vpbZpibvj+OP6Alo4m8fo/aHnL9deQ42HSXc5GWMgGYySXQho7wcpcMKtleZFWJI+uAB
         qrFS35xsK0gxKOgfNZsn22hRMQ4oCXRh96IK9wUZFpkSC7uOyRy8TL82BFdmV9pnBBFM
         0Yz5oZGUGfb4q6yly8y7XyBHdLCl/6ywxdaxzaMiNJwHDPaiPTQi0/FaDNy1YdXq2JLF
         gqeQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FP1HQ3JI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79c0c0deda7si2471585a.541.2024.06.24.23.54.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Jun 2024 23:54:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FP1HQ3JI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sM04O-0004qr-6N; Tue, 25 Jun 2024 02:54:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sM04M-0004qC-HZ
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 02:54:22 -0400
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sM04J-0004ut-UY
 for qemu-arm@nongnu.org; Tue, 25 Jun 2024 02:54:22 -0400
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2ebe0a81dc8so66398061fa.2
 for <qemu-arm@nongnu.org>; Mon, 24 Jun 2024 23:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719298457; x=1719903257; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UySjzv+2JdHEvnpXeR3HI1Rtg6290dWP+wYHzkrUzmU=;
 b=FP1HQ3JI8FcoJB1fquAjpoqc8rsSySKLK9EUENTQZ7S1lxlMY5rtjY9ABLRXJDyADG
 1MafUP/IfiUvBIXFfp3nBipLA95zzWZcLppfx11TECWayfHTmVzLI+xMPeQPKiJlurY+
 x3UT3Mw6hIxr74SMaFM8J3jSS9GSaa6c8CX/8M7hdqpoocxnzAnAk4LtEprIcdmqN6FE
 dLT+DOs3GGQY/1EGaBPRYeeaujk719Pw4HoJMgSntDSuwSdy3NnFYPAC1xdfZ0XK0jD+
 GgxLgGJgE/S9cx1DOFzXGrSXwWtIfzOceg6RiedACzKAPGCsKA7UakqktYzhZx7lWXw4
 agpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719298457; x=1719903257;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UySjzv+2JdHEvnpXeR3HI1Rtg6290dWP+wYHzkrUzmU=;
 b=vyk2SvqUORIVDvtUtcXqHVCvRNANu+QCoqm7nIt2Qzgb2mWmivcwdnqsd9b7loo7pE
 u5qefYklPC7qOBzOAnx2GD3oVZlclp1V8V9hSAWSemDPv7+S0A67APeBn7u/D/r40UY0
 XGAAUIjjjpLRa/1L5pbQK6LAmCLsajBjYnORr6M1vcZuEGBF4x/6jUClBHs0Rlksm23n
 UD4Ma01HlVrR+OYtv4HIRVT+qf1/FftwignWN2o6zl0eta3fMIP5UP4JKYZ3j/SOoXkU
 tptplsJvuzt5Qslu7K1Ia2Nq0r5M4yLC6GOwpbdSmTDhCOjDZlqrbO76Yxu97r7ASv2N
 TpIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKHl/Tvcy3rrXW6g1e8eU/FosQhV57qiFYXtTCXo0+FX8oTiqBIDgvAlcuPn5ivqYRy2GXLnq2YMC3PARdZirJCTc1
X-Gm-Message-State: AOJu0YwayP1hkHFsIu1p4h+oUP0bGbzXN4lRaLjCCwtKGdp90wt5485Q
 aQPZ/zATvjLL1THXBtDgmB7BvvjD+jUmRbU+eDApaCjRVIu7leUCyhKiwKibUso=
X-Received: by 2002:a2e:a98e:0:b0:2ec:5d83:32cf with SMTP id
 38308e7fff4ca-2ec5d83332fmr56099721fa.34.1719298456708; 
 Mon, 24 Jun 2024 23:54:16 -0700 (PDT)
Received: from [192.168.69.100] (mau49-h01-176-184-41-129.dsl.sta.abo.bbox.fr.
 [176.184.41.129]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-424817b5554sm164195525e9.26.2024.06.24.23.54.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Jun 2024 23:54:16 -0700 (PDT)
Message-ID: <e4571375-e659-479e-a4b8-00c82b227417@linaro.org>
Date: Tue, 25 Jun 2024 08:54:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] aspeed: Deprecate the tacoma-bmc machine
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>
References: <20240625060927.440589-1-clg@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240625060927.440589-1-clg@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=philmd@linaro.org; helo=mail-lj1-x229.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: AtgYntsYxdOV

On 25/6/24 08:09, Cédric Le Goater wrote:
> The tacoma-bmc machine was a board including an AST2600 SoC based BMC
> and a witherspoon like OpenPOWER system. It was used for bring up of
> the AST2600 SoC in labs. It can be easily replaced by the rainier-bmc
> machine which is part of a real product offering.
> 
> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> ---
>   docs/about/deprecated.rst | 9 +++++++++
>   hw/arm/aspeed.c           | 3 +++
>   2 files changed, 12 insertions(+)
> 
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index ff3da68208ac..3f036c79a45a 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -256,6 +256,15 @@ images are not available, OpenWRT dropped support in 2019, U-Boot in
>   2017, Linux also is dropping support in 2024. It is time to let go of
>   this ancient hardware and focus on newer CPUs and platforms.
>   
> +Arm ``tacoma-bmc`` machine (since 9.1)
> +''''''''''''''''''''''''''''''''''''''''
> +
> +The ``tacoma-bmc`` machine was a board including an AST2600 SoC based
> +BMC and a witherspoon like OpenPOWER system. It was used for bring up
> +of the AST2600 SoC in labs.  It can be easily replaced by the
> +``rainier-bmc`` machine which is a real product.
> +
> +
>   Backend options
>   ---------------
>   
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 40dc0e4c76db..823faff36a81 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -1379,6 +1379,9 @@ static void aspeed_machine_tacoma_class_init(ObjectClass *oc, void *data)
>       amc->i2c_init  = witherspoon_bmc_i2c_init; /* Same board layout */
>       mc->default_ram_size = 1 * GiB;
>       aspeed_machine_class_init_cpus_defaults(mc);
> +
> +    mc->deprecation_reason = "redundant board. Please use a similar "
> +        "rainier-bmc";

mc->deprecation_reason = "Please use the similar 'rainier-bmc' machine";

>   };
>   
>   static void aspeed_machine_g220a_class_init(ObjectClass *oc, void *data)

