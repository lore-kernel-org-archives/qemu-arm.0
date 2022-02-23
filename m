Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id c15sm4339334wrm.109.2022.02.23.02.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 02:14:12 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 8287E1FFB7;
	Wed, 23 Feb 2022 10:14:11 +0000 (GMT)
References: <874k4xbqvp.fsf@linaro.org> <878ru2nacq.fsf@linaro.org>
 <YhURfqMvRT4xbiz6@redhat.com>
 <96bafa75-a0c6-f431-a6d8-fe98d438d0f9@gmail.com>
 <CAFEAcA8ggE0HHXwLAu4vCA=kLwo4moN1CvTJbjph=OTmnfOONg@mail.gmail.com>
 <d26a877d-f3ad-6186-6a22-1e09f93a3fae@gmail.com>
 <20220223084836.yapqj35tiocjios4@sirius.home.kraxel.org>
User-agent: mu4e 1.7.8; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>, Peter Maydell
 <peter.maydell@linaro.org>, Cleber Rosa <cleber@redhat.com>, Beraldo Leal
 <bleal@redhat.com>, =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>, "Michael
 S. Tsirkin" <mst@redhat.com>, qemu-devel <qemu-devel@nongnu.org>, Laszlo
 Ersek <lersek@redhat.com>, Oleg Vasilev <me@svin.in>, Richard Henderson
 <richard.henderson@linaro.org>, Emilio Cota <cota@braap.org>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>, qemu-arm@nongnu.org
 <qemu-arm@nongnu.org>, Paolo
 Bonzini <pbonzini@redhat.com>, Idan Horowitz <idan.horowitz@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Andrew Jones <drjones@redhat.com>
Subject: Re: Analysis of slow distro boots in check-avocado
 (BootLinuxAarch64.test_virt_tcg*)
Date: Wed, 23 Feb 2022 10:10:03 +0000
In-reply-to: <20220223084836.yapqj35tiocjios4@sirius.home.kraxel.org>
Message-ID: <87zgmhlwjw.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: Yxi1oGFQKDGg


Gerd Hoffmann <kraxel@redhat.com> writes:

>   Hi,
>
>> > > If you want to boot a guest using EDK2, you should use the images
>> > > build by your distribution (/usr/share/qemu/edk2-aarch64-code.fd),
>> > > not these images.
>
>> Then we should add edk2-aarch64 and edk2-ovmf to lcitool, to have
>> the distrib images in our generated Docker images.
>>=20
>> Cleber, you added this test in commit 6fd52d671d ("Acceptance test:
>> add "boot_linux" tests"), can you have a look?
>
> Well, it's not *that* simple.  Names are not consistent across
> distributions.  I think if we want go that route we have to inspect
> the *.json files in /usr/share/qemu/firmware to find the correct
> distro firmware images.
>
> Also note that at least fedora ships both verbose and non-verbose
> images ...
>
>     kraxel@sirius ~# rpm -ql edk2-aarch64=20
>     [ ... ]
>     /usr/share/edk2/aarch64/QEMU_EFI-pflash.raw
>     /usr/share/edk2/aarch64/QEMU_EFI-silent-pflash.raw
>     /usr/share/edk2/aarch64/QEMU_EFI.fd
>     /usr/share/edk2/aarch64/QEMU_EFI.silent.fd
>     /usr/share/edk2/aarch64/QEMU_VARS.fd
>     [ ... ]
>     /usr/share/qemu/firmware/60-edk2-aarch64.json
>     /usr/share/qemu/firmware/70-edk2-aarch64-verbose.json
>
> ... so maybe it is an option to use the distro images for the bios
> tables test cases too.

Debian isn't quite so free with it's use of disk space although:

  10:09:19 [root@zen:~] # dpkg -L qemu-efi-aarch64
  /.
  /usr
  /usr/share
  /usr/share/AAVMF
  /usr/share/AAVMF/AAVMF_CODE.fd
  /usr/share/AAVMF/AAVMF_VARS.fd
  /usr/share/doc
  /usr/share/doc/qemu-efi-aarch64
  /usr/share/doc/qemu-efi-aarch64/changelog.Debian.gz
  /usr/share/doc/qemu-efi-aarch64/copyright
  /usr/share/qemu
  /usr/share/qemu/firmware
  /usr/share/qemu/firmware/60-edk2-aarch64.json
  /usr/share/qemu-efi-aarch64
  /usr/share/qemu-efi-aarch64/QEMU_EFI.fd
  10:09:25 [root@zen:~] # md5sum /usr/share/AAVMF/AAVMF_CODE.fd /usr/share/=
qemu-efi-aarch64/QEMU_EFI.fd
  573b65b6e04981abb5b10afc8f30feea  /usr/share/AAVMF/AAVMF_CODE.fd
  99812e842b6b40add0d8f7766e0aac9e  /usr/share/qemu-efi-aarch64/QEMU_EFI.fd
  10:09:37 [root@zen:~] # ls -lh /usr/share/AAVMF/AAVMF_CODE.fd /usr/share/=
qemu-efi-aarch64/QEMU_EFI.fd
  -rw-r--r-- 1 root root  64M Aug 18  2021 /usr/share/AAVMF/AAVMF_CODE.fd
  -rw-r--r-- 1 root root 2.0M Aug 18  2021 /usr/share/qemu-efi-aarch64/QEMU=
_EFI.fd

I think the QEMU_EFI.fd is the firmware and AAVF_CODE is the same
firmware but packaged in the "right" size of flash file.

However if we are to use the distro version (or at least favour it) do
we need to start encoding searches through common paths?

I'm also sympathetic to Peter's point that distros might just end up packag=
ing
what we give them in pc-bios and we'll be back to square one. I'd favour
pc-bios having both a edk2-aarch64-code.fd and a edk2-aarch64-code-debug.fd.

>
> take care,
>   Gerd


--=20
Alex Benn=C3=A9e
