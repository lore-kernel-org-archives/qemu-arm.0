Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp179494wme;
        Tue, 15 May 2018 05:03:37 -0700 (PDT)
X-Received: by 2002:aca:cf90:: with SMTP id f138-v6mr8987790oig.333.1526385817091;
        Tue, 15 May 2018 05:03:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526385817; cv=none;
        d=google.com; s=arc-20160816;
        b=nPux8CjRfIPHuMOa18JcNmH4F6KHAqIu0qzmLHEJyETeYCyAcODCJNri9Gds0srpPb
         M8TBHWoX2gzWwdNLNQcHTsa+4h/wF0slE6z416mcGjY7SymsLUxYA5SzHE+ARN5hQVGQ
         D441y0enjuY2n94z/C7PrOoblDyaaOlRRMg+a2X+CgJksxedt8uE/uFbC1Kkju4LOHER
         GXnyKQpHLKlC5MptgskXIDqZIKsBIhlbVqjD/2QgM6KBrWurJw80K3Q+f/fzbvKc3zC6
         TFjSwDanOovG0BncuAo13e1t0eoZjkJZ/MgBmvgGGx6fCRMb4FWtUujKfsr/bdKfx12D
         Ghdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=xaAZ6f1HOeafbuWOLXqN2WNDXIsmhnA5CM5BmfdRsjw=;
        b=rBINOTM+oXW+gAawRGCv3Z31auXF4YrDgOMZnJVC8UbrFDqxOBaYvq6iKyrnnw0P3I
         4BSK3UYdmTiCPZSznzvcVpjrkfm2HxGbnlrgF5ayEz5D63dblQiuLxIR2tRrSv5nCDWK
         bFlGt/1QwhF1yVYd6BNAFdKZVreRIHtMtNQqbpGB1pFBT4S2+Y11KQRqOCkjqY5DS8+W
         rVFe3oj8hsnwDwGZ+w/DDEujQsL6a7XnXnhgTCZidKgZsPS00mzcm12WddwmIZwRrIZb
         pzC8jKo9wwj78NLhPSzIOILmMX/zT8nb2ubkLGAUc7wyU4eCdTngZM1M5/rnY20CC5fA
         qQ3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K4Bx3O6g;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id o28-v6sor8592987otj.251.2018.05.15.05.03.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 15 May 2018 05:03:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=K4Bx3O6g;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=xaAZ6f1HOeafbuWOLXqN2WNDXIsmhnA5CM5BmfdRsjw=;
        b=K4Bx3O6gg7uRjYhbPmwSTWfUTrrx0rl/XDrhoMLca70T4KeRVoqefjIaFhPJqYeNlJ
         I4x9onO2tVlApfQZulGlXpXBG0EUbl8emTpGY50ifH6c9nuL9maIGZ/n3/0BaOgMRRD1
         tcqn/GwBE58j6knaUMLTdb/wbZTZQ/QHtH9CU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=xaAZ6f1HOeafbuWOLXqN2WNDXIsmhnA5CM5BmfdRsjw=;
        b=R4TIIWrDmrlpWBgMdoXkrJ21MlnPautRkjXFohvs6tAZ6Xo3BCTzpH2lSDFrBnY6g3
         qHrp/sszV+Tvbv4pyfTBnM9Yi5TFs8vhFhylEyn4dmc5cD95Ucs5dIt/9ZtHP64/EofX
         dSjUHQv35ZoEVbDSN/hf7o7Tc3+pEDn4pGhkAbVCxr2ITj/vZGUTbgT+1DcFhP/UQ4hY
         Cdj7GpTGpDd73uYtxcNiM2z4DFtgs5xIebJoJwTU3YpbaEKmztgFMpmEQ7VFIDbSROlP
         Se1SZhJ2L4XS4FqSMf2elHeafpxE/jqmgsgZLSvOMSryBfMjv2HJUVliVssbe+RxU84b
         /w+A==
X-Gm-Message-State: ALKqPwdeXlNw6ZaQQKqJk4ZbNPwOsR4ia2tW/WD15xXM7feMAU+SdBBS
	VQ5cUn0KS9qZ7dg9pP6sWMVNO6DRHa621Mhf9Pp2E1/7QEo=
X-Google-Smtp-Source: AB8JxZrhNJnavj2o6qsM+TTPU7OSOS5mnx+nyhNHyPBVD/h+djXR7hc80KmZ84H4SnAipXM9lHZjHR35oM/CYM5xlac=
X-Received: by 2002:a9d:2013:: with SMTP id n19-v6mr9796603ota.258.1526385816554;
 Tue, 15 May 2018 05:03:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Tue, 15 May 2018 05:03:16
 -0700 (PDT)
In-Reply-To: <87lgcrvemu.fsf@linaro.org>
References: <1524153386-3550-1-git-send-email-abdallah.bouassida@lauterbach.com>
 <87lgcrvemu.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 May 2018 13:03:16 +0100
Message-ID: <CAFEAcA_3Rg-qhLRmg=TtakVtzOffKrdOKU8z=-=cGts4TTC2+A@mail.gmail.com>
Subject: Re: [PATCH v6 0/3] target/arm: Add a dynamic XML-description of the
 cp-registers to GDB
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Abdallah Bouassida <abdallah.bouassida@lauterbach.com>, 
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Khaled Jmal <khaled.jmal@lauterbach.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: hWLKpxHw4Vu9

On 10 May 2018 at 14:12, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
>
> Abdallah Bouassida <abdallah.bouassida@lauterbach.com> writes:
>
>> The previous version:
>> http://patchwork.ozlabs.org/project/qemu-devel/list/?series=3D33714
>>
>> Abdallah Bouassida (3):
>>   target/arm: Add "ARM_CP_NO_GDB" as a new bit field for ARMCPRegInfo
>>     type
>>   target/arm: Add "_S" suffix to the secure version of a sysreg
>>   target/arm: Add the XML dynamic generation
>>
>
> So I got a fixed up gdb and I was testing the reading of the virtual
> counter:
>
> =3D> 0xffffff800854a118 <arch_counter_get_cntvct+16>:     mrs     x0, cnt=
vct_el0
>    0xffffff800854a11c <arch_counter_get_cntvct+20>:     b       0xffffff8=
00854a148 <arch_counter_get_cntvct+64>
>    0xffffff800854a120 <arch_counter_get_cntvct+24>:     adrp    x0, 0xfff=
fff800896a000 <scsi_format_log+3568>
>    0xffffff800854a124 <arch_counter_get_cntvct+28>:     add     x0, x0, #=
0x5a0
>    0xffffff800854a128 <erratum_set_next_event_tval_virt+4294964112>:    m=
rs     x1, tpidr_el1
>
> p/x $x0
>  $6 =3D 0xffffff800854a108
> p/x $cntvct_el0
>  $7 =3D 0x0
> stepi
> 0xffffff800854a11c      160             return arch_timer_reg_read_stable=
(cntvct_el0);
> =3D> 0xffffff800854a11c <arch_counter_get_cntvct+20>:     b       0xfffff=
f800854a148 <arch_counter_get_cntvct+64>
>    0xffffff800854a120 <arch_counter_get_cntvct+24>:     adrp    x0, 0xfff=
fff800896a000 <scsi_format_log+3568>
>    0xffffff800854a124 <arch_counter_get_cntvct+28>:     add     x0, x0, #=
0x5a0
> p/x $x0
>   $8 =3D 0x7a5b32b
> p/x $cntvct_el0
>   $9 =3D 0x0
>
> So I'm wondering why there is a disparity here?

CNTVCT_EL0 isn't in the set of registers we expose to gdb (it's
marked up as ARM_CP_NO_RAW), so I'm not sure why gdb is
giving you any value at all. Does it do that for any
random $no_such_thing strings ? Is CNTVCT_EL0 listed
if you ask gdb to display all registers?

thanks
-- PMM
