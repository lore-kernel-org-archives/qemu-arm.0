Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp2590408lfc;
        Fri, 13 Mar 2020 12:45:59 -0700 (PDT)
X-Received: by 2002:a67:dc6:: with SMTP id 189mr10541860vsn.214.1584128758965;
        Fri, 13 Mar 2020 12:45:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584128758; cv=none;
        d=google.com; s=arc-20160816;
        b=jiKKxzh81yxyCPGWfwH6HaFhAIPaoq9Epo89MWuJ4V7LHrDq9uBpy7/35stmmyhvFr
         By8bzPwU2KZp5PfLXM0vRHlP8TjhosZntH9vn1JBdyFkrYtJirOv0rjC67uXY632jHzK
         JnTaZ8HaISu7Mw7CnnDPUIK76HQIIelkkoj/wcx1lqjRCF7JkLcLrRnZlwMNgQ0/apMe
         pcLCrLnlwUAHweyDpMM3TlL7KsXJiFojWVWB/NmeS7ehQn4+eQawGa4RyOSvvUkM23dB
         H7UxUEW2LokE7Lr4ipyDuIswGuKDW5/0OMItnL2pmKkBKrItPW4QFFoGyUDnnMOCkbbc
         qV3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZO4PnrTuUVTtq2EjFzz8ZaUx+/viaySWIkdpaUeET6I=;
        b=Q/YCc4NxZ9651l8c2VmPc+/lW6X1HctNYQko41kVXmOH8fZi//RJ3IxUzY/Yj2Rjjl
         DYYy5OfHum1aH2jD1wzU151+S/wLnjXVww9zFHhs7ZRZsKLU4lQ9AIOexFn2rBf2OQFN
         lKAzbUNT26QtEShbWiPL/w2/ti19wRO8i31wmCJN9hZWGWtldQvY3M4DN94uIN+5kEO6
         M/qsRa05Fm/ojNQAxt3bO7lF4v3sTqIOoJnkuqghyRjd31GG2E9mGNHfI5eiLucNgxTV
         s0f3gh1FugUPihcGkaOCMtW3+fXZPqtJ9lVgSAAsaA7mfgJMwYkLbO546Hu2pe4P/zzJ
         l08A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="C/WQE8vp";
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <alistair23@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 186sor6138751vsp.120.2020.03.13.12.45.58
        (Google Transport Security);
        Fri, 13 Mar 2020 12:45:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="C/WQE8vp";
       spf=pass (google.com: domain of alistair23@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=alistair23@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=ZO4PnrTuUVTtq2EjFzz8ZaUx+/viaySWIkdpaUeET6I=;
        b=C/WQE8vp+38vC6GqUaLBXwNFSHBv4kASjk4GODqJrHjq5ns2SZTxLbc30q0pzNno7N
         scotDPBn93nMOVp1I+IePhSq4GSnKqeduKcCYr3oxwcTy4vomJngnZcKce0eP/hRiqLw
         ecmQQrnyFNOV1TAX2/fFnAeqNtKEqDt7AToWGAfUDfVIEb5zD/1mlESpYLRT3dlaRYTK
         no5kZP9zIUn0sdCfuttNOklmvB1K03qBZZbGAJBnnTdvJd9nL9RSH9mnhwOot167dzYI
         BdI/c5uXhUDDWU6aN9b4oL4KbH29tkVKhWudWpk3XW9S3F1TBFem+gF72yB6eVslOQKe
         H29w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ZO4PnrTuUVTtq2EjFzz8ZaUx+/viaySWIkdpaUeET6I=;
        b=sq97EBFroL+seswTU7pl03VIanpNsk/wKDqcZU7nNGT7XdgYP047p8zmjUD8kNEeTW
         DB/MgBBdSXZZEjloom1rLCULesV6RUf/pGcJrq5BIvWu3OwxcNr20oWCxB8BKsIlGJ7N
         OY6atMVPtbrq1kOlnIkCBIMsriUoyIxqbpENnV9TpVj3WDb6x9j/cMy2NtiFnEor7IKU
         KxS4XeUQoHJq9csG8ffuqJu8CTttHAorcMWIXMWkSCCF3Fxv1bYeMk2xPNLAzHv+2mQY
         h+75YztFnQp92U+J5GwptX0dkZHZc/TE8AfZNOMSG9W/coThjd2qk5QfUzGJeiU4y1AO
         Zzow==
X-Gm-Message-State: ANhLgQ3jKSX1vPTKZzp+EoVXysUg3mUNkopYq6UqCcO9+5gNzwYxqmdo
	Hu1dZScY2EHXVqhGczhGQnvpnRQUbJjUgDHvdJo=
X-Google-Smtp-Source: ADFU+vviP32q1fsE+cEj9VjsOLyUAIDfTrT73l7cuSbTHaLIrRUIjbliGdn3ettHl6SVIvDQanhSdM/grYNl4wbXXMM=
X-Received: by 2002:a05:6102:3c2:: with SMTP id n2mr10349575vsq.172.1584128758599;
 Fri, 13 Mar 2020 12:45:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200313183652.10258-1-philmd@redhat.com> <20200313183652.10258-4-philmd@redhat.com>
In-Reply-To: <20200313183652.10258-4-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 13 Mar 2020 12:45:32 -0700
Message-ID: <CAKmqyKO+kEGj4-=hb+N3PRLkxBUxRpToGCzx1Mo61jtYV=2h+A@mail.gmail.com>
Subject: Re: [PATCH 03/14] tests/Makefile: Only display TCG-related tests when
 TCG is available
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>, Peter Maydell <peter.maydell@linaro.org>, 
	"open list:RISC-V" <qemu-riscv@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>, 
	Sagar Karandikar <sagark@eecs.berkeley.edu>, David Hildenbrand <david@redhat.com>, 
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, Cornelia Huck <cohuck@redhat.com>, 
	Laurent Vivier <laurent@vivier.eu>, qemu-s390x <qemu-s390x@nongnu.org>, 
	qemu-arm <qemu-arm@nongnu.org>, "open list:New World" <qemu-ppc@nongnu.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Alistair Francis <Alistair.Francis@wdc.com>, 
	David Gibson <david@gibson.dropbear.id.au>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Richard Henderson <rth@twiddle.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: ZfSHEafoxYhE

On Fri, Mar 13, 2020 at 11:39 AM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  tests/Makefile.include | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/tests/Makefile.include b/tests/Makefile.include
> index 67e8fcddda..99db5eb3e0 100644
> --- a/tests/Makefile.include
> +++ b/tests/Makefile.include
> @@ -12,8 +12,10 @@ check-help:
>         @echo " $(MAKE) check-speed          Run qobject speed tests"
>         @echo " $(MAKE) check-qapi-schema    Run QAPI schema tests"
>         @echo " $(MAKE) check-block          Run block tests"
> +ifeq ($(CONFIG_TCG),y)
>         @echo " $(MAKE) check-tcg            Run TCG tests"
>         @echo " $(MAKE) check-softfloat      Run FPU emulation tests"
> +endif
>         @echo " $(MAKE) check-acceptance     Run all acceptance (function=
al) tests"
>         @echo
>         @echo " $(MAKE) check-report.tap     Generates an aggregated TAP =
test report"
> --
> 2.21.1
>
>
