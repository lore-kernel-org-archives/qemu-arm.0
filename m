Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id t12sm4222993wrr.65.2018.12.14.06.02.05
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 14 Dec 2018 06:02:05 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id D8EC63E025C;
	Fri, 14 Dec 2018 14:02:04 +0000 (GMT)
References: <20181213223737.11793-1-pbonzini@redhat.com> <20181213223737.11793-3-pbonzini@redhat.com>
User-agent: mu4e 1.1.0; emacs 26.1.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf
 <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>, Stefan Weil
 <sw@weilnetz.de>, Viktor Prutyanov <viktor.prutyanov@phystech.edu>,
 Richard Henderson <rth@twiddle.net>, Peter Maydell
 <peter.maydell@linaro.org>, =?utf-8?Q?Marc-Andr=C3=A9?= Lureau
 <marcandre.lureau@redhat.com>, Amit Shah <amit@kernel.org>, "Michael S.
 Tsirkin" <mst@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Andrzej Zaborowski
 <balrogg@gmail.com>, Gerd Hoffmann <kraxel@redhat.com>, Eduardo Habkost
 <ehabkost@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, John
 Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>, Aleksandar
 Markovic <amarkovic@wavecomp.com>, Stefan Markovic
 <smarkovic@wavecomp.com>, Jason Wang <jasowang@redhat.com>, Jiri Pirko
 <jiri@resnulli.us>, Dmitry Fleytman <dmitry.fleytman@gmail.com>, David
 Gibson <david@gibson.dropbear.id.au>, =?utf-8?Q?Herv=C3=A9?= Poussineau
 <hpoussin@reactos.org>, Fam Zheng <famz@redhat.com>, Magnus Damm
 <magnus.damm@gmail.com>, Igor Mammedov <imammedo@redhat.com>, Riku Voipio
 <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>, Eric Blake
 <eblake@redhat.com>, Thomas Huth <thuth@redhat.com>, "Edgar E. Iglesias"
 <edgar.iglesias@gmail.com>, =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>,
 "open list\:bochs" <qemu-block@nongnu.org>, "open list\:Stellaris"
 <qemu-arm@nongnu.org>, "open list\:X86" <xen-devel@lists.xenproject.org>,
 "open list\:ppc4xx" <qemu-ppc@nongnu.org>
Subject: Re: [PATCH 2/2] avoid TABs in files that only contain a few
In-reply-to: <20181213223737.11793-3-pbonzini@redhat.com>
Date: Fri, 14 Dec 2018 14:02:04 +0000
Message-ID: <87imzw1a1v.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: OiXs3safiD05


Paolo Bonzini <pbonzini@redhat.com> writes:

> Most files that have TABs only contain a handful of them.  Change
> them to spaces so that we don't confuse people.
>
> disas, standard-headers, linux-headers and libdecnumber are imported
> from other projects and probably should be exempted from the check.
> Outside those, after this patch the following files still contain both
> 8-space and TAB sequences at the beginning of the line.  Many of them
> have a majority of TABs, or were initially committed with all tabs.
>

For the following:

<snip>
>     tests/tcg/cris/check_addo.c
>     tests/tcg/cris/check_moveq.c
>     tests/tcg/cris/check_swap.c
>     tests/tcg/multiarch/test-mmap.c

>     tests/tcg/cris/check_abs.c
>     tests/tcg/cris/check_addc.c
>     tests/tcg/cris/check_addcm.c
>     tests/tcg/cris/check_addoq.c
>     tests/tcg/cris/check_bound.c
>     tests/tcg/cris/check_ftag.c
>     tests/tcg/cris/check_int64.c
>     tests/tcg/cris/check_lz.c
>     tests/tcg/cris/check_openpf5.c
>     tests/tcg/cris/check_sigalrm.c
>     tests/tcg/cris/crisutils.h
>     tests/tcg/cris/sys.c
>     tests/tcg/i386/test-i386-ssse3.c
<snip>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>


--
Alex Benn=C3=A9e
