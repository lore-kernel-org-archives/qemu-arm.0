Received: by 2002:a17:504:5682:b0:1be9:327d:8ee3 with SMTP id r2csp1055173njx;
        Fri, 25 Oct 2024 06:31:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUk1PoH2U0FT0WjoNqTUxS+YEaQ/m0kOZbLmK8NWpplmVaSNJGWtbEv4/hzb3BEQt9m23te0CyCoaAZvg==@linaro.org
X-Google-Smtp-Source: AGHT+IHMjzilYpVqaEHVizR6+fUJwOW2TVNvjAgcVrJbBtS2EeGuiXKA+fzP6HWBAWJjtsGzx3aT
X-Received: by 2002:a05:6358:52ca:b0:1aa:d5c8:ec94 with SMTP id e5c5f4694b2df-1c3e4dd91a2mr303439355d.26.1729863082560;
        Fri, 25 Oct 2024 06:31:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729863082; cv=none;
        d=google.com; s=arc-20240605;
        b=cmA/LmCQc5a1Yl0l0s6IljR2VUGAGIkq7uZitsi3NoNAz0WSd1CrDP0Nq+jG4iwfLk
         Z4eHkQhFZ8L3qFV7QeyRSJPbVHPNkDjNY70I2TE1zeYJAeIz5ZM72eFCSXB+AujHE5JK
         aR4vrvKKhjh6JMiPST54KyFi//eenbAWO6EhO9azVldtNVApvkTahX4eH9cQoMtPRPeX
         eIVyPUl04uDADRohjeJKKEid6oAE0tQsc3NYSnRZEtsCyy7eXQAdt6a1/vDl0alBsIxj
         TWgsSozDto8v2BNPrGTun1fNcWWsyYKf9ssEVujOX1DALA6j9jikkSAMllWhOB5EPXN7
         W5GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=waoi+b8XH0c3xLVAJPFetdqTvj+3eqZAdduWa1Fv1LI=;
        fh=xvAnbKHZqn/QIdcyEcvWukR35/6Gm2tQ0V5YAjW0SGw=;
        b=b2RTLXKf0qGBMxSVGGxUsMFer4oGPf6m3A6w/pNeHjb1E2//19jbgM2m4Gc4389rs2
         m7mkjRS4Y875coRnCl7PXSphZgZzwifohcdooZVDIRJOdHjz0E+41Bg2r8l1pS3MxXOf
         iVAtJ9SrDwkklcTg+Ugt6TcTYfQRHuY9j1CjyxtVRPHr36ku63wVXH2DAvOO0fJ+5HM4
         rIqG0EkjXY6Qh4u6m9/ArjmRs37luFpoCvU8j2dibQBokbYnpsuo1E6HJHGbh5C0Y+V8
         2ArwEPXXC62kak7zciGRTQU8I59CW57ob8oV3hOTCbnlv3LbTQvOlHPactYDSR+6VmwI
         nl9w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Prc2WF4F;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7b18d37ab40si147838585a.704.2024.10.25.06.31.22
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 06:31:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Prc2WF4F;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729863082;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=waoi+b8XH0c3xLVAJPFetdqTvj+3eqZAdduWa1Fv1LI=;
	b=Prc2WF4FfH668QMDoqoWfwuBnU5vQjBhloCJWLYoImI7GbyAVbcQv/UNM0Mz3RpDlpfV8E
	lUoI9Fo5IOY8NyxDHaIazNdoc5E6hr4BYkgf6IfgYyx2a6Z5+sV8nd6WIQCAqGBvQkg7YT
	zt/HNbVneSd7gNM9u22Eq7QdWceQlM0=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-38-Rd7mrFVRPGm__spTrUcptA-1; Fri,
 25 Oct 2024 09:31:18 -0400
X-MC-Unique: Rd7mrFVRPGm__spTrUcptA-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 00F3819560A2;
	Fri, 25 Oct 2024 13:31:14 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.164])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2F9F430001A9;
	Fri, 25 Oct 2024 13:31:06 +0000 (UTC)
Date: Fri, 25 Oct 2024 14:31:03 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, cohuck@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, kvmarm@lists.linux.dev,
	peter.maydell@linaro.org, richard.henderson@linaro.org,
	alex.bennee@linaro.org, maz@kernel.org, oliver.upton@linux.dev,
	sebott@redhat.com, shameerali.kolothum.thodi@huawei.com,
	armbru@redhat.com, abologna@redhat.com, jdenemar@redhat.com,
	shahuang@redhat.com, mark.rutland@arm.com, philmd@linaro.org,
	pbonzini@redhat.com
Subject: Re: [RFC 21/21] arm/cpu-features: Document custom vcpu model
Message-ID: <Zxudl5-fZV1vIaEL@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20241025101959.601048-1-eric.auger@redhat.com>
 <20241025101959.601048-22-eric.auger@redhat.com>
 <ZxuZkUFz_bwAA1pf@redhat.com>
 <0700af51-a1a6-4b11-a4bf-0eaf6e279c6d@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0700af51-a1a6-4b11-a4bf-0eaf6e279c6d@redhat.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-TUID: AiQY85eHlAfc

On Fri, Oct 25, 2024 at 03:28:35PM +0200, Eric Auger wrote:
> Hi Daniel,
> 
> On 10/25/24 15:13, Daniel P. Berrangé wrote:
> > On Fri, Oct 25, 2024 at 12:17:40PM +0200, Eric Auger wrote:
> >> From: Cornelia Huck <cohuck@redhat.com>
> >>
> >> Add some documentation for the custom model.
> >>
> >> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> >> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> >> ---
> >>  docs/system/arm/cpu-features.rst | 55 +++++++++++++++++++++++++++-----
> >>  1 file changed, 47 insertions(+), 8 deletions(-)
> >
> >> @@ -167,6 +196,16 @@ disabling many SVE vector lengths would be quite verbose, the ``sve<N>`` CPU
> >>  properties have special semantics (see "SVE CPU Property Parsing
> >>  Semantics").
> >>  
> >> +The ``custom`` CPU model needs to be configured via individual ID register
> >> +field properties, for example::
> >> +
> >> +  $ qemu-system-aarch64 -M virt -cpu custom,SYSREG_ID_AA64ISAR0_EL1_DP=0x0
> >> +
> >> +This forces ID_AA64ISAR0_EL1 DP field to 0.
> > What is the "baseline" featureset implied by 'custom' ?
> there is no baseline at the moment. By default this is a host
> passthrough model.

Why do we need to create "custom" at all, as opposed to just letting
users toggle features on "-cpu host" ? 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
