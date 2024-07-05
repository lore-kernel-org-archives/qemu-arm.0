Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp1108973njb;
        Fri, 5 Jul 2024 02:49:36 -0700 (PDT)
X-Received: by 2002:ac2:5206:0:b0:52c:c9e4:3291 with SMTP id 2adb3069b0e04-52ea06c71f9mr3541751e87.60.1720172976330;
        Fri, 05 Jul 2024 02:49:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720172976; cv=none;
        d=google.com; s=arc-20160816;
        b=uGSM0M1dU748w9fzE7kf4fFLHqPmfmyRyR7IZg+GC1b8e8TrzqF9uldrU2ZQ4RTmCu
         4ndWlEkpX9JOfFVCOYxn+8CocnuCj3OMI/9QCgpS80wHadlm7XH7Qv9II20vsHz6eAI7
         bOHEhYYJUANzjD2JzoJE1yR7LQQLqWa5o9gloJfs8P55ckfqj8ebYiA3LG9vr7z9jRK/
         /MEwpG4S+TxJ1r9g3pvZ5lcZg6HeGfCO/3g7a0IXRH3aXmZQAK+hCR4h2AcfTKI0AOJY
         mHApmq1K1F9ETQaxoU504/o7drbX34VQRj6nZ6R9dDt4jYL4uG45BdSz4QFE/9rARjPu
         BHuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SA5fqbbIKfYnNVXC6O8TAip/fhhb8m+yZ0iiLyhENgE=;
        fh=D8uyZejLYHQtwUNKtY39iIwPBhb1j2MMTF98+RktrMk=;
        b=lkk2TBLKrxA31obmjqtZ7xYglmMDR46CVcZdq9EXEpVXJac4Ykp5WIpS/U/qsdZ8nT
         Yab77JCHlCYBmlJRdRiypdKAWBXWCKwJ7LkypgX/0oTPPng/yZrc8W9BDC1sm2pz7KYg
         EjGAMPXpMRjPuZKv57YBS2mLWvtvlBF1tp6V6N1/EKBKo9x9vWqwzh1qQqTzxjc7WRxx
         uRlukfStYEa58/M7FDC2JB/Wq00RBZNtFpoMcQmj9RA7OdUMnq9HwpDaz2CevgIjiTxa
         DA5eiFCgg4tVwnfDYVDGKXwKtDMjp1lcvdghCsgXUrFrNhtm9GPpQKtcGoAhezzgMQQu
         0/lg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Bdu4A6UD;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <manos.pitsidianakis@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 2adb3069b0e04-52e9e9a3853sor1208532e87.8.2024.07.05.02.49.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 05 Jul 2024 02:49:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Bdu4A6UD;
       spf=pass (google.com: domain of manos.pitsidianakis@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=manos.pitsidianakis@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720172975; x=1720777775; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SA5fqbbIKfYnNVXC6O8TAip/fhhb8m+yZ0iiLyhENgE=;
        b=Bdu4A6UD7urVkUfDTvmxP9+UK78Ja+BIQvsRdP80Tynz+3ynhfhbehz/bpXWPHc163
         slMUfKl9kJoCgGFRk6MQ5T7lAPub04HGPF+yzI+t4QG8x+Fj8iJUVIHi9FziprXJg/aq
         i7AgyXQS6lIL9zLVSPJhIRB//mEGmmtjXtXbYaGcG1Gg13oXmL0o1QbmPacUJCmDdtUy
         nxf+RhxCtzBcQUjZpXzHh7dG1WPUfiTdH7FpHQUeTJJ+eFdos9HtR/ILvpMw85lb+jtS
         tBBO9BeCkXSGbVVDnX6y9C2iyGh8gwypCR9yLS1PAEG1hyt4QFjSKVsm65PsL5dIyuWF
         nXpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720172975; x=1720777775;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SA5fqbbIKfYnNVXC6O8TAip/fhhb8m+yZ0iiLyhENgE=;
        b=wOd480yfQpivr/0JV40I+jrw9yr/jt2iroGKVKLIUA+H14HbGugU3/GWBXIOzhrmBq
         GbmUufY6VpC7Cwekq7XaWwU8PH1/JFt6NLzh+M5agC4joavi4LggKWAsyxpq6W+wYKN+
         KFi6wvJUBu1n0JHisi1XLe5CkDtGAfW7bSP2Jg4XfQ4rmDQ0wm7aTIYSsQ6ruY2VeZXD
         zO0surFmYXhmQWZ/UJ3X3g6BjPW72qpInMjea+k+jg+BYXKbxgfrucGFGlDKcTjwXwaV
         W0/XB4sllIuM4dcnUPBiBjHtVVbjH/ZdisFQCTyMIW3KqX+zK2xfYpFylgJzEl/4dN6X
         1e2w==
X-Gm-Message-State: AOJu0YzYh+jjz1MUyYMP0XGXihgzrauCP70ucH8uCY3rZ1O8QaYalVn1
	GDFpvjH++9uPbNGul19JKzVyV+MaOgGhmvDWVbJbUT+n9SOvuEcV40i+eaHTf8Jb9KXqA97ZSbm
	AqengEHo0aYB1gv+jcIk9M2XuiWTupEye236CErozmc7dfDZ3aRahJaIe
X-Google-Smtp-Source: AGHT+IEVgkphEPZLVcvXk/FhDhmGKva9+16mUH7TFZa7IkicGO9tBYsN+zesRnWhkXT86MzgG9woZhiXlXUXe1a6YxU=
X-Received: by 2002:a05:6512:15e:b0:52c:76ac:329b with SMTP id
 2adb3069b0e04-52ea0632400mr3357568e87.35.1720172975271; Fri, 05 Jul 2024
 02:49:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240705084047.857176-1-alex.bennee@linaro.org> <20240705084047.857176-5-alex.bennee@linaro.org>
In-Reply-To: <20240705084047.857176-5-alex.bennee@linaro.org>
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Fri, 5 Jul 2024 12:49:19 +0300
Message-ID: <CAAjaMXZVbuKO=f8DUYc-ogVEtBer+U5Ms3vUPYAfFuJzDNiXiQ@mail.gmail.com>
Subject: Re: [PATCH v2 04/40] hw/core: ensure kernel_end never gets used undefined
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
X-TUID: ZwHKDVEJfJyj

On Fri, 5 Jul 2024 at 11:41, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
> Really the problem here is the return values of fit_load_[kernel|fdt]() a=
re a
> little all over the place. However we don't want to somehow get
> through not having set kernel_end and having it just be random unused
> data.
>
> The compiler complained on an --enable-gcov build:
>
>   In file included from ../../hw/core/loader-fit.c:20:
>   /home/alex/lsrc/qemu.git/include/qemu/osdep.h: In function =E2=80=98loa=
d_fit=E2=80=99:
>   /home/alex/lsrc/qemu.git/include/qemu/osdep.h:486:45: error: =E2=80=98k=
ernel_end=E2=80=99 may be used uninitialized [-Werror=3Dmaybe-uninitialized=
]
>     486 | #define ROUND_UP(n, d) ROUND_DOWN((n) + (d) - 1, (d))
>         |                                             ^
>   ../../hw/core/loader-fit.c:270:12: note: =E2=80=98kernel_end=E2=80=99 w=
as declared here
>     270 |     hwaddr kernel_end;
>         |            ^~~~~~~~~~
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  hw/core/loader-fit.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/core/loader-fit.c b/hw/core/loader-fit.c
> index 9f20007dbb..7ccc9d5fbc 100644
> --- a/hw/core/loader-fit.c
> +++ b/hw/core/loader-fit.c
> @@ -267,7 +267,7 @@ int load_fit(const struct fit_loader *ldr, const char=
 *filename, void *opaque)
>      const char *def_cfg_name;
>      char path[FIT_LOADER_MAX_PATH];
>      int itb_size, configs, cfg_off, off;
> -    hwaddr kernel_end;
> +    hwaddr kernel_end =3D 0;
>      int ret;
>
>      itb =3D load_device_tree(filename, &itb_size);
> --
> 2.39.2
>

Reviewed-by: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
