Received: by 2002:a5d:4d11:0:0:0:0:0 with SMTP id z17csp473582wrt;
        Sat, 16 Mar 2019 07:06:48 -0700 (PDT)
X-Received: by 2002:aca:ad82:: with SMTP id w124mr951042oie.33.1552745208863;
        Sat, 16 Mar 2019 07:06:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552745208; cv=none;
        d=google.com; s=arc-20160816;
        b=UTr6CsEu66IUL+fu8gsQtbnllw6YQPIqNOK2H96WUbnozNk5dOVos4SGw4ufVINipc
         1ler0y5OzXiBCsIzo16hRolniiu/rMKfiSEadcX89lTSUi5BQ3mZE2cw5Ey0eCTRYRPx
         HWu0cLv+BZYNVzBAFUZs2YV1zhzIeKO0biZ6iD1GiSPDWcuUIf78ROB2tad1J/0TyARJ
         nHfU9VhMQGyTfjvEz0yG4VWtb5PZceu530UhtUsYqYMHD036T+IFKs1KuJIFkx5qQGHe
         7otSgwfpbRdd5H+074DKDz+QlIEijtS9B57Qc9I0uF/wJpRYb13XaWGPjY6prTBnHwgp
         hW6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BOJAgTz6MvH9VYyX/UnQt2YEknXXqCeCDZhS5uo+fWE=;
        b=YIfZygpdKPZhmYg/Cb9Cq3Z+0GLnTlHu7y6hCL37wfdUyVWFLh7uLLh2etFtb3GSCN
         3kEOJgNkMgYyubCHlpUVwMfoKT8lQPgs2eWvjWKd/ARJmiYUs21UEEY/Uqt4Po3BIehz
         uyEkztcT21ib8c82I9dUvBHXW8L4Z2cbxcfuclPe5S6FKk4X1qKiDFT2ADqX49Gl5Abn
         x/zpAcMUPdp0MmeDp+8hE0o2A/cZhFf4S+zGEWpZM7tmID11I6HMpeC7L2CKua/912C+
         d+QhOHBCX2RAYBL1eP8kjubNVE5XUAIPkOTLwp+hQkinZ/HmuoH+jvW9uNdGFzDSjgqv
         UGbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Weexd2Ax;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k203sor2245243oia.146.2019.03.16.07.06.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 16 Mar 2019 07:06:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Weexd2Ax;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=BOJAgTz6MvH9VYyX/UnQt2YEknXXqCeCDZhS5uo+fWE=;
        b=Weexd2AxJYa4sFm0/CmPfbhlIW3yvSfKn5n0FyVLoyI8BoTN2xULloYPPeK3oRA0is
         gqjPOgUqGq5ve5txr2jpW/FulApf/MTwoRhuR6bAcHdKQ+JHBNpy1WJhmOk3b29233Sj
         y4X5ZLdqfDGafgqW/ukQvQWn0A4aqXs2BXhoMLuJdPeP3Yy7vXzHC77c+KIn9/lZUkKk
         dmedI5wdDgzcH/aAqGANN46WiXCJt9Wtwx0AUmSFN4dpqnzbXji/InO+VlpblDyz64yk
         THpQZYhV9vamVop31xPzr4tf4yh5d4z/K5rWkGAYJGTixQaYyTVrcJQhw4uqkEng7WfK
         KQlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=BOJAgTz6MvH9VYyX/UnQt2YEknXXqCeCDZhS5uo+fWE=;
        b=DH3rOWEjCw5M1Xydw+uEIuoh0bD0QmO8gvHO2LLTQiA4GJlmM//Lww8ASJqxl4w227
         SStsrEw1dHQuILVPQNshBeGko/qCQdLz4q2uPU48gLQk0/9g/BxViBdHXmCEw2++S9k+
         rYNIf9ZOQ/CUNQrkEaWlLf0MyobLM7Oh5oBJwBgRs/BHo+lSHn5GVwpROvbLNxh7fng1
         oaaZHjOQPQ2CfiBAH+8+9NPgXSnzFLm731jYLF/tEXWqLdWzIp2OXNMoUDsNTLFiYgmE
         ICJ0gv9DgY8cPdTEEsbahEz/XbgM7tvi7kmrO1SXSUZnCb+T53p/mtnWb8RXsG3WJQ5g
         v1Qg==
X-Gm-Message-State: APjAAAWWw1gLAp5Bg28561M8mqN1rsm350tOWrz7YZuKpqHjt6ga4ZtS
	klkJull6SlYUSp7xrZeIdcyCCZgnjEFyQQcL3k8MBXe24oA=
X-Google-Smtp-Source: APXvYqwK+yiJVLwKm9kX5cMkl0xWJMt1X/kYuUAZDYEL2UbHPXwKLA4ZXhyfLuDCXpyAkq0yjndLtMXrFJQSgARqFXg=
X-Received: by 2002:aca:d409:: with SMTP id l9mr3988035oig.98.1552745208242;
 Sat, 16 Mar 2019 07:06:48 -0700 (PDT)
MIME-Version: 1.0
References: <CABgYhWf=unSbmTksO+gkUuX+UL3g8HvEuDAeDdxBQVbzci05DQ@mail.gmail.com>
 <CAFEAcA8xqO=iV9oJWWdPHhhDFRmAoegMpwUZQUszXLwG7zS=Hw@mail.gmail.com>
 <CABgYhWdu-H6zfWjwwtJbFK6TJa89tqERtX=djYpFobWjir_C6A@mail.gmail.com> <87sgvnt4d4.fsf@zen.linaroharston>
In-Reply-To: <87sgvnt4d4.fsf@zen.linaroharston>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 16 Mar 2019 14:06:36 +0000
Message-ID: <CAFEAcA-+8OEymmMZ1Sk6bi9LhVkjDfdAoYSHq4FWvgd7c+5Hkw@mail.gmail.com>
Subject: Re: [Qemu-arm] QEMU user mode for cortex M
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: QhnVgpgESyOC

On Sat, 16 Mar 2019 at 12:01, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
> Massimiliano Cialdi <cialdi@gmail.com> writes:
> > then I try to execute qemu:
> > ~/Downloads/qemu/qemu-3.1.0/arm-softmmu/qemu-system-arm -d
> > unimp,guest_errors -machine virt -monitor null -serial null  -semihosti=
ng
> > -nographic -semihosting-config enable=3Don,target=3Dnative -kernel
> > main.elf
>
> I don't know what the virt machine defaults to for CPU but I'm fairly
> sure it's not an m-profile CPU.

Default is Cortex-A15. "virt" cannot handle M-profile CPUs.

> > write access to unsupported AArch32 64 bit system register cp:12 opc1: =
15
> > crm:8 (non-secure)
> >
> >
> > and nothing happend. Where am I wrong? I'm wrong at the compilation sta=
ge,
> > at the execution stage or both? Is there something wrong with the comma=
nd
> > line parameters? Which one? How do I force a cortex-m4? How can I force=
 the
> > Cpu without having to choose any machine?
>
> It's hard to say without seeing what your test is doing. However I can fo=
rce
> a cortex-m4 on a microbit and run the following ok:
>
>   ./qemu-system-arm  -monitor none -display none \
>                      -chardev file,path=3Dtest-armv6m-undef.out,id=3Doutp=
ut \
>                      -semihosting -M microbit \
>                      -cpu cortex-m4 \
>                      -kernel tests/test-armv6m-undef
>                      -d in_asm,cpu,nochain

This is also kind of dubious, because the microbit is
really a Cortex-M0 v6M system. In fact I think it
is just ignoring the -cpu argument and giving you the M0
anyway.

thanks
-- PMM
