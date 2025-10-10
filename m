Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0A6ACCD185
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Oct 2025 12:10:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v7Bwk-0006I5-Ak; Fri, 10 Oct 2025 08:10:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v7Bwi-0006Gr-9Z
 for qemu-arm@nongnu.org; Fri, 10 Oct 2025 08:10:04 -0400
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v7BwZ-00022H-2v
 for qemu-arm@nongnu.org; Fri, 10 Oct 2025 08:10:04 -0400
Received: by mail-yx1-xb12f.google.com with SMTP id
 956f58d0204a3-6361a421b67so2181568d50.2
 for <qemu-arm@nongnu.org>; Fri, 10 Oct 2025 05:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760098187; x=1760702987; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3IUDUai/bqlrO+MrdnH4PeedG7nz4mt9Thnj6tMCPn0=;
 b=ybDkXlWgbFCWdBPUmt+GXuydFIBsKnURqAMDAyJXtyy9z7vHSw6gXLlWv2j53acShl
 o7+CjwgaWj4cx+2WYGOoPkfLqMaenvmhsB0fYD8hDasJ6JvWQn0HO5Ud+BScbLwf0P3E
 jaNUh1H5uSDyFy/6Xq23YNw7uk6unA3kk7Mbza4mnTRp6M9S+bodW128o/kV/njj1sNq
 mUMBVTztl6Hpwmw6AsksCEgHoQlyJxg0CFqcXWzJ9ocDYnI6A4GnZYtNulPT6e1x1dGY
 46FbVftIwCnuuEUogXe4J57ddiBgEkmUYCnwxsXQtmImij0rqKr5/nahpec4i0uTJsJy
 FLUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760098187; x=1760702987;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3IUDUai/bqlrO+MrdnH4PeedG7nz4mt9Thnj6tMCPn0=;
 b=wTp6F+tXif/UkJpwQ3/QUKOjWt3MtnKVqdxXiSfriDWo8ed9Csl3kaBRL/giKQcD10
 Ospdi43zWvX8SzGrqs7NSXCfnoNp9kLjTIn4nQjWGXbOVx2gzSDehv7KRe9LGiElaYf/
 nwqvJPSha0x8tNmy7+1qNY/PBvcJ8EoLto9Qs18oD4k4IAQAiewktwD8H2TUMdu0Nnfa
 q/7O7hhdzG8xxWFpbn1KidD2ViI3Ucu3U+EDlGkR58wARvHyR00/3lvofXHKL2S4Z30W
 jKdgPwo+NymysSA869JeafdsxrZMkFiIsp35NGQzHI7FyTOk+QhVLz+j4x7BXHDKhXWx
 cxng==
X-Forwarded-Encrypted: i=1;
 AJvYcCXK6KM3xHwK29F29VpgpdBKdw2z2raMU6oDn54oecZ+95RVaqdYRS9xYcz2JiAwRLQmcUninBY+xw==@nongnu.org
X-Gm-Message-State: AOJu0YwvSX5h/0HEUWuhm/ONSB9iJt347o2W4RMFNeiB/VnMmeK729jW
 XV+yM8hI9R20YQB0kg5gRmtXJtnVT9Z1l6RpnIq/YBdU2zPyOq1JPyyZiu94hbEzazr/0cRNbsv
 CRd9b2il7ceVCE5PDl844Dt51wBQD2fWWbpIIo/L4RA==
X-Gm-Gg: ASbGncvknbLqHp9zrQOIY+zaGTfb8Di2N/j7d2X5jdSQGF6QgpWfF7NdlqgWNPjWRaG
 GvOx1G4uOIocxdF4N4nWw4h1r0xMrxYVA46aY7s0DZ9qt5equOTPQngaSg5cL8nKtidWSUcf22S
 4xCy+S7XIhkfH0b7vy2731FEytoixyE7eXh4O8RSDFZWab+fA5M+EOWbsfuQedWzyE+CSis63MI
 5GrW9+jUsg/iRqmqGJWnmM4csGfomvqUn3IY5CEL63MJOQep6Mo
X-Google-Smtp-Source: AGHT+IGyecNBG1e1CUEElBxIlbpQc58+LQms0Kcgk9dAN9dHP7MOfk3cBPNdGLIxD3pGx23+gwazzKElUY1x38PXCP0=
X-Received: by 2002:a53:d607:0:b0:634:e9b2:eedc with SMTP id
 956f58d0204a3-63ccb8f1f80mr8879189d50.38.1760098186694; Fri, 10 Oct 2025
 05:09:46 -0700 (PDT)
MIME-Version: 1.0
References: <20251008191716.3005164-1-daan.j.demeyer@gmail.com>
 <CAFEAcA-iQkqxR5jPtGC1EAtcH4FYD5y71x6RFSWC3vP05krScw@mail.gmail.com>
 <87sefrvuq5.fsf@draig.linaro.org>
In-Reply-To: <87sefrvuq5.fsf@draig.linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Oct 2025 13:09:35 +0100
X-Gm-Features: AS18NWAEwuscctzRu2mHoN89ZakLsD8Chxbl04_CVGW1TF1x9SdlQBSpMgi2w1o
Message-ID: <CAFEAcA_hv0fMyJ7WQks8SA5Af7xVvTo3gjKNM4QBFCMWAH=2DA@mail.gmail.com>
Subject: Re: [PATCH] Add support for zboot images compressed with zstd
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Daan De Meyer <daan.j.demeyer@gmail.com>, qemu-devel@nongnu.org, 
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Fri, 10 Oct 2025 at 12:53, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Wed, 8 Oct 2025 at 20:17, Daan De Meyer <daan.j.demeyer@gmail.com> w=
rote:
> >> +    } else {
> >> +        fprintf(stderr,
> >> +                "unable to handle EFI zboot image with \"%.*s\" compr=
ession\n",
> >> +                (int)sizeof(header->compression_type) - 1,
> >> +                header->compression_type);
> >> +        return -1;
> >
> > Moving the "unrecognized compression type" error path down to
> > here means that we have moved it below the g_malloc() of the
> > data buffer, so we now need to g_free() to avoid a leak.
>
> Could we not declare:
>
>       g_autofree uint8_t *data =3D NULL;
>
> and drop the cleanup?

You could, if you wanted to, convert the file to g_autofree, yes.
You would need to also adjust the tail end of the function
in the success path to do
  *buffer =3D g_realloc(g_steal_pointer(&data), bytes);
so we don't double-free (and drop the cleanup in other
error exit paths).

I don't mind either way, but if we want to convert to g_autofree
we should do it as a preliminary patch.

-- PMM

