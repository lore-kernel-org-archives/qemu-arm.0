Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp943484njb;
        Fri, 6 Dec 2024 07:49:08 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV5GRsJHYohPEthvjCh+IzrpTCSSOXX4Jf/keNjLdEavNE+JP9AwR0w5CKy3nhIF4XxDn8tO0SRPYXvrQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEqNubfG2dF6AS4BMOdarHvpSbMA/ee01c+UI8Ddc2eRH+9frAA4gZLvBa4w9IdAV1bm8rt
X-Received: by 2002:a05:6122:3542:b0:50d:3ec1:1531 with SMTP id 71dfb90a1353d-515fcad56dcmr5368915e0c.8.1733500147889;
        Fri, 06 Dec 2024 07:49:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733500147; cv=none;
        d=google.com; s=arc-20240605;
        b=F5yYMDLqyfAKrVPOwP5M9DmBvGryTR//8cVaTKaRJ3d/z87R1GR22JzIbhtBUt+KUs
         TnIncl4GUOVZFQLxqEDuV1yitjT6i3F5cA7NXXOecCQGPgYxwRlZ3BG00EU26f3t0zXj
         o6JdZpJ+TLm1izt527wdZ66uCzxd+YoAUH6jr9m8/VEBpeJxQiRbI0RWb8/w5jWnIcCS
         JcUHC+nbzxcWv5XhI+Rq2ED1bvgP5ZQQDzd53PzOpsL3YYipsiMMKZ5+oSU1hWMxlgJv
         HhGaUgl4A0sY5SadT2h7PVEkH1/45+5S29HMGaYoojKTK+VQd70MP2G3Ymd7fTtYgbzC
         1HMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=zPDeiSKvlp7ZsGCVwtVsVzirelDNE8iSGotP76xLW/A=;
        fh=knAZXi9FWXVHLUAjW8TSW5ni3cmC7VInfwygbWXwF4M=;
        b=BPiUPMtRGUA9ymZkQcXutJwdUX1TtVN2+BYnL3Jpgh8qHXhNmYP4/0VRg7XaGvnvx2
         8E10US5uEZAnU2Qfb8g6DLbWRp13O+9mALpLfEpAARUv0bGwAwDpQZg0+rZWrPTsdnE7
         cVxfJHqh1Wh8n23bOBYZo2DBATJc00iXBi6ZnAprKBVA81vVtVyZh/7nK+mlQ/OPhVfK
         5322xF+tksATSsyl4rfK3ZhJCoprfTmBnLF2fzK6OwXUNgcDVbNR0S7jX+Ay1W+dZhOp
         nBzHpaAMGxewWRoyb9fJM8yE2EgUQjya/Aydn1f3CjXgGRPi+YAFpsMTokhAzxbbHDA1
         Bfbg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PODCtuBu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 71dfb90a1353d-515eaf1359asi1212657e0c.170.2024.12.06.07.49.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Dec 2024 07:49:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PODCtuBu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tJaZY-0007jd-6L; Fri, 06 Dec 2024 10:48:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJaZW-0007id-3L
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 10:48:50 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJaZU-0004YW-Ic
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 10:48:49 -0500
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5d0d32cd31aso2565426a12.0
 for <qemu-arm@nongnu.org>; Fri, 06 Dec 2024 07:48:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733500127; x=1734104927; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zPDeiSKvlp7ZsGCVwtVsVzirelDNE8iSGotP76xLW/A=;
 b=PODCtuBuoOT1P+8j5pckqeU7bx9ZpBubIcOFM3Fub6ZhcJB2aS+kbscaw6cmfK/Zfz
 2VUF+/71sYRwMuD9opHqdY3VJcydTVjIV71e/weSOiYah56DYhutnvow2AAuilDc7yQ3
 GXM7OmUdNvJjx9ZeOqwzyUxbTTX5y4GLeg6TAMGPVfQp+mnLfKIHhKSVKokCk+8Sx9s7
 JQfJU/+7MoDeN542kfzAVkQKkPGMMq9OSNTYeE6EqdQCws8LP9Dy6wSBQnPHyHBHwKaZ
 Gf8EohAO2foWzTplQgDySTskVG2jwXn3056zHkF/s+59KJ/0HhoUmFFv1n7FazOuxtZS
 6FfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733500127; x=1734104927;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zPDeiSKvlp7ZsGCVwtVsVzirelDNE8iSGotP76xLW/A=;
 b=BH0P6K0eSJ/Nts0FwMYEcaasPOzdTe6WNWIp4OH8qkIoy3Nn1LNLkk94A2GYL+EJW8
 PecWnUfNzgA5ze/orBs2zTdCS/8S2pxJLWyxVmp/M2rx3RL55vm0HWuto5jc5n7Q8WQj
 xm8ItcDyDNsHKY7dsz5y24AMrx0qXBJiuk96/jMO3LIMVbaJpcD8cVugWGxjKD0dg1WS
 mHVd7XbpBus8XqdyQaMQcTcJfwSXUniW9DssvvHjsrzs7g6IkEB0K7hsZnnBRvwnA7oW
 nHwsX+znAi8XA3BBBVCX6y45OKVH/+z424IFubEBj2NewNDUUSjqae3iJzF0r4WDJz2y
 zs0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXCEu6g8FK85YMkj7QBEFvQE2M6zuSOBRntcHBLx2fWyOS9DzAOzHC5P6IR9REsDNRGcTPK7Smwtw==@nongnu.org
X-Gm-Message-State: AOJu0Yzcqpo7iasRsf0q4aWIFGnf0p7ADjMbcf/swBvMf0ruSFeUgpis
 exX8NJ1KRZ0oVc0IBGnquLWNOlebwJwD3xA0SFiK6qaO148sjcoCAAS9Bsia8YdgaQawz6S6zFm
 sE0YqTthiQUbRedSpn4jSxCIFxblVp3aa9Xvcaw==
X-Gm-Gg: ASbGncvr2K7yoezG1uNV619tF62qICnDTG42QNuqWSTab2VWxPCsIB5Y/4/LkBGPso7
 4p5ppSipQzwhzOrkC6AjUSNpOHf7n8BEU
X-Received: by 2002:a05:6402:915:b0:5cf:dfaf:d5f2 with SMTP id
 4fb4d7f45d1cf-5d3be67fe69mr8362816a12.9.1733500126961; Fri, 06 Dec 2024
 07:48:46 -0800 (PST)
MIME-Version: 1.0
References: <20241201150607.12812-1-richard.henderson@linaro.org>
 <20241201150607.12812-50-richard.henderson@linaro.org>
In-Reply-To: <20241201150607.12812-50-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Dec 2024 15:48:36 +0000
Message-ID: <CAFEAcA8n+48haqQW2-bbr-ALPvLQ6fWEyGYSwL2ui6kmYSETLg@mail.gmail.com>
Subject: Re: [PATCH 49/67] target/arm: Convert FCVTN, BFCVTN to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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
X-TUID: ChKdNsxgBtuz

On Sun, 1 Dec 2024 at 15:15, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-a64.c | 89 ++++++++++++++++++----------------
>  target/arm/tcg/a64.decode      |  5 ++
>  2 files changed, 52 insertions(+), 42 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
