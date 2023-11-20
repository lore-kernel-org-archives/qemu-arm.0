Received: by 2002:a17:907:1006:b0:9d0:bf65:29fa with SMTP id ox6csp2348476ejb;
        Mon, 20 Nov 2023 09:26:21 -0800 (PST)
X-Received: by 2002:aa7:da92:0:b0:53d:bc68:633a with SMTP id q18-20020aa7da92000000b0053dbc68633amr71409eds.5.1700501181407;
        Mon, 20 Nov 2023 09:26:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700501181; cv=none;
        d=google.com; s=arc-20160816;
        b=tY4+xpbZGDT1xqXXddL9qPQWfvJ53PKYaxqbFvI0g9no8eZAROAYORTrWa46iTJbq+
         3L0ToJ+ZOnRCRNvYKVXxt9fuzvumxm82E8NWcFKEUZJG1Dre7HcbxuQ2wTD7lR9pHQvC
         uj17h4ZbUBieJ66K5A2dljDIsTCSlt3M2kRzm+Lz8ABdz3D+uAOIuavfA4R3BJPOqWwO
         3De+kKDT8A5juSeNXX5kgT55XrQ1xbAY/COEKCitu2Pzj5mJ/jR1qZ64ajRfo1YRQNeB
         F0NoQmkp9pCW4wYxQTvIK9Bvrv2e0FsfyfbEPynaBsW/qTVC2qEnWrMmX7ybih/S98Iw
         pruQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PW/m+doSsfC1tDv8iaxMIsedk/4LD5Ru6zO6xuPKDM8=;
        fh=/UlhpyZbq2zH+qA+avu/2OTfcdlQj9UMJPfDI/YBVak=;
        b=PStXXB4OXMoFiVayfWnTqtgBcbBgnqWgAFi2nfHQ5M2/bQfy2bxNRw2D7irviPGYrh
         ANaDWZ6b1MI3ATRN9moQKFvpXXEDZMNb9wIHVhHOmLjBtQ5eAs/lF+mhWvMuH+FnkokU
         mBK4KPOe1u3lD/XMfFHsk+K8Iz/bMM17ntqdBbHy3ywraSCGdsA1FH7YDg+supmrvZtp
         qWm/PIkw7xGs2876nhK8KdEi7HV+U8fsCof808iXjcHKeSVKohWwAYCW5hLz9bvOctfV
         pJpgRTi1Uan3MljBA1tbyXFevXWVQAfFAeny1SHAcfeiy6tu4baH5Uy9EMNlzT5Rmlkg
         UsgQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RIwAchFi;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ec27-20020a0564020d5b00b005254ba9451bsor27293edb.1.2023.11.20.09.26.21
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 20 Nov 2023 09:26:21 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RIwAchFi;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700501181; x=1701105981; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PW/m+doSsfC1tDv8iaxMIsedk/4LD5Ru6zO6xuPKDM8=;
        b=RIwAchFiqgbByRuJVSWHq3UkDbHLv/mmjCMzAyGYRE/b7NNxMGe4xSPpaC+d8cYFsb
         DVjNzNp98XM7D1/h9CFAuQUir/dwmB3I7x9X9R/zqjOuVj+XKzjnGig6YL6v42+e16Zl
         A1KMaN+2pqfJ+L7I3yVD7/fdJeRR40HMryZiaFCG20yXQSm9C/EseBcJfJTWXcX3Ozyt
         L7emprlTZG85kWcNzRHJmhBdPKiWQ8gUjjf3U9cUs7NqV8v6+4hN6PUBeRys+70gWKkR
         nSKW0QrYrZ293BspFTjgwi0v61LuleKbnMCif84sU2xl8JaLROb3g3OW316B6Z7izM6K
         /X0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700501181; x=1701105981;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PW/m+doSsfC1tDv8iaxMIsedk/4LD5Ru6zO6xuPKDM8=;
        b=na2Hm+XwcJ8veN04pwLr8gWxtaNKNXtEEtBzu9M1ICrEsqvY78fAr0Mniia53EI31o
         SEf1J2WUMiRcKE30vYzyOkJXXHcBGctYzkG4DN455m9BcnbuBcytcLpVLxYEWHFszaM5
         i+tYFLdXdaVR9Q5R+NXLtc77+jcjGEIDfYlOxWiEso0lf8KtA+KKM9xLxTTyyDjyyOtO
         q1yQb1kLCIUA8Sne3i8rwq6hTPAFWur0rG/JSk+AwNiWsQRv31VnrAIYt7dJ9bActMkU
         hjmMfCOjVSwQrSweBneYJPdk9lcV2joG67g03fM1X8/3VM+tmyZUNCefDZk/8xBTWa9q
         4aYQ==
X-Gm-Message-State: AOJu0YyqtYlp4qsySOMdvlfOKyGlm1d7n+BQfowjDYa65NydU+CjODxG
	OGmp++eLrQB7U1eJoIXTZdahsU1dHk8Gf+mTzOb5lm779z13vKyRL0U=
X-Google-Smtp-Source: AGHT+IHv7i9e38rfFjRA1pZ+oR+DEuzKU77OFXNetiLLG1xsefvr3Sg219ZgLRFuezyPzjTYIZfiHo6cetQgD8rKZn4=
X-Received: by 2002:a05:6402:797:b0:548:af73:6747 with SMTP id
 d23-20020a056402079700b00548af736747mr36231edy.38.1700501181058; Mon, 20 Nov
 2023 09:26:21 -0800 (PST)
MIME-Version: 1.0
References: <20231120150833.2552739-1-alex.bennee@linaro.org> <20231120150833.2552739-9-alex.bennee@linaro.org>
In-Reply-To: <20231120150833.2552739-9-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Nov 2023 17:26:10 +0000
Message-ID: <CAFEAcA-oYNZ=kNJ8C6FkGi==H4cHoTJ5xo3PC6P1RRH+0A3Zow@mail.gmail.com>
Subject: Re: [PATCH v2 08/14] docs/system: clarify limits of using gdbstub in
 system emulation
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>, 
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
	Mahmoud Mandour <ma.mandourr@gmail.com>, David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org, 
	Beraldo Leal <bleal@redhat.com>, qemu-arm@nongnu.org, devel@lists.libvirt.org, 
	qemu-ppc@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Alexandre Iooss <erdnaxe@crans.org>, Marek Vasut <marex@denx.de>, Thomas Huth <thuth@redhat.com>, 
	Chris Wulff <crwulff@gmail.com>, Ilya Leoshkevich <iii@linux.ibm.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Nicholas Piggin <npiggin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: /YV5BFEgcLlU

On Mon, 20 Nov 2023 at 15:08, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> It seems some users will try and use the gdbstub to debug userspace
> inside a system emulation. While possible clarify the limitations of
> this approach and direct the users to a less head scratching way of
> debugging user-space.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Clarifies: https://gitlab.com/qemu-project/qemu/-/issues/1274
> ---
>  docs/system/gdb.rst | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/docs/system/gdb.rst b/docs/system/gdb.rst
> index 9906991b84..c0cc0c9c7e 100644
> --- a/docs/system/gdb.rst
> +++ b/docs/system/gdb.rst
> @@ -60,7 +60,7 @@ As TCG cannot track all memory accesses in user-mode th=
ere is no
>  support for watchpoints.
>
>  Relocating code
> ----------------
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>  On modern kernels confusion can be caused by code being relocated by
>  features such as address space layout randomisation. To avoid
> @@ -68,6 +68,17 @@ confusion when debugging such things you either need t=
o update gdb's
>  view of where things are in memory or perhaps more trivially disable
>  ASLR when booting the system.
>
> +Debugging user-space in system emulation
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +While technically possible to debug a user-space program running

"While it is"

> +inside a system image it does present challenges. Kernel preemption

"image, "

> +and execution mode changes between kernel and user mode can make it
> +hard to follow whats going on. Unless you are specifically trying to

"what's"

> +debug some interaction between kernel and user-space you are better
> +off running your guest program with gdb either in the guest or using
> +a gdbserver exposed via a port to the outside world.
> +
>  Debugging multicore machines
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D

thanks
-- PMM
