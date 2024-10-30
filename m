Received: by 2002:a17:504:82cc:b0:1be9:327d:8ee3 with SMTP id m12csp1078923njj;
        Wed, 30 Oct 2024 09:27:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWJD5SDr1AJZbABOU6BEvdO5a0FjNCo/7DmaAyqVTI7aRY+wwkxjHgaeTSY7bAZkhf8DM5cmipS9aD7bQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEk3p5pTKGQGTJUi6Wi9ZapiKCKHnpidMM3yGdNx39PnNNeu9YYq/cZOnnAIMCULkI34PpD
X-Received: by 2002:ac8:570e:0:b0:461:6113:10de with SMTP id d75a77b69052e-462ab31b01emr806681cf.52.1730305642454;
        Wed, 30 Oct 2024 09:27:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730305642; cv=none;
        d=google.com; s=arc-20240605;
        b=KJsMNYtzCcm/zbKyM/L38Mq6NqlRvMhytt3B9ggUKP25BZYXe3PcwH2/1CA3HbO9u2
         9hRVpqraNt35pJPaZ5qZ5odnIkGK9hPYQGudQEGtJIoAwCvmd7J/sMiELjOQXQAAj4Oy
         RLFVZFM23CLrsFipovJ5Rly+cMbDFJTbftA9q+SelWCaeMDf1hGVFKW8mA7IKfp4gisW
         DdVDt/j4FI2c9mVCjZZwWPoadpkJptm6eJW4AIiXY4AglxxSJDc2E6NF1pRk4dbJh8vR
         cIzs2kpch4ezVRuGioq4M76UiKyJzJgmkrEegHCHrR2dyqQJp/WJWvIkT2rw+qmQ9sTz
         qeyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=XvXVF5ChtnVmltzGExYLCTKSbX1wrbGeka/LhaWLXrk=;
        fh=EC2k/ImmksyjBWDiQrI3ZtzMTH+XrePvUmgCK4/JRXU=;
        b=SSknzKyqF9dVUXB5IBkKJ1Uy7ZVmFDRwraAXKC9G11R/oox8/DKe4CchRYT9EvMFuA
         Jg7vz43NHngAgsAq4dWP+36kEOCJWvmr2W9Ii05U613jaJDpxf+NIMvqA/wCuWQb0HxA
         TdPGVEQEYH/5kAAtWdqUxHqEtnw0SEExzrnZkw/gfoIssDu33T8q/CzvVIfDlaPWitY2
         ZHkiQ5LxREjN9UVW1s/ucO3b+qV4vkkaMtjZV1mPt75mafSmFrl6Pr1sOZwNkXvLHrcB
         9IXEqoViJbRPDI3BkX4/mooVeIMPHFUNaKFqwrILft9mf3wU4ry/7LxMHy6yOh7Y4bEn
         sViw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iSwLEadD;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4617daa281fsi15536061cf.668.2024.10.30.09.27.22
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 09:27:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iSwLEadD;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730305642;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XvXVF5ChtnVmltzGExYLCTKSbX1wrbGeka/LhaWLXrk=;
	b=iSwLEadDEfIN8UgkICtNn52MHwPEKdecghRfpMWlvz48NFofPRjMAAYy/Q6dcMBRF4Waae
	aHH9xV3aDruXptA7RQ/HiGxNh5EVgb3/5IIlV/wcTDfFmOBIkPmuGra5X1MGaTXop668cT
	/p4ROtliVK1Lmq2S6aOo7FogtrsSr6Q=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-554-RyGJEPBdPLyHId5huFoBcQ-1; Wed,
 30 Oct 2024 12:27:18 -0400
X-MC-Unique: RyGJEPBdPLyHId5huFoBcQ-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1668B19560B5;
	Wed, 30 Oct 2024 16:27:16 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.92])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 77B871956086;
	Wed, 30 Oct 2024 16:27:09 +0000 (UTC)
Date: Wed, 30 Oct 2024 16:27:06 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: Oliver Upton <oliver.upton@linux.dev>,
	Peter Maydell <peter.maydell@linaro.org>,
	Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvmarm@lists.linux.dev,
	richard.henderson@linaro.org, alex.bennee@linaro.org,
	maz@kernel.org, sebott@redhat.com,
	shameerali.kolothum.thodi@huawei.com, armbru@redhat.com,
	abologna@redhat.com, jdenemar@redhat.com, shahuang@redhat.com,
	mark.rutland@arm.com, philmd@linaro.org, pbonzini@redhat.com
Subject: Re: [RFC 18/21] arm/cpu: Introduce a customizable kvm host cpu model
Message-ID: <ZyJeWkxJX-5dcq4Z@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20241025101959.601048-1-eric.auger@redhat.com>
 <20241025101959.601048-19-eric.auger@redhat.com>
 <ZxuX4i9NjVRizB72@redhat.com>
 <cb6c8f62-c5dc-416d-865f-fbdf96164dac@redhat.com>
 <Zxub7ol4p8P_sWF8@redhat.com>
 <CAFEAcA_wQu17y0PyQwxw0wuf2H5y2VE5aX16nLP2-u7QUP2ggA@mail.gmail.com>
 <Zx-9WxXkmkMuGIlQ@redhat.com>
 <CAFEAcA9w0mb5bcU8p+fScQony-=oqLmNurGWpnL_sBneQCzxUg@mail.gmail.com>
 <Zx_CU9eeQByANMRW@linux.dev>
 <87bjz1o9di.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87bjz1o9di.fsf@redhat.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-TUID: JJQ0kU+ObK8y

On Wed, Oct 30, 2024 at 05:15:05PM +0100, Cornelia Huck wrote:
> On Mon, Oct 28 2024, Oliver Upton <oliver.upton@linux.dev> wrote:
> 
> > On Mon, Oct 28, 2024 at 04:48:18PM +0000, Peter Maydell wrote:
> >> On Mon, 28 Oct 2024 at 16:35, Daniel P. Berrangé <berrange@redhat.com> wrote:
> >> >
> >> > On Mon, Oct 28, 2024 at 04:16:31PM +0000, Peter Maydell wrote:
> >> > > On Fri, 25 Oct 2024 at 14:24, Daniel P. Berrangé <berrange@redhat.com> wrote:
> >> > > > On Fri, Oct 25, 2024 at 03:18:25PM +0200, Eric Auger wrote:
> >> > > > > On 10/25/24 15:06, Daniel P. Berrangé wrote:
> >> > > > > > Also, is this naming convention really the same one that users
> >> > > > > > will see when they look at /proc/cpuinfo to view features ? It
> >> > > > > No it is not. I do agree that the custom cpu model is very low level. It
> >> > > > > is very well suited to test all series turning ID regs as writable but
> >> > > > > this would require an extra layer that adapts /proc/cpuinfo feature
> >> > > > > level to this regid/field abstraction.
> >> > > > >
> >> > > > > In /cpu/proc you will see somethink like:
> >> > > > >  Features    : fp asimd evtstrm aes pmull sha1 sha2 crc32 atomics fphp
> >> > > > > asimdhp cpuid asimdrdm lrcpc dcpop asimddp
> >> > > >
> >> > > > Right, IMHO, this is the terminology that QEMU must use in user
> >> > > > facing APIs.
> >> > >
> >> > > /proc/cpuinfo's naming is rather weird for historical
> >> > > reasons (for instance there is only one FEAT_FP16 feature
> >> > > but cpuinfo lists "fphp" and "asimdhp" separately).
> >> >
> >> > There's plenty of wierd history in x86 too. In this
> >> > case I might suggest just picking one of the two
> >> > common names, and ignoring the other.
> >> >
> >> > If we really wanted to, we could alias the 2nd name
> >> > to the first, but its likely not worth the bother.
> >> 
> >> Or we could use the standard set of architectural
> >> feature names, and not have the problem at all, and not
> >> have to document what we mean by our nonstandard names.
> >
> > +1
> >
> > There's existing documentation [*] for the standard feature names, which
> > provides:
> >
> >  - A short description of what the feature does
> >  - Any dependencies a particular feature has (e.g.FEAT_VHE implies
> >    FEAT_LSE, FEAT_Debugv8p1, and FEAT_AA64EL2)
> >  - The register fields/values that are used to discover the feature.
> >
> > This seems like the most user-friendly option...
> >
> > [*]: https://developer.arm.com/documentation/109697/2024_09
> 
> FEAT_XXX sounds good, would be a different approach than this series
> obviously, since the user resp. upper software layers would operate on a
> per-feature basis, and QEMU would translate to and from registers.
> 
> I'm wondering about the amount of translation that would be needed, and
> what information would be best exposed via QEMU, given that a feature
> may or may not be toggable not only because of what the Arm revision
> specifies, but what registers the host kernel allows to be written.
> 
> I.e. if we have two cpus that differ in whether FEAT_FOO is provided,
> would it make sense to have an extra QMP command so that you can find
> out whether FEAT_FOO can be switched off, with QEMU translating from the
> set of writable id registers to the set of features that can be changed?

If there are restrictions on what features can be turned off, then yes,
we should add that in QMP, as x86 doesn't have such a restriction
currently.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
