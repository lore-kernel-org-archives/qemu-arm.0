Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2513167wrq;
        Thu, 14 Jun 2018 13:50:16 -0700 (PDT)
X-Received: by 2002:a17:902:6b09:: with SMTP id o9-v6mr4629529plk.256.1529009416629;
        Thu, 14 Jun 2018 13:50:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529009416; cv=none;
        d=google.com; s=arc-20160816;
        b=hbUvR1xf84gASNvhs7D6DsgD1HJK6xHvXP6Tmyfd4X6pdWwLR5c3tYh06Adzs16Q+8
         HmX9ZMW3pY3gWEJj9wIEk6ZjuuBn0XQ6reumvucASvV2kdCFbQvkie0xy7B4cVllaizm
         poipaHL4nAucBbgs++cGNpTZh0rSs12SN0CdTXA/qfsZcKgl4ffa/1MX4334x+y2cNZH
         RCaMfixZ43CFj7e/W8ZmszNE1e3MyBBVkciss8sxzAKr/r1I02g5hbkrPnsyn091kD5D
         96AObaOaaACIxv1hJxIpu6ifzz2qCVc6qaI7P648ZYvu09VWOPFsVL70Mt2G7/ihSKkO
         T8rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=WUO5XdQ75nIliiu+taNpQOR8Wr4HzpCwyrBZkOQ6NFc=;
        b=zs3ozJYti4VyyTtWbpj67ONEVB5glg/fvytekxVSmWOHXiKCRJJ49G2m/5cUw+tDFo
         aNrwBvvMw3XiJpjVyfVo4mlfjVuawslYqkgGDPXOcBFlHe5fznOS+B/3oDm17r9O35Z0
         CjMESmSKWERZUdk0F6Mo2gJlOXRDWDlclMtdRj5R+tp4uFSfcl3bJZfCIBJRHgQDw/wz
         6ZlwCfB6pMftyKQg3ku8vvdystHNKabosi3GeawdgZFgomCAjmudgw20uBLp4UdPm58U
         4UZaK2o4rGgjMdYc4yytzUYbpeAJw8W/6km1w5NvdsuVDOVFW2AfsXXJuQK1GAeaMt4X
         RpVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DKZ3UoyP;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 1-v6sor2103140plw.51.2018.06.14.13.50.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 14 Jun 2018 13:50:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DKZ3UoyP;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=WUO5XdQ75nIliiu+taNpQOR8Wr4HzpCwyrBZkOQ6NFc=;
        b=DKZ3UoyP7a36yiaAlW4JUKIVpOl38Xhqz8utoOEqenOlxPmWuSO34vgbRHwF850/ZJ
         YWvKxw4/kL5jaW253QMJHTiAjokgNCFajH4mRVplkrZv7TGfcKUj0DJ42bvPyNZdClup
         SjspFPDbWNUfwopwu9v7sTPrPHZNcrmazAaBo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=WUO5XdQ75nIliiu+taNpQOR8Wr4HzpCwyrBZkOQ6NFc=;
        b=JW4IsbqEgc506dfKQHWp2QF951lqqnhWlV20Xb1earROTH2msyJHL2S0Snq2lydufQ
         B+hVizzulKV4BFiZm2KEghz75Ofiwozn0BmSFKyITL7lqvInYqPmcNWSZRzkpZdupod4
         Ee1MfnzQXyJI1PJMTcLQL6bxn189v7r084OMY3nDaGge9zaJ/Flqeb8B5CzjMcERUuzJ
         fcgmXDG7v7tg1SsKz7gIzRcsTbw8qWVfHA+i7QhX8S0NJ6uz7Wsd/DT7xbXCHkUNSa2M
         XlaqAjnpQx2+QC3GOEpUTnn/44j6h0CQrKYjmKrWqvPNrqzkn6iXZNdPQqW47IFdi4Aj
         D5Cg==
X-Gm-Message-State: APt69E24v99TTpiRWkFeJ7V/taRaGsrAQ5akv3PurUahrj3vP9wXLKns
	bTdN90YWIxwRd20Zh8xcI7yhoRTp
X-Google-Smtp-Source: ADUXVKLZxWO0wT2P4uUrZP9yMMyKGWY/9wSzH+gKhAUlfn9QnLV6qcgonRSRj5O1a2yZp8YSaexiPw==
X-Received: by 2002:a17:902:6ac7:: with SMTP id i7-v6mr4837144plt.288.1529009416196;
        Thu, 14 Jun 2018 13:50:16 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (rrcs-173-198-77-219.west.biz.rr.com. [173.198.77.219])
        by smtp.gmail.com with ESMTPSA id h84-v6sm9625888pfd.69.2018.06.14.13.50.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 14 Jun 2018 13:50:15 -0700 (PDT)
Subject: Re: [RISU PATCH v3 22/22] risu_reginfo_aarch64: handle variable VQ
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20180613125601.14371-1-alex.bennee@linaro.org>
 <20180613125601.14371-23-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <5306a800-705e-e184-8e30-623dfb29f689@linaro.org>
Date: Thu, 14 Jun 2018 10:50:12 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180613125601.14371-23-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: u0K1D/q8OKFf

On 06/13/2018 02:56 AM, Alex Bennée wrote:
> @@ -147,12 +179,12 @@ void reginfo_init(struct reginfo *ri, ucontext_t *uc)
>          }
>  
>          /* Finally the FFR */
> -        memcpy(&ri->sve.ffr,(void *)sve + SVE_SIG_FFR_OFFSET(vq),
> +        memcpy(&ri->sve.ffr, (void *)sve + SVE_SIG_FFR_OFFSET(vq),
>                 SVE_SIG_FFR_SIZE(vq));
>  
>          return;
>      }
> -#endif
> +#endif /* SVE_MAGIC */

It appears that most of the rest of this patch should be folded back earlier in
the patch set.


r~

>  
>      for (i = 0; i < 32; i++) {
>          ri->simd.vregs[i] = fp->vregs[i];
> @@ -166,32 +198,49 @@ int reginfo_is_eq(struct reginfo *r1, struct reginfo *r2)
>  }
>  
>  #ifdef SVE_MAGIC
> -static int sve_zreg_is_eq(struct reginfo *r1, struct reginfo *r2, int z)
> +static int sve_zreg_is_eq(int vq, const void *z1, const void *z2)
>  {
> -    return memcmp(r1->sve.zregs[z], r2->sve.zregs[z], sizeof(*r1->sve.zregs[z])) == 0;
> +    return memcmp(z1, z2, vq * 16) == 0;
>  }
>  
> -static int sve_preg_is_eq(uint16_t const (*p1)[SVE_VQ_MAX],
> -                          uint16_t const (*p2)[SVE_VQ_MAX])
> +static int sve_preg_is_eq(int vq, const void *p1, const void *p2)
>  {
> -    return memcmp(p1, p2, sizeof *p1) == 0;
> +    return memcmp(p1, p2, vq * 2) == 0;
>  }
>  
> -static void sve_dump_preg_diff(FILE *f, int vq,
> -                               uint16_t const (*p1)[SVE_VQ_MAX],
> -                               uint16_t const (*p2)[SVE_VQ_MAX])
> +static void sve_dump_preg(FILE *f, int vq, const uint16_t *p)
>  {
>      int q;
> -
> -    for (q = 0; q < vq; q++) {
> -       fprintf(f, "%#04x", *p1[q]);
> +    for (q = vq - 1; q >= 0; q--) {
> +        fprintf(f, "%04x", p[q]);
>      }
> +}
> +
> +static void sve_dump_preg_diff(FILE *f, int vq, const uint16_t *p1,
> +                               const uint16_t *p2)
> +{
> +    sve_dump_preg(f, vq, p1);
>      fprintf(f, " vs ");
> -    for (q = 0; q < vq; q++) {
> -       fprintf(f, "%#04x", *p2[q]);
> -    }
> +    sve_dump_preg(f, vq, p2);
>      fprintf(f, "\n");
>  }
> +
> +static void sve_dump_zreg_diff(FILE *f, int vq, const __uint128_t *z1,
> +                               const __uint128_t *z2)
> +{
> +    const char *pad = "";
> +    int q;
> +
> +    for (q = 0; q < vq; ++q) {
> +        if (z1[q] != z2[q]) {
> +            fprintf(f, "%sq%02d: %016" PRIx64 "%016" PRIx64
> +                    " vs %016" PRIx64 "%016" PRIx64"\n", pad, q,
> +                    (uint64_t)(z1[q] >> 64), (uint64_t)z1[q],
> +                    (uint64_t)(z2[q] >> 64), (uint64_t)z2[q]);
> +            pad = "          ";
> +        }
> +    }
> +}
>  #endif
>  
>  /* reginfo_dump: print state to a stream, returns nonzero on success */
> @@ -210,6 +259,36 @@ int reginfo_dump(struct reginfo *ri, FILE * f)
>      fprintf(f, "  fpsr  : %08x\n", ri->fpsr);
>      fprintf(f, "  fpcr  : %08x\n", ri->fpcr);
>  
> +#ifdef SVE_MAGIC
> +    if (test_sve) {
> +        int q, vq = test_sve;
> +
> +        fprintf(f, "  vl    : %d\n", ri->sve.vl);
> +
> +        for (i = 0; i < 32; i++) {
> +            fprintf(f, "  Z%-2d q%-2d: %016" PRIx64 "%016" PRIx64 "\n", i, 0,
> +                    (uint64_t)(ri->sve.zregs[i][0] >> 64),
> +                    (uint64_t)ri->sve.zregs[i][0]);
> +            for (q = 1; q < vq; ++q) {
> +                fprintf(f, "      q%-2d: %016" PRIx64 "%016" PRIx64 "\n", q,
> +                        (uint64_t)(ri->sve.zregs[i][q] >> 64),
> +                        (uint64_t)ri->sve.zregs[i][q]);
> +            }
> +        }
> +
> +        for (i = 0; i < 16; i++) {
> +            fprintf(f, "  P%-2d    : ", i);
> +            sve_dump_preg(f, vq, &ri->sve.pregs[i][0]);
> +            fprintf(f, "\n");
> +        }
> +        fprintf(f, "  FFR    : ");
> +        sve_dump_preg(f, vq, &ri->sve.ffr[0]);
> +        fprintf(f, "\n");
> +
> +        return !ferror(f);
> +    }
> +#endif
> +
>      for (i = 0; i < 32; i++) {
>          fprintf(f, "  V%-2d   : %016" PRIx64 "%016" PRIx64 "\n", i,
>                  (uint64_t) (ri->simd.vregs[i] >> 64),
> @@ -259,42 +338,29 @@ int reginfo_dump_mismatch(struct reginfo *m, struct reginfo *a, FILE * f)
>  
>  #ifdef SVE_MAGIC
>      if (test_sve) {
> -        struct sve_reginfo *ms = &m->sve;
> -        struct sve_reginfo *as = &a->sve;
> +        int vq = sve_vq_from_vl(m->sve.vl);
>  
> -        if (ms->vl != as->vl) {
> -            fprintf(f, "  SVE VL  : %d vs %d\n", ms->vl, as->vl);
> +        if (m->sve.vl != a->sve.vl) {
> +            fprintf(f, "  vl    : %d vs %d\n", m->sve.vl, a->sve.vl);
>          }
>  
> -        if (!sve_preg_is_eq(&ms->ffr, &as->ffr)) {
> -           fprintf(f, "  FFR   : ");
> -           sve_dump_preg_diff(f, sve_vq_from_vl(ms->vl),
> -                              &ms->pregs[i], &as->pregs[i]);
> +        for (i = 0; i < SVE_NUM_ZREGS; i++) {
> +            if (!sve_zreg_is_eq(vq, &m->sve.zregs[i], &a->sve.zregs[i])) {
> +                fprintf(f, "  Z%-2d   : ", i);
> +                sve_dump_zreg_diff(f, vq, &m->sve.zregs[i][0],
> +                                   &a->sve.zregs[i][0]);
> +            }
>          }
>          for (i = 0; i < SVE_NUM_PREGS; i++) {
> -           if (!sve_preg_is_eq(&ms->pregs[i], &as->pregs[i])) {
> -              fprintf(f, "  P%2d   : ", i);
> -              sve_dump_preg_diff(f, sve_vq_from_vl(ms->vl),
> -                                 &ms->pregs[i], &as->pregs[i]);
> -           }
> +            if (!sve_preg_is_eq(vq, &m->sve.pregs[i], &a->sve.pregs[i])) {
> +                fprintf(f, "  P%-2d   : ", i);
> +                sve_dump_preg_diff(f, vq, &m->sve.pregs[i][0],
> +                                   &a->sve.pregs[i][0]);
> +            }
>          }
> -        for (i = 0; i < SVE_NUM_ZREGS; i++) {
> -           if (!sve_zreg_is_eq(m, a, i)) {
> -              int q;
> -              char *pad="";
> -              fprintf(f, "  Z%2d   : ", i);
> -              for (q = 0; q < sve_vq_from_vl(ms->vl); q++) {
> -                 if (ms->zregs[i][q] != as->zregs[i][q]) {
> -                    fprintf(f, "%sq%02d: %016" PRIx64 "%016" PRIx64
> -                            " vs %016" PRIx64 "%016" PRIx64"\n", pad, q,
> -                            (uint64_t) (ms->zregs[i][q] >> 64),
> -                            (uint64_t) ms->zregs[i][q],
> -                            (uint64_t) (as->zregs[i][q] >> 64),
> -                            (uint64_t) as->zregs[i][q]);
> -                    pad = "          ";
> -                 }
> -              }
> -           }
> +        if (!sve_preg_is_eq(vq, &m->sve.ffr, &a->sve.ffr)) {
> +            fprintf(f, "  FFR   : ");
> +            sve_dump_preg_diff(f, vq, &m->sve.pregs[i][0], &a->sve.pregs[i][0]);
>          }
>  
>          return !ferror(f);
> 
