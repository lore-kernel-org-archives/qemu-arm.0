Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id b16-20020adfee90000000b0033ec7182673sm636455wro.52.2024.03.14.05.11.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 05:11:43 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 408B15F890;
	Thu, 14 Mar 2024 12:11:43 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Cc: qemu-devel@nongnu.org,  Radoslaw Biernacki <rad@semihalf.com>,  Peter
 Maydell <peter.maydell@linaro.org>,  Leif Lindholm
 <quic_llindhol@quicinc.com>,  Cleber Rosa <crosa@redhat.com>,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Wainer dos Santos
 Moschetta
 <wainersm@redhat.com>,  Beraldo Leal <bleal@redhat.com>,  Brad Smith
 <brad@comstyle.com>,  qemu-arm@nongnu.org
Subject: Re: [PATCH v2 2/4] tests/avocado: drop virtio-rng from sbsa-ref tests
In-Reply-To: <20240314-sbsa-ref-firmware-update-v2-2-b557c56559cd@linaro.org>
	(Marcin Juszkiewicz's message of "Thu, 14 Mar 2024 10:23:25 +0100")
References: <20240314-sbsa-ref-firmware-update-v2-0-b557c56559cd@linaro.org>
	<20240314-sbsa-ref-firmware-update-v2-2-b557c56559cd@linaro.org>
User-Agent: mu4e 1.12.1; emacs 29.2
Date: Thu, 14 Mar 2024 12:11:43 +0000
Message-ID: <87h6h9gghs.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 8iB95NKsnY57

Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org> writes:

> sbsa-ref is supposed to emulate real hardware so virtio-rng-pci
> does not fit here

What is real anyway ;-)

VirtIO devices exist in real life and I would argue for PCI the device
appears very much like a normal PCI device. I could see the argument for
avoiding virtio-mmio devices which are a lot more VM-only in flavour.

>
> Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> ---
>  tests/avocado/machine_aarch64_sbsaref.py | 8 --------
>  1 file changed, 8 deletions(-)
>
> diff --git a/tests/avocado/machine_aarch64_sbsaref.py b/tests/avocado/mac=
hine_aarch64_sbsaref.py
> index cbab793455..259225f15f 100644
> --- a/tests/avocado/machine_aarch64_sbsaref.py
> +++ b/tests/avocado/machine_aarch64_sbsaref.py
> @@ -132,10 +132,6 @@ def boot_alpine_linux(self, cpu):
>              cpu,
>              "-drive",
>              f"file=3D{iso_path},format=3Draw",
> -            "-device",
> -            "virtio-rng-pci,rng=3Drng0",
> -            "-object",
> -            "rng-random,id=3Drng0,filename=3D/dev/urandom",
>          )
>=20=20
>          self.vm.launch()
> @@ -179,10 +175,6 @@ def boot_openbsd73(self, cpu):
>              cpu,
>              "-drive",
>              f"file=3D{img_path},format=3Draw",
> -            "-device",
> -            "virtio-rng-pci,rng=3Drng0",
> -            "-object",
> -            "rng-random,id=3Drng0,filename=3D/dev/urandom",
>          )
>=20=20
>          self.vm.launch()

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
