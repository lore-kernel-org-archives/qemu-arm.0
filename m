Return-Path: <alex.bennee@linaro.org>
Received: from draig.lan ([85.9.250.243])
        by smtp.gmail.com with ESMTPSA id v5-20020a05600c444500b0040d6e07a147sm3594165wmn.23.2024.01.10.15.07.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jan 2024 15:07:28 -0800 (PST)
Received: from draig (localhost [IPv6:::1])
	by draig.lan (Postfix) with ESMTP id 3B23C5F785;
	Wed, 10 Jan 2024 23:07:28 +0000 (GMT)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
Cc: Philippe Mathieu-Daud? <philmd@linaro.org>,  <peter.maydell@linaro.org>,
  <qemu-devel@nongnu.org>,  <qemu-arm@nongnu.org>,
  <quic_tsoni@quicinc.com>,  <quic_pheragu@quicinc.com>,
  <quic_eberman@quicinc.com>,  <quic_yvasi@quicinc.com>,
  <quic_cvanscha@quicinc.com>,  <quic_mnalajal@quicinc.com>
Subject: Re: [RFC/PATCH v1 07/11] gunyah: Specify device-tree location
In-Reply-To: <20240110083445.GB1649721@quicinc.com> (Srivatsa Vaddagiri's
	message of "Wed, 10 Jan 2024 14:04:45 +0530")
References: <20240109090039.1636383-1-quic_svaddagi@quicinc.com>
	<20240109090039.1636383-8-quic_svaddagi@quicinc.com>
	<48ca6b12-6838-4788-8484-90621b46d65f@linaro.org>
	<20240110083445.GB1649721@quicinc.com>
User-Agent: mu4e 1.11.27; emacs 29.1
Date: Wed, 10 Jan 2024 23:07:28 +0000
Message-ID: <87ttnkg53j.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: SSx0zBZC1s/g

Srivatsa Vaddagiri <quic_svaddagi@quicinc.com> writes:

> * Philippe Mathieu-Daud? <philmd@linaro.org> [2024-01-09 14:31:03]:
>
>> Hi Srivatsa,
>>=20
>> On 9/1/24 10:00, Srivatsa Vaddagiri wrote:
>> > Specify the location of device-tree and its size, as Gunyah requires t=
he
>> > device-tree to be parsed before VM can begin its execution.
>> >=20
>> > Signed-off-by: Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
>> > ---
>> >   MAINTAINERS               |  1 +
>> >   accel/stubs/gunyah-stub.c |  5 +++++
>> >   hw/arm/virt.c             |  6 ++++++
>> >   include/sysemu/gunyah.h   |  2 ++
>> >   target/arm/gunyah.c       | 45 +++++++++++++++++++++++++++++++++++++=
++
>> >   target/arm/meson.build    |  3 +++
>> >   6 files changed, 62 insertions(+)
>> >   create mode 100644 target/arm/gunyah.c
>>=20
>> (Please enable scripts/git.orderfile)
>
> Sure will do so from the next version!
>
>>=20
>> > diff --git a/include/sysemu/gunyah.h b/include/sysemu/gunyah.h
>> > index 4f26938521..a73d17bfb9 100644
>> > --- a/include/sysemu/gunyah.h
>> > +++ b/include/sysemu/gunyah.h
>> > @@ -27,4 +27,6 @@ typedef struct GUNYAHState GUNYAHState;
>> >   DECLARE_INSTANCE_CHECKER(GUNYAHState, GUNYAH_STATE,
>> >                            TYPE_GUNYAH_ACCEL)
>> > +int gunyah_arm_set_dtb(__u64 dtb_start, __u64 dtb_size);
>> I'm getting:
>>=20
>> In file included from hw/intc/arm_gicv3_common.c:35:
>> include/sysemu/gunyah.h:30:24: error: unknown type name '__u64'
>> int gunyah_arm_set_dtb(__u64 dtb_start, __u64 dtb_size);
>>                        ^
>> include/sysemu/gunyah.h:30:41: error: unknown type name '__u64'
>> int gunyah_arm_set_dtb(__u64 dtb_start, __u64 dtb_size);
>>                                         ^
>> 2 errors generated.
>
> Hmm I don't get that error when compiling on Linux. I think uint64_t will=
 work
> better for all platforms where Qemu can get compiled?

Yes, aside from imported headers we state:

  In the event that you require a specific width, use a standard type
  like int32_t, uint32_t, uint64_t, etc.  The specific types are
  mandatory for VMState fields.

  Don't use Linux kernel internal types like u32, __u32 or __le32.

in style.rst

>
> - vatsa

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro
