Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp2682395njk;
        Mon, 2 Dec 2024 02:31:12 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXatCmcH2ODcqvKH3Ar+P0XK3kwZUA4pVZBPjOG2x8Rx/WqcrnVyjGYfEurk6Mnzr5lO91RT9sS7A3JeQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEn12cmMR+6XVelc8mATGDQI5mZIq7+LvbuuTVz3D8oSSJSPt0d4+ayr8JNn+DPfYUeRasT
X-Received: by 2002:ac8:5fd3:0:b0:466:948e:beec with SMTP id d75a77b69052e-466b3645d02mr434521651cf.39.1733135472074;
        Mon, 02 Dec 2024 02:31:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733135472; cv=none;
        d=google.com; s=arc-20240605;
        b=HwbXK55UIFlQAv6Ci+zOy7UMPHVozAYdKfj9b5LPC2V0oNPR/6LggOhLhvaKir7u3J
         OxdY4O/uEsj8VIqDu6eHlZaQeNLworMKJWdMVLKK4EHEE4kX3WLKqb7jbCSyUXLmfYen
         vNlfJsJ/j4z+c0UPtoK0F68nMBZTAik7KWDJ8bLK2es8FDYbdx93IR/39w2O3sE5RrrE
         jpQbUerN+/3Fb7j2/TX67ec9DTdXCjlrijNHIv20XJ3syncJw2p7JXYO09+/biGTWUno
         zVYpjfQf7ULkcaxKi+QjMr7kmo4/WsMyGKurwxkI9cGfvrDYV1QImqPYHE6SxmqnjkeC
         lPZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=/IRVUx1Y+cadwWp3ns/yVfkL2W2wSjxjO2lE/CD0rTI=;
        fh=UMlouvVl3Ph4Ne7UvGTvosqVcNxKyKMHDiGsZppDwks=;
        b=f8j8hC4tNi6nv9Ynrx4XcIl0OSKoczEiqPbWvpETUW57OeLXNJtcHmDwsl2QvzgmBT
         g9GypEGf2LzMmMSXBmford+Nnue/847/813EtO25ywtk/YaSjB7E2ua90C0fuhpXULiJ
         0+fmrbiS1Hxg+FgGZgO//sUNumsp5C63cyf9Fr/01KmW0rMgzNdfY1F4NTkOqPK3xiH9
         2GZqMfnEbdR7wFu1UJN97aj+ivl5wuzQj91pXg1jYIRZUjhVBIHaKNuwvXCsFw5iVRpL
         ru2YrKJRoRirwd2GHQr9PiSV3NfcycN0dvg8D+YhCNqoocPROixImtCeeDhRGC27Lc90
         y/5w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J+I5s9fY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-466c445f367si108388771cf.644.2024.12.02.02.31.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Dec 2024 02:31:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=J+I5s9fY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tI3ha-0005y8-VX; Mon, 02 Dec 2024 05:30:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tI3ha-0005xz-As
 for qemu-arm@nongnu.org; Mon, 02 Dec 2024 05:30:50 -0500
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tI3hY-000384-II
 for qemu-arm@nongnu.org; Mon, 02 Dec 2024 05:30:50 -0500
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-53de79c2be4so4635985e87.2
 for <qemu-arm@nongnu.org>; Mon, 02 Dec 2024 02:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733135446; x=1733740246; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/IRVUx1Y+cadwWp3ns/yVfkL2W2wSjxjO2lE/CD0rTI=;
 b=J+I5s9fYqUKUMXu1UbxkD2kCxhvGhHMcWKr5ymLIEwAgBj9GU5mBRYA3E6kJKtV+I/
 In9VTBvwyunNujLy5uYBs5OsEGckD93ZhpG/zDkQhUK8tFPDdFj1YTjHjBL5mqYpKyd8
 hVZ9bYa1q4j/tUJ3Cftulg3GL6gma5gqE0uQMmD1qfVauyQjORiKJ/+bBIooA1sTYMPO
 Rkq3i/akfFyvgcPmHt73F5o7muW4IKwiOpOcnco5vdoPoUrhUefVPTidNDBb1DJtUfYX
 bSp4b+qUEfjUw+ZXiiS+r+3k0Xsa1In2OgS/50ozXhN6kLhWVfVwRyvG84OwIJftKKOG
 7KDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733135446; x=1733740246;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/IRVUx1Y+cadwWp3ns/yVfkL2W2wSjxjO2lE/CD0rTI=;
 b=gpTPY+gPpOSO/UJwdG4nd93UGOLsTN8Bg7hB276FDlki93aIMf8n9elTV9HVblodhf
 oDPeZY/ByQvmFMCEu8ZFp5fnZFEj5lqP255ljY+CA+GwKjiDAHEOoLpICGn9E4TNalsI
 zfSxEkqpXdiE4WnUXWiBHhWCAVIgZLwsFq8u3WVhrpYRkmLQpOSoDLYa4PrWADXqU7a2
 eduK+qU2NU60jJBEemjuYyls714eqGxe5wzj5v4G4qvIXocFR+A8DW3d49A66TcuUxZd
 IqR4pVW/+8RVAqgDh3rMJDSm4xck+kEnQ/Ore7vYY/EvdRB07Eejo+mL3xn9JHo6yDnE
 Hi+A==
X-Gm-Message-State: AOJu0YyuW7z5Grf3P3KEr0He+KWNJgszQ5/zFVh0Ma/yBKDM34VAys0t
 muLQhV11r5rZpt9m1mERVtLDHO0xxUFrESExvmg8YorVI2NEWhbm1N4wSJU6riI=
X-Gm-Gg: ASbGncv7JhyWFR4jPl1eCl88DZdz9lAFqFwKGY/H+0/MD4MGcy+32/wam26HZjnxc8O
 qqEW9qeaoapfb3vSdZCncB3zyhdj5ayy3AkDUjA7XL0iC/f6p9E/J+Ve/K1bdqchF+dWiUrcC10
 rO4P/bMzCx2+hSp2ncs4trjsdmKMCBMezMbvJH74H5SY3qwj2FaiQxzZdJZYTFjESVPMg2MDg2m
 fta/lrdUta5i1faoCVyfiASni82S+iQMYr2AywHN+7oZJWDH0Wk7OamLK0add5YzBQl1sM4l/AD
 1HG1MLjbOA==
X-Received: by 2002:a05:6512:b98:b0:53d:a2e2:5877 with SMTP id
 2adb3069b0e04-53df00aa157mr12148806e87.5.1733135446256; 
 Mon, 02 Dec 2024 02:30:46 -0800 (PST)
Received: from [192.168.77.213] (51.22.205.77.rev.sfr.net. [77.205.22.51])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-434b0dc9707sm149265505e9.25.2024.12.02.02.30.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Dec 2024 02:30:45 -0800 (PST)
Message-ID: <7f53bd67-2302-46a6-9d98-2b52939165c4@linaro.org>
Date: Mon, 2 Dec 2024 11:30:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/67] target/arm: Convert PACGA to decodetree
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20241201150607.12812-1-richard.henderson@linaro.org>
 <20241201150607.12812-7-richard.henderson@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20241201150607.12812-7-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x12a.google.com
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
X-TUID: n+X14gLzn54z

On 1/12/24 16:05, Richard Henderson wrote:
> Remove disas_data_proc_2src, as this was the last insn
> decoded by that function.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/arm/tcg/translate-a64.c | 65 ++++++----------------------------
>   target/arm/tcg/a64.decode      |  2 ++
>   2 files changed, 13 insertions(+), 54 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

