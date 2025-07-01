Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3029674dye;
        Tue, 1 Jul 2025 02:39:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVxt5HmLEx0foIpZyC0pc0S7Um+6bslxjKjY058gmJJbkBB2ASuEeUvJEER88/guqGx1uvy3p6sykD0lQ==@linaro.org
X-Received: by 2002:a05:690c:9985:b0:710:ead5:8a95 with SMTP id 00721157ae682-715171506d9mr252002247b3.14.1751362791375;
        Tue, 01 Jul 2025 02:39:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751362791; cv=none;
        d=google.com; s=arc-20240605;
        b=kJzXipD3gg9oME3GhXbmQQqVHh+2qlMeaJrKAtW1ds2Vr82ZrU21wo4QVjSdnbDjOd
         cG0A5sVwbCepe1/hxO1gaxnZGtXIvPsLu+z94IYEGUPo3AznySpKwpFf4No/djlldaRF
         aJGmXlqkp7Jc3hGJL6fDVrQbbmSrLJwmH0Mm1Tm0mxU2SZZQokBfvMCqyQ42MVTGvKPy
         5XjwJe9PF05rVyspYivZnAisy/Dydk8TVICM1vq0soXutLpSJeBMfKzrZHeV+hJeCPhh
         7n5u3UyXNo6bTMoDW4aQ4hbNLMmZtKoF8aaWQi60196tmAv8m81pr0gYOfVwMBfCEQX6
         c8AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yCOcQLmgdtfiHoEGzlEjIWzRramti7JO+XwYRKwRFyc=;
        fh=UnOQ5/w2sSesQpjK9pR1dfQNVxpZ0Ltyb0zKzaYIS+0=;
        b=JMVkSUVpuQF+0nFoXirRtkH6s8206r/zZg0Ab0J2/U1dheymKn3JzVxut5Q+pLuUKL
         YzH47Xlt2qRdZZ5KnutpbppjVqktZj8YASBm4yF9ixyPD82fXoyCVgi8R/i2/IUwn2nN
         Y7yBLdKb3Mdbcy8iufOTWgqo49LfRu8geDMYzl6OAWxRBIRRg6jaui5GPiNueY5t/aoB
         I5DcczgnJuZ0U/hNuPdSIHQc6rju51CzxciyNE6R1weYcEP7fWKg1qePvUW8GRLnuDKx
         JGWv0+zkJ+leSUrq7XJ/NGpXnaeeWmmObtUMszecGlgz1YbOnUNkKIVXr3lXQybUoy+0
         Pcgw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NNmZytgk;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-71515bfc275sor64345257b3.2.2025.07.01.02.39.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 01 Jul 2025 02:39:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NNmZytgk;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751362791; x=1751967591; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yCOcQLmgdtfiHoEGzlEjIWzRramti7JO+XwYRKwRFyc=;
        b=NNmZytgk10/4SUArXXYS1dIQbZBFYruXb9p46l1SxkmfMxk2hTXIQ+IUqVMY8kkcdK
         TFW6gxbNfwNteMQE7wL9B3VlKWaeLmy5XbZBiw3QAHpl7lw4P5hK4E9iVaBrOiymYqa8
         2m7m8tOmLG+xNAcmrrIsHrt9hbesl6wPhKpTrMXyeLH5VEQ2skcpbB64Sd2ejboxrzgg
         CEIKUuJ5kzE1fTqCdDtue/DMMrhkxZxtu+KM67f2O2JwuR/O5Aq2Sly4zCSOiHv8Kzx8
         IPg5BHt2hWU51gJJ4fhc5g6HJmidXBPFGZBBwGw2MLdeT1y2YORGQlGYIgKKWjmKGyVl
         FL9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751362791; x=1751967591;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yCOcQLmgdtfiHoEGzlEjIWzRramti7JO+XwYRKwRFyc=;
        b=UnBqyxzi5dhKfZDEgsLywKDHrXmkkxMkkGh54F9gY6Qb9FMectZysRQEOKc0USOwou
         3J6522fdNn/hDm0mzj0PpT9I21E8r+32wArki1p5iBKEGFS/lm+h+cvnBgP+ZMTeRUcm
         /XGZTQWg8o9BsYcZJ1+hbXn0QDidg/eOe4rQiJNlMwBTvNYJfLlnNCYc0yRnCc/WRG/R
         ga9rDABumTU9Yc++3SDsW7ZbgDbRVJQVvlQItld1Uo5SEP61fYMlHfyFGHn4uaPvZBCx
         CJC0dN6m1lUAzqvuCCzY+Wz45CWptOfyb4l2wZKOLiHf5jI98pO+ewLnkHQ3oBEvzdGO
         ZlAg==
X-Forwarded-Encrypted: i=1; AJvYcCWiA3SO+wWSyA1bur/PIHs6xnfbDZZ205Bu4ThlbL1GLILc2eCaOAcPfcaHYAaeaowJW0qmMBLyX/qYdQ==@linaro.org
X-Gm-Message-State: AOJu0Yym6vY92M2RAp7uAVJe1XIM+4Jav0YlhMKKbQkRK7yaQbdsNF05
	RiK9dbREvNNH60WW/uMu/xhSzluEa32NH6SEKw8gSbNW1x9MmFOSr702rjLyHiMH+zzqEQJJ/MM
	rnjbw+jyCM5n2HzORXyW2r/MzItuKbprPSHjj/kQ7Ax9B
X-Gm-Gg: ASbGnct7lFL3louuJEZvCM5NnoQb8M+6bInbn8NIzyu6Ql00LHide3V3K6s0Uf/TrsY
	g0dN9ytfqSMbgaQ9Dvj27L1f+kXDMubewYk+1t8QMIwj9vCA4Una/xXOEp+95ovBoUOnRa3Ti6w
	cU3uMmUtCZbWYzUqlenBZ3qqFlX8slDKlGneQ1GxK+jwod
X-Google-Smtp-Source: AGHT+IHDlq2gURbFKW5g1kNI0w9591f5lYZ70IA6CEkE0lSHka0P6ZqUiCTl2McDGmbd1GXnJnECbd53cRCfMH2DS9I=
X-Received: by 2002:a05:690c:7443:b0:70f:8883:ce60 with SMTP id
 00721157ae682-715171aacdamr245762197b3.26.1751362790962; Tue, 01 Jul 2025
 02:39:50 -0700 (PDT)
MIME-Version: 1.0
References: <20250623121845.7214-1-philmd@linaro.org> <20250623121845.7214-5-philmd@linaro.org>
In-Reply-To: <20250623121845.7214-5-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Jul 2025 10:39:39 +0100
X-Gm-Features: Ac12FXxpYnulxisO6QVKFIKPO-zv9Pwl_r62oxyX2ZYzOaAwSavLKRmqxWTN_Jo
Message-ID: <CAFEAcA8+9TPps4NkRwRTZXq-nkR=zJ1SsFLnMzzNf7MioU-qsw@mail.gmail.com>
Subject: Re: [PATCH v3 04/26] target/arm/hvf: Simplify GIC hvf_arch_init_vcpu()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Leif Lindholm <leif.lindholm@oss.qualcomm.com>, 
	qemu-arm@nongnu.org, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Roman Bolshakov <rbolshakov@ddn.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Alexander Graf <agraf@csgraf.de>, Bernhard Beschow <shentey@gmail.com>, John Snow <jsnow@redhat.com>, 
	Thomas Huth <thuth@redhat.com>, =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	kvm@vger.kernel.org, Eric Auger <eric.auger@redhat.com>, 
	Cameron Esfahani <dirty@apple.com>, Cleber Rosa <crosa@redhat.com>, 
	Radoslaw Biernacki <rad@semihalf.com>, Phil Dennis-Jordan <phil@philjordan.eu>, 
	Richard Henderson <richard.henderson@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: SAeubE7tiycY

On Mon, 23 Jun 2025 at 13:19, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Only update the ID_AA64PFR0_EL1 register when a GIC is provided.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/hvf/hvf.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
>
> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> index 42258cc2d88..c1ed8b510db 100644
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -1057,11 +1057,15 @@ int hvf_arch_init_vcpu(CPUState *cpu)
>                                arm_cpu->mp_affinity);
>      assert_hvf_ok(ret);
>
> -    ret =3D hv_vcpu_get_sys_reg(cpu->accel->fd, HV_SYS_REG_ID_AA64PFR0_E=
L1, &pfr);
> -    assert_hvf_ok(ret);
> -    pfr |=3D env->gicv3state ? (1 << 24) : 0;
> -    ret =3D hv_vcpu_set_sys_reg(cpu->accel->fd, HV_SYS_REG_ID_AA64PFR0_E=
L1, pfr);
> -    assert_hvf_ok(ret);
> +    if (env->gicv3state) {
> +        ret =3D hv_vcpu_get_sys_reg(cpu->accel->fd,
> +                                  HV_SYS_REG_ID_AA64PFR0_EL1, &pfr);
> +        assert_hvf_ok(ret);
> +        pfr =3D FIELD_DP64(pfr, ID_AA64PFR0, GIC, 1);
> +        ret =3D hv_vcpu_set_sys_reg(cpu->accel->fd,
> +                                  HV_SYS_REG_ID_AA64PFR0_EL1, pfr);
> +        assert_hvf_ok(ret);
> +    }

This doesn't seem like a simplification to me...

Looking at the code, I suspect what we should really be doing
is setting the GIC field to either 0 or 1 depending on whether
env->gicv3state. Currently if hvf hands us an initial value with
the GIC field set to 1 but we don't have a gicv3state we won't
correctly clear it to 0. i.e. we should change the current
  pfr |=3D env->gicv3state ? (1 << 24) : 0;
to
  pfr =3D FIELD_DP64(pfr, ID_AA64PFR0, GIC, env->gicv3state ? 1 : 0);

thanks
-- PMM
