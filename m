Received: by 2002:a17:906:d7a2:b0:96f:a786:ac5c with SMTP id pk2csp402454ejb;
        Thu, 25 May 2023 05:31:01 -0700 (PDT)
X-Received: by 2002:aa7:dcd6:0:b0:514:401e:1523 with SMTP id w22-20020aa7dcd6000000b00514401e1523mr1553377edu.21.1685017861514;
        Thu, 25 May 2023 05:31:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685017861; cv=none;
        d=google.com; s=arc-20160816;
        b=D5OxctUmi4nb7EzmXCxDAYJS+MXVxR+gtsYamcMeclY1n3ZLLvqQ5h4qQfuYTYcuzB
         7+VHmMIbwcmTlcbaKsCe8ngZ8MuiHyxgnYQsSuJkCQh7RYctGy30XzjPhXwCzpBvkEHh
         jfanMxdeIDDrjHpPRYFv0mYBvPXkq+O9SUnubNcdIuw/AK3bqc66IzrVX9RShi9rLzLX
         JhzMZ2kMTsRv+nb7nF19Fbmc7Ta7EI1HaPwsEwQuH7tZTgWlAJGxvQoeBSRDTHakPTKQ
         VKkPUnWEfSizHjq6pEGmIiYu0oSRLy9CFKgIhSIa4AeaqBn+gHkn7vc1QKwaV6gqrSEA
         2+6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A+Z/U+7mYwoqkhWgmcVkpFHOCV1fMx9hUmEC3Zzb0No=;
        b=iuRo8dmID5Uzgb4RFvcaY+7hFzb482qb84Y2h3XbD7/KRqJLhYa4wmrisnj9e7geX3
         ACmxs0jEHIDyA8VQ3p4cLF7xkPgIM2PyclekC8AFMDVrp/vv0iQ2xq0hE4vRF7ephIue
         uu68ZD61xsORTOPphai+2HhSvZBptw05ky5XFCmmMOeBFpUdQfrZ+zpvlIFznf8FfiOa
         Vm9jLb8/FhkvOZdajKxPPjTn3VH/0M5sFFyG+ybXvm6o/HR3i3Wy+IdUeAV2PULugBrq
         kcq8dxKICN+kn3+VH/Erry8UgbwYMNkrw9M8/6AmU6QdAbxwJl8IaKv3igz3+M9vK/se
         YObg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QwajTjXM;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a30-20020a50c31e000000b00510d015d02bsor656177edb.0.2023.05.25.05.31.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 25 May 2023 05:31:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QwajTjXM;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685017861; x=1687609861;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A+Z/U+7mYwoqkhWgmcVkpFHOCV1fMx9hUmEC3Zzb0No=;
        b=QwajTjXMBHY+2NRUfFXyAZVkoExdh9jNoD9Bqa5rrGY/lyzHSkwerhTBqVl+3YGYuO
         M/unCtnFDmJcGKsJoyrAgRDIC58kymfvR8B8U3VFi7cqnX/OpVOaXSVaebjSlq1UZml/
         lVOFrfmWE1db43PNqz02TNXsLTd7L5IEPYVg/CzHafrBP6FokZrGCU25qfcZ8i0Hvz+v
         VqQj9P3VcoOj/YJg5WPFPmUUZBkeIAzBLBr1bvZthC+zCC6YMbmurQTEb1tP9dLj7zPY
         LNjqVhCtyHwljqDyg+phhkE1rt2kKe9zhPdxCpxDC8mXE0yPACVcKPmeRa7lV9FIe21G
         p3nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685017861; x=1687609861;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A+Z/U+7mYwoqkhWgmcVkpFHOCV1fMx9hUmEC3Zzb0No=;
        b=cVq3v4v7IxTipHJlJ2L8vIJ1UYuj0k6ZGbwjgQaiD3F/y0uQWIXal16xbxGzjFx6gy
         I5H3XMruKaf7gvRNQ0Qw0oBt0gjlLGAgDEJvGXCQXA+sYXOqnmAC5jeQPFw414AyqQae
         Yw/9maj5RSe6pdMBE/WFLlkOPkq0VtAt4hrL/bSC0QPZpgnddv1/Kup0xRSPEJgdahWl
         3D4iOlIgdERJavoKiWsr1jLOLcbyrIpKl9ESGpS5LusD6TJeYgC4jnZ+2yV/pFIq48tY
         O8ZBnJ5397iJII2RPlyJxMQFN/wwvb8mmUbEKRLuFAJR+buG8XEUTJxcX3IdQ/6IEJgI
         wixw==
X-Gm-Message-State: AC+VfDyg0jPCjr4HKHf+hWX6PwiF6Z7dqnDgvr7POBpOpYPlC6Rpf7bx
	iPpwDf+W3b+ZJqJsNGk/WMfqGBJhByeklPByllCNNFJY
X-Google-Smtp-Source: ACHHUZ7fpCx4la7kBBOHjg1o/toEFTmClFjwmSxDLBaMNsiIXBZtzM7ZMn/1FJE0einCHHjUPEry+DK7DQS5TLRn11M=
X-Received: by 2002:a50:fa8f:0:b0:50d:abde:c7a3 with SMTP id
 w15-20020a50fa8f000000b0050dabdec7a3mr4151643edr.42.1685017861142; Thu, 25
 May 2023 05:31:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230522153144.30610-1-philmd@linaro.org> <20230522153144.30610-10-philmd@linaro.org>
In-Reply-To: <20230522153144.30610-10-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 May 2023 13:30:50 +0100
Message-ID: <CAFEAcA_7dkWB9qPkzYmW6_F1eaAet0PPk0PHywGS2EpAkFAsUQ@mail.gmail.com>
Subject: Re: [PATCH 09/12] hw/char/pl011: Check if transmitter is enabled
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Evgeny Iakovlev <eiakovlev@linux.microsoft.com>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 34taH+ZsFim3

On Mon, 22 May 2023 at 16:32, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Do not transmit characters when UART or transmitter are disabled.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Last time somebody tried to add checks on the tx/rx enable bits
for the PL011 it broke 'make check' because the hand-rolled
UART code in boot-serial-test and migration-test doesn't
set up the UART control register strictly correctly:

https://lore.kernel.org/qemu-devel/CAFEAcA8ZDmjP7G0eVpxcB1jiSGarZAbqPV0xr5W=
quR213mBUBg@mail.gmail.com/

Given that imposing these checks doesn't help anything
much and might break naive bare-metal tested-only-on-QEMU
code, is it worthwhile ?

>  static void pl011_write_tx(PL011State *s, const uint8_t *buf, int length=
)
>  {
> -    /* ??? Check if transmitter is enabled.  */
> +    if (!(s->cr & (CR_UARTEN | CR_TXE))) {

This will allow TX if either UARTEN or TXE is set, which
probably isn't what you meant.

> +        return;
> +    }
>
>      /* XXX this blocks entire thread. Rewrite to use
>       * qemu_chr_fe_write and background I/O callbacks */

thanks
-- PMM
