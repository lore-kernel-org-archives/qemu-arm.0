Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp1599840njk;
        Thu, 19 Dec 2024 04:39:08 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVVAaudIMnjCO8x6+QyXP0s6cwpSACvw7oPwckfxgjsjKRy8xvCMxa+WUj2ifLXvV9z1WALBD5dB655Ew==@linaro.org
X-Google-Smtp-Source: AGHT+IEaRkRRaJFRH2305N2G6RO22ZGPXpQMlZ0U0Z69NnwvMvBx+mK7mm5HUC2ixOqDHovNZa1I
X-Received: by 2002:ac8:5d8c:0:b0:461:2150:d59c with SMTP id d75a77b69052e-46908db3e25mr93617181cf.9.1734611947922;
        Thu, 19 Dec 2024 04:39:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734611947; cv=none;
        d=google.com; s=arc-20240605;
        b=hNiJ/HAFEtUE35xV6siUR3VQsD/U0HhgIR3IlskyYUyaOe84b+XG7gwYX5qk8JWlyl
         sYE/q9bzNqjTLAUNcKO0EcgS1IFQlmHdxfGhqXoqWT3R8WW9oaCzfY6c7JSMpreeQXr/
         q4igdI82/g5AyuKHdJ4GO9U0dq7DACbqvLqvpQjOmLcOU6buV89GLNOhw3xI9/+URcPA
         VHqWa58NANUpALeyvhwDXSYhsql7pM9UNBBSnYrcXyhMGYuCl4pdvSgHu7nQirtthHlr
         sky27Cwb5EAqFFRXkMtjwCFfLEmDcIqGziDqvKVXSKZPVfPjuBP9Gae5PXPzzYlbE/7P
         WXnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=fhiPUPZQ0AMGEuAyDVsE8XZthGjbA0R6smLyaEHnnpU=;
        fh=seaAqXBScxAO1T4Z+y4srNPzJT5bgOvmFgfYqUzLS4s=;
        b=UzyqNkIEfLOND6wVuNmI4Fjb5mSIl3/R7T2J69cbIvuTjKb7cTGlM7KKVBEElstu1K
         e/lK/Kq5cOdPFRcfgz/AyvKoGjgiUcUtpvrsJ104aCI5BPgvrtLLj5Qd1z81dujAjONz
         8FlaV3INL9/mUJac3HrryFOMZ/YGAYH6IFYJapDu8A+4dF/EImT12yblgpNuTR4oTUHT
         Ec/Lx8oDsFTF+Ydjy48uOkNmf4fx3VkrtTUeTB5Y3o0LQIr48E6Bh0upNWrhhqapxO5c
         fl67b9JxCBeKIuuL3Ma8lc+PTtGyYAapPI+WK9lvZOM/UTYstC477Z+H8vZl+0mucOcl
         FLVA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BYlaiUwG;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-46a3ec06260si13870981cf.703.2024.12.19.04.39.07
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Dec 2024 04:39:07 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BYlaiUwG;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734611947;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fhiPUPZQ0AMGEuAyDVsE8XZthGjbA0R6smLyaEHnnpU=;
	b=BYlaiUwGtZRJxOl0kq/m4Emz6mt8HZIVWQw8Sa5ySvYtqYfSQl4iDbOCqfxOL7EtxZ0are
	0O/JhcCp1YAMh4ni2KaJzrU/Ha6kbD2I6ppGLsh3JuZklrJlDsEWq/C9PxnllnWoqNZRWM
	CNK7B/QfRgASPcugrzOvdKqMYd41Vw0=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-205-jNgmZASkP-i0LclUZH_bkA-1; Thu,
 19 Dec 2024 07:39:04 -0500
X-MC-Unique: jNgmZASkP-i0LclUZH_bkA-1
X-Mimecast-MFC-AGG-ID: jNgmZASkP-i0LclUZH_bkA
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1C3D61955F3E;
	Thu, 19 Dec 2024 12:39:02 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.54])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9C891300F9B5;
	Thu, 19 Dec 2024 12:38:54 +0000 (UTC)
Date: Thu, 19 Dec 2024 12:38:50 +0000
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
Message-ID: <Z2QT2tPbC1GsTJVL@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20241206112213.88394-1-cohuck@redhat.com>
 <edc12140-6345-4868-938d-c80c4d2c2004@redhat.com>
 <Z1qoa8yXscTSAJ9e@redhat.com>
 <8734it1bv6.fsf@redhat.com>
 <1fea79e4-7a31-4592-8495-7b18cd82d02b@redhat.com>
 <Z2QE9AqZnpGM5sWD@gezellig>
 <8634ijrh8q.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8634ijrh8q.wl-maz@kernel.org>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-TUID: DNEhNLZA3MHI

On Thu, Dec 19, 2024 at 12:26:29PM +0000, Marc Zyngier wrote:
> On Thu, 19 Dec 2024 11:35:16 +0000,
> Kashyap Chamarthy <kchamart@redhat.com> wrote:
> > 
> > On Thu, Dec 12, 2024 at 11:04:30AM +0100, Eric Auger wrote:
> > 
> > Hi Eric,
> > 
> > > On 12/12/24 10:36, Cornelia Huck wrote:
> > > > On Thu, Dec 12 2024, Daniel P. Berrangé <berrange@redhat.com> wrote:
> > 
> > [...]
> > 
> > > >> Consider you mgmt app wants to set a CPU model that's common across
> > > >> heterogeneous hardware. They don't neccessarily want/need to be
> > > >> able to live migrate between heterogeneous CPUs, but for simplicity
> > > >> of configuration desire to set a single named CPU across all guests,
> > > >> irrespective of what host hey are launched on. The ARM spec baseline
> > > >> named models would give you that config simplicity.
> > > > If we use architecture extensions (i.e. Armv8.x/9.x) as baseline, I'm
> > > > seeing some drawbacks:
> > > > - a lot of work before we can address some specific use cases
> > > > - old models can get new optional features
> > > > - a specific cpu might have a huge set of optional features on top of
> > > >   the baseline model
> > > >
> > > > Using a reference core such as Neoverse-V2 probably makes more sense
> > > > (easier to get started, less feature diff?) It would still make a good
> > > > starting point for a simple config.
> > > >
> > > Actually from a dev point of view I am not sure it changes much to have
> > > either ARM spec rev baseline or CPU ref core named model.
> > > 
> > > One remark is that if you look at
> > > https://developer.arm.com/documentation/109697/2024_09?lang=en
> > > you will see there are quite a lot of spec revisions and quite a few of
> > > them are actually meaningful in the light of currently avaiable and
> > > relevant HW we want to address. What I would like to avoid is to be
> > > obliged to look at all of them in a generic manner while we just want to
> > > address few cpu ref models.
> > > 
> > > Also starting from the ARM spec rev baseline the end-user may need to
> > > add more feature opt-ins to be close to a specific cpu model. So I
> > > foresee extra complexity for the end-user.
> > 
> > (Assuming I'm parsing your last para right; correct me if not.)
> > 
> > Isn't a user wanting to add extra CPU flags (on top of a baseline) a
> > "normal behaviour" and not "extra complexity"?  Besides coming close to
> > a specific CPU model, there's the additional important use-case of CPU
> > flags that provide security mitigation.
> > 
> > Consider this:
> > 
> > Say, there's a serious security issue in a released ARM CPU.  As part of
> > the fix, two new CPU flags need to be exposed to the guest OS, call them
> > "secflag1" and "secflag2".  Here, the user is configuring a baseline
> > model + two extra CPU flags, not to get close to some other CPU model
> > but to mitigate itself against a serious security flaw.
> 
> If there's such a security issue, that the hypervisor's job to do so,
> not userspace. See what KVM does for CSV3, for example (and all the
> rest of the side-channel stuff).
> 
> You can't rely on userspace for security, that'd be completely
> ludicrous.

Actually that's a normal situation QEMU has to deal with.

QEMU needs to be able to expose a deterministic fixed ABI to the guest
VM, and that includes control over what CPU features are exposed to
it. In most cases, the hypervisor cannot arbitrary force enable new
guest features without agreement from QEMU.

If a guest happens to be using '-cpu host', then when a new CPU flag
arrives as part of a security fix, there is at least no CPU config
change required. QEMU may or may not need changes, in order that
the behaviour associated with the new CPU flag is correctly handled.

If the guest is using a named CPU model, as well as modifying QEMU
to know about the new flag, the host admin needs to explicitly
decide whether & when to expose the new CPU flag for each guest VM
on the host.

Until the new CPU flag is exposed to the guest, while the host itself
may be able to remain protected to the new security issue, the guest
OS is likely remain vulnerable, or have degraded operation in some way.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
