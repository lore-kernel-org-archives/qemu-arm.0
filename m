Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp4714689lff;
        Mon, 9 Dec 2019 10:00:01 -0800 (PST)
X-Google-Smtp-Source: APXvYqx5BBGWCglMdACGf8YPPYGn8fo2H8QeKIjDryOhqZH2/0z+BvogyYcQibekRz3nWKCdoVF8
X-Received: by 2002:a9d:191f:: with SMTP id j31mr21691763ota.163.1575914401514;
        Mon, 09 Dec 2019 10:00:01 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575914401; cv=none;
        d=google.com; s=arc-20160816;
        b=izEHyBN7Va4wHW3kpgAEG5CnHvXDajhyk8DH989Uq7B+yZBPVgvno1/ySMFr3V8MfC
         MgUsHQaGLzE5QTaF3M9WtEUyK6mQJ1gOdFysBHCEkDfvbUMAzQfu1xMT7QsdTUl/Ir5G
         x45Fp7dEpvkH5eyBrWltRdTwa1nzxwLoEqBZurdzY3DQLnMxvgF5aRRAR6Xt2w4vIisL
         3u5tOPI8GsRqrQgFN9HDGLF9uSJQB0Mtgzi8Lq8T63PJ+nsra1Mc2UL7tJYsA/Lwocs0
         w616imUnRZcRbujrSpzdmGPa+rKzQzzqxbANMFgSv7rDd96mg3pB+AFnZ5/cbm0aSTIb
         docQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=lKXlVuxkWEUUPeb9LOuGSqHW5akNYDaoRPQweqBFnWY=;
        b=g17V22GfV7mHaYb9Xcc+qjr0/yGQUR7sSuutF0Lrq53y3VyqZr9F7ctacdSvYZtEjl
         44GGTm3/vB0umOa7ABQpVGFhx+x/bQ0mL0rXsN055Kn6+kD1Xu4YCID79SBJ0UI8o6nY
         8tifGyeSinVw1RFcTNClnI7nE4LL6MzWXauFwmjvQkzDYDFChL1ga9NZJI7aYjgBHkn/
         8tUT1DunoMKwmRC321FdfR/YrM/P023o+9V4oBIuXQKf/sMHi2YJp4Zj1G5vNw5JV9Ay
         lQ6QgiF1z1Uy+wwOuqAQ2l5e5qoZJishQrirs9Ls0lHJg8LbQ5SWkFGtTHMxB/nr7ddA
         79jw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="gMxvqQ7/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b25si227717otp.212.2019.12.09.10.00.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 09 Dec 2019 10:00:01 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="gMxvqQ7/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ieNKC-000886-Fr
	for alex.bennee@linaro.org; Mon, 09 Dec 2019 13:00:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56860)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1ieNHT-0004zw-Q6
 for qemu-devel@nongnu.org; Mon, 09 Dec 2019 12:57:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1ieNHS-0004mz-OG
 for qemu-devel@nongnu.org; Mon, 09 Dec 2019 12:57:11 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:43846)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1ieNHS-0004mc-IF
 for qemu-devel@nongnu.org; Mon, 09 Dec 2019 12:57:10 -0500
Received: by mail-oi1-x244.google.com with SMTP id x14so7112276oic.10
 for <qemu-devel@nongnu.org>; Mon, 09 Dec 2019 09:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=lKXlVuxkWEUUPeb9LOuGSqHW5akNYDaoRPQweqBFnWY=;
 b=gMxvqQ7/qVHRP74un03Z7LiyW5Qm537Q8uHZXNdLncuU0rKXpbwkrP9eTXnjM1OoXZ
 xOBFyoKib8Livc4EeHHWk0wjCIColNqllox4jXgJKyitvw0N3RCssBpN60DWDb0litpY
 vg/sLkctapRcIzyjA5wB8TdDbQZS+kNgIdRK3q1VQrjdmfk0eeWLjgPo2n9Q7wqIdMxf
 xuYm0EG+iazbz6Oa37qiu3VFye7F7EEDw6bfnISEOK+X3iH9/mVbYdWyxomz8Q/i1iOB
 p5Dq61PphPABufgdqKWa1GLvhZZCRiumG2q424BLBmToimw2VhboogsaHy8ZJXdkNe4Q
 ObVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lKXlVuxkWEUUPeb9LOuGSqHW5akNYDaoRPQweqBFnWY=;
 b=BNj+j5VOQKd69fWFjCqdjdQEXRrpSpBJY+2RivCXnv7GAOYNj8tja6/2A5V3Lc2H1u
 5A05c+/VZf6ELMgLNAeE/mlQy3gjwtxYuRtExaLhV8eAItoTkE+2xUc7nehzEZKJO+tR
 NTQbUX5j98QOCh28jrePcarYt5A6qopr92wtieRp8ZzPWDQO3NuWBW9LOktwSRHJBpu5
 dRswYrGF9VXm93NQC+VJJOkaJkqWXXZzrwNGyCvcQ1zDUuuKDj//aHZKjgAiStbIGjig
 +2XCgpML4sj1QhKkYfo2sY+miGMV6gt0l2I05QUpAXF6ETEeLzou7mUqpJyHYDOBOecW
 wKsw==
X-Gm-Message-State: APjAAAUAsr01lBek52OutgZngkZzT8QwjWxPG/MxL7iY7L0v9T+dfO8m
 cfgZA+i9rDbSSgqXBNpia9mk3RUews4Cb1yO1vMfIg==
X-Received: by 2002:aca:f484:: with SMTP id s126mr255085oih.48.1575914229769; 
 Mon, 09 Dec 2019 09:57:09 -0800 (PST)
MIME-Version: 1.0
References: <20191209090306.20433-1-philmd@redhat.com>
In-Reply-To: <20191209090306.20433-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Dec 2019 17:56:58 +0000
Message-ID: <CAFEAcA9US2Bva1L1CCC-vsZV9jtxmH7ECSSUodvTxTgPWDi_DA@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt: Simplify by moving the gic in the machine
 state
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Luc Michel <luc.michel@greensocs.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YCFuZ7zxwEUz

On Mon, 9 Dec 2019 at 09:03, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com=
> wrote:
>
> Make the gic a field in the machine state, and instead of filling
> an array of qemu_irq and passing it around, directly call
> qdev_get_gpio_in() on the gic field.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  include/hw/arm/virt.h |   1 +
>  hw/arm/virt.c         | 109 +++++++++++++++++++++---------------------
>  2 files changed, 55 insertions(+), 55 deletions(-)
>



Applied to target-arm.next, thanks.

-- PMM
