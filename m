Received: by 10.25.159.19 with SMTP id i19csp1862240lfe;
        Tue, 9 Feb 2016 04:05:48 -0800 (PST)
X-Received: by 10.107.167.17 with SMTP id q17mr31726372ioe.61.1455019544025;
        Tue, 09 Feb 2016 04:05:44 -0800 (PST)
Return-Path: <vilanova@ac.upc.edu>
Received: from roura.ac.upc.es (roura.ac.upc.edu. [147.83.33.10])
        by mx.google.com with ESMTP id 197si3967815iof.186.2016.02.09.04.05.42;
        Tue, 09 Feb 2016 04:05:43 -0800 (PST)
Received-SPF: pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) client-ip=147.83.33.10;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Received: from gw-2.ac.upc.es (gw-2.ac.upc.es [147.83.30.8])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id u19C5I7I012233;
	Tue, 9 Feb 2016 13:05:18 +0100
Received: from localhost (unknown [84.88.51.85])
	by gw-2.ac.upc.es (Postfix) with ESMTPSA id 3BC73819;
	Tue,  9 Feb 2016 13:05:18 +0100 (CET)
From: =?utf-8?Q?Llu=C3=ADs_Vilanova?= <vilanova@ac.upc.edu>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Richard Henderson <rth@twiddle.net>,
        Stefan Hajnoczi <stefanha@gmail.com>,
        Anthony Green <green@moxielogic.com>,
        Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
        qemu-devel@nongnu.org, Alexander Graf <agraf@suse.de>,
        Blue Swirl <blauwirbel@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
        Michael Walle <michael@walle.cc>,
        "open list\:ARM" <qemu-arm@nongnu.org>,
        "open list\:PowerPC" <qemu-ppc@nongnu.org>,
        Stefan Hajnoczi <stefanha@redhat.com>,
        Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
        Paolo Bonzini <pbonzini@redhat.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
        Leon Alrae <leon.alrae@imgtec.com>,
        Aurelien Jarno <aurelien@aurel32.net>, Jia Liu <proljc@gmail.com>
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH v5 1/2] trace: Add support for vCPU pointers in trace events
References: <145408497756.24960.12454249118563529425.stgit@localhost>
	<145408498416.24960.1155193592028104008.stgit@localhost>
	<87io1zvvbq.fsf@linaro.org>
Mail-Followup-To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell
	<peter.maydell@linaro.org>, Eduardo Habkost <ehabkost@redhat.com>,
	Richard Henderson <rth@twiddle.net>, Stefan Hajnoczi
	<stefanha@gmail.com>, Anthony Green <green@moxielogic.com>, Mark
	Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
	Alexander Graf <agraf@suse.de>, Blue Swirl <blauwirbel@gmail.com>, Max
	Filippov <jcmvbkbc@gmail.com>, Michael Walle <michael@walle.cc>, "open
	list\:ARM" <qemu-arm@nongnu.org>, "open list\:PowerPC"
	<qemu-ppc@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>, Bastian
	Koppelmann <kbastian@mail.uni-paderborn.de>, Paolo Bonzini
	<pbonzini@redhat.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>, Leon Alrae
	<leon.alrae@imgtec.com>, Aurelien Jarno <aurelien@aurel32.net>, Jia
	Liu <proljc@gmail.com>
Date: Tue, 09 Feb 2016 13:05:18 +0100
In-Reply-To: <87io1zvvbq.fsf@linaro.org> ("Alex =?utf-8?Q?Benn=C3=A9e=22's?=
 message of "Mon, 08
	Feb 2016 19:46:49 +0000")
Message-ID: <87mvragkch.fsf@fimbulvetr.bsc.es>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 5hR2GxFZ2tWe

Alex Benn=C3=A9e writes:

> Llu=C3=ADs Vilanova <vilanova@ac.upc.edu> writes:

>> The tracing infrastructure later needs to differentiate between regular
>> pointers and pointers to vCPUs.
>>=20
>> Also changes all targets to use the new 'TCGv_cpu' type instead of the
>> generic 'TCGv_ptr'. As of now, the change is merely cosmetic ('TCGv_cpu'
>> translates into 'TCGv_ptr'), but that could change in the future to
>> enforce the difference.
>>=20
>> Signed-off-by: Llu=C3=ADs Vilanova <vilanova@ac.upc.edu>
>> ---
>> include/qemu/typedefs.h        |    1 +
>> scripts/tracetool/transform.py |    9 ++++++++-
>> target-alpha/translate.c       |    2 +-
>> target-arm/translate.c         |    2 +-
>> target-arm/translate.h         |    2 +-
>> target-cris/translate.c        |    2 +-
>> target-i386/translate.c        |    2 +-
>> target-lm32/translate.c        |    2 +-
>> target-m68k/translate.c        |    2 +-
>> target-microblaze/translate.c  |    2 +-
>> target-mips/translate.c        |    2 +-
>> target-moxie/translate.c       |    2 +-
>> target-openrisc/translate.c    |    2 +-
>> target-ppc/translate.c         |    2 +-
>> target-s390x/translate.c       |    2 +-
>> target-sh4/translate.c         |    2 +-
>> target-sparc/translate.c       |    5 +++--
>> target-tilegx/translate.c      |    2 +-
>> target-tricore/translate.c     |    2 +-
>> target-unicore32/translate.c   |    2 +-
>> target-xtensa/translate.c      |    2 +-
>> tcg/tcg-op.h                   |    2 --
>> tcg/tcg.h                      |    6 ++++++
>> trace/control.h                |    3 ++-
>> 24 files changed, 38 insertions(+), 24 deletions(-)
>>=20
>> diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
>> index 78fe6e8..efbc8a9 100644
>> --- a/include/qemu/typedefs.h
>> +++ b/include/qemu/typedefs.h
>> @@ -18,6 +18,7 @@ typedef struct BusState BusState;
>> typedef struct CharDriverState CharDriverState;
>> typedef struct CompatProperty CompatProperty;
>> typedef struct CPUAddressSpace CPUAddressSpace;
>> +typedef struct CPUState CPUState;
>> typedef struct DeviceListener DeviceListener;
>> typedef struct DeviceState DeviceState;
>> typedef struct DisplayChangeListener DisplayChangeListener;
>> diff --git a/scripts/tracetool/transform.py b/scripts/tracetool/transfor=
m.py
>> index fc5e679..8a43a4e 100644
>> --- a/scripts/tracetool/transform.py
>> +++ b/scripts/tracetool/transform.py
>> @@ -6,7 +6,7 @@ Type-transformation rules.
>> """
>>=20
>> __author__     =3D "Llu=C3=ADs Vilanova <vilanova@ac.upc.edu>"
>> -__copyright__  =3D "Copyright 2012-2014, Llu=C3=ADs Vilanova <vilanova@=
ac.upc.edu>"
>> +__copyright__  =3D "Copyright 2012-2016, Llu=C3=ADs Vilanova <vilanova@=
ac.upc.edu>"
>> __license__    =3D "GPL version 2 or (at your option) any later version"
>>=20
>> __maintainer__ =3D "Stefan Hajnoczi"
>> @@ -74,6 +74,7 @@ TCG_2_HOST =3D {
>> "TCGv_i32": "uint32_t",
>> "TCGv_i64": "uint64_t",
>> "TCGv_ptr": "void *",
>> +    "TCGv_cpu": "CPUState *",
>> None: _tcg_2_host,
>> }
>>=20
>> @@ -98,6 +99,7 @@ HOST_2_TCG =3D {
>> "uint32_t": "TCGv_i32",
>> "uint64_t": "TCGv_i64",
>> "void *"  : "TCGv_ptr",
>> +    "CPUState *": "TCGv_cpu",
>> None: _host_2_tcg,
>> }
>>=20
>> @@ -115,6 +117,8 @@ TCG_2_TCG_HELPER_DEF =3D {
> <snip>
>> +typedef TCGv_ptr TCGv_cpu;
>> +#if TARGET_LONG_BITS =3D=3D 32
>> +typedef TCGv_i32 TCGv;
>> +#else  /* TARGET_LONG_BITS =3D=3D 64 */
>> +typedef TCGv_i64 TCGv;
>> +#endif

> BTW something is amiss in the encoding for these patches as
> checkpatch.pl barfed on:

> +typedef TCGv_ptr TCGv_cpu;
> +#if TARGET_LONG_BITS =3D3D=3D3D 32
> +typedef TCGv_i32 TCGv;
> +#else  /* TARGET_LONG_BITS =3D3D=3D3D 64 */
> +typedef TCGv_i64 TCGv;
> +#endif

> It might just be your outgoing email gateway being fancy:

> X-MIME-Autoconverted: from 8bit to quoted-printable by roura.ac.upc.es
> id
>         u0TGTjbf023394

Hummm, checkpatch is not complaining on my end, so I guess it really is the
email gateway. Any idea how to avoid that?


Thanks,
  Lluis
