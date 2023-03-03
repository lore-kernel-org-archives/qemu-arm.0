Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id j22-20020a05600c485600b003e203681b26sm2069997wmo.29.2023.03.03.03.26.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 03:26:46 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 27D791FFB7;
	Fri,  3 Mar 2023 11:26:46 +0000 (GMT)
References: <20230302191146.1790560-1-marcin.juszkiewicz@linaro.org>
User-agent: mu4e 1.9.21; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: Radoslaw Biernacki <rad@semihalf.com>, Peter Maydell
 <peter.maydell@linaro.org>, Leif Lindholm <quic_llindhol@quicinc.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Philippe =?utf-8?Q?Mathieu-Da?=
 =?utf-8?Q?ud=C3=A9?=
 <philmd@linaro.org>
Subject: Re: [PATCH 1/3] tests/avocado: update AArch64 tests to Alpine 3.17.2
Date: Fri, 03 Mar 2023 11:24:59 +0000
In-reply-to: <20230302191146.1790560-1-marcin.juszkiewicz@linaro.org>
Message-ID: <87mt4u9itl.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: aCFa40sOx2nf


Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org> writes:

Next time please ensure you have a cover letter for a multi-patch series
as the various bits of tooling get confused without one.

> To test Alpine boot on SBSA-Ref target we need Alpine Linux
> 'standard' image as 'virt' one lacks kernel modules.

Is this kernel modules we will need for SBSA "hw" choices?

> So to minimalize Avocado cache I move test to 'standard' image.
>
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  tests/avocado/machine_aarch64_virt.py | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/tests/avocado/machine_aarch64_virt.py b/tests/avocado/machin=
e_aarch64_virt.py
> index 25dab8dc00..a90dc6ff4b 100644
> --- a/tests/avocado/machine_aarch64_virt.py
> +++ b/tests/avocado/machine_aarch64_virt.py
> @@ -38,11 +38,11 @@ def test_alpine_virt_tcg_gic_max(self):
>          :avocado: tags=3Daccel:tcg
>          """
>          iso_url =3D ('https://dl-cdn.alpinelinux.org/'
> -                   'alpine/v3.16/releases/aarch64/'
> -                   'alpine-virt-3.16.3-aarch64.iso')
> +                   'alpine/v3.17/releases/aarch64/'
> +                   'alpine-standard-3.17.2-aarch64.iso')
>=20=20
>          # Alpine use sha256 so I recalculated this myself
> -        iso_sha1 =3D '0683bc089486d55c91bf6607d5ecb93925769bc0'
> +        iso_sha1 =3D '76284fcd7b41fe899b0c2375ceb8470803eea839'
>          iso_path =3D self.fetch_asset(iso_url, asset_hash=3Diso_sha1)
>=20=20
>          self.vm.set_console()
> @@ -65,7 +65,7 @@ def test_alpine_virt_tcg_gic_max(self):
>          self.vm.add_args('-object', 'rng-random,id=3Drng0,filename=3D/de=
v/urandom')
>=20=20
>          self.vm.launch()
> -        self.wait_for_console_pattern('Welcome to Alpine Linux 3.16')
> +        self.wait_for_console_pattern('Welcome to Alpine Linux 3.17')
>=20=20
>=20=20
>      def common_aarch64_virt(self, machine):


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
