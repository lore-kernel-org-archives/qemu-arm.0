Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp2325697ejo;
        Mon, 8 Jan 2024 06:48:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFF7vgcFpgMC3nqZso+vFl4eQgCaviOa/6RIDBk63QQqSf6T1Qqv+uv+E9CW7Q7oP7LcgeB
X-Received: by 2002:a05:620a:6401:b0:781:bb0f:dd8b with SMTP id pz1-20020a05620a640100b00781bb0fdd8bmr4360115qkn.21.1704725295797;
        Mon, 08 Jan 2024 06:48:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704725295; cv=none;
        d=google.com; s=arc-20160816;
        b=BVdHOfzYuRZOpB3cT/9/EV4d2g1ZAJf8pg399xWQzl/rAqPDSWKDbV1URXNWXVDGLI
         8hci30Ai++hiG/iv8GtCeR5lGg/xVLK823IRknTxFfoGEgTY0wLsQpH8IJ/rAOIPOfQ7
         TcQruEqRJZvJLBAs9ld64aDftUNqHV3gnt80Nk1sl+fBkT0eO+JBo/O5IPtZz6xF0Vj4
         E0iFDP1ktAUuf816eX6K4CI15poMfkJIgnKpqHmuYZ6mZv+5a7uieI0p58UYQN3QqJOV
         +xaDJ4z2ajP255EGepcHxnF07yg4inR6XLH7SvRzf8WRtybKD1RuXXwtMm3PSWPy8jQ8
         qcKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=h1zjyM5K94HNzD0G3uJzO/KMoQm+1Hqsn7WyA7Mglyo=;
        fh=34V0ak2y3FFHQY5ziOg4esI0Eafo1rDvTW1MQAOKnlk=;
        b=J7e23wpTX48Bxdmn/VzYkS0zMslMkWlS5Z0ZDPFoAF9+0uxWNCMFT1eT7b5feyq5c6
         gbZ/BOTLnkhJy/jUO0oG+2vaDV88FyYdJPO2uMefdABJm4XZ2DesC6OvAZGtT5J4zRwz
         eoCnrzdUpoB4j5qyQrkCto7U48ZCaZTmpNXEBStH7/g3cdLK7aSGGKWh+/BQcDxNhd9f
         VLvadL0DSa1dR4BrStK3RGtftMv/qv+pKjhCuBB2j21V6stDs12GwqVormwEp3k4Fb8M
         0pr5kf05Am1nPIoBnlt7yLZrw5yqMUB4EXmcRS0sNgelpiZOeQMWfnuJ07YQk0I8CujD
         nR9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xqGEtCSZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u10-20020a05620a084a00b007830707c650si7654178qku.561.2024.01.08.06.48.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Jan 2024 06:48:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xqGEtCSZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rMqv8-0008Pf-HE; Mon, 08 Jan 2024 09:48:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rMqv2-0008P8-J7
 for qemu-arm@nongnu.org; Mon, 08 Jan 2024 09:48:01 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rMqv1-00057n-4O
 for qemu-arm@nongnu.org; Mon, 08 Jan 2024 09:48:00 -0500
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-557e76e1bd6so132852a12.1
 for <qemu-arm@nongnu.org>; Mon, 08 Jan 2024 06:47:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704725277; x=1705330077; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=h1zjyM5K94HNzD0G3uJzO/KMoQm+1Hqsn7WyA7Mglyo=;
 b=xqGEtCSZsQhF2AwhLthfObhgn3rN8D9xZSorGOcykc2VYt7Av+5rt2H52bkVhN2Nol
 DqrKEonl/AULVaBJZzmaaZbBv+6i5eSnwlin/4iozirxUyIuYzv+YyCuGaVYVhRhQTqV
 LOrG8Yq4M5MIzjvGFG+aQG5aHHm8+ThyYSNnZfsg4lNssN+DxnqJRcm30Uix9FgbJiOf
 XC7T/rIomu4oApdv5sAO+WJtLe+vrckMJDDQqi23Dxv5caGrcbfJZ4xy6VaOqvQIT4cY
 sKMJOcQE15bT7+wV5gk47ic7YF2/954yaaT4KRgnyq+O0SCYsXef0Uj37MOT5kGwh9hO
 TNlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704725277; x=1705330077;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=h1zjyM5K94HNzD0G3uJzO/KMoQm+1Hqsn7WyA7Mglyo=;
 b=bNTzxGuHF3DwtsW6WhqouSr8OfyVBVARcUfPQXsAMIKeCXv4VGrgzJwjhQgC1b1nBV
 0jRt6eAURG2/mathu70Un5jWiRoufb826fucudxtuVFK0PtpuCOIPnCx8EMtbByyJftl
 qWDDP/ZQuZfh+/K9VmDA0vBbOrYzx8orLrIRcNI016EqAkjJjNsSIym+Mv57DJSBlrti
 1fpYaNhUZkX39qEZyI/23SIPrDquKABMz7GJ6MsS1cqJqXbWYi9lULhvmB9/METapHJa
 mmgFCCENldxshK+6icEPRo6fktn7u6WLcTq8AywkPd4Lm6ieKm2azM07cj0fLDLRx73i
 odHg==
X-Gm-Message-State: AOJu0YxW4MSc8zuQ/zEvuc2KHCeHEE5Zx/5nF4jp1//BWQsewDcjMYcS
 34UdW2f0fhb/wEbH12u8JpAeePYMBr6kigF9fDVKwUXAFPbUrw==
X-Received: by 2002:a50:9fcd:0:b0:556:51a4:1426 with SMTP id
 c71-20020a509fcd000000b0055651a41426mr2862716edf.0.1704725277617; Mon, 08 Jan
 2024 06:47:57 -0800 (PST)
MIME-Version: 1.0
References: <20240106181503.1746200-1-sam@rfc1149.net>
In-Reply-To: <20240106181503.1746200-1-sam@rfc1149.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Jan 2024 14:47:46 +0000
Message-ID: <CAFEAcA9o=ep2AjYS6e7q9g-mYZ8eM8iPfd9936k__jaDw7anKA@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Add "num-prio-bits" property for Cortex-M devices
To: Samuel Tardieu <sam@rfc1149.net>
Cc: qemu-devel@nongnu.org, Anton Kochkov <anton.kochkov@proton.me>,
 qemu-arm@nongnu.org, Alexandre Iooss <erdnaxe@crans.org>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>, 
 =?UTF-8?B?SW7DqHMgVmFyaG9s?= <ines.varhol@telecom-paris.fr>, 
 Alistair Francis <alistair@alistair23.me>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x536.google.com
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
X-TUID: Ho69oRx70W7C

On Sat, 6 Jan 2024 at 18:15, Samuel Tardieu <sam@rfc1149.net> wrote:
>
> This patch series builds on a discussion initiated by Anton Kochkov on
> this list in 2022. It allows setting the appropriate number of priority
> bits for Cortex-M devices. For example, FreeRTOS checks at startup that
> the right number of priority bits is available in order to guarantee
> its runtime structures safety. They have added a configuration option
> to disable this check when running on QEMU because QEMU always use 2
> bits for Cortex-M0/M0+/M1 and 8 bits for other devices.
>
> While this change allows the number of priority bits to be properly
> configured, it keeps the same default as before in order to preserve
> backward compatibility unless the SoC configures the exact value.



Applied to target-arm.next, thanks.

-- PMM
