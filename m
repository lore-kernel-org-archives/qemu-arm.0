Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id c185sm16636612wma.5.2016.01.12.08.35.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 12 Jan 2016 08:35:33 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id DFF3E3E04B4;
	Tue, 12 Jan 2016 16:35:32 +0000 (GMT)
References: <1452604204-27202-1-git-send-email-peter.maydell@linaro.org>
User-agent: mu4e 0.9.15; emacs 25.0.50.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, patches@linaro.org, qemu-arm@nongnu.org
Subject: Re: [PATCH] disas/libvixl: Suppress gcc 4.6.3 sign-compare warnings
In-reply-to: <1452604204-27202-1-git-send-email-peter.maydell@linaro.org>
Date: Tue, 12 Jan 2016 16:35:32 +0000
Message-ID: <87r3hmdacr.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: w+QYxhhEGNuF


Peter Maydell <peter.maydell@linaro.org> writes:

> The VIXL code includes some equality comparisons between signed
> and unsigned types. Modern gcc and clang do not complain about
> these, but older versions of gcc such as gcc 4.6.3 do. Since
> libvixl is an upstream library, the simplest approach is to
> suppress the warnings by applying -Wno-sign-compare to the
> relevant files.
>
> (GCC 4.6 is not quite yet irrelevant for us; it is the gcc
> shipped with Ubuntu Precise, for example, which is an LTS
> release not yet out of its support period.)
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I had mistakenly thought these warnings only happened with
> the totally ancient mingw gcc, but it turns out they're a
> bit more widespread. In particular this is causing our
> Travis builds to fail:
>   https://travis-ci.org/qemu/qemu/jobs/101813358
>
> If somebody could review this then I'll apply it to master
> as a buildfix.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

> ---
>  disas/Makefile.objs         | 5 ++++-
>  disas/libvixl/Makefile.objs | 4 +++-
>  2 files changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/disas/Makefile.objs b/disas/Makefile.objs
> index 8dae4da..abeba84 100644
> --- a/disas/Makefile.objs
> +++ b/disas/Makefile.objs
> @@ -4,7 +4,10 @@ common-obj-$(CONFIG_ARM_DIS) += arm.o
>  common-obj-$(CONFIG_ARM_A64_DIS) += arm-a64.o
>  common-obj-$(CONFIG_ARM_A64_DIS) += libvixl/
>  libvixldir = $(SRC_PATH)/disas/libvixl
> -arm-a64.o-cflags := -I$(libvixldir)
> +# The -Wno-sign-compare is needed only for gcc 4.6, which complains about
> +# some signed-unsigned equality comparisons in libvixl which later gcc
> +# versions do not.
> +arm-a64.o-cflags := -I$(libvixldir) -Wno-sign-compare
>  common-obj-$(CONFIG_CRIS_DIS) += cris.o
>  common-obj-$(CONFIG_HPPA_DIS) += hppa.o
>  common-obj-$(CONFIG_I386_DIS) += i386.o
> diff --git a/disas/libvixl/Makefile.objs b/disas/libvixl/Makefile.objs
> index e373cf0..d1e801a 100644
> --- a/disas/libvixl/Makefile.objs
> +++ b/disas/libvixl/Makefile.objs
> @@ -4,6 +4,8 @@ libvixl_OBJS = vixl/utils.o \
>                 vixl/a64/decoder-a64.o \
>                 vixl/a64/disasm-a64.o
>
> -$(addprefix $(obj)/,$(libvixl_OBJS)): QEMU_CFLAGS := -I$(SRC_PATH)/disas/libvixl $(QEMU_CFLAGS)
> +# The -Wno-sign-compare is needed only for gcc 4.6, which complains about
> +# some signed-unsigned equality comparisons which later gcc versions do not.
> +$(addprefix $(obj)/,$(libvixl_OBJS)): QEMU_CFLAGS := -I$(SRC_PATH)/disas/libvixl -Wno-sign-compare $(QEMU_CFLAGS)
>
>  common-obj-$(CONFIG_ARM_A64_DIS) += $(libvixl_OBJS)


--
Alex Bennée
