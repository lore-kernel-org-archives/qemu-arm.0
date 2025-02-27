Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp542288njb;
        Thu, 27 Feb 2025 14:16:14 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWuJc/4lhzaWYly/vS9vU1HuBhmtD7uVy2aTN/1IGtic3oGRSgZehU4TVsT0Wl7Yfny5Jc8sqqGC34K+A==@linaro.org
X-Google-Smtp-Source: AGHT+IFQo9SmdJxgBegNqjQngg5O2zBNN7tr3xiiDaI7GG1QUT7rbYEiZD6YzY1dnm++7f/7VGVs
X-Received: by 2002:a05:620a:3f97:b0:7c0:b018:5935 with SMTP id af79cd13be357-7c39c4a2a8emr206888785a.8.1740694574810;
        Thu, 27 Feb 2025 14:16:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740694574; cv=none;
        d=google.com; s=arc-20240605;
        b=VKM1r5IzRPI+BcbNoIW0rnfBiKx6kUD9yYtuCOgeaU+i+od3givDDr8heX+W0igVgo
         ihajLbmKg5StvNJHi4nhqtR3s/hYvrnP7WHcScWU1GLywTOQZHfawuP6OlU3DXyfI6hs
         RAn4Gh52rd5RRqjdIrxbbSpaN47OKLPgYHqjFLpu4Zeqc+DIa+yxd/3HFeIKYeTxO7PV
         uHHMtJoHqh/SAptw8Cg5y7FORRAWzpVva3/ZlNPGXVhoPaLKe1HpSbqeF8iBMECXMMpy
         mCNYipm7TJWbKbFNsHY37yN3f2wDX54gLqKMuEv/AuBVEEbLjyJSQ2dZgSDD/QfhwjQ9
         TMZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=IegA5Dj/ThsKrckUWQ9Ykj9y/UmPIxtvY71qVVKLfM8=;
        fh=9jfLVNorB3gEB3Pzj96X5VFByrSvbf0aJfKvZ22hdRQ=;
        b=OKTthG0EJPR5qCqc6jzK34seWZUZrxFK9uNKwtzkt4VYM7IFbNCNQfGtC1RIdWyFLi
         Kk+ObCv9NIOrp9cTaYiSHmuL1Iz++eXcAibjKTCE0GEsaYhNzSQdW1PGZrf7bJhGv0r4
         G2HXg+1QVVPtMJXcat1+TTaHOAdWkm/y8tXDZK4CyBaFBr6uMNBpdPhDBEskZFJXByKL
         7/B6ChW5FVXfNtTGN2vtd2fEs/cLZ6WZjEPc9u4ceUkMk8Q9YPsHNYc6D3tb2/zbAcjD
         bvhxvYdUXLBummHrxLhWqF36Isp3TPvtwsMDyiii0ytQ5UTeX10odCEAWHGSIWlnJ8WP
         ndqg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uNHeo788;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c3749dfe1bsi191423985a.442.2025.02.27.14.16.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Feb 2025 14:16:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uNHeo788;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tnmAf-0008Pb-If; Thu, 27 Feb 2025 17:15:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tnmAc-0008NJ-F9
 for qemu-arm@nongnu.org; Thu, 27 Feb 2025 17:15:54 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tnmAa-0001a8-5O
 for qemu-arm@nongnu.org; Thu, 27 Feb 2025 17:15:54 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43989226283so10047955e9.1
 for <qemu-arm@nongnu.org>; Thu, 27 Feb 2025 14:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740694549; x=1741299349; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=IegA5Dj/ThsKrckUWQ9Ykj9y/UmPIxtvY71qVVKLfM8=;
 b=uNHeo788Qf/ivJtpoQ/wm4wVHvLAXSrq4gzkSfHkPYu8zcgCs9gEzoLd2ehct/FKP1
 DTLEvmYVLu6r85Hsjm8pz7uWQcowiVcxRKcZqe1k0+FPCuRv2mouquRm3i5VPHKCRg6C
 nRUugyRNxmO3C7hn4xGNwkecRQjHsFSunU5uhGjNQz5CCxbN1T+Uzc6XkJt63Nz4xyXI
 7o1u8odPAl/u4y6URelBrIStk2op87MIu7tuVg/OXsmg9W/X3VkuGQTWIodwTI6Z0+s+
 9OKrjryuDwpn2pa1lWXJoPtD4quQcCGbUM4qFK0IVKa/0GDUKdOg54A/qOz1X5fbTm/d
 qaOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740694549; x=1741299349;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IegA5Dj/ThsKrckUWQ9Ykj9y/UmPIxtvY71qVVKLfM8=;
 b=ENC+tK+nww2EVCWTslcl0zArQdUdLaU/XhGIxy/GKxIu0cnEH+Qlg2WKeBJSm96g32
 CdLlbCcFhV5X1oX4C1PUoUzOWXzaqpb6vwgXOgWCzbntQSPsLHz0dEq0wkLdF1tG2hO5
 4jJuwconPXtsaAhUOzLI/a9+d3LbnNRvyr3NtdtcNb+/c/6mjgtUKjWLKi8FFbx4Lftq
 ttqiE6tGqyH6M9hV4cjeMFX/uR8iQAnSdK7eoZ8Nl2A+N0wDypJg/eAjr5ER8DNnjyRG
 gTUn5kmjhJM458ZZt2B2oPOgnIR6paKMHnGGIhh6COGPRIQCxbaALZYtgG6RN3MMTsea
 Y63g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVsvUX3q+hH42a+KibeVQJ+q4xJA5T6LGMFtIL/Qf66iOll53pO1DJ/Oqqa7AyPamwk2wGSykYj2g==@nongnu.org
X-Gm-Message-State: AOJu0YyQ3ouwofJ0vCa0DOAiE6rc7jFYk7tJyUtUjn5Z18n9fNJpgaJb
 u/tqwWlun1xEE3maxPM2zpB0tfqPviU78mEAdDlUp9xX3OY8CVK7HSO/J/YDGaE=
X-Gm-Gg: ASbGncvpqz8Y8tym3ZyzARjLBenlZYItst23f4sD7pDVA3C1H0sqTStxBa6S/t+xoMG
 sKMyjMk9e8PXXtmDjHQ5vWVmjZxAt+ElQhCi/oJfZhHbSSL3ga90uRtJM6mUOYbaQ69tZGrIawO
 x/+yHopfqwcyZrxZ4Sjnv9EXyuDeQEpyUsEqOtypaScuYMxOaKsXNrkIrh2FTXMqgI0KhdtEG3+
 pAo+BhNhsI2IIQNf3pq/3M5XIy76QnOmoOI5sa0neAZtDfPj5ojZN05R40COKn8IRpFcu0QvKBm
 L0+wQ3VXyYPcdbbsGtNAXsjaM1GOrUmGzVk/Zn5Rl7JBHZTBWk3vd9EZFG5tuvjod29ATQ==
X-Received: by 2002:a05:600c:a45:b0:439:5747:7f2d with SMTP id
 5b1f17b1804b1-43ba6758476mr5477615e9.21.1740694548931; 
 Thu, 27 Feb 2025 14:15:48 -0800 (PST)
Received: from [192.168.69.202] (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43aba53945bsm68273605e9.23.2025.02.27.14.15.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Feb 2025 14:15:48 -0800 (PST)
Message-ID: <8c4bb9d0-6dc1-409f-8fd1-4c711487b46e@linaro.org>
Date: Thu, 27 Feb 2025 23:15:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] hw/arm/omap1: Drop ALMDEBUG ifdeffed out code
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20250227170117.1726895-1-peter.maydell@linaro.org>
 <20250227170117.1726895-3-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20250227170117.1726895-3-peter.maydell@linaro.org>
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
X-TUID: bgMlwDUbXgi5

On 27/2/25 18:01, Peter Maydell wrote:
> In omap1.c, there are some debug printfs in the omap_rtc_write()
> function that are guardad by ifdef ALMDEBUG. ALMDEBUG is never
> set, so this is all dead code.
> 
> It's not worth the effort of converting all of these to tracepoints;
> a modern tracepoint approach would probably have a single tracepoint
> covering all the register writes anyway. Just delete the printf()s.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/arm/omap1.c | 51 --------------------------------------------------
>   1 file changed, 51 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

