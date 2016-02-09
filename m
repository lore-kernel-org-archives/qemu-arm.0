Received: by 10.25.159.19 with SMTP id i19csp2124844lfe;
        Tue, 9 Feb 2016 13:07:17 -0800 (PST)
X-Received: by 10.28.30.198 with SMTP id e189mr6789642wme.60.1455052037315;
        Tue, 09 Feb 2016 13:07:17 -0800 (PST)
Return-Path: <vilanova@ac.upc.edu>
Received: from roura.ac.upc.es (roura.ac.upc.es. [147.83.33.10])
        by mx.google.com with ESMTP id y142si25656543wmd.54.2016.02.09.13.07.16;
        Tue, 09 Feb 2016 13:07:17 -0800 (PST)
Received-SPF: pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) client-ip=147.83.33.10;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of vilanova@ac.upc.edu designates 147.83.33.10 as permitted sender) smtp.mailfrom=vilanova@ac.upc.edu
Received: from gw-2.ac.upc.es (gw-2.ac.upc.es [147.83.30.8])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id u19L6ol5001884;
	Tue, 9 Feb 2016 22:06:50 +0100
Received: from localhost (unknown [84.88.51.85])
	by gw-2.ac.upc.es (Postfix) with ESMTPSA id D8C78819;
	Tue,  9 Feb 2016 22:06:49 +0100 (CET)
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
	<87k2mfvvrn.fsf@linaro.org> <87vb5ygkhw.fsf@fimbulvetr.bsc.es>
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
Date: Tue, 09 Feb 2016 22:06:49 +0100
In-Reply-To: <87vb5ygkhw.fsf@fimbulvetr.bsc.es> (=?utf-8?Q?=22Llu=C3=ADs?=
 Vilanova"'s message of
	"Tue, 09 Feb 2016 13:02:03 +0100")
Message-ID: <87lh6tfv9y.fsf@fimbulvetr.bsc.es>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: 8zh3a1m4Phi2

Llu=C3=ADs Vilanova writes:

> Alex Benn=C3=A9e writes:
>> Llu=C3=ADs Vilanova <vilanova@ac.upc.edu> writes:

>>> The tracing infrastructure later needs to differentiate between regular
>>> pointers and pointers to vCPUs.
>>>=20
>>> Also changes all targets to use the new 'TCGv_cpu' type instead of the
>>> generic 'TCGv_ptr'. As of now, the change is merely cosmetic ('TCGv_cpu'
>>> translates into 'TCGv_ptr'), but that could change in the future to
>>> enforce the difference.
>>>=20
>>> Signed-off-by: Llu=C3=ADs Vilanova <vilanova@ac.upc.edu>
>>> ---
>>> include/qemu/typedefs.h        |    1 +
>>> scripts/tracetool/transform.py |    9 ++++++++-
>>> target-alpha/translate.c       |    2 +-
>>> target-arm/translate.c         |    2 +-
>>> target-arm/translate.h         |    2 +-
>>> target-cris/translate.c        |    2 +-
>>> target-i386/translate.c        |    2 +-
>>> target-lm32/translate.c        |    2 +-
>>> target-m68k/translate.c        |    2 +-
>>> target-microblaze/translate.c  |    2 +-
>>> target-mips/translate.c        |    2 +-
>>> target-moxie/translate.c       |    2 +-
>>> target-openrisc/translate.c    |    2 +-
>>> target-ppc/translate.c         |    2 +-
>>> target-s390x/translate.c       |    2 +-
>>> target-sh4/translate.c         |    2 +-
>>> target-sparc/translate.c       |    5 +++--
>>> target-tilegx/translate.c      |    2 +-
>>> target-tricore/translate.c     |    2 +-
>>> target-unicore32/translate.c   |    2 +-
>>> target-xtensa/translate.c      |    2 +-
>>> tcg/tcg-op.h                   |    2 --
>>> tcg/tcg.h                      |    6 ++++++
>>> trace/control.h                |    3 ++-
>>> 24 files changed, 38 insertions(+), 24 deletions(-)
>>>=20
>>> diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
>>> index 78fe6e8..efbc8a9 100644
[...]
>>> --- a/tcg/tcg.h
>>> +++ b/tcg/tcg.h
>>> @@ -308,6 +308,12 @@ typedef tcg_target_ulong TCGArg;
>>> typedef struct TCGv_i32_d *TCGv_i32;
>>> typedef struct TCGv_i64_d *TCGv_i64;
>>> typedef struct TCGv_ptr_d *TCGv_ptr;
>>> +typedef TCGv_ptr TCGv_cpu;

>> This I understand.

>>> +#if TARGET_LONG_BITS =3D=3D 32
>>> +typedef TCGv_i32 TCGv;
>>> +#else  /* TARGET_LONG_BITS =3D=3D 64 */
>>> +typedef TCGv_i64 TCGv;
>>> +#endif

>> Isn't this an un-related change? It makes sense as a clean-up but should
>> be separate for bisect-ability and documentation.

> I remember the move was to solve a compilation issue. I'll recheck if tha=
t's
> still necessary and get back to you.

It is not necessary anymore. I'll resend a new version with some additional
changes to make it easier to change the arguments injected by the "vcpu"
property (e.g., to make it easier to print the vCPU number & time on traces=
).


Thanks,
  Lluis
