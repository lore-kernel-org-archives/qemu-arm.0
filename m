Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp558943lfb;
        Wed, 13 May 2020 09:58:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwA0p2Nv0LYPTYcX3sD9Bp7Vhl4vgESinOCCEoehbwgg5ymxnhToXygSlmHonNNS6lWWBgz
X-Received: by 2002:ac8:6bca:: with SMTP id b10mr81466qtt.34.1589389132430;
        Wed, 13 May 2020 09:58:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589389132; cv=none;
        d=google.com; s=arc-20160816;
        b=hyEEffogLPJ1GahxH4nWaNDpaIaVrheKVeX6j84q79w62DMMRY8AYLGSFh0iH1nC4j
         Jj5ejHMZwZALz+UDJwjXlExdokwqXii42DpVLhNRljR52QDMdvIYnnqMVnJ3MoJVrR4l
         1llO5J3B//IBl459bhOSY1X/7xLb0NG0qJBW7bFMUwOdo41HyiKdPQsFHsiUXLxptY8S
         ylnePtpRZjFBzddnkOaBKAO+dEL0cqhCG8LVpa44XunHb72Xhbye+EumydxxA7U5E0Zl
         MmOV+KMB8j0y8S6lD8OGL7+OfQNs0waT4wYj0B5WWS5tbu7eYgSLbnZkL9nOnHkdiflG
         jNWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=sp2HP3/PrI5QhjSdIcvc+EqfDcL2JWXfL+I/kucgoSc=;
        b=iiZSuXEebNgnkqOKPjMC8k5XdF2sRsu6fld5UcXii9IrMSjd/msldddmXv91+wkarI
         x8Bq7/kHRWN4McBqwKQHSiP0QIg9KTgXk3JntiL3JwMWUE+5/AG0V80TBbdLf+MC39/Z
         pEXufuWHrYEao5dLGaHRnkyaqbw4xzHvN4rJ6aFyMb6uE+pWpaNwpFDl5JXYVvIT451y
         WELyyKG2ISlX1yYSEDjg1ZqVLW2dolwQcWQR4eIU/3GakjfDvqEHFaUqIREa0z5wz4/N
         8cY8nd/BLjhOd3fRzPOUE2V1ajleeb/kQJEtsoDvHL+7j8dG5yXVD8E3o1NTnrmrmAAq
         rYMw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KZejRUUi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y5si24509qkb.120.2020.05.13.09.58.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 May 2020 09:58:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KZejRUUi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jYuiZ-00075U-TB
	for alex.bennee@linaro.org; Wed, 13 May 2020 12:58:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jYui3-0006PT-9Y
 for qemu-arm@nongnu.org; Wed, 13 May 2020 12:58:19 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:38452)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jYui1-0008VK-Dy
 for qemu-arm@nongnu.org; Wed, 13 May 2020 12:58:18 -0400
Received: by mail-pg1-x544.google.com with SMTP id u5so13385pgn.5
 for <qemu-arm@nongnu.org>; Wed, 13 May 2020 09:58:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=sp2HP3/PrI5QhjSdIcvc+EqfDcL2JWXfL+I/kucgoSc=;
 b=KZejRUUi1LNZj2OlwMdrRkhefCjIG199EtkhIcF6k/c6XPwzTMrJF1OqaX/g07uJKM
 Dp5pGg9+6U6Ntdj+H8QrCSuOQT0Nwfu/oU6vbDHIEw/exwcbZzdWJowC4jh8fi1Dv7EO
 opJqHBw8nHHmD+nLh1Twm6AJpMCDBm33WefufbzUESmhOK1NYXfQEGYbdMn8oWB9kNNt
 l7b1ni3IMBTneMa6whkiIYvgPcJW1de01sApQNsStyn03biuBiL0N8yltvx8ZpL5PUnk
 pcoBfKMSHBhDikzruOTAQhGjtViplxBDk7md/9Bvhgbat1gh6GFC7n6Qp1FaWnhv+hMj
 FvqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sp2HP3/PrI5QhjSdIcvc+EqfDcL2JWXfL+I/kucgoSc=;
 b=fhIcQ+cnaR+wJMXWX7AGVHt5KlpoaAL7H+893mmMxgUllMufn0vGelBjKFO4s7Lxif
 Nmg/C0YNRpNPncS7eu5JNXzT16ifyZh+AFbcqDkUTsRVBMnFnhrgWYAXQwfiWf2LO8D0
 8iFD9ZwIBeTeCQ9+9kW9w3LWS1u1bySoyRftGA8JRLge8FA8R+SwpO12F1OssHQf/a0V
 b8bl/LOV4xj53HexsOHbXXjtNzYa0IlQeHk92wT6tPNWQn4+IaflW6ACnF1S7EWqOdDi
 4g9eoTSrQIT0PlaNxWxds16w2OG5MLIlO2ZDGuCmNoHwepzUk0Bm9wnQNvqk91LkYNaM
 N1oQ==
X-Gm-Message-State: AOAM532GiI2e8mAdmxtLfChf+6yhqXmjwv3gpLPOReJBdqoSMBrME59o
 uLVcP08zgPpTRn50j1UyYQj4og==
X-Received: by 2002:a63:3342:: with SMTP id z63mr242932pgz.49.1589389095092;
 Wed, 13 May 2020 09:58:15 -0700 (PDT)
Received: from [192.168.1.11] (174-21-143-238.tukw.qwest.net. [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id e11sm201851pgs.41.2020.05.13.09.58.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 May 2020 09:58:14 -0700 (PDT)
Subject: Re: [PATCH v2 10/17] target/arm: Convert Neon VQDMULH/VQRDMULH
 3-reg-same to decodetree
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200512163904.10918-1-peter.maydell@linaro.org>
 <20200512163904.10918-11-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <44be2984-bbb9-0244-7587-de109add185d@linaro.org>
Date: Wed, 13 May 2020 09:58:12 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200512163904.10918-11-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::544;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: p9q0ApJ0ZOgQ

On 5/12/20 9:38 AM, Peter Maydell wrote:
> Convert the Neon VQDMULH and VQRDMULH 3-reg-same insns to
> decodetree. These are the last integer operations in the
> 3-reg-same group.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/neon-dp.decode       |  3 +++
>  target/arm/translate-neon.inc.c | 24 ++++++++++++++++++++++++
>  target/arm/translate.c          | 24 +-----------------------
>  3 files changed, 28 insertions(+), 23 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
