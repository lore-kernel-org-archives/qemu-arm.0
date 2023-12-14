Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id bi11-20020a05600c3d8b00b0040c2963e5f3sm23970057wmb.38.2023.12.14.02.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 02:34:41 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 758725F7D3;
	Thu, 14 Dec 2023 10:34:41 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Cleber Rosa <crosa@redhat.com>
Cc: qemu-devel@nongnu.org,  Jiaxun Yang <jiaxun.yang@flygoat.com>,  Radoslaw
 Biernacki <rad@semihalf.com>,  Paul Durrant <paul@xen.org>,  Akihiko Odaki
 <akihiko.odaki@daynix.com>,  Leif Lindholm <quic_llindhol@quicinc.com>,
  Peter Maydell <peter.maydell@linaro.org>,  Paolo Bonzini
 <pbonzini@redhat.com>,  kvm@vger.kernel.org,  qemu-arm@nongnu.org,
  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Beraldo Leal
 <bleal@redhat.com>,  Wainer dos Santos Moschetta <wainersm@redhat.com>,
  Sriram Yagnaraman <sriram.yagnaraman@est.tech>,  Marcin Juszkiewicz
 <marcin.juszkiewicz@linaro.org>,  David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 04/10] tests/avocado: machine aarch64: standardize
 location and RO/RW access
In-Reply-To: <87h6klvm90.fsf@p1.localdomain> (Cleber Rosa's message of "Wed,
	13 Dec 2023 16:14:03 -0500")
References: <20231208190911.102879-1-crosa@redhat.com>
	<20231208190911.102879-5-crosa@redhat.com>
	<87wmtkeils.fsf@draig.linaro.org> <87h6klvm90.fsf@p1.localdomain>
User-Agent: mu4e 1.11.26; emacs 29.1
Date: Thu, 14 Dec 2023 10:34:41 +0000
Message-ID: <87le9x843i.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: dGo0uRBsjqUD

Cleber Rosa <crosa@redhat.com> writes:

> Alex Benn=C3=A9e <alex.bennee@linaro.org> writes:
>
>> Cleber Rosa <crosa@redhat.com> writes:
>>
>>> The tests under machine_aarch64_virt.py do not need read-write access
>>> to the ISOs.  The ones under machine_aarch64_sbsaref.py, on the other
>>> hand, will need read-write access, so let's give each test an unique
>>> file.
>>
>> I think we are making two separate changes here so probably best split
>> the patch.
>>
>
> Sure, but, do you mean separating the "readonly=3Don" and the "writable
> file" changes?  Or separating those two from the ISO url code style
> change?

I was thinking about splitting the sbsaref and virt patches, but
actually they are fairly related as they all use the alpine image so
maybe no need.

>
>>> And while at it, let's use a single code style and hash for the ISO
>>> url.
>>>
>>> Signed-off-by: Cleber Rosa <crosa@redhat.com>
>>> ---
>>>  tests/avocado/machine_aarch64_sbsaref.py |  9 +++++++--
>>>  tests/avocado/machine_aarch64_virt.py    | 14 +++++++-------
>>>  2 files changed, 14 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/tests/avocado/machine_aarch64_sbsaref.py b/tests/avocado/m=
achine_aarch64_sbsaref.py
>>> index 528c7d2934..6ae84d77ac 100644
>>> --- a/tests/avocado/machine_aarch64_sbsaref.py
>>> +++ b/tests/avocado/machine_aarch64_sbsaref.py
>>> @@ -7,6 +7,7 @@
>>>  # SPDX-License-Identifier: GPL-2.0-or-later
>>>=20=20
>>>  import os
>>> +import shutil
>>>=20=20
>>>  from avocado import skipUnless
>>>  from avocado.utils import archive
>>> @@ -123,13 +124,15 @@ def boot_alpine_linux(self, cpu):
>>>=20=20
>>>          iso_hash =3D "5a36304ecf039292082d92b48152a9ec21009d3a62f459de=
623e19c4bd9dc027"
>>>          iso_path =3D self.fetch_asset(iso_url, algorithm=3D"sha256", a=
sset_hash=3Diso_hash)
>>> +        iso_path_rw =3D os.path.join(self.workdir, os.path.basename(is=
o_path))
>>> +        shutil.copy(iso_path, iso_path_rw)
>>>=20=20
>>>          self.vm.set_console()
>>>          self.vm.add_args(
>>>              "-cpu",
>>>              cpu,
>>>              "-drive",
>>> -            f"file=3D{iso_path},format=3Draw",
>>> +            f"file=3D{iso_path_rw},format=3Draw",
>>
>> Instead of copying why not add ",snapshot=3Don" to preserve the original
>> image. We don't want to persist data between tests.

Ahh yes these are isos so snapshot isn't needed.

>>
>>>              "-device",
>>>              "virtio-rng-pci,rng=3Drng0",
>>>              "-object",
>>> @@ -170,13 +173,15 @@ def boot_openbsd73(self, cpu):
>>>=20=20
>>>          img_hash =3D "7fc2c75401d6f01fbfa25f4953f72ad7d7c18650056d3075=
5c44b9c129b707e5"
>>>          img_path =3D self.fetch_asset(img_url, algorithm=3D"sha256", a=
sset_hash=3Dimg_hash)
>>> +        img_path_rw =3D os.path.join(self.workdir, os.path.basename(im=
g_path))
>>> +        shutil.copy(img_path, img_path_rw)
>>>=20=20
>>>          self.vm.set_console()
>>>          self.vm.add_args(
>>>              "-cpu",
>>>              cpu,
>>>              "-drive",
>>> -            f"file=3D{img_path},format=3Draw",
>>> +            f"file=3D{img_path_rw},format=3Draw",
>>
>> ditto.
>>
>>
>>>              "-device",
>>>              "virtio-rng-pci,rng=3Drng0",
>>>              "-object",
>>> diff --git a/tests/avocado/machine_aarch64_virt.py b/tests/avocado/mach=
ine_aarch64_virt.py
>>> index a90dc6ff4b..093d68f837 100644
>>> --- a/tests/avocado/machine_aarch64_virt.py
>>> +++ b/tests/avocado/machine_aarch64_virt.py
>>> @@ -37,13 +37,13 @@ def test_alpine_virt_tcg_gic_max(self):
>>>          :avocado: tags=3Dmachine:virt
>>>          :avocado: tags=3Daccel:tcg
>>>          """
>>> -        iso_url =3D ('https://dl-cdn.alpinelinux.org/'
>>> -                   'alpine/v3.17/releases/aarch64/'
>>> -                   'alpine-standard-3.17.2-aarch64.iso')
>>> +        iso_url =3D (
>>> +            "https://dl-cdn.alpinelinux.org/"
>>> +            "alpine/v3.17/releases/aarch64/alpine-standard-3.17.2-aarc=
h64.iso"
>>> +        )
>>>=20=20
>>> -        # Alpine use sha256 so I recalculated this myself
>>> -        iso_sha1 =3D '76284fcd7b41fe899b0c2375ceb8470803eea839'
>>> -        iso_path =3D self.fetch_asset(iso_url, asset_hash=3Diso_sha1)
>>> +        iso_hash =3D "5a36304ecf039292082d92b48152a9ec21009d3a62f459de=
623e19c4bd9dc027"
>>> +        iso_path =3D self.fetch_asset(iso_url, algorithm=3D"sha256", a=
sset_hash=3Diso_hash)
>>>=20=20
>>>          self.vm.set_console()
>>>          kernel_command_line =3D (self.KERNEL_COMMON_COMMAND_LINE +
>>> @@ -60,7 +60,7 @@ def test_alpine_virt_tcg_gic_max(self):
>>>          self.vm.add_args("-smp", "2", "-m", "1024")
>>>          self.vm.add_args('-bios', os.path.join(BUILD_DIR, 'pc-bios',
>>>                                                 'edk2-aarch64-code.fd'))
>>> -        self.vm.add_args("-drive", f"file=3D{iso_path},format=3Draw")
>>> +        self.vm.add_args("-drive",
>>>          f"file=3D{iso_path},readonly=3Don,format=3Draw")
>>
>> Perhaps we can set ",media=3Dcdrom" here.
>>
>
> Yes, but more importantly, adding both "readonly=3Don" and "media=3Dcdrom"
> to the tests under machine_aarch64_sbsaref.py do the trick.  Now, the
> behavior explained in my previous response still warrants investigation
> IMO.
>
> Thanks
> - Cleber.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
