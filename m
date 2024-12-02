Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2835610njk;
        Mon, 2 Dec 2024 05:50:13 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUa4nRZxBEZom2RglGhW3afVVM8/becmNmCXpdowYzfT2z8sg4Ltr5vO9sDu2fEJ50jqwpCw3B56/8stA==@linaro.org
X-Google-Smtp-Source: AGHT+IE4kMyA987mHBSRYw1S0hUYsvGwpAQ+0QIlHGj+kFMAoN9QJtNzPd4HjL+lv4+zF3fxsYUj
X-Received: by 2002:a05:6214:2a46:b0:6d8:7fe2:8b31 with SMTP id 6a1803df08f44-6d87fe29b71mr229737786d6.23.1733147413773;
        Mon, 02 Dec 2024 05:50:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733147413; cv=none;
        d=google.com; s=arc-20240605;
        b=dplZX1DXzFoq0noSAr40MQGLkvey76UYgRQfQXb+idr9k1g/Iq8Qom2sBaqpTenWuB
         3Rl5SqH1XomfLxfSK4t94MFUfx6vPxDdVW/SZXR6Zpmn2E/7YcHN8gljKIdt5Ukm483+
         CYDQGSdQRWTHMLDGSUrwbfhes6+M8PAbvvF1tORus/ygJLX86SJHnLQBsUxODUAss1kf
         ykzBetiMDYqnHSU4Rl2yyV9sRSNxZak2XG+naRjf8Gv/WXYQpV8RqZPf6ZnRiE7Bs1Fz
         wosE+oXFgesTNrUer7iHKRvPl6n8f0BuOK8Axd79wNaIdrvnEYCYKLoMwZF/ces6OUjO
         YIbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=rmX0g0MGNNVbRpmpyn/uwOzxAYd3z26y3Y9icJ1a8Uc=;
        fh=UMlouvVl3Ph4Ne7UvGTvosqVcNxKyKMHDiGsZppDwks=;
        b=EEg01t8dH3MpKWDxnCIQGtLH9aGkJHnEnV94pTO1izF5wnC0V8T4eeHqJl2ZyJMlhM
         wtDc1U98FtYJ9/OmTnDXjZW2Wlra/k+pRj2o1C1sGbXn8QvW6F2GkNXt6ZxgurZIUipt
         IL9pqmwuOTCHF5Q9OoWYZKYzarZAlHuw2CfDVkP64VIknfchA/2E5Y9HxlbfD7vDDVxN
         XusFSTL+kC1MmDdXHXuhDOEO3bDY3GOsM9iQg6Ds3qFIs75jcz9tdKRXdV6SOVBat+X9
         iO9izfTIwBc82S4s+Jmrr1xfPPoAs87RR0Oef2C3hrCgch+UT8SYz0hNLQvdKx69EVHm
         coLw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iN3QzQWb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b684923d04si1467886885a.26.2024.12.02.05.50.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Dec 2024 05:50:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=iN3QzQWb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tI6oS-0007PR-0m; Mon, 02 Dec 2024 08:50:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tI6oO-0007MW-9U
 for qemu-arm@nongnu.org; Mon, 02 Dec 2024 08:50:04 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tI6oM-0007ZK-C6
 for qemu-arm@nongnu.org; Mon, 02 Dec 2024 08:50:04 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-434a1833367so25095495e9.1
 for <qemu-arm@nongnu.org>; Mon, 02 Dec 2024 05:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733147400; x=1733752200; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rmX0g0MGNNVbRpmpyn/uwOzxAYd3z26y3Y9icJ1a8Uc=;
 b=iN3QzQWbBcF63G7XLudAmwBnaSYvoQNur8FOyPP6Ni2GVbZQNfSlgJAq3whf1MiZ+v
 3OxYFak2C/RRIHCrDwsZ4pWmi08Vgtt+JOZ5SrRxseO20AXl9vc8a0Rue7SJtnTBFkRj
 GKeJeDQb0dapHUjP9zGLcT/B5tkd6+pkTLgk/JwCtgmQ4wmdwznWn9ogKC9m70DNuadz
 DIhno0lNlX3WmQaJov+zZ/d+vDy2MEp6wJKPAY6V1wHfcHS0dpdRlCjgGqMOdGSYllgr
 wZs4r9LeXzBbbM/8VzmoQmc9YmGYTMZyckNl9f6+h5lZFV1T5fDCvLDkOixhbCwAgOye
 oiHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733147400; x=1733752200;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rmX0g0MGNNVbRpmpyn/uwOzxAYd3z26y3Y9icJ1a8Uc=;
 b=WkBaWp27lc3unfUld8wUCx1h634DPeuYcOkfPjPsOn06YBOkfzeJoiwazmtefGmWcV
 LHpwe7nRlfk34/Dquys/dTs+Q1qlSfvxJjAcfPgbAKZpPT29PhIg6ffm/7jJZZZBrYe9
 0TP6XW0N5Az08W/9qvR9HZR0tZLccecrsWwTTDSmI2jORVkngggiiDl0M7Kc/qjKWPlS
 lqmwDKApMQDXIchPMcNszEpfjvs0gQyjTlLaV1TWeVyKWDMSum2RFqseKiAJIV1WgMq7
 q7GfZMzapdLGf5BVCcXB0fmqzXgqG2VZFoxhr2M06CDZqaI2Cwhdr1sK95T5r0aW9FH5
 eYVg==
X-Gm-Message-State: AOJu0Yw2s45XEyQtBOj6Admr1VITT72RGW/lyDTZhEMkHla6sDlzU18J
 tIN2r/fZuT1Eb9RBY8utYSgtJO+UazB3oqqu2DWPkP8dsANLnYxi4/WHK3ZhHU4=
X-Gm-Gg: ASbGnctKVLIQEEgK0ZIUzNUOM3jZFJqfMUJXPDZXMKdJQtNq4w7XzTLB1vzjJZe76+Y
 FybmQuQbkkCzPxbdGjkwvjfHHjgnfB/6GmEULc1nabDElyml2AhfNRRBhdaRduIR/1t+k28K8Gb
 8nTct5LMkG5JCFDHmx8gEzfZfD7EqPjZQ0f+1NKqwC8xm4820l/Q3Dt1862fbt9GFrvuik7YuI0
 Q699d1IfOj+px0UOOtGVgVFZYxzgnsyHPiqILfKfreQrVTKlgDuZ/BiE1lvqyBBwNGuacdqzitT
 CSpLISVz4OAd6fpdBVdvBYnugZ7qsQ==
X-Received: by 2002:a05:600c:2d4b:b0:42c:baf1:4c7 with SMTP id
 5b1f17b1804b1-434afb94427mr141024645e9.4.1733147400170; 
 Mon, 02 Dec 2024 05:50:00 -0800 (PST)
Received: from [192.168.68.213] (72.red-95-127-54.dynamicip.rima-tde.net.
 [95.127.54.72]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434aa7e4df1sm183942675e9.39.2024.12.02.05.49.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Dec 2024 05:49:59 -0800 (PST)
Message-ID: <e0fda20b-56c2-4195-bc64-a75104e277a0@linaro.org>
Date: Mon, 2 Dec 2024 14:49:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/67] target/arm: Convert UDIV, SDIV to decodetree
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20241201150607.12812-1-richard.henderson@linaro.org>
 <20241201150607.12812-3-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241201150607.12812-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
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
X-TUID: cjfHpm5xrIzn

On 1/12/24 16:05, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/translate-a64.c | 64 +++++++++++++++++-----------------
>   target/arm/tcg/a64.decode      | 22 ++++++++++++
>   2 files changed, 54 insertions(+), 32 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

