Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id w16sm13554338wmw.6.2016.06.06.03.48.54
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jun 2016 03:48:54 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 497BA3E0358;
	Mon,  6 Jun 2016 11:49:09 +0100 (BST)
User-agent: mu4e 0.9.17; emacs 25.0.94.5
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Andrew Jones <drjones@redhat.com>
Cc: kvm@vger.kernel.org, kvmarm@lists.cs.columbia.edu, pbonzini@redhat.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, andre.przywara@arm.com, peter.maydell@linaro.org, christoffer.dall@linaro.org, marc.zyngier@arm.com
Subject: Re: [kvm-unit-tests PATCH v2 01/10] lib: xstr: allow multiple args
In-reply-to: <1465064165-14885-2-git-send-email-drjones@redhat.com>
Date: Mon, 06 Jun 2016 11:49:09 +0100
Message-ID: <87d1nuiod6.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: TDzZRmTPmh5B


Andrew Jones <drjones@redhat.com> writes:

> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  lib/libcflat.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/lib/libcflat.h b/lib/libcflat.h
> index 582e3fc60e287..e5e588c742763 100644
> --- a/lib/libcflat.h
> +++ b/lib/libcflat.h
> @@ -27,8 +27,8 @@
>
>  #define __unused __attribute__((__unused__))
>
> -#define xstr(s) xxstr(s)
> -#define xxstr(s) #s
> +#define xstr(s...) xxstr(s)
> +#define xxstr(s...) #s

OK my knowledge of stringinfication is still rusty despite having read
the QEMU softmmu code. However:

                printf("Unknown subtest:" xstr(foo,ba) "\n");

Yields:

                Unknown subtestfoo,ba

Is that what you wanted? Or were you aiming for xstr(foo,ba) => fooba

As an aside I couldn't actually see xstr being called with multiple
arguments in the source tree.

>
>  #define __ALIGN_MASK(x, mask)	(((x) + (mask)) & ~(mask))
>  #define __ALIGN(x, a)		__ALIGN_MASK(x, (typeof(x))(a) - 1)


--
Alex Bennée
