Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp2810587ejb;
        Tue, 30 Apr 2024 02:33:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVDapGzGhulX6/aGXG+wcMr5QW4PL0qn1wqNL9T6JFZcfMgaeF1jcVg6pDUtf2HxlBy4WOiNnhDBhK2ScKlvP+RURZpvzOi
X-Received: by 2002:a17:906:2e99:b0:a59:cff:2cfa with SMTP id o25-20020a1709062e9900b00a590cff2cfamr2216874eji.67.1714469588654;
        Tue, 30 Apr 2024 02:33:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714469588; cv=none;
        d=google.com; s=arc-20160816;
        b=ga71YLkDd735N/ajvDSEWtYlSe1tmjG5yvzM3gg3k0E9pKIeYW9pHooMeVP7cRLsZe
         /nRKHFyxel+svyGjhWbHLlf+6VNDgwP6tzjYM6Gil6xq1IXmYaYhLnoNxDThHR7EfOTb
         jXHdcOZfDDelYlgbTmYHNRzxkrkhXLY87djbm7iVzTGKInsN7Z5MK6SGjAUbapbj+rBR
         UmxDGvcpmvhxOzXTJ9PY38KfWMF8AjgWGf/u6qioVTkG7yrw4qzeKpAXg77hhHckRbcI
         n7m7n8EjJiHsNTZg70wImYTz7znMZarwTRw5XYXiMU3C98PDGrdbQUrb2tG8XfNmGIkv
         z6bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=gQXAzTFMnsXw1pFM5UUXGZniErQhxR3nHrd/oZ7AE/Q=;
        fh=YryqtQTLQy7Y8oq4nyXMJh4GrF01tm0+fEAe47klpkw=;
        b=vPO6aIf6lT5MRgV8kkpI+xe3CyM+LoLZ+8zCW/1XRMG4XsvNI6lF6Dc4bTAwM5FAdH
         GACQQ7ia2KJOztooPAifYRvGJqaN6hbHGoZYGUYp1WJIqOe5vh5kBEQ3JSRBIuIq8NLf
         t5MZt7WQ/rwPdP2wSEBVHUV+T0czIutbZ2TEBHhOD7exO+e+WU5t1/m/C1xjbkNyXhRO
         Zbcjy8lmFsd7FVZIMftQPmnCC1bLkRIN1ySoAiiPX5H3k4NxbP6bfYSt/aifhEKuuPhp
         Qs/86zZxuzt1NyXolCeHCp+ALGFUaSx11yCcQ1YKtPYA3MvZz8OjC2L5xFXhrmGczKGf
         vYmw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M3E2zzR1;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a27-20020a170906275b00b00a526a9ae692sor7077316ejd.5.2024.04.30.02.33.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 30 Apr 2024 02:33:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=M3E2zzR1;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714469588; x=1715074388; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gQXAzTFMnsXw1pFM5UUXGZniErQhxR3nHrd/oZ7AE/Q=;
        b=M3E2zzR1aaTD9AmQD6yDBlcgCVAW7Z9TLln92WMfK7Cy7w87KgGR3ZeaQ+O31BH3MN
         iO9a389gLFIIX0t4CVQZ9EgIPtoaX+tacn49j7hA99H25ZNNojS4YnB0FmM1HDNwxydU
         qbTOeTeUe2q8C70PrVXTrRJrJeywheS5QOO7Z+5KH4mwhJjWEfmckZCMiiUfUDHSXj0J
         Kt4MdzpkXeaRYJZcTWSO55TG/sNL0tAFcRDjW03kMpsS13k4+L0D8042jepjRaNFeG3T
         9rmMHi0430wVfSU4dKJB38tKBEY8ZVZ9nASMiLfgKFdhFDBiD6qYjsxErzPJXACkXyAo
         wU4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714469588; x=1715074388;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gQXAzTFMnsXw1pFM5UUXGZniErQhxR3nHrd/oZ7AE/Q=;
        b=wWR3QdsKGFHeNk5XjMJ9CqPGEcHGoym9pdJdRmgdVjbNWkwa6kGM/mKBoHqmOP0joe
         OHLIUnR14ih8wGs2DrQJPuCPtC+AsUOSioihQYkvv/dVZwRGW+6Av0LMiGOv6qQDDaMx
         KXNG5k/rfWCRquoq/wEoytfkJlgtDAS+07PTJzDWW/dkoEG/mfintKAwCpg4D1Xwxpnj
         jPJ/DQK4ZorU5TloCD3sIVTddp8qxZJ0E6BS5i17MA2dA3mZMnGMXeZ5ngxDBae66DYj
         UOUJDuFxQZAiBB1sif1uEwBZPog8Kr1b6TXzymdfv7/OO+ZRoT2m8mJBRefuCMzB5Xhz
         MBuA==
X-Forwarded-Encrypted: i=1; AJvYcCUGgGRSbWYXa39SLamfhM/Ys8UTFly7g3sLlcUTAKQwd3chCx2Fps7UHvR6vk2SQ//xueAmntgKWFGr/tnaBv2UwvzhWI7+
X-Gm-Message-State: AOJu0YwzUxKKPZ2+qpFuSfBZrxKtHWaESx6Ek4sw6eXvrbTvtGZksXCW
	Sgm9MHocT4olnPy6bnvHTZH9d95Z6NVtJ3Ok+ppBEuHZvuQmvBACEo52XdTOgNak6GuHPl9BMNu
	gapVByYKpyAtGA3LETDWHZLz1u4EgYoR3Vr0fpeee
X-Google-Smtp-Source: AGHT+IGe62GPIYPF7EUGUC8zzT835WIzpVbwOCAb8gbPh56AQRFaRh5HkuiugzuzyWTPLarHYKGtg34v/eUg1AMgZv4=
X-Received: by 2002:a50:9b49:0:b0:572:4681:8c1d with SMTP id
 a9-20020a509b49000000b0057246818c1dmr8867818edj.9.1714469588210; Tue, 30 Apr
 2024 02:33:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240430064529.411699-1-thuth@redhat.com>
In-Reply-To: <20240430064529.411699-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 Apr 2024 10:32:56 +0100
Message-ID: <CAFEAcA_wbogO85vf=Z9cN2tMX-iwonraX4-jeFqo_yO3K7o_Cw@mail.gmail.com>
Subject: Re: [PATCH] docs/about: Automatically deprecate versioned machine
 types older than 6 years
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	devel@lists.libvirt.org, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Laurent Vivier <laurent@vivier.eu>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org, 
	qemu-ppc@nongnu.org, Peter Xu <peterx@redhat.com>, Fabiano Rosas <farosas@suse.de>
Content-Type: text/plain; charset="UTF-8"
X-TUID: h+QmnjaHLBgs

On Tue, 30 Apr 2024 at 07:45, Thomas Huth <thuth@redhat.com> wrote:
>
> Old machine types often have bugs or work-arounds that affect our
> possibilities to move forward with the QEMU code base (see for example
> https://gitlab.com/qemu-project/qemu/-/issues/2213 for a bug that likely
> cannot be fixed without breaking live migration with old machine types,
> or https://lists.gnu.org/archive/html/qemu-devel/2018-12/msg04516.html or
> commit ea985d235b86). So instead of going through the process of manually
> deprecating old machine types again and again, let's rather add an entry
> that can stay, which declares that machine types older than 6 years are
> considered as deprecated automatically. Six years should be sufficient to
> support the release cycles of most Linux distributions.

Sounds like a good idea.

> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  docs/about/deprecated.rst | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index 6d595de3b6..fe69e2d44c 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -220,6 +220,17 @@ is a chance the code will bitrot without anyone noticing.
>  System emulator machines
>  ------------------------
>
> +Versioned machine types older than 6 years

"more than 6 years old"

> +''''''''''''''''''''''''''''''''''''''''''
> +
> +Starting with the release of QEMU 10.0, versioned machine types older than
> +6 years

ditto

 will automatically be considered as deprecated and might be due to
> +removal without furthor notice. For example, this affects machine types like

"further"

> +pc-i440fx-X.Y, pc-q35-X.Y, pseries-X.Y, s390-ccw-virtio-X.Y or virt-X.Y where
> +X is the major number and Y is the minor number of the old QEMU version.
> +If you are still using machine types from QEMU versions older than 6 years,

ditto

> +please update your setting to use a newer versioned machine type instead.
> +
>  Arm ``virt`` machine ``dtb-kaslr-seed`` property (since 7.1)
>  ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
>

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
