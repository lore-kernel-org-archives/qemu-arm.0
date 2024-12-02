Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2850922njk;
        Mon, 2 Dec 2024 06:06:22 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUlpq4bn5r4lApvDgKq/zxqWkhiqz3fnairmUt0dy1avnTnNX//XBe9QUtoJ1evA7yZDVmQ+ylrlT1qAg==@linaro.org
X-Google-Smtp-Source: AGHT+IE4L9F0aYmw5fuQ6w/7ZEj1QIOR6AfShm932pZws2IGVqZG/gHSqVgA4Yh3G18nbfXs5Vb2
X-Received: by 2002:a05:620a:690d:b0:7b1:45be:2e89 with SMTP id af79cd13be357-7b67c274d1bmr3892610685a.17.1733148382158;
        Mon, 02 Dec 2024 06:06:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733148382; cv=none;
        d=google.com; s=arc-20240605;
        b=ZjXbxvGVfbOafE02XTuh1WGftk/HcvsrHgEi3iPEf1uqaIGUzkt6ueuAkLZMqOS+rD
         zeL1y12eN4EC4zu0Igvrxt5LepM1inmkZfrbLtw8gw0s2Ff1FOIXUYzRw1xlN5dbNwDN
         9JiakwCdBQZ4hyTjnyE46lghrYI7DtbG6RNdQZdgLY/T8Gir+YJcK1gn+bic5UxGwFUD
         8HCtJMO1wTdAe1Y20McNZGOhO7TFdVYkxozu1FGhVuqmsQUDQZExKm7h15LC32NZdLVv
         4zaf8Ai5P5iBPCiE+CbLdt/v6AN56NBi0R0kItilQhUxQy21pr3j2GyFQg93VBdpnG/s
         CtqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=JiakdafWghiFtbfn7nHFSJBrt8kg2pNkSq/91eDySFw=;
        fh=UMlouvVl3Ph4Ne7UvGTvosqVcNxKyKMHDiGsZppDwks=;
        b=GJPPScBj+g6Q+gwjaQYFG0ZNS/C0cFO1wfukl7bsk1wkTcdVtah9p4ZYNIMc1Y4EIf
         0ljRB9VPHVcZezQFQ7CCpqd/WGuQ64XV49MHR+AHF2aCffQHd6l4zznfJeM+gljF9Nzh
         MSSI1H8pSIOHaVqsffjsniZnZeWgVGporhsEgpLb5vXEKicwY36qm8sSQxwe8L/Zgsad
         Zd+yqLXU8arYvqY39zUw35ucVlsAlRZv06ueQuft1D9Jh6kRLYiUQRiFIzRSYmWnTeFG
         CONpJEL0uAE2bV6aIarFSCJlFHSFcdFCuLoOxTbdoqGCCFnx67lYxUtKUKWG6epkLfO6
         Sixg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rEr8FMOb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6849b21ebsi1181961085a.212.2024.12.02.06.06.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Dec 2024 06:06:22 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rEr8FMOb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tI73l-0003yq-6y; Mon, 02 Dec 2024 09:05:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tI73b-0003yH-34
 for qemu-arm@nongnu.org; Mon, 02 Dec 2024 09:05:49 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tI73V-00042w-B7
 for qemu-arm@nongnu.org; Mon, 02 Dec 2024 09:05:44 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-434a45f05feso54162015e9.3
 for <qemu-arm@nongnu.org>; Mon, 02 Dec 2024 06:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733148339; x=1733753139; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JiakdafWghiFtbfn7nHFSJBrt8kg2pNkSq/91eDySFw=;
 b=rEr8FMObB544LEwPuJRZOaBg5v06ud4Ow0AY5xzgon+HagLO/QpV2u8R2OJO7rclLF
 vJ4k5Yv1EZWiwWlfghF2mQO77sgtCt56TAIxFTKiIZ1PtglzM5TiCOuKwz2kWuZhSPtX
 nq75PMdpEH/6w65LwZFkmiMlja7buWd6nxWW8HzgY1TUPePXyiMfCqcyJQdGMl99Dsup
 +S1rACxzOnt4gr+xc3NBviA61KtZedVepDB1KB9ave3EeNPasGRkGt0KIV+istLuhzaq
 xDw08B2brWvxd66q0Wh5kIn2QeNQeVuQ39JKdSjeowUr2hIGG8B4wA6pllBH1jwGjhne
 hQ5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733148339; x=1733753139;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JiakdafWghiFtbfn7nHFSJBrt8kg2pNkSq/91eDySFw=;
 b=ADvEGy+KquREnr0IFRfcIA5Ij2uDSiQ/EbikQWnCUOc4kqhYTTN4ih/KX7kVqyt2l5
 Y0hI1cbwzCHL85h5WJ+Iaee3SJmQYXSGPFV8ultgRVKZ3zyUet9uNhCWyvaGYIhMdufW
 /XSSLU1zz/s8mJGJzKXJS1dIqd3E9ASZO7fPgDiL4ZaDTqR7yzh75iMsjiU/HRG8CZ68
 QZxwTlYFcCT5HNx33595f5gRIH2bL8E4Njff5X49xB/OAlCkZKjdFLKN2IA+w0PqJ8AH
 8Lau2LbvDD4vrv2BlxZblJ/4urYOSyttLyoUI3+PeGIkpSAduF5rG+YN5ANXN+7kMXpa
 E2ZA==
X-Gm-Message-State: AOJu0Yz6KFvf/zM4mTfRVwZFnIvV0oBSiDskSkF7GCa5T+qIJV4uXcwG
 /W5tISGn4nuJNoKYgXwkE9ZEEyQi0SbOSh6h4Zmo2utxWkGpBT58XxME7d06T7w=
X-Gm-Gg: ASbGncuRBej7uDnX+PcBj2o6zwDIIQU//ZEfuU99jHR3x6a4bU4wnc1NxXuqYAkTJci
 /CYw6uQ2iIsRuYhIkD6ftCd2MAF4hL0/WjRPw/O/yrRYpGjU/Z1r2iViYVaLSFlIMCOMEND8zHz
 1Khph6B6rRwXZRukUusNi+Q3+nj5k47RacONa687oFbYJ29b/yTICcNznkJYv5IDUnyyD7HvHHF
 xlvOfm4X6oKCRBg31poFM2l8aofXXNWTQj11YKi9apNjBqvZoMCdNlYyH7j4GLpVsps4wChGZGQ
 5BHMRxmW1t6lHN8MwcjeSOxagg2Xrg==
X-Received: by 2002:a05:600c:444f:b0:431:54f3:11ab with SMTP id
 5b1f17b1804b1-434a9dfbed9mr219559105e9.33.1733148337979; 
 Mon, 02 Dec 2024 06:05:37 -0800 (PST)
Received: from [192.168.68.213] (72.red-95-127-54.dynamicip.rima-tde.net.
 [95.127.54.72]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434aa74efbesm184569295e9.7.2024.12.02.06.05.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Dec 2024 06:05:37 -0800 (PST)
Message-ID: <b50ebf8c-3457-4069-93e6-dbcefb8ce458@linaro.org>
Date: Mon, 2 Dec 2024 15:05:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/67] target/arm: Convert SUBP, IRG, GMI to decodetree
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20241201150607.12812-1-richard.henderson@linaro.org>
 <20241201150607.12812-6-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241201150607.12812-6-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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
X-TUID: JYAGp8tjVlM3

On 1/12/24 16:05, Richard Henderson wrote:
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/translate-a64.c | 94 +++++++++++++++++++---------------
>   target/arm/tcg/a64.decode      |  7 +++
>   2 files changed, 59 insertions(+), 42 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

