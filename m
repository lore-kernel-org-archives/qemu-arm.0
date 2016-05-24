Received: by 10.25.30.65 with SMTP id e62csp678793lfe;
        Tue, 24 May 2016 04:58:21 -0700 (PDT)
X-Received: by 10.194.205.134 with SMTP id lg6mr3838190wjc.153.1464091101614;
        Tue, 24 May 2016 04:58:21 -0700 (PDT)
Return-Path: <christoffer.dall@linaro.org>
Received: from mail-wm0-x235.google.com (mail-wm0-x235.google.com. [2a00:1450:400c:c09::235])
        by mx.google.com with ESMTPS id q6si12629795wme.57.2016.05.24.04.58.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 24 May 2016 04:58:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of christoffer.dall@linaro.org designates 2a00:1450:400c:c09::235 as permitted sender) client-ip=2a00:1450:400c:c09::235;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org;
       spf=pass (google.com: domain of christoffer.dall@linaro.org designates 2a00:1450:400c:c09::235 as permitted sender) smtp.mailfrom=christoffer.dall@linaro.org;
       dmarc=pass (p=NONE dis=NONE) header.from=linaro.org
Received: by mail-wm0-x235.google.com with SMTP id n129so125961117wmn.1
        for <alex.bennee@linaro.org>; Tue, 24 May 2016 04:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1AtwyP1+QoKJ28DXTmjKMgGt8BvQ8GqHSBYOzIN4MTw=;
        b=g1Ckxs2Hi+COibLIRD23iFTAjFWjWmNPF7BW7u1rhquTQmJsyo9oeRKhjP7EhDfYEr
         +Siz6FQTlyNbxNSUrh19Ejv2lLCZ8TGtg2q/P7jah17pf9cLJm1x1bvXftXwhlDa23Y1
         mvZGYfN5terqwSOL9Adrl3PMbTXRzyruDNVoc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20130820;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1AtwyP1+QoKJ28DXTmjKMgGt8BvQ8GqHSBYOzIN4MTw=;
        b=ksD4uv3nCADsBdqnS7I8jpjDQb5OiIkQ50xO/+jI8+Iz7hACUouquC4jgBz85ZF8EC
         NMOxsXTEFmMqL74Nkw2AOep1V1FnRIdd7uXR4foZs/ZdmOidaZKE+QMil4sOTpHFTL44
         +q5cXhdiIBtD/pfoppJT0sGuPPFxVFZcZtf03ijvqfuIGTY65PfCxA5Hj7/b2GUqzXOU
         0bu5Yi7wTob9SRj3P42NQgSy0mFVZDWl1qLznvDndw2juUATuP3sopOcJ2k+PWsi9wKk
         MZkeJiSNvicn/K8WXBkkzOttkUfAfX8pIod52LIhtDPvM/nCbyvoLc5NC7RYKrAM9myW
         0qMg==
X-Gm-Message-State: ALyK8tKtuNfcGGlBDdsgYtd+m6L8SP6uXsgGpqkxlnNsuMZ1Pk6SW/4tPzdswkw2D39NcwRVcrU=
X-Received: by 10.194.203.135 with SMTP id kq7mr4010988wjc.46.1464091101257;
        Tue, 24 May 2016 04:58:21 -0700 (PDT)
Return-Path: <christoffer.dall@linaro.org>
Received: from localhost ([94.18.191.146])
        by smtp.gmail.com with ESMTPSA id bu7sm2868613wjc.3.2016.05.24.04.58.20
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Tue, 24 May 2016 04:58:20 -0700 (PDT)
Date: Tue, 24 May 2016 13:58:19 +0200
From: Christoffer Dall <christoffer.dall@linaro.org>
To: Andrew Jones <drjones@redhat.com>
Cc: peter.maydell@linaro.org, kvm@vger.kernel.org, marc.zyngier@arm.com,
	andre.przywara@arm.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
	alex.bennee@linaro.org, kvmarm@lists.cs.columbia.edu
Subject: Re: [Qemu-devel] [kvm-unit-tests PATCH 00/10] arm/arm64: add gic
 framework
Message-ID: <20160524115819.GC3582@cbox>
References: <1463385444-12916-1-git-send-email-drjones@redhat.com>
 <20160518090714.GA3827@cbox>
 <20160523152423.2zc26na33jt2abdi@hawk.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160523152423.2zc26na33jt2abdi@hawk.localdomain>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TUID: U82aoy5lonEx

On Mon, May 23, 2016 at 05:24:23PM +0200, Andrew Jones wrote:
> On Wed, May 18, 2016 at 11:07:14AM +0200, Christoffer Dall wrote:
> > Hi Drew,
> > 
> > Thanks for doing this.  I'm happy to see some tests for the GIC.
> > 
> > I've been pondering with how to write unit tests for all the MMIO
> > implementations.  If you have some thoughts on how that could be easily
> > fitted into this framework, that would probably be a good place to do it
> > ;)
> 
> Hi Christoffer,
> 
> Sorry for my slow response, I've been on vacation. For MMIO
> implementations, are you referring to the emulation done for
> gicv2 accesses and for gicv3 legacy accesses? And, if so, is
> your question how we might be able to use the same test
> framework for both? And, if that's so, then I think this series
> gets us pretty close already. If I'm completely off-base, then
> please give me a quick high-level description of what you'd like
> to be able to do.
> 
What I meant was testing all the MMIO accesses to the various
distributor MMIO regions.

For example, writing full words to all registers (some value) reading
back the value, correcting for RAZ/WI semantics, and testing that byte
accesses to those registers where that's allowed also works.

If adding that on top of this series sounds like a good idea, someone
should add it to the bottom of their (presumably already long) todo
list, myself included.

Thanks,
-Christoffer
