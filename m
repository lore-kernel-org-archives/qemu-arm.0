Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp284497lfb;
        Wed, 25 Nov 2020 00:13:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwIoiU8uNp3OW1gnbw+NbNZsV8qEAcWjqXcgE9kXYglss46hsfFjv4hXG/rXnfzyvHpJ0Rn
X-Received: by 2002:a25:6ec3:: with SMTP id j186mr2283489ybc.165.1606292032140;
        Wed, 25 Nov 2020 00:13:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1606292032; cv=none;
        d=google.com; s=arc-20160816;
        b=cP8wwBHEmAa71Va4vMuqQicudgwvcwtNs9E5BWeFRCpZmxcT/ZFCeBWU0QSInLGkuD
         D/tpF4GBBNZ5/FI2gP1wdIhqzJkoK9DDhN9wLywPJwcgeZtUs7XcNyIbJK8KUKSur3w1
         R1xYpIv6qB4b1ehzle/konEgkphNfBgZ5cJ2oH97GmqyMeZ7gPXzkzSoBm6tyn5ArZ7m
         LPS7POXNEGn2PjXsSgV337PlXyqkObK9BafW0sUEYmigOEnn2Iy82FzYt4xjv9/ffnIi
         QZZ3jqObTpL3twcHYDZf5ufpkTq4bAGmT0vDpqKfF7vmVELY/jooW5DYDbWmRrtDzw90
         JaAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=Yza3QuMv9Til8gM8mBpOwRdYCHxSnYnR29n1qkHbTqE=;
        b=vovwiYSjigjp1vHlV9IHmjEkP/IfrSM/QzSxrZLEqNadwT2M8D+Yh2vB3R29R6eBaX
         CoQBchF24jv3lX61RBSNcx2Uj/MOP7PYFC3Bx/OFZZ3QLs9Xz2R2/dykRVzAGwqwiXVd
         7UDkDLKK+hMgXN8KR0VRomNs2M8DbPH2bWwSFk0jDEfyvB4qEhaGVqa3fbL8sEhc5ak5
         5nKOvRhb0XiaJam7L+Uba7puPURICwFWIlhDpvTQrvmvmqGdf+gatuB4NBOfP3l++c0a
         Ug3wOAHdN1Z0rVbO7fUs4EV1cX6rN1Rcpv8F6vlpKc7xmGra3lwir9QV8d2tihfre1xg
         ISiA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=uZsfh6+H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 198si1482438ybe.6.2020.11.25.00.13.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Nov 2020 00:13:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=uZsfh6+H;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Received: from localhost ([::1]:45266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1khpvz-00041a-HZ
	for alex.bennee@linaro.org; Wed, 25 Nov 2020 03:13:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1khpvk-0003s2-3C; Wed, 25 Nov 2020 03:13:36 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:52725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1khpvi-0001s6-Lj; Wed, 25 Nov 2020 03:13:35 -0500
Received: by mail-wm1-x341.google.com with SMTP id 10so1171802wml.2;
 Wed, 25 Nov 2020 00:13:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Yza3QuMv9Til8gM8mBpOwRdYCHxSnYnR29n1qkHbTqE=;
 b=uZsfh6+Hs28PO04QCPBz4ykhYdRz5+7T8RUeDFINpgIpW3aAtNp8Kpvg75l93xH8LL
 nTAm8y+4awFPqhiuhf4o5IZsmVex6A/RT5BUiOssoyE0SFxsUv4rTvkybqO3Gl+wgywp
 Xbtwpj3D7a2mo6tds5XNTsN3IJZhA/jc00JBI+xlUzfdN/UKV5LfuoJ+08fiyd8VXDzT
 IU9Ttg5S5XGh+czRIxM1PssnJw9juo/n3s84aysYZPpd1Dm6jZtbfn5BqHUwsDtufgMY
 jo9lc9HNVwFMSUNgDHlivf73KHirAixeRT6tXVB2Z0/3PK5ephK5snPNkb6Kh8IJkFI3
 blPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Yza3QuMv9Til8gM8mBpOwRdYCHxSnYnR29n1qkHbTqE=;
 b=jdU+a18Q1gn2TRjWYqr5YPqINeR94+EQSLxSb6u2Sdi4NS1tq/Cjs5N/GFVGnap6ai
 QWaB7JJ35BkjtmRChcKyKpxRPbDN6J/5dp3tvhHakh8QhP2VGPHj6cY985dh0X9LOiQG
 in/yIEqiDKTP2wKSg8vD78wTGLIT/bUhlOmivFjViqOwNXewjRJpF4aj+IKXoHBkAG11
 8rScntnXRyC6N5J0WGdNIrasjNATRjsgrGLq4OqJMBGIAehux5goilwI/mxaQKZ1/GXr
 bVqfO7l62DDRwHfBKlq0M1fjceIfhnAM2FkCsVO8j4C1EE1unc5VwTylYkD6QRLdllx0
 trfQ==
X-Gm-Message-State: AOAM533Q93iT7jBM2tCAQqR4b12k1gkBWBETfSVuRBCm0JKrYvvkU7gs
 Hnb0RDWHLcK5UinDpEBHWhCiLYo3KzQ=
X-Received: by 2002:a05:600c:2908:: with SMTP id
 i8mr2534490wmd.182.1606292012264; 
 Wed, 25 Nov 2020 00:13:32 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id k16sm3440160wrl.65.2020.11.25.00.13.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 25 Nov 2020 00:13:31 -0800 (PST)
Subject: Re: [PATCH 02/11] target/arm: Enforce alignment for LDA/LDAH/STL/STLH
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20201125040642.2339476-1-richard.henderson@linaro.org>
 <20201125040642.2339476-3-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <2f73b182-b854-2a7f-5aea-8ad62765241a@amsat.org>
Date: Wed, 25 Nov 2020 09:13:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201125040642.2339476-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x341.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wDCUlRTRUDie

On 11/25/20 5:06 AM, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
