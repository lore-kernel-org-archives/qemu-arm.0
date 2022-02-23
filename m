Received: by 2002:a0c:dd83:0:0:0:0:0 with SMTP id v3csp870711qvk;
        Wed, 23 Feb 2022 01:19:54 -0800 (PST)
X-Received: by 2002:a5b:7c6:0:b0:60b:a0ce:19b with SMTP id t6-20020a5b07c6000000b0060ba0ce019bmr26552462ybq.407.1645607994439;
        Wed, 23 Feb 2022 01:19:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645607994; cv=none;
        d=google.com; s=arc-20160816;
        b=HytJTEYvS1yJugieUw7S3l4pg5zyFyiB1PgM4xM8KEMia0/RYlPgY4rPrXIjBDfwTG
         0syOrMWl32D4nACYCVwyTBPAUBkO9j4fztXd1w8sit6Gy2xnxitgPIlWmANcn1s9q5SU
         vzdxe9J88RYIORruyphTnEFgqugYbWIC3Mxt/LU1J6WWcBxWBSF4TcFg1dv52chorlaW
         s4JvrkF3cIm6Qry17Xg0gQap6kVh+vdm0kw8xl7QeaYcjVCwnjNFpyzoErNuIoV2tRuI
         xBO6cLThe6aICBvrC5inHjTLS4HAIfh9z0ucDGs9Gl3jvk4yMYWZKWOF0RkIQv9+kL35
         vTHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nXCLXxB6HCrscA7vtjaiHnkKr4QrAkuVD/lkEVxIKbQ=;
        b=qweqNoefHderp1ZWM8eFJ/UjtTl8X2OtB5VL/e37whY+SikP/tz8OjG5v19tBSs+QR
         S58qE3ERDdY0eCI55Sm2XiLyeFuEgb0RS8b3wxErmVjkkieDsf6dMyplh3HMSPaOChMg
         Zir+3UTAUTxAfpDChgx+mtld5NOh+SH7hemptYdTrlux1d2U/atX9Q0zOzv2r0Ihx5DK
         GnKJ4IzF6gCDN2ebkpAGXyySDvbSGAklQwK5AeeVeTX9mJdgI16YM+KUIdRDcB1aY3mh
         eTYE4rnw5m/2z5V41wQDbt2MycpALQJ7VKZQQcdYkYdwXgMfdEKMUNU+ZV2GCgrsp/EU
         d0ZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UaQxdwj5;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k188sor12917369ywb.84.2022.02.23.01.19.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 23 Feb 2022 01:19:54 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UaQxdwj5;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=nXCLXxB6HCrscA7vtjaiHnkKr4QrAkuVD/lkEVxIKbQ=;
        b=UaQxdwj5S87gVF8hhKphMX9feVRNS3B/SQYGSeSld9mFvZyTcbDJt1S4aD+ZECTuby
         tiUxdGddedY2/AyxRLqRVVqNZQkoj+vonwzSq3ahQKVvy15C7VBkrUxKXq2xdr19yAfb
         PjMdJbeV58AS30Iy/nc7uX3wpEN0lWQoWtcX3O0kvBYPry27zv6qz42neodsQ2F9huYC
         z8xaXsbiJ1O2G4xV9wM4vuOMhP0KZPrjhhezTl764reuLyvc6sKG6QoF798rKO7iFTSk
         LzQBRyAWYIwGXlVSMzdeJNWkBNT+4Hn9qupAMyVB/rjjy4Xq5y0YNN/9sI7vWE7iW7u0
         yhkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=nXCLXxB6HCrscA7vtjaiHnkKr4QrAkuVD/lkEVxIKbQ=;
        b=2Fi+jls8LAH60Jrp74qKMnemmCSqMH/HgjnR/xvYMEeYlWrUG1hWY2QgosoS6pV5s3
         rMLsEH8zVtF3HEv5TV8OnTaHeJpiU37gzWJkCi2L/yHu1lTqtcvqU2tfNYCMNSTW6nT7
         8PwXdqk4Qd+tFMKM3dOZ3eL9hP0+DQAGY4dmRpTtQ0G5wAAYOExUVOuy2C5CnRVrp6c2
         A/HuyUkyYSDLD88va19Nf9smE5k3RMQFxAMeFkNvd5poVvtPpsjNoP0OsGT+5ctorzxe
         /m5+CSWAREHqHV7gsK9bdNYgSyOURSBMtoWtRIQvrLKVkPJ5TCg2s1maG+SgQNfpJ1VW
         iUrA==
X-Gm-Message-State: AOAM5300yDJPgvJDU5oM1oaT93fW12z/+COGLaboAqvCe8TO5UVBYwIP
	z8zFpHv9RsXEQ1rlnax4pRfk1tzoB6J5WofWj+BmqW1w
X-Google-Smtp-Source: ABdhPJxDgGmwRBqn1ahZJ0PCC2VvSxMzsYtzf26mSUSYz7qFYhAWXzEZL9V2rTXOh6EmJtJNzX6KEEg6ubNXVCJDfb0=
X-Received: by 2002:a81:a748:0:b0:2d6:1f8b:23a9 with SMTP id
 e69-20020a81a748000000b002d61f8b23a9mr28274883ywh.329.1645607994047; Wed, 23
 Feb 2022 01:19:54 -0800 (PST)
MIME-Version: 1.0
References: <874k4xbqvp.fsf@linaro.org> <878ru2nacq.fsf@linaro.org>
 <YhURfqMvRT4xbiz6@redhat.com> <96bafa75-a0c6-f431-a6d8-fe98d438d0f9@gmail.com>
In-Reply-To: <96bafa75-a0c6-f431-a6d8-fe98d438d0f9@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 23 Feb 2022 09:19:43 +0000
Message-ID: <CAFEAcA8mNt_-nZoV7RL4_UQUV=nPQsDM8KBTA8qAGmiNtXWx9g@mail.gmail.com>
Subject: Re: Analysis of slow distro boots in check-avocado (BootLinuxAarch64.test_virt_tcg*)
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel <qemu-devel@nongnu.org>, Laszlo Ersek <lersek@redhat.com>, 
	Cleber Rosa <cleber@redhat.com>, Oleg Vasilev <me@svin.in>, 
	Richard Henderson <richard.henderson@linaro.org>, Emilio Cota <cota@braap.org>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Idan Horowitz <idan.horowitz@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>, 
	Igor Mammedov <imammedo@redhat.com>, Andrew Jones <drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: xMzu6Mj5Yrn0

On Tue, 22 Feb 2022 at 17:33, Philippe Mathieu-Daud=C3=A9
<philippe.mathieu.daude@gmail.com> wrote:
> We need the DEBUG profile to ensure the bios-tables-tests work.
>
> If you want to boot a guest using EDK2, you should use the images
> build by your distribution (/usr/share/qemu/edk2-aarch64-code.fd),
> not these images.

Do we have any other images in pc-bios that are silently
"do not use these images, they are only for a very specific
test case and nothing else" ?

Also, "make install" installs these EDK2 images, which doesn't
seem like the right thing for "this is only for one test case".

thanks
-- PMM
