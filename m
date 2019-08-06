Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp5197095wrv;
        Tue, 6 Aug 2019 05:24:07 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwIySKgGwAOha8ufTLIKVJC/SqCWyer3/T6YasPfS7biekPZ76vtgu1wq9rr5xCOZHbJlcc
X-Received: by 2002:ac8:35ae:: with SMTP id k43mr2689217qtb.259.1565094247868;
        Tue, 06 Aug 2019 05:24:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565094247; cv=none;
        d=google.com; s=arc-20160816;
        b=uBz+nxmogLdgLA2wlB2cmIC3L1ijo8miCkeKFh72K+U93f116TMyA3PljRTHhyryd6
         IQ2vsbib1B4vRCyZednpvZcHMa0wIW7QQVyqo+YlTuIcmb77xTkxvdLrfBW2d4L4QsPP
         BhNOnEwU35F3vaIz9Ysn0s50heop7c3//ofVlIg/Z9UJ8KMifXqoOUz5EVLkMdW+XlnI
         d7oOVMW/wMuxO9wETtdB9pHPfGniksx9gxmNkA+ADSxKWSaRJnYBGE2gaFn6OzH7OVB1
         eurCtEvKrQ+emHpz20zIwnYCrdK7y4WFHDyduzk88L5RtTitnqjwCa4F2pUM2JS/y8mz
         XomA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=PmCjlm6fDQENWSQs2r2bEtQad4ufHwLCA6ho/tmoeY4=;
        b=CqS36imRRlI6yx25/nA4AIkubgdq2++Jgtekd5MrFgNNEJ0ki0cjRGpMnx0rnx2p9w
         p05K0CxFKCnz8Rbjl5bbsabY39fVuTTrTc9m+mvTGBXnjrkCB8mWpo096K9/5ll2vB3P
         0UP0VllanFwHsQHK0d6d2QEig/IVZ8udEss7RpxevXREI/dyLp7LcStNDmKrU4fR12Xe
         crFnBYTufhK4wzcGIRszUGeaCtmEGJBzjMDU53R3+B96Z5HspVw0HCRuf8dn9lKyfo/F
         28MtOGlzd4Q4LEOOKM/RMEGx3k8WMl8LPS9wLP/xOjRtTZgr4YyWJEIR7fM3fQ3LuCm9
         x+Ag==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id u15si49607774qkm.260.2019.08.06.05.24.07
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 Aug 2019 05:24:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0725530EA1A9;
	Tue,  6 Aug 2019 12:24:07 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C50095DA8C;
	Tue,  6 Aug 2019 12:24:02 +0000 (UTC)
Date: Tue, 6 Aug 2019 14:24:00 +0200
From: Andrew Jones <drjones@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
	armbru@redhat.com, eric.auger@redhat.com, imammedo@redhat.com,
	alex.bennee@linaro.org, Dave.Martin@arm.com
Subject: Re: [Qemu-devel] [PATCH v3 11/15] target/arm/kvm64: Add
 kvm_arch_get/put_sve
Message-ID: <20190806122400.omu4b6l6c3s6aquv@kamzik.brq.redhat.com>
References: <20190802122540.26385-1-drjones@redhat.com>
 <20190802122540.26385-12-drjones@redhat.com>
 <e41ee1a4-9514-8fe9-8761-f208c9bdcbf3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e41ee1a4-9514-8fe9-8761-f208c9bdcbf3@linaro.org>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.40]); Tue, 06 Aug 2019 12:24:07 +0000 (UTC)
X-TUID: 18OEjHWiNSAz

On Fri, Aug 02, 2019 at 11:07:54AM -0700, Richard Henderson wrote:
> On 8/2/19 5:25 AM, Andrew Jones wrote:
> > +/*
> > + * SVE registers are encoded in KVM's memory in an endianness-invariant format.
> > + * The byte at offset i from the start of the in-memory representation contains
> > + * the bits [(7 + 8 * i) : (8 * i)] of the register value. As this means the
> > + * lowest offsets are stored in the lowest memory addresses, then that nearly
> > + * matches QEMU's representation, which is to use an array of host-endian
> > + * uint64_t's, where the lower offsets are at the lower indices. To complete
> > + * the translation we just need to byte swap the uint64_t's on big-endian hosts.
> > + */
> > +#ifdef HOST_WORDS_BIGENDIAN
> > +static uint64_t *sve_bswap64(uint64_t *dst, uint64_t *src, int nr)
> > +{
> > +    int i;
> > +
> > +    for (i = 0; i < nr; ++i) {
> > +        dst[i] = bswap64(src[i]);
> > +    }
> > +
> > +    return dst;
> > +}
> > +#endif
> 
> Maybe better as
> 
> static uint64_t *sve_bswap64(uint64_t *tmp, uint64_t *src, int nr)
> {
> #ifdef HOST_WORDS_BIGENDIAN
>     int i;
> 
>     for (i = 0; i < nr; ++i) {
>         tmp[i] = bswap64(src[i]);
>     }
> 
>     return tmp;
> #else
>     return src;
> #endif
> }
> 
> and then the rest of the ifdefs can be removed.

Will do for v4.

> 
> Otherwise,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

Thanks!

drew
