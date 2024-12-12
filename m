Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp4656796njb;
        Thu, 12 Dec 2024 01:36:56 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXGjYgqua4lOLS4h1PKbH6eIiVkWawnEPT45KXslfx+UG046FQ0js6wIXXSvTXoUKm9vPv2OuVznlUinw==@linaro.org
X-Google-Smtp-Source: AGHT+IFVDFmTisqcbyUN6uzD+4DJyWNjXcM3Qz5fof0FvxxZcw+CXpb8dkIJ6c2MjSCBQncZtYEs
X-Received: by 2002:a05:620a:2783:b0:7ac:c348:6a52 with SMTP id af79cd13be357-7b6f2569803mr380343485a.34.1733996216285;
        Thu, 12 Dec 2024 01:36:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733996216; cv=none;
        d=google.com; s=arc-20240605;
        b=dYhHMEOWwjS2BGKfT/Q4zEitOtCI8zJN4fnCfkhS4f3Yc2yTBy3CFAuEi2ZCmlhGhH
         KCIFWlBTUD3ZJ3yrQyn+UhAc/vhmBGj+ZY3PsR8jMTMfCKYJdnaWlAR1U/3C8yvMmkBZ
         0K7aKqKyJBNvnGyQIPdWV5egJLn0aFbj4PXGNgevegBU95O3vA8WlqXgK2SjGu35HTFV
         mP5Ix8BmtSlTpIYunfYZJqZhQjPyKZ56AqidXEHVrJKAkt46R795OZfpDuACYWGYWebB
         2BDnHEiMuy3o4NCpF2OTJdXRVI2POy+dqzaaaRNT+ONohpI8M6ELxzhQcOyMzZUVTyQo
         a1IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:organization:in-reply-to:subject:cc:to:from
         :dkim-signature;
        bh=0le+hEokhYiZAYCKfki7cLSm1RRAIf5/On72KterXG0=;
        fh=ilEMv6/yY9WvStvLMAzrXhwdU5K3op49f3IZdXpv0Bc=;
        b=BuWP84DSAcMxE/hjB+G/wllG+d4b3Q6/uzJ+ywHe0ynzQuLCf9uagYSec6QR6giPx6
         EtiPVZsgUfEybTShYoh5/I+qlzXb2RirsyBFNLumUG3xOtkA+QyLNJaMpx26AMrirt0f
         7etQLGiF0AN8GS9maKvgue4wMOzCl5g6QAufHp+JryzdhZn2AiZZYvUREg/yBlr/4TAQ
         nhzB2M8fodV6jq+xpG6rWDlqVW6Lx+n5nGvaq5LHoPmGmzyFMNSb9xxqMByHi03d+Y60
         5ITpJalDrM1IE685R3xifB1+T2N2QQjmydeliVzXmfjtJjD18uVVabfTbybdOT5hR76m
         j3ZA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BOGZRkdV;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7b6d297d3cbsi1171936885a.300.2024.12.12.01.36.56
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 01:36:56 -0800 (PST)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BOGZRkdV;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733996215;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0le+hEokhYiZAYCKfki7cLSm1RRAIf5/On72KterXG0=;
	b=BOGZRkdVr0Y/VYeDLXD7bW2nm7qVeQSeqoSfhaDRMlQCBIFMi22siBXVXZt9kS5bosc6yQ
	rQc7zBqYd84JLmiVrQS4WIeyECKPwtGpYBNTsndc0qnknFwH8872KlG4CkDWnIW6W7eIa9
	6rf/u53p7hgxAL8Jrw5peOJtBsNJhJ0=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-86-aOovSca8PIOFOobEMdvSpQ-1; Thu,
 12 Dec 2024 04:36:52 -0500
X-MC-Unique: aOovSca8PIOFOobEMdvSpQ-1
X-Mimecast-MFC-AGG-ID: aOovSca8PIOFOobEMdvSpQ
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id BA4BA19560BD;
	Thu, 12 Dec 2024 09:36:49 +0000 (UTC)
Received: from localhost (dhcp-192-244.str.redhat.com [10.33.192.244])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1B1B530044C1;
	Thu, 12 Dec 2024 09:36:47 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, Eric Auger
 <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 kvmarm@lists.linux.dev, peter.maydell@linaro.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
 oliver.upton@linux.dev, sebott@redhat.com,
 shameerali.kolothum.thodi@huawei.com, armbru@redhat.com,
 abologna@redhat.com, jdenemar@redhat.com, shahuang@redhat.com,
 mark.rutland@arm.com, philmd@linaro.org, pbonzini@redhat.com
Subject: Re: [PATCH RFCv2 00/20] kvm/arm: Introduce a customizable aarch64
 KVM host model
In-Reply-To: <Z1qoa8yXscTSAJ9e@redhat.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20241206112213.88394-1-cohuck@redhat.com>
 <edc12140-6345-4868-938d-c80c4d2c2004@redhat.com>
 <Z1qoa8yXscTSAJ9e@redhat.com>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Thu, 12 Dec 2024 10:36:45 +0100
Message-ID: <8734it1bv6.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-TUID: rbrEeY7T4Yp5

On Thu, Dec 12 2024, Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> On Thu, Dec 12, 2024 at 09:12:33AM +0100, Eric Auger wrote:
>> Connie,
>>=20
>> On 12/6/24 12:21, Cornelia Huck wrote:
>> > A respin/update on the aarch64 KVM cpu models. Also available at
>> > gitlab.com/cohuck/qemu arm-cpu-model-rfcv2
>
> snip
>
>> From a named model point of view, since I do not see much traction
>> upstream besides Red Hat use cases, targetting ARM spec revision
>> baselines may be overkill. Personally I would try to focus on above
>> models: AltraMax, AmpereOne, Grace, ... Or maybe the ARM cores they may
>> be derived from.
>
> If we target modelling of vendor named CPU models, then beware that
> we're opening the door to an very large set (potentially unbounded)
> of named CPU models over time. If we target ARM spec baselines then
> the set of named CPU models is fairly modest and grows slowly.
>
> Including ARM spec baselines will probably reduce the demand for
> adding vendor specific named models, though I expect we'll still
> end up wanting some, or possibly even many.
>
> Having some common baseline models is likely useful for mgmt
> applications in other ways though.
>
> Consider you mgmt app wants to set a CPU model that's common across
> heterogeneous hardware. They don't neccessarily want/need to be
> able to live migrate between heterogeneous CPUs, but for simplicity
> of configuration desire to set a single named CPU across all guests,
> irrespective of what host hey are launched on. The ARM spec baseline
> named models would give you that config simplicity.

If we use architecture extensions (i.e. Armv8.x/9.x) as baseline, I'm
seeing some drawbacks:
- a lot of work before we can address some specific use cases
- old models can get new optional features
- a specific cpu might have a huge set of optional features on top of
  the baseline model

Using a reference core such as Neoverse-V2 probably makes more sense
(easier to get started, less feature diff?) It would still make a good
starting point for a simple config.
