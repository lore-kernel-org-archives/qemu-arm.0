Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp309238njb;
        Thu, 5 Dec 2024 09:47:43 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUu3rInNBqcMuwFRqZ6jMIYSI5qFmb4MlJDPY7GMqp+kA0sj8pzO60Vr9Aoaeo13+EBm3JEW/KCgvFkRw==@linaro.org
X-Google-Smtp-Source: AGHT+IElm1wLxhdh/lWaLM2PQXSikOS1PeXgymfk2C6deva1Ru+lizW5rQMgO5lldw3N5lqM7eb4
X-Received: by 2002:a05:6102:374f:b0:4af:c420:2616 with SMTP id ada2fe7eead31-4afcab6914dmr356296137.24.1733420863297;
        Thu, 05 Dec 2024 09:47:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733420863; cv=none;
        d=google.com; s=arc-20240605;
        b=BhVW+8ZPsN/f61ZUDz7ifwC/VFNxm1SquJ3rQU1dqkVi4n4pIQBMvCR/J7C/U4QhcB
         wkOZkNeKBbxkvqTUmpo8W5vh5l/Sff6hJmYF99W9sJzrTEus8RAamL85j3jECWE4yhUJ
         Hv0s9+PjkIgqvM/ZFfGTa9hOuRYWlmFYcgOR0SOYx903BzON8yrK5QbyfuQcULwVkrQb
         ZjSZfwV1gvdaUOV4I+1ML955ydw2Ql6DJoN1888R7pCYCG3rgeNfygYnzX8u3FClsbCL
         wXMlZ7P5UnMqy8QJPNNbU1+OnCDym2+Ri2To5S9AaNwYZ9pdHM8d7cCkw9iGd4D1tFN+
         +RQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=gWaYyAc58MziuRislcGDADqXDO1h6t6v30C5Uq/aXy8=;
        fh=eSYqs2+D88NB4lAF6ohUQhqAdpEL93s7NCuGernmIRY=;
        b=JaUd4pGINeYgHG129eEY5SWgoJKo7BIFI761dCjGMj7mzX4s0SJef/lnP5qVcwSHjk
         egbN7IaOcaM5m+NclwWwjBeghUSiUXQ+lYrnA/SHd8C7Ze1B+sl8qoijr58l/jWVgK1r
         Y1Fwh8gTKC6i+OI/2jCUEm7qaGmAEtWotGAaANJibKxaMMHnPrgSJqc9tTW83nPZu92P
         +3xkjawYB7QZYN/EVLuoJaljolJxDwOU2sbmQGJXTu4LGsAnuNSUfX1G8XMbhtLnss0x
         RybQrYSJ24bcZag++c7t2tgV256VtPaIek8ttbWuZgYTaKfpLe0ghme261vQ0WDvLcuc
         SlNA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E36hNpX6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4afbc7adffdsi626025137.691.2024.12.05.09.47.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Dec 2024 09:47:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=E36hNpX6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tJFwi-0002AB-14; Thu, 05 Dec 2024 12:47:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJFwg-00029u-Qa
 for qemu-arm@nongnu.org; Thu, 05 Dec 2024 12:47:22 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJFwf-0000SX-B7
 for qemu-arm@nongnu.org; Thu, 05 Dec 2024 12:47:22 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-434a90fed23so8603275e9.1
 for <qemu-arm@nongnu.org>; Thu, 05 Dec 2024 09:47:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733420840; x=1734025640; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gWaYyAc58MziuRislcGDADqXDO1h6t6v30C5Uq/aXy8=;
 b=E36hNpX6wzn38UDeD8/kTnAw3dBiSw7CT0hinCj0SCoMRC6X3/baIh2Z8kbrhZTW2Z
 /o1jMfbPghcxIJpoejmj+8pF8SrQnEt9+m+0IWSiqXNB9pvexncn4/wxnTSc2y2n1FzF
 7/FGyEJLkOba0SSEHP/MBXWvEsE+tGvTKahkOAioPlLETXjNmZnx8D8OXqEgugaGlelz
 iIgeyJIxPyVZyK+6PIffCTNClER7FlFfnFmqbyNr7Zl734Y3ooZSLJPPOmnWDN1r8KZc
 7r0MQBg/bwqBDd55CAfB3ntN9wu7uJIat9dCW9tgpMsf9Xjt8vPAlp1bfIX7MYryFXpv
 psXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733420840; x=1734025640;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=gWaYyAc58MziuRislcGDADqXDO1h6t6v30C5Uq/aXy8=;
 b=rnUkxAU/9wfcrEH63nYKPGxx4RyS9Rsv9sc0MxTqIa4s7orp36LJA8FrT5bGXs/BCh
 NDA2iznUK8QdZoWCEOX+kqaGQmkHEXhU26P64TCX1yzBDH+gATUDT9IM6Udw217YMMJ7
 JRPyK1OcV4hz3z/LOOoXqmA3yzggbF5qfmjQQ36t/YRGmK2UV6QuN4ukKSMCa8K93YrG
 GP3mWagDMDUvTzyQHkwLqm8Vu+MKX6PnUc1/dC149JRdvW7pERrmYzxZ/UZeWlTXe6b5
 AgcI995/h669boje7ciMIRBC+7y5xor8IuMPf2ceWAP2N4KSmSGaHJLyxZbtTTqAyA6i
 MEVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmxryQKXPGkC3+kPPWHvTkpytKaH0gWvTv44xHbU4CLGH/ICGQjuAiw38pZvaf2XXOWISHRHUHqg==@nongnu.org
X-Gm-Message-State: AOJu0YyAhLZobR+rBhRvBbq3V2ra/637lGWVD7Fw/xIzendKrKuA17sE
 nJxlXw1rdXoFXvkGmAD/934x5Eah09ReC5Na0bgooKqHIH+a8Pdfd/0t1HWfTXaIEmFu/s0OZQr
 Zus6eA+GDLVif6WzbcEGQ2JK6yVbwMIEs2Z4Byg==
X-Gm-Gg: ASbGncuL+dUBpsfbg5R26Sauq3DLENp0sB1OTjzqUZyF8fOTKlUig2ShqJe8q7HNvf4
 Hd8GUspU1eLdJfx7RfZnsi+VsqPPVWRA9
X-Received: by 2002:a05:600c:1d1b:b0:434:a5e6:64f6 with SMTP id
 5b1f17b1804b1-434ddeabcf0mr1864845e9.11.1733420839737; Thu, 05 Dec 2024
 09:47:19 -0800 (PST)
MIME-Version: 1.0
References: <20241201150607.12812-1-richard.henderson@linaro.org>
 <20241201150607.12812-16-richard.henderson@linaro.org>
In-Reply-To: <20241201150607.12812-16-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Dec 2024 17:47:08 +0000
Message-ID: <CAFEAcA-n4-m14bD--=-SYjijjxNZy5DwN73=mpucCnJ9kNt4Lg@mail.gmail.com>
Subject: Re: [PATCH 15/67] target/arm: Convert disas_adc_sbc to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
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
X-TUID: 6h0kmk7XGUgu

On Sun, 1 Dec 2024 at 15:09, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This includes ADC, SBC, ADCS, SBCS.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-a64.c | 43 +++++++++++++---------------------
>  target/arm/tcg/a64.decode      |  6 +++++
>  2 files changed, 22 insertions(+), 27 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
