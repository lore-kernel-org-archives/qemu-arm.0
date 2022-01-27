Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp4319037lfk;
        Thu, 27 Jan 2022 11:22:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxOGkGcGZNR9f0YKDlsnqjBj6/XYHOR8GSdPOX4z4HOdyfefBSBNEkfGbeYQBlv1yLBM6/t
X-Received: by 2002:a05:6602:1594:: with SMTP id e20mr2927419iow.159.1643311325406;
        Thu, 27 Jan 2022 11:22:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643311325; cv=none;
        d=google.com; s=arc-20160816;
        b=bDoKXAHW23Un/FXxmvV+3/zZUWSOnTwWlRhF+aQYkVrTuApRGXNA+jG0G1pVAnd7pK
         XBRyGC9lPUmS63D0lTiYWUheSRghXJbIqVdjvjLhWG3PrMT7/28hNdvSCXt7IyvQ0Ffv
         91KCEtjsyNcNoX1JkYfK+Itewe4CTqXLUo/mmT7Gx4Jp5iXuG1PC9AHRtJMb2/IsQA09
         l4Oy6gW07cEubFGyY1BoLUSGvw3+6dZlfsFNV4Njdn0pWpzZEzntEdW1zCP3qx+hFetH
         TOMy7spQluhcg0J3Z5cf1mJ8Kkn9+htUOrwChxHpM9jyOIVvmJz+mGFD5z7ruXnBqyr/
         +s1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eck580UGDw5O6ckX7pyMAQ15pP/wG2yfZwihMK7G/xc=;
        b=P8jvRbqSgV4WU05OlYxwBtrNOxKvsOqJ8NSWCPOyN+s9CxhS9+na3lQeZiQTomlA5h
         Us2fhlCuVhEN8c9tCcr+Gs9SbDHx23DIQHQ2GgUymVrHd7ZtLEkneNOcssMR2gExsnp2
         SaXp5RwszMysj7DDDnfAKDibdvIfaO9I8yVGpdb6wJdnCQwax9GoI+AbQgXZ4QCup0+b
         xC/zl0RMluHZGZK5Cw3oWwyTmOp6Ti7kl6svaawv3kWwnIbOxCSKQJm/NMl8IwQ0U7sn
         lKGS0RzAZFY/N0NJWoMcUAgvsP9dLEahwblhioSdLkMKbGQgB8fCSMsfC9mQGXdu1slj
         aykA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NYi5Ljuf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g1si1269540iob.6.2022.01.27.11.22.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Jan 2022 11:22:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NYi5Ljuf;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nDALM-0007ue-9i
	for alex.bennee@linaro.org; Thu, 27 Jan 2022 14:22:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDA32-0007Iv-Fy
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 14:03:08 -0500
Received: from [2a00:1450:4864:20::330] (port=36688
 helo=mail-wm1-x330.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nDA2z-0005IQ-TX
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 14:03:07 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 i187-20020a1c3bc4000000b0034d2ed1be2aso6597242wma.1
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 11:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eck580UGDw5O6ckX7pyMAQ15pP/wG2yfZwihMK7G/xc=;
 b=NYi5LjufbubL8jiQ0GB2QjJdCK8YluXbYzyCLiqzxZJXieQ7k68lfYEqhOyZHXU84T
 IBX8Sz6zGs3VoSTr7Ckn4a3RPgs1mOze1n7AaXLk6xo5Nb9RG+5SW+QqRng4Ixy1W+0g
 oOBUVBI8Qqnonhxtv3bJeGdMwMafV5DRU00Y9BXctHF4n+CFUG99o4FdwRNQi2FVkaOT
 WGvSboTR7++co/ei3qF8+9a+EiWEqQLwd5riWG4HgklKO1YhdtMvSmaSzePfPvu4+Il2
 6k0t8+1mBBb8lWM8ZCqPfVTrSpeoRxvaQVFkjCAz+zDQNCU3IzNWxncBZg32V9vD6euF
 I+Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eck580UGDw5O6ckX7pyMAQ15pP/wG2yfZwihMK7G/xc=;
 b=mX3GjZXu0xPxPgBy7z52NImmYxIoWlVi7fSmMwMf2trU6TOVvpoS5EjXXPIR1TQi28
 ioRTJgJ+mDDtQ/XsdBrSk/D4MwH0D0uoi5wYSmRgxiLb6CfT+uPhx538ynjHTcJ9MILZ
 Kf45Br9nfr8D2ud86jwoUx0qH9cWYblNUJiYHHBYa3JXh1htCPhPP4h/gvxBmSLe0odq
 wcawx5s/6i5QtkuNtaZAHQ+wsxpXccPHuU0ip6OF0p6F/OP5FXw9u1KN0eq3MJ2nEETV
 toIc+PhXecg+6OwicuL+Hu3wbTqFAxacJUH1GyqB83gPP0kIhZIQB4H56GbY7oEa+ENi
 bWtg==
X-Gm-Message-State: AOAM533/+GTBYk3Jp7PmHy2ZJjzPA/hQ9J1TXP3DGh4rDFP0fnAGIluE
 OACMjfVQhtjR6RgQpw+EDU+afiXlZXXvcLDAoygvCw==
X-Received: by 2002:a1c:a90d:: with SMTP id s13mr4373254wme.32.1643310167872; 
 Thu, 27 Jan 2022 11:02:47 -0800 (PST)
MIME-Version: 1.0
References: <20220112002515.3991540-1-titusr@google.com>
 <20220112002515.3991540-3-titusr@google.com>
In-Reply-To: <20220112002515.3991540-3-titusr@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Jan 2022 19:02:37 +0000
Message-ID: <CAFEAcA_N7cEEEie=Vmm9ko8n6hshmJs1Ouur4dOOumvrAageNA@mail.gmail.com>
Subject: Re: [PATCH 3/3] hw/arm: kudo add max31790 behind bus 1 switch at 75
To: Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::330
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: venture@google.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 minyard@acm.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: d2xvp0tiLcXb

On Wed, 12 Jan 2022 at 00:25, Titus Rwantare <titusr@google.com> wrote:
>
> From: Patrick Venture <venture@google.com>
>
> Signed-off-by: Patrick Venture <venture@google.com>
> Reviewed-by: Titus Rwantare <titusr@google.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
