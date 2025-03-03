Received: by 2002:a17:504:76a5:b0:1be9:327d:8ee3 with SMTP id sy5csp2638307njb;
        Mon, 3 Mar 2025 06:13:14 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUkcQf3nLP9GVcTdy1znHMCSzDqmYYjkP2dhoNBJlOn7bo4MHL30GUZ6+M91Rmwil2SxXtg2glg5dTd+w==@linaro.org
X-Google-Smtp-Source: AGHT+IFwEq1lQptTUUN5UE9gTEzWTQLB5pePbQMpkqfJfEuZ5O9zUS4yL8Ms/9W6saxq8Wu1DSFJ
X-Received: by 2002:a05:620a:288c:b0:7c0:a075:3d9b with SMTP id af79cd13be357-7c39bc26b75mr2082603785a.13.1741011194047;
        Mon, 03 Mar 2025 06:13:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741011194; cv=none;
        d=google.com; s=arc-20240605;
        b=Li0t3gYlSVHINHkCbNCfIBBzxqBNj/Ny9doAH3XOTo5L6U4Fq5f5LTX68l1eOV1rIp
         2WGqEjIOm8CKLYEKSAcpE5eKsKjC4j+gJj1BnQ90jpkumlSrEHZpQmg0bkBCUjBihsqV
         ZLeY/VOEgJCREycqW0J8lW+D3qsUm03sGDwQH4fw5SpfxceHvoWPPvqZFxFu/OgLXnVk
         V2Zr/xes8Ml6kquyc3xLRjrksy4YppkZDgAhGAHJTyCnb/gR+LFh45eRnN2I7L003sER
         cmOtPHaFHqSvTgkPLlqixfiXXY1+EmMZhEG0bCtn0fPRodRh6gGiZzCn6veIpzBerzct
         C6Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=CQ5LNDtrTVZtscB38FVZhs83Lafd0D7KGFLr5lI3DEI=;
        fh=/To+4i7pU7B4F1UmtYNTuFKg8mv8h/wp+9Fs4B1MrqE=;
        b=PISdLuD2ucwa0gk0Gm81Ztjsqfvcd5R4WsdiHq6i0zCahbOAHKc72OdGUVkcdoLw79
         X+gpm9cBaiZjxagX39fglFXLhIW/eXm2MnxG926fvxrM5pamyBMrbm7u46XYIYUid52O
         aXGRHbkmV4NwTZud+yxCYVjKu2+l1Hewbx0i61wqrEAlpxcG6Uh7k78/emUFHyY1ldmL
         DEXp8SUwEIMXL8q7u998yKSLtFmpyuJCWeoLJrt/dE/RwB5HEFmpd4rC+pshWsCXBWKO
         a5bqs+u5r6pRFDqaJKcaxVpeoW+SeAai3y3Z5yAf7XIuBEI2p1m9+xLzG+FCFrunBrlG
         MDSw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rCwvgQRX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c36ff6130esi860288485a.225.2025.03.03.06.13.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Mar 2025 06:13:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rCwvgQRX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tp6Xe-00022R-TZ; Mon, 03 Mar 2025 09:13:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tp6Xb-0001vK-Td
 for qemu-arm@nongnu.org; Mon, 03 Mar 2025 09:13:08 -0500
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tp6XZ-0006Oc-Ld
 for qemu-arm@nongnu.org; Mon, 03 Mar 2025 09:13:07 -0500
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-6fcf90d09c6so36706677b3.0
 for <qemu-arm@nongnu.org>; Mon, 03 Mar 2025 06:13:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741011184; x=1741615984; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CQ5LNDtrTVZtscB38FVZhs83Lafd0D7KGFLr5lI3DEI=;
 b=rCwvgQRX2saM3bXHViW3S1FTJZhVxWUWrMuXnjkcZgC7kEoy9MigBs7UkffQ8rulIO
 VuIf4AdvsskEwAuD3xCYeI9tue2xUU1zAirXQocOmqzFVbh24V6ASJtnk0reg8Ga4arp
 Waw0Q/09yP11mItRMEPlgvmoQ5CB8Tr7hphrFK9S+cdneiYrGcBNxuyShkM4ZG+dR9Lc
 hU5fKq/XwBgcqGynxqHu+Eaa8G1xPaHfx3tlNHDmUMNlgINEQeQ6U+ZwICELOClXsisG
 rGSjoe4OwTUa0OXjfODPFLWH2kvum/lMDe2xtXZpho4yWluVRqPUp8KfcRFAhZMylUtf
 hG/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741011184; x=1741615984;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CQ5LNDtrTVZtscB38FVZhs83Lafd0D7KGFLr5lI3DEI=;
 b=rj23faaiMbyKjqtIB4FcoDm97zCtILlSHyfcKgQXUy5SR1VuGVBgvt6WhdKLAIpoCd
 W2Bz6Wg4IztavxHRls5pMXKn2mtBFatzg0Rih9cUSRyRtlYXxqDJlA2oBA7ojOPM7+Pk
 Qd/x/pVFF8wOl9bO2UtZeL2TbDhQpg9EqMTFvsEg3Ds+2jkLFXIrgJaRR31VXSeITLdk
 a+eqOZe+FXLUeBbIM9aK7Cqy1kbskMngU7k1tkUfxTd1TLi/lTvSI2bqk33QaTUNseCe
 pZG8tYsOFIT1jKiIo+AUsN0rBtTILgaaQlkT79+fYngvh2ZwpsXuu3Dgc4U9uzyTXPbL
 CCgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVCO3Cu3Bh0+0phQfnJFJCR53n5eGQ5y1jor9ZSfCWr0okao8rkqplF/r4efKNiqDkOIEt2KzlMJw==@nongnu.org
X-Gm-Message-State: AOJu0YxkfLZXnoRpMqSRNXsXkm5TSI39tGO+KUiaPJOLRqQgElgs9q3U
 zPIrPrKPEX6k2CATNAnxJa39sWmawdewFHzFesou+1kPjqw07jd5aaWxvQHovWUCjfAaAvRqr7j
 Jp8w3X7L15aBt1A41ktOAcUL1Rw43GYEcBVd4wg==
X-Gm-Gg: ASbGncuqbMMZNrw/snXuVkGQNhuLt/74z7kye9TwL0JD3uFQ5pu8dOEYu+knQY31zV0
 4QIqIUwUTp3soUrIrMnwkAJAzC8ZXrTHgVv08BNbYxa/U8k0TfdU0x53HoGqMSXMj6kP6mZLFTD
 30O0EOCUiPl8g+LIi4J3xCWd2OeDs=
X-Received: by 2002:a05:690c:3505:b0:6fb:b38e:2076 with SMTP id
 00721157ae682-6fd395b5f8cmr261300127b3.11.1741011184434; Mon, 03 Mar 2025
 06:13:04 -0800 (PST)
MIME-Version: 1.0
References: <20250226104833.1176253-1-thuth@redhat.com>
In-Reply-To: <20250226104833.1176253-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 3 Mar 2025 14:12:52 +0000
X-Gm-Features: AQ5f1Jre2SoyWwFZ_Xe_pA30D8nA68q6UJ7ETPltEmbXGw5cATHZcXzBTdqG04Q
Message-ID: <CAFEAcA8A7FGPbw6sJF1qG1Hk3eWLtSLRY85gAWPJMqfjoq0J1g@mail.gmail.com>
Subject: Re: [PATCH] tests/functional/test_arm_sx1: Check whether the serial
 console is working
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: T4wHOfyx61gD

On Wed, 26 Feb 2025 at 10:48, Thomas Huth <thuth@redhat.com> wrote:
>
> The kernel that is used in the sx1 test prints the usual Linux log
> onto the serial console, but this test currently ignores it. To
> make sure that the serial device is working properly, let's check
> for some strings in the output here.
>
> While we're at it, also add the test to the corresponding section
> in the MAINTAINERS file.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  Based-on: <20250221140640.786341-1-peter.maydell@linaro.org>

Applied to target-arm.next, thanks. (If you'd rather take
this via your own test tree let me know and I'll drop it
on my end.)

-- PMM
