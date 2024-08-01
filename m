Received: by 2002:a17:505:3f8c:b0:1be9:327d:8ee3 with SMTP id bm12csp734221njb;
        Wed, 31 Jul 2024 20:21:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX0wlrq1LBCUczxCQ+uZoIs78/OR/VTsp8xHFEgq43aS/KXZiVfIc+11FqHNU52lLCTElq6hf6nf7siMR4DyFFz4O4UQ/3M
X-Google-Smtp-Source: AGHT+IGdkGnMF3Ej2a08v3M8+1uXju8IHI2f03mz5Wmk2OZv9SmJiN9wOuEORy0Ue9Q37XxEAt2B
X-Received: by 2002:a05:620a:2415:b0:79d:6d7d:e5b3 with SMTP id af79cd13be357-7a30c695250mr162889485a.42.1722482471329;
        Wed, 31 Jul 2024 20:21:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722482471; cv=none;
        d=google.com; s=arc-20160816;
        b=WPbBQflfs5zsbrWq7T3Leyw3OFgUbE7MbA6U3GpWE5L7CHZ7CQrXMPW9QbHHGyMWbN
         3aNYhS+qKJGHcGOrIYRnS4oJOIdzt85hsJMc3v0LVzRWcrrfZOAizOE1VBErRSiGmZgp
         r31P8HJ1vnoL6YIF3YOi5i7Xb4p/HpYeuYd3LQ3b5gbVTPvfPwklnqmaD9aOYOHX7W7X
         eMcftnD5vNlH4QOVTi954//xOORIvOlDvDd2wKWDBPpAGEfh8Gig/nf0t9qalodMQahn
         bmCZ8c/ZNi69THT/1HNjCWzHsbIX5jCFhBnyghUAWwbxnFLEnOaarWf1nXOxj1G/jLeo
         D99Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3L2qM8ejm2ahCeHxHfhlaEvmc2geAFoV8VAb1fNK9SI=;
        fh=Pg3K6gFEoFF02M26rMzbp1xnc2TluWisH7lEgKMqO1g=;
        b=sAfYQ6RxUie8oz7gPdmqBIJhDOcQAtblwCzCp094R1jqZz96YB8+gBrWFZc24aCEUT
         IoI3/gdm8LSAfN8VeGf7QIDcsrHOsfW99SpkNIouS9O6Zil9ppDC9cl5iznHmvTYQ8cM
         CUlc/GOwPd+RYpDdqux7ZCP6wXA+TH57abi3yHck7toaSKy822ZefA1Q9ERboCANIMuQ
         sJeC/tcfjmHEiUa8HsXVvOyGibgKSmUCIU4gXIhR3J/iLRerw+XOjjBZp5A73lTaAluS
         Ktc1GbPkcUrYpJL7NoIYP3BTQ9iOPHe9EiMr3u9IZDcqdoGygTMBILMhZmGpshnEXE5S
         E6Hg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Z7XUjjhr;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <crosa@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7a1dff56d86si1331136085a.393.2024.07.31.20.21.11
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Jul 2024 20:21:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Z7XUjjhr;
       spf=pass (google.com: domain of crosa@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=crosa@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722482471;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3L2qM8ejm2ahCeHxHfhlaEvmc2geAFoV8VAb1fNK9SI=;
	b=Z7XUjjhrhfLWuNutt1+4hr48v71+VNYyg6qh0QzegFAsEsnNWca5oAWFMlixymLD7MqzAl
	UJ+7RKNbNYkdNYXflYV5Ncls/oktdXHcvYK1XAx68eh6RKYQw4FGX17ZTZjK/i2wG8VQIx
	W9/7vIsumdWvk8QwSZ1J/Asyp1r9BjM=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-199-5KBa2QfBPH2J_zpZdn-qAQ-1; Wed, 31 Jul 2024 23:21:09 -0400
X-MC-Unique: 5KBa2QfBPH2J_zpZdn-qAQ-1
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-6648363b329so98892857b3.3
        for <alex.bennee@linaro.org>; Wed, 31 Jul 2024 20:21:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722482468; x=1723087268;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3L2qM8ejm2ahCeHxHfhlaEvmc2geAFoV8VAb1fNK9SI=;
        b=faLSjXJ1OYJN7c0CtbDH1iA7fQDBun4lIgHv5mi9NY6Zc1d9cfAs+MXJAelfBfTUQr
         FK2u9YUqpTH+GdBt3Z8ALvTY93BPuT1uHI//ablVJrHDnSQew0ysx8+DhPeKrs775r56
         I5tSFsnSHBaJ1C3Bu9YUNW/Q+PeXxTxWomZxWC7o7g/L9eWZ2HAXZE6y9XoahIYxzHEj
         ZMSTyZlBJBrx0MvgQjX1b2yvMo60EeYM3xResAzSdU8o1b0QaaV9YJzygvhcMjjatASb
         qeIl8bZFeeAgZd9rglsYs49k91CKja0oQJHf2GVA/H9rBnDD+F9VEfODPGeNYE/CbvI1
         rxww==
X-Forwarded-Encrypted: i=1; AJvYcCWQ0we33fRW0xvmqe2jJZ3aDgE6OnD2fRT5yiv1BTBkNeE6o0z+iuY7X+hu0vqtQ5OBokqawciLm2ZoFaojbUzwCj9zyESh
X-Gm-Message-State: AOJu0Yyv3Fc43bO02yhvGtbTlO6StvrF/ilj2E5S1EN0ccMfh0MFq+Sp
	iOg9crFQgyulZbNfXBxWVcobKgr0QlE8zpZ2bLDHzhVMsZJXmYPyEmYVZsqsgxlkJH0T0R+h/Fs
	jXwjD6FK6pkFRTftvN2jyxqFFHJ2cF/HbVqfZ5wrSs/RNMAcfHb1m13hQ//mjh5VxaclhGyw5p1
	uIue+oJAqpDB4jAvtV/6qCUxzc5pn9
X-Received: by 2002:a81:9e0b:0:b0:65f:9796:2bdf with SMTP id 00721157ae682-6874e3a353bmr11944457b3.27.1722482468402;
        Wed, 31 Jul 2024 20:21:08 -0700 (PDT)
X-Received: by 2002:a81:9e0b:0:b0:65f:9796:2bdf with SMTP id
 00721157ae682-6874e3a353bmr11944157b3.27.1722482468074; Wed, 31 Jul 2024
 20:21:08 -0700 (PDT)
MIME-Version: 1.0
References: <20240726134438.14720-1-crosa@redhat.com> <20240726134438.14720-7-crosa@redhat.com>
 <ZqdzqnpKja7Xo-Yc@redhat.com> <6dbc898d-be8a-497c-87bb-d13d956cd279@linaro.org>
In-Reply-To: <6dbc898d-be8a-497c-87bb-d13d956cd279@linaro.org>
From: Cleber Rosa <crosa@redhat.com>
Date: Wed, 31 Jul 2024 23:20:57 -0400
Message-ID: <CA+bd_6LFDwv+y7c8gu89bCcgX3QXHXsyvCrCiAidP40ptdKExw@mail.gmail.com>
Subject: Re: [PATCH 06/13] tests/avocado: use more distinct names for assets
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, 
	Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>, 
	Sriram Yagnaraman <sriram.yagnaraman@ericsson.com>, David Woodhouse <dwmw2@infradead.org>, 
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
X-TUID: TO/8PySI7Xna

On Mon, Jul 29, 2024 at 7:54=E2=80=AFAM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> On 29/7/24 12:49, Daniel P. Berrang=C3=A9 wrote:
> > On Fri, Jul 26, 2024 at 09:44:31AM -0400, Cleber Rosa wrote:
> >> Avocado's asset system will deposit files in a cache organized either
> >> by their original location (the URI) or by their names.  Because the
> >> cache (and the "by_name" sub directory) is common across tests, it's a
> >> good idea to make these names as distinct as possible.
> >>
> >> This avoid name clashes, which makes future Avocado runs to attempt to
> >> redownload the assets with the same name, but from the different
> >> locations they actually are from.  This causes cache misses, extra
> >> downloads, and possibly canceled tests.
> >>
> >> Signed-off-by: Cleber Rosa <crosa@redhat.com>
> >> ---
> >>   tests/avocado/kvm_xen_guest.py  | 3 ++-
> >>   tests/avocado/netdev-ethtool.py | 3 ++-
> >>   2 files changed, 4 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/tests/avocado/kvm_xen_guest.py b/tests/avocado/kvm_xen_gu=
est.py
> >> index f8cb458d5d..318fadebc3 100644
> >> --- a/tests/avocado/kvm_xen_guest.py
> >> +++ b/tests/avocado/kvm_xen_guest.py
> >> @@ -40,7 +40,8 @@ def get_asset(self, name, sha1):
> >>           url =3D base_url + name
> >>           # use explicit name rather than failing to neatly parse the
> >>           # URL into a unique one
> >> -        return self.fetch_asset(name=3Dname, locations=3D(url), asset=
_hash=3Dsha1)
> >> +        return self.fetch_asset(name=3Df"qemu-kvm-xen-guest-{name}",
> >> +                                locations=3D(url), asset_hash=3Dsha1)
> >
> > Why do we need to pass a name here at all ? I see the comment here
> > but it isn't very clear about what the problem is. It just feels
> > wrong to be creating ourselves uniqueness naming problems, when we
> > have a nicely unique URL, and that cached URL can be shared across
> > tests, where as the custom names added by this patch are forcing
> > no-caching of the same URL between tests.
>
> I thought $name was purely for debugging; the file was downloaded
> in a temporary location, and if the hash matched, it was renamed
> in the cache as $asset_hash which is unique. This was suggested
> in order to avoid dealing with URL updates for the same asset.
> Isn't it the case?
>

Hi Phillipe,

I've replied to Daniel's question, but let me repeat the relevant
parts of the $name behavior here.

---

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

---

Now, an update: instead of dropping the patch, it could be simplified
by keeping just the "name" parameter (with the URL) and dropping the
"locations" parameter (that has a single location).

Let me know if this makes sense and what you take on it.

Regards,
- Cleber.
