Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp1037358wrv;
        Wed, 17 Jul 2019 08:44:10 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxdTVf30iPKfN6xNzdDkf3O7SpAnTr+yZSTv+2cyRSCQK6d2oMgLP6p7XrQEwuzX3IoASuP
X-Received: by 2002:a37:dcc7:: with SMTP id v190mr27608331qki.169.1563378250725;
        Wed, 17 Jul 2019 08:44:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563378250; cv=none;
        d=google.com; s=arc-20160816;
        b=ZvSqf1qHt338ozaYOtNKvrokX3lotSSz0kvpcPwqXlu9vgJWI5uzUOLRim1N9/UAUL
         aKerHZmQoOwKIOpd3N0eaxWOYVGz3626Vqdh1M330LE0qXRl7XDOqAfeIHTnZhNatTgX
         O0itNJg3xEgDMUlKfc1kl3ld32MVgnzJ3HsQaaoab2T0OmJwmPvRG5vGpaAhhx2+EZsq
         qz/mYJiTE21XgMnRSSOyAuNsqZaEOLTEBNTMwlT5yl5I3tT8QjSVD+q4vK2zh4aZjcGk
         COVyVTGezZWHu+4ns9zsGbM0cv01g0aSfXJ+Fhxe5bCNOlQAVRj7D2zvoN2ixVvYKtOO
         Ot+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=YBajB0t3oT7ylbtUxTiwtOjq8C1tHcn9hcpU20aSGpA=;
        b=sgHdL92Zy6Pk2eTFn3W9/MghXrSdwWt4WW9Sn+rLjSjuD83FDuLDRv8f1Cjl9pwuht
         GN0fZvMud5yS20D1SsGhYXNYMdC50DDRzTTyzyXY2WPcnJloS8cemsTpf4V65vXOlE4F
         KZ4tERN0XM9m4UEEdWIg7vvh3muwCKNzayEa4H7xMNrDBDlU8fd2ji8UW6pCB5pdrLcG
         JtRZbuVeND8grDTxkCJ7m3UDCRJqUPnMi+VVQHxrOW9H0lvzcrsRaJrNusBFjVjLjY/O
         Xcty2JhzfKxY8vpKTa9Up73JbTrWtNeIKOAa9Jsm4YXSuZ7Xh9qFydU+z18WduZT33qN
         oa6w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id t42si17260411qtc.163.2019.07.17.08.44.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 17 Jul 2019 08:44:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 81571307154A;
	Wed, 17 Jul 2019 15:44:09 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 584AC6013A;
	Wed, 17 Jul 2019 15:43:59 +0000 (UTC)
Date: Wed, 17 Jul 2019 17:43:56 +0200
From: Andrew Jones <drjones@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
	armbru@redhat.com, eric.auger@redhat.com, imammedo@redhat.com,
	alex.bennee@linaro.org, Dave.Martin@arm.com
Subject: Re: [Qemu-devel] [PATCH v2 06/14] target/arm: Allow SVE to be
 disabled via a CPU property
Message-ID: <20190717154356.luttlbxudf2pz7ny@kamzik.brq.redhat.com>
References: <20190621163422.6127-1-drjones@redhat.com>
 <20190621163422.6127-7-drjones@redhat.com>
 <c794d810-fbaf-ff81-9833-3e40fb5a951d@linaro.org>
 <20190626135244.2jt6alr7lh2v43nu@kamzik.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190626135244.2jt6alr7lh2v43nu@kamzik.brq.redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.49]); Wed, 17 Jul 2019 15:44:09 +0000 (UTC)
X-TUID: kF0/bdAIg2Nc

On Wed, Jun 26, 2019 at 03:52:44PM +0200, Andrew Jones wrote:
> On Wed, Jun 26, 2019 at 12:20:29PM +0200, Richard Henderson wrote:
> > On 6/21/19 6:34 PM, Andrew Jones wrote:
> > > Since 97a28b0eeac14 ("target/arm: Allow VFP and Neon to be disabled via
> > > a CPU property") we can disable the 'max' cpu model's VFP and neon
> > > features, but there's no way to disable SVE. Add the 'sve=on|off'
> > > property to give it that flexibility. We also rename
> > > cpu_max_get/set_sve_vq to cpu_max_get/set_sve_max_vq in order for them
> > > to follow the typical *_get/set_<property-name> pattern.
> > 
> > I think perhaps the new property should not be overloaded on cpu->sve_max_vq.
> > 
> > At present you are generating an error for
> > 
> >     -cpu max,sve=off,sve_max_vq=2
> > 
> > but not for
> > 
> >     -cpu max,sve_max_vq=2,sve=off
> > 
> > and then there's the issue of
> > 
> >     -cpu max,sve_max_vq=2,sve=off,sve=on
> > 
> > discarding the earlier sve_max_vq setting.
> 
> Yeah, it might be best to add a new boolean in order for that last example
> to work as expected. At least my expectation would be that we'd set the
> max vq to 2, when sve is disabled nothing happens to it, but then when sve
> is reenabled we'll still have that max vq 2. I'm guessing you're expecting
> that too, since you brought it up. I think the other two examples above
> are behaving as I'd expect them to.
> 
> > 
> > 
> > > @@ -1129,6 +1129,14 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
> > >          cpu->isar.mvfr0 = u;
> > >      }
> > >  
> > > +    if (!cpu->sve_max_vq) {
> > > +        uint64_t t;
> > > +
> > > +        t = cpu->isar.id_aa64pfr0;
> > > +        t = FIELD_DP64(t, ID_AA64PFR0, SVE, 0);
> > > +        cpu->isar.id_aa64pfr0 = t;
> > > +    }
> > 
> > 
> > I suppse the isar bits are initialized too late for you to be able to re-use
> > the ID_AA64PFR0.SVE field *as* the property?
> 
> Hmm, that's probably worth trying. Also reworking vfp and neon to use the
> fields as the properties, putting the sanity checks directly in the
> property set accessor may work too. pmu and aarch64 could work like that
> too, but those still have ARM_FEATURE_* bits, so they're not really the
> same [yet].

I played with this for the PMU, i.e. I removed 'has_pmu' and used its bits
in id_aa64dfr0. Everything worked, so it's possible. I think the changes
to convert the PMU, VFP, and NEON are too far outside the scope of this
series to do them now, but I'll attempt to add a has-sve boolean without
adding a "has_sve" boolean in this series by using id_aa64pfr0.

Thanks,
drew
