Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id n17sm32035212wrw.0.2020.09.08.06.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 06:20:42 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 9B76B1FF7E;
	Tue,  8 Sep 2020 14:20:41 +0100 (BST)
References: <20200907042000.415931-1-crosa@redhat.com>
 <20200907042000.415931-2-crosa@redhat.com>
 <001385a1-92eb-d311-88b5-8e1e7f6f1f48@redhat.com>
 <20200907093930.GD810755@redhat.com>
 <34814b29-a47a-efd3-971b-520bc5ac6309@redhat.com>
User-agent: mu4e 1.5.5; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, Cleber Rosa
 <crosa@redhat.com>, qemu-devel@nongnu.org, Peter Maydell
 <peter.maydell@linaro.org>, Sarah Harris <S.E.Harris@kent.ac.uk>, Mark
 Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Thomas Huth
 <thuth@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, KONRAD Frederic
 <frederic.konrad@adacore.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Wainer dos Santos Moschetta
 <wainersm@redhat.com>, Aleksandar Markovic
 <aleksandar.qemu.devel@gmail.com>, =?utf-8?Q?Herv=C3=A9?= Poussineau
 <hpoussin@reactos.org>, Antony Pavlov <antonynpavlov@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, Eduardo Habkost
 <ehabkost@redhat.com>, Fabien Chouteau <chouteau@adacore.com>,
 qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>, Pavel Dovgalyuk
 <pavel.dovgaluk@ispras.ru>, Beraldo Leal <bleal@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno
 <aurelien@aurel32.net>
Subject: Re: [PATCH 1/4] Acceptance tests: use an available kernel image
 package for arm
In-reply-to: <34814b29-a47a-efd3-971b-520bc5ac6309@redhat.com>
Date: Tue, 08 Sep 2020 14:20:41 +0100
Message-ID: <87r1rcpfpy.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: ENiYPky5OkII


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 9/7/20 11:39 AM, Daniel P. Berrang=C3=A9 wrote:
>> On Mon, Sep 07, 2020 at 10:06:13AM +0200, Philippe Mathieu-Daud=C3=A9 wr=
ote:
>>> [Cc'ing Daniel who usually have good ideas for that
>>> kind if project-wide problem]
>>>
>>> On 9/7/20 6:19 AM, Cleber Rosa wrote:
>>>> Which means a newer kernel version.  Expected output was changed
>>>> to match the new kernel too.
>>>
>>> Nack.
>>>
>>> Acceptance tests are not to test the latest Linux kernel,
>>> they aim to assert a specific kernel tested by some developer
>>> still works while QEMU evolves.
>>> QEMU doesn't have to adapt to the latest kernel;
>>> QEMU should keep boot an old kernel.
>>>
>>> Testing new kernels is good, you are adding coverage. But
>>> this break the acceptance testing contract "keep testing
>>> the same thing over time".
>>>
>>> The problem you are trying to fix is the "where to keep
>>> assets from public locations where they are being removed?"
>>> one. Two years ago [*] you suggested to use some storage on
>>> the avocado-project.org:
>>>
>>>   For Avocado-VT, there are the JeOS images[1], which we
>>>   keep on a test "assets" directory.  We have a lot of
>>>   storage/bandwidth availability, so it can be used for
>>>   other assets proven to be necessary for tests.
>>>
>>>   As long as distribution rights and licensing are not
>>>   issues, we can definitely use the same server for kernels,
>>>   u-boot images and what not.
>>>
>>>   [1] - https://avocado-project.org/data/assets/
>>=20
>> If I look at stuff under that directory I see a bunch of "Jeos" qcow2
>> images, and zero information about the corresponding source for the
>> images, nor any information about the licenses of software included.
>> IOW what is stored their right now does not appear to comply with the
>> GPL licensing requirements for providing full and corresponding source.
>>=20
>>> It is time to have QEMU assets managed the same way.
>>=20
>> I'd rather we didn't do anything relying on binary blobs with no
>> info about how they were built. Pointing to the 3rd party download
>> URLs was the easy way to ensure we don't have to worry about licensing
>> problems.
>
> I tried to be very strict including the recipe about how to rebuild
> and description of the source (for licensing) in each commits (Alex
> Benn=C3=A9e once said Debian/Fedora based was OK):

Debian and Fedora both have good project hygiene for tracking sources
for their binary packages and extensive archives which we can work with.
These other projects seem to be more of a moving feast which I think is
proving we can't rely on them as a CI test and at best best efforts for
developer testing.

It seems Armbian do document their build process but it's not quite as
easy as just downloading the source deb.

>
<snip>
>
>>=20
>> IIUC, the majority of our acceptance tests needs should be satisfied
>> with a combination of a Linux kernel and busybox tools. We already
>> use cross-compilers to build TCG test cases.
>>=20
>> I'd like to see us provide a minimal "config" file for each Linux
>> kernel combo we need to test. We should be able to define a fairly
>> simple script that do the Linux build, busybox build and then puts
>> the combination of them into a disk image.  Something 100% automated
>> and reviewable.
>
> For Debian/Fedora this config is available in their package (or source
> package).
>
>>=20
>> Even a minimal linux build takes some time, so we would need to cache
>> the binary result in some suitable manner. At least this way we have
>> a clear record of what we're building & how and can thus satisfy the
>> license rules.
>
> Yes, but if the Debian/Fedora build farms already build/published
> their packages, it is easier to use it directly.
>
> QEMU developers are very reluctant to add tests. I suppose we prefer
> to develop or fix bugs rather than write tests. If we ask full build
> recipe for each tests, I doubt we'll have much testing.

I've pondered this before and while it might have a place for random
weird machines with no mainline distro support it's not a path I'm keen
to go down. This goes especially for some of the more esoteric ARM
hardware where you start relying on hacked up vendor trees with very
specific toolchain requirements.

<snip>

--=20
Alex Benn=C3=A9e
