Received: by 2002:a17:504:5682:b0:1be9:327d:8ee3 with SMTP id r2csp1156716njx;
        Fri, 25 Oct 2024 08:54:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVYwoL2wTHTme+1RUfkA5WHI7P5LEruoyNK9KVIqYf5oXWP028wbGobx0KogW9AWjmFHZ8QtLi/Lppw4g==@linaro.org
X-Received: by 2002:a17:902:cf07:b0:20b:8ed8:9c75 with SMTP id d9443c01a7336-20fab2d9220mr138707745ad.59.1729871655113;
        Fri, 25 Oct 2024 08:54:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729871655; cv=none;
        d=google.com; s=arc-20240605;
        b=LWVqV+zTvkgXYwfSnF8e10VYfkCU0vkYxtI2CGyZEvJ0fudhfDEnnB9KoNIzmNJt0l
         LeI6sCIKmYCDevuLh2/J41P71iL4LX+O2Mu7oWgnDkrsRpkDaVHX/zFyRxbbsqsrqW2C
         FfHVc3Sex6Fxcnl/1j3jzHAFAO1BO5Ol3XdJ70xjjjF1zbnqRRyYd53Dx2J/HG0Xv6ko
         su7YSfbRh7zHQ0eCOhb8vGQvdTOtw6hK5paCnhQb/KyjRpxaBKu1uQhic7eHmdbQmt1c
         lWrx3Qr2PPbLH5YlgXjsJURqJiituRkqnxc5boOsltD55hl1tWQyzJezxX5zDqo6yXbr
         YIzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qDI54KTdFRpNej9YaQfxoWTqRblPMpcIvzw4SOwLtec=;
        fh=Fes9rENjZJclmVWKqfGo5vK1Gxvr5KKmQmPz+UNZHRw=;
        b=SUCvirmNh5ySo2Sy9mHiKuXt2dU6FC/XiZOIMPsHv+972YiuHX5xvs2s3CsB1EpUEC
         d53CfiWpaxrH3VjMiBGKSZsign7+PWaHVxCZgg0WOd+IZ23fKU/Kstcc67TWzhpWcGwn
         wFag7rtKCPmh+KkmhgWBuWBD0NLSM8/LroPL4FxEetpeiM7HnbRuB8AmxCnggjJnKH1v
         4t5TrDpclCHOYHKXK0pBA51ti/IcCwEe9cDRO8B85Q2ha3bDY4yUY/V9lOODd0hXNlHa
         jbSzzxkWZvSiN6HEcnM9fbevaXTBVd+1ySO0myHuJ+YYnUWU9NSD1RprRD4LyXblK3EI
         H5qw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=D+EX5vMb;
       spf=pass (google.com: domain of jcmvbkbc@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=jcmvbkbc@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <jcmvbkbc@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-210bbeccfefsor10871565ad.4.2024.10.25.08.54.14
        (Google Transport Security);
        Fri, 25 Oct 2024 08:54:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of jcmvbkbc@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=D+EX5vMb;
       spf=pass (google.com: domain of jcmvbkbc@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=jcmvbkbc@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729871654; x=1730476454; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qDI54KTdFRpNej9YaQfxoWTqRblPMpcIvzw4SOwLtec=;
        b=D+EX5vMblwjObt5rPhvmJjJEtL4K/S4OoTPmfDSGTSLEJvSxB+Wstch8NWeuMRObmv
         1oZYiuHHcfi7Kabod36xxpo/7Vcec2LpKm5AQwhQIEzBrqQKPoQqHX5KPgltiKlgcfCt
         cn+hHWAvHxK3LN9jlDTpv2CpcQxPJV/ViouRDKzAFyF7XNYR6aNrkZTzMEd/dOLLmBSP
         afEiXd0tpv+4wJkvyVaVBeUGmq3mAituOiJSzB42feFeBKn6TRy1sZLKhhsejCxDXDIw
         K/F2VgXU9JFZEBXPsSgjNRz60nw5m6EnQOT7MF+yq2YZR0kqDp1ks3gluTVBhAylvbyt
         V0pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729871654; x=1730476454;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qDI54KTdFRpNej9YaQfxoWTqRblPMpcIvzw4SOwLtec=;
        b=NoUYlFsrFZ11IUXyshh03XNBfsD8D1LKkbjS/286PdiLXFIJRrfQxzHGqjfLzEmnfv
         yl3EGshH5gvvQOP1HC0DUXRdJahEPZhdAPIsTrRCObRrCjUAyOHNcMnU5ra8P6ELNJIl
         hFs877agkp46hq/DiwhkfnKtJuCIs+27MvdtolwWjmHVx4q0JecS44VbmKrY3SIjkNc2
         rL6nqPiy527MuMoLkuG6O828o1w7aa8VIR0bEPwe/b8DvlsuMjpBK08htSbYoM4dX+Pi
         GLraPBNLsHh/aFf/X9eZzgz2mwggTX778Ay4tYkfetJlrimp+mF8gU5/xDG+m8Xc+OzO
         30FA==
X-Forwarded-Encrypted: i=1; AJvYcCUjXjGEqcp9EdNGdUYGHVpkGVnqwHIlYZJ3C9EcgJGH84qHsjYYoe2t1u29ZdgJbFs4os7zswuJ@linaro.org, AJvYcCVv2j3Xca18wvj5FBCAtuW/C1KSRTPUsic7hws02YkM0LEnteKdwSUQAUCHhgHwqTLYC/DEp3HlkB4A2w==@linaro.org, AJvYcCXxaSvdHABy14a8iD2zlHnNlBz5+hBofJO7SoxCdNQDs9Swt7gLIzAsr0zUKsQUBoHmoKbR/iMZXXgR4R8KnWRKtLQ=@linaro.org
X-Gm-Message-State: AOJu0YzuNAh8/oiA65YY2JbPHGm2V9Uxm83jYt/ou/qujyR9bQvAPzgG
	uD7IonPddkpB4rMNfgxLOn7+SfymW08nkpCz6T++uhj4k1Z7H52rNNT4vhNGnkClhtdJkvOdyq2
	8uCX8qn2qWF1H99W1vH+iF41Ci5/KMw==
X-Google-Smtp-Source: AGHT+IF64cda8/CX7HuY9GCD6+i5F9X3dCRHi9cKjZBXlUdfcsjk4LFg04CSvxxK4GilcKFWrW34xOFk3lYcPoihi1M=
X-Received: by 2002:a17:902:ceca:b0:20c:528d:7063 with SMTP id
 d9443c01a7336-20fa9e0aa82mr139767605ad.19.1729871653972; Fri, 25 Oct 2024
 08:54:13 -0700 (PDT)
MIME-Version: 1.0
References: <20241025141254.2141506-1-peter.maydell@linaro.org> <20241025141254.2141506-14-peter.maydell@linaro.org>
In-Reply-To: <20241025141254.2141506-14-peter.maydell@linaro.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Fri, 25 Oct 2024 08:54:03 -0700
Message-ID: <CAMo8BfJvoCri2+Xh-2e8E0UKVTJW00nJHzTskzdk6OZhXcd90Q@mail.gmail.com>
Subject: Re: [PATCH 13/21] target/xtensa: Factor out calls to set_use_first_nan()
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Richard Henderson <richard.henderson@linaro.org>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Song Gao <gaosong@loongson.cn>, Eduardo Habkost <eduardo@habkost.net>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
	Aleksandar Rikalo <arikalo@gmail.com>, Stafford Horne <shorne@gmail.com>, 
	Nicholas Piggin <npiggin@gmail.com>, Daniel Henrique Barboza <danielhb413@gmail.com>, 
	Yoshinori Sato <ysato@users.sourceforge.jp>, David Hildenbrand <david@redhat.com>, 
	Ilya Leoshkevich <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>, 
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Artyom Tarasenko <atar4qemu@gmail.com>, qemu-ppc@nongnu.org, 
	qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 7eGByGuRLKMS

On Fri, Oct 25, 2024 at 7:13=E2=80=AFAM Peter Maydell <peter.maydell@linaro=
.org> wrote:
>
> In xtensa we currently call set_use_first_nan() in a lot of
> places where we want to switch the NaN-propagation handling.
> We're about to change the softfloat API we use to do that,
> so start by factoring all the calls out into a single
> xtensa_use_first_nan() function.
>
> The bulk of this change was done with
>  sed -i -e 's/set_use_first_nan(\([^,]*\),[^)]*)/xtensa_use_first_nan(env=
, \1)/'  target/xtensa/fpu_helper.c
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/xtensa/cpu.h        |  6 ++++++
>  target/xtensa/cpu.c        |  2 +-
>  target/xtensa/fpu_helper.c | 33 +++++++++++++++++++--------------
>  3 files changed, 26 insertions(+), 15 deletions(-)

Reviewed-by: Max Filippov <jcmvbkbc@gmail.com>

--=20
Thanks.
-- Max
