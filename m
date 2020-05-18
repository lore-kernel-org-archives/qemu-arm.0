Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp3210261lfb;
        Mon, 18 May 2020 09:55:43 -0700 (PDT)
X-Received: by 2002:a05:6e02:530:: with SMTP id h16mr15676297ils.2.1589820943378;
        Mon, 18 May 2020 09:55:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589820943; cv=none;
        d=google.com; s=arc-20160816;
        b=lJCGsb5vmMr38H6hMey5S3j0EHUrEkrTs01ioA7UC9ZXjVksmIaOlTJIJR0GTeokXB
         waFrPDlt/DTi5vLyWIGQsoZgFqm2sSQAMQhgeoKlngat56566dvo+VPU6ywhjKFp7rh7
         ato0qf0v9pWoRWDtVCCBGxwjCfXIYHeqCcAyIgcJTRSvuicJv/+T6Pj0HIo4reywScWP
         egxibhMoG+K4rNCM45d+oYLFu2v3q3uA7s6ZAH52LXaWCxbVS576Y6vZ31vc3IhIEddT
         gu2S3WyUvZzDHip5sBVyZpBk2DYt78pH8GUZ/t8dvGX4qgx5Gy3vWjUgnfoVdMKuhvM9
         JCHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ol0ORCGLTTuGNMRHjrIAOAqtx3daiObs8nq3fxwOcNM=;
        b=dcDV2ExzGkUd99jqPWJb/hgycA1lqZEywa7FufXpGmi2U/yWQ62HZxw5ez6xSEqKIA
         dKR9jpXUnNG5RnPDQMD/DOzkHCjoErRsUF2em+CrAUSBp38kusYWryjE9aEBpbU280UN
         5xJanWlQ70TufxtmXexAiqhI0BsfEGapFaf/IM96RzKxNfvAv9KFTCKKLFukZE9S+Pjb
         f1/WHJ4o60AGav88KPbqVu7fEoYPVEXLyiI1GSy6d/V7/c36ncxii4a0TfI5jQpN8cDv
         PKZYISSCbXLi9fej8emLTqfPGxwq9QRV01KBzl4P0zA1221YszENUU/9HmKLUzMVULGX
         /NdA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=nSu7d5PQ;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <alistair23@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id d191sor11501685iog.24.2020.05.18.09.55.43
        (Google Transport Security);
        Mon, 18 May 2020 09:55:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=nSu7d5PQ;
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Ol0ORCGLTTuGNMRHjrIAOAqtx3daiObs8nq3fxwOcNM=;
        b=nSu7d5PQzivLEqe9GLyI58sGSC+c4/nr9FoJRlSQL/URJ+/d1tzuMFlUHDh751Ibnr
         TuvYBNcinysfWXV3l7ccigQoznczl/Goqh0+Rwvmko3bdZxKUECaQx0H/xr24gVhYFX8
         6A1n6U8irBGKf08Ms+FXNs736swCn8mvDmD9AgNHl3+XTDKSCU3OWsE0NmH57wVF97Zl
         jyHJoEDr3Jbp4XE/sswKlj2b9SzroC+bh+XNdn8JNIQ0VsZXS+neb7dZA8bHx/km83jN
         ZhQ+o6DorX8miuy15g58k1kObZLlyHS6QNcpKeJ7jeKW/9BGEPi89Ny5BReyXEcXNhGj
         V+uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Ol0ORCGLTTuGNMRHjrIAOAqtx3daiObs8nq3fxwOcNM=;
        b=eqkyC0gjxJtVffLloNKHFzBUXf6rY+NH7r9B6sDyOiXX3tDZn43cGmm/s4IJwWQe5r
         9YSvjJlPVWEP7x18OOygVevNrlxYOCKPtDPuHX+O5d1t/R7BIRjuZsvYF1+Hrms7SdyW
         BUQ4fbuAYWLeMKSHEBKjaKr0p9aE3riWh7SRupTcuchNa0EtNlwOYpqBtKN/Mb1IV9wx
         yR81YBMJVdNNo1VMHrnuUUb7f8/SpzdXJ9jQFsygKdRsxLaDohc3hRo51RSS8G1157JD
         q7l5Fz/wJE1fTLgHSQtz45OGLGwT9KNy+IVQeOXiBy5MX0EDahkC8Sx2ewlWBcsOAhbT
         K1Kg==
X-Gm-Message-State: AOAM530RlZJGLwZtJYkQzAK+4zqiHeQj/ZFAxH4c4ir3dSdxcznZ+ZAz
	IpQiDhLN19ydDVMc3boD+G/iMvfQC1hwYq5jbf6qsFNL
X-Google-Smtp-Source: ABdhPJwFXLE0/NAwksdqDOgpM2P+9Afs7WHw0wRXDp6XyaCC7/YsedlKzPh8y9jVqesoR/WPbnIx9mxgMLxJ+qZMvyE=
X-Received: by 2002:a02:a118:: with SMTP id f24mr17042201jag.8.1589820942980;
 Mon, 18 May 2020 09:55:42 -0700 (PDT)
MIME-Version: 1.0
References: <20200515170804.5707-1-philmd@redhat.com> <20200515170804.5707-6-philmd@redhat.com>
In-Reply-To: <20200515170804.5707-6-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 18 May 2020 09:46:52 -0700
Message-ID: <CAKmqyKPAcizLC=wmNpmatpcxXtp9YcaruJGCC_=SpPgSYP-BHA@mail.gmail.com>
Subject: Re: [PATCH v2 05/10] Makefile: Remove dangerous EOL trailing backslash
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, Marek Vasut <marex@denx.de>, 
	Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, 
	"open list:RISC-V" <qemu-riscv@nongnu.org>, Sagar Karandikar <sagark@eecs.berkeley.edu>, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, Chris Wulff <crwulff@gmail.com>, 
	Laurent Vivier <laurent@vivier.eu>, Max Filippov <jcmvbkbc@gmail.com>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, qemu-arm <qemu-arm@nongnu.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Michael Walle <michael@walle.cc>, 
	Paolo Bonzini <pbonzini@redhat.com>, Alistair Francis <Alistair.Francis@wdc.com>, 
	Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: FDAOkVPN+2iY

On Fri, May 15, 2020 at 10:11 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> One might get caught trying to understand unexpected Makefile
> behavior. Trailing backslash can help to split very long lines,
> but are rather dangerous when nothing follow. Preserve other
> developers debugging time by removing this one.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 34275f57c9..84453789f9 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -420,7 +420,7 @@ MINIKCONF_ARGS =3D \
>
>  MINIKCONF_INPUTS =3D $(SRC_PATH)/Kconfig.host $(SRC_PATH)/hw/Kconfig
>  MINIKCONF_DEPS =3D $(MINIKCONF_INPUTS) $(wildcard $(SRC_PATH)/hw/*/Kconf=
ig)
> -MINIKCONF =3D $(PYTHON) $(SRC_PATH)/scripts/minikconf.py \
> +MINIKCONF =3D $(PYTHON) $(SRC_PATH)/scripts/minikconf.py
>
>  $(SUBDIR_DEVICES_MAK): %/config-devices.mak: default-configs/%.mak $(MIN=
IKCONF_DEPS) $(BUILD_DIR)/config-host.mak
>         $(call quiet-command, $(MINIKCONF) $(MINIKCONF_ARGS) > $@.tmp, "G=
EN", "$@.tmp")
> --
> 2.21.3
>
>
