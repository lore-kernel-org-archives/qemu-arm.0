Received: by 10.223.150.237 with SMTP id u100csp1121096wrb;
        Wed, 8 Nov 2017 02:46:40 -0800 (PST)
X-Google-Smtp-Source: ABhQp+SESanqmqz3K8uoJMKB5lI63c1nMgOJNpjHLdM1XOrRbxytbopA81BPPDIF1qXqb5+BZ+KG
X-Received: by 10.202.168.75 with SMTP id r72mr34479oie.342.1510138000527;
        Wed, 08 Nov 2017 02:46:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510138000; cv=none;
        d=google.com; s=arc-20160816;
        b=PhpFa/sVWyKBQFsvyxqo9gz1f/1C/bpYmJxuScBJNlWPGLBnrn85C5LmoQJ4jv1m8b
         YhxQ9rdtM2y6HBblQaardvdjo/Dqw1YeJ+95rbZ8i5aipPbwQ+ggXOhhDVvakO84SdGj
         /MrgRkpkC4l8S7GQQwtahlw7mdeF8zhmKYTLadvu/Uy/0O12hgdaXgFr83yXpUvP5uLE
         sPffPuV5dbyqAVQ6PyWevVFk4QnMeoaYUwnQbIRtP26NBCmuAgxR+sWHlSu+gaUqTX8w
         OXTnyt+/pBLLw/5kwaMHmWkYd09atuxkXG4ORX/fI76tSxK15gktmZl6Iii+e3QJJFsy
         ndNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:arc-authentication-results;
        bh=vZOD0VO8QA/IGZXjeK5wO0ddXnnJCSqt+VWaE6CzAoU=;
        b=u0Sk+/NZXfWFk8Fm+8VgwfXXcfZFFiRJo36tjsUue7Sccs6O1wMq72uDRGalPsx0FR
         l7vQd4Dtrws30AFyyUp8AZPGa7cs40efFbAuJjdsqn73vtTRyH94knQ1oLgDxitjIH1h
         LMngaHx75dZpN0edAFlvbSCleARiQJMs8WBY9Q3BkhyXlpz5cGQj+KrTUoOexXw1qFlm
         gfBW2FNRLK2ugNeP70s6L9vTSEVqincULXinjj9qQ3e6+sMrQ/jAXB3KQ3udr3ZIa9t2
         xYHL5EUPhFDuWj9Uo2pE0kYf2pQifMa/pmJzbmUXzIHr3MYMW7TFe/IEcZn9tv9jgDAj
         sjqg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of dave.martin@arm.com designates 217.140.101.70 as permitted sender) smtp.mailfrom=Dave.Martin@arm.com
Return-Path: <Dave.Martin@arm.com>
Received: from foss.arm.com (foss.arm.com. [217.140.101.70])
        by mx.google.com with ESMTP id f82si1845483oib.486.2017.11.08.02.46.40;
        Wed, 08 Nov 2017 02:46:40 -0800 (PST)
Received-SPF: pass (google.com: domain of dave.martin@arm.com designates 217.140.101.70 as permitted sender) client-ip=217.140.101.70;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of dave.martin@arm.com designates 217.140.101.70 as permitted sender) smtp.mailfrom=Dave.Martin@arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DE5AB14;
	Wed,  8 Nov 2017 02:46:39 -0800 (PST)
Received: from e103592.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.72.51.249])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F27563F3DF;
	Wed,  8 Nov 2017 02:46:38 -0800 (PST)
Date: Wed, 8 Nov 2017 10:46:36 +0000
From: Dave Martin <Dave.Martin@arm.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Subject: Re: [RISU PATCH 09/10] risu_reginfo_aarch64: add reginfo_copy_sve
Message-ID: <20171108104636.GC8971@e103592.cambridge.arm.com>
References: <20171107150558.22131-1-alex.bennee@linaro.org>
 <20171107150558.22131-10-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20171107150558.22131-10-alex.bennee@linaro.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TUID: yXgBw7OIzYsR

On Tue, Nov 07, 2017 at 03:05:57PM +0000, Alex Bennée wrote:
> Add the ability to save SVE registers from the signal context. This is
> controlled with an optional flag --test-sve. The whole thing is
> conditionally compiled when SVE support is in the sigcontext headers.
> 
> Technically SVE registers could be beyond an EXTRA_MAGIC section. I've
> not seen this on the model so currently we abort() if we encounter the
> EXTRA_MAGIC section.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  risu_reginfo_aarch64.c | 74 ++++++++++++++++++++++++++++++++++++++++++++++++++
>  risu_reginfo_aarch64.h |  8 ++++++
>  2 files changed, 82 insertions(+)
> 
> diff --git a/risu_reginfo_aarch64.c b/risu_reginfo_aarch64.c
> index 38ad338..7c97790 100644
> --- a/risu_reginfo_aarch64.c
> +++ b/risu_reginfo_aarch64.c
> @@ -13,12 +13,78 @@
>  #include <stdio.h>
>  #include <ucontext.h>
>  #include <string.h>
> +#include <getopt.h>
> +#include <stdlib.h>
> +#include <stdbool.h>
>  
>  #include "risu.h"
>  #include "risu_reginfo_aarch64.h"
>  
> +#ifndef SVE_MAGIC
>  void *arch_long_opts;
>  char *arch_extra_help;
> +#else
> +/* Should we test SVE register state */
> +static int test_sve;
> +static struct option extra_opts[] = {
> +    {"test-sve", no_argument, &test_sve, 1},
> +    {0, 0, 0, 0}
> +};
> +
> +void *arch_long_opts = &extra_opts[0];
> +char *arch_extra_help = "  --test-sve        Compare SVE registers\n";
> +
> +/* Extra SVE copy function, only called with --test-sve */
> +static void reginfo_copy_sve(struct reginfo *ri, struct _aarch64_ctx *ctx)
> +{
> +    struct sve_context *sve;
> +    int r, vq;
> +    bool found = false;
> +
> +    while (!found) {
> +       switch (ctx->magic)
> +       {
> +          case SVE_MAGIC:
> +             found = true;
> +             break;
> +          case EXTRA_MAGIC:
> +             fprintf(stderr, "%s: found EXTRA_MAGIC\n", __func__);
> +             abort();
> +          case 0:
> +             /* We might not have an SVE context */
> +             fprintf(stderr, "%s: reached end of ctx, no joy (%d)\n", __func__, ctx->size);
> +             return;
> +          default:
> +             ctx = (struct _aarch64_ctx *)((void *)ctx + ctx->size);
> +             break;
> +       }
> +
> +    }
> +
> +    sve = (struct sve_context *) ctx;
> +    ri->vl = sve->vl;
> +    vq = sve_vq_from_vl(sve->vl); /* number of quads for whole vl */
> +
> +    /* Copy ZREG's one at a time */
> +    for (r = 0; r < SVE_NUM_ZREGS; r++) {
> +        memcpy(&ri->zregs[r],
> +               (char *)sve + SVE_SIG_ZREG_OFFSET(vq, r),
> +               SVE_SIG_ZREG_SIZE(vq));
> +    }
> +
> +    /* Copy PREG's one at a time */
> +    for (r = 0; r < SVE_NUM_PREGS; r++) {
> +        memcpy(&ri->pregs[r],
> +               (char *)sve + SVE_SIG_PREG_OFFSET(vq, r),
> +               SVE_SIG_PREG_SIZE(vq));
> +    }
> +
> +    /* Finally the FFR */
> +    memcpy(&ri->ffr,(char *)sve + SVE_SIG_FFR_OFFSET(vq),
> +               SVE_SIG_FFR_SIZE(vq));
> +
> +}
> +#endif
>  
>  /* reginfo_init: initialize with a ucontext */
>  void reginfo_init(struct reginfo *ri, ucontext_t *uc)
> @@ -26,6 +92,7 @@ void reginfo_init(struct reginfo *ri, ucontext_t *uc)
>      int i;
>      struct _aarch64_ctx *ctx;
>      struct fpsimd_context *fp;
> +
>      /* necessary to be able to compare with memcmp later */
>      memset(ri, 0, sizeof(*ri));
>  
> @@ -59,6 +126,13 @@ void reginfo_init(struct reginfo *ri, ucontext_t *uc)
>      for (i = 0; i < 32; i++) {
>          ri->vregs[i] = fp->vregs[i];
>      }
> +

Where do you get uc from?

If it comes straight out of a signal frame that's OK, but if it's copied
around as a ucontext_t or manipulated by getcontext() etc this is going
to go wrong when extra_context is present.

This code may get used by people as a reference, so at least adding a
comment to the effect that this only works on the signal frame would be
a good idea.


When you add support for extra_context, you should probably add a
sanity-check to ensure that the datap pointer really does point to the
right place -- see <asm/sigcontext.h>.

Even though the kernel _should_ never violate this, it can be violated
by ucontext_t manipulation in userspace, so any function that doesn't
know where its ucontext_t came from should do this check.

[...]

Cheers
---Dave
