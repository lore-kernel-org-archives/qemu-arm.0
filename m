Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp4622915wrm;
        Mon, 21 Oct 2019 07:04:23 -0700 (PDT)
X-Received: by 2002:aca:4794:: with SMTP id u142mr19836828oia.159.1571666663350;
        Mon, 21 Oct 2019 07:04:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571666663; cv=none;
        d=google.com; s=arc-20160816;
        b=kNR9s7V8o3s1Q9kQ4I0jyYHMgJGLVm1fqh/aq5xj3ZJYXpXiDVjUmI+p67lGRXlOLV
         b59N5+nv1Vjh2qxBwkfONLjFSZD325UDvrl+CUeHVwv1SaX5zhQL232cvO2NUsmgv3Md
         5MgCAkOccjz/mBXLionLkHV42QmCMKmRhp4Dv4uo9PaH2XUgOpwYGg9NPofA7sl/Rs30
         uiTmxeVxNCCO3EvfYIx69y366RPzN6hTqXcKvzp+qOpwbw2zKWmoKruLwAT4BUqT95pj
         r1kUo425FPaGxMCkRA0yo5KkEruZo7Yb2jkBiQX172IyOee0iYAAznjViaFjj17nrz7B
         BL2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qqxI4t9USoPXl/JeHuyCe4X2D/XmhhmC7h27Axw+udQ=;
        b=s8GGtsoIgkSofHELRZno+H4T117I63yYIYt0d7lberwN4Oz6eHk9/24Ksm2dx0Vyxe
         9UXrOw6CqC2EeDxY/5o73lS7dlOAjqTuIezmqSEOvNCMWRz5UjGxKlMhme3r3uKbeHkv
         CNPqE3ibYhELJk0KlMOntmd08dyItYx3lZPgxhvXnKa6GmcDnzSHdg7dHLm+A8tcEit0
         B8DGzuUv3OYFt/hSXTQBMHVJdAP1Uv5cvms4I1SAxV27ZXQynZJNAG44AeosdmOUx7b/
         xegUh1uPGczr9MyEP01P/6iHth3xZfFkKSvO/v35lfjcrLCTuMPKLinYlmFe9JUQfRR8
         tZxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=o23sY8aJ;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 59sor7328069otx.142.2019.10.21.07.04.23
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 21 Oct 2019 07:04:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=o23sY8aJ;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=qqxI4t9USoPXl/JeHuyCe4X2D/XmhhmC7h27Axw+udQ=;
        b=o23sY8aJNwQHkKw0xxxs+ejPMiYWNoiKAiNdVrvd+aNE0cw1SVjrEncfNwtbM0yQ2s
         2L78NOBuOrgoqBdzvgjiHtetQU6YBH0eXDA1VJVVktzgG9lHv2Q7Cb44boNbrKg8ZBq/
         4fDJyMgfmKeZO0GyUq8hjXe3D74w5QLxsTCFWkpl0+jNFzp/L+AqFTfAK19UmeHpt3ez
         ylRKIPHiMOX1Zqi2qjbb7TyrmON+9UHWhcH4UKSiqQa/W/K4rf/ibMa3hQKLrj8LfO5P
         Ja7xWg4yMeuJc2cLeo+nQcAQFEVrYL9EoYpXjsrpIN5zKB5rPAScXLGz3/4GTaO8K8kH
         O57w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=qqxI4t9USoPXl/JeHuyCe4X2D/XmhhmC7h27Axw+udQ=;
        b=KLO0xdDsdt3Z1z/j0EFWk4DsE1bafe4HC3rYngtUsvCxiTigZwtsGSGE2C2zYY0V6e
         YjaSoSHuMjhWMDhgYea9GKUykPMMvSn5u/AdoypmKREbcxrkRACmFcuBH0Qemem2KtNu
         Z88Ce0rmHRasO3k2SxlI/JgdZkyS1r8hluDyw+hz1a3b1Z25SzPXsnzxW7hqmcWSIVXi
         AulXIk4oipl5BnSMEbzUsyIdapm0JOjP4fzo2JF4Cccpy//4aWatRuNZF7EC0G+HWE8o
         XG2XG3qOfHJpLCK5FnV+bZDdXAzno6X+aptydgOtxiJktCiR4XOZb5twhr/BbkVTiEeJ
         NUYA==
X-Gm-Message-State: APjAAAUNzkiL0CIY9mPtGpuk34RNmijl5eGoqtsCwJK66+Up9aXgGOuO
	rLuzxgZoS6TWk5TSVnJDSGRmtVDOKwdYWQbnHzmu5LwO
X-Google-Smtp-Source: APXvYqyNOCrySGod8QA3BC5EBBZqk9MeXy2YqV0GnibpdtzqRWbeStOOOVeQ9r/mLSqJJyRqgi4C/DnC+TWWQH3ENdU=
X-Received: by 2002:a9d:398a:: with SMTP id y10mr17897600otb.97.1571666662819;
 Mon, 21 Oct 2019 07:04:22 -0700 (PDT)
MIME-Version: 1.0
References: <20190910193408.28917-1-alex.bennee@linaro.org>
 <20190910193408.28917-3-alex.bennee@linaro.org> <5be164f7-6a8a-07b8-8d16-18300638f9b5@vivier.eu>
In-Reply-To: <5be164f7-6a8a-07b8-8d16-18300638f9b5@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Oct 2019 15:04:11 +0100
Message-ID: <CAFEAcA9oCNT9t_WT8uMzit12J7=vDt4+W6UTqAbZZd3J8UytGg@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v1 2/4] elf: move elf.h to elf/elf.h and
 split out types
To: Laurent Vivier <laurent@vivier.eu>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Chris Wulff <crwulff@gmail.com>, Sagar Karandikar <sagark@eecs.berkeley.edu>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Anthony Green <green@moxielogic.com>, 
	Palmer Dabbelt <palmer@sifive.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
	QEMU Developers <qemu-devel@nongnu.org>, Max Filippov <jcmvbkbc@gmail.com>, 
	KONRAD Frederic <frederic.konrad@adacore.com>, Alistair Francis <Alistair.Francis@wdc.com>, 
	Marek Vasut <marex@denx.de>, Jia Liu <proljc@gmail.com>, 
	Aleksandar Rikalo <arikalo@wavecomp.com>, Helge Deller <deller@gmx.de>, 
	David Hildenbrand <david@redhat.com>, Halil Pasic <pasic@linux.ibm.com>, 
	Christian Borntraeger <borntraeger@de.ibm.com>, =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	Richard Henderson <rth@twiddle.net>, Artyom Tarasenko <atar4qemu@gmail.com>, 
	Eduardo Habkost <ehabkost@redhat.com>, Riku Voipio <riku.voipio@iki.fi>, 
	Fabien Chouteau <chouteau@adacore.com>, "open list:S390-ccw boot" <qemu-s390x@nongnu.org>, 
	qemu-arm <qemu-arm@nongnu.org>, Stafford Horne <shorne@gmail.com>, 
	David Gibson <david@gibson.dropbear.id.au>, 
	"open list:RISC-V TCG CPUs" <qemu-riscv@nongnu.org>, Viktor Prutyanov <viktor.prutyanov@phystech.edu>, 
	Thomas Huth <huth@tuxfamily.org>, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, 
	Cornelia Huck <cohuck@redhat.com>, Michael Walle <michael@walle.cc>, 
	"open list:PReP" <qemu-ppc@nongnu.org>, Aleksandar Markovic <amarkovic@wavecomp.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: MyO7hrFKOF60

On Mon, 21 Oct 2019 at 14:54, Laurent Vivier <laurent@vivier.eu> wrote:
>
> Le 10/09/2019 =C3=A0 21:34, Alex Benn=C3=A9e a =C3=A9crit :
> > Most of the users of elf.h just want the standard Elf definitions. The
> > couple that want more than that want an expansion based on ELF_CLASS
> > which can be used for size agnostic code. The later is moved into
> > elf/elf-types.inc.h to make it clearer what it is for. While doing
> > that I also removed the whitespace damage.
> >

> The patch looks good, but why did you call the file "elf-types.inc.h"
> and not "elf-types.h"?

This is our usual convention for files (well, that or .inc.c)
which get included multiple times with different preprocessor
defines to specify how they behave, i.e. which aren't standard
"simple header with multiple-inclusion protection guards".

thanks
-- PMM
