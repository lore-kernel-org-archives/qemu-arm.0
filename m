Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp2472642njk;
        Fri, 20 Dec 2024 08:04:41 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWKTyWgsEfYkhnkwOP1Mvoj1g4UxBP2Tc0Ru8aJJG47ZV4+/G6uomrSWuIKkkFIn5ZymN1fnOEyzXyxHA==@linaro.org
X-Google-Smtp-Source: AGHT+IHdAhDKEfW9CEZ8lN3MsJMz5scZsxZQpENhhT06MrrWwfQESVO6fsVElZ0xCguSNx24lTjx
X-Received: by 2002:a2e:b8c6:0:b0:300:7f87:a4f with SMTP id 38308e7fff4ca-30468557147mr13486531fa.19.1734710680616;
        Fri, 20 Dec 2024 08:04:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734710680; cv=none;
        d=google.com; s=arc-20240605;
        b=V1+Sf7AmtGm9wZdUoGWgZEWocnHO5tetAv/awLMx+oQjPE4rkED2I0zr5MnV7RtHrE
         o7pQk8OCrx8RkwQTCva3PyRGMyuU+exAcawEN2o8T6TmXd9ZLGspmV6/cxMa5BGccYjg
         gVh4SN34KNWtfBlTxFvZFIPbUI9qXIEpwm59+5m7uJ6ni35vPZqk8ZDPJ0bSIlVqiAGl
         f1/RuktitDq/DypsIID6ExbMuAvM2q9xUzrlmYWJCeX2Btu41Pa8dJEf9kwSLdPAG6uq
         F7XrcINhIk5iwddA9U31JrMyvhtl18bQvtpxvzBg8CkLx4OmNJTdaAUVLW4aYxJ7cPmU
         uq8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:organization:in-reply-to:subject:cc:to:from
         :dkim-signature;
        bh=zg7ccD/W/XlqMMpPf1cKO8U1jMkrmDqjiLXSn0kHDWA=;
        fh=astamPkKkScWQ40ZPMKzCXzP+oEhWiTj3ASsXYhnxx4=;
        b=hSn16utIolOHzwW1YIAxpFK4f9zUsoAO3JhLGAIK54+4bJ8ZJqyxhBz1kjfHF7WqeN
         Hh8wa476Hk4iTPglswzmEYtxx0Zuo7OzeQkkXGSSLUMVmHr/p0MposVa2nCBDV1rt1jP
         cW59u8JwUF7DBF1ECAX4KzCkrMIMty8DsVWMWxNyhiQjeS/wLbHQCd/pWj6m86p7Y2PF
         E8/rpqUsj9sz0wU78f+KuBmGwyEtDSbUy7LgDHPZqLQZI9WqmGfhT6jKXXNxmSaOHzOY
         KrFZXMt5xYsqallJdk7fi46RvMfgoUYFzEj/fmrWFIXunEYgHACZTeBxyc3xwQNH6fq9
         GL9g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ti9b2STK;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 38308e7fff4ca-3045b07024fsi13699841fa.200.2024.12.20.08.04.40
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 08:04:40 -0800 (PST)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ti9b2STK;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734710678;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zg7ccD/W/XlqMMpPf1cKO8U1jMkrmDqjiLXSn0kHDWA=;
	b=Ti9b2STK0ABnttyLtbrdwPmRyHgeVc01aoGOSwl0002FcXu0g6z4d50ehHYVUhCyw+FsdL
	MSyCmLKozccm+BtQhIH2Oo8C/v9r6DP0E3m1ntTJJy/SU6tiRNr4dXb+54EQTp1VUQ0v5s
	M8BvyR1+x8DMde29K7+2uH44Qz4hB64=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-224-oIlcAF56MTS_mgkSjF_NPg-1; Fri,
 20 Dec 2024 11:04:33 -0500
X-MC-Unique: oIlcAF56MTS_mgkSjF_NPg-1
X-Mimecast-MFC-AGG-ID: oIlcAF56MTS_mgkSjF_NPg
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DD3FB1956088;
	Fri, 20 Dec 2024 16:04:30 +0000 (UTC)
Received: from localhost (dhcp-192-244.str.redhat.com [10.33.192.244])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 17819195608A;
	Fri, 20 Dec 2024 16:04:27 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, Marc
 Zyngier <maz@kernel.org>
Cc: Kashyap Chamarthy <kchamart@redhat.com>, Eric Auger
 <eric.auger@redhat.com>, eric.auger.pro@gmail.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, kvmarm@lists.linux.dev, peter.maydell@linaro.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org,
 oliver.upton@linux.dev, sebott@redhat.com,
 shameerali.kolothum.thodi@huawei.com, armbru@redhat.com,
 abologna@redhat.com, jdenemar@redhat.com, shahuang@redhat.com,
 mark.rutland@arm.com, philmd@linaro.org, pbonzini@redhat.com
Subject: Re: [PATCH RFCv2 00/20] kvm/arm: Introduce a customizable aarch64
 KVM host model
In-Reply-To: <Z2RdMJHydsvPpmdH@redhat.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20241206112213.88394-1-cohuck@redhat.com>
 <edc12140-6345-4868-938d-c80c4d2c2004@redhat.com>
 <Z1qoa8yXscTSAJ9e@redhat.com> <8734it1bv6.fsf@redhat.com>
 <1fea79e4-7a31-4592-8495-7b18cd82d02b@redhat.com>
 <Z2QE9AqZnpGM5sWD@gezellig> <8634ijrh8q.wl-maz@kernel.org>
 <Z2Q2rWj9cV0W_XVq@gezellig> <86zfkrptmj.wl-maz@kernel.org>
 <Z2RdMJHydsvPpmdH@redhat.com>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Fri, 20 Dec 2024 17:04:25 +0100
Message-ID: <87frmibat2.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-TUID: czGe/yQHsS3y

On Thu, Dec 19 2024, Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> On Thu, Dec 19, 2024 at 03:41:56PM +0000, Marc Zyngier wrote:
>> On Thu, 19 Dec 2024 15:07:25 +0000,
>> Kashyap Chamarthy <kchamart@redhat.com> wrote:
>> >=20
>> > On Thu, Dec 19, 2024 at 12:26:29PM +0000, Marc Zyngier wrote:
>> > > On Thu, 19 Dec 2024 11:35:16 +0000,
>> > > Kashyap Chamarthy <kchamart@redhat.com> wrote:
>> >=20
>> > [...]
>> >=20
>> > > > Consider this:
>> > > >=20
>> > > > Say, there's a serious security issue in a released ARM CPU.  As p=
art of
>> > > > the fix, two new CPU flags need to be exposed to the guest OS, cal=
l them
>> > > > "secflag1" and "secflag2".  Here, the user is configuring a baseli=
ne
>> > > > model + two extra CPU flags, not to get close to some other CPU mo=
del
>> > > > but to mitigate itself against a serious security flaw.
>> > >=20
>> > > If there's such a security issue, that the hypervisor's job to do so,
>> > > not userspace.=20
>> >=20
>> > I don't disagree.  Probably that has always been the case on ARM.  I
>> > asked the above based on how QEMU on x86 handles it today.
>> >=20
>> > > See what KVM does for CSV3, for example (and all the
>> > > rest of the side-channel stuff).
>> >=20
>> > Noted.  From a quick look in the kernel tree, I assume you're referring
>> > to these commits[1].
>> >=20
>> > > You can't rely on userspace for security, that'd be completely
>> > > ludicrous.
>> >=20
>> > As Dan Berrang=C3=A9 points out, it's the bog-standard way QEMU deals =
with
>> > some of the CPU-related issues on x86 today.  See this "important CPU
>> > flags"[2] section in the QEMU docs.
>>=20
>> I had a look, and we do things quite differently. For example, the
>> spec-ctrl equivalent in implemented in FW and in KVM, and is exposed
>> by default if the HW is vulnerable. Userspace could hide that the
>> mitigation is there, but that's the extent of the configurability.
>
> Whether it is enabled by default or disabled by default isn't a
> totally fatal problem. If QEMU can toggle it to the opposite value,
> we have the same level of configurability in both cases.

I don't think "hiding" is the same thing as "disabling"? The underlying
behaviour will still have changed, the main question is whether that is
a problem.

>
> It does, however, have implications for QEMU as if KVM gained support
> for exposing the new feature by default and QEMU didn't know about
> it, then the guest ABI would have changed without QEMU realizing it.
>
> IOW, it would imply a requirement for timely QEMU updates to match
> the kernel, which is something we wouldn't need in x86 world where
> the feature is disabled by default. Disable by default is a more
> stable approach from QEMU's POV.

It implies that QEMU (or generally the VMM) needs to actively disable
everything it does not know about (i.e. setting everything in any
writable id reg to zero if it has no idea what it is about) to provide a
stable guest interface across different kernels. Just tweaking some
known values is only sufficient for a stable interface across two
systems with the same kernel.

(...)

>> That's why I don't see CPU models as a viable thing in terms of ABI.
>> They are an approximation of what you could have, but the ABI is
>> elsewhere.
>
> Right, this makes life quite challenging for QEMU. The premise of named
> CPU models (as opposed to -host), is to facilitate the migration of VMs
> between heterogenous hardware platforms. That assumes it is possible to
> downgrade the CPU on both src + dst, to the common baseline you desire.
>
> If we were to define a named CPU model, for that to be usable, QEMU
> would have to be able to query the "maxmimum" architectural features,
> and validate that the delta between the host maximum, and the named
> CPU model is possible to downgrade. Is arm providing sufficient info
> to let QEMU do that ?

Not sure if I understand what you mean, but "give me the contents of all
id registers, and which registers are writable" should probably do the
trick?
