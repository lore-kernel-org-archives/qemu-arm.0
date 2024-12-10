Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp3530241njb;
        Tue, 10 Dec 2024 10:19:00 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXG9Fb/62+hl+DDzt5jl4eVmN0uX2+Ao8gDgWWSfcdLxh1XvkTT1rNNklgZh2DYCuV59nkmmobn4pcxrA==@linaro.org
X-Google-Smtp-Source: AGHT+IHxz3SE7Xybt7a4XXLg1WFVzoLjh+QKYogY0auozgaW7uRgKDGWKOJykUVrwuM/nLIjQo2y
X-Received: by 2002:a05:6214:765:b0:6d8:8e0f:8c0f with SMTP id 6a1803df08f44-6d8e714bcc2mr349608476d6.18.1733854740626;
        Tue, 10 Dec 2024 10:19:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733854740; cv=none;
        d=google.com; s=arc-20240605;
        b=ZlNES2xyw3vW0pn5IDmq/3n4e77LQtDcp6K0L3GQ6FTwS4v7UB3PcRqRhhXM1n5aJm
         ivri0k4rOtuRUKscqn3CbtDdEeZmuGvRFQHOKGHKK2ZvFMeRPoPbZUWX26+Hqb9YfidU
         iJDGdXqwO1zrMUzgqwiyKTxJN5+wBWAKYIDSliU2AXS1Sji5JiaT6EmTS5QyaSEekFdM
         ZLORC/z2XQOv7494XUk9stXb+FK/G5l5Xc9ujsA3Np2mGVd6eGvqgcy8KMTl56FtHrlz
         V6L/x6CYkX3hCn5gRHexM6MouVyX6HSQM3AR0MrjFl1ilzOmZKIvY+vyn11NfHAsSRla
         wLMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:to:subject:user-agent
         :mime-version:date:message-id:dkim-signature;
        bh=9u50bDGFqfWCUpO84O6hzvmZDql3vfa9WDifyVrScnE=;
        fh=PSKeeeDj2SsA7zSNFYyt/PowdXLDkKiupuh9gow6t1s=;
        b=WjGk9/h2ba0eX6weCg8VpXW2gGNTGEjB9Rnld+1SnwtrJKzf1gVVL9/SIUoh0E/62O
         i5fu4ZrOjmQGrRdh01Jzlq9YyiF0sus3KDUzSgswD40ABcnhJ+Q+cgSpGpguHtQWv0t0
         +i1i1KNHZDCKBw5zQt6vmyXng5pi3YZdwShDsERALYcvn9RLed7ha+LF9/scyhfEyFJx
         4AzjsYRAayluK0KjCXPAm6ASgvYoQK8XTJttUXEApEAq0Vbjvxn1gpyTVEDD8uxyEyUv
         4DKCmw2QBntNtFMz/uMVt/qdiB0MgiM03DPV6NqWo9HuFHAx26lEQhxnZRH4etWqZBJZ
         C75Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m0rjZN0G;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d8da69ed38si149636496d6.128.2024.12.10.10.19.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 10 Dec 2024 10:19:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m0rjZN0G;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tL4oq-0001sz-Nc; Tue, 10 Dec 2024 13:18:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tL4oo-0001sI-Ob
 for qemu-devel@nongnu.org; Tue, 10 Dec 2024 13:18:46 -0500
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1tL4on-0003JK-5q
 for qemu-devel@nongnu.org; Tue, 10 Dec 2024 13:18:46 -0500
Received: by mail-oi1-x22b.google.com with SMTP id
 5614622812f47-3eb7934a948so259194b6e.2
 for <qemu-devel@nongnu.org>; Tue, 10 Dec 2024 10:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733854724; x=1734459524; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=9u50bDGFqfWCUpO84O6hzvmZDql3vfa9WDifyVrScnE=;
 b=m0rjZN0GFRFpZoN+eWZA0zMSe8+wUGyGjqMOGLewMT8bDRQEiKgkkXvPDXlAl9lMhD
 vE1KgdS0Y4cDDQWDkEGeEaH5J4QHoQqDlUSI+IfkflttTb1l6N/jXXwIRHBMil+LvA1A
 /LDOHbQrRRMNSl0edqAbJ38gXiWkxDD9f6u0CH3T6Jmh1mfRcson1oKjMcAPuttCNxtK
 fvPAWA3aptKMQC1qtSQOrkp/11UchIqufnqBJYRrYNrG1FjJjRNeDsOqPRPPdaoh2X/v
 ekhtdNCvVzeNt10rJuLuVnMG9J3DWRJ/I1/46f94186AX31K4Kp+03DQ6WRst/lfg6R+
 fUnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733854724; x=1734459524;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=9u50bDGFqfWCUpO84O6hzvmZDql3vfa9WDifyVrScnE=;
 b=JO2nrEqDy8XcvohluXxJWDkRDYffDtr/eUMk8+CGP8CnlqJcY9hRWNxtfESUqkSiZk
 9MY+pZVBhEPIcx5IDBp4YtNGk7KwD8C0GxA44uQcL/ZU0Wi8kXjAwSBW/3L/5hhLVmMA
 h4LTalGpj5xkQDhEb8wE2+QkiXdRwolP1MrXoahVNo2x/Cfn8i+lJ9W/5lbYhT3kMTI4
 GaqgWSveY7iWnZil6qlDcxlCOxqNTq+yH7epoVmUXfCwmv+/v9Up3lcG79lbo0+c8Jag
 MbV/+lV1kCSvVEtowCvqvxn6kpInkYU0wV4s3jQRQeRf37Dvs+f+sml0zEdCqEwbO0wp
 1JbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUM1wwS0CgPG5UxYAIlGov9XkaylL3kI9a3lz7XfMVnsoN1tiz03DPigndTW8XOJxMzhOIZZekV6Axq@nongnu.org
X-Gm-Message-State: AOJu0Yz7K8LL2UfcEJDBK1xgsV41yke2NFuDMwp82aVFs30zj84u8CYA
 SXooiCM8OA5AE+724AGV1m09+/8TSl+bCSD5v45trJdzaQ4uIuEjGRbsLhKuzrQskj2DDoPkYhU
 /TqO+F+8R
X-Gm-Gg: ASbGncuhB4P2d7GMrfAzeW891CnnshztyKFloZy3m8eD78exOx2h5dF/kcah9itK5xM
 AuT5FubJBS/aakw6lwFnj8aor3yHVKkrFJwdCDt14DKVWr8ZVDjKOqGKo8h/IlLz4dWzQtMwLi5
 uSFsZ3sH0mmtSU0ZUbn42ULVn2Qos6/5Rd8YrR3EGx+rLySLi2DjTh2tQ3bO3Htbage0mmBpawz
 BhcUl8sFYvxbvSm36PD5KKHlgoBtQdx+y3j828R4/oLCSi3v/XVEOJ8Jpi1YyL51JBIhoo=
X-Received: by 2002:a05:6808:ed0:b0:3ea:5a9f:a325 with SMTP id
 5614622812f47-3eb19e0d4efmr15015937b6e.36.1733854723894; 
 Tue, 10 Dec 2024 10:18:43 -0800 (PST)
Received: from [172.20.4.119] ([187.217.227.247])
 by smtp.gmail.com with ESMTPSA id
 5614622812f47-3eb076b8e42sm2890705b6e.18.2024.12.10.10.18.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Dec 2024 10:18:43 -0800 (PST)
Message-ID: <771b4633-a719-4bc2-86c5-5b4f1017b2dc@linaro.org>
Date: Tue, 10 Dec 2024 12:18:41 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/10] target/arm: Move TLBI range insns
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20241210160452.2427965-1-peter.maydell@linaro.org>
 <20241210160452.2427965-7-peter.maydell@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241210160452.2427965-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22b.google.com
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
X-TUID: aranDXxwNmZQ

On 12/10/24 10:04, Peter Maydell wrote:
> Move the TLBI invalidate-range insns across to tlb-insns.c.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   target/arm/cpregs.h        |   2 +
>   target/arm/helper.c        | 330 +------------------------------------
>   target/arm/tcg/tlb-insns.c | 329 ++++++++++++++++++++++++++++++++++++
>   3 files changed, 333 insertions(+), 328 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
