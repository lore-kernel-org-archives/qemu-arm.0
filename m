Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp1825821njk;
        Thu, 19 Dec 2024 09:52:04 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUZWNRu3PvaR+hDl12kA/jPEr6E4sQUGs81Ur0iRU9qoUFDVB8XOKREijpGpbpBrDzylnxcxVM/FWXHLg==@linaro.org
X-Google-Smtp-Source: AGHT+IEaDE2uGyZ5Sv9i3Q8FskRddvJtIYQE9JtpFkFqtRDFuN1nX209EAiHVK73aRnPu2NgfZLe
X-Received: by 2002:a05:620a:40d4:b0:7b6:dd11:5e5f with SMTP id af79cd13be357-7b9aa99f111mr618300185a.13.1734630723498;
        Thu, 19 Dec 2024 09:52:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734630723; cv=none;
        d=google.com; s=arc-20240605;
        b=LQZWGdG03zKP/QiTgLBU/JEJ+1Uwx+DQOlTqy39n9RxPkJhLpGajbKUttleH9JPwAm
         hznxJ9pHNiiVc1EQe5KrXpG8jr7iA+U1pzs8g3ovTPzo4YHkKNntl9QQIcn6cyZ7xjYD
         gOTiyvUN1DYgR0yxWVxi4+vBs0WqWWN07V3148Q9bNNQbM4oI0fbH5EgWiKMVFgLsiRm
         SJ+PIbMFwzlXwnqTO+fWh94SMSN7vXgJuUc0S1B/95uxW6VoCUYojXPLwZXsyL0mrUN0
         u2hokiTrWihHG1wcHxJ9nlILqHIZcDadLkJNtkrm2YDS7OZCvLrWVeeEgM9gOMTUCdGd
         mzvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=/65f699+zP0hxZzXVK7O5ivtKVynSZ4cs9bwdZ4NyD0=;
        fh=seaAqXBScxAO1T4Z+y4srNPzJT5bgOvmFgfYqUzLS4s=;
        b=ILI28M0siundU6ZSACbcZRNOXnPrVgsAbRO89UgV9Jovq0fepT/WJSzQdlSTZKd4K5
         opHIVha4098YTyUUj3SLL60NSL8YWQ8JnQdwMSJ+Gxmou5fLvDMp2FHbrsqDPKxp4kNc
         mc1P1e36ChBBmq54HmHTrSrOSjd9Dxgb6kYxI+GaOMRI5M6H1Lx148GX+BjKWtGJm3a9
         3cUNH9ak/EAvxa5/OxjocwlKpYRYF9gTA8meBmj8H6VXQpLn3gg3wRc89dqXiyZx2c2S
         2S6To9IszBotKrlsAoyFxBVH+cz1bycnce30e3yePx3Uet71FW/iBQAUl1j0Yxko1suO
         n8nw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=N5Hhw4OB;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7b9ac47a42bsi199060685a.298.2024.12.19.09.52.03
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 09:52:03 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=N5Hhw4OB;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734630723;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/65f699+zP0hxZzXVK7O5ivtKVynSZ4cs9bwdZ4NyD0=;
	b=N5Hhw4OBdBc/vMfbV1hLjIww6Ve5ERYs4Z30MKA+0FACmK+P8k6VBO7D9fAb5p0cmxYOGy
	fAL3NcUqcCPei6i6UN95RQ4iGPLseu7twdkDOcOHy+sl8DQFxTjwwX576Nvvv4J3NTFn+Y
	HgO+oiHjK75Nf6sKggUZFZ5oUMqOJFE=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-127-e4tCeR3XMtKyv4rSvegFPA-1; Thu,
 19 Dec 2024 12:51:59 -0500
X-MC-Unique: e4tCeR3XMtKyv4rSvegFPA-1
X-Mimecast-MFC-AGG-ID: e4tCeR3XMtKyv4rSvegFPA
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 51B0419560B7;
	Thu, 19 Dec 2024 17:51:56 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.54])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C4A9019560A2;
	Thu, 19 Dec 2024 17:51:47 +0000 (UTC)
Date: Thu, 19 Dec 2024 17:51:44 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Kashyap Chamarthy <kchamart@redhat.com>,
	Eric Auger <eric.auger@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>, eric.auger.pro@gmail.com,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvmarm@lists.linux.dev,
	peter.maydell@linaro.org, richard.henderson@linaro.org,
	alex.bennee@linaro.org, oliver.upton@linux.dev, sebott@redhat.com,
	shameerali.kolothum.thodi@huawei.com, armbru@redhat.com,
	abologna@redhat.com, jdenemar@redhat.com, shahuang@redhat.com,
	mark.rutland@arm.com, philmd@linaro.org, pbonzini@redhat.com
Subject: Re: [PATCH RFCv2 00/20] kvm/arm: Introduce a customizable aarch64
 KVM host model
Message-ID: <Z2RdMJHydsvPpmdH@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20241206112213.88394-1-cohuck@redhat.com>
 <edc12140-6345-4868-938d-c80c4d2c2004@redhat.com>
 <Z1qoa8yXscTSAJ9e@redhat.com>
 <8734it1bv6.fsf@redhat.com>
 <1fea79e4-7a31-4592-8495-7b18cd82d02b@redhat.com>
 <Z2QE9AqZnpGM5sWD@gezellig>
 <8634ijrh8q.wl-maz@kernel.org>
 <Z2Q2rWj9cV0W_XVq@gezellig>
 <86zfkrptmj.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <86zfkrptmj.wl-maz@kernel.org>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: PD/McXIBeiuJ

On Thu, Dec 19, 2024 at 03:41:56PM +0000, Marc Zyngier wrote:
> On Thu, 19 Dec 2024 15:07:25 +0000,
> Kashyap Chamarthy <kchamart@redhat.com> wrote:
> > 
> > On Thu, Dec 19, 2024 at 12:26:29PM +0000, Marc Zyngier wrote:
> > > On Thu, 19 Dec 2024 11:35:16 +0000,
> > > Kashyap Chamarthy <kchamart@redhat.com> wrote:
> > 
> > [...]
> > 
> > > > Consider this:
> > > > 
> > > > Say, there's a serious security issue in a released ARM CPU.  As part of
> > > > the fix, two new CPU flags need to be exposed to the guest OS, call them
> > > > "secflag1" and "secflag2".  Here, the user is configuring a baseline
> > > > model + two extra CPU flags, not to get close to some other CPU model
> > > > but to mitigate itself against a serious security flaw.
> > > 
> > > If there's such a security issue, that the hypervisor's job to do so,
> > > not userspace. 
> > 
> > I don't disagree.  Probably that has always been the case on ARM.  I
> > asked the above based on how QEMU on x86 handles it today.
> > 
> > > See what KVM does for CSV3, for example (and all the
> > > rest of the side-channel stuff).
> > 
> > Noted.  From a quick look in the kernel tree, I assume you're referring
> > to these commits[1].
> > 
> > > You can't rely on userspace for security, that'd be completely
> > > ludicrous.
> > 
> > As Dan Berrangé points out, it's the bog-standard way QEMU deals with
> > some of the CPU-related issues on x86 today.  See this "important CPU
> > flags"[2] section in the QEMU docs.
> 
> I had a look, and we do things quite differently. For example, the
> spec-ctrl equivalent in implemented in FW and in KVM, and is exposed
> by default if the HW is vulnerable. Userspace could hide that the
> mitigation is there, but that's the extent of the configurability.

Whether it is enabled by default or disabled by default isn't a
totally fatal problem. If QEMU can toggle it to the opposite value,
we have the same level of configurability in both cases.

It does, however, have implications for QEMU as if KVM gained support
for exposing the new feature by default and QEMU didn't know about
it, then the guest ABI would have changed without QEMU realizing it.

IOW, it would imply a requirement for timely QEMU updates to match
the kernel, which is something we wouldn't need in x86 world where
the feature is disabled by default. Disable by default is a more
stable approach from QEMU's POV.

> > Mind you, I'm _not_ saying this is how ARM should do it.  I don't know
> > enough about ARM to make such remarks.
> > 
> >     * * *
> > 
> > To reply to your other question on this thread[3] about "which ABI?"  I
> > think Dan is talking about the *guest* ABI: the virtual "chipset" that
> > is exposed to a guest (e.g. PCI(e) topology, ACPI tables, CPU model,
> > etc).  As I understand it, this "guest ABI" should remain predictable,
> > regardless of:
> > 
> >   - whether you're updating KVM, QEMU, or the underlying physical
> >     hardware itself; or
> >   - if the guest is migrated, live or offline
> > 
> > (As you might know, QEMU's "machine types" concept allows to create a
> > stable guest ABI.)
> 
> All of this is under control of QEMU, *except* for the "maximum" of
> the architectural features exposed to the guest. All you can do is
> *downgrade* from there, and only to a limited extent.
> 
> That, in turn has a direct impact on what you call the "CPU model",
> which for the ARM architecture really doesn't exist. All we have is a
> bag of discrete features, with intricate dependencies between them.
> 
> Even ignoring virtualisation: you can readily find two machines using
> the same CPUs (let's say Neoverse-N1), integrated by the same vendor
> (let's say, Ampere), in SoCs that bear the same name (Altra), and
> realise that they have a different feature set. Fun, isn't it?

"Fun" is probably not the word I'd pick :-)

> That's why I don't see CPU models as a viable thing in terms of ABI.
> They are an approximation of what you could have, but the ABI is
> elsewhere.

Right, this makes life quite challenging for QEMU. The premise of named
CPU models (as opposed to -host), is to facilitate the migration of VMs
between heterogenous hardware platforms. That assumes it is possible to
downgrade the CPU on both src + dst, to the common baseline you desire.

If we were to define a named CPU model, for that to be usable, QEMU
would have to be able to query the "maxmimum" architectural features,
and validate that the delta between the host maximum, and the named
CPU model is possible to downgrade. Is arm providing sufficient info
to let QEMU do that ?

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
