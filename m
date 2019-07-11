Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp728022wrv;
        Thu, 11 Jul 2019 06:21:03 -0700 (PDT)
X-Received: by 2002:a9d:4817:: with SMTP id c23mr83594otf.146.1562851262965;
        Thu, 11 Jul 2019 06:21:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562851262; cv=none;
        d=google.com; s=arc-20160816;
        b=HPEU1TiR0ues6A+Kw0tis9JzpB9/wcUhBUeS+K6esB2moFJktFbjnQOMo4pi/jBHin
         yjhYjLlU2LbEPKuIpO9DM5Wq/vbZ9ALbWJkbRjtOQW34wI0RM4prp7GJwbWAaI1ghvkS
         EmBL6xdahSN4fFy8Nwbm9PgyS8/7ftm3eP8/IMInrkElVJRv8z3axviI+HaFpIaXgtBv
         eWiszGUwA8573204YcvyF1ZjwtlZlyz2p1fSJJgMFFt6uo2rUUEFd+cqEj1JmEuB1vcv
         enuLmfDvdm7nR1pyVRtuCqmK8Zn0udAvvELEmbsR5GOtcwy1gJFBTCV1Gr1dIek5m9Xc
         UiUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Lcp9k0opTya91f+4IMBcuyOmLlUVUC4pWb9NC1Lzliw=;
        b=zBlv2CJ+8v/nMQHhhnxeXoPepjyK9rTfAaW7nQnF4JuNXiviHUPvnjPuFO0rK4JpHO
         gCP5HMyWCEwv8tyB+vvV55CIhkMGrsdXpMwHX/bjHh0sOzEbPzKwtQxlK5w1pMdS5fjy
         6YKJ4oCTiv8spVoWH2ydMsouWcMqhuwOWDDc74ABlGdR5/FGbpcQfZpY7gWxIxjj9iGz
         Z4Xd4CbFz7NlcsUHWMhOjjJp62zvxwELlnWq/qdUfcV+Q8kjXKwifcxrAwZIZRTDGz6X
         SUDxzALRgL5s00TeLz4iiVasem1T/OsAVqxK8IIDGGt238YTKyqguAdvAmBstFBiJtbq
         m0Vw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="gDNuGy/b";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id h25sor2925135otr.133.2019.07.11.06.21.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 11 Jul 2019 06:21:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="gDNuGy/b";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Lcp9k0opTya91f+4IMBcuyOmLlUVUC4pWb9NC1Lzliw=;
        b=gDNuGy/bF68EzD4eaEqTjYDtzdlVfVK4e/i6gLrmv7M68sP9yk/rXUCkpj+T36eNMz
         wasy4hO1FcuMKSyfvl+i9YaizgK2dEl6ZiQmU3hQXnCH4RgaLV4uK7LJoQVKPnQeOYa/
         psoe0ds+SirvKw6iMZsv7hU35Ie6yJdyIX4lSPRGdnDCtk0vFbDtFzE2mLwO7EZTeN3n
         OURrbDvQL0DIKJSwoaONa76YxkC0zJCibdGljVR3LwJteWAqfg6OszyX8d1QkQd6oSMD
         7PUTuO7JI2YdMhqyZbg9Lg6fxqJRLX70vHcNFnPVeqWIwITxO1s/IOp7BGOTkHfZjND1
         nD7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Lcp9k0opTya91f+4IMBcuyOmLlUVUC4pWb9NC1Lzliw=;
        b=kccwZP5cuWwRORiGu2ipKt5A/guVAfRzqPXL7homy99QldaSSxWCGHRMPf0t2rKZt2
         8734KUcrGoQpJUivToAf6NZ9sXHEh41ium2hsODTBY3bpQBGgn6KEnr6e3SPS08A845g
         o1uzIjrVf1uHrk8LOAYS5dg0R87KzXly8mEaXeDB0G4WzFRYvjazkYpT6GM0cQFX2UTf
         hMNpC6Vy9sUB/J+O/hS6W8NXGHhFWPRpj7gWi9h8XWJsCQudLzoLFJFjEhySaOHPIyXp
         9TIVpQQxdR85MY6d7T7EvHxEX8/+taeUcYewgYk2kXTlRs+2s+u+NRlysrt8WbDcICVD
         3FXw==
X-Gm-Message-State: APjAAAVsjRJBRsjnPdUZogNZMIHX9q0rS+JTGkLwmzva5aYGNxwUZZoQ
	Mv+qN0Ahfy4jOQVGrBjKLsFZHKz0C2BwhZ5oM242nXXZr6l1Qw==
X-Google-Smtp-Source: APXvYqyWKBUWQrdv/JflIF3uJwvBRdOkZ6DsrSit+WehdGcYmQBq7erdd9Zax4mMAEENWxH6kK7PO78Qz/1f4tyXlJA=
X-Received: by 2002:a9d:5f1a:: with SMTP id f26mr3456192oti.91.1562851262430;
 Thu, 11 Jul 2019 06:21:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190710131325.21442-1-alex.bennee@linaro.org> <20190710131325.21442-2-alex.bennee@linaro.org>
In-Reply-To: <20190710131325.21442-2-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Jul 2019 14:20:51 +0100
Message-ID: <CAFEAcA8gZ5+tQMXRHG=YwK3ht1F7x2SDp4neLtfjcbveLfyC-Q@mail.gmail.com>
Subject: Re: [PATCH for semihosting-tests 2/2] semihosting tests: add v7m tests
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: Pg2qGONsiAdR

On Wed, 10 Jul 2019 at 14:13, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> M-profile has yet another way of triggering semihosting calls using
> the BKPT instruction. To support this we need to add a M-profile setup
> so we use the nice and simple microbit model which has a Cortex-M0 in
> it.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

This generally looks good. One issue: when linking the
compiler prints this warning:

arm-none-eabi-gcc -mcpu=3Dcortex-m0 -mfloat-abi=3Dsoft -DUSE_BKPT -o
systest-t32-bkpt.axf microbit.lds start-microbit.S string.c usertest.c
semihosting.c semicall.S printf/printf.c -nostdlib -lgcc -Xlinker
--script=3Dmicrobit.lds -Xlinker --build-id=3Dnone
/usr/lib/gcc/arm-none-eabi/6.3.1/../../../arm-none-eabi/bin/ld:
warning: cannot find entry symbol exc_reset_thumb; defaulting to
0000000000000000

> +ENTRY(exc_reset_thumb)

I guess this should say "reset_thumb" to match the
actual definition:


> +        /* declare as a function so pointers are appropriatley "thumbed"=
 */
> +        .type reset_thumb, function
> +reset_thumb:

?

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

PS: are you deliberately sending these to qemu-arm only
and not qemu-devel ?

thanks
-- PMM
