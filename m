Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp842460lfc;
        Thu, 12 Mar 2020 09:22:31 -0700 (PDT)
X-Received: by 2002:a05:6830:2091:: with SMTP id y17mr3265244otq.206.1584030151314;
        Thu, 12 Mar 2020 09:22:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584030151; cv=none;
        d=google.com; s=arc-20160816;
        b=nqGXc1rTiwW9jUpUYXLyKhHUQ1PDDQe2dl0HIOnQZcGNXJnCnnn61e1Krm1WAxKA9i
         zKYuntEEv2wSNAtwhuRufom0B9vnOj2Y+QNd8EZZZBkL4UPU+zloOXb/I98sdZ1VBBYJ
         q8DECvN7V/ylpTCf5ySDYou8V83KPU5+R5Fiv1Egk5y1nC2oqXSVzOyBJ5nmW62e8hlX
         pGLWn6Rf6VRGS0haCEpGg/8opSkfvjIXezOg1+lz7q/MOnhH2CoH0KYRYtVWl7AkB8Qa
         xBlkvmJGGGzz9ozhJlC05pK8MyeoKxwqydrRpwrKWxqJMtYpsB6JoHC/jE+IuOZq/M7n
         4jpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=n8mouH4+5KXIU8ayOQ93LGAgkFs47pe1sEFjRgLZ1/U=;
        b=jGG8YehOazyZZmUNdyt5Xgwl+WiLWu4SebMVIbU9zRBSFmDJxKzglGIHPixf7q5dZv
         IJqrlXEVbGJvXAF332dgWUF2hMCIEjyK1FZqyKlPGhZwExQjRnOlg9jB076yAAFqlxD6
         DwmECVLzq26Xb7JFGXq428ODJYJ6RMZqZXqquEIWXEK2dIsFMW6MoZsts3r++FSFO6Tv
         D4lPbj+le92+lBu2NmLMeD847VL0ps0DkHfUsaS5UE9/NdE9ZvRDRlPh/97SjQ4KM6jJ
         1ZePkcgizPDNG4HVf9VmQgFJ0gtYLxBw4Rxckzh00LZtWEt07X253YYdFVcXg7EGKq+7
         sGhw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gaHs3QU9;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id y63sor4165755oig.74.2020.03.12.09.22.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Mar 2020 09:22:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gaHs3QU9;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=n8mouH4+5KXIU8ayOQ93LGAgkFs47pe1sEFjRgLZ1/U=;
        b=gaHs3QU9bPUoSE/1Ij8i64wwJXEznu8EGTgNACwRwFbeiUhWE0Ejw7gWVY1n5PTcU+
         qGhRyTQMYv1RaVu5psGuJAldAe9g3QhQUoPOy3m1G3UBlUjPXj+TrMIdkS54bUIpDCIJ
         ZoMruusZcBMBK+Z6IoSMXs+L2eBD6TM51xV6GY8+hSKuJ5VFDBZwegwq8ryithmW5lBm
         /WOqKlQzAGiOLcBhiGGU+Fgik3I8nQS24ccxBBzTEaXOudAwyYWN3y3FAG8ngVeOv2Pa
         tcwXYb6AOeCvTRiRbDrsMW+P/bJYHZIuegUhNBeppYlkK+4vwO362alL0MaYqB9fe1pl
         d3QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=n8mouH4+5KXIU8ayOQ93LGAgkFs47pe1sEFjRgLZ1/U=;
        b=E2i97skrwddRmN9Mm5bkpmVZv4CEYMGB3TqMBfNbepHuSbhL5naxzNCSoKGKDPkjaU
         Act0Vu66uo5jTC5fQuTKQqexa9RwaApdH07cLzypBK4QlMR3dReFNLN8BjjSIBT4n7xi
         kdb0CvejTlbfzj72UwqD95VF5ai0a5swj2/CV7/OIohCQ+aniI2IDTcGWan0HT7gkPO6
         B9JsDl3KeS1KuOwzCy5y9isYKE9am6x8j7NY1oPgun2Dp0PqgUmdQaPdUqHnBhTUeue5
         H35tl7owh8gk4OkmRE905c5zaPaSI2wIzjeNdbbkDvoSaB93pNmYdM3EcjFtFFtlUOZJ
         bQag==
X-Gm-Message-State: ANhLgQ3bH1vv92kaEyBjfHhEAmWJzJu1VoBdmv4QL+tmOmwMYfOsjEHq
	mPHiy6wKnkeRgZtJBnR6bQrqbG9fRDuGh1I4QlLHFR0S
X-Google-Smtp-Source: ADFU+vvm44QeZu5ArgZHy6JC9416PD5p7ISXpNWGeiJLcDgIKjF8BqpmiDXrjBzfiR6rVei4BxgtyIasTqglgktXers=
X-Received: by 2002:aca:47c8:: with SMTP id u191mr3355461oia.170.1584030150729;
 Thu, 12 Mar 2020 09:22:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200311221854.30370-1-nieklinnenbank@gmail.com>
In-Reply-To: <20200311221854.30370-1-nieklinnenbank@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Mar 2020 16:22:19 +0000
Message-ID: <CAFEAcA9UqDRT-32Qnap8n3uYh8hyK_89KhsTwceHDRiTzihyJg@mail.gmail.com>
Subject: Re: [PATCH v8 00/18] Add Allwinner H3 SoC and Orange Pi PC Machine
To: Niek Linnenbank <nieklinnenbank@gmail.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
	Beniamino Galvani <b.galvani@gmail.com>, Jason Wang <jasowang@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: 4aUI2H1MGqC9

On Wed, 11 Mar 2020 at 22:19, Niek Linnenbank <nieklinnenbank@gmail.com> wrote:
>
> Dear QEMU developers,
>
> Hereby I would like to contribute the following set of patches to QEMU
> which add support for the Allwinner H3 System on Chip and the
> Orange Pi PC machine. The following features and devices are supported:
>
>  * SMP (Quad Core Cortex A7)
>  * Generic Interrupt Controller configuration
>  * SRAM mappings
>  * SDRAM controller
>  * Real Time Clock
>  * Timer device (re-used from Allwinner A10)
>  * UART
>  * SD/MMC storage controller
>  * EMAC ethernet
>  * USB 2.0 interfaces
>  * Clock Control Unit
>  * System Control module
>  * Security Identifier device



Applied to target-arm.next, thanks. (I moved
the doc into the its new location now that the split-out
of the arm board docs into separate files has landed.)

-- PMM
