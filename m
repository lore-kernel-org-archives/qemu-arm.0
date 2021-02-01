Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp3761445lfo;
        Mon, 1 Feb 2021 13:22:23 -0800 (PST)
X-Received: by 2002:a05:6402:35d6:: with SMTP id z22mr20590506edc.58.1612214542943;
        Mon, 01 Feb 2021 13:22:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612214542; cv=none;
        d=google.com; s=arc-20160816;
        b=k9J2Q1pet59soY6Ncl4Anvv69FjUCshYjy2ZM0B88WI87tnyAGf2fIJfPW9Hn71XI3
         jR6iGxjzJ5WwOpksvy5IW+FA6i96TBA7RYuyWX7FbpKyycDrPP8lu8LlBYMsYHzGPcqt
         EGhGbduWlooUeucbhVxoHy/aElhF5aFwFYWd6i1JGkf0tgLjFYxYhcNVXApuuAKpdZce
         6xykvbA3pprEKdQRyxsso2hyWFMl8f9mQwVyzuoeyqhae5QGRrHMqg3Wk4QTNdED9IwD
         WWGIk9Y0dlwdKryED/FOcWUAUoTdXY8yHMqR0Dgbyr105R3XF3tXaitn04K97ktcS1lk
         kJqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+SLzS31n4x1I/uO0eFE40WqwDzbQH4oIkzAyKgrFUsE=;
        b=0LZqk3V5UHBuRqD67C1/MxJTQRzwYFElu/AavrLFskwjaIxROErbBTa0HbHhvdObqH
         cMdtJSPwWiF9RbJXf+QnuyJLegRYbyHpTeg7fPx3Cbl2/UuuD7qZItlT636tpBZ5T9Tw
         SGCf3A54kpZqgqyLk4Sa03rGSDDpeYU3o3W18ob9xhd1WVv74Zkjz+vNJ6NB7Rpc8f4P
         3gfvlJxD+cKgBC4FljiZSLIakmxvSuoidDMVhwk4ofJz+Cef7zNTqTdQyarA5ubyUj0L
         jkLttCTbCg5RjaEMBHgBRi4Gsbp1hyl4/ruacuiuTGf1nb3eWbxWWAUDXtv7i4FsBXVY
         6OqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Uxp86bl/";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ca10sor18945115edb.11.2021.02.01.13.22.22
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 01 Feb 2021 13:22:22 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Uxp86bl/";
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+SLzS31n4x1I/uO0eFE40WqwDzbQH4oIkzAyKgrFUsE=;
        b=Uxp86bl/abfGZog3jBYBRN4C+Ufv8QbNrZJV4wZeGys6Z9rvWgDRQQogoHwkmUYMGa
         /CfqyFQQd+IFHeIDbMW82yPpK1ho8t40EzkiwufMyGw3oIteALDaiikNzJmWWY8cjzOW
         tYw2of3lHVa6zUsvGHFuiLa6ys9WLmf3fwcaP0Vfa0p0zDB5ZcYzm/nvgsOqfgAjsqkQ
         SVSELOBptGF8HD7o1AbuQpe7j3Qd8UD6POQWzk4vOQ75Fo4awm8ql2y7o9qFnI4eQOfE
         kBIajjAaqPiZzsUsNZNuE8QM+ya7JVVcRZHyGiD3omv2iVhcuLZyFcxGXafSflW/ZoTi
         c6kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+SLzS31n4x1I/uO0eFE40WqwDzbQH4oIkzAyKgrFUsE=;
        b=lBHP6TYN0t6oEQ8DYE2moUYo7cI26vVKSZlOuUeI0ZGpLKJxxZ0/2+fecPBQV49LzL
         lwleMQsi7PjKFqQd0GyjJNL0s1Rjw513nm7nMUZSullGz6Yg3Lsfp3dmStEnI4YMt1p4
         Bn16r4e3uPqvBIzFbqwtIHwcqV11KMCmt15LYiOErJPhhNVyxdLaSQENnzkuNFRfoyAI
         lBkkHBlywaGXfk2XT7UFJW3JQdcILmCJO9ccDRn/fuSMQUgxnwBS0Mw/8Kp7hNVy5UcK
         Hw8kzz95mfTxj5cgDqikW4JPQlxhtjRFCfd2Y3WwAKWlPBJtM7hovu+UQ7CgfZ+jPdHr
         DUgw==
X-Gm-Message-State: AOAM530gdUEnXqkJHc5f2T5VXfzgTjlg94R4K9MDr50W2u+nmRWGiwgQ
	bFC0uxAa0LfvumnF8bkxOWJEnV0C+vHQ9Sq6Z66GsaBlXAfSmw==
X-Google-Smtp-Source: ABdhPJzkNDWPkiOkmqZD09bl8WxqgLGYlJ0Mfv40b3RFGRDv3K6AlLtseFkGwgGeHEADwtxvN3ovR4W0v4GwV862aP8=
X-Received: by 2002:aa7:dd12:: with SMTP id i18mr20851479edv.36.1612214542640;
 Mon, 01 Feb 2021 13:22:22 -0800 (PST)
MIME-Version: 1.0
References: <20210128185300.2875-1-alex.bennee@linaro.org> <CAFEAcA_R3phXwOtj-v-6-oCN891SjGSyAGwcx3_zDf+GFPWLqg@mail.gmail.com>
 <871rdzv9cf.fsf@linaro.org>
In-Reply-To: <871rdzv9cf.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Feb 2021 21:22:11 +0000
Message-ID: <CAFEAcA8aLBFG9SjVqeDwbcGRU_chkt2s0E1i9BY+xDdXnrfO6Q@mail.gmail.com>
Subject: Re: [PATCH] docs/system: document an example vexpress-a15 invocation
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 4RiVoPZjfeK8

On Mon, 1 Feb 2021 at 20:09, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Thu, 28 Jan 2021 at 18:53, Alex Benn=C3=A9e <alex.bennee@linaro.org>=
 wrote:
> >>
> >> The wiki and the web are curiously absent of the right runes to boot a
> >> vexpress model so I had to work from first principles to work it out.
> >> Use the more modern -drive notation so alternative backends can be
> >> used (unlike the hardwired -sd mode).
> >>
> >> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> >> Cc: Anders Roxell <anders.roxell@linaro.org>
> >> ---
> >>  docs/system/arm/vexpress.rst | 26 ++++++++++++++++++++++++++
> >>  1 file changed, 26 insertions(+)
> >>
> >> diff --git a/docs/system/arm/vexpress.rst b/docs/system/arm/vexpress.r=
st
> >> index 7f1bcbef07..30b1823b95 100644
> >> --- a/docs/system/arm/vexpress.rst
> >> +++ b/docs/system/arm/vexpress.rst
> >> @@ -58,3 +58,29 @@ Other differences between the hardware and the QEMU=
 model:
> >>    ``vexpress-a15``, and have IRQs from 40 upwards. If a dtb is
> >>    provided on the command line then QEMU will edit it to include
> >>    suitable entries describing these transports for the guest.
> >> +
> >> +Booting a Linux kernel
> >> +----------------------
> >> +
> >> +Building a current Linux kernel with ``multi_v7_defconfig`` should be
> >> +enough to get something running.
> >> +
> >> +.. code-block:: bash
> >> +
> >> +  $ export ARCH=3Darm
> >> +  $ export CROSS_COMPILE=3Darm-linux-gnueabihf-
> >> +  $ make multi_v7_defconfig
> >> +  $ make
> >
> > We probably shouldn't be recommending in-tree kernel builds, or
> > polluting the user's environment with random variables. Try:
> >
> > $ make O=3Dbuilddir ARCH=3Darm CROSS_COMPILE=3Darm-linux-gnueabihf- mul=
ti_v7_defconfig
> > $ make O=3Dbuilddir ARCH=3Darm CROSS_COMPILE=3Darm-linux-gnueabihf-

> Building a current Linux kernel with ``multi_v7_defconfig`` should be
> enough to get something running. Nowadays an out-of-tree build is
> recommended (and also useful if you build a lot of different targets).
> $SRC points at root of the linux source tree.
>
> .. code-block:: bash
>
>   $ mkdir build; cd build
>   $ make O=3D$(pwd) -C $SRC ARCH=3Darm CROSS_COMPILE=3Darm-linux-gnueabih=
f- multi_v7_defconfig
>   $ make O=3D$(pwd) -C $SRC ARCH=3Darm CROSS_COMPILE=3Darm-linux-gnueabih=
f-

That works, but do you really commonly cd into the build directory?
I usually sit in the source tree...

thanks
-- PMM
