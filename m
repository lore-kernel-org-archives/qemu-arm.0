Received: by 2002:a17:505:3f8c:b0:1be9:327d:8ee3 with SMTP id bm12csp731801njb;
        Wed, 31 Jul 2024 20:12:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVdPaQ24X1j5+yXuvX1uM/b6mVEXOAVypFHBahOtpR6FUiwXivmStAQ532iBu14aWphqsXJKwHAi+kxHkaCoPGWoAKD3ybX
X-Google-Smtp-Source: AGHT+IHoFrQh6SLjUd7dvyME7tmRWAKfsJYiWvu/mP/nDRPyffuetQg3L+SBin6kW9FYNdhgPk3d
X-Received: by 2002:ac8:5786:0:b0:43a:f1f0:12f with SMTP id d75a77b69052e-4515681951fmr17749181cf.59.1722481968841;
        Wed, 31 Jul 2024 20:12:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722481968; cv=none;
        d=google.com; s=arc-20160816;
        b=IaxJNwmuAK+RSC7QgosvTAJnxrovdxKoGHNiWdjdeXm978VWLLQZS3yUFrbqGEEWVq
         lNSXOAwueo5NRpjYQKMPcj0OyT9L1k0runGSqqWUGJWYr4J7WAeSq1GOelSHSnkZy0+t
         IaYm31hTjnvrq7bLYIOzUcHvmuq1NDdxIADzXr6uIPkWsPBRxfvxDTZJhzlF9GgXaTtE
         1bpxGBR6ZXCJkVNPCXdPdizFe2NoynkWMXpDQFgCOWez+Qe+3Hvrj1CcwzcKz9lQ7y2Z
         WHcdsCdBZs57X9h6+xSR8DnblwtYt5OE1SJSuTclUhN8ni3wrPd+8XLEiwZvW2phrk1Y
         zyfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D7AlDUN6nl/SKMwnnn5iGJ6hY5cYu+29jn1yx4r42g4=;
        fh=f2WqajLns6vUxuBLTx7Dkc+Okmlf4saLWODUmjTXcg0=;
        b=UP+4gxb9n7KRStj6rl1mRw66embP2sg2aWEJHCLKRafcl3LfjZO7KHimXToGqb8yiG
         jf0xJIumRdd9kX1V6eIi92XKUk+qEk98XFcDE5OHHBSxFXosxwC43FY9JuCaJEjFZtCE
         rk7j+l/EMR1UjrlclYsDpx5+P6N/81vWNumiKdp9XPnjiHuFPSiPZcs6lSV5kZ+g14ct
         ZPmxWZgc9NFoXrzI7WFwGLaQqERYe1fmw/LYmnwyfatK8W59c/vA4Ev5WEQLgIq/Cqlv
         jIDF2EkEOiD0Yh66wC+ojtHLKCUSSTB3hxxykE21vILjSsAkmwmrfIiqUFsegqTtCwJd
         lQjQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UXgcnYYA;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-44fe851bd6asi169460801cf.698.2024.07.31.20.12.48
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 20:12:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UXgcnYYA;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722481968;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=D7AlDUN6nl/SKMwnnn5iGJ6hY5cYu+29jn1yx4r42g4=;
	b=UXgcnYYAy5FPCj7w2MAiBsoaWTf4tcupClcasZaDZwPVRWHcU0ZizKMZSVzNdFQ1raQAsU
	Y2BUGETpc0iWPcGIFNJFb7z2289IRt8eS0BO/J2hXY87VXprSc40wA9cNCmBXTwN6y5XB4
	keVCzYmmlnrNFUh7XLtTgy0fmMjmv00=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-189-vQUjtJ8tPJe-jyOMzuFXjw-1; Wed, 31 Jul 2024 23:12:46 -0400
X-MC-Unique: vQUjtJ8tPJe-jyOMzuFXjw-1
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-664fc7c4e51so121878917b3.3
        for <alex.bennee@linaro.org>; Wed, 31 Jul 2024 20:12:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722481965; x=1723086765;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D7AlDUN6nl/SKMwnnn5iGJ6hY5cYu+29jn1yx4r42g4=;
        b=sHQ8IN2ngRYq7o6ODr1ON1cc/XN/fHxWtI8sVoxC8RHPYbOHa7T+OzCASKXJ5rv4wO
         CSBrWYeQF2fm9aN4NMxSqB6hbsoUW8Bt62UpujUpS63Kg9j4PT53Tof3L0nO4323Utzo
         8A8XVdkILYaW8QjvdgBCQEJ+EhHn9sVYsNWE+8mQb6GhEhOSIz4D0q9guiVkTPB55ldO
         if9h2EguZtQvvDayqkFHGhFSazXgA7Mp/u8uQPYVBGvWxQApKA3Bkf+6h6MQrLazCPwN
         CrBFWQKaKLo7FdfHJrNgZEaJE+h0cUA4BxdCrzVQYSOkfnCkd5JehQ+gAQFWla3u7dAW
         K7kQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGYTRW512RV2jBRgDHH356ZFP4llpiqZ3K2N+lqEyRkxc48tUhDEHSwO99my1HCRk8uuLKdjN4rHTxidz2bvARwLLxUhdw
X-Gm-Message-State: AOJu0YyBLNLIZMLyaXJ2ai7BgVrsnausPOafbY4ydPbvnF7u2/OKdQSq
	zEG3ctG19POamHh0mF0tjyn64T1QdkVUuNyzFCU5KAc/PIWE5cNZsvT9fi0zTiPwC5Ysh3WftCr
	ZAelBFnwVkLoBEX5kpgZ2JS5sIJYYXZJ6vL7RP5HNyByGhnLc7oQKxLrJ40rMPGD9aUOKjq9JkM
	vJ1pvvRLAD+TyEyXs+uWJ8A5aABpgB
X-Received: by 2002:a0d:f585:0:b0:64a:7d9b:934 with SMTP id 00721157ae682-6874d2e3abamr4444117b3.16.1722481965504;
        Wed, 31 Jul 2024 20:12:45 -0700 (PDT)
X-Received: by 2002:a0d:f585:0:b0:64a:7d9b:934 with SMTP id
 00721157ae682-6874d2e3abamr4443887b3.16.1722481965238; Wed, 31 Jul 2024
 20:12:45 -0700 (PDT)
MIME-Version: 1.0
References: <20240726134438.14720-1-crosa@redhat.com> <20240726134438.14720-7-crosa@redhat.com>
 <ZqdzqnpKja7Xo-Yc@redhat.com>
In-Reply-To: <ZqdzqnpKja7Xo-Yc@redhat.com>
From: Cleber Rosa <crosa@redhat.com>
Date: Wed, 31 Jul 2024 23:12:34 -0400
Message-ID: <CA+bd_6JjpHe=DJZMJb7x-bu_-i8X2Z4LCuk-Mz-2_LbqtUKYNQ@mail.gmail.com>
Subject: Re: [PATCH 06/13] tests/avocado: use more distinct names for assets
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
	Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>, 
	Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>, David Woodhouse <dwmw2@infradead.org>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Leif Lindholm <quic_llindhol@quicinc.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, kvm@vger.kernel.org, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, 
	Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org, 
	Radoslaw Biernacki <rad@semihalf.com>, Paul Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>, 
	Akihiko Odaki <akihiko.odaki@daynix.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: b9eiPAS5PbIn

On Mon, Jul 29, 2024 at 6:49=E2=80=AFAM Daniel P. Berrang=C3=A9 <berrange@r=
edhat.com> wrote:
>
> On Fri, Jul 26, 2024 at 09:44:31AM -0400, Cleber Rosa wrote:
> > Avocado's asset system will deposit files in a cache organized either
> > by their original location (the URI) or by their names.  Because the
> > cache (and the "by_name" sub directory) is common across tests, it's a
> > good idea to make these names as distinct as possible.
> >
> > This avoid name clashes, which makes future Avocado runs to attempt to
> > redownload the assets with the same name, but from the different
> > locations they actually are from.  This causes cache misses, extra
> > downloads, and possibly canceled tests.
> >
> > Signed-off-by: Cleber Rosa <crosa@redhat.com>
> > ---
> >  tests/avocado/kvm_xen_guest.py  | 3 ++-
> >  tests/avocado/netdev-ethtool.py | 3 ++-
> >  2 files changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/tests/avocado/kvm_xen_guest.py b/tests/avocado/kvm_xen_gue=
st.py
> > index f8cb458d5d..318fadebc3 100644
> > --- a/tests/avocado/kvm_xen_guest.py
> > +++ b/tests/avocado/kvm_xen_guest.py
> > @@ -40,7 +40,8 @@ def get_asset(self, name, sha1):
> >          url =3D base_url + name
> >          # use explicit name rather than failing to neatly parse the
> >          # URL into a unique one
> > -        return self.fetch_asset(name=3Dname, locations=3D(url), asset_=
hash=3Dsha1)
> > +        return self.fetch_asset(name=3Df"qemu-kvm-xen-guest-{name}",
> > +                                locations=3D(url), asset_hash=3Dsha1)
>
> Why do we need to pass a name here at all ? I see the comment here
> but it isn't very clear about what the problem is. It just feels
> wrong to be creating ourselves uniqueness naming problems, when we
> have a nicely unique URL, and that cached URL can be shared across
> tests, where as the custom names added by this patch are forcing
> no-caching of the same URL between tests.
>

Now with your comment, I do agree that this adds some unneeded
maintenance burden indeed.  Also, this was part of my pre-avocado bump
patches that would work around issues present in < 103.0.  But let me
give the complete answer.

Under 88.1 the "uniqueness" of the URL did not consider the query
parameters in the URL.  So, under 88.1:

   avocado.utils.asset.Asset(name=3D'bzImage',
locations=3D['https://fileserver.linaro.org/s/kE4nCFLdQcoBF9t/download?path=
=3D%2Fkvm-xen-guest&files=3DbzImage',
...)
   avocado.utils.asset.Asset(name=3D'bzImage',
locations=3D['https://fileserver.linaro.org/s/kE4nCFLdQcoBF9t/download?path=
=3D%2Fnetdev-ethtool&files=3DbzImage',
...)

Would save content to the same location:
/tmp/cache_old/by_location/2a8ecd750eb952504ad96b89576207afe1be6a8f/downloa=
d.

This is no longer the case on 103.0 (actually since 92.0), the
contents of those exact assets would be saved to
'/by_location/415c998a0061347e5115da53d57ea92c908a2e7f/path=3D%2Fkvm-xen-gu=
est&files=3DbzImage'
and /by_location/415c998a0061347e5115da53d57ea92c908a2e7f/path=3D%2Fnetdev-=
ethtool&files=3DbzImage'.

I personally don't like having the files named, although uniquely,
after the query parameters.  But, If this doesn't bother others more
than the maintenance burden, and Avocado version bump is applied, this
patch can be dropped.
