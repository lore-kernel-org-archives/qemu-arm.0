Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id w80sm27420627wme.17.2016.01.14.07.21.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 14 Jan 2016 07:21:50 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id CE29A3E0040;
	Thu, 14 Jan 2016 15:21:49 +0000 (GMT)
References: <1452783202-576-1-git-send-email-peter.maydell@linaro.org>
User-agent: mu4e 0.9.15; emacs 25.0.50.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, patches@linaro.org, qemu-arm@nongnu.org, Franz-Josef Haider <Franz-Josef.Haider@student.uibk.ac.at>
Subject: Re: [PATCH] disas/libvixl: Really suppress gcc 4.6.3 sign-compare warnings
In-reply-to: <1452783202-576-1-git-send-email-peter.maydell@linaro.org>
Date: Thu, 14 Jan 2016 15:21:49 +0000
Message-ID: <87fuy0chki.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: w0sCUtodwzvS


Peter Maydell <peter.maydell@linaro.org> writes:

> Commit 8acc216b956 attempted to silence some sign-compare
> warnings in libvixl by adding -Wno-sign-compare to the CFLAGS
> for the relevant objects. Unfortunately it was ineffective
> because it was placed before $(QEMU_CFLAGS), so the -Wall in
> the general flags overrode -Wno-sign-compare rather than
> vice-versa. Reorder the flags so the warning suppression works.
>
> Thanks to Franz-Josef Haider <Franz-Josef.Haider@student.uibk.ac.at>
> for pointing out what was wrong with the original patch.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Alex, is there a way to test this patch against Travis before
> we commit it to master?

Mea culpa:

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>

and a conditional:

Tested-by: Alex Bennée <alex.bennee@linaro.org>

when:

https://travis-ci.org/stsquad/qemu/builds/102371704

completes.

>
>  disas/libvixl/Makefile.objs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/disas/libvixl/Makefile.objs b/disas/libvixl/Makefile.objs
> index d1e801a..bbe7695 100644
> --- a/disas/libvixl/Makefile.objs
> +++ b/disas/libvixl/Makefile.objs
> @@ -6,6 +6,6 @@ libvixl_OBJS = vixl/utils.o \
>
>  # The -Wno-sign-compare is needed only for gcc 4.6, which complains about
>  # some signed-unsigned equality comparisons which later gcc versions do not.
> -$(addprefix $(obj)/,$(libvixl_OBJS)): QEMU_CFLAGS := -I$(SRC_PATH)/disas/libvixl -Wno-sign-compare $(QEMU_CFLAGS)
> +$(addprefix $(obj)/,$(libvixl_OBJS)): QEMU_CFLAGS := -I$(SRC_PATH)/disas/libvixl $(QEMU_CFLAGS) -Wno-sign-compare
>
>  common-obj-$(CONFIG_ARM_A64_DIS) += $(libvixl_OBJS)


--
Alex Bennée
