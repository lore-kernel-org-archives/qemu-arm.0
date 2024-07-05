Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp1110894njb;
        Fri, 5 Jul 2024 02:55:03 -0700 (PDT)
X-Received: by 2002:a17:906:5a84:b0:a77:cd6c:74e6 with SMTP id a640c23a62f3a-a77cd6c7630mr90541066b.55.1720173303647;
        Fri, 05 Jul 2024 02:55:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720173303; cv=none;
        d=google.com; s=arc-20160816;
        b=Xwl+LfY+vi+gzYNa9tOk+rzfqKHGIbQ8kto7g2e10Yy2Zny6lvteh+zyJ2ou7c4GV/
         fC8lFnNKzCqxOIIEMp7vjN2lRX9Pq3Jr0lkt6PyfMMBWtVSGv/zk43+5L5RHHDY3y9F4
         PBIm1NogsridScFV+9uod5IEDmUbHfp3C3YAXqY5hGp6RVVKBj8S5trn87JAWU4oeOBx
         BvhAlmeUkeBJfyGQiliEGSaLxYTPDr98N7WFHKAALfEq+qRD7UL43HqlGWcOmz3Xkd07
         lePVVx8D3aIgM+xromXvUJiNOn7MjA2lVJhZeBr/675Bx3gwXEzHYMS1HMXi3sDvH9Zo
         iBuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FZaIyAsrOfFJ9WnEjgMHD7DfxJPFNfGAzAL8zCqdxjo=;
        fh=D8uyZejLYHQtwUNKtY39iIwPBhb1j2MMTF98+RktrMk=;
        b=OqBD6bmZoBk1ffFAE/EOnS3I6e14UeVVmqSgz0SdH7VUqRgmgGr6ew1qbJ8L/E5hY8
         inwiuNl5UGh5puPCBKGJRozJ1K85R/czhPcm63Y45PbA7ZQbZeusTrgRWCzRX66eG73e
         ls2/uhIzYjMmXSrbEvrtx1oyedBJ8pA50BAXncNefgjN3WO3GOFsuQBtW5rxW3VX29Pf
         /KB4PKtP8CwmJZCnI/8US+r+afsEBU9t2c0OMJQ316cVf3Cx2r5PlEEwsINyNV9IAEuB
         j7dN9V/eQxYglIfiyvq6Ks1t5dNDdKjUcQIzGFs+wl/l3oxNxAnDEnqn1J3AY8WwSGi/
         yeOw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ikcDLxVf;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a640c23a62f3a-a77dc08db45sor829166b.5.2024.07.05.02.55.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 05 Jul 2024 02:55:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ikcDLxVf;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720173303; x=1720778103; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FZaIyAsrOfFJ9WnEjgMHD7DfxJPFNfGAzAL8zCqdxjo=;
        b=ikcDLxVfRnc3DV0sSAp7Je9aClM2ZvtzIOGi5z/oWJqxWwz0z1U+bT5WuPZ6mtvqD8
         8cWtCxnPVvzdfvtK+YZ+sMcakUz6/s8aY5kOdGG9SMvTIUXBEJ+uolmEAbWKStujfAW2
         0iwKHcZyGsJDT8Bm4NCH3W7v+SLP/fM3LxJTCFzQTSNoo1W2IoNBWrwujGX520Fukemv
         IihTPf1HhLI2NySGXGBgm3FMLt8YPWZcQP+tJx5VTOiar/PNdyIWU5o4/k2K+aYmhS28
         EL73m1ENWdAvj2CDOXGenvviHZu08YMdAEMA8sRikfWG1V66koeifawJaDUTKBxYPWIr
         AKPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720173303; x=1720778103;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FZaIyAsrOfFJ9WnEjgMHD7DfxJPFNfGAzAL8zCqdxjo=;
        b=DXDU3AFC5NEtlKG5FDrpvvmjkFrdwlkXhW9w1bW6gZrCgCCzb/dv537y2Kj/Hf7tuM
         Hv9COpPf71wXe6MF5SwCXLqwYmtLshkSrivA+6p0C8XNudZheJlUhHS/68tSEZs/pn5s
         c6XQr12GhbBjogKJZN6Yzk/sYsYI2HRMPSe50/Z+U+AMfj++zole6i4jkjyFUbqskJhH
         kA7/9M96SKyYfPYCGkZ67ai934URGQVRazigMaCoF4aIWaTC705j/HT6CPv+kwULd+6P
         Gx8PcC9StN0cB3SJxc/zZol7Tu7c6hSwc1IV81XCacYkSmREEx8znzw+ccEBFWeFOAms
         lhXA==
X-Gm-Message-State: AOJu0Yy2hoAl9zgrVOgaYLsTaSRvsWlhIONcwwEUY+JQb2oKUW5SgUMb
	g99gLhfhg1XpiwzsBawepqEbUdfFaZDacC+ppj9Uwx0R5QGWF3o4aoautIWjN3jTT19zwFvtdU8
	oOBxQJ5LDy5mlLdW6RBKU2eZjafrIXIiv7soswrbn0oWr3Z1jbQtzAVpF
X-Google-Smtp-Source: AGHT+IGmRyHuaw79zmkNqDKK8iyz0EVg8Qxf2l95NmNEBXotv43Qa4yKsoHeTZLADNUWU/2ZeeiDYaEyk7bBzVB0+cI=
X-Received: by 2002:a17:906:bc4b:b0:a6f:50ae:e06 with SMTP id
 a640c23a62f3a-a77ba70a749mr267466366b.53.1720173302784; Fri, 05 Jul 2024
 02:55:02 -0700 (PDT)
MIME-Version: 1.0
References: <20240705084047.857176-1-alex.bennee@linaro.org> <20240705084047.857176-24-alex.bennee@linaro.org>
In-Reply-To: <20240705084047.857176-24-alex.bennee@linaro.org>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Fri, 5 Jul 2024 12:54:47 +0300
Message-ID: <CAAjaMXaZcVRb5eAa0BcZCU+uzUbHOoYC_nsk5RGPsOeNG0teOQ@mail.gmail.com>
Subject: Re: [PATCH v2 23/40] plugins/lockstep: preserve sock_path
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>, 
	Beraldo Leal <bleal@redhat.com>, David Hildenbrand <david@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Pierrick Bouvier <pierrick.bouvier@linaro.org>, Alexandre Iooss <erdnaxe@crans.org>, 
	Thomas Huth <thuth@redhat.com>, Mahmoud Mandour <ma.mandourr@gmail.com>, 
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org, 
	Aleksandar Rikalo <arikalo@gmail.com>, Mads Ynddal <mads@ynddal.dk>, Yanan Wang <wangyanan55@huawei.com>, 
	Eduardo Habkost <eduardo@habkost.net>, Peter Xu <peterx@redhat.com>, 
	Richard Henderson <richard.henderson@linaro.org>, 
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Paul Burton <paulburton@kernel.org>, 
	Stefan Hajnoczi <stefanha@redhat.com>, Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: s0qj1vO1jTRo

On Fri, 5 Jul 2024 at 11:57, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> We can't assign sock_path directly from the autofree'd GStrv, take a
> copy.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  contrib/plugins/lockstep.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/contrib/plugins/lockstep.c b/contrib/plugins/lockstep.c
> index 237543b43a..111ec3fa27 100644
> --- a/contrib/plugins/lockstep.c
> +++ b/contrib/plugins/lockstep.c
> @@ -347,7 +347,7 @@ QEMU_PLUGIN_EXPORT int qemu_plugin_install(qemu_plugi=
n_id_t id,
>                  return -1;
>              }
>          } else if (g_strcmp0(tokens[0], "sockpath") =3D=3D 0) {
> -            sock_path =3D tokens[1];
> +            sock_path =3D strdup(tokens[1]);

s/strdup/g_strdup
?

Otherwise,

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>

>          } else {
>              fprintf(stderr, "option parsing failed: %s\n", p);
>              return -1;
> --
> 2.39.2
>
>
