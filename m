Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp86386wru;
        Wed, 26 Jun 2019 06:52:54 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw039gcJp8x7y8jf4KF96qMIe4ORZmdpxINw6uFTIZVYBl1Te/rWIgeYwCPQLzJxKaNhTAR
X-Received: by 2002:ac8:25fb:: with SMTP id f56mr3787936qtf.30.1561557174227;
        Wed, 26 Jun 2019 06:52:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561557174; cv=none;
        d=google.com; s=arc-20160816;
        b=pHL4FArQGvnBV6wBGFmQkSMr3DyOfJjH39WBjsOf4zKevXWXEkWj/QPzHSH1COz3N0
         VjPy4nPOHD7m4ZaL99s+XiDGCmwLj9uCJmNInD+zOtkbqIcGDZcBVwKp08jOZCGvzVjr
         DG4lh4Spk5W4k8KCXF2s3okH4jJ6pUdbWs9NJBC9vkaWIlH+DXDermz+UFnTh5qPsqql
         qU3b9btHG3G9LgAtGKd/TjmSO8LCH1G/Sz+p5bYtBOYQJ+DeTUiU0TGihY4E8XbrABxQ
         4zKX0isaTVXJGoPvJrtk2waOv/5JutAHo8sJdYDPfhdYn6yhErzpQcTyAMPubDrqQb7Z
         1nyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=csjc3d6rqDxRP9SBCONY2Ej/BjrxQ1X6WRtAwU7B42U=;
        b=Df0EDnmKKbAx4e4JzhX2aRXGKiISKkckwJ5DSwcILChsZxS6JHrnXJGuWIG3iv8FMs
         srXtB6Az/kB+ZF+Hdse9nkBzigWl+NoNaH58qcAsnlJmZcdMrsYH2o4+Y2kopC/EA4dV
         apl4ruzHDwolKzP66pNuN50eg+KPijqQFB62lM3QDb3DyvVBF25hdJd4VOb3WLvpbRUq
         /eCJ4zsTQfFxc9DcFXdMOB0qtnzAcRN4pGjF3nhnOXBu2PEuIs+UnMMCOidz3/brXOE3
         NAZ1MUNgTu09/R4IFOcOmUIPfgF6y17jEdltYNtpN5irU6AsGR0wZoSKnkNkY+p0vgJA
         qnrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id f204si11042459qke.8.2019.06.26.06.52.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Jun 2019 06:52:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 95032C1EB1E1;
	Wed, 26 Jun 2019 13:52:52 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 41C795D719;
	Wed, 26 Jun 2019 13:52:47 +0000 (UTC)
Date: Wed, 26 Jun 2019 15:52:44 +0200
From: Andrew Jones <drjones@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
	armbru@redhat.com, eric.auger@redhat.com, imammedo@redhat.com,
	alex.bennee@linaro.org, Dave.Martin@arm.com
Subject: Re: [Qemu-devel] [PATCH v2 06/14] target/arm: Allow SVE to be
 disabled via a CPU property
Message-ID: <20190626135244.2jt6alr7lh2v43nu@kamzik.brq.redhat.com>
References: <20190621163422.6127-1-drjones@redhat.com>
 <20190621163422.6127-7-drjones@redhat.com>
 <c794d810-fbaf-ff81-9833-3e40fb5a951d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c794d810-fbaf-ff81-9833-3e40fb5a951d@linaro.org>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.32]); Wed, 26 Jun 2019 13:52:52 +0000 (UTC)
X-TUID: qGa5EMMlUK7R

On Wed, Jun 26, 2019 at 12:20:29PM +0200, Richard Henderson wrote:
> On 6/21/19 6:34 PM, Andrew Jones wrote:
> > Since 97a28b0eeac14 ("target/arm: Allow VFP and Neon to be disabled via
> > a CPU property") we can disable the 'max' cpu model's VFP and neon
> > features, but there's no way to disable SVE. Add the 'sve=on|off'
> > property to give it that flexibility. We also rename
> > cpu_max_get/set_sve_vq to cpu_max_get/set_sve_max_vq in order for them
> > to follow the typical *_get/set_<property-name> pattern.
> 
> I think perhaps the new property should not be overloaded on cpu->sve_max_vq.
> 
> At present you are generating an error for
> 
>     -cpu max,sve=off,sve_max_vq=2
> 
> but not for
> 
>     -cpu max,sve_max_vq=2,sve=off
> 
> and then there's the issue of
> 
>     -cpu max,sve_max_vq=2,sve=off,sve=on
> 
> discarding the earlier sve_max_vq setting.

Yeah, it might be best to add a new boolean in order for that last example
to work as expected. At least my expectation would be that we'd set the
max vq to 2, when sve is disabled nothing happens to it, but then when sve
is reenabled we'll still have that max vq 2. I'm guessing you're expecting
that too, since you brought it up. I think the other two examples above
are behaving as I'd expect them to.

> 
> 
> > @@ -1129,6 +1129,14 @@ static void arm_cpu_realizefn(DeviceState *dev, Error **errp)
> >          cpu->isar.mvfr0 = u;
> >      }
> >  
> > +    if (!cpu->sve_max_vq) {
> > +        uint64_t t;
> > +
> > +        t = cpu->isar.id_aa64pfr0;
> > +        t = FIELD_DP64(t, ID_AA64PFR0, SVE, 0);
> > +        cpu->isar.id_aa64pfr0 = t;
> > +    }
> 
> 
> I suppse the isar bits are initialized too late for you to be able to re-use
> the ID_AA64PFR0.SVE field *as* the property?

Hmm, that's probably worth trying. Also reworking vfp and neon to use the
fields as the properties, putting the sanity checks directly in the
property set accessor may work too. pmu and aarch64 could work like that
too, but those still have ARM_FEATURE_* bits, so they're not really the
same [yet].

> 
> 
> >  static void zcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
> >                        uint64_t value)
> >  {
> > +    ARMCPU *cpu = env_archcpu(env);
> >      int cur_el = arm_current_el(env);
> > -    int old_len = sve_zcr_len_for_el(env, cur_el);
> > -    int new_len;
> > +    int old_len, new_len;
> > +
> > +    assert(cpu->sve_max_vq);
> 
> Certainly there's no reason for this assert, given the above.

Yeah, I'll remove for v3.

Thanks,
drew
