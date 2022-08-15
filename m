Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp1463992ejf;
        Mon, 15 Aug 2022 16:15:09 -0700 (PDT)
X-Received: by 2002:a67:d215:0:b0:386:94f6:f228 with SMTP id y21-20020a67d215000000b0038694f6f228mr7477804vsi.10.1660605309301;
        Mon, 15 Aug 2022 16:15:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660605309; cv=none;
        d=google.com; s=arc-20160816;
        b=IIGzn4PhmhJlqESgS22RwwNuHbIzQcNHilGAGa5vY+pss56Bj6t7vpEiVrBdBTZNpD
         pcOnRfttzYDue8x2q2HXsw0xmFJUuuMy5jKusDcfLgJ77pOMNuf1dngOV7rkRtuIPhFk
         Za+Eqj1FkGq2vc/ONolnPrAWmbqFpn4f2Wpv06QNTD9DxOLIQ/7iKW/OZmPlgNAsN8wU
         8insESlZmXXByFfdVehmJUxu7edPXg5aGiGB9PKZVhJGV1bx/aWrWETeZVpqDfDP4iPw
         YyzUt//t2rf7aprsq7xIlyBtpar/q3a33rgMWe4BJ+HHgXR3A0kd9psgz4F/JgoD8QPo
         WLhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1p30cTHaDHwD3tSkpCHUqDSGnIBEry22la+MZDLe2QE=;
        b=gpLpGeYL6dd2wupb5dbC1hQdp8NnKkbXIyWsbXkFuvYl1XsiN+HOnnFc84E266h6ab
         ZfXUrZuE4/NBif7KSJu+y992R8CpivHpgCeGjcEUnKnj0Mt7r8z6isTEI9GzEN3Ovxn2
         IgIJVqLPutLVhNbYn5uoZlzPD2Spd9GGj8ts10J7XG8aVa0odSQrEQ3CYaeTufaCTX24
         vGvFDYcaehT1R8mxUW1xYSbTWEXnrMlhsmG3umtUjS/e6VnFHZu2NFbDMz+XQ2GzFGVS
         kv79HxOkweUjrasUl/CQnMSWlJm1192OgOu2kC63dttEF0wPqEj3WFhS7NNHvd/gz2JN
         fjJg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=QpeHYiSf;
       spf=pass (google.com: domain of jcmvbkbc@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=jcmvbkbc@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <jcmvbkbc@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x12-20020a056122118c00b0037cf8349812sor2625128vkn.32.2022.08.15.16.15.09
        (Google Transport Security);
        Mon, 15 Aug 2022 16:15:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of jcmvbkbc@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=QpeHYiSf;
       spf=pass (google.com: domain of jcmvbkbc@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=jcmvbkbc@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=1p30cTHaDHwD3tSkpCHUqDSGnIBEry22la+MZDLe2QE=;
        b=QpeHYiSfjc0RfUXDTcFFJbmXhDW5Atha1lUgiAFk08pgPrAIvFpi4aWFhziG4MArSH
         rTqZjfPrUgJp5DYwtQXc5jKFH/PdHHAW+6qXk3D4Jpas4tQ1xcwm38lHaNTr5a8v1W5+
         fjblPy3CmO8lLIBzg0A3Z9aO/f3UTKusU26IgbUcC4lLH4EypS6W2CSl0hiZdsXNOKQ7
         S51bkOXsit0IA3BJM+q0NWriwXJI2g9IZIk3fGTYlruFv0rni94Xrl3ccxVdohTqULyd
         MSGtTp6SUf0dvsu/OeQp8YKRgsmwo4kVcZZQj2C4uW/W2iol+jdo8eJsitqdCAWwDkZ6
         4baA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=1p30cTHaDHwD3tSkpCHUqDSGnIBEry22la+MZDLe2QE=;
        b=5vayBinLStgiUfMmyMtgIoUa5ZsUwJBEJxT9IfeQ+oKgVsOWhRhmehQrFqh7GXhUkP
         uL0xwtWfCaaW1kktz49GFiGpu09R1gExOeQW9mnQIVDaFzTuCwMP61frc2ARGIvnA1kV
         DVdKtIbS2nuP8X6uKJtMJfOH2K3pBKZbwQBzM+CBuub9JOBj4aps3S22lmJWjDrYhpjw
         dC3GwtmsjjCATUNyDRrXl2Sr9/+55Myn1kwb0oiFcigYoqSSY9/mdneVKeYv9MKWdq19
         g2weVIFZVKEE+iETL6UpSOnJvu6KhC9Ju49y3YFZ2R3968UGRSk3pyl9oIw9FwId9P5T
         bS/A==
X-Gm-Message-State: ACgBeo2EjZkXsvkDiCFTfUFwD8+dWTlLMzz6uekEpkxPHgc06j4IkBSf
	UF+KxgFyWf7k14UwlE+cbPLaXremFD4JErzlMMCkaoIJ
X-Google-Smtp-Source: AA6agR7sdJxpn4iBDV36au4BAIv/LrJGW3rDhg/l6Jr9L6KO9mbxxnzQaBK/Vv0AlaJd0ORH5jgY6QobctFNen4BEBc=
X-Received: by 2002:a05:6122:ca3:b0:378:cf0d:b458 with SMTP id
 ba35-20020a0561220ca300b00378cf0db458mr7534274vkb.15.1660605308334; Mon, 15
 Aug 2022 16:15:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220815190303.2061559-1-peter.maydell@linaro.org> <20220815190303.2061559-7-peter.maydell@linaro.org>
In-Reply-To: <20220815190303.2061559-7-peter.maydell@linaro.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Mon, 15 Aug 2022 16:15:19 -0700
Message-ID: <CAMo8BfLzPLit=fyN9Q4fUbrucWrewmPnsNx8JiH3gZwVQ8aHxw@mail.gmail.com>
Subject: Re: [PATCH 6/7] target/xtensa: Honour -semihosting-config userspace=on
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-riscv@nongnu.org, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Laurent Vivier <laurent@vivier.eu>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, 
	Stefan Pejic <stefan.pejic@syrmia.com>, Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Alistair Francis <alistair.francis@wdc.com>, 
	Bin Meng <bin.meng@windriver.com>, Richard Henderson <richard.henderson@linaro.org>, 
	Furquan Shaikh <furquan@rivosinc.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: gBLC2tFIBYI8

On Mon, Aug 15, 2022 at 12:03 PM Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Honour the commandline -semihosting-config userspace=on option,
> instead of always permitting userspace semihosting calls in system
> emulation mode, by passing the correct value to the is_userspace
> argument of semihosting_enabled().
>
> Note that this is a behaviour change: if the user wants to
> do semihosting calls from userspace they must now specifically
> enable them on the command line.
>
> xtensa semihosting is not implemented for linux-user builds.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/xtensa/translate.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)

Acked-by: Max Filippov <jcmvbkbc@gmail.com>

-- 
Thanks.
-- Max
