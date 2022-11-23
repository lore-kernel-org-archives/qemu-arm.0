Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([185.81.254.11])
        by smtp.gmail.com with ESMTPSA id j42-20020a05600c1c2a00b003cfb7c02542sm2635729wms.11.2022.11.23.06.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 06:20:25 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id C358F1FFB7;
	Wed, 23 Nov 2022 14:20:24 +0000 (GMT)
References: <20221118113309.1057790-1-alex.bennee@linaro.org>
 <8c4b6387-450d-88af-c1d4-3171a9c3067b@linaro.org>
 <8f6f531f-3ed9-6a14-9ad6-8c0ff6b32c22@redhat.com>
User-agent: mu4e 1.9.3; emacs 28.2.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Cleber Rosa <crosa@redhat.com>, Wainer dos Santos
 Moschetta <wainersm@redhat.com>, Beraldo Leal <bleal@redhat.com>
Subject: Re: [RFC PATCH] tests/avocado: use new rootfs for orangepi test
Date: Wed, 23 Nov 2022 14:12:07 +0000
In-reply-to: <8f6f531f-3ed9-6a14-9ad6-8c0ff6b32c22@redhat.com>
Message-ID: <87fse9bvmf.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: BbM6JN2AG2Rz


Thomas Huth <thuth@redhat.com> writes:

> On 23/11/2022 12.15, Philippe Mathieu-Daud=C3=A9 wrote:
>> On 18/11/22 12:33, Alex Benn=C3=A9e wrote:
>>> The old URL wasn't stable. I suspect the current URL will only be
>>> stable for a few months so maybe we need another strategy for hosting
>>> rootfs snapshots?
>>>
>>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>>> ---
>>> =C2=A0 tests/avocado/boot_linux_console.py | 4 ++--
>>> =C2=A0 1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/tests/avocado/boot_linux_console.py
>>> b/tests/avocado/boot_linux_console.py
>>> index 4c9d551f47..5a2923c423 100644
>>> --- a/tests/avocado/boot_linux_console.py
>>> +++ b/tests/avocado/boot_linux_console.py
>>> @@ -793,8 +793,8 @@ def test_arm_orangepi_sd(self):
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dtb_path =3D
>>> '/usr/lib/linux-image-current-sunxi/sun8i-h3-orangepi-pc.dtb'
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dtb_path =3D sel=
f.extract_from_deb(deb_path, dtb_path)
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rootfs_url =3D
>>> ('http://storage.kernelci.org/images/rootfs/buildroot/'
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'kci-2019.02/arme=
l/base/rootfs.ext2.xz')
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rootfs_hash =3D '692510cb62=
5efda31640d1de0a8d60e26040f061'
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'buildroot-baseli=
ne/20221116.0/armel/rootfs.ext2.xz')
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rootfs_hash =3D 'fae32f337c=
7b87547b10f42599acf109da8b6d9a'
>> If Avocado doesn't find an artifact in its local cache, it will fetch it
>> from the URL.
>> The cache might be populated with artifacts previously downloaded, but
>> their URL is not valid anymore (my case for many tests).
>> We can also add artifacts manually, see [1].
>> I'd rather keep pre-existing tests if possible, to test older
>> (kernel / user-space) images. We don't need to run all the tests all
>> the time:
>> tests can be filtered by tags (see [2]).
>> My preference here is to refactor this test, adding the
>> "kci-2019.02"
>> and "baseline-20221116.0" releases. I can prepare the patch if you /
>> Thomas don't object.
>
> IMHO we shouldn't keep tests in the upstream git repository where the
> binaries are not available in public anymore. They won't get run by
> new contributors anymore, and also could vanish from the disks of the
> people who previously downloaded it, once they wipe their cache or
> upgrade to a new installation, so the test code will sooner or later
> be bitrotting. But if you want to keep the tests around on your hard
> disk, you could also stick the test in a local branch on your hard
> disk instead.

CI/Workstation splits aside I tend to agree with Thomas here that having
tests no one else can run will lead to an accretion of broken tests.
Given the tests themselves are standalone couldn't the prospective test
hoarder keep their own personal repository to be run with the rest of the
in-tree code, something like:

  cd my/test/zoo/repo
  $(QEMU_BUILD)/tests/venv/bin/avocado run my_test_zoo.py

for convenience we could maybe support an env variable so the existing
test selection tags would work:

  set -x QEMU_AVOCADO_EXTRA_TESTS /my/test/zoo/repo
  ./tests/venv/bin/avocado list
  ...
  <list all tests in qemu src tree and extra>
  ...

?

> The other possibility is to upload the binaries to a new public
> location in the web ... but for software that contains GPLed software,
> you should then also make sure to provide the source code to comply
> with the license.

This is the traditional reason we've lent so hard on external hosting
for binaries because the upstream doesn't want the hassle of maintaining
that sort of zoo of binaries. That said we have tests where binaries are
served from fileserver.linaro.org but its then only my problem to deal
with GPL requirements and not the upstream.

--=20
Alex Benn=C3=A9e
