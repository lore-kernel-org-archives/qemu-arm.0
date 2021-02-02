Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id f6sm2582543wmq.33.2021.02.02.04.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Feb 2021 04:13:52 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 5FF831FF7E;
	Tue,  2 Feb 2021 12:13:51 +0000 (GMT)
References: <20210129181319.2992-1-alex.bennee@linaro.org>
 <CAFEAcA9M+J3X1hS6dPrTM-QxGVfLSrP2=VE7cpdJZPovCuzuJg@mail.gmail.com>
User-agent: mu4e 1.5.7; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
 Anders Roxell <anders.roxell@linaro.org>, Aurelien Jarno
 <aurelien@aurel32.net>
Subject: Re: [PATCH] docs/system: document an example booting the
 versatilepb machine
Date: Tue, 02 Feb 2021 12:11:09 +0000
In-reply-to: <CAFEAcA9M+J3X1hS6dPrTM-QxGVfLSrP2=VE7cpdJZPovCuzuJg@mail.gmail.com>
Message-ID: <87pn1iu0ow.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: +2cTiKZp1kP9


Peter Maydell <peter.maydell@linaro.org> writes:

> On Fri, 29 Jan 2021 at 18:13, Alex Benn=C3=A9e <alex.bennee@linaro.org> w=
rote:
>>
>> There is a bit more out there including Aurelien's excellent write up
>> and older Debian images here:
>>
>>   https://www.aurel32.net/info/debian_arm_qemu.php
>>   https://people.debian.org/~aurel32/qemu/armel/
>>
>> However the web is transitory and git is forever so lets add something
>> to the fine manual.
>>
>> Cc: Anders Roxell <anders.roxell@linaro.org>
>> Cc: Aurelien Jarno <aurelien@aurel32.net>
>> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>> ---
>>  docs/system/arm/versatile.rst | 32 ++++++++++++++++++++++++++++++++
>>  1 file changed, 32 insertions(+)
>>
>> diff --git a/docs/system/arm/versatile.rst b/docs/system/arm/versatile.r=
st
>> index 51221c30a4..d16f20ccae 100644
>> --- a/docs/system/arm/versatile.rst
>> +++ b/docs/system/arm/versatile.rst
>> @@ -27,3 +27,35 @@ The Arm Versatile baseboard is emulated with the foll=
owing devices:
>>     devices.
>>
>>  -  PL181 MultiMedia Card Interface with SD card.
>> +
>> +Booting a Linux kernel
>> +----------------------
>> +
>> +Building a current Linux kernel with ``versatile_defconfig`` should be
>> +enough to get something running.
>> +
>> +.. code-block:: bash
>> +
>> +  $ export ARCH=3Darm
>> +  $ export CROSS_COMPILE=3Darm-linux-gnueabihf-
>> +  $ make versatile_defconfig
>> +  $ make
>
> same remarks as for other patch.
>
> Does the 'make' make the right dtb automatically, by the way?
> (I have some notes where I had to tell the kernel to build the
> dtb explicitly, but maybe they are out of date.)

I didn't do anything special and it was there in the build directory. Do
your notes pre-date 2013:

commit cc8e9ad88487004372cae87718ff593d0a2fdc3a
Author: Rob Herring <rob.herring@calxeda.com>
Date:   Wed Mar 13 21:31:42 2013 -0500

    ARM: versatile: add versatile dtbs to dtbs target

    Add the versatile platform dtbs to the dtbs make rule.

    Signed-off-by: Rob Herring <rob.herring@calxeda.com>

>
>> +
>> +You may want to enable some additional modules if you want to boot
>> +something from the SCSI interface::
>> +
>> +  CONFIG_PCI=3Dy
>> +  CONFIG_PCI_VERSATILE=3Dy
>
> It's a bit daft that these aren't in the defconfig, but hey.
>
>> +  CONFIG_SCSI=3Dy
>> +  CONFIG_SCSI_SYM53C8XX_2=3Dy
>> +
>> +You can then boot with a command line like:
>> +
>> +.. code-block:: bash
>> +
>> +  $ qemu-system-arm -machine type=3Dversatilepb \
>> +      -serial mon:stdio \
>> +      -drive if=3Dscsi,driver=3Dfile,filename=3Ddebian-buster-armel-roo=
tfs.ext4 \
>> +      -kernel zImage \
>> +      -dtb versatile-pb.dtb  \
>> +      -append "console=3DttyAMA0 ro root=3D/dev/sda"
>
> thanks
> -- PMM


--=20
Alex Benn=C3=A9e
