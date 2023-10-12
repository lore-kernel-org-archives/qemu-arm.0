Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id 11-20020a05600c230b00b004053a6b8c41sm19230014wmo.12.2023.10.12.04.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Oct 2023 04:38:07 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id A8B3A1FFBB;
	Thu, 12 Oct 2023 12:38:06 +0100 (BST)
References: <20231011165234.1323725-1-quic_svaddagi@quicinc.com>
 <20231011165234.1323725-4-quic_svaddagi@quicinc.com>
 <d4814468-3b1c-ea34-563e-9418bf1d6220@linaro.org>
User-agent: mu4e 1.11.22; emacs 29.1.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>,
 peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 quic_tsoni@quicinc.com, quic_pheragu@quicinc.com,
 quic_eberman@quicinc.com, quic_yvasi@quicinc.com,
 quic_cvanscha@quicinc.com, quic_mnalajal@quicinc.com
Subject: Re: [RFC/PATCH v0 03/12] gunyah: Basic support
Date: Thu, 12 Oct 2023 12:32:34 +0100
In-reply-to: <d4814468-3b1c-ea34-563e-9418bf1d6220@linaro.org>
Message-ID: <87y1g8m5pd.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: ffX09yJWvh98


Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> writes:

> Hi Srivatsa,
>
> On 11/10/23 18:52, Srivatsa Vaddagiri wrote:
>> Add a new accelerator, gunyah, with basic functionality of creating a
>> VM. Subsequent patches will add support for other functions required to
>> run a VM.
>> Signed-off-by: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
>> ---
>>   MAINTAINERS                     |   7 +++
>>   accel/Kconfig                   |   3 +
>>   accel/gunyah/gunyah-accel-ops.c | 102 ++++++++++++++++++++++++++++++++
>>   accel/gunyah/gunyah-all.c       |  70 ++++++++++++++++++++++
>>   accel/gunyah/meson.build        |   7 +++
>>   accel/meson.build               |   1 +
>>   accel/stubs/gunyah-stub.c       |  13 ++++
>>   accel/stubs/meson.build         |   1 +
>>   docs/about/build-platforms.rst  |   2 +-
>>   hw/arm/virt.c                   |   3 +
>>   include/sysemu/gunyah.h         |  43 ++++++++++++++
>>   include/sysemu/gunyah_int.h     |  27 +++++++++
>>   meson.build                     |   9 +++
>>   meson_options.txt               |   2 +
>>   scripts/meson-buildoptions.sh   |   3 +
>>   target/arm/cpu64.c              |   5 +-
>>   16 files changed, 295 insertions(+), 3 deletions(-)
>>   create mode 100644 accel/gunyah/gunyah-accel-ops.c
>>   create mode 100644 accel/gunyah/gunyah-all.c
>>   create mode 100644 accel/gunyah/meson.build
>>   create mode 100644 accel/stubs/gunyah-stub.c
>>   create mode 100644 include/sysemu/gunyah.h
>>   create mode 100644 include/sysemu/gunyah_int.h
>
> Can we move gunyah_int.h to accel/gunyah/?

If it's all internal to gunyah itself you could rename it to internal.h
(although we do have various forms of foo-internal.h across the code
base).

However I see the reason is the other accelerators have done so:

       accel/hvf/hvf-accel-ops.c
  58:#include "sysemu/hvf_int.h"
       accel/hvf/hvf-all.c
  14:#include "sysemu/hvf_int.h"
       accel/kvm/kvm-accel-ops.c
  20:#include "sysemu/kvm_int.h"
       accel/kvm/kvm-all.c
  31:#include "sysemu/kvm_int.h"

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
