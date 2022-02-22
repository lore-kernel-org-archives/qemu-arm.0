Received: by 2002:ac2:5cd0:0:0:0:0:0 with SMTP id f16csp3688810lfq;
        Tue, 22 Feb 2022 09:37:13 -0800 (PST)
X-Received: by 2002:a25:3542:0:b0:622:caf1:2c88 with SMTP id c63-20020a253542000000b00622caf12c88mr19857923yba.625.1645551433043;
        Tue, 22 Feb 2022 09:37:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645551433; cv=none;
        d=google.com; s=arc-20160816;
        b=BSe9KwFB4QFTYhRHfLdx5G3whNoLpD8c1UQqb7CqCqgQNQCysBkfkwSjzXsCg69Nbc
         ZSHCH6zSQvF835IW01LOUPoFH4o45jwjMGvMUQmeicL9xCNLgNXsh0e4M8xiClYGPIPX
         xlFLmha5oEWwGpzEgl/olhcjqh+47dbXOjBr1CsY+oJhuEhVm4QIp2tZyTquWVYkOdPS
         +r78jaM5iNets3+Ex4/5VUhYewB/IYR9h82DXG/68Jgzb8Bg/4b/rmushW4gdmxqu8aX
         ricqaNdTtIsePHEqmm4drUoORFyGj/jBK4fvZfZylYh1varVq4KEpzIrNdmcBrzUs6tj
         DX2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Qtf3YU+TcowGaCHniWgPODEI9mzHGWZEUHJkd8vFmQ4=;
        b=jftziV9XtIP4lLXEeAaODDdzxhrFP9fkmAQx7KFttpN3RFUaqdCYXVgKyKztV+NSzP
         uYTd8gQhPNSzQ+y4Z9XtZ+feN0hS35YSBivi+qp6I2uTplKORxuFfhwpvBwVm5nooei8
         fwvDTLvD4MIvBlznZ8ukcOUm7QHxIdI2AtKvspT9dQVlY1A63Q0hvWH+t66/QLJwXEUD
         QwT0NoxvpDZSmgTxxKAgHamnpFLOEBHz3Mo7XCsH73tvUv8U4zZDW+qoGs++LuT//RM7
         4cz6tK3jYSgTcZD19m37+PhvtvitEcqSEO+J8Y8dyBx+6VEEYgLuw8sXJXTr9rdzMIhQ
         ibKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hX8AVPmL;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a27sor3477005ybj.121.2022.02.22.09.37.12
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 22 Feb 2022 09:37:13 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hX8AVPmL;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Qtf3YU+TcowGaCHniWgPODEI9mzHGWZEUHJkd8vFmQ4=;
        b=hX8AVPmLdnmgAm9Mp7TDpgorj+E8XR10pURakQlp8AnPWlgvg0kMqngO857J/DuEUo
         L4tjCl0QH0rR7jZl6bMJI2M0BcLhFauK7PaX+Hej5Ci39C87+8oJtlfylAqFYw6IrlRJ
         KlW+gHmzOHyk++gYPYv5XW1GjbqAHuy2a+fQoB4VxO+A/kDyT6rd+cdhtwQ07l4Yk6y6
         gEGGuyeBLZuQjMM/Z66XLR8XcODERIw9HohE8RomHh2Z3chKQ58u9GJbYAPgZV8F7Y+w
         /lxyDp+KZSEs/W7N6RPcLQm6E8Ly1SIxlZWFhURChfASzcfuqzFRPcCmoL+uyqkmXR6M
         7s7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Qtf3YU+TcowGaCHniWgPODEI9mzHGWZEUHJkd8vFmQ4=;
        b=0FAa5WYkL9lZ86L/Dr2f9ofyhZrxFLxlMJ3YJ4iZILQgv6rN+aPUi5A7a4qUEn3ei8
         z1GvK0jKmOpxUcRvfGE9uRy70QWdhVZbqYWbZOBeuGsCEjPnIOFkW6BqLQkW8zsiLACU
         ubhD0YSps2SX4SqQqATZorDZ1jl2Ihy6JEpGtOLMIJTFw/9gPDP2px0KjAbpg06l3vFR
         MA4nPahsiZthGsf8bWbFWTd/Z2M2lDHmQdnyZClgFTOKZoOPylO0vUyuTAiwMG0Q+qMJ
         zrB9NN04fGsg0B0+T2lP+5Q7G/DdFMA0TfYecpnmrqLfKoE12b39BPD6CA1B2PyW79nC
         ymyA==
X-Gm-Message-State: AOAM532oLs3PRnwGYkmVrOimbvuzHG0rp4nWr4XQDu2vgv+ipuQuv9Wu
	zifIKcw3PPDT7vbieONm8ezUN2E8D067Hg4FGh6geNGQ
X-Google-Smtp-Source: ABdhPJzEPYI+NqxJzpRTH/JfEovOWiHMhUgQu+/oSynLrXk24DbGAjD/q+O+1Si+UMlSEn68PxmeXkgjE5F/MFDfFms=
X-Received: by 2002:a25:5011:0:b0:61d:853e:ef96 with SMTP id
 e17-20020a255011000000b0061d853eef96mr24511965ybb.288.1645551432548; Tue, 22
 Feb 2022 09:37:12 -0800 (PST)
MIME-Version: 1.0
References: <874k4xbqvp.fsf@linaro.org> <878ru2nacq.fsf@linaro.org>
 <YhURfqMvRT4xbiz6@redhat.com> <96bafa75-a0c6-f431-a6d8-fe98d438d0f9@gmail.com>
In-Reply-To: <96bafa75-a0c6-f431-a6d8-fe98d438d0f9@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 Feb 2022 17:37:01 +0000
Message-ID: <CAFEAcA8ggE0HHXwLAu4vCA=kLwo4moN1CvTJbjph=OTmnfOONg@mail.gmail.com>
Subject: Re: Analysis of slow distro boots in check-avocado (BootLinuxAarch64.test_virt_tcg*)
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel <qemu-devel@nongnu.org>, Laszlo Ersek <lersek@redhat.com>, 
	Cleber Rosa <cleber@redhat.com>, Oleg Vasilev <me@svin.in>, 
	Richard Henderson <richard.henderson@linaro.org>, Emilio Cota <cota@braap.org>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Idan Horowitz <idan.horowitz@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>, 
	Igor Mammedov <imammedo@redhat.com>, Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: IgEilEeDCbJs

On Tue, 22 Feb 2022 at 17:33, Philippe Mathieu-Daud=C3=A9
<philippe.mathieu.daude@gmail.com> wrote:
>
> +Igor/MST for UEFI tests.
>
> On 22/2/22 17:38, Daniel P. Berrang=C3=A9 wrote:
> > On Tue, Feb 22, 2022 at 04:17:23PM +0000, Alex Benn=C3=A9e wrote:
> >>
> >> Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:
> >>
> >>> Hi,
> >>>
> >>> TL;DR:
> >>>
> >>>    - pc-bios/edk2-aarch64-code.fd should be rebuilt without debug
> >>
> >> Laszlo,
> >>
> >> Would it be possible to do a less debug enabled version of EDK2 on the
> >> next update to pc-bios/edk2-*?

> We need the DEBUG profile to ensure the bios-tables-tests work.
>
> If you want to boot a guest using EDK2, you should use the images
> build by your distribution (/usr/share/qemu/edk2-aarch64-code.fd),
> not these images.

But we're booting guests using EDK2 as part of our avocado tests:
if we say "booting guests with EDK2 should be done with non-debug
images" we need to also be building and providing those in
pc-bios for the avocado tests.

-- PMM
