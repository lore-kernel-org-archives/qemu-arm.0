Received: by 10.223.150.237 with SMTP id u100csp1130336wrb;
        Wed, 8 Nov 2017 02:58:05 -0800 (PST)
X-Google-Smtp-Source: AGs4zMbJdSAQJPB8TAHmk+UvNT2tyLzLC+MvAW6nXD8ImK/c8PwNvA6+GxSHVhRaev9oy1vjamQT
X-Received: by 10.157.46.97 with SMTP id c30mr43193otd.454.1510138685264;
        Wed, 08 Nov 2017 02:58:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510138685; cv=none;
        d=google.com; s=arc-20160816;
        b=F4e0CQw4wuy/VfXGgw5nxulKdWiME/G4HLSGknppTsNRBOk7lyJe3JW65eGP76yND2
         27qqeKm6Fzz2LbaDx9pNZbt74e6/goOZG9wnHnjVbhOlrF6JTmQCgr53Gcq+vUrilP1y
         I8aAf364nv+b9CZb94nlR9g21T9S57ny8xfuqFeEqSx8IjH4ShaAdYIXFTVxEFCIZbZI
         1VBT2U/2EuN5sDaW3F0c5euuU+5TH2dIq2DFCbcCpE36MQEXZbps5AJMF2K9dYWrHRCK
         982qrtR49XvPhk5/31amGiPVZd/G5G/aj/oMViQGC8E5gKl9BcbRGptGph1JqMsr/8mt
         eMkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:arc-authentication-results;
        bh=XK69JaVuqot0VFOe0xBOPznCCSkx0pabY3Hn0ATfL+c=;
        b=HbPMoHHYJKpWDmR9I3khSfLgr40slHJGlWGocdTCvrht1pg/Um/y8+lT7clm0s3Cy/
         xrX1l13BeEa78DDtjGCQirtluiYFQISv1vbSa2Fixxco2gFA9/uVIYIaGy3VtTBbfgLz
         A02grRk6Mo8cD/IOMgmJRHirniujhpWoPcQDu9J0oY123GZazGa6n9VQ28OnGPz0XyGb
         NbsJqSFgxi4j+Js5aPG86ESXT7gKu+w41RpqKuOGBaB8Af/CGSRmHHse+zzLQejdvnqE
         r485HsxkQjQBlDZPMiF+UY3MH4Lzk7bBbYR2Q6g3GQAFCSJUr3a/k6YFtA8DAQwHZHZt
         cvzA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of dave.martin@arm.com designates 217.140.101.70 as permitted sender) smtp.mailfrom=Dave.Martin@arm.com
Return-Path: <Dave.Martin@arm.com>
Received: from foss.arm.com (foss.arm.com. [217.140.101.70])
        by mx.google.com with ESMTP id i39si2001375otb.412.2017.11.08.02.58.04;
        Wed, 08 Nov 2017 02:58:05 -0800 (PST)
Received-SPF: pass (google.com: domain of dave.martin@arm.com designates 217.140.101.70 as permitted sender) client-ip=217.140.101.70;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of dave.martin@arm.com designates 217.140.101.70 as permitted sender) smtp.mailfrom=Dave.Martin@arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4202415A2;
	Wed,  8 Nov 2017 02:58:04 -0800 (PST)
Received: from e103592.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.72.51.249])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 55DA03F3DF;
	Wed,  8 Nov 2017 02:58:03 -0800 (PST)
Date: Wed, 8 Nov 2017 10:58:00 +0000
From: Dave Martin <Dave.Martin@arm.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Subject: Re: [RISU PATCH 10/10] risu_reginfo_aarch64: add SVE support to
 reginfo_dump_mismatch
Message-ID: <20171108105800.GD8971@e103592.cambridge.arm.com>
References: <20171107150558.22131-1-alex.bennee@linaro.org>
 <20171107150558.22131-11-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20171107150558.22131-11-alex.bennee@linaro.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TUID: pK+RG3iqQlIz

On Tue, Nov 07, 2017 at 03:05:58PM +0000, Alex Bennée wrote:
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  risu_reginfo_aarch64.c | 49 +++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 49 insertions(+)
> 
> diff --git a/risu_reginfo_aarch64.c b/risu_reginfo_aarch64.c
> index 7c97790..8aba192 100644
> --- a/risu_reginfo_aarch64.c
> +++ b/risu_reginfo_aarch64.c
> @@ -141,6 +141,18 @@ int reginfo_is_eq(struct reginfo *r1, struct reginfo *r2)
>      return memcmp(r1, r2, sizeof(*r1)) == 0;
>  }
>  
> +#ifdef SVE_MAGIC
> +static int sve_zreg_is_eq(struct reginfo *r1, struct reginfo *r2, int z)
> +{
> +    return memcmp(r1->zregs[z], r2->zregs[z], sizeof(*r1->zregs[z])) == 0;
> +}
> +
> +static int sve_preg_is_eq(struct reginfo *r1, struct reginfo *r2, int p)
> +{
> +    return memcmp(r1->pregs[p], r2->pregs[p], sizeof(*r1->pregs[p])) == 0;
> +}
> +#endif
> +
>  /* reginfo_dump: print state to a stream, returns nonzero on success */
>  int reginfo_dump(struct reginfo *ri, FILE * f)
>  {
> @@ -216,5 +228,42 @@ int reginfo_dump_mismatch(struct reginfo *m, struct reginfo *a, FILE * f)
>          }
>      }
>  
> +#ifdef SVE_MAGIC
> +    if (test_sve) {
> +        if (m->vl != a->vl) {
> +            fprintf(f, "  SVE VL  : %d vs %d\n", m->vl, a->vl);
> +        }
> +        for (i = 0; i < SVE_NUM_PREGS; i++) {
> +           if (!sve_preg_is_eq(m, a, i)) {
> +              int q;
> +              fprintf(f, "  P%2d   : ", i);
> +              for (q = 0; q < sve_vq_from_vl(m->vl); q++) {
> +                 fprintf(f, "%04x", m->pregs[i][q]);
> +              }
> +              fprintf(f, " vs ");
> +              for (q = 0; q < sve_vq_from_vl(m->vl); q++) {
> +                 fprintf(f, "%04x", a->pregs[i][q]);
> +              }
> +              fprintf(f, "\n");
> +            }
> +        }
> +        for (i = 0; i < SVE_NUM_ZREGS; i++) {
> +           if (!sve_zreg_is_eq(m, a, i)) {
> +              int q;
> +              char *pad="";
> +              fprintf(f, "  Z%2d   : ", i);
> +              for (q = 0; q < sve_vq_from_vl(m->vl); q++) {
> +                 if (m->zregs[i][q] != a->zregs[i][q]) {
> +                    fprintf(f, "%sq%02d: %016" PRIx64 "%016" PRIx64 " vs %016" PRIx64 "%016" PRIx64"\n", pad, q,
> +                            (uint64_t) (m->zregs[i][q] >> 64), (uint64_t) m->zregs[i][q],
> +                            (uint64_t) (a->zregs[i][q] >> 64), (uint64_t) a->zregs[i][q]);
> +                    pad = "          ";
> +                 }
> +              }
> +           }
> +        }

No FFR?

Perhaps I should have explicitly encoded FFR as "P16" -- that sort of
works and saves some open-coding of the extra special case, but it feels
less correct.

You could do

static int sve_preg_is_eq(uint16_t const (*p1)[SVE_VQ_MAX],
				uint16_t const (*p2)[SVE_VQ_MAX])
{
	return memcmp(p1, p2, sizeof *p1) == 0;
}

/* ... */

sve_preg_is_eq(&r1->pregs[p], &r2->pregs[p])

/* ... */

sve_preg_is_eq(&r1->ffr, &r2->ffr)

(or some variation on this theme).  ffr is a specialised predicate
register, so I think you can assume that it really does have the same
type as pregs[p].  Coding the above way will give a typcheck error if
not.

Cheers
---Dave
