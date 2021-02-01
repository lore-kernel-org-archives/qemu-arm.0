Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id v4sm32886653wrw.42.2021.02.01.15.51.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Feb 2021 15:51:50 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id E38941FF7E;
	Mon,  1 Feb 2021 23:51:49 +0000 (GMT)
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
Date: Mon, 01 Feb 2021 23:50:04 +0000
In-reply-to: <CAFEAcA8aLBFG9SjVqeDwbcGRU_chkt2s0E1i9BY+xDdXnrfO6Q@mail.gmail.com>
Message-ID: <87y2g7tkh6.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: sQCUoi+baSwv


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

I have tmux panes, lots of lots of tmux panes. It's more common to live
in the build directories for QEMU because I have to run the binaries I
build. For the kernels I usually have one pane in the tip of source tree
and a bunch of others for build configurations I'm actively messing
about with and rebuilding.

>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e
