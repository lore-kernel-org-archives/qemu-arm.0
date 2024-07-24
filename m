Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp2912418njc;
        Wed, 24 Jul 2024 00:06:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWic6OBm19McdOgeu3yetDhaLa/c1bR1bEkB5IdY/dQt662kDIctJvZixRGLMCgXDZdx4Er3E+8vhvH9aRLI8bnsn/SgaKJ
X-Google-Smtp-Source: AGHT+IG67iw0914oig/ETnLxy3EibwLV9wlaukbtxvn/t7hrV/KYxP1sWGUowBCooJ7jPgv3E3MU
X-Received: by 2002:ad4:5006:0:b0:6b4:f979:1e03 with SMTP id 6a1803df08f44-6b9915600cdmr14433906d6.25.1721804809078;
        Wed, 24 Jul 2024 00:06:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721804809; cv=none;
        d=google.com; s=arc-20160816;
        b=V/e1G3tGSx7+IIoHeLE3wLFgUlBqPWTJWx6wwttNM6AUtwR3GLVqBvKO/5IEEaVmE2
         91FlRpGueU7a1f3LqEzAI58cesJumUe+eR0a18j4XZ1Cjb4sGLm9MrcE740pI03tRABy
         tJpfCaZv6oWnmTaVtZ847ZhPjPiwt8+NNZfixhO/aIh3NcH3fU+P82lYtxSzx+AIdaqu
         jn+x6DSz8DAtyD/Af2GsSnac1TLHOVsuPGjgK+ThVnOFFLKtPUbij4QTe54sNyMUZdvE
         0+mD4qff5fTeaAmFVEEvCPFd4MKVyeAlAEeEdsWhGHjQ7fOfOz+VzEJ/2A+nWQzfIlQ4
         Gkjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=0VOEf4SMR7NWJjVOU5A+IGYdFZ9IHLih+hGfTZfAK3c=;
        fh=pp+gdMAg5h198Hkz6Vw5BXljUj5apamgH0O7qBvxEtk=;
        b=gX+EuuQGcrqMy8zLBYJSNBiSZr7JMVriGT3nglOnLCdogmJS04wSzvNeHzCprdZkdn
         BQUWLby7MwU7uL+jejYCt42b+oqniyuVB+nyUAfJZe06ZJpZdG/tiSMgX98z1aJpylsE
         HEc2z2nWEztkE5vIshg+Zu38ZcZaYd+IahK3xgGCEhk4Xu9Lotm3+KbdEFYysC/mPI6R
         OPRzRscLSNDMXzc732HSbSFm+xCgBqdyYcqVK+EHKcFUSvQ0WkPfZgD1l+jrICnHNfY2
         4RRYEjB68bOkN8fee56xL5KRboWVphu+xUM0P8UJ5p3GImtJyhKwgFsL3bX7EKC4e/Ik
         OEKw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nscFkSwX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b7acaf8846si120441996d6.465.2024.07.24.00.06.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Jul 2024 00:06:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nscFkSwX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sWW4p-0001St-Sm; Wed, 24 Jul 2024 03:06:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sWW4j-0001M8-7z
 for qemu-arm@nongnu.org; Wed, 24 Jul 2024 03:06:14 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1sWW4g-0004uj-9w
 for qemu-arm@nongnu.org; Wed, 24 Jul 2024 03:06:12 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-4266f535e82so46373085e9.1
 for <qemu-arm@nongnu.org>; Wed, 24 Jul 2024 00:06:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721804768; x=1722409568; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0VOEf4SMR7NWJjVOU5A+IGYdFZ9IHLih+hGfTZfAK3c=;
 b=nscFkSwX7iw21zsUUC+CKgnhMkSlPcM20Do+Q+T54r1Ix0dEPs7sQPf/5jatuqe8hs
 NRkZ64T2COGuxr/uIjQvsrDmwFiDkxNnKsh4WCrmFN5/HgBcb1m5ArKDFAj7vwYIEG6b
 ypwrRENpgFScuw7AC33u3b7D/l7mpKPQ/MwytnsIfhjCuuUpa7GE8vqG1yKkC/XjMqir
 jPyyDyE1nlJSAM3nKPFOcelzfUJlXnudbrUT0RFkmlK4d8Cyo/oGWhu4R2bZtF+L03Iq
 J3fwUcPmVftpn0uEDjufTxENYmc6qtP1jr48z2H0D65OWANOdo1ILZOeExqdKxDPl1oT
 HyqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721804768; x=1722409568;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0VOEf4SMR7NWJjVOU5A+IGYdFZ9IHLih+hGfTZfAK3c=;
 b=L10xSJhgXZe+U1lHh6ZXYUfSAgLlTBQcDnoP+Q6zsrnPDdjKU2V3DnyPcbjlhQWwQz
 /VB/i8+wOLv2u50MY6oQhlV0qyv7nRwfUoX1LMH/oz4FPOeK73at9jmHWT+1zjqPvn21
 ja6YrDlOFSckl+gvA3Za1rZfqzAYjSLKA2jdgFEBUcNhCd/uYznWNtBvTodsVdEpwkN6
 2TDk+4dacsgiQI30kXvqpZyrkMzymbanCrhfGbt+gaeKBfhVXfR+vTmYaYy6R9J1rtdE
 2Io6AIIzgWCxg0rFcSF+xFXO95EW8mgPFCU2JVR6I1rexSanLqHqORshRXtWxG+Bemyt
 iMcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrOYkhhjK/XcydydKdI+/h3As75ebzBYDRlyvkQIaqrdGsp5DKqbP9Ar+nib5eHBlAwQ5q9ryex6cYWVo5dQ841BTR
X-Gm-Message-State: AOJu0YxODu58PzGeqk+qY/SHmhKq2JlKMyMSuYPuzh8WhZewX4UmtstN
 rDnTZR8Mweedx53r+n8eAf10ZDMoYMvoTf0es5yJ0WDrat1TBEOox8jn4Xjtcoc=
X-Received: by 2002:a05:600c:198c:b0:426:6f81:d235 with SMTP id
 5b1f17b1804b1-427dc527e16mr90070065e9.15.1721804768147; 
 Wed, 24 Jul 2024 00:06:08 -0700 (PDT)
Received: from [192.168.69.100] (vbo91-h01-176-184-50-4.dsl.sta.abo.bbox.fr.
 [176.184.50.4]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-427f935dd8esm15461365e9.2.2024.07.24.00.06.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Jul 2024 00:06:07 -0700 (PDT)
Message-ID: <a8291990-e161-4a43-a1c9-69040f1f6f93@linaro.org>
Date: Wed, 24 Jul 2024 09:06:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] hw/misc/bcm2835_property: Avoid overflow in OTP
 access properties
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org
References: <20240723131029.1159908-1-peter.maydell@linaro.org>
 <20240723131029.1159908-3-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240723131029.1159908-3-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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
X-TUID: pLte7Qj/5MxL

Hi Peter,

On 23/7/24 15:10, Peter Maydell wrote:
> Coverity points out that in our handling of the property
> RPI_FWREQ_SET_CUSTOMER_OTP we have a potential overflow.  This
> happens because we read start_num and number from the guest as
> unsigned 32 bit integers, but then the variable 'n' we use as a loop
> counter as we iterate from start_num to start_num + number is only an
> "int".  That means that if the guest passes us a very large start_num
> we will interpret it as negative.  This will result in an assertion
> failure inside bcm2835_otp_set_row(), which checks that we didn't
> pass it an invalid row number.
> 
> A similar issue applies to all the properties for accessing OTP rows
> where we are iterating through with a start and length read from the
> guest.
> 
> Use uint32_t for the loop counter to avoid this problem. Because in
> all cases 'n' is only used as a loop counter, we can do this as
> part of the for(), restricting its scope to exactly where we need it.
> 
> Resolves: Coverity CID 1549401
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

> ---
>   hw/misc/bcm2835_property.c | 9 ++++-----
>   1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/misc/bcm2835_property.c b/hw/misc/bcm2835_property.c
> index e28fdca9846..7eb623b4e90 100644
> --- a/hw/misc/bcm2835_property.c
> +++ b/hw/misc/bcm2835_property.c
> @@ -30,7 +30,6 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
>       uint32_t tot_len;
>       size_t resplen;
>       uint32_t tmp;
> -    int n;
>       uint32_t start_num, number, otp_row;
>   
>       /*
> @@ -337,7 +336,7 @@ static void bcm2835_property_mbox_push(BCM2835PropertyState *s, uint32_t value)
>   
>               resplen = 8 + 4 * number;
>   
> -            for (n = start_num; n < start_num + number &&
> +            for (uint32_t n = start_num; n < start_num + number &&
>                    n < BCM2835_OTP_CUSTOMER_OTP_LEN; n++) {

I find not making the counter size explicit and use 'unsigned'
simpler, since using 32-bit in particular doesn't bring much here.
Is there a reason I'm missing?

Thanks,

Phil.
