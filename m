Received: by 2002:a17:504:c05:b0:1be9:327d:8ee3 with SMTP id k5csp1595095njf;
        Mon, 28 Oct 2024 09:29:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVzBvqvBoHrbsQQKyUMYgnYTcJdMVlaHWriLi7uTFCvFNPC17MpmcZQ7VT4b5mD9CWWXr1Pgsx+bXAqOg==@linaro.org
X-Google-Smtp-Source: AGHT+IFD5sz3OFlylISN19zpefFhbTg64gtrVyMkMRlgsKwC9VR/1hcYVkiveqy5hip9HGx7YCmc
X-Received: by 2002:a05:6214:318e:b0:6cc:b4:5dcb with SMTP id 6a1803df08f44-6d185859497mr139819116d6.47.1730132962706;
        Mon, 28 Oct 2024 09:29:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1730132962; cv=none;
        d=google.com; s=arc-20240605;
        b=agatNpyqRqafkTpNkQaci+yhoYhoFd46rYXyxKbIFELizZ35kyRorlxKMT4YC9HuRP
         LZkn/ypesJp/SNaNGOLn3z2W+SuhTjPwtLibuYoqVC+7savFNU0g5+SmTCqujTA7Mnpq
         /tm1FSNykI7bhicsSrcbSgsSo8GeQLrPA8X1jepAmKtWa+f0QAAjLHkHLJo0Nyw8tHbA
         lOglXknNr5QOeJdBqh3wtOzaRXnVIqHYex3/Xgo7Jg40OCApD5Hc6yd4Ty6DbhZbQheF
         yJZOHSzBVsz7+rLb5EJW72yL71N8We3kAlgvNlmy8CYv9JVe9pgfx3zAa769h13xWrsr
         4vLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:organization:in-reply-to:subject:cc:to:from
         :dkim-signature;
        bh=mkkVElKn3Spk/fVm1hzjR0gsXNh0JNd5hSe/vYQwfCU=;
        fh=vkC5NXDI1dbKRVQLiBq/wfOwSPXN2qX1eFw1mGb5Lss=;
        b=ewx5yyepZ2nfDmkqfDtIRwExFy2AMMiw/10ZepbHIrC7ezQNMIyJ4dfJ/ay6w5aD/F
         CXtNtYzqDBil08re5omHkwsPVk/I2E8KpQgpWrXP7uhcbyZdaX4A7t5UIATBGHv04Bvt
         iiN/3pHGhd2vbzpU3g4CNPkAwKz4KnMdX6sVWw+a1CymE00pjMlGh/zlt70FiMyaREwu
         R3pjAShE6y2CxqT2Tq+PWiCVOsYx2Whxy6UJp76mORySKSNvQch0cxYaCQEJHRVluQHl
         Z+fU0DwJ/IQGguYfncZZjPfYuSs8N+GEc1LDSXXA1TIy/IbP3McUQW476q5vpqIMQGMz
         zalQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AvmL5fSJ;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d179a7f404si88340356d6.481.2024.10.28.09.29.22
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 09:29:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=AvmL5fSJ;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730132962;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mkkVElKn3Spk/fVm1hzjR0gsXNh0JNd5hSe/vYQwfCU=;
	b=AvmL5fSJ+1oQB/eaw+PixbJO7lNu5T6TIsQ9tKdfJoO1r4b93kTGOQy7eDTHTqBE6Q452x
	cH2Ih+ay4T5ewSzvI3LCZIomfUqwLGglTpnWgfLsAvGHUmYC3lMzrFmZlh05gzN9+rNW6a
	EDgdU58n0TLRAfmNAlgzwqvL02MgpKA=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-26-LhHf3dMWMJeGWk7sEJHcIQ-1; Mon,
 28 Oct 2024 12:29:18 -0400
X-MC-Unique: LhHf3dMWMJeGWk7sEJHcIQ-1
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1572F1955D4A;
	Mon, 28 Oct 2024 16:29:16 +0000 (UTC)
Received: from localhost (unknown [10.22.88.106])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 52E9919560AA;
	Mon, 28 Oct 2024 16:29:14 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvmarm@lists.linux.dev,
 peter.maydell@linaro.org, richard.henderson@linaro.org,
 alex.bennee@linaro.org, maz@kernel.org, oliver.upton@linux.dev,
 sebott@redhat.com, shameerali.kolothum.thodi@huawei.com,
 armbru@redhat.com, abologna@redhat.com, jdenemar@redhat.com,
 shahuang@redhat.com, mark.rutland@arm.com, philmd@linaro.org,
 pbonzini@redhat.com
Subject: Re: [RFC 21/21] arm/cpu-features: Document custom vcpu model
In-Reply-To: <Zx-3OUioG1l47hW3@redhat.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20241025101959.601048-1-eric.auger@redhat.com>
 <20241025101959.601048-22-eric.auger@redhat.com>
 <ZxuZkUFz_bwAA1pf@redhat.com>
 <0700af51-a1a6-4b11-a4bf-0eaf6e279c6d@redhat.com>
 <Zxudl5-fZV1vIaEL@redhat.com> <87y128nrfr.fsf@redhat.com>
 <Zx-3OUioG1l47hW3@redhat.com>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Mon, 28 Oct 2024 17:29:11 +0100
Message-ID: <87plnknqco.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-TUID: vHGMMwChdBBA

On Mon, Oct 28 2024, Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> On Mon, Oct 28, 2024 at 05:05:44PM +0100, Cornelia Huck wrote:
>> On Fri, Oct 25 2024, Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
>>=20
>> > On Fri, Oct 25, 2024 at 03:28:35PM +0200, Eric Auger wrote:
>> >> Hi Daniel,
>> >>=20
>> >> On 10/25/24 15:13, Daniel P. Berrang=C3=A9 wrote:
>> >> > On Fri, Oct 25, 2024 at 12:17:40PM +0200, Eric Auger wrote:
>> >> >> From: Cornelia Huck <cohuck@redhat.com>
>> >> >>
>> >> >> Add some documentation for the custom model.
>> >> >>
>> >> >> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> >> >> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>> >> >> ---
>> >> >>  docs/system/arm/cpu-features.rst | 55 +++++++++++++++++++++++++++=
-----
>> >> >>  1 file changed, 47 insertions(+), 8 deletions(-)
>> >> >
>> >> >> @@ -167,6 +196,16 @@ disabling many SVE vector lengths would be qu=
ite verbose, the ``sve<N>`` CPU
>> >> >>  properties have special semantics (see "SVE CPU Property Parsing
>> >> >>  Semantics").
>> >> >>=20=20
>> >> >> +The ``custom`` CPU model needs to be configured via individual ID=
 register
>> >> >> +field properties, for example::
>> >> >> +
>> >> >> +  $ qemu-system-aarch64 -M virt -cpu custom,SYSREG_ID_AA64ISAR0_E=
L1_DP=3D0x0
>> >> >> +
>> >> >> +This forces ID_AA64ISAR0_EL1 DP field to 0.
>> >> > What is the "baseline" featureset implied by 'custom' ?
>> >> there is no baseline at the moment. By default this is a host
>> >> passthrough model.
>> >
>> > Why do we need to create "custom" at all, as opposed to just letting
>> > users toggle features on "-cpu host" ?=20
>>=20
>> We could consolidate that to the current "host" model, once we figure
>> out how to handle the currently already existing properties. Models
>> based on the different architecture extensions would probably be more
>> useable in the long run; maybe "custom" has a place for testing.
>
> If you can set the features against "host", then any testing could
> be done with "host" surely, making 'custom' pointless ?

We might differentiate between "do some consistency checks" and "allow
a completely weird wolpertinger"; if we agree that we don't need it,
then we surely could drop it again.
