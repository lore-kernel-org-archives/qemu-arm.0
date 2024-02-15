Received: by 2002:a17:906:d9da:b0:a3d:1c09:7d3d with SMTP id qk26csp577449ejb;
        Thu, 15 Feb 2024 05:51:27 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXuOw4hMt2a4uCmUdHt5vOfwXtlQmwvWpP6+LctBRKjDqn0IZtZJwfD5Uv/5XSoj27eZUpqkUAUW0YG4fpZs81ORcM2wXL+
X-Google-Smtp-Source: AGHT+IFBymyS8V2CzzQyJjAjRsBkZ9JiKgi12t6S6ODjdOBFb1Gc7+gDQHfG1BTvNqvtxva3uRPg
X-Received: by 2002:a05:6102:cd1:b0:46e:d8d0:49c7 with SMTP id g17-20020a0561020cd100b0046ed8d049c7mr1826976vst.35.1708005087414;
        Thu, 15 Feb 2024 05:51:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708005087; cv=none;
        d=google.com; s=arc-20160816;
        b=P1qd4Va2XNjrO3q1gZEyPEG7u1lGNsgwt/WdJpNNT442juQY9dHeAXpP827s3Y6MJe
         yOpX9yugaUp4OAOdY5BuQYiMmWuTu+H2Hgjgd8b4jxaeiqt/IaTkqWLn92MIw+gaBD/d
         VNHk8roEfGvmTUBGuGPLM8abQd+aPIrhfY5go3IhWet2wlWvC+N8c28nEQMmbXDOdmAN
         whYUN/CEO1pX5CTjDxDs5wM7HCopzj8bkn43YhvrpDQuRN8G3EIkq8/GdGICmSSg6F05
         picFe/x9LhrAQkXjHn0oI4NQ+SpU2EtqKoGiifkyQPk/v5TjMhCWavvOadWuKlr2mXDc
         8+ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=hyaJA0HNIcaRxRK+On+ocjBrpyNSpvXsCeRbmdnaBnk=;
        fh=lNJVE0LFEzmz3jszBMsMlaF6yrwOq2lY+Y8CEEOon5A=;
        b=qceQfsiT4S/E6eReng60/YGmjqhwfKKJrpjvpK5OOsb07Ouw4DcVlkFA0MbsvcitZn
         DXfyZjlVADMwC20aIuQ7fuk4mXYu6/H20G9q8mnxlttAIYttgu78zOgR+cgdRlK6xFZh
         A0CTOeMHC4i5EMGAtCQFuYbFzviAE6XXMAUzgrfCIUGUkKuQtFb/Vpg1BFyBqxIohEnD
         9P4h2LXRZ0zQH819G4VIMIf4GNK+OKQ365Foqs72XPJQS7J/GnHFOVNG8jqS3oi04gr9
         RQyDMkYyoYUlwmULvaiyEF2xgmm/nxm3OncVPFrcCQpGeQbx2EXavP9Y/iC8mzWwql7y
         /XuQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e0PI5BAg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n10-20020ac85a0a000000b0042dc8d7b926si1499209qta.468.2024.02.15.05.51.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Feb 2024 05:51:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=e0PI5BAg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rac95-0002m1-C8; Thu, 15 Feb 2024 08:51:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rac8m-0002jM-AV
 for qemu-arm@nongnu.org; Thu, 15 Feb 2024 08:51:05 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rac8f-0001rY-21
 for qemu-arm@nongnu.org; Thu, 15 Feb 2024 08:51:04 -0500
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-55a179f5fa1so1329405a12.0
 for <qemu-arm@nongnu.org>; Thu, 15 Feb 2024 05:50:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708005055; x=1708609855; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hyaJA0HNIcaRxRK+On+ocjBrpyNSpvXsCeRbmdnaBnk=;
 b=e0PI5BAgecye9W3W3pHxC9RFOnfA+OSFLEFbSdmiD/1RU0c8wj819a2NtyAZbD5P7F
 Cpoil1oQlgMyZ0T7fhj6nYaWnqgvUguLV9PCz95REBU1LZ3V+7WoEJ+WheyMMibOEv6m
 x0cEEcgnKXraAOFF2dEJdf4SVgvTxaUebUnyvT2HAZdR95ksMYIozO0NW3SNVuLWs5cK
 h1OFpJY+kgmh35sHhhs6kubVES54WP7njom2wJYGP4EIwEUVozTkGVpiLvt4FV/PTli6
 khEFN44Z+hG61zo11CoJBvEFBClelOGyVEMukyM+TuoWRY+45umzdw3P4XEFi2Rn/QMj
 Y+Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708005055; x=1708609855;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hyaJA0HNIcaRxRK+On+ocjBrpyNSpvXsCeRbmdnaBnk=;
 b=owFbn7Hea1fBrqboQHBD3W7h7otWuSW0jeWIIITLcwk+CyVrrOT7kzEPdoo7IHZ4wI
 SyO7dD3mxk3kxveXvWpf06vguDQzcwXcBb/tj8JxoBoLfH55/rRX3g6NAwOIc9wxFRhS
 cC7LLrfblRUoGa2XZ3oHXroI2Q85pSuafhME892GOVbIJWBU0rmojw8/uxC1LK4B5eEQ
 yPUtoXlW3tFiVG3mMBnh+BRyEroWQ7tKbeJmiCbNncJFtKpmh5tWB4HKC9h5IZSeciLS
 xWUQT0MaeEbvi9gClnmIQhPLQNHXTEJPsrnMRAwuWRGGI9RpaUwRyJIjfMbfbjU4gwmY
 n3OQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUTGi/FL/1UbaOvejJ2Kzb8Z7VZPQk3TBo+Ym+jk72RmqHh9riAGTz78xpRi5UUHkWszwhJLEeSdvacSncLHiMLI0gU
X-Gm-Message-State: AOJu0Yz1RmKI6S5d5mJPV3277fs3vfq4DdDK004SzXfw39CFA8F5o3UD
 0f0SgSknRS7yCg6miUJuUNPkANE/wy1Ua9S+iBofSV1NICUkshptZ91DFngjZ4hOsBbFpEpnZGH
 E5BdMko98Vph1ngp/eIIDv9/mYtMSTxjTj8yZTg==
X-Received: by 2002:a05:6402:2cd:b0:561:f236:a480 with SMTP id
 b13-20020a05640202cd00b00561f236a480mr1311088edx.7.1708005055239; Thu, 15 Feb
 2024 05:50:55 -0800 (PST)
MIME-Version: 1.0
References: <20240213155214.13619-1-philmd@linaro.org>
In-Reply-To: <20240213155214.13619-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Feb 2024 13:50:44 +0000
Message-ID: <CAFEAcA-uk4Zyc=ULzESFLxWrO3Sdpm_cPKmkKsmK5obuntWYog@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] hw/arm/stellaris: QOM/QDev cleanups
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Gustavo Romero <gustavo.romero@linaro.org>,
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52b.google.com
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
X-TUID: EY/WDCAr+In6

On Tue, 13 Feb 2024 at 15:52, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Since v1:
> - Rebased
> - Split I2C reset as enter/hold/exit (Peter)
> - Added R-b tags
>
> Gustavo wants to access the QOM path of an input IRQ line
> from the NVIC, but since the device is orphan he ends up
> with this nasty path [*]:
>
>   -device ivshmem-flat,chardev=3Divshmem_flat,x-irq-qompath=3D'/machine/u=
nattached/device[1]/nvic/unnamed-gpio-in[0]',x-bus-qompath=3D'/sysbus'
>
> Add the missing parent so the tree is now:
>
> (qemu) info qom-tree
> /machine (lm3s6965evb-machine)
>   /gamepad (stellaris-gamepad)
>   /oled (ssd0323)
>   /peripheral (container)
>   /peripheral-anon (container)
>   /soc (container)
>     /v7m (armv7m)
>       /cpu (cortex-m3-arm-cpu)
>         /unnamed-gpio-in[0] (irq)
>         /unnamed-gpio-in[1] (irq)
>         /unnamed-gpio-in[2] (irq)
>         /unnamed-gpio-in[3] (irq)
>       /cpuclk (clock)
>       /nvic (armv7m_nvic)
>         /NMI[0] (irq)
>         /nvic_sysregs[0] (memory-region)
>         /systick-trigger[0] (irq)
>         /systick-trigger[1] (irq)
>         /unnamed-gpio-in[0] (irq)
>         ...
>
> [*] https://lore.kernel.org/qemu-devel/20231127052024.435743-1-gustavo.ro=
mero@linaro.org/
>
> Philippe Mathieu-Daud=C3=A9 (4):
>   hw/arm/stellaris: Convert ADC controller to Resettable interface
>   hw/arm/stellaris: Convert I2C controller to Resettable interface
>   hw/arm/stellaris: Add missing QOM 'machine' parent
>   hw/arm/stellaris: Add missing QOM 'SoC' parent



Applied to target-arm.next, thanks.

-- PMM
