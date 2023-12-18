Received: by 2002:a17:906:d96:b0:a23:4dac:818 with SMTP id m22csp923072eji;
        Mon, 18 Dec 2023 08:43:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGWJhbui4GFDIcn+cQ9Y+ldv4JfWu9JTTZnnhZgU23QztRnbGSIXZ84ISb9jOrJdTr7ueRJ
X-Received: by 2002:a05:620a:1915:b0:775:9041:73dc with SMTP id bj21-20020a05620a191500b00775904173dcmr20675079qkb.16.1702917785483;
        Mon, 18 Dec 2023 08:43:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702917785; cv=none;
        d=google.com; s=arc-20160816;
        b=p0poahZmTxyCkJ5If5ugyRrONSCQOVF7pXKA90FXyeRYZemjHUXbVhhSAoKONtqz/O
         OH1wksHZAElI69ujZqMWeU3MYM6D+fLj59Rs8pspPNPCUYV6C/BsPFNLqzL75t4rKzP4
         TrUbOazu6/dXJaagx++gTwVcpit5f8gQU+OYZWf8GJBS/JVfn2dchkQ2eH/3yeDnD2kR
         id2/RE81191pfYa8/GvicdET4CSSeluAZsKkVAugymT0rwXW5ReuoldlGGWZLJvsKauV
         jloAeEP/RIiFMkYn/+9qYx2UEMhY+5AiuFEEt92SHmI4iz+iTLmt583Gh0HcZ0Egf5s0
         fVSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=kIpi/SFUK7LkV+dbaKMGjtF8g+sGAwH5XPmGl60jN5U=;
        fh=gdBed72JnSifzQdV0PLkUCrNnp2PjbNCgzXbyzmTG1w=;
        b=ytQdamRiMhgqxnbW4UVCnSqgBqh6IZVMaY9eI0dOLFzCUJNoXPR7zR2ilW4Z9w0tL5
         vXoA1TWUwRA8z9+b5QZsP8I7kvOoSBrk0c/2AsGxXNPe1AZtF8ZZUjcP15cBJmvL5J84
         2+CxvDyb/Jj0CnQJV+YPnXfck6X66mlisAYS5TH10Xu/+UYeLSWT0/mzQru6Nif4GTVF
         SuXf8wy+bvac5JeRJJS5TTe+dX+kSY0lNIIYWDkRgStW3ADc4S31ryHFHY5zhtsPiNgs
         ZXqhD3CD4N7C6ZZ2xgWi2lWO8Et6YpxRJgKSwEkGEuxMetOwdIKSmSznX34VLBHQBuz3
         0vWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RKXyZgJ1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c7-20020a05620a268700b0077dc395e3aesi24988094qkp.414.2023.12.18.08.43.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Dec 2023 08:43:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RKXyZgJ1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rFGhX-00073J-7i; Mon, 18 Dec 2023 11:42:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rFGhV-0006xQ-EG
 for qemu-arm@nongnu.org; Mon, 18 Dec 2023 11:42:41 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rFGhT-00021r-Iy
 for qemu-arm@nongnu.org; Mon, 18 Dec 2023 11:42:40 -0500
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-550dd0e3304so4077453a12.1
 for <qemu-arm@nongnu.org>; Mon, 18 Dec 2023 08:42:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702917758; x=1703522558; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kIpi/SFUK7LkV+dbaKMGjtF8g+sGAwH5XPmGl60jN5U=;
 b=RKXyZgJ15QXfbVx8KJTj7w+UH29lhM5yy5Y0zQweTNGqW6UeWsGvN/x4yeiT78ZFJ+
 IdcnXXbzzjUGeudITKpsbI2mrgLIe92pBcE0V3pnCG9YbT8F2BJc+z//C5JPPYbkC558
 V3j8UgyFR9ulQNiG5s8PKTqe6WTZ96eKH/4bvk9fpGwjYVn0JrVl69QtSd1cXfhvH2b7
 5LgMmUs+Phbe6yqyuAZs/cGgbQ4+/A7Hm7rr09u7gZp70M8txJVrY1PA8BIhhgPGj9V+
 RK80HHJ/1bEr/mU7ju+oetm91PmBd7JSTFsQFhr0oeZicRjS2VIOTNxJz5YagSPcCWIG
 hj+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702917758; x=1703522558;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kIpi/SFUK7LkV+dbaKMGjtF8g+sGAwH5XPmGl60jN5U=;
 b=TN8Jd9RXBXI1XGwdfhZ+l02FWR2SJ5j7/QQ7RoSAbKXO1lKQcFpJLj6LNZweEdc9LD
 WwlBqiX+yzvWwxnFfYn26brzxWVBKfoqHm2MZoqyXHCzVZ92Q5g2CQZF2atip1qNHOJ6
 XKv5Gc1ds1qCuQwgPWbA/lm2ydCc9eGgo3BlkMXWbjTNOfH8Xul1pjNYSYBOHCIWYGh0
 4rbJ/3PGrWByvDaZsvJuHAfV5ctIw8cc/mYv6RJ4rCJGlVBlyeQB5Jy5lQMt9ZJzJbAX
 j6mEg/DLfumI+fwoqe3qGqlb3xAafBqlyxFzHWHsWSoUtC6RL0PBgPkxWKu6I8zi2ZuK
 7cVg==
X-Gm-Message-State: AOJu0YxzdgjIEd25VyPCvz3mYxYuu18SGPl3ys5Sm9IT5ojl3A7J26dV
 Q21x9YEm1hgWKcNstljbewTKX+YYrDbk3xzfWxHbfA==
X-Received: by 2002:a50:8d15:0:b0:553:55e8:98eb with SMTP id
 s21-20020a508d15000000b0055355e898ebmr999145eds.34.1702917758080; Mon, 18 Dec
 2023 08:42:38 -0800 (PST)
MIME-Version: 1.0
References: <20231208023145.1385775-1-sergey.kambalin@auriga.com>
 <20231208023145.1385775-11-sergey.kambalin@auriga.com>
In-Reply-To: <20231208023145.1385775-11-sergey.kambalin@auriga.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Dec 2023 16:42:27 +0000
Message-ID: <CAFEAcA_G-ZFnuZxrXwUEp1pViNHbCN1y8jz9sF12NEsZzYJEmQ@mail.gmail.com>
Subject: Re: [PATCH v4 10/45] Add BCM2838 checkpoint support
To: Sergey Kambalin <serg.oker@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Sergey Kambalin <sergey.kambalin@auriga.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: ZwHfA8VFjnxl

On Fri, 8 Dec 2023 at 02:33, Sergey Kambalin <serg.oker@gmail.com> wrote:
>
> Signed-off-by: Sergey Kambalin <sergey.kambalin@auriga.com>
> ---
>  hw/arm/bcm2838_peripherals.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/arm/bcm2838_peripherals.c b/hw/arm/bcm2838_peripherals.c
> index c147b6e453..196fb890a2 100644
> --- a/hw/arm/bcm2838_peripherals.c
> +++ b/hw/arm/bcm2838_peripherals.c
> @@ -22,7 +22,7 @@ static void bcm2838_peripherals_init(Object *obj)
>  {
>      BCM2838PeripheralState *s = BCM2838_PERIPHERALS(obj);
>      BCM2838PeripheralClass *bc = BCM2838_PERIPHERALS_GET_CLASS(obj);
> -    RaspiPeripheralBaseState *s_base = RASPI_PERIPHERALS_BASE(obj);
> +    BCMSocPeripheralBaseState *s_base = BCM_SOC_PERIPHERALS_BASE(obj);
>
>      /* Lower memory region for peripheral devices (exported to the Soc) */
>      memory_region_init(&s->peri_low_mr, obj, "bcm2838-peripherals",
> --

I don't understand the commit message here, and the contents
of the patch look like something that maybe belongs in a
different patch?

thanks
-- PMM
