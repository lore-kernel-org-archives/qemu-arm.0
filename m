Received: by 2002:a17:504:c05:b0:1be9:327d:8ee3 with SMTP id k5csp1580703njf;
        Mon, 28 Oct 2024 09:09:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXN4E/x7nkZ+HKhs3Xqgel0sI5bi/cFkcootgYstKAhFFd0JO7euMBxqeWYuiTvVRtSN0VDr0J5TUwHvQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHcyufth5V5THPUo1xvPvC87dDkD2sgo142BYiWqQVBBs2oATBdftNrfUo1hW4sTZXyWj8y
X-Received: by 2002:a05:6902:1b04:b0:e28:6d13:d179 with SMTP id 3f1490d57ef6-e3087a48919mr6350111276.9.1730131784313;
        Mon, 28 Oct 2024 09:09:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730131784; cv=none;
        d=google.com; s=arc-20240605;
        b=VgYCmeCAhaCkGA02WDN8+mUzJ78ec7ndtwi+d5AC18+QgFmlx5hVnN5C2EzKlE/RMe
         /mfyyN7+KC6NpK9r/jbBNAFJXHFi00VkmrfR+3ieq6uDi9tNcoWcwnnB2T+icRzh2RK2
         +qEWvlTtWQ+oX9cmOG/5ka8/t1XhffpTEkHIidFb2Iw1/VM4Z0m+j1mdpntGsRlY9ipt
         PeL1xC4QXTU/M4xO9EFHwdoBgaYPwD7HQnxr1Ui5RAFC+Ycrj19bOiVcteKUQHgv/ACx
         rbq+M2KwhrhdKZ0/+kpsNjAVKkZLzQp75jTd+ayrBVGhyK3GK9/yi7cWAMRup9ixLVk+
         MtYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=ea6G5wtzKMhZ2E+87Bpxxtu+p19GIanpiqAsDf/FIog=;
        fh=n45Bc/Z9T29Qh/JGOLcvk6lrjMQMFrPrnX/TrN9h1m0=;
        b=b9DlbQfBzv9Np3iD+tmxf+4zKSF5/hjSN1kmphtcpCf482Fkd0XVIzduuaUVKVQrSF
         S1myIvxootCm3kVbJ5Q1HB0nSoNKY2tXRCuSvIEZaPGgwv7JgG/weSqkor/rgiVRtwES
         q1acwYjSDsm1W/ectpVySnBINWiIsrq6GRVGKsBWzZrM9iQrTZVBjJt80Err76PcW2ac
         tyEniI0TEcbF0WEwSKvd7g3Q+IDoi9NvyiyNsj1yep0WtlYB4UXAfXAb3Qb0DNJOXKtJ
         KA7c1BQziqQxK/C8b7Z3VbeGA1FfRi6qKDr1vI/AeY+aH+OIH4s70sUYM/PczjAg3EnO
         0/4w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=F4dLl1LU;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 3f1490d57ef6-e3079d6b9b5si5269262276.56.2024.10.28.09.09.44
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 09:09:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=F4dLl1LU;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730131783;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ea6G5wtzKMhZ2E+87Bpxxtu+p19GIanpiqAsDf/FIog=;
	b=F4dLl1LUBojrJMi9146mItNDAr1HcpYWbraLjRQUjQLVQQRkc+n2DKn8sEMjgmoAkgYBHE
	WzdMwb2n6Bqw1kDPgEaCVrRTRPAthNj8rX14d64qMVki7wqqbP7E5Qw2hchwozbhvTnSsp
	3s68s71B1fJRzrmj3lc/ZC9dCjQfvBk=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-53-MFjKr2uwM3GR5URt0I5N1A-1; Mon,
 28 Oct 2024 12:09:40 -0400
X-MC-Unique: MFjKr2uwM3GR5URt0I5N1A-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9EE4619560BD;
	Mon, 28 Oct 2024 16:09:38 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.86])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2B18619560AA;
	Mon, 28 Oct 2024 16:09:31 +0000 (UTC)
Date: Mon, 28 Oct 2024 16:09:29 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvmarm@lists.linux.dev,
	peter.maydell@linaro.org, richard.henderson@linaro.org,
	alex.bennee@linaro.org, maz@kernel.org, oliver.upton@linux.dev,
	sebott@redhat.com, shameerali.kolothum.thodi@huawei.com,
	armbru@redhat.com, abologna@redhat.com, jdenemar@redhat.com,
	shahuang@redhat.com, mark.rutland@arm.com, philmd@linaro.org,
	pbonzini@redhat.com
Subject: Re: [RFC 21/21] arm/cpu-features: Document custom vcpu model
Message-ID: <Zx-3OUioG1l47hW3@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20241025101959.601048-1-eric.auger@redhat.com>
 <20241025101959.601048-22-eric.auger@redhat.com>
 <ZxuZkUFz_bwAA1pf@redhat.com>
 <0700af51-a1a6-4b11-a4bf-0eaf6e279c6d@redhat.com>
 <Zxudl5-fZV1vIaEL@redhat.com>
 <87y128nrfr.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87y128nrfr.fsf@redhat.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-TUID: C5++OkuP2+G1

On Mon, Oct 28, 2024 at 05:05:44PM +0100, Cornelia Huck wrote:
> On Fri, Oct 25 2024, Daniel P. Berrangé <berrange@redhat.com> wrote:
> 
> > On Fri, Oct 25, 2024 at 03:28:35PM +0200, Eric Auger wrote:
> >> Hi Daniel,
> >> 
> >> On 10/25/24 15:13, Daniel P. Berrangé wrote:
> >> > On Fri, Oct 25, 2024 at 12:17:40PM +0200, Eric Auger wrote:
> >> >> From: Cornelia Huck <cohuck@redhat.com>
> >> >>
> >> >> Add some documentation for the custom model.
> >> >>
> >> >> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> >> >> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> >> >> ---
> >> >>  docs/system/arm/cpu-features.rst | 55 +++++++++++++++++++++++++++-----
> >> >>  1 file changed, 47 insertions(+), 8 deletions(-)
> >> >
> >> >> @@ -167,6 +196,16 @@ disabling many SVE vector lengths would be quite verbose, the ``sve<N>`` CPU
> >> >>  properties have special semantics (see "SVE CPU Property Parsing
> >> >>  Semantics").
> >> >>  
> >> >> +The ``custom`` CPU model needs to be configured via individual ID register
> >> >> +field properties, for example::
> >> >> +
> >> >> +  $ qemu-system-aarch64 -M virt -cpu custom,SYSREG_ID_AA64ISAR0_EL1_DP=0x0
> >> >> +
> >> >> +This forces ID_AA64ISAR0_EL1 DP field to 0.
> >> > What is the "baseline" featureset implied by 'custom' ?
> >> there is no baseline at the moment. By default this is a host
> >> passthrough model.
> >
> > Why do we need to create "custom" at all, as opposed to just letting
> > users toggle features on "-cpu host" ? 
> 
> We could consolidate that to the current "host" model, once we figure
> out how to handle the currently already existing properties. Models
> based on the different architecture extensions would probably be more
> useable in the long run; maybe "custom" has a place for testing.

If you can set the features against "host", then any testing could
be done with "host" surely, making 'custom' pointless ?

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
