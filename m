Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 1-20020a05600c228100b0040596352951sm14616524wmf.5.2023.10.23.12.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 12:16:37 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id C5E2C1FFBB;
	Mon, 23 Oct 2023 20:16:36 +0100 (BST)
References: <20231023180837.91785-1-titusr@google.com>
User-agent: mu4e 1.11.22; emacs 29.1.90
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Titus Rwantare <titusr@google.com>
Cc: qemu-arm@nongnu.org, minyard@acm.org, philmd@linaro.org,
 qemu-devel@nongnu.org
Subject: Re: [PATCH v3 0/8] PMBus fixes and new functions
Date: Mon, 23 Oct 2023 20:10:47 +0100
In-reply-to: <20231023180837.91785-1-titusr@google.com>
Message-ID: <874jih40a3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: tWi+Bw3Sn5/Z


Titus Rwantare <titusr@google.com> writes:

> This patch series contains fixes and improvements to PMBus support in QEM=
U.
>
> The following has been added:
>    - Support for block receive
>    - Support for devices with fans
>    - Support for the VCAP register for devices with onboard energy storage
>    - A bitfield struct for the vout mode register, whose bits determine t=
he formatting of several read commands in PMBus
> Fixes:
>    - String read now handles now logs an error when passed an empty string
>
> This series is in preparation for some additional sensors that exercise
> this functionality that will be incoming shortly.

You seem to have missed a number of tags from previous postings:

  https://qemu.readthedocs.io/en/master/devel/submitting-a-patch.html#prope=
r-use-of-reviewed-by-tags-can-aid-review

(although I notice we only mention Reviewed-by in the docs)

You can use a tool like b4 to apply a series and collect the tags. It
will also collect the Message-Id's which are also useful.

Once you've fixed up your tags I think as the maintainer you can submit
a pull request.

>
> Thanks
>
> Changes in v3:
>    - Added fixes to PMBus: page resets and fault clearing
>
> Changes in v2:
>    - Expanded commit descriptions
>    - Added the ADM1266 device model that uses new functions
>
> Titus Rwantare (8):
>   hw/i2c: pmbus add support for block receive
>   hw/i2c: pmbus: add vout mode bitfields
>   hw/i2c: pmbus: add fan support
>   hw/i2c: pmbus: add VCAP register
>   hw/sensor: add ADM1266 device model
>   tests/qtest: add tests for ADM1266
>   hw/i2c: pmbus: immediately clear faults on request
>   hw/i2c: pmbus: reset page register for out of range reads
>
>  hw/arm/Kconfig                |   1 +
>  hw/i2c/pmbus_device.c         | 237 +++++++++++++++++++++++++++++--
>  hw/sensor/Kconfig             |   5 +
>  hw/sensor/adm1266.c           | 254 ++++++++++++++++++++++++++++++++++
>  hw/sensor/meson.build         |   1 +
>  include/hw/i2c/pmbus_device.h |  17 +++
>  tests/qtest/adm1266-test.c    | 123 ++++++++++++++++
>  tests/qtest/max34451-test.c   |  24 ++++
>  tests/qtest/meson.build       |   1 +
>  9 files changed, 653 insertions(+), 10 deletions(-)
>  create mode 100644 hw/sensor/adm1266.c
>  create mode 100644 tests/qtest/adm1266-test.c


--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
