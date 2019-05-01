Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp6060304wrh;
        Wed, 1 May 2019 09:23:19 -0700 (PDT)
X-Received: by 2002:a24:90a:: with SMTP id 10mr8097197itm.131.1556727799001;
        Wed, 01 May 2019 09:23:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556727798; cv=none;
        d=google.com; s=arc-20160816;
        b=zkadGcapmWD6U6MtA1xyz6FO3nDiCe7njWObAUFadeMKxdrtMlG/OsQzDXcYlAlgsR
         hdtlM8MYcjhm6cfhbFzkFtvOSWwmOmktiDzn1GsblOTXM/Pc1Rl5ed+SL0UJqGxgBxAw
         9R3OVV6NqQsl3gEl3TH4UUrMRlz7TzQmiAIiLkuowx4pPOKvsb3Y2nknPTB2VxoAZ1sX
         478S8bAD2b8AVLE3+71SLJrMts4JGJPgD/2rIRhh4cyzwK/YI2CEEGY0i8Dcliv07JQ/
         zeCLkJfzS80F1aKOWoRsUtrMXYYyFzWLbaj6f6FRhfwr9Mi1DiNpWCOh78KjyXEzjEUO
         GEjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=F6wCBjdtZU+Hpe3vcFv+cXZg8wyzq3WAKXl6VPVrI8A=;
        b=Bj+VYJb0pvb49tn0GbRgm3eyUAoAYYTu0opD+DSeb/zI15IhNmc8hx0V2vNgjNEe0v
         w5RUz2/mjvROTR0w/Cc4qRDt3YtduDYdRUE5AihyoqGoclbH3PU/Mxaru2EKUsjX4gVa
         jg996CV0vS7DugFYfY8ndbX24AlaRPF6uxdCJu1UhCwf9YfwnDZWysXMNUITkTj4HRZJ
         J8mR64BG6+itPZi46RNu9AzJaRBRfH2Czpe2ZWQqiE04F46PIQpic61nYcY6xph1SUym
         /JZu8a7e05det7RDydruhtoxagX8HqCp3GCtCho1lCV0NyhXblddFt3F6crVKed7jxB9
         MN9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=s07KVMt3;
       spf=pass (google.com: domain of stefanha@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=stefanha@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <stefanha@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id m23sor15754652iob.40.2019.05.01.09.23.18
        (Google Transport Security);
        Wed, 01 May 2019 09:23:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of stefanha@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=s07KVMt3;
       spf=pass (google.com: domain of stefanha@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=stefanha@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=F6wCBjdtZU+Hpe3vcFv+cXZg8wyzq3WAKXl6VPVrI8A=;
        b=s07KVMt3ev/pqPADn2hCUj9ZkwemeBCHbUfziSJXSocVrj+y64K/MKqDAb4qpQ5KZL
         25jb2u3cfUaLACDAhWEgTxxwZPMoIWaFXsPg9B3X8+7vatU2Y+Tuv27kMcw8KY0MEQ8O
         kieYhs5EEEEzuZOZLm7xWddw5N9A2uRQV1bFLnwE/47Vv9uaXOg+hmKo+gjWZeLWUA7e
         I3Z1DqmDF+yQjm5LobGbjcnyKlwP6z/ku25TmonCcNX+6S2GZTgFiELW5zA4iGcjb6ae
         IcyEzU15DRRg+yZc75o+f1fFWH0MKJhrOgdEH0S7+D9T+fvQZnm4c57yTy6jYQdJ+mPz
         Mu3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=F6wCBjdtZU+Hpe3vcFv+cXZg8wyzq3WAKXl6VPVrI8A=;
        b=osus7zfwfZFd60yvRRedVLhYZemNlz3LjxUGO+a9/I1JJb3V5gyykP9UPQYPPg0BlK
         Q/cPrStOr/w4Vl+vwoeItsNXaN2vJjUqmIeWJjopcMjdPEtlPsgHMS22x47gwj4RTlq4
         a60UabfaHBBzchtQUYewF6+Bgg+aJs3XDyhLy8gA/WDy56Ka4KfT+G6KQGjdrfq2oToN
         oGE2qcoVBNXrX/MW6EovnBrrmEfZc3iGvAhz1AMjP1fzKDqC6E6I45MLPjP+abFHhsVD
         peG99E0mg0wiA7gR0E3HIj1DTHk8Qkd0M22h6UL/+xFTgDNBLzxCt5fd/avtGYhsEdg1
         dFHw==
X-Gm-Message-State: APjAAAVb/LTgby4UgCoZddbC9qa+Em/nExygylwq4YpjHGDHP7GHfken
	LxfSoB4hwB4uvM7QOPRXMYI=
X-Google-Smtp-Source: APXvYqwXhdnSo9wHhf69j7J9wrdaaacVlpWYrz1S1VbNzoUDzGZM3u20roLzpKIu9p/Huejxiz+pTQ==
X-Received: by 2002:a5d:91c1:: with SMTP id k1mr605145ior.180.1556727798668;
        Wed, 01 May 2019 09:23:18 -0700 (PDT)
Return-Path: <stefanha@gmail.com>
Received: from localhost (CPE64777d5479c3-CM64777d5479c0.cpe.net.cable.rogers.com. [99.228.64.175])
        by smtp.gmail.com with ESMTPSA id w81sm3091062itf.23.2019.05.01.09.23.17
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 May 2019 09:23:17 -0700 (PDT)
Date: Wed, 1 May 2019 12:23:16 -0400
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Joel Stanley <joel@jms.id.au>
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Jim Mussared <jim@groklearning.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Julia Suvorova <jusual@mail.ru>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Steffen Gortz <qemu.ml@steffen-goertz.de>,
	qemu-arm <qemu-arm@nongnu.org>, Thomas Huth <thuth@redhat.com>,
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [Qemu-devel] [PATCH] Revert "armv7m: Guard against no -kernel
 argument"
Message-ID: <20190501162316.GD21155@stefanha-x1.localdomain>
References: <20190103144124.18917-1-stefanha@redhat.com>
 <CAFEAcA-B_T9E3ezWFXg-wp3RotMjv3-z3qY7hSJZEoqFBqCWnQ@mail.gmail.com>
 <62b29bc1-cc78-cd64-4377-fc4007ba7189@redhat.com>
 <20190426091702.GA2071@stefanha-x1.localdomain>
 <CACPK8Xc5KgiaYCTs=8ceRu_hV=vC3M6pGV0=7jJNsbuz2a6LDA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="n/aVsWSeQ4JHkrmm"
Content-Disposition: inline
In-Reply-To: <CACPK8Xc5KgiaYCTs=8ceRu_hV=vC3M6pGV0=7jJNsbuz2a6LDA@mail.gmail.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-TUID: h0+UTWZ5K8Xb


--n/aVsWSeQ4JHkrmm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 29, 2019 at 12:53:48PM +0000, Joel Stanley wrote:
> On Fri, 26 Apr 2019 at 09:17, Stefan Hajnoczi <stefanha@redhat.com> wrote:
> >
> > A user-friendly error message is needed here.  The check for -kernel was
> > too specific and is not desirable for microbit where we use -device
> > loader.
> >
> > Old boards probably want to continue using -kernel.  New boards like
> > microbit may use just -device loader.  Perhaps there is even a group
> > that wants both options.
>=20
> FWIW, I used -kernel exclusively when working on the microbit model.
> Other users may chose to use the device loader/hex file.
>=20
> I am all for usability, but getting rid of the ability to use -kernel
> on some machine types would be a step in the wrong direction.

-kernel doesn't support the .hex file format that is most commonly used
for micro:bit programs.  Are you loading ELFs?

Stefan

--n/aVsWSeQ4JHkrmm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAlzJx/QACgkQnKSrs4Gr
c8hpZggAukJnmfzU1WV5yz34v06vaJnRghdLQe54TmxuZRJiTjwhsVwfcTwTEsTe
4SgJ9LRi4dGz7+F4IvNUjLzePJX9dpcJ7SKFFoFUxAN1SvgPMTY26na56a4wJPNj
2ATUZsujzI4z9W4tl55U+iaxUTv5jSMwyGl3k4BsHHe5o25Ce97YNfd8fpoLBU0R
+fCGsjkebSSnSXARnLvy2hKefxwW7dlhQC0THL7pISY7rX6btRnuNzbe2eJvOvhG
kFtbEfaNrkObhVEqL+oz/s1+Xyo4lcLijm5Sxi95V4F6zmHMPHbVe+3GXGtABNoY
xp3NsWSV5Da4mY6HWloAQOjBIHixsA==
=W2f4
-----END PGP SIGNATURE-----

--n/aVsWSeQ4JHkrmm--
