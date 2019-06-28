Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2173094wru;
        Fri, 28 Jun 2019 00:27:48 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxtnwoPi9o+4r5WnVgkbKlR6nF6MJyovDX/yxkYPN6pTvITtibYEbmCVszqpvegeaz3upeS
X-Received: by 2002:ae9:e8c2:: with SMTP id a185mr7500625qkg.358.1561706868114;
        Fri, 28 Jun 2019 00:27:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561706868; cv=none;
        d=google.com; s=arc-20160816;
        b=c0Uo96GXMR4dG4gHo10QRQnGnt6rwCsmASwHQ5PIGpnFXtv81s1EsDm8GfrxnGpKxh
         MnjWhL5j6O1IOiWnunROobJcrdp+UTwlQcG3m2423Nnn7hxU/MJ00UDpseHITk4A9jq7
         Xjtd2EXPaHnfLI04jBwTAxoV5BgpN3AgmAYbGflz4jdp1hluqaq/so+lIRmjKXB0PCdZ
         Dfm8r1oDiLc9ZBLPh+RkYE28FivmCg8IWKQA33vW9A0eExS4cb7B8oW1XIGj1pxJ/R8n
         N86VVLgSdhST2A1wFO5O/iI+vzOA2dMCVnWanjkSV3P+ycA/d8qB09oWrpat+wUAnLI8
         iOMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=6p6lxr752SKdLGMHIIA7HQU0KbH6i4Hi0QQj862mQxE=;
        b=k+e4rMid6dsRp2x9U7XaUfO9/UJ+GG18LFPu4qIOPo27cqOFlD3LzV4BY+PU4/byxw
         g42yVeFIb+PD4C9iWPRU2ihu686Hqg6A43z8TuC4qyGXIKFdpjOAgpxA63Y01codnZ2h
         1/oAgkbgbS8gjAFNFahX7hHKSJMU/bek9HLoRpvS+S1VNrQ75dLpoQu/fTD5dQbNN/iW
         7AMtZ+ewJdJIK2eSllGH+uxZVlcsR/uaW1HxxPc5yVBvR4v4RcLDyrX5vnD2rHUmMXWe
         UP1uEKIyjCojGYjstOynhMIg1lnk0/pNZiAAHCROPEUXLIi/N33QNzTcqSAsHMZZsA/f
         DI+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id f28si1280871qkl.305.2019.06.28.00.27.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 28 Jun 2019 00:27:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5AC953082A27;
	Fri, 28 Jun 2019 07:27:46 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4EAB160BE0;
	Fri, 28 Jun 2019 07:27:42 +0000 (UTC)
Date: Fri, 28 Jun 2019 09:27:39 +0200
From: Andrew Jones <drjones@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
	armbru@redhat.com, eric.auger@redhat.com, imammedo@redhat.com,
	alex.bennee@linaro.org, Dave.Martin@arm.com
Subject: Re: [Qemu-devel] [PATCH v2 07/14] target/arm/cpu64: max cpu:
 Introduce sve<vl-bits> properties
Message-ID: <20190628072739.5t2o2yqaejn6pyd5@kamzik.brq.redhat.com>
References: <20190621163422.6127-1-drjones@redhat.com>
 <20190621163422.6127-8-drjones@redhat.com>
 <be805987-250d-93a7-7d11-5204f0e16e7b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <be805987-250d-93a7-7d11-5204f0e16e7b@linaro.org>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.45]); Fri, 28 Jun 2019 07:27:47 +0000 (UTC)
X-TUID: spXlWbKuZqj7

On Thu, Jun 27, 2019 at 06:49:02PM +0200, Richard Henderson wrote:
> On 6/21/19 6:34 PM, Andrew Jones wrote:
> > +    /*
> > +     * In sve_vq_map each set bit is a supported vector length of
> > +     * (bit-number + 1) * 16 bytes, i.e. each bit number + 1 is the vector
> > +     * length in quadwords. We need a map size twice the maximum
> > +     * quadword length though because we use two bits for each vector
> > +     * length in order to track three states: uninitialized, off, and on.
> > +     */
> > +    DECLARE_BITMAP(sve_vq_map, ARM_MAX_VQ * 2);
> 
> I don't see that having one continuous bitmap is more convenient than two.
> Indeed, there appear to be several places that would be clearer with two.
> 
> > +static arm_vq_state arm_cpu_vq_map_get(ARMCPU *cpu, int vq)
> > +{
> > +    assert(vq <= ARM_MAX_VQ);
> > +
> > +    return test_bit(vq - 1, cpu->sve_vq_map) |
> > +           test_bit(vq - 1 + ARM_MAX_VQ, cpu->sve_vq_map) << 1;
> > +}
> 
> Neither easier nor more complex w/ one or two bitmaps.
> 
> > +static void arm_cpu_vq_map_init(ARMCPU *cpu)
> > +{
> > +    bitmap_zero(cpu->sve_vq_map, ARM_MAX_VQ * 2);
> > +    bitmap_set(cpu->sve_vq_map, ARM_MAX_VQ, ARM_MAX_VQ);
> > +}
> 
> Clearer with two bitmaps.
> 
> 	bitmap_zero(cpu->sve_vq_map, ARM_MAX_VQ);
> 	bitmap_set(cpu->sve_vq_uninit_map, 0, ARM_MAX_VQ);
> 
> > +static bool arm_cpu_vq_map_is_finalized(ARMCPU *cpu)
> > +{
> > +    DECLARE_BITMAP(map, ARM_MAX_VQ * 2);
> > +
> > +    bitmap_zero(map, ARM_MAX_VQ * 2);
> > +    bitmap_set(map, ARM_MAX_VQ, ARM_MAX_VQ);
> > +    bitmap_and(map, map, cpu->sve_vq_map, ARM_MAX_VQ * 2);
> > +
> > +    return bitmap_empty(map, ARM_MAX_VQ * 2);
> > +}
> 
> Definitely clearer w/ 2 bitmaps,
> 
> 	return bitmap_empty(cpu->sve_vq_uninit_map);

I guess I don't have a strong opinion on one or two bitmaps. I'm not a big
fan of adding temporary variables to data structures (even if the same
amount of storage is being allocated a different way), but I can change
this for v3.

> 
> 
> As for how sve-max-vq=Y and sveX={on,off} interoperate...  I wonder if we can
> just remove cpu->sve_max_vq.  That might simplify your code a bit.
> 
> What if sve-max-vq=Y "expands" to
> 
> 	for (X = 1; X <= Y; X++) { sve(X*128)=on }
> 
> Then you've got a reasonable in-order definition of how those two sets of
> switches interoperate.
> 
> The uses of cpu->sve_max_vq within cpu.c and cpu64.c are all initialization
> stuff that you're replacing.

Hmm, I can look at removing cpu->sve_max_vq, by keeping the property and
expanding it, as you suggest. However I still need a few initialization
states to track what the default vq value should be, so I'm not sure
how I'd implement that without it or some other cpu state, which would
be another temporary cpu state member. Also, while it's true we can always
get the max vq with next-smaller(ARM_MAX_VQ + 1), having it cached in
cpu->sve_max_vq is convenient. That said, I think we'd rather keep it.

> 
> The use within sve_zcr_len_for_el can be replaced by AVR_MAX_VQ.  Your "select
> supported vector size not larger than" code goes at the end of that function,
> such that we select a supported maximum no larger than the raw .LEN values.
> 
> The use within aarch64_sve_narrow_vq should in fact assert that the given vq is
> set within cpu->sve_vq_map.

Yeah, I'm glad Eric pointed out that I had a bug there in the emulation.
I'll get that fixed for v3.

Thanks,
drew
