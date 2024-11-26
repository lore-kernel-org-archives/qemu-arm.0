Received: by 2002:a17:504:794b:b0:1be9:327d:8ee3 with SMTP id uo11csp64020njb;
        Tue, 26 Nov 2024 05:46:11 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVEqNGrSoCFetiVOtJwBZaVTQA45rBUUE4t7qVQaW2zGcr1wd/T7SIoASXJyGl0iCKozZ3Ylzcm1dPJ/w==@linaro.org
X-Google-Smtp-Source: AGHT+IHjDG2qIUDluea1AT5VvnArhfZCB1cuNN/ljYXgq5hL54rAkkSrvKhZbIQgf46GZi7DB2dZ
X-Received: by 2002:a05:620a:198d:b0:7ac:aad3:9135 with SMTP id af79cd13be357-7b674542a42mr611798985a.15.1732628770848;
        Tue, 26 Nov 2024 05:46:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732628770; cv=none;
        d=google.com; s=arc-20240605;
        b=MECF1cSkrSx7cPaKsBS8FIL1hZm8v0B45T/TgSJbYlW3Q84e4zMptU/XtYySlW/sGJ
         g8bXBvZXnv3xns0f4MeIXOL2igkEEajyjUZsJCxEw3Q7af1q4GD/2Ni8ngJr6JFHaXnk
         p0ORw+kTvxoQOqwtZLHxKsmeIcf62wIreV7S8KzCEgSW1WuMD8D5PLDjbgleuBcMg82D
         8M7Tmi00zxnqHFjhhdb/Hb/DVx68HQO/Xdv02uU/eZmVRn7nsJx8wTEz53dbJ+CGog3T
         zQBj4P+nFynzNVu08weKpbADKHwLrmxun8TMp80R32YdWu+BBlaWs7qW0P96DTm5J3//
         Kiwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:dkim-signature;
        bh=ZJTlDIDAnLLiWxccqjWOmK1Gni8JZ4CGXNJVthvIHfw=;
        fh=Tz8jKszesqQ785NSIS9Sbiqalze57imUmm3Ksi3qrd8=;
        b=An/4QAJ59rWL+jk/S/6AP9TNC1143wIQGQ2x5Je2BNy4xzE2m2vYqxQ3OAO8mHigRA
         qday0HCTexxys7XmpH2ka+Oe+Jky+sQdnbXoaDzi9BdYPWd7LAb+gi09qgr5vxnKWUdj
         llhXJkOklm5ZS8gV7gUjb+eFsS2VrabhRfQ6rRJ1UyWDky/eNEdGOl+3Y89qOAK2p2c0
         yD9obyIOtRzZZxeZsu4U5NAWIfjN0lrHWF7FpkO/Ps9MBzU8u+lAjjkEs5vdddpwvzyk
         ulbzqhroYCA//dx3PLDiEaoRGycTjUh1YVtxDxSBerpyQte34m09vFDggEZfqJfjDx2b
         tj/g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iL0j4lLu;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7b657595476si1092446285a.543.2024.11.26.05.46.10
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 05:46:10 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iL0j4lLu;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732628770;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=ZJTlDIDAnLLiWxccqjWOmK1Gni8JZ4CGXNJVthvIHfw=;
	b=iL0j4lLuQLW9dawcUUc21GoXxWQ4g5sEmYyuAiyue3O804cZXRSuqzZaFPUWW0L0wtzLIz
	01PJUUIr49E4FDl78gsbpp3ssicEH0Od3MPqsd159SUHrBH4Cd6LN+HuUsYvAyvGQZXsEB
	m8U7MmN96FgQ7bDNGi1PlGGPZ0u8pLM=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-99-Cq5oK5N1NiSUkG1mG0Chsg-1; Tue,
 26 Nov 2024 08:46:06 -0500
X-MC-Unique: Cq5oK5N1NiSUkG1mG0Chsg-1
X-Mimecast-MFC-AGG-ID: Cq5oK5N1NiSUkG1mG0Chsg
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 54BA319560B4;
	Tue, 26 Nov 2024 13:46:03 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.147])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E8E9B1944CC9;
	Tue, 26 Nov 2024 13:45:58 +0000 (UTC)
Date: Tue, 26 Nov 2024 13:45:55 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Berger <stefanb@linux.ibm.com>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
	peter.maydell@linaro.org, richard.henderson@linaro.org,
	philmd@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	alex.bennee@linaro.org, Stefan Berger <stefanb@linux.vnet.ibm.com>
Subject: Re: [RFC PATCH v3 25/26] target/arm/kvm-rme: Add measurement log
Message-ID: <Z0XREyMovNyB4s6t@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20241125195626.856992-2-jean-philippe@linaro.org>
 <20241125195626.856992-27-jean-philippe@linaro.org>
 <02b90518-2996-4231-bee9-43ce313669b0@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <02b90518-2996-4231-bee9-43ce313669b0@linux.ibm.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-TUID: uOccfA3XdoEC

On Mon, Nov 25, 2024 at 05:23:44PM -0500, Stefan Berger wrote:
> 
> 
> On 11/25/24 2:56 PM, Jean-Philippe Brucker wrote:
> > Create an event log, in the format defined by Trusted Computing Group
> > for TPM2. It contains information about the VMM, the Realm parameters,
> > any data loaded into guest memory before boot and the initial vCPU
> > state.
> > 
> > The guest can access this log from RAM and send it to a verifier, to
> > help the verifier independently compute the Realm Initial Measurement,
> > and check that the data we load into guest RAM is known-good images.
> > Without this log, the verifier has to guess where everything is loaded>
> and in what order.
> 
> Typically these logs are backed by extensions of TPM PCRs and when you send
> a log to a verifier you send a TPM quote along with it for the verifer to
> replay the log and check the TPM quote. Also, early code in the firmware is
> typically serving as a root of trust that starts the chain of measurements
> of code and data, first measuring itself and then other parts of the
> firmware before it jumps into the other parts. Now here you seem to just
> have a log and no PCR extensions and therefore no quote over PCRs can be
> used. Then what prevents anyone from faking this log and presenting a
> completely fake log to the verifier?

In addition, a measurement log is just one of the interesting features
that a TPM provides to OS. The other TPM features are still relevant
and useful to confidential VMs.

As a high level goal I think we should be aiming to make it possible for
users to move their existing VM workloads from non-confidentail to
confidential environments, simply as a choice at deployment time. To make
this as practical as possible, confidential VMs  need to be aiming to
match non-confidential VM features where ever it is practical to do so.
Users & vendors should not need to build & carry around 2 sets of disk
images - one setup for confidential and one setup for non-confidential.
Following existing standards will reduce the work both for OS developers,
app developers and users alike, to adopt the CVM world.

IOW, this is a long winded way of saying that we should be looking to
provide a complete *standards compliant*, trusted TPM implementation to
confidential VMs, not providing a cherry-picked selection of a few
TPM-like features.

On the x86 side of things, the route to providing a trusted TPM is via
SVSM, both for SNP and TDX. Microsoft's recently open sources openhcl
similarly provides a st

I don't know so much about RME. Is providing a trusted TPM a job for
the RMM ?

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
