Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id l7sm31276522wjx.14.2016.02.08.11.46.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Feb 2016 11:46:49 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 7CBC63E0241;
	Mon,  8 Feb 2016 19:46:49 +0000 (GMT)
References: <145408497756.24960.12454249118563529425.stgit@localhost> <145408498416.24960.1155193592028104008.stgit@localhost>
User-agent: mu4e 0.9.17; emacs 25.0.90.4
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Llu=C3=ADs?= Vilanova <vilanova@ac.upc.edu>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>, Guan Xuetao <gxt@mprc.pku.edu.cn>, "open list\:ARM" <qemu-arm@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>, Anthony Green <green@moxielogic.com>, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Jia Liu <proljc@gmail.com>, Alexander Graf <agraf@suse.de>, Blue Swirl <blauwirbel@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>, Michael Walle <michael@walle.cc>, Leon Alrae <leon.alrae@imgtec.com>, "open list\:PowerPC" <qemu-ppc@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>, Eric Blake <eblake@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-arm] [PATCH v5 1/2] trace: Add support for vCPU pointers in trace events
In-reply-to: <145408498416.24960.1155193592028104008.stgit@localhost>
Date: Mon, 08 Feb 2016 19:46:49 +0000
Message-ID: <87io1zvvbq.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: GC4nHfc48s3z


Lluís Vilanova <vilanova@ac.upc.edu> writes:

> The tracing infrastructure later needs to differentiate between regular
> pointers and pointers to vCPUs.
>
> Also changes all targets to use the new 'TCGv_cpu' type instead of the
> generic 'TCGv_ptr'. As of now, the change is merely cosmetic ('TCGv_cpu'
> translates into 'TCGv_ptr'), but that could change in the future to
> enforce the difference.
>
> Signed-off-by: Lluís Vilanova <vilanova@ac.upc.edu>
> ---
>  include/qemu/typedefs.h        |    1 +
>  scripts/tracetool/transform.py |    9 ++++++++-
>  target-alpha/translate.c       |    2 +-
>  target-arm/translate.c         |    2 +-
>  target-arm/translate.h         |    2 +-
>  target-cris/translate.c        |    2 +-
>  target-i386/translate.c        |    2 +-
>  target-lm32/translate.c        |    2 +-
>  target-m68k/translate.c        |    2 +-
>  target-microblaze/translate.c  |    2 +-
>  target-mips/translate.c        |    2 +-
>  target-moxie/translate.c       |    2 +-
>  target-openrisc/translate.c    |    2 +-
>  target-ppc/translate.c         |    2 +-
>  target-s390x/translate.c       |    2 +-
>  target-sh4/translate.c         |    2 +-
>  target-sparc/translate.c       |    5 +++--
>  target-tilegx/translate.c      |    2 +-
>  target-tricore/translate.c     |    2 +-
>  target-unicore32/translate.c   |    2 +-
>  target-xtensa/translate.c      |    2 +-
>  tcg/tcg-op.h                   |    2 --
>  tcg/tcg.h                      |    6 ++++++
>  trace/control.h                |    3 ++-
>  24 files changed, 38 insertions(+), 24 deletions(-)
>
> diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
> index 78fe6e8..efbc8a9 100644
> --- a/include/qemu/typedefs.h
> +++ b/include/qemu/typedefs.h
> @@ -18,6 +18,7 @@ typedef struct BusState BusState;
>  typedef struct CharDriverState CharDriverState;
>  typedef struct CompatProperty CompatProperty;
>  typedef struct CPUAddressSpace CPUAddressSpace;
> +typedef struct CPUState CPUState;
>  typedef struct DeviceListener DeviceListener;
>  typedef struct DeviceState DeviceState;
>  typedef struct DisplayChangeListener DisplayChangeListener;
> diff --git a/scripts/tracetool/transform.py b/scripts/tracetool/transform.py
> index fc5e679..8a43a4e 100644
> --- a/scripts/tracetool/transform.py
> +++ b/scripts/tracetool/transform.py
> @@ -6,7 +6,7 @@ Type-transformation rules.
>  """
>
>  __author__     = "Lluís Vilanova <vilanova@ac.upc.edu>"
> -__copyright__  = "Copyright 2012-2014, Lluís Vilanova <vilanova@ac.upc.edu>"
> +__copyright__  = "Copyright 2012-2016, Lluís Vilanova <vilanova@ac.upc.edu>"
>  __license__    = "GPL version 2 or (at your option) any later version"
>
>  __maintainer__ = "Stefan Hajnoczi"
> @@ -74,6 +74,7 @@ TCG_2_HOST = {
>      "TCGv_i32": "uint32_t",
>      "TCGv_i64": "uint64_t",
>      "TCGv_ptr": "void *",
> +    "TCGv_cpu": "CPUState *",
>      None: _tcg_2_host,
>      }
>
> @@ -98,6 +99,7 @@ HOST_2_TCG = {
>      "uint32_t": "TCGv_i32",
>      "uint64_t": "TCGv_i64",
>      "void *"  : "TCGv_ptr",
> +    "CPUState *": "TCGv_cpu",
>      None: _host_2_tcg,
>      }
>
> @@ -115,6 +117,8 @@ TCG_2_TCG_HELPER_DEF = {
<snip>
> +typedef TCGv_ptr TCGv_cpu;
> +#if TARGET_LONG_BITS == 32
> +typedef TCGv_i32 TCGv;
> +#else  /* TARGET_LONG_BITS == 64 */
> +typedef TCGv_i64 TCGv;
> +#endif

BTW something is amiss in the encoding for these patches as
checkpatch.pl barfed on:

+typedef TCGv_ptr TCGv_cpu;
+#if TARGET_LONG_BITS =3D=3D 32
+typedef TCGv_i32 TCGv;
+#else  /* TARGET_LONG_BITS =3D=3D 64 */
+typedef TCGv_i64 TCGv;
+#endif

It might just be your outgoing email gateway being fancy:

X-MIME-Autoconverted: from 8bit to quoted-printable by roura.ac.upc.es
id
        u0TGTjbf023394


--
Alex Bennée
