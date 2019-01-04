Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp725895wrt;
        Fri, 4 Jan 2019 07:35:26 -0800 (PST)
X-Received: by 2002:aca:5641:: with SMTP id k62mr35814831oib.339.1546616126328;
        Fri, 04 Jan 2019 07:35:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546616126; cv=none;
        d=google.com; s=arc-20160816;
        b=bYVjPMuGQFmwnvzXXfpjJWH2/7D/2s0XnPYzXuGSiDcIup+Yr2C6b5fCPcxJ2vXZhL
         da+Uz3+WMAQrNWnXnBlrPizwn9ndW3HtG29B7ZdqrTtwHhQpZcIVxjiPMj7UP6hZzmbv
         j/9LfKZHPNPRpvNu812LO1E+m77Bsj5PEF4Ojtbnuzq7o2jzZb9sBZlQD+Fd5OrpZ2CP
         IU4G6E29ze1flsLCpumHNBpUO0uUXt1+XBfjww+KRDVvaTVfOVvbPv0sV98EaaPNrmiy
         9MqDJp06NQBs1pj+qBv7iBXeeCP55lEDUdzup4IlOQDEGxv6m/1g/U/u7E3oIqfONZGE
         6JTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RpxCftcOm0JKGSgPRWzdciEmEARQh3EfSdulaRNplwA=;
        b=JxSXTnPUGwwzhbmah0+GbTehhUszElMBLgFOu16hAsuRVVSh2eKS187psPcAIBWjnl
         0iL+a8CJB9p+Y60TlD0z5hiEjrrz6Ma2XoMRAVi/U6IQfsYhCcAVZ1Br6GXZX5u7LuLU
         wIWlmeeGq0MQNVxUyx6sZporGtQHmLheRQUHEuCJ4FHBAkCL0VIatRVXjYHBJl5srSzK
         2KC4ebVntKAb54Xzen/dY59fVxh+gAdDRVyRiGRp35RA3UuPSZWc4JwCBwpvaTLElVcY
         QwKiUE/5u1l9GDMtIJqg+tiAW8gRySqlKuQQSgYI1B5fAhXRD8WJNnugeJLrDKFUebq+
         Eb8A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HzxVnEHP;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id x24sor39357763otk.166.2019.01.04.07.35.26
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 04 Jan 2019 07:35:26 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HzxVnEHP;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=RpxCftcOm0JKGSgPRWzdciEmEARQh3EfSdulaRNplwA=;
        b=HzxVnEHPtNTQT2+s06wASMNnDxkUnRSV9VP3aAsjLLq9wjwX8vKwnxlHx8WTx4ksxB
         tPIKTw7Lsy1kQymS0Gfs16+k9HgX+tcohpPZ0CMAyhSJJnetoRLSiJ65EG2FjE9jpgIF
         Gsa323mj8C0/KwOvp2EQCay0UdGD9lk+1FzHU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=RpxCftcOm0JKGSgPRWzdciEmEARQh3EfSdulaRNplwA=;
        b=gkqBFZZVI76VV1vnb8gW4hJo1mZD0JGUe+OCLWR9edWQ9k7MeqT7qiOYocxS8juHLs
         WBhgswIjsaapePPFaQvO0h2YT6LZn9zsuTRdea1aXIJaVAhGR4ncjNCByI00WNewkda6
         as8yiKOswtnCP1KEyYtrODYaFMqJC9jhO1UBwx6zItlGhQ5xSucWs8o8M8v1xS5EKOQ9
         DkhohyAMP3Itq55DuaE4Xy39ZkmMvqPshKY9btK8K1LQAcmK2fZkDfwzDvMCKfMf/tJK
         Ilu6pfJ4IcUyfkgdjw+F3K5ScHfqYTAVuhhcBw/eznJr7pFV6Db0nI/QmGlcVpBXGDfa
         WnOw==
X-Gm-Message-State: AJcUukd84mL0Mil13Dl5qrDBZe6yKVMqbafcTd/Sdc0KKAndAbXtjyvv
	axS2pJ6h0Puq0qHc4wl1YZDoloh7R5VztRDby6ZKrnKJRbM=
X-Google-Smtp-Source: ALg8bN7/MjA552y/xhm2kfrBZn7/kKAwtEc46VoC8dxPqncO6E2YDqRZ5UwAsTJ4Y7IwTf7wmAuctzkIv0x0fdF7RJw=
X-Received: by 2002:a05:6830:1115:: with SMTP id w21mr34843350otq.316.1546616125843;
 Fri, 04 Jan 2019 07:35:25 -0800 (PST)
MIME-Version: 1.0
References: <20181213115503.24188-1-alex.bennee@linaro.org> <20181213115503.24188-3-alex.bennee@linaro.org>
In-Reply-To: <20181213115503.24188-3-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Jan 2019 15:35:13 +0000
Message-ID: <CAFEAcA_7OgJXKb2YwF9qMwf1J2+hkYwft1us4+yMJ_OeUiJ-jQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] target/arm: defer setting up of aarch64 gdb until arm_cpu_realize
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, 
	Omair Javaid <omair.javaid@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: GMvrAHoK4UXd

On Thu, 13 Dec 2018 at 11:55, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> If we setup earlier we miss the parsing of the aarch64 state of the
> CPU. If the user has booted up with:
>
>   qemu-system-aarch64 -cpu host,aarch64=3Doff -enable-kvm
>
> we end up presenting an aarch64 view of the world via the gdbstub and
> hilarity ensues.
>
> Reported-by: Ard Biesheuvel <ard.biesheuvel@linaro.org>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Cc: Omair Javaid <omair.javaid@linaro.org>
> ---
>  include/hw/arm/arm.h |  2 ++
>  target/arm/cpu.c     |  4 ++++
>  target/arm/cpu64.c   | 20 +++++++++++++++-----
>  3 files changed, 21 insertions(+), 5 deletions(-)
>
> diff --git a/include/hw/arm/arm.h b/include/hw/arm/arm.h
> index ffed39252d..f9a7a6e2fb 100644
> --- a/include/hw/arm/arm.h
> +++ b/include/hw/arm/arm.h
> @@ -171,4 +171,6 @@ void arm_write_secure_board_setup_dummy_smc(ARMCPU *c=
pu,
>     ticks.  */
>  extern int system_clock_scale;
>
> +void arm_cpu_enable_aarch64_gdbstub(CPUClass *cc);
> +
>  #endif /* HW_ARM_H */
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index 60411f6bfe..100a72ff81 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -890,9 +890,13 @@ static void arm_cpu_realizefn(DeviceState *dev, Erro=
r **errp)
>       * queries ID_ISAR0_EL1 on such a host, the value is UNKNOWN.
>       * Similarly, we cannot check ID_AA64PFR0 without AArch64 support.
>       */
> +#ifdef TARGET_AARCH64
>      if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
> +        CPUClass *cc =3D CPU_GET_CLASS(cs);
>          no_aa32 =3D !cpu_isar_feature(aa64_aa32, cpu);
> +        arm_cpu_enable_aarch64_gdbstub(cc);
>      }
> +#endif

This seems weird, because the fields in cc are common
to all CPUs in the class, and so setting them on
realize of a specific instance based on properties of
the instance looks wrong... At least in theory there's
no reason we couldn't have one -cpu host CPU with
aarch64=3Doff and one with aarch64=3Don, though I'm not
sure our UI allows the user to actually set the
properties per-cpu like that.

thanks
-- PMM
