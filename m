Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1944326wrm;
        Wed, 9 Oct 2019 23:16:09 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxXXIhsdjflWpP7Sdy4Zy8uk1OGzwxbmIV8l6zVRjI2jpM1xqoX1w342Rh2XqJwYthrYOWH
X-Received: by 2002:a6b:f415:: with SMTP id i21mr8658157iog.109.1570688169028;
        Wed, 09 Oct 2019 23:16:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570688169; cv=none;
        d=google.com; s=arc-20160816;
        b=0rR+ZOW7n4mbjw3Phlgq1C8EJpLucHvecN6ACQzfioe1ElBFYbm4kBhyMkQfcKwX2U
         QlzAByDkvQwcB/yiUFKcL0qKJ3eLmXwcQHAcnQha7BI2aXrS/aPjvi+Wl96inPMvQu6J
         iyxu85g4gZ/mEr55VHGnuG2ezubLthoZSXd/DwE6Lc6x07IanhubCwYKznNnvLJX8b4t
         Ml01nYAyl4Yl2/4JOBn/AFdw/XOJ39TsUvtuEdIBrVoVSujh9AurYEeBRS2lU34iiOgI
         eEZ5S6r15sx8mQMhyfsE7RUfhPi/ai7jO4Qo24RAANJryAXdlrw6j5onwqYIBdL7tLJS
         pX3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=M85w9e4SNfMqK294ET9CeCtE7JpqWun/gzqnWR+vcOA=;
        b=ghAAM863UpmkFVfGEMIUpy+qEjqTZM51U2bUSqYENMb53SWYV0/t8Z/q/Mflrdbmjl
         rycaBaK9tsACs+i00IxYxI3BEXzUTiyMJZjaGWlxyxJRO3GxEXRw811W70VI2Qt00Sne
         xyptfOG2IcBoi1Xm48sAd0rgq6UgU5jhKqD+DvV9sZ9iIykpR5yzSTSUprAxLHFyRHHR
         zunVi7+DJ05vQLaR8NWglxjrYqJEPxe4jadKhUm7FPXFzsof5nxmiegHXCQTXZER5//6
         ZJR2FhN7HSanJajFkDRYWVmzAWKUqxC6kTXvwXetNOp8mi+u0zOZsz8PYNfLEVUuK6u6
         VxYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id h8si6791334iop.51.2019.10.09.23.16.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 Oct 2019 23:16:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4706530043E1;
	Thu, 10 Oct 2019 06:16:07 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0BCA85D9E2;
	Thu, 10 Oct 2019 06:16:02 +0000 (UTC)
Date: Thu, 10 Oct 2019 08:16:00 +0200
From: Andrew Jones <drjones@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
	alex.bennee@linaro.org, Dave.Martin@arm.com, eric.auger@redhat.com
Subject: Re: [PATCH v2] target/arm/arch_dump: Add SVE notes
Message-ID: <20191010061600.pwhos4huazbsv6kn@kamzik.brq.redhat.com>
References: <20191004120313.5347-1-drjones@redhat.com>
 <f23153f2-35be-f74d-ad7b-d9c324cba1cf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f23153f2-35be-f74d-ad7b-d9c324cba1cf@linaro.org>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Thu, 10 Oct 2019 06:16:07 +0000 (UTC)
X-TUID: 3hsG4YBXGmCR

On Wed, Oct 09, 2019 at 08:39:21PM -0400, Richard Henderson wrote:
> On 10/4/19 8:03 AM, Andrew Jones wrote:
> > +#ifdef TARGET_AARCH64
> > +static off_t sve_zreg_offset(uint32_t vq, int n)
> > +{
> > +    off_t off = sizeof(struct aarch64_user_sve_header);
> > +    return ROUND_UP(off, 16) + vq * 16 * n;
> > +}
> > +static off_t sve_preg_offset(uint32_t vq, int n)
> > +{
> > +    return sve_zreg_offset(vq, 32) + vq * 16 / 8 * n;
> > +}
> > +static off_t sve_fpsr_offset(uint32_t vq)
> > +{
> > +    off_t off = sve_preg_offset(vq, 17) + offsetof(struct aarch64_note, sve);
> > +    return ROUND_UP(off, 16) - offsetof(struct aarch64_note, sve);
> > +}
> > +static off_t sve_fpcr_offset(uint32_t vq)
> > +{
> > +    return sve_fpsr_offset(vq) + sizeof(uint32_t);
> > +}
> > +static uint32_t sve_current_vq(CPUARMState *env)
> > +{
> > +    return sve_zcr_len_for_el(env, arm_current_el(env)) + 1;
> > +}
> > +static size_t sve_size_vq(uint32_t vq)
> > +{
> > +    off_t off = sve_fpcr_offset(vq) + sizeof(uint32_t) +
> > +                offsetof(struct aarch64_note, sve);
> > +    return ROUND_UP(off, 16) - offsetof(struct aarch64_note, sve);
> > +}
> > +static size_t sve_size(CPUARMState *env)
> > +{
> > +    return sve_size_vq(sve_current_vq(env));
> > +}
> 
> Watch the missing spaces between functions.

I'll put in the blank lines

> 
> > +    for (i = 0; i < 32; ++i) {
> > +#ifdef HOST_WORDS_BIGENDIAN
> > +        uint64_t d[vq * 2];
> > +        int j;
> > +
> > +        for (j = 0; j < vq * 2; ++j) {
> > +            d[j] = bswap64(env->vfp.zregs[i].d[j]);
> > +        }
> > +#else
> > +        uint64_t *d = &env->vfp.zregs[i].d[0];
> > +#endif
> > +        memcpy(&buf[sve_zreg_offset(vq, i)], &d[0], vq * 16);
> > +    }
> 
> We should avoid the variable sized array here.
> 
> It might be best to avoid the ifdef altogether:
> 
>     for (i = 0; i < 32; ++i) {
>         uint64_t *d = (uint64_t *)&buf[sve_zreg_offset(vq, i)];
>         for (j = 0; j < vq * 2; ++j) {
>             d[j] = cpu_to_le64(env->vfp.zregs[i].d[j]);
>         }
>     }
> 
> The compiler may well transform the inner loop to memcpy for little-endian
> host, but even if it doesn't core dumping is hardly performance sensitive.

True. I even had something like the above at first, but then
overcomplicated it with the #ifdef-ing.

Thanks,
drew
