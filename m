Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2223198wru;
        Fri, 28 Jun 2019 01:31:10 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyMhEz9aULn9SQJnShnRRgRVTOES4i8yu2COaZ/0uZ52Gx3UIo2qY1FXWwkTUxauEC7E0g/
X-Received: by 2002:a05:620a:152:: with SMTP id e18mr7489310qkn.101.1561710670703;
        Fri, 28 Jun 2019 01:31:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561710670; cv=none;
        d=google.com; s=arc-20160816;
        b=T6ymVt58+WXx+jwXPSto5NPMpald+E75lL4zCg+XUPfSzKzJMJZOpo+yB95pHYLuRX
         1764ykNVbroVInf7qskBC+yDNDlzuJ3uEA1HlLAlXt6VHKE6rLzeUK/lwxCSrHFjkUce
         r0mhcGw2c44JO/Fkc/+jhzXh4zB1w0Ioz9OJM7qjWQXF7Axt3TrqiaDQ4a0A8N7rpDrX
         2TRxZuZd3x7FlE+O3mfZWazblY6xPI4c4sB3gQYY3T/KkRqW1Uuh5v1eaQWELFBN0y5F
         KSFeVzcPeo3BWuwe64XZG+wtgKV1t94HwvSEVO7yET8Ba8ZFy/bLRuVLnoVvY2cUL1Gh
         SW3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=CrG7h7z5anVa4Ux4cTrff7xw7GtE9j9xZj5hkSnPcKU=;
        b=HeGuAm949Z+1cJwxidIeYRiO5JfvZGGAlqr3er8FmXWpMRU96hvKl10RbJ/prEk3Sf
         omUwX21MyRX1XrjB/s8MqD8wsataDW/nTIILxxxmfz55r5WefD6rbk8AHbOQ19mt0E4e
         tebGAk5EV/ydfEU5Pj219WIaCTQN56ugusc+8GGscD/fV1pJd4x0b0/s9UrB0L1CAAB2
         fiOIGVoZNVS+uBdB2sZoyiCkidD9uEt2aiZqpkN/VrJV+wXCMQ8gHbU1CP5Ww1RWQZ7/
         kCvZFd7KZ1izPndT/A0nId0WF7wDyrEMxcABy1qlWe45sBgqK0AZ47tnXpKaBW+Ns6qx
         PpTw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id y42si1353124qve.78.2019.06.28.01.31.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 28 Jun 2019 01:31:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BEB4B308FC20;
	Fri, 28 Jun 2019 08:31:09 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B9BD41001959;
	Fri, 28 Jun 2019 08:31:03 +0000 (UTC)
Date: Fri, 28 Jun 2019 10:31:01 +0200
From: Andrew Jones <drjones@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, armbru@redhat.com,
	eric.auger@redhat.com, qemu-arm@nongnu.org, imammedo@redhat.com,
	alex.bennee@linaro.org, Dave.Martin@arm.com
Subject: Re: [Qemu-devel] [PATCH v2 07/14] target/arm/cpu64: max cpu:
 Introduce sve<vl-bits> properties
Message-ID: <20190628083101.2dk6henlyiukoz2k@kamzik.brq.redhat.com>
References: <20190621163422.6127-1-drjones@redhat.com>
 <20190621163422.6127-8-drjones@redhat.com>
 <be805987-250d-93a7-7d11-5204f0e16e7b@linaro.org>
 <20190628072739.5t2o2yqaejn6pyd5@kamzik.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190628072739.5t2o2yqaejn6pyd5@kamzik.brq.redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Fri, 28 Jun 2019 08:31:09 +0000 (UTC)
X-TUID: GJrqa6WDn+YN

On Fri, Jun 28, 2019 at 09:27:39AM +0200, Andrew Jones wrote:
> On Thu, Jun 27, 2019 at 06:49:02PM +0200, Richard Henderson wrote:
> > On 6/21/19 6:34 PM, Andrew Jones wrote:
> > > +    /*
> > > +     * In sve_vq_map each set bit is a supported vector length of
> > > +     * (bit-number + 1) * 16 bytes, i.e. each bit number + 1 is the vector
> > > +     * length in quadwords. We need a map size twice the maximum
> > > +     * quadword length though because we use two bits for each vector
> > > +     * length in order to track three states: uninitialized, off, and on.
> > > +     */
> > > +    DECLARE_BITMAP(sve_vq_map, ARM_MAX_VQ * 2);
> > 
> > I don't see that having one continuous bitmap is more convenient than two.
> > Indeed, there appear to be several places that would be clearer with two.
> > 
> > > +static arm_vq_state arm_cpu_vq_map_get(ARMCPU *cpu, int vq)
> > > +{
> > > +    assert(vq <= ARM_MAX_VQ);
> > > +
> > > +    return test_bit(vq - 1, cpu->sve_vq_map) |
> > > +           test_bit(vq - 1 + ARM_MAX_VQ, cpu->sve_vq_map) << 1;
> > > +}
> > 
> > Neither easier nor more complex w/ one or two bitmaps.
> > 
> > > +static void arm_cpu_vq_map_init(ARMCPU *cpu)
> > > +{
> > > +    bitmap_zero(cpu->sve_vq_map, ARM_MAX_VQ * 2);
> > > +    bitmap_set(cpu->sve_vq_map, ARM_MAX_VQ, ARM_MAX_VQ);
> > > +}
> > 
> > Clearer with two bitmaps.
> > 
> > 	bitmap_zero(cpu->sve_vq_map, ARM_MAX_VQ);
> > 	bitmap_set(cpu->sve_vq_uninit_map, 0, ARM_MAX_VQ);
> > 
> > > +static bool arm_cpu_vq_map_is_finalized(ARMCPU *cpu)
> > > +{
> > > +    DECLARE_BITMAP(map, ARM_MAX_VQ * 2);
> > > +
> > > +    bitmap_zero(map, ARM_MAX_VQ * 2);
> > > +    bitmap_set(map, ARM_MAX_VQ, ARM_MAX_VQ);
> > > +    bitmap_and(map, map, cpu->sve_vq_map, ARM_MAX_VQ * 2);
> > > +
> > > +    return bitmap_empty(map, ARM_MAX_VQ * 2);
> > > +}
> > 
> > Definitely clearer w/ 2 bitmaps,
> > 
> > 	return bitmap_empty(cpu->sve_vq_uninit_map);
> 
> I guess I don't have a strong opinion on one or two bitmaps. I'm not a big
> fan of adding temporary variables to data structures (even if the same
> amount of storage is being allocated a different way), but I can change
> this for v3.

On second thought, since in this case there is storage savings (one less
long), then I'd rather we keep it a single bitmap. Maybe I can just add
some comments to these bitmap operations?

Thanks,
drew
