Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp522452lfp;
        Fri, 24 Jan 2020 04:58:52 -0800 (PST)
X-Received: by 2002:aca:d6c4:: with SMTP id n187mr1897778oig.29.1579870732212;
        Fri, 24 Jan 2020 04:58:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579870732; cv=none;
        d=google.com; s=arc-20160816;
        b=LIC88+UGHJV7rHs0KptF+gYpZbodIIU40ZZoHsD0hIvRyRCFhCpbTC3PI+83hH3gF+
         A2HhXWc0/ORX+hkQuSECTXAn9TqzqYiDXyrKApVDDwCWFOW9+WS6nRNKrkbrQuq9x9Ys
         vX2Klce/3Am61u5bot8AjmyHsDgp7D+1WsN+qFOtCCJS916iuIqbxi4BcRKQdSJpuJ7o
         2VxHdRqAVL2edZVSvAicpYKrWyU3ilIiXcLfUhnbY+UAHJkjFGi//EHXBxERgbjj3dcg
         +PT6BSww2FAhIZGxnVkLgNFYmRmPO6e8U8XIR0tZceikuuW2khEkUryGfS9eDufz5vTb
         NO0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yP7QfpEU56++xnOHFKaFalevPO1YD+HjvVgBb9MUpRQ=;
        b=qlgN4SVpoz9iOiYywm0uSNO9J9mtr6gy1ERjjxCxG8tyoWQs6A5TR7GznpUhUx14pB
         iH+0X2WD+wHtaDQO5Xl04CWvpohmHPbPdIYOfzoszzXSCW2Yvz5G/EKjp0wYiRGR7+W+
         f9qhUu3Ob13qBxbyFP266WCqAMj/HScvyD8K8BPhVKuupydmLXVeDsveVZxbv/phWq2o
         2coj6fhJJUfInt9u9Br4JD3jrkPrd4v3eQ1yPAxBd8aMsKjkab685lC4NWkvP5i/ioO5
         NcTYOkhoZdCGzzVGDmtj8Hkk9VUcY3mBbLlrOqlE749mFdJHj62Z/4K5ADnemmwaELbZ
         816Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UL8Ko1a4;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id m5sor2849861oif.109.2020.01.24.04.58.52
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 24 Jan 2020 04:58:52 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UL8Ko1a4;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=yP7QfpEU56++xnOHFKaFalevPO1YD+HjvVgBb9MUpRQ=;
        b=UL8Ko1a4UWgJ28hHas9TUNXZOwqkzBdeB31mJ3+JCQUl4kO5UzN4PL6biEXH6KIPKv
         0OuFxDFKxgZ0YbS3PApf+Et1wMZafhgQAPP43v3d9Ap3WbiGwIetW7wwSO87X1RpX522
         FYbdCgo8FlLbv6PVARLg82/ZBmmPSzca8Cs21zZ49OEqNIZOeOYMtmLz95aER6IgAIDm
         6Mq4Vu2xTNvG47/Gw2YgN+3+thvARdRdUuJdAI4eQXBSKYojxu6JVHaqYHmdzjQDhZ9x
         LCqBf6jcG7GR5Gx95SABNcZKGiYuKlq0CnJMvEGVKzH75sJP48XCHUWNL++aIu5SGsB2
         BSlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=yP7QfpEU56++xnOHFKaFalevPO1YD+HjvVgBb9MUpRQ=;
        b=A5r8i8UZdHL3oJNsVF99UQkW5QvqAqvks3CwAS2AD609OCubPPA5cJJoUCk64+6dhN
         FQ6MrIW77wqzfx5RAASpD9IUMiqJMwjx+gQ2OcONVbIwNOorHSn1bI1XiXYUFBs8alqM
         ASikMA1XqWgNbgwFMdgxlI7cvXRqb8Pi9OqYYE7E6qPXLzjOF9nb5B6PkvJF6/Gkezlt
         YsRlQzLeBaj91GWaXJkk7vqdt0ecmVkKVYjZ4LL+f0YTrw6UK2/LBsMXA9fVWS8cVdnZ
         oqPejILqVL5PPxrGw6fQo+Ymuu1VLyxIeGDjxloNV4rkdANJS7WaRbwoBF+xmOlWv7MD
         YYFg==
X-Gm-Message-State: APjAAAXZsmkXYHpQ23yWIn4nqGtAeDwMc5n7twy+YmLCnGNJAW4AfT5u
	x3MVVU5RrlsV6HoAYZwrUQ57iCjtJsUMs0gxtGZKUuce0VnbNg==
X-Google-Smtp-Source: APXvYqwodPgS+HQq5M1jDaTFVhF5wLpX1q/kLblH3tZm4gMFplIymd168LH9Z/R4fWbdtB/luuoHMrSPHW68dYsRNAs=
X-Received: by 2002:aca:570d:: with SMTP id l13mr1861985oib.146.1579870731489;
 Fri, 24 Jan 2020 04:58:51 -0800 (PST)
MIME-Version: 1.0
References: <20200109141858.14376-1-alex.bennee@linaro.org> <20200109141858.14376-12-alex.bennee@linaro.org>
In-Reply-To: <20200109141858.14376-12-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Jan 2020 12:58:40 +0000
Message-ID: <CAFEAcA-os-6iWZ-ucM-VUECyf8sn-xoANHCqJqtSyuttgZY23A@mail.gmail.com>
Subject: Re: [PULL v2 11/14] semihosting: add qemu_semihosting_console_inc for SYS_READC
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Keith Packard <keithp@keithp.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, 
	Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>, 
	"open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: Wshk3JYEBrYx

On Thu, 9 Jan 2020 at 14:19, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> From: Keith Packard <keithp@keithp.com>
>
> Provides a blocking call to read a character from the console using
> semihosting.chardev, if specified. This takes some careful command
> line options to use stdio successfully as the serial ports, monitor
> and semihost all want to use stdio. Here's a sample set of command
> line options which share stdio between semihost, monitor and serial
> ports:

Hi; Coverity has some complaints about this code, and
specifically the use of getchar():

> +/*
> + * For linux-user we can safely block. However as we want to return as
> + * soon as a character is read we need to tweak the termio to disable
> + * line buffering. We restore the old mode afterwards in case the
> + * program is expecting more normal behaviour. This is slow but
> + * nothing using semihosting console reading is expecting to be fast.
> + */
> +target_ulong qemu_semihosting_console_inc(CPUArchState *env)
> +{
> +    uint8_t c;
> +    struct termios old_tio, new_tio;
> +
> +    /* Disable line-buffering and echo */
> +    tcgetattr(STDIN_FILENO, &old_tio);
> +    new_tio =3D old_tio;
> +    new_tio.c_lflag &=3D (~ICANON & ~ECHO);
> +    tcsetattr(STDIN_FILENO, TCSANOW, &new_tio);
> +
> +    c =3D getchar();

CID 1412794 points out that this assigns the result
of getchar() to a uint8_t, which drops the distinction
between EOF and a legitimate byte.
CID 1412795 is then kind of a run-on error from that,
complaining that the int result from getchar() is
truncated before returning it.

I'm not sure what we should do with EOF, but presumably
we should handle it in some way.

thanks
-- PMM
