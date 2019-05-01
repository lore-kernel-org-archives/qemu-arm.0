Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp6062571wrh;
        Wed, 1 May 2019 09:25:54 -0700 (PDT)
X-Received: by 2002:a05:660c:712:: with SMTP id l18mr2712994itk.27.1556727954457;
        Wed, 01 May 2019 09:25:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556727954; cv=none;
        d=google.com; s=arc-20160816;
        b=AJjx/zH7UzxFhXyxUcFizVlvjBhoaWJ+UF9ZODXaD9bS6CHM2rGRw1c9U88c68jl5f
         SEIYsstlOgEVJH22WSNWPtNsfLrjvzAwmBM3wKL5zxCQYJfKdX6FfKxWCiMwI2BCpftY
         T1rDhIp7NbsIs0p2D8ZHd93d4uLqlBW8j0L1UO9Cs0gOCtlnQTp1Krpbd/LRBmiJp0BF
         Tvq5YZ/EKI6kmWC+sbb2/wOQ+W3pInL2VJZMmkTatjMoGYy955gPd/j+bgW7sEzgVNtl
         JzkPzCMvW3wni+t38TpXI54/wEXPEuj4aQQwYn+qb9oJrW4wdoj473x6uJ6iEd9Iji0C
         1h7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=7y7T5IhOFv7uW/nPm1YBGwfS4GWdswk4MeV+DNzF0y4=;
        b=lQAcup9z8E71U5di/qRxckLMHcnYtLWIb4M8kKfa/nSCo1PbKX4qd0rqO1hKgBOBJA
         XKxGYC1jypPUqWzxk9F1mofrIZBiAW6mZZcQip0wja6lpiWEdSbNbxj2ckllg6vVU659
         Ech/pUZcbyinGndurv9yQ4KxQ47+01ZdEotm1twdX8dFMmJd5oEB/M1+/qZRytlDQsfn
         J0S6QZHqIbYdgeHjH+89QEEAjv77p7LpKFVZO5+C8MJSYnT+Hndd9vYz/tsl9Dd6IiM2
         u6zxU3UT7sm08T+xaUtPRJx3wpAKJflDVxVfgJkY3ffwKuoXiRGvkXyDNG0ueMEMgSHi
         447w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Q24Kwylr;
       spf=pass (google.com: domain of stefanha@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=stefanha@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <stefanha@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id x10sor8818478itb.30.2019.05.01.09.25.54
        (Google Transport Security);
        Wed, 01 May 2019 09:25:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of stefanha@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=Q24Kwylr;
       spf=pass (google.com: domain of stefanha@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=stefanha@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=7y7T5IhOFv7uW/nPm1YBGwfS4GWdswk4MeV+DNzF0y4=;
        b=Q24KwylrvZJBZWneHzfgD72TIgfWL7+m3r5rSuLMYd1+yI6QZ49YhhSiHgjBXD6t+c
         CCGqeYeY/jx8yUz8RYlGYruBgnHOzGAje9pKeSpMsu5sHiQ3oA8SJO6F4xU86Y8vlZDd
         9xfQFCj8ecRRxn1sEr5d5fyy+azQTKtjQr3a/5wDBUVfzf/WWEVvIVqlUCY7kIYtYn8R
         j4ZhyPFNJuDJbc2xWshOxHI4wR84egslpRqmbRvpfeKG0klGUjplylalpaP76jaTqBqP
         RSSJZDNL4Aq1FNcir3vz3HZnes99hDPLWGpGIEfKGckeIAhO95UPClGO6AUE8grcCFWC
         Z01g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=7y7T5IhOFv7uW/nPm1YBGwfS4GWdswk4MeV+DNzF0y4=;
        b=aqfrlWulODVlwVtgJvGqAb3kQwdIhFzaBmQ07b9STR9LoMw5tC98Vev39981Vpji4T
         nxj5zR3QV0/n70vdnn3R6Y0RAq8Ze1tVK739FNQtPdUb/gmiacu3ZNRSiPFDMN6hHq5j
         rhZ1l3VSxYnooR3/QzVEOsDt6gqIMsi44OAy2n/S4jz2yy6/VX7yy5uNxc7BPFhXOF2w
         qMDqJN3OvyLCsfM1OHK2oBEiYIaFKDUUdyBMCnElGLQVpEjxEwcNG/3MHMU8R4e+IVpd
         YakQDFJq2hgquw8DtU0za2g4j8yGMmIjn/5EZUN0bJmqOK+IHaQBn+iGiV2m6v9p5pYS
         Dnew==
X-Gm-Message-State: APjAAAX9j+3XFyV2oy/Nup1Gzum201NPvW3dCJRDx+w9sW+PGhEY3WUM
	/tUyCMjp+EeUbiCMLSep0L/0rbaH
X-Google-Smtp-Source: APXvYqxq/NkEUQGk2G852nhgWiUKVYBBNR49BNJTFybzzQqN5o/7xe1Nj3Ho8pafl+FrIoS3BYyuVw==
X-Received: by 2002:a24:c685:: with SMTP id j127mr9364720itg.21.1556727953812;
        Wed, 01 May 2019 09:25:53 -0700 (PDT)
Return-Path: <stefanha@gmail.com>
Received: from localhost (CPE64777d5479c3-CM64777d5479c0.cpe.net.cable.rogers.com. [99.228.64.175])
        by smtp.gmail.com with ESMTPSA id n184sm3324333itc.28.2019.05.01.09.25.52
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 May 2019 09:25:52 -0700 (PDT)
Date: Wed, 1 May 2019 12:25:51 -0400
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
	Jim Mussared <jim@groklearning.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Steffen Gortz <qemu.ml@steffen-goertz.de>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>,
	Thomas Huth <thuth@redhat.com>, Julia Suvorova <jusual@mail.ru>
Subject: Re: [Qemu-devel] [PATCH] Revert "armv7m: Guard against no -kernel
 argument"
Message-ID: <20190501162551.GE21155@stefanha-x1.localdomain>
References: <20190103144124.18917-1-stefanha@redhat.com>
 <CAFEAcA-B_T9E3ezWFXg-wp3RotMjv3-z3qY7hSJZEoqFBqCWnQ@mail.gmail.com>
 <62b29bc1-cc78-cd64-4377-fc4007ba7189@redhat.com>
 <20190426091702.GA2071@stefanha-x1.localdomain>
 <CAFEAcA8OVKO087uiNvwDGObiaxHAPYHwoXLEN1t5Y4v9B43r9A@mail.gmail.com>
 <20190429122819.GB7587@stefanha-x1.localdomain>
 <CAFEAcA9_=a72BAmyb0eJhLF_nYLhRb_O7e=__MPazQ0nLC9Tmw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="WK3l2KTTmXPVedZ6"
Content-Disposition: inline
In-Reply-To: <CAFEAcA9_=a72BAmyb0eJhLF_nYLhRb_O7e=__MPazQ0nLC9Tmw@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-TUID: KUuAmv9qc1KE


--WK3l2KTTmXPVedZ6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 29, 2019 at 01:58:46PM +0100, Peter Maydell wrote:
> On Mon, 29 Apr 2019 at 13:28, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> >
> > On Fri, Apr 26, 2019 at 12:45:37PM +0100, Peter Maydell wrote:
> > I was going to add a function to check kernel_filename and the presence
> > of -device loader.  Then each machine type init function would call the
> > function with flags indicating which modes are allowed:
> >
> >   /* Allow both -kernel and -device loader */
> >   check_kernel_loaded(KERNEL_CMDLINE | KERNEL_LOADER);
> >
> >   /* Allow only -kernel */
> >   check_kernel_loaded(KERNEL_CMDLINE);
> >
> >   /* Allow only -device loader */
> >   check_kernel_loaded(KERNEL_LOADER);
>=20
> Every machine should permit -device loader: the point
> of it is that it is entirely generic and works the same
> way on every machine.

It seems every person has a slightly different preference :).  Can we
reach a consensus?

1. Should QEMU print a readable error message when launched without a
   kernel?

If yes:

2. What checks are sensible?

Stefan

--WK3l2KTTmXPVedZ6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAlzJyI8ACgkQnKSrs4Gr
c8hBDQgAtG/Dxap2gsiS1yWR1zi3RCHdY8hzRGJ1Sp/514jLWc/nWTfBRM+nIkd0
Um+NzuJwoX+M0eeECmfMJOrhmimHIHS1P3fZChGWzucj7eQb0RDV741Ahs+olxJk
ri+N0mNQMtHn3RUURRDDSeHrJedLPYvLZSYsUpIeVxywyWv1wmnRn+yE7GrBKi3L
WprN/VWQZiduVLlm7/eMjsbcJ5AIalTowuNJoCtXRc0YxjHwcOlAfrtDL9vkE0Ln
mdHCxbHy+oRBerkH4ziudOj7galnyjRLZJ8jVqgwN/FVGuMv3WJlKWtMsGqUlWrh
Zcy4zMSeom55p74grZ+MDxZmjUceeA==
=q6kg
-----END PGP SIGNATURE-----

--WK3l2KTTmXPVedZ6--
