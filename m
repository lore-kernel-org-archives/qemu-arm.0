Received: by 2002:a17:505:3501:b0:1be9:327d:8ee3 with SMTP id mc1csp1965322njb;
        Mon, 14 Oct 2024 09:32:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWy1JBd2fWtOoUoM6BYQn0v6vVzN2kYkFeAht4/Unvs6CVaUbtaW1e1LClIg4c9osSkgdvswTpKN8ilRQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFThFn2rVHRrYbuEOMhW/lumpuq3e+lgogVwgT65bUiV0g0xfLjfkzG0/wr6yI+VLYKJ8nr
X-Received: by 2002:a0c:fa89:0:b0:6cb:fac2:1cec with SMTP id 6a1803df08f44-6cbfac21e4fmr110491366d6.25.1728923560808;
        Mon, 14 Oct 2024 09:32:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1728923560; cv=none;
        d=google.com; s=arc-20240605;
        b=gJugEF5bDZaXdn75qw/u4sY6O0Z9hJF6XxxiIJDhMrjT0SZ/cj/3S9JYuwMQKhb5QE
         66Cpl9A1477M6xkRfQqfALz6htutBu2kq10Vp2qDk58i/U5S/i00nqdgsfcX0zTtoX7B
         RuyAdigmJ1fHlsCIu/zOf8v2FG0p4S9sJ32u0WRAH0kUnaR5tocNl+fXuSQiaZ+bNZbh
         94azzumHqxWePceW5zirN6ScZU2ftoP/NpTOLLLuf4r+yiQpfTdcnknlCnk4AlWieqze
         2qaY2Q6sbPxDzO01CiPdFrgAfgymF3xGBKSdXMb64CSZmz+B2PypvjxAiUKdapQffD+Q
         gT1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=1PrQn+uWeoZZP3OGAh+vxfmzh/N4rXkfXjfPzHNbc4U=;
        fh=cZ9qfJsBb3s+Bn1yS9Nvgo0BeY1Tb463eXsqZne2PXw=;
        b=bpcODSD/rCT9IeTObHAS1fdJfF9if2hItujdzsvOvDC/C95ccjPVEMW2de8vGBEbgr
         r6FYvF2wXDhQ0whHaB8cl22u8oUn1WEBR54wVVA/c4GYTVUcP92Prdd+jGX5qHID5qCt
         UbTj7MrVDnafvyVuzYvEBM84MKoWtpsmKFgJ+En4rc0rJ/BrxEtVqBtlspeysala/IOZ
         KtLAg5v0h+zecJmQn7kGZLfhZ651LqGFoTmO3aPuSn4iwY39Z3H5jjQ/e/T/7I4slrmD
         34w9FfmLG48y9OIturYunqVd447H5QP6o2ldPQfkKnPG+TztnQ6l4iWmt26aN2X3rMPq
         N+Rw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PrHQGOe2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6cbe8692677si105280236d6.382.2024.10.14.09.32.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Oct 2024 09:32:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PrHQGOe2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t0Nzf-0003D6-2X; Mon, 14 Oct 2024 12:32:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1t0NzX-0003Cc-DT
 for qemu-arm@nongnu.org; Mon, 14 Oct 2024 12:32:19 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1t0NzV-0000u6-TO
 for qemu-arm@nongnu.org; Mon, 14 Oct 2024 12:32:19 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-2e2e8c8915eso3117186a91.3
 for <qemu-arm@nongnu.org>; Mon, 14 Oct 2024 09:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728923536; x=1729528336; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1PrQn+uWeoZZP3OGAh+vxfmzh/N4rXkfXjfPzHNbc4U=;
 b=PrHQGOe2zZnkSKVbyz+0kHDd2tiBk0l9tYU9aTgal3ddbqS1lviZhHGQY1W3gnKTSU
 ouY6lWI2flrLFu4cPmBdRiKcmxwmdV3W7iq6Py4X0H/Vya9wN5tyUirqBhXvLoA8EbhX
 f/AEKn4iBBYr1gnVQAsn+UzJhx/6KZA6/xzy16CpR3UWgD+83zgqMe8XUP6mPjloySUV
 quzOOFGXCAM+o8rHXIF5L3v0vhM1//j0h/Y4G4KiSPtXQBwn25SfxKA7qSb9AIPhKvD0
 r1AI9oyJv7oNlHsJDdhh85f1ypc2Ftduc5z5LOUI/OtT0dnb3/vGJLaiUNTYF7ecGKyJ
 pjrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728923536; x=1729528336;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1PrQn+uWeoZZP3OGAh+vxfmzh/N4rXkfXjfPzHNbc4U=;
 b=BZjdLmcghLsN9dxNsdcnj6A4KoVwGJ/YTssSmRHihfGtU4RpEfCAbP/Q4sYhCqK+or
 WAwxBoxAY0x+dzFaC+ud6hEClcMtjO/DTCTVsOoyIrs0TF8OU9B5NNTLKoPDdI66Sifk
 LrxrTivqFTbURqzAiPfF+JEvXA6fUmd1Epw7X8QSUEVL1NJ330MHJ7xy+c/Q8m+CUtTE
 p33bcck8eThDp6PjZHqptz1KLkNLcvios7wJpgGTfX2D+fkGHJR6Gpr2QYxXnTa8mvjO
 kDaUUBo6QpDTJ9H/N9cMfBsoTPHs33ads3N5mBZToMn1q44qyws3ATZOdKqbHCC8DRyS
 rfQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOltj9SjZnMBkkIfW4XrKazk+EVRCX+z2j4XlR89Ktz8+x00qqJgaUa1e6gEBVwvLqO8jSA6RgCw==@nongnu.org
X-Gm-Message-State: AOJu0YxSYK1GEqGVMt/R6aOGjX1qx72fwkHT/QAqaoavBGkIBM3fAcS5
 6Pv6bjNECSfHzczX3JVrvCUs1RTgnm0QzL+2gvbxfY4WwUfp9Vm+d2FdEMTQSIs=
X-Received: by 2002:a17:90a:ae0b:b0:2e2:b514:ca1 with SMTP id
 98e67ed59e1d1-2e3151b78b6mr12000540a91.6.1728923535805; 
 Mon, 14 Oct 2024 09:32:15 -0700 (PDT)
Received: from [192.168.0.4] (174-21-81-121.tukw.qwest.net. [174.21.81.121])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e2d5fc5e29sm9170822a91.53.2024.10.14.09.32.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Oct 2024 09:32:15 -0700 (PDT)
Message-ID: <55d9edf7-9320-4b97-84dc-793cb1e72dbc@linaro.org>
Date: Mon, 14 Oct 2024 09:32:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/4] arm/tcg/cpu64: add FEAT_XS feat in max cpu
To: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20241014-arm-feat-xs-v1-0-42bb714d6b11@linaro.org>
 <20241014-arm-feat-xs-v1-3-42bb714d6b11@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241014-arm-feat-xs-v1-3-42bb714d6b11@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
X-TUID: 3rKpey7pJ0Kf

On 10/14/24 03:48, Manos Pitsidianakis wrote:
> Add FEAT_XS feature report value in max cpu's ID_AA64ISAR1 sys register.
> 
> Signed-off-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
> ---
>   target/arm/tcg/cpu64.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/target/arm/tcg/cpu64.c b/target/arm/tcg/cpu64.c
> index 0168920828651492b1114d66ab0fc72c20dda2a8..8c8f88d84151952872f1b1987e98d789b501fb23 100644
> --- a/target/arm/tcg/cpu64.c
> +++ b/target/arm/tcg/cpu64.c
> @@ -1163,6 +1163,7 @@ void aarch64_max_tcg_initfn(Object *obj)
>       t = FIELD_DP64(t, ID_AA64ISAR1, BF16, 2);     /* FEAT_BF16, FEAT_EBF16 */
>       t = FIELD_DP64(t, ID_AA64ISAR1, DGH, 1);      /* FEAT_DGH */
>       t = FIELD_DP64(t, ID_AA64ISAR1, I8MM, 1);     /* FEAT_I8MM */
> +    t = FIELD_DP64(t, ID_AA64ISAR1, XS, 1);       /* FEAT_XS */
>       cpu->isar.id_aa64isar1 = t;
>   
>       t = cpu->isar.id_aa64isar2;
> 

Actually, this or a follow-up is missing the change to
docs/system/arm/emulation.rst.


r~
