Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2447520njk;
        Mon, 27 Jan 2025 05:48:42 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV2/N4VuST91+dQSaumT6uBJ+lfR6aTLxtpdJjUTZ+n9ZF7EbRGbFvAiv+eEi2TuMgvGa3+DvRwsTmiWg==@linaro.org
X-Google-Smtp-Source: AGHT+IGhTRS4/H3gk8ISlhls3mhoCWj8lwQJpbK1sYvXbs+sGpmK2tCWpdB9GZHvC8pXn3lmAMQx
X-Received: by 2002:a05:622a:1a91:b0:467:53c8:7570 with SMTP id d75a77b69052e-46e12a56915mr706069581cf.13.1737985722765;
        Mon, 27 Jan 2025 05:48:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737985722; cv=none;
        d=google.com; s=arc-20240605;
        b=ki9Ssx6ATRXokdL22zY4M1NCTHlU6MhxuNphJxyrcEW2TFvs+EFCMUInsbUGKmR0EP
         DQJnCMDiRtWNOuOX81E25280CR5nbaxH/HPSIm9JdZhYThWLNKN0kkLfKcGpYSVOj+X7
         GSCZTSPSXjXMUiyyUYpy96dLwHQm5b8b+u5/xhCgdtCm7SN+/vFINracVcYdJqsD12Od
         LM9V+RIbMrfrv6wlm9+y5bj5o5mPr53nTPv9R/FOc3eCrhph75eSqHRxtJ4KapJA8zS9
         NhI6yJ0FTrBWYN+nxzjB5UO1thIZRtm6CSgmX9xqWVp3O9yVbVrglRrN0YI0nWVjc31N
         vsHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=pGSZQYIIEv1Hss+sXLGwkTIIM85rE82n5uM1Hs3Gbcw=;
        fh=fRmmJ463XjLgFygbcCmCXtwOsXZiAnORtCpeaoZ/GlU=;
        b=PAQgRB4c9Ks7AjLuOtAumyf0nIGQb1l0PTj7KUUhNXogUxzQve8iGkTklmUQDECFKD
         U4xlyUFrozzoB8rbWVAm46SMGIjW8nJ4ALQRDBZus/3RA3edLHTqZ7ctaMNmYhjEJBtF
         NB9THlur42qoL5Qsft81r4CU5EuGFej7ojvjh0XI6muM03JnKIXpUy2KFv5ldlfIh20S
         eVmWnv386gPoQ0G57wOmcGpZSqlg+KGVc46LywLU5C6Nnmsn8a/EBuOyZKSCLW+BinqG
         aV4vQqBkyE/8QE43+BuEl8C5QJ6LL3Rz65yIXGMbXtF/04c899nZR/9lpzCpos2a32SY
         zK4Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PLpk+SVu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46e66bca130si105359081cf.612.2025.01.27.05.48.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2025 05:48:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=PLpk+SVu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tcPTN-0005NH-29; Mon, 27 Jan 2025 08:48:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tcPTD-0005JH-Df
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 08:48:08 -0500
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tcPTB-0006b7-C2
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 08:48:07 -0500
Received: by mail-yb1-xb30.google.com with SMTP id
 3f1490d57ef6-e3c9ec344efso5930831276.2
 for <qemu-arm@nongnu.org>; Mon, 27 Jan 2025 05:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737985684; x=1738590484; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pGSZQYIIEv1Hss+sXLGwkTIIM85rE82n5uM1Hs3Gbcw=;
 b=PLpk+SVu+t0J6S273xQGH4uo5KYBnVLQBhqG4LXn7x514oIL7J5T3sRfVyQaICy8dv
 Hr9i6y+1MZ28npR5hpBohq2xadkWll3U+Dpwytzf3FgQMnwklkiBm807KC3tqOvfVU/J
 lhgGnimD2h79zVJZdoOaTDM0mz/2++ul7pkBXQzDq+3RgUM4++V+B1z4+wHl6QDC/i7z
 W51xrXMv/FOnuKMAhWrD3zHttC3I7GBTDM7nznaDlbqL7ZQvI+HTY0QQ1pvDWRT9Jdmo
 NejUg/WYgCk9D6yMgppsV36/GntbFslGy0nVvQTT8FfKgHF+ar3FMJegbfP/2QVkGsyH
 WdCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737985684; x=1738590484;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pGSZQYIIEv1Hss+sXLGwkTIIM85rE82n5uM1Hs3Gbcw=;
 b=RUAwsoKCOeuK/7kOJXDyofcEpO5sSUbLsDWC+NveFLylGunp0BLHKLG6q7E3hpEHI5
 4JOl9WlO5xN4MaYBLgHLVr7lp5Jv5p7oJFahRIHykzPRZGU5QyHfiNTtnqZ/UuwCqJgh
 SK22oo2zpyr9/qOGimxz14Dr7VUPctJ7YPD0gSxhMsWh4HEHNZEvwf49kXO2sNrreXIN
 VeTEI9L2sWMLwZpChvkNcZwWLtY1Eq7SfuC+Z6s7HkxVFCIlO2FTt70SLeeDR130Pa7a
 13wP/0PXkz4f7sVrdPDfR+WKbS6IXw4Yfl4QBx+tgbPe4JfCinG3w8GIBEdIwiAA/MrD
 hfgQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYSlao5d50XFJbI0cawVjvv4I1rhHRmCdLjmPzReWreIArbOgOnXWRJ4CI14tyPQwBEbmY6nemIw==@nongnu.org
X-Gm-Message-State: AOJu0YwuIu4evBMYY50/TMFLjECE4wwWSrX9GWcUfaBheN2KkHgw17Nf
 5GDz059dHZhx3PF2NLWRFLRUl2xy7mBhgHVQoSkK4ORxWLUqInKkedMX3zXjownX2vfpP9JgP8G
 I5Oq2lUY+K0ckuqv6ftv086Ml4tOGAf+K2r/KIA==
X-Gm-Gg: ASbGnctrdHf4WRL0DrGUt2/vBwPQvmUdgaj0IuxmJkGUoYeFt306wFEb+Rg84hTyMvO
 ZNEahcH83NRT0oLU6Fkrx4qVVBcgfdI7bdlqlMv+OgrwL5R537Ye1ZR8Ya9daXQ0=
X-Received: by 2002:a05:6902:110d:b0:e57:99a0:eda6 with SMTP id
 3f1490d57ef6-e57b1096d49mr29452638276.25.1737985684003; Mon, 27 Jan 2025
 05:48:04 -0800 (PST)
MIME-Version: 1.0
References: <20250111183711.2338-1-shentey@gmail.com>
 <20250111183711.2338-6-shentey@gmail.com>
In-Reply-To: <20250111183711.2338-6-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Jan 2025 13:47:52 +0000
X-Gm-Features: AWEUYZm36kueC-tntTARxaKKD0Hfk85dhYcun4STmvqmv4sgZEWM-oBPf-kwiI0
Message-ID: <CAFEAcA8tcK4u1sRwO=ed39jt5+imQoOK+fp-w-ku2cSNTdc7HQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/13] hw/gpio/imx_gpio: Don't clear input GPIO values
 upon reset
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Fabiano Rosas <farosas@suse.de>, 
 Paolo Bonzini <pbonzini@redhat.com>, Guenter Roeck <linux@roeck-us.net>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-arm@nongnu.org, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Laurent Vivier <lvivier@redhat.com>, Bin Meng <bmeng.cn@gmail.com>, 
 qemu-block@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb30.google.com
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
X-TUID: jgVuIrBcEr/G

On Sat, 11 Jan 2025 at 18:37, Bernhard Beschow <shentey@gmail.com> wrote:
>
> Input GPIO values such as a present SD card may get notified before the GPIO
> controller itself gets reset. Claring the input values thus loses data. Assuming
> that input GPIO events are only fired when the state changes, the input values
> shouldn't be reset.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>  hw/gpio/imx_gpio.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/hw/gpio/imx_gpio.c b/hw/gpio/imx_gpio.c
> index 898f80f8c8..67c47a7280 100644
> --- a/hw/gpio/imx_gpio.c
> +++ b/hw/gpio/imx_gpio.c
> @@ -302,7 +302,6 @@ static void imx_gpio_reset(DeviceState *dev)
>
>      s->dr       = 0;
>      s->gdir     = 0;
> -    s->psr      = 0;
>      s->icr      = 0;
>      s->imr      = 0;
>      s->isr      = 0;

I guess so; we really don't do a good job of consistency about
how to handle GPIO lines that might be high on reset.

The other approach to this would be:
 * devices on both ends implement three-phase reset
 * device that has the GPIO line high on reset should ensure
   it does the qemu_set_irq() for that in the reset "exit" phase
 * device on the input end should:
   - clear the input-data state to 0 in the "hold" phase
   - ensure that its qemu_irq callback function does the
     right thing if it's called during an "exit" phase
     (probably needs no code changes)

That is more "what my mental model of the right thing is"
rather than something we actually do in many (any?) devices
today, though.

thanks
-- PMM
