Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp530325ejb;
        Thu, 5 Jan 2023 11:05:47 -0800 (PST)
X-Received: by 2002:a25:5c2:0:b0:755:e64f:7d8 with SMTP id 185-20020a2505c2000000b00755e64f07d8mr53911699ybf.16.1672945547324;
        Thu, 05 Jan 2023 11:05:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1672945547; cv=none;
        d=google.com; s=arc-20160816;
        b=g5VXSVf8C5uMG1oE2mUj2lQQggvLgUW4s0+S63nFbZPIi3CePQspr/5VcBAmR48k3J
         I1iMO9B0K7LIX/rU5DKLcTqC8TbBFdxKpilb2ddZM63psr0u/PEYLF8XBamUHF4RhmRA
         +4wrJS6ih3qRmPF3Yr/xQw3aTq5c2bcJi1AHID/g1cSNkYDNmTjpHaPZjovjCppdosNb
         XXUyIuDbtlHroVZ8MGv0/TtvwLWlNZdJUNM8DMzthNKfxeT6hD4pjdDXR6WgUm1cDlh0
         mamStPCG6bsHgGHGcwTvk+P7Fd+ggjw9lsU2txv+jQze3bBlLwzA3L7oPp3ogXwsKidg
         8Sdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=babYxNQH6OOhcedUNBfZWrCjRdVEeEd/QGpJxPR56jU=;
        b=sxMJlrfEi/ilNX8++A5eFA5KZ2wYQwceO9SNzTnI41A3VNt6LxqblwoHKpiw5Dkdv9
         WphoK4jthOLMuI7yLqZ7Z84sxUvxKGFDm8jODzeFXNMW1UfIyQPtu/ahO8exhSF70Lwg
         6W7XbEqv7YPOCR0X+fRE1wixiz0CvZMOUZgsX8CvGSCDLqpciMeRFRHQAKMmbOhRHZfF
         qq9vmp5DQwBhm0hqinRraqbfctui+J3lVhuktTkycYmBp5HOgwzwGqtNEMK8UpiMQdgo
         jp/6Ndg4Sz08CLXgqMtmTxTRqoerGy6I843PRaK7OPwd2dr6HipcurlaVOS4DyAWepnJ
         X1NQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=cIoJqfQ6;
       spf=pass (google.com: domain of jcmvbkbc@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=jcmvbkbc@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <jcmvbkbc@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k10-20020a25240a000000b0076bd8c297e5sor12779876ybk.138.2023.01.05.11.05.46
        (Google Transport Security);
        Thu, 05 Jan 2023 11:05:47 -0800 (PST)
Received-SPF: pass (google.com: domain of jcmvbkbc@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=cIoJqfQ6;
       spf=pass (google.com: domain of jcmvbkbc@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=jcmvbkbc@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=babYxNQH6OOhcedUNBfZWrCjRdVEeEd/QGpJxPR56jU=;
        b=cIoJqfQ6u59hc7RLZbxtk17QR2k65oAlKcrA/9uA3mcBpkKVDg6CyUMyVPZQdFmmSB
         UxdKYmDdvKDeedBkUKK+X8qkxCB9uZCb24ISou6SNAtFTwiLxx5k058UMlqD49WFfYo/
         dbEllhcyw8SaFESz+26pQsePusfnwrcJylVZtIasB2QnPuJ1ZbOOXwV3zCHu88kz9p0G
         GUurIfNrvQ4iGi9wP/pjvkr+l/HOcSKkMivNQjSIDy5rguJ03vJ/ehxOYVVO/lL0pJyR
         ingiBcxALpxU9qHog0audMD34CE/V2C8BRBo19pcpkhhUShsO1Szd/dSb/TAdERdT+AE
         Rt3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=babYxNQH6OOhcedUNBfZWrCjRdVEeEd/QGpJxPR56jU=;
        b=eNvJra6UJ7wkuaNQy02KYitybNFOQsP5sAvH9ynhMV9vPIizKYbAnZYhnOGIEV2BcE
         JiEiFU0trJYIOT2WeRQjIxT50gSh2+gjZVaKSZY9LKV74uTo1WSupPGMk/y7vSqIX6F2
         +BhioIxax0nnoVYEuSeiJz1NH4Ub+31qNsdTv4eBiO3QL0EADTYg6G3wshSYaPY6WUmT
         0QRIz7ZPc9Fo//Y+Fgq849AiAJF/EjOC27AISLmmwnkivIURfH+PfQLzxNNK9cvdtDXg
         gjkxdAiRCKLabgH8685CjYLoFEBY1TmVhVi3HOQJszISHMkHBnJRCb9DWyFUpUM/KOXs
         WVDA==
X-Gm-Message-State: AFqh2krezQ0jpOk8efg+7jH1Kde37uXGYn3hra3bINfBiwN6rE7N1cUH
	rWTA7DhluzefxZdf33l6iTupwqkXW6mIu5YaZMD3ROL9Y0s=
X-Google-Smtp-Source: AMrXdXtplYb0O7zDcrFOI1CE85l/ZRHfYN2a9K+44A1jrmWH7fv68M45G/DjDF1QV9chfGQjr9xfdMCOhqeRC8Eu2FA=
X-Received: by 2002:a25:fc6:0:b0:6d5:a304:b9cf with SMTP id
 189-20020a250fc6000000b006d5a304b9cfmr6607154ybp.293.1672945546515; Thu, 05
 Jan 2023 11:05:46 -0800 (PST)
MIME-Version: 1.0
References: <20230105164320.2164095-1-alex.bennee@linaro.org> <20230105164320.2164095-20-alex.bennee@linaro.org>
In-Reply-To: <20230105164320.2164095-20-alex.bennee@linaro.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Thu, 5 Jan 2023 11:05:35 -0800
Message-ID: <CAMo8BfJHddmWmj6H9PHBQXALG=mcCZzQDCdkL6rD0k9hMBsZzA@mail.gmail.com>
Subject: Re: [PATCH v2 19/21] gdbstub: move register helpers into standalone include
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, alex.bennee@gmail.com, 
	David Hildenbrand <david@redhat.com>, Sunil Muthuswamy <sunilmut@microsoft.com>, 
	Aurelien Jarno <aurelien@aurel32.net>, Michael Rolnik <mrolnik@gmail.com>, 
	Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Greg Kurz <groug@kaod.org>, 
	Ilya Leoshkevich <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>, qemu-ppc@nongnu.org, 
	Laurent Vivier <laurent@vivier.eu>, Yanan Wang <wangyanan55@huawei.com>, Marek Vasut <marex@denx.de>, 
	Stafford Horne <shorne@gmail.com>, Peter Maydell <peter.maydell@linaro.org>, 
	Daniel Henrique Barboza <danielhb413@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Taylor Simpson <tsimpson@quicinc.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
	Alexandre Iooss <erdnaxe@crans.org>, Chris Wulff <crwulff@gmail.com>, 
	Richard Henderson <richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>, 
	Song Gao <gaosong@loongson.cn>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
	Artyom Tarasenko <atar4qemu@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, qemu-riscv@nongnu.org, 
	qemu-s390x@nongnu.org, Alistair Francis <alistair.francis@wdc.com>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Bin Meng <bin.meng@windriver.com>, Mahmoud Mandour <ma.mandourr@gmail.com>, 
	David Gibson <david@gibson.dropbear.id.au>, Yoshinori Sato <ysato@users.sourceforge.jp>, 
	Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: U6NVvN3JbzZF

On Thu, Jan 5, 2023 at 8:51 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>
> These inline helpers are all used by target specific code so move them
> out of the general header so we don't needlessly pollute the rest of
> the API with target specific stuff.
>
> Note we have to include cpu.h in semihosting as it was relying on a
> side effect before.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  target/xtensa/core-dc232b.c            |   2 +-
>  target/xtensa/core-dc233c.c            |   2 +-
>  target/xtensa/core-de212.c             |   2 +-
>  target/xtensa/core-de233_fpu.c         |   2 +-
>  target/xtensa/core-dsp3400.c           |   2 +-
>  target/xtensa/core-fsf.c               |   2 +-
>  target/xtensa/core-lx106.c             |   2 +-
>  target/xtensa/core-sample_controller.c |   2 +-
>  target/xtensa/core-test_kc705_be.c     |   2 +-
>  target/xtensa/core-test_mmuhifi_c3.c   |   2 +-
>  target/xtensa/gdbstub.c                |   2 +-
>  target/xtensa/helper.c                 |   2 +-

Please update the target/xtensa/import_core.sh as well.

--=20
Thanks.
-- Max
