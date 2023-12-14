Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id m27-20020a05600c3b1b00b0040b38292253sm26513051wms.30.2023.12.14.02.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Dec 2023 02:30:07 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 838705F7D3;
	Thu, 14 Dec 2023 10:30:07 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Cleber Rosa <crosa@redhat.com>
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
  qemu-devel@nongnu.org,  Jiaxun Yang <jiaxun.yang@flygoat.com>,  Radoslaw
 Biernacki <rad@semihalf.com>,  Paul Durrant <paul@xen.org>,  Akihiko Odaki
 <akihiko.odaki@daynix.com>,  Leif Lindholm <quic_llindhol@quicinc.com>,
  Peter Maydell <peter.maydell@linaro.org>,  Paolo Bonzini
 <pbonzini@redhat.com>,  kvm@vger.kernel.org,  qemu-arm@nongnu.org,
  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,  Beraldo Leal
 <bleal@redhat.com>,  Wainer dos Santos Moschetta <wainersm@redhat.com>,
  Sriram Yagnaraman <sriram.yagnaraman@est.tech>,  David Woodhouse
 <dwmw2@infradead.org>
Subject: Re: [PATCH 04/10] tests/avocado: machine aarch64: standardize
 location and RO/RW access
In-Reply-To: <87le9xvmto.fsf@p1.localdomain> (Cleber Rosa's message of "Wed,
	13 Dec 2023 16:01:39 -0500")
References: <20231208190911.102879-1-crosa@redhat.com>
	<20231208190911.102879-5-crosa@redhat.com>
	<2972842d-e4bf-49eb-9d72-01b8049f18bf@linaro.org>
	<87le9xvmto.fsf@p1.localdomain>
User-Agent: mu4e 1.11.26; emacs 29.1
Date: Thu, 14 Dec 2023 10:30:07 +0000
Message-ID: <87r0jp84b4.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: QDDsWQyZG/Bc

Cleber Rosa <crosa@redhat.com> writes:

> Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org> writes:
>
>> W dniu 8.12.2023 o=C2=A020:09, Cleber Rosa pisze:
>>> The tests under machine_aarch64_virt.py do not need read-write access
>>> to the ISOs.  The ones under machine_aarch64_sbsaref.py, on the other
>>> hand, will need read-write access, so let's give each test an unique
>>> file.
>>>=20
>>> And while at it, let's use a single code style and hash for the ISO
>>> url.
>>>=20
>>> Signed-off-by: Cleber Rosa<crosa@redhat.com>
>>
>> It is ISO file, so sbsa-ref tests should be fine with readonly as well.
>>
>> Nothing gets installed so nothing is written. We only test does boot wor=
ks.
>
> That was my original expectation too.  But, with nothing but the
> following change:
>
> diff --git a/tests/avocado/machine_aarch64_sbsaref.py b/tests/avocado/mac=
hine_aarch64_sbsaref.py
> index 528c7d2934..436da4b156 100644
> --- a/tests/avocado/machine_aarch64_sbsaref.py
> +++ b/tests/avocado/machine_aarch64_sbsaref.py
> @@ -129,7 +129,7 @@ def boot_alpine_linux(self, cpu):
>              "-cpu",
>              cpu,
>              "-drive",
> -            f"file=3D{iso_path},format=3Draw",
> +            f"file=3D{iso_path},readonly=3Don,format=3Draw",

               f"file=3D{iso_path},readonly=3Don,media=3Dcdrom,format=3Draw=
",

works (although possible the readonly is redundant in this case).

>              "-device",
>              "virtio-rng-pci,rng=3Drng0",
>              "-object",
>
> We get:
>
> 15:55:10 DEBUG| VM launch command: './qemu-system-aarch64 -display none -=
vga none -chardev socket,id=3Dmon,fd=3D15 -mon chardev=3Dmon,mode=3Dcontrol=
 -machine sbsa-ref -
> chardev socket,id=3Dconsole,fd=3D20 -serial chardev:console -cpu cortex-a=
57 -drive if=3Dpflash,file=3D/home/cleber/avocado/job-results/job-2023-12-1=
3T15.55-28ef2b5/test
> -results/tmp_dirx8p5xzt4/1-tests_avocado_machine_aarch64_sbsaref.py_Aarch=
64SbsarefMachine.test_sbsaref_alpine_linux_cortex_a57/SBSA_FLASH0.fd,format=
=3Draw -drive=20
> if=3Dpflash,file=3D/home/cleber/avocado/job-results/job-2023-12-13T15.55-=
28ef2b5/test-results/tmp_dirx8p5xzt4/1-tests_avocado_machine_aarch64_sbsare=
f.py_Aarch64Sbsa
> refMachine.test_sbsaref_alpine_linux_cortex_a57/SBSA_FLASH1.fd,format=3Dr=
aw -smp 1 -machine sbsa-ref -cpu cortex-a57 -drive file=3D/home/cleber/avoc=
ado/data/cache/b
> y_location/0154b7cd3a4f5e135299060c8cabbeec10b70b6d/alpine-standard-3.17.=
2-aarch64.iso,readonly=3Don,format=3Draw -device virtio-rng-pci,rng=3Drng0 =
-object rng-random
> ,id=3Drng0,filename=3D/dev/urandom'
>
> Followed by:
>
> 15:55:10 DEBUG| Failed to establish session:
>   | Traceback (most recent call last):
>   |   File "/home/cleber/src/qemu/python/qemu/qmp/protocol.py", line 425,=
 in _session_guard
>   |     await coro
>   |   File "/home/cleber/src/qemu/python/qemu/qmp/qmp_client.py", line 25=
3, in _establish_session
>   |     await self._negotiate()
>   |   File "/home/cleber/src/qemu/python/qemu/qmp/qmp_client.py", line 30=
5, in _negotiate
>   |     reply =3D await self._recv()
>   |             ^^^^^^^^^^^^^^^^^^
>   |   File "/home/cleber/src/qemu/python/qemu/qmp/protocol.py", line 1009=
, in _recv
>   |     message =3D await self._do_recv()
>   |               ^^^^^^^^^^^^^^^^^^^^^
>   |   File "/home/cleber/src/qemu/python/qemu/qmp/qmp_client.py", line 40=
2, in _do_recv
>   |     msg_bytes =3D await self._readline()
>   |                 ^^^^^^^^^^^^^^^^^^^^^^
>   |   File "/home/cleber/src/qemu/python/qemu/qmp/protocol.py", line 977,=
 in _readline
>   |     raise EOFError
>   | EOFError
>
> With qemu-system-arch producing on stdout:
>
>    qemu-system-aarch64: Block node is read-only
>
> Any ideas on the reason or cause?
>
> Thanks,
> - Cleber.

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
