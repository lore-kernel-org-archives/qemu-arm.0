Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp5194910wrv;
        Tue, 6 Aug 2019 05:21:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwJG39BuFBdXZ8YnWQ3QZ/oLhxF+bQSL8CeLiyyMd4/UIJtpUYhXLZGsumyHAxVb9IajGbm
X-Received: by 2002:a37:484a:: with SMTP id v71mr2876815qka.29.1565094118505;
        Tue, 06 Aug 2019 05:21:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565094118; cv=none;
        d=google.com; s=arc-20160816;
        b=P17Du/X0EQbYoadS4UrD6zgLmvUGPrfDLjz1sKnGqDu2ELl58jHsuecg4L6e49X4ce
         NqyvToxJD1xsnG2iRrNhWcu8SJKADHGtiAq9HtiCrKBSMoUHM25o+H+kLc7VGdVh7Ssf
         Hv7rXK8Lmtnx90pHtnN6YxeMiIh0MbAB06Kj0UDCoB+tRVWhNxEkdjJYxjZLXHKyUhRA
         FQi1SD0wGZ/Toakju8e0eBg/3oeW12FbGKIBb1tXd4SS+tJjcMd8wLB576WH+ANm4klc
         412pUo3uyfGaMIz+Rx6AcRihr015tlU2ZVZSFe7y1kEM4GC604pKTtpFJvTywH1Y1v/m
         1j7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date;
        bh=pPTtN5zl5UZd2xkpuCocD1HSt6N3UVBPFz0vaCSbZ5s=;
        b=kpdxIucbMdGRzRrw5XJnyqTcNfHXQwM9RRtousdb6t0duTeCo6dPdZoLwf3Ra+dciU
         Vpu1gEnZve6+FzjMV22KXQyriBwdHwsA8uDLWwyrKrOe4jeh+qm1hdRjDPxA+oMcGZca
         pzMN1vdt+nTaEyp0773AJonZf73W7n0OOtsvcIhhrKtiEDFNpzndh4/0WIiue/q+MIox
         PWuldWiEjmKVRaR2InJqABpeRtBXTK41RxzxejVjYKkFj/ugNv/TeUR2HMwd84mc/Fd0
         JEp35V47QkXMNDdUT1jViqMIRqUc83H17lzDk1+RCe66zMcH5mQP9fqNOPpBbRtP0V/e
         EFfg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id w50si4958174qta.271.2019.08.06.05.21.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 06 Aug 2019 05:21:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 526813008954;
	Tue,  6 Aug 2019 12:21:57 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9783661B65;
	Tue,  6 Aug 2019 12:21:46 +0000 (UTC)
Date: Tue, 6 Aug 2019 14:21:44 +0200
From: Andrew Jones <drjones@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
	armbru@redhat.com, eric.auger@redhat.com, imammedo@redhat.com,
	alex.bennee@linaro.org, Dave.Martin@arm.com
Subject: Re: [Qemu-devel] [PATCH v3 03/15] target/arm/monitor: Introduce
 qmp_query_cpu_model_expansion
Message-ID: <20190806122144.bb3klk7aaaqdhgwi@kamzik.brq.redhat.com>
References: <20190802122540.26385-1-drjones@redhat.com>
 <20190802122540.26385-4-drjones@redhat.com>
 <d0983bd5-c1a5-adf6-324d-2b199ca0e23c@linaro.org>
 <ec44ddad-c33c-918b-e94b-a534a2519a9e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ec44ddad-c33c-918b-e94b-a534a2519a9e@linaro.org>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Tue, 06 Aug 2019 12:21:57 +0000 (UTC)
X-TUID: e3r3eW8PABLq

On Fri, Aug 02, 2019 at 06:28:51PM -0700, Richard Henderson wrote:
> On 8/2/19 9:27 AM, Richard Henderson wrote:
> > On 8/2/19 5:25 AM, Andrew Jones wrote:
> >> Note, certainly more features may be added to the list of
> >> advertised features, e.g. 'vfp' and 'neon'. The only requirement
> >> is that their property set accessors fail when invalid
> >> configurations are detected. For vfp we would need something like
> >>
> >>  set_vfp()
> >>  {
> >>    if (arm_feature(env, ARM_FEATURE_AARCH64) &&
> >>        cpu->has_vfp != cpu->has_neon)
> >>        error("AArch64 CPUs must have both VFP and Neon or neither")
> >>
> >> in its set accessor, and the same for neon, rather than doing that
> >> check at realize time, which isn't executed at qmp query time.
> > 
> > How could this succeed?  Either set_vfp or set_neon would be called first, at
> > which point the two features are temporarily out of sync, but the error would
> > trigger anyway.
> > 
> > This would seem to require some separate "qmp validate" step that is processed
> > after a collection of properties are set.
> > 
> > I was about to say something about this being moot until someone actually wants
> > to be able to disable vfp+neon on aarch64, but then...
> > 
> >> +A note about CPU feature dependencies
> >> +-------------------------------------
> >> +
> >> +It's possible for features to have dependencies on other features. I.e.
> >> +it may be possible to change one feature at a time without error, but
> >> +when attempting to change all features at once an error could occur
> >> +depending on the order they are processed.  It's also possible changing
> >> +all at once doesn't generate an error, because a feature's dependencies
> >> +are satisfied with other features, but the same feature cannot be changed
> >> +independently without error.  For these reasons callers should always
> >> +attempt to make their desired changes all at once in order to ensure the
> >> +collection is valid.
> > 
> > ... this language makes me think that you've already encountered an ordering
> > problem that might be better solved with a separate validate step?
> 
> It appears to me that we can handle both use cases with a single function to
> handle validation of the cross-dependent properties.
> 
> It would need to be called at the beginning of arm_cpu_realizefn, for the case
> in which we are building a cpu that we wish to instantiate, and
> 
> > +        if (!err) {
> > +            visit_check_struct(visitor, &err);
> > +        }
> 
> here, inside qmp_query_cpu_model_expansion for the query case.
> 
> Looking at the validation code scattered across multiple functions, across 4
> patches, convinces me that the code will be smaller and more readable if we
> consolidate them into a single validation function.
>

That's a reasonable suggestion. I do like having self-contained
validation, self-contained, but when cross-dependencies arise, then
it does make sense to have a master validation function, rather
than interconnecting too much. That said, for this series we only
enable the qmp query for aarch64, pmu, and sve* properties. aarch64
and pmu are independent, and thus self-contained, and I consider
all sve* properties one big entity, so their validation is also
self-contained. If we add vfp and neon, then indeed I was wrong
with my suggestion in the commit message. They would need a later
validation check. Should we just cross that bridge when we get there
though? Or would you like me to see how that would work within this
series?

Thanks,
drew
