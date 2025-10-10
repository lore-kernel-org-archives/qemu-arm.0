Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4E97CCD185
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Oct 2025 16:03:46 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v7FZB-0006Ae-7d; Fri, 10 Oct 2025 12:02:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v7FZ8-00067E-5h
 for qemu-arm@nongnu.org; Fri, 10 Oct 2025 12:01:59 -0400
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v7FYm-0006Rt-0m
 for qemu-arm@nongnu.org; Fri, 10 Oct 2025 12:01:55 -0400
Received: by mail-yx1-xb129.google.com with SMTP id
 956f58d0204a3-63bcfcb800aso2486979d50.0
 for <qemu-arm@nongnu.org>; Fri, 10 Oct 2025 09:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760112089; x=1760716889; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u/zrwMqwnGoIBMwOTdIl9Y6UlOgW0fzMIZl0yJFBeZg=;
 b=kVnUqzwEWw6oyIWIKz57zSAGnEaW3IvsHYfBW8aTxuOCkItshdI8TzLuoLFsRXfVTO
 QQuxXtWMTfmfdO5Xncza9rLa15oAm5CsZ3fLPeSjEabKGTse+5tg1XyxyBY51E6CeONG
 LiZ0AF92LqFHpp74LpmXhNjcw25dSp1gZEg9OiqlBkPm+LYkFtq7PsZR95ozjkzlOw4W
 LavY2gR8rysuPCCwXQs81ksNGW+7zhbOglhRPfJ+dmaQ1S9xr+2BmZ7dwvmJkBYaSQd0
 TFZ6Zv+TBAkW3z2iiN5J7xvQskrUCHxqN1vqzqB0d5RoFrc5f8as79Kqay+lPf8dXeYq
 YZ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760112089; x=1760716889;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u/zrwMqwnGoIBMwOTdIl9Y6UlOgW0fzMIZl0yJFBeZg=;
 b=wAnQVYLBZO3bfcHSz6UJnrL345US/xflLvJTgOGLTW/sMvqTkAlEtDlI/zi/0CmxAL
 4CZNlyeWi7zclmyDOMc7VaTqKTB/zQDBhafGsGhPIit6ReFQ3GizWFtznqu2QZYYVGy0
 5SUEhJI7gpLpWuDlYDze5yXSAqZYhjHcG4E4lmCU8zks6a9SEUc+MDF0u1vqziNNLD1w
 ExRl7i6G01fDdg1ZNz+e+n4kLaXzwbbKqjh0MvXGblIM0cE0e0CDcxhkSRCyrg4b15oJ
 y9z67hg6Ic525p7xtZeA3Hg0fCwuQpnZx2UALUXSBDm9+PwEHBuMyuwZWpm774iHPUXz
 0obA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWbps+y76EQovvMld81EJAEpHXuMldCsZ1lhnCE4yeLhzyKolTp8Cfn37TZe70f9HYLlsHWZ0H0A==@nongnu.org
X-Gm-Message-State: AOJu0Yw8sCKXJJiAAkXYpodOdjSwc/SLAYkarNkAf+FjMC7J0bI8HkpZ
 8vXDSdQOfkLX8Gl2Gsw36gctRkx2TKEZZ4yNxIOok+3r1JwrZDKlJMH8wXapDWfM6nWcz5YIVjp
 IzhIEOF90IwA9bJqihtyNDPfAw0DWWOSRC25xvQH8+w==
X-Gm-Gg: ASbGncvAs+ho78jJGkyaEhllUDCLOghyW5iZTHYhTSTp6oiK0sPZi7877xO01GsTOXJ
 ryaiwGx0CWCcA8UpFYdILpQ7HhrP5itPZ60emDuQQouONkZ/1jHWrwKBK7Mjeb6OxdUK+NMS77X
 29DsiYsRFA7eXnKTiyZ0W4fhkkZW4ZRZSAp/ct1Xg4nnF0WL8d35TI0xO0BphrxzuyD8wrS7C91
 9UrzSUOniDU9deRCW4IX6Ao2uiRapU=
X-Google-Smtp-Source: AGHT+IHeqMSrWwUaz2rExiFGqKxJ2V5iIAhzCXVvP+r/KSmEFgKAdvWAWUaOfOOoSjd0QztR6/+Z809gm8bQaWPNgSQ=
X-Received: by 2002:a53:cec2:0:b0:62a:b545:54b6 with SMTP id
 956f58d0204a3-63ccb8f2f76mr8689088d50.35.1760112088920; Fri, 10 Oct 2025
 09:01:28 -0700 (PDT)
MIME-Version: 1.0
References: <20251008191716.3005164-1-daan.j.demeyer@gmail.com>
 <CAFEAcA-iQkqxR5jPtGC1EAtcH4FYD5y71x6RFSWC3vP05krScw@mail.gmail.com>
 <87sefrvuq5.fsf@draig.linaro.org>
 <CAFEAcA_hv0fMyJ7WQks8SA5Af7xVvTo3gjKNM4QBFCMWAH=2DA@mail.gmail.com>
In-Reply-To: <CAFEAcA_hv0fMyJ7WQks8SA5Af7xVvTo3gjKNM4QBFCMWAH=2DA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Oct 2025 17:01:17 +0100
X-Gm-Features: AS18NWCqm1KODDwsvTP6S4yqeX7WnaDCiPH0IfYnESN5oZ9lO1tHqQk8rvVBkXY
Message-ID: <CAFEAcA_-dT6Gf0VDczU-OYt3wi-bXLYeLD54Aipb7jah8-XwJA@mail.gmail.com>
Subject: Re: [PATCH] Add support for zboot images compressed with zstd
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Daan De Meyer <daan.j.demeyer@gmail.com>, qemu-devel@nongnu.org, 
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Fri, 10 Oct 2025 at 13:09, Peter Maydell <peter.maydell@linaro.org> wrot=
e:
>
> On Fri, 10 Oct 2025 at 12:53, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
> >
> > Peter Maydell <peter.maydell@linaro.org> writes:
> >
> > > On Wed, 8 Oct 2025 at 20:17, Daan De Meyer <daan.j.demeyer@gmail.com>=
 wrote:
> > >> +    } else {
> > >> +        fprintf(stderr,
> > >> +                "unable to handle EFI zboot image with \"%.*s\" com=
pression\n",
> > >> +                (int)sizeof(header->compression_type) - 1,
> > >> +                header->compression_type);
> > >> +        return -1;
> > >
> > > Moving the "unrecognized compression type" error path down to
> > > here means that we have moved it below the g_malloc() of the
> > > data buffer, so we now need to g_free() to avoid a leak.
> >
> > Could we not declare:
> >
> >       g_autofree uint8_t *data =3D NULL;
> >
> > and drop the cleanup?
>
> You could, if you wanted to, convert the file to g_autofree, yes.

Whoops -- I meant "convert the function" here; I wasn't
trying to suggest doing the whole file (which is probably
a bad idea).

-- PMM

