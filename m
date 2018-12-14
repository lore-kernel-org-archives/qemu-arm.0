Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2059063wrt;
        Fri, 14 Dec 2018 05:34:28 -0800 (PST)
X-Received: by 2002:aca:2108:: with SMTP id 8mr1791941oiz.171.1544794467988;
        Fri, 14 Dec 2018 05:34:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544794467; cv=none;
        d=google.com; s=arc-20160816;
        b=GM97o7WN8SS6FKz4iEmSwZjQGDPv8jEF2os5ai54c8lqfvFGXWhHSR8+VQAvoMkHt0
         VsdfOV1c8/nJEihT/e9DC/vJnAJ87A+WORyIIpTB6PHnlqsRGQ05wYfezarai7/YPwYq
         mk5bQz67X+ekN6RBYuNiY5n2bCKkh5HEkGA3JBdWeWmtskTAwMAavPQ31q9DjTF83KFW
         TgQUMz/JsPtAdXdMUVySTSdVI1U1RBwEMDftay052+PGOr0zdVv3mtIx7gYw7zpxiiRS
         JLyzTHQ1c/n6cI7B4ycgmpULcRDTnjVGCJ0GNKlrnOzkeEmwVp0pFZRgz3AJ4MXJtSty
         tV6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wMl0kA6rwdhQhrDKJjmZpjlMZgDi22GB6VVzOG5o2p4=;
        b=pKs1f/92B7+Z6GkU53lHn77Hsxh03wlFvl1tLOuiPj/BeN2qYC1I+rPbs04sHJ7NkC
         3GeeWcGY5uBtXkpZRW1TcGZprMW0DD7Ai5LH2Xk8Ob6Z//hYNdYeCfBHsk+G1dchulgw
         DfsDCpzrtC5bfl9e5MCr2uYheQeemUbizICg3fZ1DLIaF5aBpKFPMeyOy02s6NrjKSaF
         qL+WBY+VpUG4b3PWcvTuvZ8IPAbIY4Se9ZeH468Pzv13QkAH3x6d+7OOWv61A7qLnj1Y
         FwK98Jw11FL+RP5kZ/sjJ/O+tuFJDg3sm0PH4Vvpw+DgqLTKOpZvIWXdzvxr9VlCLhYl
         mzbQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LdAR+QyQ;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id a96sor2957351otb.28.2018.12.14.05.34.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 14 Dec 2018 05:34:27 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LdAR+QyQ;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wMl0kA6rwdhQhrDKJjmZpjlMZgDi22GB6VVzOG5o2p4=;
        b=LdAR+QyQt3C8eOFT1jOqRak7OWHNc82PVv2JeLWLlsPJYFO/LDXG6jRCRw+hAQp8TK
         Azf1GsFbtqwIcX80U3I/2IziqV95lz3ghpWI/KAsdFHr4HGXsvmJ8UIxQnN/G0PXLzBc
         QKLsliyWE8q9tC9OYoqGa+7I/iHYSF4GEV+hE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wMl0kA6rwdhQhrDKJjmZpjlMZgDi22GB6VVzOG5o2p4=;
        b=W92HaF8eIteY3j04oHgnd7dnahqQ8CfR8TuLxRdIcNfaKtJtKJFLU+S4/Pu3whovk8
         5UiIaTV4PvrMLRb9+ldMzZ+6te8f4VBk0MWA4n66RJooQ+f4Hn2y+1FR1MgG6Sj2NwQ8
         Z02I2eBglQ2RqkeocQ4mYumHdY4rcWHrCYa9cIEjf2ib04hZP/yWHbSCa+OQKsv/EYzx
         rH5TaTypLvYQO92RO7/4STO8Mnvz4sGO2r+5DcvHQdrHNbPfQF/684+ANw0/NgDuHJAG
         GM9cO2ym+IE5hsC2Z26UZKP14U/0dLTRHGo9R77L9/C/ZREKxCdfv8PQeC+kqNedxq63
         JDFQ==
X-Gm-Message-State: AA+aEWbbu8ppBI29GQFWHOgLxAMnD4bTS+3yb/u/dHWiEmcbGpA4sttE
	CJ/3gAJefFsS0XlmScJ3w+FfGw7NrbtIvMOQ/b4/czD2
X-Google-Smtp-Source: AFSGD/UsDqQPhmdKSLa4SzvUguo5dYIVWV1L0T843FRKfiI323uiAHa7x780vz8UvpJzB2cCZmpuqhB+udlOSKhlAT8=
X-Received: by 2002:a9d:5427:: with SMTP id j39mr1885807oth.363.1544794467476;
 Fri, 14 Dec 2018 05:34:27 -0800 (PST)
MIME-Version: 1.0
References: <20181213223737.11793-1-pbonzini@redhat.com> <20181213223737.11793-3-pbonzini@redhat.com>
In-Reply-To: <20181213223737.11793-3-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 14 Dec 2018 13:34:14 +0000
Message-ID: <CAFEAcA_aq2LftJbNPmQREghDhFWqFhM7tgRoK33uRbKbd-oeVQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] avoid TABs in files that only contain a few
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>, 
	Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>, Stefan Weil <sw@weilnetz.de>, 
	viktor.prutyanov@phystech.edu, Richard Henderson <rth@twiddle.net>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	Amit Shah <amit@kernel.org>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Stefano Stabellini <sstabellini@kernel.org>, Anthony PERARD <anthony.perard@citrix.com>, 
	andrzej zaborowski <balrogg@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>, 
	Eduardo Habkost <ehabkost@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
	John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>, 
	Aleksandar Markovic <amarkovic@wavecomp.com>, Stefan Markovic <smarkovic@wavecomp.com>, 
	Jason Wang <jasowang@redhat.com>, =?UTF-8?B?SmnFmcOtIFDDrXJrbw==?= <jiri@resnulli.us>, 
	Dmitry Fleytman <dmitry.fleytman@gmail.com>, David Gibson <david@gibson.dropbear.id.au>, 
	=?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>, 
	Fam Zheng <famz@redhat.com>, Magnus Damm <magnus.damm@gmail.com>, 
	Igor Mammedov <imammedo@redhat.com>, Riku Voipio <riku.voipio@iki.fi>, 
	Laurent Vivier <laurent@vivier.eu>, Eric Blake <eblake@redhat.com>, Thomas Huth <thuth@redhat.com>, 
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	"Daniel P. Berrange" <berrange@redhat.com>, Qemu-block <qemu-block@nongnu.org>, 
	qemu-arm <qemu-arm@nongnu.org>, "open list:X86" <xen-devel@lists.xenproject.org>, 
	qemu-ppc <qemu-ppc@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: iFsNbQtxXab3

On Thu, 13 Dec 2018 at 22:38, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> Most files that have TABs only contain a handful of them.  Change
> them to spaces so that we don't confuse people.
>
> disas, standard-headers, linux-headers and libdecnumber are imported
> from other projects and probably should be exempted from the check.
> Outside those, after this patch the following files still contain both
> 8-space and TAB sequences at the beginning of the line.  Many of them
> have a majority of TABs, or were initially committed with all tabs.
>

> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 17f1b49d11..ad6fa8e3c6 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1854,7 +1854,7 @@ static const TypeInfo virt_machine_info = {
>      .instance_size = sizeof(VirtMachineState),
>      .class_size    = sizeof(VirtMachineClass),
>      .class_init    = virt_machine_class_init,
> -       .instance_init = virt_instance_init,
> +        .instance_init = virt_instance_init,
>      .interfaces = (InterfaceInfo[]) {
>           { TYPE_HOTPLUG_HANDLER },
>           { }

This one gets the alignment wrong -- the person who wrote
that must have had tabs set to 4-space. Eduardo has sent a
patch which fixes it up ("virt: Fix broken indentation"),
which I've queued, so this is just a heads-up about the
resulting trivial conflict.

thanks
-- PMM
