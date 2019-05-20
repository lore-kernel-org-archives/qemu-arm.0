Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp252230wrg;
        Mon, 20 May 2019 07:40:24 -0700 (PDT)
X-Received: by 2002:aca:51d5:: with SMTP id f204mr188046oib.78.1558363223903;
        Mon, 20 May 2019 07:40:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558363223; cv=none;
        d=google.com; s=arc-20160816;
        b=FIYfz5ulfamEYHNc7zkKSa/dqNYjt1jt1vIMInRWjT2bXQCZWi1pk9Es/A63PddQks
         qakSBONDI0ynL5cqRshoEOf+4/lniObzQywFZYdw9FkJ8/XqU6UCEXrk66gC9cysI8c6
         JSjIu5602VFX7bZQxZhKwDqWeSpKv78uDqGGXuRFX3dosIBXhxxIVhCxJ2Sb1hK3ymQ9
         DNEveIOta9m5sWW3ln0UJLKKOEk/ZKIWUTKbGpykHNxm4x3wCc5DNRHcTAapgyTlQVcA
         mYyTHRw7WoXuHz9pXM+Ifzj2863kF4LUkaY8kcI1CjZaQ+S1uDOrPquyOiIsa54O3Px/
         wqIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=01IjuQnP+T/Ox6Q/qbRtTUWD8wy88Jd8EHB679M1VfI=;
        b=YRJVkVVSjXN6QW1eFIRMDlblQ82mLw8HHmrI+K6fYjzsQMjxRTc4YR03v7JUdhAHht
         sKKDIhHaOgHCKEpIKUd9a1912VdrB38S/RbaGiay1oFGQT7J2eNdwPI6JZugUZMClXob
         eaLiYrJPzY9tk+pULlCf7OFiIwrxIPLIBQK4PhkJKFr99gVVfIFEBRs1owoWf2uOU0HK
         qIAyxWyefvHp58Mg43rfZWQgDHfa/kqv4ID6QQsW8ZmSie0KIP1BQHf03wQFuX2p2PxC
         zL21NUqn/9Ffvg84qAQDCYOow3W7HGCa0B0wZNd4vp/b5FBOJOwKPs+ppUDc85oo4+kl
         RjWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q8mp543I;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id p124sor7305603oia.101.2019.05.20.07.40.23
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 20 May 2019 07:40:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Q8mp543I;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=01IjuQnP+T/Ox6Q/qbRtTUWD8wy88Jd8EHB679M1VfI=;
        b=Q8mp543IqMKZr2UqYl62Das/T5KMTQfRNWDJIDqwwb+nXLjGtoahLWZuAoMoPK7ztA
         XZvaXNUTHJ7wPxsVwA/QhrX0gEcBLfn7C6oDfdhZ8H6FCLDrToWI0jlXqyiS+7thjBid
         hNKMbD/ZE7+29TrVoYpvEb/lZkl7Lh2zlOhvCn0QDY/+vrlW6vjh8p4TBqrKrHQjPfAx
         xr8FjBGL1J5DAPYrEC38tqJEQzT/rGc/qStkjvXnY7l8NnRz4fgOrPmHndhUivN0pU4S
         D9V7ifvQcQFCDtWQoBARmRfyb/a2y789n+qRImnpii/IODiO+6xiC/nkj9fUbT2i0/EO
         CNCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=01IjuQnP+T/Ox6Q/qbRtTUWD8wy88Jd8EHB679M1VfI=;
        b=mW0rIDHm5BR3TRGve6+l8fzmx9m43qw86hcFzIylyUl8WVLEPam0VeyYpjezZ2+Gtf
         DzNfqoZFbSbdu1gyF6+zAA+0NHaNN+XO5ilN2HEzGSKYwqFu8zTeS6mqca75r3UohFXd
         hEWKOJmVSKQW/dHAKWJI8nUfglBaaeLG6PyQMXeWIzxfn1wghsLN5QPODzUIna9oUVdE
         0/ojqt9M9e0rKfd4DFiw5YJb/CSE1PxF/jua4fC+Yww0H8ch+NBuEBOd36ni5BkCxu9N
         S3aJYbp0jURWWGZ4yCBUb+xUVgLHXJhJ91GAPkIZNE4J+ebupAWJKgtdaqez9SAfAG58
         pRdw==
X-Gm-Message-State: APjAAAWJXI4lQUsucLRfmeVI8sYVKe/tSytLsFCYo+xBNSlUrgOnT2bD
	J51XkujRCBSHmng+nAi4KVR8mpD1F2qXmdEZW5hrt1e0
X-Google-Smtp-Source: APXvYqzl9zZYtlfeZIQHk9f82mUScdmx903y4HLG1DVyf7R7WBQtFo6tWVhjLejPCMxywbpPKNuH/6hG5o7NNmwa1vo=
X-Received: by 2002:aca:b1c1:: with SMTP id a184mr24595988oif.98.1558363223460;
 Mon, 20 May 2019 07:40:23 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1553510737.git.damien.hedde@greensocs.com>
 <CAFEAcA-84KBmZhRqugQzmEkWVcFBuSAdLtp_HGjRxLeVj1SLXA@mail.gmail.com> <dac12db2-9583-4a30-2188-e5b101e13ecf@greensocs.com>
In-Reply-To: <dac12db2-9583-4a30-2188-e5b101e13ecf@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 May 2019 15:40:12 +0100
Message-ID: <CAFEAcA-rBZRRV9GtUvD5qoYA5Fos_LwSq0cHBgRqtu-G6uEWGA@mail.gmail.com>
Subject: Re: [RFC 00/17] multi-phase reset mechanism
To: Damien Hedde <damien.hedde@greensocs.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Mark Burton <mark.burton@greensocs.com>, 
	Luc Michel <luc.michel@greensocs.com>, Edgar Iglesias <edgar.iglesias@xilinx.com>, 
	qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	=?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	Alistair Francis <alistair.francis@wdc.com>, =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: BuasrTUeJznI

On Mon, 20 May 2019 at 15:32, Damien Hedde <damien.hedde@greensocs.com> wrote:
>
> Hi,
>
> On 5/16/19 2:41 PM, Peter Maydell wrote:
> > Handling migration of the bus base class reset count is a little
> >  awkward -- we'll need to put it in a vmstate subsection which
> >  is part of the vmstate of the device which owns the bus.
> >  (I talked to David Gilbert on IRC about this and have some
> >  possibilities for how to do it, but will postpone writing them
> >  out until we've decided whether we like the APIs.)
>
> If:
>   1. we say we cannot use a Bus as holdable reset entry point (we can
> reset it but not (de)assert_reset it without passing by its parent Device)
>   2. if there is no additional reset dedicated state (right now a reset
> on a bus mostly propagates it to sub-devices)
> Then we have no state migration needed for buses and we can probably
> find a way to use the parent Device's reset_count.

Yeah, I thought about this, but I decided I didn't like having
"there's a Resettable interface but you have to know that
some implementations are special and it's not possible to
do the same things with them you can with some others".
Implementing migration of the child bus reset state as part of
the parent device's vmstate is a bit tedious but not impossible.
(Basically in the parent device's pre-save function you have
to create a temporary array, populate it by walking the list
of child buses and looking at their reset flags, then migrate
the contents of the array, and in post-load you do "walk child
buses and fill in the reset flags from the array". There's a
VMSTATE_WITH_TMP macro that can apparently assist with this.)

> This is somewhat related to the API TRANSITION part below but I was
> wondering if I should add some kind of flag in the interface class to
> indicate the support of "migration-during-reset" functionality. It could
> be used to at least warn when trying to hold the reset state in such an
> class.
> This flag will default to false and one would have to set it when
> implementing the functionality for a given object class (like I did with
> the cadence_uart device).

I think that migration-during-reset should Just Work, without
necessarily needing any specific changes for a device.
I'm not sure a warning that only prints when the guest does
something to cause device-reset is going to be very helpful:
what would be the thing that the warning would tell us we needed
to do?

thanks
-- PMM
