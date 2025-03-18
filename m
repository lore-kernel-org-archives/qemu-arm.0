Received: by 2002:a17:504:5906:b0:1be9:327d:8ee3 with SMTP id nn6csp3103603njb;
        Tue, 18 Mar 2025 10:50:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXKHwh2QGwViYmeVOOR8kQV+vpGxa+hWGEQt8kOSgk9rlyQQBYwMWZdoJkwczpIQnUpkvWFaM7qYFcCLQ==@linaro.org
X-Received: by 2002:a05:6902:2204:b0:e5d:b2c4:7cbf with SMTP id 3f1490d57ef6-e6678ecaba8mr318780276.7.1742320224381;
        Tue, 18 Mar 2025 10:50:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742320224; cv=none;
        d=google.com; s=arc-20240605;
        b=Zumx7EZt/Pw0jk8FicU8lAAeBhRcgVA3ezKouJJZ63+2W4RJcxXn1v0dTKospJ9QOr
         iKR72iVvgCR8ZiTwtCTVf+Tm90YpJWTIBi94RBvqZHl2T8RAhXsBJPaBmxffZGt3XVtj
         ERs7nMJZCAZ8CEQZedmjdkxF2qn/Ry7XHbaEtXbr0hIAJa7iOTlOTR0fGzD3BPU/2P8A
         h6/z64WOYuv+3DdUWFijkzWiZiRMDKyrxVxxjm9+dL3SspyRAGpqQSH9RrAbhLgyMR88
         gr4ObQgbhkOfcfRIFPWKDVgmdraJb5aUtTvLST+qCeehlAGE8H9BH5de6O2y2loemoDg
         8RbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OvJ1Chpj2jYmxujQHwHr5y5q3DIlYijmy0IxxUrM06M=;
        fh=v6j2bCCmOH7qn9TWt9YQODJRX6e/cewLXb4HrYjsCuY=;
        b=WISe5Mw5FHE9gF4rUWzMPBAgWjaGzK6eHHj6j9PB9NSg17ifh5ywTwcfEwkXS/Cs3a
         bAjnb+pbvZhB7NvygT4v4qG4pJzps6y2kFu3RTy3DysyrGlaeocG/hQIOnuKWsXacl41
         Vb5YRkG8sAnJzqnCSIEQdfJp9OLXZIPtBUf/gq+LJ/H0CTqLJHxcy0QMrxhBiMeqjh8q
         0DLP64GChsSnYPX1TdJh8oQE3X9uU7pt5ILgKV5BkSLxj+IV461PsEE6V+CjeFBPrb9d
         xKd+MPBAqyyjIgjvbaL20Hf11j7HUZuRb6wbCyVBqimANWUdyi73lk4wpIn9lz9Bjuq8
         I5Jg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SrfcdioG;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 3f1490d57ef6-e63e53bd563sor5882464276.5.2025.03.18.10.50.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 18 Mar 2025 10:50:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SrfcdioG;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742320224; x=1742925024; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OvJ1Chpj2jYmxujQHwHr5y5q3DIlYijmy0IxxUrM06M=;
        b=SrfcdioGYZrvJgQs8pCclim1R2rGmZOWaaKcj3GhiuZvyx25qsvWK47/n0dfPUFADr
         XP1vOk2UAUS6STGuJOnrw0QcZ0U2cgvropIFpiQahFIIJ+sd1TGiZ6rbpK3vGogEX6fy
         gMNpbCb2VszOC4svYFWZxWu8A+utVi7AM/g+0w9Dl81awSngUAdHqVAF+C+2e1xRfuJf
         zxMdxgVgDFNDimlRjxXUDN6KXQMGcTIXm0L9M5UV8vmI8pTcYoeB1dzcX0+gZLh3NXjx
         a2cmyZjfMc8PGjT2ERa78R0jrlTFocwfgMCbm8l1RasFrtVlXXHP4NfVam0zqnbKEKc2
         2PEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742320224; x=1742925024;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OvJ1Chpj2jYmxujQHwHr5y5q3DIlYijmy0IxxUrM06M=;
        b=kW6dsqmY6KRppOVvv3g3/ZONWppCAkr+FS1tmQzY0MALNvmqCKZkr5wYbyIMDu/7Gh
         7iGyASHnMhu5zQXPCUYMqWZhMU12VsEUlzYWstys5kWhryzCYbJ5lghoRMZv8fX44doK
         OBJ7FX8YmtCYxUMOXMaSeYKylVszBNtUmOlLPaoLTvobU5/gYCuqwYGo1ckDW4zYwfdi
         Bez60uko9kjsQkSdIf1ruBaO9VnJJBsIs5lT4MckvEDtXmzUnvDEK8yIULB4vbQoIuMz
         0AG1C1lKPqAbCkb+Ud+uXqcaUPQ4TNRF6CxadPjqJmk+xK4jrBlsHP5Ynb0Hfx3x3xwJ
         Z0Zg==
X-Forwarded-Encrypted: i=1; AJvYcCVBVewcBCZy/NL80wQ/uXgOGWuK029P9XDsCoFM90gPrHXRMKDMW8I02TsD4RwJJ2fCFdQ0PPhgxtpVzQ==@linaro.org
X-Gm-Message-State: AOJu0YwEsZo4BddUfDRmZYfT4s8M/1LTkrSsQy0hTV+H/PF0P+pzMu9I
	5pZay4g28CZSSeFEcsxXgWJuigBUz3wKypEYguaY3xt3RQjqpc4/W2JtOssgpcE8yDuTRniaLpY
	zwd4v/YZYJ8vdjEkXbCYHuKbqzwRK/2KMV/Ibswlc
X-Gm-Gg: ASbGncs+g1S8prxNjsu6zWCSrds1lSHgjme6CaW8CECyKwENUMkA8K178v7qkFooiLu
	3QK8HUkl2ivIXi77qEgqAXp7jydKWyUbmlLwlNjwVcwduo1rrgs5MlBMmAaCghjPDX+fudPtXqm
	G9vj9TNisRMMs56Agei6e+u8yACX4=
X-Google-Smtp-Source: AGHT+IGorLR4vpvSPH7Y1YAxXeFqCzaxkKZMA/+kwGP1IAahctRspftJyPmwcr0ynAjnueUx7zlU29wbFehiSxJqtI8=
X-Received: by 2002:a05:6902:4812:b0:e65:c4be:6fb9 with SMTP id
 3f1490d57ef6-e6679026c82mr264264276.25.1742320223682; Tue, 18 Mar 2025
 10:50:23 -0700 (PDT)
MIME-Version: 1.0
References: <20250318045125.759259-1-pierrick.bouvier@linaro.org>
 <20250318045125.759259-12-pierrick.bouvier@linaro.org> <8a24a29c-9d2a-47c9-a183-c92242c82bd9@linaro.org>
In-Reply-To: <8a24a29c-9d2a-47c9-a183-c92242c82bd9@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Mar 2025 17:50:11 +0000
X-Gm-Features: AQ5f1Jq64ZMc3wNHD96Q-O52LvCc-sDu2DSilR-8cUO11vSS_VSAPQPzax2vqWI
Message-ID: <CAFEAcA--jw3GmS70NTwviAEhdWeJ1UXE+ucNSkR60BXk6G8B6g@mail.gmail.com>
Subject: Re: [PATCH 11/13] target/arm/cpu: remove inline stubs for aarch32 emulation
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org, 
	=?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	qemu-arm@nongnu.org, alex.bennee@linaro.org, kvm@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: FWMZ+vo7SHO2

On Tue, 18 Mar 2025 at 17:42, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> On 18/3/25 05:51, Pierrick Bouvier wrote:
> > Directly condition associated calls in target/arm/helper.c for now.
> >
> > Signed-off-by: Pierrick Bouvier <pierrick.bouvier@linaro.org>
> > ---
> >   target/arm/cpu.h    | 8 --------
> >   target/arm/helper.c | 6 ++++++
> >   2 files changed, 6 insertions(+), 8 deletions(-)
> >
> > diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> > index 51b6428cfec..9205cbdec43 100644
> > --- a/target/arm/cpu.h
> > +++ b/target/arm/cpu.h
> > @@ -1222,7 +1222,6 @@ int arm_cpu_write_elf32_note(WriteCoreDumpFunctio=
n f, CPUState *cs,
> >    */
> >   void arm_emulate_firmware_reset(CPUState *cpustate, int target_el);
> >
> > -#ifdef TARGET_AARCH64
> >   int aarch64_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int=
 reg);
> >   int aarch64_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int r=
eg);
> >   void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq);
> > @@ -1254,13 +1253,6 @@ static inline uint64_t *sve_bswap64(uint64_t *ds=
t, uint64_t *src, int nr)
> >   #endif
> >   }
> >
> > -#else
> > -static inline void aarch64_sve_narrow_vq(CPUARMState *env, unsigned vq=
) { }
> > -static inline void aarch64_sve_change_el(CPUARMState *env, int o,
> > -                                         int n, bool a)
> > -{ }
> > -#endif
> > -
> >   void aarch64_sync_32_to_64(CPUARMState *env);
> >   void aarch64_sync_64_to_32(CPUARMState *env);
> >
> > diff --git a/target/arm/helper.c b/target/arm/helper.c
> > index b46b2bffcf3..774e1ee0245 100644
> > --- a/target/arm/helper.c
> > +++ b/target/arm/helper.c
> > @@ -6562,7 +6562,9 @@ static void zcr_write(CPUARMState *env, const ARM=
CPRegInfo *ri,
> >        */
> >       new_len =3D sve_vqm1_for_el(env, cur_el);
> >       if (new_len < old_len) {
> > +#ifdef TARGET_AARCH64
>
> What about using runtime check instead?
>
>   if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64) && new_len < old_len) {
>

That would be a dead check: it is not possible to get here
unless ARM_FEATURE_AARCH64 is set.

thanks
-- PMM
