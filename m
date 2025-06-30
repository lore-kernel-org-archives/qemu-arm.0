Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp2552834dye;
        Mon, 30 Jun 2025 08:34:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVdbB3GdiNRhc2PgZ/f/fosmXYZoU3IXslLEknhPyd3rqmLRMCTdLrUPr/aFAqkVIGoedA2k+6GR76UHw==@linaro.org
X-Received: by 2002:a05:690c:12:b0:70d:f3bb:a731 with SMTP id 00721157ae682-71517158302mr196287757b3.9.1751297685048;
        Mon, 30 Jun 2025 08:34:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751297685; cv=none;
        d=google.com; s=arc-20240605;
        b=H5cdGt530gZpYqYlXlu9Xmr8kCs0uqfmAGgm/MbANQAV0UmCCjamnynwdbIMLXEpOh
         3EYswR5aqfhYvoUXlr/pggQRQIEXQ3PbCSHvixrX5MqcZfJsnh1brqmNU4dUQjor21K9
         PtjjmNfFqZPE2wh0hexsM5HNkeNcA81yTmbBG+MKc0BQqBt/EX1F8QLTp2Quw/leD3HT
         ny3J53+A0I9I/dwfYtFvfyVHQL8xJql7HXufcNlkdYPFBKyri5fJijDBDswRA0+F38gz
         bhoX0UoQNz1LHdbgB0EtAiPZIu8lJVgwReDXAOHWydov9OgBp5dJ1Qc0UuPuXKGyyjSf
         zCzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DzC/oii9o7rPIbYU7tLpYjy4/LYNBCTnqw6z2ZXkL0s=;
        fh=4dhkCDm138/75RqrJUXAxcL0iFx7m9Rw/dXpbonI6vI=;
        b=WpbfpKhY4LQh1XJgse9UWlqvCMl+cRsYsF1jS8CaoLZBZDTFOWGGdG2cyM12T/ZqQj
         oAsh42r3OwGDqpt02YNaG0u1NsKeE4JpwSg7mGN3O0dQUBye5T7dy3uALdujjwhcahhz
         7ajCbbQXogf7PX4t3+WJB8nOKPmVCtWCEVAxz8myVZXxKey50mO0wwoqTfCRV67f3Wlw
         VyjqeYLVZDWJ0+rlZp1mZ9HpLDL8SImq+1WtYMQD9zYSvfZUy88KVo/c7CymmJk8euQM
         PxaKqcApE08eDnONGkYfwbdbfeWeIKKiXEeuGI8r6abrxHc1oWI3ySbL8i3hO/n0NbRJ
         pTDQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YPV2iT8f;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-71515c0dc52sor50209157b3.6.2025.06.30.08.34.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 30 Jun 2025 08:34:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YPV2iT8f;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751297684; x=1751902484; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DzC/oii9o7rPIbYU7tLpYjy4/LYNBCTnqw6z2ZXkL0s=;
        b=YPV2iT8fwlBv6BJLzyZkfcGH3gM1BiqKH+fqAERAWCBaIOvkFjEZiO8GUk90YcLxCK
         K/K3tje7g4jBAUbk+FB+bcfaMTYT7lISMJsBLuKFW5WgTgrhIWcRpGyBqRH8ZfpUNmq/
         rXU+PfJwQbF0reXNHRI/a51KejfdFTfKfglDmn6V85rLuUDNPIT2cAsxqegspWyWt2Tm
         brQi15Lehv5wy20yu3PEVsdWuF/zL8imQVCPMpbXv3chF+X99EjaDXnu3xtsu+x/4nzL
         gHmjqf6Qufpdo2iBryoHzmAaFtvsLnkFgWe0/BiQgh05HSUuCzxyShIIjW/gB8YRhsVj
         KQEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751297684; x=1751902484;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DzC/oii9o7rPIbYU7tLpYjy4/LYNBCTnqw6z2ZXkL0s=;
        b=wTfZxl29Fb0gTgNSX357NeXJLxa8uveSH0Bp6n6CPwo2heTHNLXvjPA1GM+FPXj6g1
         9EQAx85dXQALcMgXjqnbxD2cRprxzMaVDhHan05yIT3IDawJ8RKecnB3SeS92CvRfNpX
         VDBY2Gd2DD3rko7kKLbAC/21nwrcZOg46ORZpk2Hd7AFPe6I5oeJExEYQCQFmnYwJQkw
         Ln1Z3bH2ilPzj5Cvk1tzFEweLnHwd01gRg2UlBsCTL6q27lMsL7eKliM51vIOeReI7Oj
         b7wJMbvV1EcUgj9kFC4j6ms0FjDSpgBttmk6hYCblxseezqnd0C1r+u0Dg2wTuonkODQ
         dUAQ==
X-Forwarded-Encrypted: i=1; AJvYcCVThEIFgw3QybtdjdCz9sjpm3EoeZ26CAARZjsmhGboBFkzcHQ66zpbK5njN6GCG/7g5MlvkZhtsNg6UA==@linaro.org
X-Gm-Message-State: AOJu0YxIf4qdOXt5c0NvNItfaba2d42rkwqo2KJsbCOUtEeF3ysj/ruW
	8rzCNee5fz23dlSmceYaxRjrcPUidKhxvS091cWT9i6GIiIwOnX/DRUYWaZ6+3y3U+m2S3Th0Ub
	VnA2/JolwLGETUPQfFXtOYygYVpNujMchD5RsabQujNxx
X-Gm-Gg: ASbGncvQgmWHG1XNNWICBM8z5/FjVpnwXP6JhBjAg9ywbXdi8VMr3esJ5/lW6Dpl/tQ
	dfAbT1bTPL4xvZgYtMSsWl+YMUY6fJ5AiCyzmt0D8aNszus9y3bZ0bI0MxxZ6LIvrip1I4yY33n
	U4dp4Ot9hen50aKJ0UT0tpMCy5gHgEueoi3b8gIFVKSA02
X-Google-Smtp-Source: AGHT+IH+iwwqTU7zlX2I945lgbnNlrrxF9cxMU8gMHe6Vd7HsmOmqSLMequo3znfXJSEumDV7EvriQUoY33Fxg3xTNc=
X-Received: by 2002:a05:690c:d85:b0:70f:8884:17af with SMTP id
 00721157ae682-7151714d14emr228157307b3.6.1751297684555; Mon, 30 Jun 2025
 08:34:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250623121845.7214-1-philmd@linaro.org> <20250623121845.7214-21-philmd@linaro.org>
In-Reply-To: <20250623121845.7214-21-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 Jun 2025 16:34:32 +0100
X-Gm-Features: Ac12FXygwnSXLP-ZPonXcEmOAhgztcCBXBn2LNuOkJFkl9HoaCecpnHthAmLnYw
Message-ID: <CAFEAcA_xqu1oDLThHBp5T_srQs2+2oxWTXF=sQzBjKDduc0cfw@mail.gmail.com>
Subject: Re: [PATCH v3 20/26] hw/arm/virt: Rename cpu_post_init() -> post_cpus_gic_realized()
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
X-TUID: sM3dWIJ8iX7c

On Mon, 23 Jun 2025 at 13:20, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> QDev uses _post_init() during instance creation, before being
> realized. Since here both vCPUs and GIC are REALIZED, rename
> as virt_post_cpus_gic_realized() for clarity.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  hw/arm/virt.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index a9099570faa..da453768cce 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2032,7 +2032,8 @@ static void finalize_gic_version(VirtMachineState *=
vms)
>   * virt_cpu_post_init() must be called after the CPUs have

You forgot to update the function name in this comment :-)

>   * been realized and the GIC has been created.
>   */
> -static void virt_cpu_post_init(VirtMachineState *vms, MemoryRegion *sysm=
em)
> +static void virt_post_cpus_gic_realized(VirtMachineState *vms,
> +                                        MemoryRegion *sysmem)

thanks
-- PMM
