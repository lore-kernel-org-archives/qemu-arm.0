Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp149041lfq;
        Tue, 6 Oct 2020 23:50:29 -0700 (PDT)
X-Received: by 2002:a6b:7717:: with SMTP id n23mr1233961iom.151.1602053429820;
        Tue, 06 Oct 2020 23:50:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1602053429; cv=none;
        d=google.com; s=arc-20160816;
        b=g6y25VMGcDgkHIleOgK8oO1hkBm88vM8cZSzlGYbNdJR995rAEZOLGEEHd2VwhRYz3
         fdQiB7LFTh0Fe61VVuObVa+TDsbzCoiCDSGTlwGmwyJAzll5K7aQQkBtTwOJaC9KDZhp
         mtuI5wHtpuuLLUP5v70wAGX4NBH8pjYfHU5f+7olDt28LWs98RgNNbqdj7+BqhNTMXxi
         4uYfSWqAjKcXQhMEBzm6IT0/t7kM97JQnkNr4VDKsPyZCIM5g3JvxxYE0idOUzScrH1t
         YKyX94FnndPau0zTWwMpSQTejpRsGyW6fnm8fLadiU3fkuVDy9e1OCTHX2xzZ4wDe9Yk
         gveA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=K65nqW5b51X5LzxkVyAKNheO+CdmApsdfUMTcPTC+r4=;
        b=xwT8ZA2pVrpvYg3P9EDemchQeMvmbT4XqUXrQNPembI0aMJWBS9i9aKsKxsM+qCxEf
         0exN8o+KLVU8pV2mYK52N2cauuzYeHZSryudAkV/CMbB9m7Yz/JbORNUQc5NnpY2Khup
         rNZvVd2sXqt8+0u0VeYlPKOoaJmvUuJ2VHRm5hkX/bIHZZ3j4AhhZR4l8PYc/gr4OKZq
         fEbl8ZaVutcJT8VEsgkvEQH2dMG7aqsitnEJY0OVPsFfg6W9XLa4OXd2rZFGU8I3bjMM
         EjNZqf2+EOG+M8NYgI3k/BBGgE6UzHghktxVYmiSNbqx4XRJ7uV/YHVPO3fJ/jcny/5P
         rctA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="sdHfuh/3";
       spf=pass (google.com: domain of pauldzim@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=pauldzim@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <pauldzim@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id n7sor558136ilq.132.2020.10.06.23.50.29
        (Google Transport Security);
        Tue, 06 Oct 2020 23:50:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of pauldzim@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="sdHfuh/3";
       spf=pass (google.com: domain of pauldzim@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=pauldzim@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=K65nqW5b51X5LzxkVyAKNheO+CdmApsdfUMTcPTC+r4=;
        b=sdHfuh/3s6eK0ysaw8qKRu0w8+DjnoRyoM3/Vd6oKtmRARV33Hu47y7rq2RBlVOwGv
         xAngM+ALkkDZrilDmlR3yJsy9duNFb2b7r836y+Nk7LBGs0+x1hpTrYBc5TqVi4Le58n
         UIMllrHkdAr3IidXNVqhxGWoxxrQ/LS9otEHJ2IlR7TlneObln5uEUpo6zTtW0xYNkV4
         BQW2alOG4pAN1S4J/gMBxblx67I0xTtm5KTFpH6h3PAkgFtGOurlQUTnYOX2wQSECzXf
         yRlmrcUeRqaQz130CID6l1xQlHQr1AZZ7h5CAcl+XR862udeNPrT4LZJ1me8mjUenKPb
         s9gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=K65nqW5b51X5LzxkVyAKNheO+CdmApsdfUMTcPTC+r4=;
        b=IKm0N0nad7Z73fUD/dOLgtsngS9BFJE8Wm9WUKgGtBEFxKTKdshCp2EVFc+CD/AB2e
         dG1sHMOTQ5iv2ykNBQXf9/HGWGrszOu+aZHzZ8RigRU+4NyvqNSyqGzj6r4ZTZMCCnK/
         KYmhHRcx2eJf/tQpNRrMugThYQNmC5xnuWu5a9OKZhm2nasDp7fO7f/VDWqCoYEBg7/m
         WIqUaanSsvb5bK59VTsfB2RlgeVsDSgy8NehWVbLN653av1NjLZ8lbAXps5yVfFztcln
         o8dqFprXZQUfYXcTazpe1BpI1WQXO5LAqe9x1QNqLz3xa9GjbONvgt4C4ZRosKjh8Nyq
         vncA==
X-Gm-Message-State: AOAM531hLVjW5gPbCuzNO+3PUX9y45OVOugUHUah5hBnUCvE9fzPwIM5
	fCi8xb6aAl4I+wEyQwaahtOQJqtXoPmVIq7+T6td9tuah70=
X-Google-Smtp-Source: ABdhPJw8CkUJFKjIe9mJWcgBgxiXlMYlOBGCLBHQttkveUP1AzZQFxtLeKPd+Yf96Zm8PxGr+JWpZ+UlbQ1dfQwohCQ=
X-Received: by 2002:a92:907:: with SMTP id y7mr1549294ilg.276.1602053428977;
 Tue, 06 Oct 2020 23:50:28 -0700 (PDT)
MIME-Version: 1.0
References: <47dbcad4-3121-b1c3-06fa-abec7c353fb6@gmail.com>
 <87sgatanti.fsf@linaro.org> <CAFEAcA_ZMLV3DZ_R_SHvPLdEf=i-xpspD5itBmfYeqyMhgtLWQ@mail.gmail.com>
 <875z7p3t9e.fsf@linaro.org> <e43be86d-1847-199f-4cbd-2e3bd124d70a@gmail.com>
 <CADBGO794+ZPD=B=dFuA7SC96g3GDJXF1A8j=VP6MeiSw1Sf4oQ@mail.gmail.com>
 <d8d79b4c-aeb4-4f07-7110-91d8d1afd701@gmail.com> <87362r3cbt.fsf@linaro.org> <61c49583-c548-a8b2-7106-59011196f430@gmail.com>
In-Reply-To: <61c49583-c548-a8b2-7106-59011196f430@gmail.com>
From: Paul Zimmerman <pauldzim@gmail.com>
Date: Tue, 6 Oct 2020 23:50:01 -0700
Message-ID: <CADBGO7-BaTH3MBZa6Dbv2+uxKNbv3ztwQ=iu_FCgrcrKBUzCPw@mail.gmail.com>
Subject: Re: Emulate Rpi with QEMU fails
To: Thomas <74cmonty@gmail.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, Andrew Baumann <Andrew.Baumann@microsoft.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: NUV8f0rE27Bn

On Tue, Oct 6, 2020 at 11:28 PM Thomas <74cmonty@gmail.com> wrote:
>
> Hello!
>
> Many thanks for your support.
>
> I managed to get emulated RPi starting.
>
> However there's one question I want to ask:
> How can I accelerate the startup sequence?
> I mean booting the emulated RPi takes more than 3 minutes.
>
> Regards
> Thomas

Get a faster computer? ;)

On my Intel i7 desktop it takes about 40 seconds to boot to the login:
prompt on the serial console, and about 1 min 8 seconds before the
GUI is up. On my 5 year old laptop it's probably twice that. I don't know
of any way to make it go faster.

- Paul

>
> Am 06.10.20 um 11:58 schrieb Alex Benn=C3=A9e:
> > Thomas Schneider <74cmonty@gmail.com> writes:
> >
> >> Hello Paul,
> >>
> >> many thanks for sharing this info.
> >>
> >> Can you confirm that the emulated RPi with your command will use
> >> "internal QEMU" network, means the client cannot be accessed from any
> >> other device in LAN?
> > The support for user-mode and TAP networking is orthogonal to the
> > emulated device. However if you only want a few ports it's quite easy t=
o
> > use port forwarding, e.g:
> >
> >   -netdev user,id=3Dunet,hostfwd=3Dtcp::2222-:22
> >
> > which forwards 2222 to port 22 on the device. I have an alias in
> > .ssh/config for accessing my QEMU devices.
> >
> >> If yes, what is required to setup a TAP connected to host's network
> >> bridge?
> > I'll defer to others for this but generally when I want proper bridged
> > networking for a VM I use virt-manager/libvirt to configure it because
> > it can be quite fiddly to do by hand.
> >
>
