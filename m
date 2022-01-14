Received: by 2002:a19:ca48:0:0:0:0:0 with SMTP id h8csp249976lfj;
        Fri, 14 Jan 2022 08:41:24 -0800 (PST)
X-Received: by 2002:aca:3014:: with SMTP id w20mr11959328oiw.69.1642178484571;
        Fri, 14 Jan 2022 08:41:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1642178484; cv=none;
        d=google.com; s=arc-20160816;
        b=mpfMPH6QurjTAcrAXUcFr03GCTeykyFdbK+lHAyrsMZXe5bUZrxfqX4miBatUh10fm
         KAfn+y7hsA/NQahWht9MASQ4wTr2nOO/M9mspbJ8pZZpb1bvrf2IXnuxI1jvIJwAduo2
         z0vfonblgt6rAobVbyQ5VXb4+QTAKItNM/GmFCCVJh0+Pv83Tw9DivI/V/YQn7Lmruv0
         W377Gt4pC/ZPS+BKNuIWTuoHSdjao8Vo6OglIpQCLPsz46pHeYeGzUfAd29Pj7RnkiL/
         7DQAWqgePVtCz/15ni7kn2/FPrLWpIpMx2YFIaOl9Vj8Yz05F3ITTnruhCejL5I2G4UK
         cTbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wWdArF1DZPGsAoS444Kcg8YCjjpZ0B/iCMzrUY0UjCE=;
        b=Yx1iPbi6QP/cFyEGNGHW3jqsI3KMIIJ4CQTlaDfjKlU+enqUW1NIjh2zuRyHvT3WB8
         Rv5KURyHfnxnC3aUsRDcaQUyBRPyuypECwiOUmaPtyUY9JkjdM0RxZ64or8R50j9VZwv
         mj8lDeZPW4NyOT3SegKBlQgxjnrQ8Y6q/K++1gWM+rJSQQlVqiXT436AjUTlntM9FWKP
         65iSoKBfEY2QHkw/1gcKzA1Cefgv5DOrnrNaxSpL/VKRNM0lKAveApMvY7oYnItSuYib
         CwAm7ZqI5Xr4LmGr2QVLkpr+36JnMhRyGK7tVbu7BftYXfSUPUpF1anwPaBxdd7O0gWj
         f4FQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=JJgvXt5z;
       spf=pass (google.com: domain of idan.horowitz@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=idan.horowitz@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <idan.horowitz@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q9sor1317608otg.182.2022.01.14.08.41.24
        (Google Transport Security);
        Fri, 14 Jan 2022 08:41:24 -0800 (PST)
Received-SPF: pass (google.com: domain of idan.horowitz@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=JJgvXt5z;
       spf=pass (google.com: domain of idan.horowitz@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=idan.horowitz@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=wWdArF1DZPGsAoS444Kcg8YCjjpZ0B/iCMzrUY0UjCE=;
        b=JJgvXt5zRhD3CTaXj5At/d5oOg7sH/7xM8MgvLKQp3WgeqfPrZoDkixZzJarRjgaJr
         QOF+s/I/gCGlbSPkeQnZ59FbHJTHaowZ4RkX6qPvNQZB2Laj+ioR+TxE9/hq2k1pVY9c
         HrKyCT22/jC5Ru8ITzGE7X1NRIH2gmtP9wfx3wi8/IHc+/XK+omZPysSb6q4Sj0qXMO7
         xuTWsMQJWiRUwheP0st4ApPQiBrv+pq/FlFYQHCs8KBY54kvbrrHLDID0NyxZHqUg3IS
         taCqrINjU1JCvCCwwz9mzJNac7B1NvvmoKT1YWwUGcQzFGnHDChEUyxCyvWz4OSdNQGu
         Q9/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=wWdArF1DZPGsAoS444Kcg8YCjjpZ0B/iCMzrUY0UjCE=;
        b=nP+pVucdrsJ7MeBgzgaCa0r8kfYb5dIYRgokg+b7vO8JVbdMoSotlqtkZsBjWipf9h
         3D9p5tD9kCgCL3f8fimzoWvjVTdhmjAocC9VKofUSCXPbW0lpJiufkMsU6dz6TyPZ8uN
         CqHbnGTzjmLtHe+LtYiAeCRlVvTqnXc0mIwpwF8yDG+1bz7yPbdA01F92RIq7qyjaPOa
         80kw6jL8EuJrZ8M1Aw3BVDn3ArcLGg1I3UP5xKwKAYfovvmfJGZGniVKzD6k7U9HJHC+
         5NDRvbJifW3q4gqHqrG16ghQkPn+6lWwGILr9DK/Kw7cs69um+eAMXb9JxnIxs5gc9/t
         i0MA==
X-Gm-Message-State: AOAM5315fvQjdLU+/xhalejnkAvaT//bqtK5NXK3vTVBdpnc6dozScn4
	W3miMIu5rT7xEQWUXgyimoZyF/qv/liv+5hyNGkR7zWXMcw94g==
X-Google-Smtp-Source: ABdhPJxajsxdSiX/Yu10d/OYbRfarsRNiiMwQRu50IF61Qw6b7w0a63k3fRtjLn6rpTv8muDB6bw5pnk7CrNpndZVw8=
X-Received: by 2002:a9d:27c1:: with SMTP id c59mr5382189otb.150.1642178483836;
 Fri, 14 Jan 2022 08:41:23 -0800 (PST)
MIME-Version: 1.0
References: <20220110164754.1066025-1-idan.horowitz@gmail.com> <87ilum8gfp.fsf@linaro.org>
In-Reply-To: <87ilum8gfp.fsf@linaro.org>
From: Idan Horowitz <idan.horowitz@gmail.com>
Date: Fri, 14 Jan 2022 18:41:12 +0200
Message-ID: <CA+4MfEK8nJLPd3J7ENG52nXkZoeqhKP_zu7NBfFg-SC-hQRzAQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] accel/tcg: Optimize jump cache flush during tlb range flush
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, richard.henderson@linaro.org, 
	qemu-devel@nongnu.org, pbonzini@redhat.com, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: nMjQ6Y26gi5k

Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
>
>
> For multi-patch series please include a cover letter which is the parent
> of all the patches. This is the default for git-send-email.
>

Sorry, I will do so from now on.

>
> The code itself looks fine but what sort of improvements are we talking
> about here? What measurements have you taken and under what conditions?
>

Execution time of the following assembly snippet in TCG
aarch64-softmmu with icount (shift=3D10) enabled decreased from 4
minutes and 53 seconds to below 1 second:

movk    x0, #0x0
movk    x0, #0x0, lsl #16
movk    x0, #0xff80, lsl #32
movk    x0, #0x0, lsl #48
mov      x9, #0x64
str         x9, [x8]
tlbi        rvae1, x0
ldr         x9, [x8]
sub       x9, x9, #0x1
str         x9, [x8]
cbnz     x9, 0x5168abc8

>
> --
> Alex Benn=C3=A9e

Idan Horowitz
