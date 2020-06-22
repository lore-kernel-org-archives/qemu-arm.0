Received: by 2002:a0c:fe87:0:0:0:0:0 with SMTP id d7csp2042174qvs;
        Mon, 22 Jun 2020 05:16:13 -0700 (PDT)
X-Received: by 2002:a9d:ed2:: with SMTP id 76mr13432675otj.236.1592828173598;
        Mon, 22 Jun 2020 05:16:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592828173; cv=none;
        d=google.com; s=arc-20160816;
        b=wIjsrUMyHAzCuuzpmaaF3Hh0Bw/qaVG8NIeLfAyk2RPMswHK0yOUIyx8Id7W3x15Ga
         bBsPV74rLZwggU7Y4+kyRkkIP1N32mVp3swYB9MyrJK7wCWMNc1c9ZxBrEivOC3ZxlcR
         zLD4yS3otsQZgxTWTFNbj7JqsU/TlxQYaEnCTRV3iqxpMF/OJvFE6gYIUlv9XKGC3ntM
         KVH6rOW9Occ5M670vL+9arOnCLyjVYAq/0LStoYAKAFmqfO2YJHFyQutyvEDUU44sx65
         of62OuYqgBUa2brU+z1kMctqHcYQmr1ddmIpHwuDsQkT/mzIMBwoed0EqOXAhfp7WHIn
         T+9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UXVb/E+jAS+w2huxh87zZ4OnC2ZIGJIDDgHl6VXMz70=;
        b=N/f3pUK4tyk6wGfWes9TXvcQi6mUpuI7QhmkyfnNlViF6XZbjuJJdFMhJDHaLKiesS
         8R1Llq6w/Q6OWVj4ZemFVqFEZfOLtut+00rrvpZ3vQOSiaF0vM2A5Rw46qtqtxcsfdZf
         AjQQ0rHpK3bxK/qeNR/xcYQ/RoSMPBp7XhXHerTtJR4I46hIKUR9DS3p2B/OX2qsFlAi
         8NdATfejkSxrKxzNwMWz4E99TW0VIyqT54zq4dGbn2z/gloKepkn11WDFjM8KDum5oBx
         80bDsN3OiV3j6P8Pu8uzr77G6mc12XasjMNeAE7AAHiAOS1PfaPKC3fQOMdNupmBvvU8
         JS8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LF2Ag8Lr;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a11sor12144700oif.170.2020.06.22.05.16.13
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 22 Jun 2020 05:16:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LF2Ag8Lr;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UXVb/E+jAS+w2huxh87zZ4OnC2ZIGJIDDgHl6VXMz70=;
        b=LF2Ag8LrjQYGas8zlOIlTbsB0lAfjzs4M+14920i4PKqx48eiLR4kGG/pdrlyyMtjj
         twFgIT+iUXvR9h6YTFpDu7YO4utdziXnCySIN8KWT4rkkqA/x6yXjMPFEfJjnRw4PcMd
         dSpRHf7XGPURTdj+Zq2eXKSwhuukkwMQbu0yvLPvALXTidEDcWfzYXn7K1eFjOP3Q2Yz
         iN/lD/Ma+WjaBsB1JKIhGHb9O6oDs7q8tGAvX8JNOakpKQZhg5xy6fA7hFxWNSFNLhpU
         rwZaU/AUXVVKE1GBL26LQOtQdeS27Tnakrj8BvQLLTdoHikEOsE0Qov5p9hUFOeHIrC/
         64kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UXVb/E+jAS+w2huxh87zZ4OnC2ZIGJIDDgHl6VXMz70=;
        b=sbVmTdwpq9Wog/gmFdr3jKu22vMCbmxaRrTBOnSMdjuQ80r6KsULkQJfecpWZKAPpy
         nLNteSSqdW/QkeVnqI+5YCOJgjHSPnBjryviOlwieHw95pPseko3ir9xCHu34A9kWIJr
         LwU5J2ohTcmYuTsOPofA9dUQmCxv1zZWK6FqNB9Fn2y5aoNTEuPEi+tEeu7+gBxHL2K6
         /NSPaynwwsNIMhPuzAc1JhIreK9RI1fGFfM3Z/TPtp1G/E04+yqoAnaYh/+qrYFgJYvL
         qvbtxaZMvY5xygwzlqRE6w1rfb30OALkEwdKoiIs/yN6LQ7F+X54NiAlCZmwiqtI3XAw
         vOUQ==
X-Gm-Message-State: AOAM5313Mk0rg65oCr6nXEZna+PTCWjXN7Qg0DpKITu9ddJ5C2HwyBYi
	pDJPWSlc88SqP6ZfQT5/XPEjeiJi9nPvFG6ia5RmMm0W
X-Google-Smtp-Source: ABdhPJyL0CxOnJinZUZSR6xJsxms+MYf1SMnympMaAKXezx+T84dDbc/voRAn/rnDP9xfKL6ZCXtNJknvg5VyKGwrwk=
X-Received: by 2002:aca:1a07:: with SMTP id a7mr12135184oia.163.1592828173116;
 Mon, 22 Jun 2020 05:16:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200619170324.12093-1-peter.maydell@linaro.org>
 <879e933c-a65c-3706-afa1-5ede1acb062c@ispras.ru> <e0fc64ab-b36e-99d1-90ea-8877c00f8c0f@trusted-objects.com>
 <87o8pba35w.fsf@linaro.org> <7e057989-56b8-195d-247d-9ab0522ff23a@amsat.org> <56ffc60e-f458-e9d4-d89e-4ca70b1ed4e2@trusted-objects.com>
In-Reply-To: <56ffc60e-f458-e9d4-d89e-4ca70b1ed4e2@trusted-objects.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 22 Jun 2020 13:16:02 +0100
Message-ID: <CAFEAcA8G3ngwUXMSCEN6UVEJ6Na5sBpHqYv1qh7PEn5uMAhGqQ@mail.gmail.com>
Subject: Re: Role of qemu-arm
To: vincent Dupaquis <v.dupaquis@trusted-objects.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: Gik2/Vaacb8e

On Mon, 22 Jun 2020 at 12:28, vincent Dupaquis
<v.dupaquis@trusted-objects.com> wrote:
>     I essentially work on Cortex-M0+/M3 devices and I will have a try to
> your proposal !

The 'none' machine can't be used with M-profile CPUs, because
it doesn't create the NVIC, which is a mandatory device for M-profile.
You'll get this error message:
qemu-system-arm: This board cannot be used with Cortex-M CPUs

(or if you're using a really old QEMU, it will crash or misbehave.)

thanks
-- PMM
