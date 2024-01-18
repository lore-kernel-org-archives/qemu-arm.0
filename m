Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp338579ejg;
        Thu, 18 Jan 2024 07:21:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG/b8gMLrps1FmXp4egPGzNmQMYKAx4rULiLOqYptzfIrWkxNcHIvDr0vm56CTs3pGJR3UH
X-Received: by 2002:a05:600c:1d16:b0:40e:4d1f:ce11 with SMTP id l22-20020a05600c1d1600b0040e4d1fce11mr302764wms.289.1705591265291;
        Thu, 18 Jan 2024 07:21:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705591265; cv=none;
        d=google.com; s=arc-20160816;
        b=PGgk5vCiWt3lcj3VqUDg4ypspyQLihIyEFQvimMYZc9Ic4UymFbfPx6T0yAsJghnvK
         aANkCaB8UFvkTTGn/6Ferc592OUwqOqgSKtx1bKebBcpNaZRiw0mAgeN0aO6j4FlseMk
         AbeoZ1xpQGApbTxQsfOl8mHXa48GHJUHoBYl1qfNhXbDQ3BfKUUNbk9QzOdH6lyVG5Qr
         s+xUpIGmOrSFT8tyME2pvXnL8boYGY6wQMHYrg7PxIT5t7ZIYEAHWU835mZWd+aahxVG
         BedxKuqnmpiDsq5coIaAOhorLFIkmESCE8jAKvZbnl/W/Xp+q7PgUDP7HFhm3rNY67wp
         8Dmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:to:content-language:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=WlkvkmGu3v052Jxiy0qSWoXaSU2xt7d1c5IMx6XOSLw=;
        fh=+xj4Yfkfa7hWRbLS+DTrcNY2o0evBrBbm0gAigyTnIw=;
        b=JeiH5uEmr9c4Wf+NQ6y69H8Onum8KDJvU2JK5046C0xxLmYd3/N0PYcztW7+KmCcts
         wd/xEWvV2HPmoVTEsBgw9m2KFmYbW/eJe+VZXxKKgLRuK16dpRYAalek12pQgfcp3WJa
         3x30ezf6FApt847spU4Vn4UM5mSthQlhRSPD9RoTNgSo8zG7b23kisRkD4M1foN1hcNp
         ZQCZ9wPW3+i2ExcMK8CkaMjOgzxzYWEJQgcEu6ufFgxS+iOq4av63iyXK+jLREFUShp+
         jXVphxL8NUBpIe2X3++9CPBEbbCJEOSS2O22UQEzsnxYXtd1FBpsC+XjCgeXep5Ejt8Q
         gMtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AUnec7Wz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j21-20020a05600c1c1500b0040e512942fbsi9878168wms.217.2024.01.18.07.21.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Jan 2024 07:21:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=AUnec7Wz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rQUBy-0005Ao-1w; Thu, 18 Jan 2024 10:20:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQUBv-00059T-VR
 for qemu-arm@nongnu.org; Thu, 18 Jan 2024 10:20:27 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rQUBt-0005qN-Pm
 for qemu-arm@nongnu.org; Thu, 18 Jan 2024 10:20:27 -0500
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-3366ddd1eddso10134571f8f.0
 for <qemu-arm@nongnu.org>; Thu, 18 Jan 2024 07:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705591224; x=1706196024; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=WlkvkmGu3v052Jxiy0qSWoXaSU2xt7d1c5IMx6XOSLw=;
 b=AUnec7WzuqyJ4qusSg23qgGil8iyl6fQxVnZ1GNo2iY5b+rgxeREJSzikLQOkRGBfP
 7bSQ9zTd4JW8KIbIR8RUz+rqEX+aya6kXTqx4Dun3i98JDnoBvpciNLNQT1N0OYtLyqG
 9NhnoBPBlXMMU4R+8zVi3qTDOBq7GrzYvydkFQ3KTkZ2MA2k5CAe/4Jbs8QFBagJNqaE
 8H0vcY72oox16Oaqe0LMTnsSyylnAIHmdF/oqxG4tOkoJiTfo+YM6kezw1+JfTeAe2bL
 hZCbkqe2Vo5Mt4X0DYbMZ272ox987DHMn3T675D7247vTVatbr9aHR7vdZFy6NF2Glrb
 FGFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705591224; x=1706196024;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=WlkvkmGu3v052Jxiy0qSWoXaSU2xt7d1c5IMx6XOSLw=;
 b=phSE25aeNW7dMyB9Rt4FqVU/P8HbTUlsVFLxvE2Nn+/Msyv37JteebfO+n55lArZG3
 0RhepSZxsqMEz/UCvkfENN6Fo6jm5LAn6jBQkFY0eLQ0+Rbh8dj78QOZYnWdPLeE0Wbu
 MPgA7bY/zwML8Qu+om6ko69Mjy1Th7FF2NFDYG3FAdEDL6GDpBVPNJYx1Z3z7mLla0sx
 XmnPvyZ6qjI8SNWD6dKoOCTvAlDYG9G9mV3Q1xIPa7NB7MtIfIZvElHu5zz7BfFqbLfT
 kFpBeFVkBqNZMHJ99ELdZ6Fehxbbbkrww5wLmVs+zRqmPUTf8eBrDwfH/oOqBabAP11O
 I8MA==
X-Gm-Message-State: AOJu0Yyt//IZDP1s2o4j/L8CRHmSPeeYNwTqepB4wusUwsV6BnhlWpqe
 toSKaAo5XEoicqCcBnr69eyA+E6qirI94q2WKNeEVrGyEeX3DGQtFHKbr7c7BhI=
X-Received: by 2002:adf:ed02:0:b0:333:2fd2:7699 with SMTP id
 a2-20020adfed02000000b003332fd27699mr304313wro.138.1705591224201; 
 Thu, 18 Jan 2024 07:20:24 -0800 (PST)
Received: from [192.168.108.175] (33.red-95-127-38.staticip.rima-tde.net.
 [95.127.38.33]) by smtp.gmail.com with ESMTPSA id
 d6-20020adff846000000b0033725783839sm4256057wrq.110.2024.01.18.07.20.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Jan 2024 07:20:23 -0800 (PST)
Message-ID: <1f34e941-5b0a-4091-95f9-0d0c8e302aa9@linaro.org>
Date: Thu, 18 Jan 2024 16:17:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hw/arm/virt.c: Remove newline from error_report() string
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20240118131649.2726375-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240118131649.2726375-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-TUID: hPQIhCgRK230

On 18/1/24 14:16, Peter Maydell wrote:
> error_report() strings should not include trailing newlines; remove
> the newline from the error we print when devices won't fit into the
> address space of the CPU.
> 
> This commit also fixes the accidental hardcoded tabs that were in
> this line, since we have to touch the line anyway.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/arm/virt.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

