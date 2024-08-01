Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7acadbb910sm919959766b.225.2024.08.01.09.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 09:05:01 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id AF1225F7AD;
	Thu,  1 Aug 2024 17:05:00 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Cleber Rosa <crosa@redhat.com>
Cc: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>,
  qemu-devel@nongnu.org,  Peter
 Maydell <peter.maydell@linaro.org>,  Thomas Huth <thuth@redhat.com>,
  Beraldo Leal <bleal@redhat.com>,  Sriram Yagnaraman
 <sriram.yagnaraman@ericsson.com>,  David Woodhouse <dwmw2@infradead.org>,
  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Leif
 Lindholm
 <quic_llindhol@quicinc.com>,  Jiaxun Yang <jiaxun.yang@flygoat.com>,
  kvm@vger.kernel.org,  Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
  Wainer dos Santos Moschetta <wainersm@redhat.com>,  qemu-arm@nongnu.org,
  Radoslaw Biernacki <rad@semihalf.com>,  Paul Durrant <paul@xen.org>,
  Paolo Bonzini <pbonzini@redhat.com>,  Akihiko Odaki
 <akihiko.odaki@daynix.com>
Subject: Re: [PATCH 06/13] tests/avocado: use more distinct names for assets
In-Reply-To: <CA+bd_6JjpHe=DJZMJb7x-bu_-i8X2Z4LCuk-Mz-2_LbqtUKYNQ@mail.gmail.com>
	(Cleber Rosa's message of "Wed, 31 Jul 2024 23:12:34 -0400")
References: <20240726134438.14720-1-crosa@redhat.com>
	<20240726134438.14720-7-crosa@redhat.com>
	<ZqdzqnpKja7Xo-Yc@redhat.com>
	<CA+bd_6JjpHe=DJZMJb7x-bu_-i8X2Z4LCuk-Mz-2_LbqtUKYNQ@mail.gmail.com>
Date: Thu, 01 Aug 2024 17:05:00 +0100
Message-ID: <87sevocjpv.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: g7LCRfHJrLxY

Cleber Rosa <crosa@redhat.com> writes:

> On Mon, Jul 29, 2024 at 6:49=E2=80=AFAM Daniel P. Berrang=C3=A9 <berrange=
@redhat.com> wrote:
>>
>> On Fri, Jul 26, 2024 at 09:44:31AM -0400, Cleber Rosa wrote:
>> > Avocado's asset system will deposit files in a cache organized either
>> > by their original location (the URI) or by their names.  Because the
>> > cache (and the "by_name" sub directory) is common across tests, it's a
>> > good idea to make these names as distinct as possible.
>> >
>> > This avoid name clashes, which makes future Avocado runs to attempt to
>> > redownload the assets with the same name, but from the different
>> > locations they actually are from.  This causes cache misses, extra
>> > downloads, and possibly canceled tests.
>> >
>> > Signed-off-by: Cleber Rosa <crosa@redhat.com>
>> > ---
>> >  tests/avocado/kvm_xen_guest.py  | 3 ++-
>> >  tests/avocado/netdev-ethtool.py | 3 ++-
>> >  2 files changed, 4 insertions(+), 2 deletions(-)
>> >
>> > diff --git a/tests/avocado/kvm_xen_guest.py b/tests/avocado/kvm_xen_gu=
est.py
>> > index f8cb458d5d..318fadebc3 100644
>> > --- a/tests/avocado/kvm_xen_guest.py
>> > +++ b/tests/avocado/kvm_xen_guest.py
>> > @@ -40,7 +40,8 @@ def get_asset(self, name, sha1):
>> >          url =3D base_url + name
>> >          # use explicit name rather than failing to neatly parse the
>> >          # URL into a unique one
>> > -        return self.fetch_asset(name=3Dname, locations=3D(url), asset=
_hash=3Dsha1)
>> > +        return self.fetch_asset(name=3Df"qemu-kvm-xen-guest-{name}",
>> > +                                locations=3D(url), asset_hash=3Dsha1)
>>
>> Why do we need to pass a name here at all ? I see the comment here
>> but it isn't very clear about what the problem is. It just feels
>> wrong to be creating ourselves uniqueness naming problems, when we
>> have a nicely unique URL, and that cached URL can be shared across
>> tests, where as the custom names added by this patch are forcing
>> no-caching of the same URL between tests.
>>
>
> Now with your comment, I do agree that this adds some unneeded
> maintenance burden indeed.  Also, this was part of my pre-avocado bump
> patches that would work around issues present in < 103.0.  But let me
> give the complete answer.
>
> Under 88.1 the "uniqueness" of the URL did not consider the query
> parameters in the URL.  So, under 88.1:
>
>    avocado.utils.asset.Asset(name=3D'bzImage',
> locations=3D['https://fileserver.linaro.org/s/kE4nCFLdQcoBF9t/download?pa=
th=3D%2Fkvm-xen-guest&files=3DbzImage',
> ...)
>    avocado.utils.asset.Asset(name=3D'bzImage',
> locations=3D['https://fileserver.linaro.org/s/kE4nCFLdQcoBF9t/download?pa=
th=3D%2Fnetdev-ethtool&files=3DbzImage',
> ...)

This is mostly a hack to avoid having to tell NextCloud to generate a
unique sharing URL for every file.

>
> Would save content to the same location:
> /tmp/cache_old/by_location/2a8ecd750eb952504ad96b89576207afe1be6a8f/downl=
oad.
>
> This is no longer the case on 103.0 (actually since 92.0), the
> contents of those exact assets would be saved to
> '/by_location/415c998a0061347e5115da53d57ea92c908a2e7f/path=3D%2Fkvm-xen-=
guest&files=3DbzImage'
> and /by_location/415c998a0061347e5115da53d57ea92c908a2e7f/path=3D%2Fnetde=
v-ethtool&files=3DbzImage'.
>
> I personally don't like having the files named, although uniquely,
> after the query parameters.  But, If this doesn't bother others more
> than the maintenance burden, and Avocado version bump is applied, this
> patch can be dropped.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
