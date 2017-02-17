Received: by 10.25.77.65 with SMTP id a62csp187627lfb;
        Fri, 17 Feb 2017 06:05:09 -0800 (PST)
X-Received: by 10.55.95.131 with SMTP id t125mr8374072qkb.279.1487340309840;
        Fri, 17 Feb 2017 06:05:09 -0800 (PST)
Return-Path: <berrange@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id d16si7523864qka.326.2017.02.17.06.05.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 Feb 2017 06:05:09 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of berrange@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=berrange@redhat.com
Received: from int-mx13.intmail.prod.int.phx2.redhat.com (int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id CDFC68047D;
	Fri, 17 Feb 2017 14:05:09 +0000 (UTC)
Received: from redhat.com ([10.42.17.113])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id v1HE56WD021386
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 17 Feb 2017 09:05:08 -0500
Date: Fri, 17 Feb 2017 14:05:05 +0000
From: "Daniel P. Berrange" <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org,
        Marcin Chojnacki <marcinch7@gmail.com>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH] bcm2835_rng: Use qcrypto_random_bytes() rather than
 rand()
Message-ID: <20170217140505.GB11399@redhat.com>
Reply-To: "Daniel P. Berrange" <berrange@redhat.com>
References: <1487334159-19664-1-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1487334159-19664-1-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.7.1 (2016-10-04)
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.28]); Fri, 17 Feb 2017 14:05:09 +0000 (UTC)
X-TUID: c67KkTactNA7

On Fri, Feb 17, 2017 at 12:22:39PM +0000, Peter Maydell wrote:
> Switch to using qcrypto_random_bytes() rather than rand() as
> our source of randomness for the BCM2835 RNG.
> 
> If qcrypto_random_bytes() fails, we don't want to return the guest a
> non-random value in case they're really using it for cryptographic
> purposes, so the best we can do is a fatal error.  This shouldn't
> happen unless something's broken, though.
> 
> In theory we could implement this device's full FIFO and interrupt
> semantics and then just stop filling the FIFO.  That's a lot of work,
> though, and doesn't really give a very nice diagnostic to the user
> since the guest will just seem to hang.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> This patch sits on top of http://patchwork.ozlabs.org/patch/726744/
> (though for review purposes I think it's pretty self explanatory).
> The interesting question here is the failure case handling, where
> we're a bit between a rock and a hard place because we don't have
> a nice way to report it to the guest, but we don't want to return
> a non-random value either...
> 
> We should probably improve crypto/random-platform.c to use
> getentropy() if available, which would fix the "BSD or OSX
> host and not using gcrypt or gnutls" case which I think is
> the most likely cause of qcrypto_random_bytes() failing.

randopm-platform.c currentl uses /dev/urandom or /dev/random,
so that should work when GNUTLS/gcrypt are both disabled at
build time.

What would fail, is uses it from a chroot with an empty /dev
of course.

So we should definitely try getentropy/getrandom as a preferred
approach, falling back to /dev nodes only if those syscalls don't
exist in the current kenrel. Looks like I already put a TODO
comment in the file to this effect.

> 
>  hw/misc/bcm2835_rng.c | 26 +++++++++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/misc/bcm2835_rng.c b/hw/misc/bcm2835_rng.c
> index 2242bc5..bbe903d 100644
> --- a/hw/misc/bcm2835_rng.c
> +++ b/hw/misc/bcm2835_rng.c
> @@ -9,8 +9,32 @@
>  
>  #include "qemu/osdep.h"
>  #include "qemu/log.h"
> +#include "qapi/error.h"
> +#include "crypto/random.h"
>  #include "hw/misc/bcm2835_rng.h"
>  
> +static uint32_t get_random_bytes(void)
> +{
> +    uint32_t res;
> +    Error *err = NULL;
> +
> +    if (qcrypto_random_bytes((uint8_t *)&res, sizeof(res), &err) < 0) {
> +        /* On failure we don't want to return the guest a non-random
> +         * value in case they're really using it for cryptographic
> +         * purposes, so the best we can do is die here.
> +         * This shouldn't happen unless something's broken.
> +         * In theory we could implement this device's full FIFO
> +         * and interrupt semantics and then just stop filling the
> +         * FIFO. That's a lot of work, though, so we assume any
> +         * errors are systematic problems and trust that the check
> +         * on init is sufficient.
> +         */
> +        error_report_err(err);
> +        exit(1);
> +    }
> +    return res;
> +}
> +
>  static uint64_t bcm2835_rng_read(void *opaque, hwaddr offset,
>                                   unsigned size)
>  {
> @@ -27,7 +51,7 @@ static uint64_t bcm2835_rng_read(void *opaque, hwaddr offset,
>          res = s->rng_status | (1 << 24);
>          break;
>      case 0x8:    /* rng_data */
> -        res = rand();
> +        res = get_random_bytes();
>          break;
>  
>      default:

Reviewed-by: Daniel P. Berrange <berrange@redhat.com>

Regards,
Daniel
-- 
|: http://berrange.com      -o-    http://www.flickr.com/photos/dberrange/ :|
|: http://libvirt.org              -o-             http://virt-manager.org :|
|: http://entangle-photo.org       -o-    http://search.cpan.org/~danberr/ :|
