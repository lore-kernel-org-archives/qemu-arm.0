Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp3747226wrm;
        Mon, 7 Oct 2019 05:41:30 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxD7KLoMrwK8TyIOhTWxq+qgCimhIb1zPXCyhxarNLgeCbicn628OXhvCIzkHXN6+1tirLw
X-Received: by 2002:a02:c049:: with SMTP id u9mr27412529jam.131.1570452090302;
        Mon, 07 Oct 2019 05:41:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570452090; cv=none;
        d=google.com; s=arc-20160816;
        b=Hj1L2aGnwV4nfEqI8I/tX3Kwzr+Gl1KVylAiW06ckLitwAxmFl9GTFfmvblF5VF4aH
         P7YCBRU8b41a4wlsNVN9IboQrsD0AHYHhNLasGjdhA4+40SZ9ua1yA0Ys5yFAUiDvVC1
         LrbvTmgj4njRP/j+jMX6ApK4mERA4qBIhBNAJ9WvoYqBYreumqxHqRbZfR3D9P28BE4f
         5Yl5Pg2D9idEKNxR3uoI/lz4MCDEbBj3N0WDnBP9tbCXiPt9l1UXC7dZYn6vJm56AjUA
         bpIOV267IWFgys8EY2HJJxewCZllKfJzH80FYGfxluB922dDQzBKEtJe5SYd8BjWDLfn
         6muQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date;
        bh=+nNj1Z2FL/8t8ORFn3jiZraHe2kngUdWFlrOn8VJiTY=;
        b=cCDLM2Mb2E6QH2sgqJSEgYgmkuL5QRon8eKgZcKyTBB+ClPxUgudy8Ugv/9I4FACZ5
         snYDThG3Z/hWJ5tyI8wvjWGojRLyAEkoEZ6437jg4gDamC2ThS1wxefTteXzvVZSCuFb
         JzMkh3ttAtWqptzIOxL4vFDCGLz255JxrjmVp0Tolw0rv+wJgdcjdGmJl93L1/wZjLKv
         QLnWTp/EZ6SxKfF+VhIYt84git6LjdAmB9YRqXGY9VfkWtCwv3Y6uqGAGKNGpUPyiqV7
         JS+COTb3SjP2Pm+VfBkT61dieeLKJchKSeCwcnaqzGlFK2I4OMcqJO/SC8IpgvOKtgFV
         EEPg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <drjones@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id d10si15308670ioc.148.2019.10.07.05.41.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Oct 2019 05:41:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of drjones@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=drjones@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3C28F10CC1EE;
	Mon,  7 Oct 2019 12:41:29 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 13B63196B2;
	Mon,  7 Oct 2019 12:41:24 +0000 (UTC)
Date: Mon, 7 Oct 2019 14:41:22 +0200
From: Andrew Jones <drjones@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
	qemu-devel@nongnu.org, armbru@redhat.com, eric.auger@redhat.com,
	qemu-arm@nongnu.org, imammedo@redhat.com, Dave.Martin@arm.com
Subject: Re: [PATCH v5 4/9] target/arm/cpu64: max cpu: Introduce sve<N>
 properties
Message-ID: <20191007124122.wjrrrgmvnxvxg3r6@kamzik.brq.redhat.com>
References: <20191001125845.8793-1-drjones@redhat.com>
 <20191001125845.8793-5-drjones@redhat.com>
 <87d0f9j6lk.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87d0f9j6lk.fsf@linaro.org>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2 (mx1.redhat.com [10.5.110.65]); Mon, 07 Oct 2019 12:41:29 +0000 (UTC)
X-TUID: ZWhC5ypsVHkr

On Mon, Oct 07, 2019 at 09:35:35AM +0100, Alex Bennée wrote:
> 
> Andrew Jones <drjones@redhat.com> writes:
> 
> > Introduce cpu properties to give fine control over SVE vector lengths.
> > We introduce a property for each valid length up to the current
> > maximum supported, which is 2048-bits. The properties are named, e.g.
> > sve128, sve256, sve384, sve512, ..., where the number is the number of
> > bits. See the updates to docs/arm-cpu-features.rst for a description
> > of the semantics and for example uses.
> >
> > Note, as sve-max-vq is still present and we'd like to be able to
> > support qmp_query_cpu_model_expansion with guests launched with e.g.
> > -cpu max,sve-max-vq=8 on their command lines, then we do allow
> > sve-max-vq and sve<N> properties to be provided at the same time, but
> > this is not recommended, and is why sve-max-vq is not mentioned in the
> > document.  If sve-max-vq is provided then it enables all lengths smaller
> > than and including the max and disables all lengths larger. It also has
> > the side-effect that no larger lengths may be enabled and that the max
> > itself cannot be disabled. Smaller non-power-of-two lengths may,
> > however, be disabled, e.g. -cpu max,sve-max-vq=4,sve384=off provides a
> > guest the vector lengths 128, 256, and 512 bits.
> >
> > This patch has been co-authored with Richard Henderson, who reworked
> > the target/arm/cpu64.c changes in order to push all the validation and
> > auto-enabling/disabling steps into the finalizer, resulting in a nice
> > LOC reduction.
> >
> > Signed-off-by: Andrew Jones <drjones@redhat.com>
> > ---
> >  docs/arm-cpu-features.rst | 168 +++++++++++++++++++++++++++++++--
> >  include/qemu/bitops.h     |   1 +
> >  target/arm/cpu.c          |  19 ++++
> >  target/arm/cpu.h          |  19 ++++
> >  target/arm/cpu64.c        | 192 ++++++++++++++++++++++++++++++++++++-
> >  target/arm/helper.c       |  10 +-
> >  target/arm/monitor.c      |  12 +++
> >  tests/arm-cpu-features.c  | 194 ++++++++++++++++++++++++++++++++++++++
> >  8 files changed, 606 insertions(+), 9 deletions(-)
> >
> > diff --git a/docs/arm-cpu-features.rst b/docs/arm-cpu-features.rst
> > index c79dcffb5556..2ea4d6e90c02 100644
> > --- a/docs/arm-cpu-features.rst
> > +++ b/docs/arm-cpu-features.rst
> > @@ -48,18 +48,31 @@ block in the script for usage) is used to issue the QMP commands.
> >        (QEMU) query-cpu-model-expansion type=full model={"name":"max"}
> >        { "return": {
> >          "model": { "name": "max", "props": {
> > -        "pmu": true, "aarch64": true
> > +        "sve1664": true, "pmu": true, "sve1792": true, "sve1920": true,
> > +        "sve128": true, "aarch64": true, "sve1024": true, "sve": true,
> > +        "sve640": true, "sve768": true, "sve1408": true, "sve256": true,
> > +        "sve1152": true, "sve512": true, "sve384": true, "sve1536": true,
> > +        "sve896": true, "sve1280": true, "sve2048": true
> 
> Does having a list of VL's not have implications for the versioning of
> the API? Do we need to tick a version each time a new vector length is
> added?
>

Versioning the set of cpu features a versioned machine type may enable is
a good idea, but I don't think we should add versioning to this API. Since
it doesn't matter what gets returned by the expansion call as much as
whether or not it may be enabled, we can use both existence and permission
to control the enabling of features. And, we don't have to do it the same
way for all features. Here are some examples:

* The 'aarch64' feature doesn't exist on armv7 CPUs. So it can't be
  enabled there.

* The 'pmu' feature does exist on KVM armv7 CPUs, but KVM doesn't
  support it, so it can't be enabled there.

If we add features that could be enabled, but we don't want them to be
available to older machine types, then we can either ensure the CPU
property isn't added, or is removed, from the CPU model when that machine
type is in use, or we can add code to the enable function that fails
the enable when a machine type dependent condition check fails.

Does that answer the question?

Thanks,
drew
