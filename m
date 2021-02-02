Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id 17sm2596904wmk.48.2021.02.02.03.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Feb 2021 03:48:59 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 1BF7B1FF7E;
	Tue,  2 Feb 2021 11:48:59 +0000 (GMT)
References: <20210128185300.2875-1-alex.bennee@linaro.org>
 <CAFEAcA_R3phXwOtj-v-6-oCN891SjGSyAGwcx3_zDf+GFPWLqg@mail.gmail.com>
 <871rdzv9cf.fsf@linaro.org>
 <CAFEAcA8aLBFG9SjVqeDwbcGRU_chkt2s0E1i9BY+xDdXnrfO6Q@mail.gmail.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Anders Roxell <anders.roxell@linaro.org>
Subject: Re: [PATCH] docs/system: document an example vexpress-a15 invocation
Date: Tue, 02 Feb 2021 11:38:24 +0000
In-reply-to: <CAFEAcA8aLBFG9SjVqeDwbcGRU_chkt2s0E1i9BY+xDdXnrfO6Q@mail.gmail.com>
Message-ID: <87sg6eu1uc.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: gf/6aTlwAcRl


Peter Maydell <peter.maydell@linaro.org> writes:

> On Mon, 1 Feb 2021 at 20:09, Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>>
>>
>> Peter Maydell <peter.maydell@linaro.org> writes:
>>
>> > On Thu, 28 Jan 2021 at 18:53, Alex Benn=C3=A9e <alex.bennee@linaro.org=
> wrote:
>> >>
>> >> The wiki and the web are curiously absent of the right runes to boot a
>> >> vexpress model so I had to work from first principles to work it out.
>> >> Use the more modern -drive notation so alternative backends can be
>> >> used (unlike the hardwired -sd mode).
>> >>
>> >> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> >> Cc: Anders Roxell <anders.roxell@linaro.org>
>> >> ---
>> >>  docs/system/arm/vexpress.rst | 26 ++++++++++++++++++++++++++
>> >>  1 file changed, 26 insertions(+)
>> >>
>> >> diff --git a/docs/system/arm/vexpress.rst b/docs/system/arm/vexpress.=
rst
>> >> index 7f1bcbef07..30b1823b95 100644
>> >> --- a/docs/system/arm/vexpress.rst
>> >> +++ b/docs/system/arm/vexpress.rst
>> >> @@ -58,3 +58,29 @@ Other differences between the hardware and the QEM=
U model:
>> >>    ``vexpress-a15``, and have IRQs from 40 upwards. If a dtb is
>> >>    provided on the command line then QEMU will edit it to include
>> >>    suitable entries describing these transports for the guest.
>> >> +
>> >> +Booting a Linux kernel
>> >> +----------------------
>> >> +
>> >> +Building a current Linux kernel with ``multi_v7_defconfig`` should be
>> >> +enough to get something running.
>> >> +
>> >> +.. code-block:: bash
>> >> +
>> >> +  $ export ARCH=3Darm
>> >> +  $ export CROSS_COMPILE=3Darm-linux-gnueabihf-
>> >> +  $ make multi_v7_defconfig
>> >> +  $ make
>> >
>> > We probably shouldn't be recommending in-tree kernel builds, or
>> > polluting the user's environment with random variables. Try:
>> >
>> > $ make O=3Dbuilddir ARCH=3Darm CROSS_COMPILE=3Darm-linux-gnueabihf- mu=
lti_v7_defconfig
>> > $ make O=3Dbuilddir ARCH=3Darm CROSS_COMPILE=3Darm-linux-gnueabihf-
>
>> Building a current Linux kernel with ``multi_v7_defconfig`` should be
>> enough to get something running. Nowadays an out-of-tree build is
>> recommended (and also useful if you build a lot of different targets).
>> $SRC points at root of the linux source tree.
>>
>> .. code-block:: bash
>>
>>   $ mkdir build; cd build
>>   $ make O=3D$(pwd) -C $SRC ARCH=3Darm CROSS_COMPILE=3Darm-linux-gnueabi=
hf- multi_v7_defconfig
>>   $ make O=3D$(pwd) -C $SRC ARCH=3Darm CROSS_COMPILE=3Darm-linux-gnueabi=
hf-
>
> That works, but do you really commonly cd into the build directory?
> I usually sit in the source tree...

Lets just be explicit and teach the user to fish:

Building a current Linux kernel with ``multi_v7_defconfig`` should be
enough to get something running. Nowadays an out-of-tree build is
recommended (and also useful if you build a lot of different targets).
In the following example $BLD points to the build directory and $SRC
points to the root of the Linux source tree. You can drop $SRC if you
are running from there.

.. code-block:: bash

  $ make O=3D$BLD -C $SRC ARCH=3Darm CROSS_COMPILE=3Darm-linux-gnueabihf- m=
ulti_v7_defconfig
  $ make O=3D$BLD -C $SRC ARCH=3Darm CROSS_COMPILE=3Darm-linux-gnueabihf-

>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e
