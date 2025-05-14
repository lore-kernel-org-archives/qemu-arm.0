Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp1382951njb;
        Wed, 14 May 2025 11:22:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVQ4ko+s8CGrXrck+v2OEVM/YgJYQWkvB8BuB0vRz3p2EBfN7RjTp5t1Gm7Bb5Ve+rDFp+FafZ8mftVbQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHW3OcEmHfh7AnFq8kvVqrrxG40lYF+XmVYI8npnbae8zn7cda7vRF9ZrH3INkQxoFXVDWZ
X-Received: by 2002:a05:620a:4588:b0:7c5:60c7:339 with SMTP id af79cd13be357-7cd287fbb70mr599316285a.9.1747246946260;
        Wed, 14 May 2025 11:22:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747246946; cv=none;
        d=google.com; s=arc-20240605;
        b=GY5JR6sFRpWoM6s2Z3WY0ZxdVAh1y1CyzKSvYKvXpj1yZJu9GcEzKXCPHabimcqZ3B
         osahS/hvTrRKu5X5jmyuj7kAk32bprDXQxtxjm2laCBU1ict4dyj9lkwB662ypMl+A+y
         h7TeuRK4p55B7qJOd5ebpy8mP/1lItV8Z1NsYlPE/ZVYE/rYdxXIsJF1c5mbMW11T6Ey
         yjp6fiu9godXt9bmTDtMa9NqkB15yEOLsqJ2RNTTBRJLN+tUKvSoNFHD3mzYVdk8DmTl
         FM27ImnALuDH34td4WkBdp6ojse0QzqjKW/HwEzs2JwfSbCip19geREV5hl8Mk8sGTTo
         0kQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=tPeRMIcrtB8JtU0o7I5k5bCudFUZhP2qzhPFFnVn9pE=;
        fh=iM9GwfGv21/blqyxO272EqVSEyp03V2YmKTOh+3dT00=;
        b=i4uVT+n6/j7BosDUeRITvJ+BFOARx1QWMlh+6g1flcJcq4fN19CZkaMbJJLwey1es0
         rBXTp3NmUXK85ES0dNIrOJJcqArABNIq2rVZtPwDIVySArS7FVOxKdIowu5SmXqcgHjf
         OS1g2MeJ9AJAH2RrbtPnl8Xmpo26ZsBgO5NVTAopLGt7e+iLbyuiHGLDHVBkvZ+zmBnw
         zSHc78jGZEMaBSMzp8z2pWi+CoAa4Ba2GtY5cnG7kPVrTLKcXW3ysCkNAZgJQ97LtQhI
         Z3i2+d/eVBzDsnVndG1XXQfeaUyIID9c7Jtw1rWmIMo6zpVW/pEFCwesbfa0SjnZWZQ4
         HpJw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=D6Dkh6hH;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7cd00f518dasi1398399785a.97.2025.05.14.11.22.26
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 11:22:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=D6Dkh6hH;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747246945;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tPeRMIcrtB8JtU0o7I5k5bCudFUZhP2qzhPFFnVn9pE=;
	b=D6Dkh6hHpVXO7mSQA/yevDMkzGSEonSChs/vh0DHLzXBhK2FJvVlC62Ggs4dM6qhJH6qsC
	a/j+WXQi+0kLHvgIMNMhGLvCDWEOUeZT1TFpOjaYUG+n7nZwV6d8C8E2DkrVU6tBuru+B7
	33tLA4sY9k9Q2PYH7HJ5MOw3CXrUi4I=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-621-XgSVwa3ROS2hjrpefnarRA-1; Wed,
 14 May 2025 14:22:22 -0400
X-MC-Unique: XgSVwa3ROS2hjrpefnarRA-1
X-Mimecast-MFC-AGG-ID: XgSVwa3ROS2hjrpefnarRA_1747246940
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4DA9B1956050;
	Wed, 14 May 2025 18:22:19 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.22])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E940A180087A;
	Wed, 14 May 2025 18:22:11 +0000 (UTC)
Date: Wed, 14 May 2025 19:22:08 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, kvmarm@lists.linux.dev,
	peter.maydell@linaro.org, richard.henderson@linaro.org,
	alex.bennee@linaro.org, maz@kernel.org, oliver.upton@linux.dev,
	sebott@redhat.com, shameerali.kolothum.thodi@huawei.com,
	armbru@redhat.com, abologna@redhat.com, jdenemar@redhat.com,
	agraf@csgraf.de, shahuang@redhat.com, mark.rutland@arm.com,
	philmd@linaro.org, pbonzini@redhat.com
Subject: Re: [PATCH v3 08/10] arm/cpu: more customization for the kvm host
 cpu model
Message-ID: <aCTe5kEN1WdgZ74T@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20250414163849.321857-1-cohuck@redhat.com>
 <20250414163849.321857-9-cohuck@redhat.com>
 <aCNsSbDoi5oKWYul@redhat.com>
 <875xi3cig5.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <875xi3cig5.fsf@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-TUID: LCFNonOwlNoV

On Wed, May 14, 2025 at 05:36:58PM +0200, Cornelia Huck wrote:
> On Tue, May 13 2025, Daniel P. Berrangé <berrange@redhat.com> wrote:
> 
> > On Mon, Apr 14, 2025 at 06:38:47PM +0200, Cornelia Huck wrote:
> >> From: Eric Auger <eric.auger@redhat.com>
> >> 
> >> If the interface for writable ID registers is available, expose uint64
> >> SYSREG properties for writable ID reg fields exposed by the host
> >> kernel. Properties are named  SYSREG_<REG>_<FIELD> with REG and FIELD
> >> being those used  in linux arch/arm64/tools/sysreg. This done by
> >> matching the writable fields retrieved from the host kernel against the
> >> generated description of sysregs.
> >> 
> >> An example of invocation is:
> >> -cpu host,SYSREG_ID_AA64ISAR0_EL1_DP=0x0
> >> which sets DP field of ID_AA64ISAR0_EL1 to 0.
> >
> > For the value you are illustrating 0x0 - is this implying that
> > all the flags take an arbitrary integer hex value ?
> >
> > This would be different from x86, where CPU feature flags are
> > a boolean on/off state.
> 
> Most of the fields are 4 bits, the allowed values vary (there are also
> some fields that are single bits, or wider.) The FEAT_xxx values (which
> can be expressed via ID register fields, or a combination thereof) are
> mostly boolean, but there are also some of them that can take values.
> 
> We could cook up pseudo-features that are always on/off, but I don't
> like that approach: they would be QEMU only, whereas the ID register
> fields and FEAT_xxx features are all defined in the Arm documentation.

Fortunately from a libvirt POV we can likely expand our config
to cope with hex values for arm features without too much
trouble.

> 
> An additional difference from x86 would be that FEAT_xxx featues are not
> neccessarily configurable (only if the host kernel supports changing the
> ID register field(s) backing the feature.)

Is the kernel able to tell us which ones are configurable and which
are not ? If so, it'd be helpful to expose this info in QAPI some
place.

> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
