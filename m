Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp3450939wrh;
        Mon, 29 Apr 2019 05:28:29 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxCKnvCkg+YBc/DzfWSsEjPns04RjAsnk3ID6u7nWyAQ55SmJPtjHhgd4N6r2/7LMWi0jXv
X-Received: by 2002:a05:6214:201:: with SMTP id i1mr32751392qvt.235.1556540909321;
        Mon, 29 Apr 2019 05:28:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556540909; cv=none;
        d=google.com; s=arc-20160816;
        b=0zCe94NDdRQCdxrY2YceneLEgX2yuOiEC5tut4UNiDobjNo/E8WgrqyGqnTi67VAS9
         2dHmi0YDubHYjJlrrYTgk+HDeKvWofUXwv9SZW0v7LMWZkGJo78H7NuW4doaKmSYe61v
         2z8p3xEpDHT3YWMJhxeklw3mX/JBdLMPyOuepSef/gawRhLdrBPHcmWEHJNaIhOgqM6D
         DHsA8007sBpC+TFHPdhmx+KG+EIHOfMqAihRb+427mQcXPOD8CKCjnl9h07wX8hzh+Vb
         KPHt5PJ0Qws0MwEolL+xWukHeeecidGKQsLxsCDKpoXkhTubVbiVgBzghqopSfYlCWa+
         w2Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=gbs7z/ZXamDd89ZAslZudoyaBiOwVG5MAMD3+ccNzFo=;
        b=TU4JC2vdlRkLId4HkbmSsGTWUDqLCEVW2gTvEvNT6lo6R3KLa/c3J2RAQzzzf4xlBj
         0F4E/T/DuftUGwWjf+KDck91XYkqdpia+sqTbVjJ7FJDiCEikLTYoCi6ujfmOlB3KaRb
         hzHgRz7a6h/NrTlkN7iXJE+055IXUUImny+1wLvWTY91l1NA9cGQ39utfJppCu9ndLZI
         z6u5OxSRNdD+pmphZJ8Nqj94o1WJfgA2bIfymw3fbB1UbS1cwMV3aCEuT+2yHl0sy4hW
         RNRflY1py4/x3W6WYWvTckV+5qCUDoOZlt9OV1TkFLpe4nJx13VOBTpYvNbkQTPXGvxZ
         kEhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of stefanha@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=stefanha@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <stefanha@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id n66si1069256qkc.251.2019.04.29.05.28.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Apr 2019 05:28:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of stefanha@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of stefanha@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=stefanha@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CD093308339B;
	Mon, 29 Apr 2019 12:28:27 +0000 (UTC)
Received: from localhost (ovpn-117-116.ams2.redhat.com [10.36.117.116])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1D4271001DD9;
	Mon, 29 Apr 2019 12:28:21 +0000 (UTC)
Date: Mon, 29 Apr 2019 08:28:19 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
	Jim Mussared <jim@groklearning.com>,
	Julia Suvorova <jusual@mail.ru>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Steffen Gortz <qemu.ml@steffen-goertz.de>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Thomas Huth <thuth@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] Revert "armv7m: Guard against no -kernel
 argument"
Message-ID: <20190429122819.GB7587@stefanha-x1.localdomain>
References: <20190103144124.18917-1-stefanha@redhat.com>
 <CAFEAcA-B_T9E3ezWFXg-wp3RotMjv3-z3qY7hSJZEoqFBqCWnQ@mail.gmail.com>
 <62b29bc1-cc78-cd64-4377-fc4007ba7189@redhat.com>
 <20190426091702.GA2071@stefanha-x1.localdomain>
 <CAFEAcA8OVKO087uiNvwDGObiaxHAPYHwoXLEN1t5Y4v9B43r9A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lEGEL1/lMxI0MVQ2"
Content-Disposition: inline
In-Reply-To: <CAFEAcA8OVKO087uiNvwDGObiaxHAPYHwoXLEN1t5Y4v9B43r9A@mail.gmail.com>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.44]); Mon, 29 Apr 2019 12:28:28 +0000 (UTC)
X-TUID: rAufyDqkCQnI


--lEGEL1/lMxI0MVQ2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 26, 2019 at 12:45:37PM +0100, Peter Maydell wrote:
> On Fri, 26 Apr 2019 at 10:17, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> > On Thu, Apr 25, 2019 at 08:07:06PM +0200, Philippe Mathieu-Daud=E9 wrot=
e:
> > Old boards probably want to continue using -kernel.  New boards like
> > microbit may use just -device loader.  Perhaps there is even a group
> > that wants both options.
> >
> > A solution is to introduce explicit checks so that we can tell the user
> > the appropriate option for the machine type.  I can work on this if you
> > like, but probably won't be able to send a patch until Tuesday.
>=20
> But it's difficult to tell how to identify whether there's really
> any guest code there. For instance the user might want to start
> QEMU, connect via the gdbstub and load guest code from gdb.
> Or they might be using the generic-loader device. Or they might
> really be using -kernel but with a broken guest image which doesn't
> have a vector table in it, which will result in the same message.
> I guess you could have a heuristic for "if an M-profile CPU is in reset
> and the value it loads for the starting PC is zero and the gdb
> stub is not connected, then print a warning that the guest image
> is missing or there's no vector table" but I'm not a big fan of
> heuristics...

I was going to add a function to check kernel_filename and the presence
of -device loader.  Then each machine type init function would call the
function with flags indicating which modes are allowed:

  /* Allow both -kernel and -device loader */
  check_kernel_loaded(KERNEL_CMDLINE | KERNEL_LOADER);

  /* Allow only -kernel */
  check_kernel_loaded(KERNEL_CMDLINE);

  /* Allow only -device loader */
  check_kernel_loaded(KERNEL_LOADER);

This doesn't support the gdbstub use case you've described though.  No
heuristics but a bit inflexible.

What do you think?

Stefan

--lEGEL1/lMxI0MVQ2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJcxu3jAAoJEJykq7OBq3PIiFEIAJIUtogxNcq8ENA6dUkbecEg
g5mU9zDH+mDPUIXnKmKTjuzRUHJ2ub9gPu5rrZUF5doS3F0B4hGwfciMld+q7cKK
eXFroOORsDJ3hYY9iB2/KyFj4dfr3SaDrciT4kXouSMGi1+il2DadtIOai0eljny
IVketkBvz7V+v/UVvUMbkKOp3hGwJ8nyP2s0CmK6tsZLzu7D9kUabBFADfCpLdn2
Jng0B3TADi1N50T3wOSoci/8XiVUWZ+WBR3AW4ZZDUIhMSUHaCg3Co5F5xI6Z6/0
wBeXm9BLwMLShGF34THQ042ezxA+2oYKIjj/pnqaxACRIwSNFM63IwQ6UsE8/ms=
=nz8+
-----END PGP SIGNATURE-----

--lEGEL1/lMxI0MVQ2--
