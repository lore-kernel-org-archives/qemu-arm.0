Received: by 2002:a17:504:6601:b0:1be9:327d:8ee3 with SMTP id h1csp832870njk;
        Fri, 29 Nov 2024 07:51:27 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXPJ/QF5SVTfKRrCYbtmaPQI7ejoMf8h3rwivuopRL0cQZc0b0x0PgfPo6LPf+AxhUuiDCqKtHWu7ghyw==@linaro.org
X-Google-Smtp-Source: AGHT+IGEutpO/XoPb7t2WG0EFjbEJ284W0PZdFi0BHpMWke+ghhaICJHPwxgfeFkWRM8kJjbrd0j
X-Received: by 2002:a05:6214:48c:b0:6d4:3437:d858 with SMTP id 6a1803df08f44-6d864d78871mr164233526d6.25.1732895487641;
        Fri, 29 Nov 2024 07:51:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732895487; cv=none;
        d=google.com; s=arc-20240605;
        b=Zmdru7XrVwdXyCx6gSkK/4rFjcJo7CVXYetUIyiZZ6cQnkI+E6bNAyNUDIZdb01d+Z
         HpfeX0ktDicOntBPj4DEhTtLykeTooU8xyc0DXn9BreYXTx3ce+l/jHZqe8TjW9g2V5e
         2W9No4y7Nh5mqZPpc/RpVC/VHFnytAndflkgh7697bY4JdMJkajuPOBTsMMhrQxXiF63
         PXPJmg4V1LOpYeUO9pXSR7b1JJ/KH/gGNoY8KXkc+5n/fUIes8PQhesKwcEalmjpuaDW
         CdriwkmgMvPLWty5bFEeS1cKNBAtxDb1Tui0fddNBC4/eTQGfPsR7H1mSgs/lU9/Ols5
         YrQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:message-id:date:user-agent:references:organization
         :in-reply-to:subject:cc:to:from:dkim-signature;
        bh=8GJVdazRf21ux4iTl+yQ/9gjpKS7isQK/8RyegOC2SY=;
        fh=ivifGPtySI5PgeUe8DQsLWRCJCGPzk5kVf1nKYxm4bM=;
        b=DID/Vj7yTFIsKeWmB2lH+1w9VAJmrsIkY+zEOGicvq4uiyw5UbDxcOVJkDnMve9HB0
         BpWGNwDKKegj2ScumQhwe4sCNFxKVJTfsabgEPeGjYVuhAsUBuCoqmET0lSEZY7fSuuF
         51FpCYxd6wT2aAlPa43pkCI6V+VcddETxUA+e830HmAb44XpXeyH1WBGqgPoGz9w8+7b
         gqMXWcQjkg0ixzVKJyDvglzyZS9xly7o/ildQTCIwRTvv44wIBni+m4hUa/JOw512Fv0
         jtOzxCAGW/J/Afw1Gs44Pz67J8PtcBdGI3VxIjaYLEXyMKVUxvpOGnKkp9lE2ukPR66w
         IHMg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=h7zP6nQt;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d8751ac174si47676326d6.99.2024.11.29.07.51.27
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Nov 2024 07:51:27 -0800 (PST)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=h7zP6nQt;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732895487;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8GJVdazRf21ux4iTl+yQ/9gjpKS7isQK/8RyegOC2SY=;
	b=h7zP6nQtgUkpDrmZlPJoC1JCD2l4oVVVkGa0y3kp6le8+49ZjX/jvIBSIuGErcT7wBCGt0
	FeyWSXiuvfc0Tyh5HqXadeIs4sFoTRGBP0Ixm6sXQDrXZmm25J4RDc1v8QlFGkApSgNSWb
	FOk5fm3lfsmo7CEY0bH2CJ2m6qDRix0=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-644-Zf6NAUy_PLaWPTeSmpfhhQ-1; Fri,
 29 Nov 2024 10:51:24 -0500
X-MC-Unique: Zf6NAUy_PLaWPTeSmpfhhQ-1
X-Mimecast-MFC-AGG-ID: Zf6NAUy_PLaWPTeSmpfhhQ
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A74DE19560B7;
	Fri, 29 Nov 2024 15:51:20 +0000 (UTC)
Received: from localhost (dhcp-192-244.str.redhat.com [10.33.192.244])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 16249195605A;
	Fri, 29 Nov 2024 15:51:17 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: eric.auger@redhat.com, =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?=
 <berrange@redhat.com>,
 eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 kvmarm@lists.linux.dev, richard.henderson@linaro.org,
 alex.bennee@linaro.org, maz@kernel.org, oliver.upton@linux.dev,
 sebott@redhat.com, shameerali.kolothum.thodi@huawei.com,
 armbru@redhat.com, abologna@redhat.com, jdenemar@redhat.com,
 shahuang@redhat.com, mark.rutland@arm.com, philmd@linaro.org,
 pbonzini@redhat.com
Subject: Re: [RFC 18/21] arm/cpu: Introduce a customizable kvm host cpu model
In-Reply-To: <CAFEAcA-Pi4GRXyY3Lf-rCYk0CDZ5cT22orHT6JDxK14k9JMkng@mail.gmail.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20241025101959.601048-1-eric.auger@redhat.com>
 <20241025101959.601048-19-eric.auger@redhat.com>
 <ZxuX4i9NjVRizB72@redhat.com>
 <cb6c8f62-c5dc-416d-865f-fbdf96164dac@redhat.com>
 <Zxub7ol4p8P_sWF8@redhat.com>
 <CAFEAcA_wQu17y0PyQwxw0wuf2H5y2VE5aX16nLP2-u7QUP2ggA@mail.gmail.com>
 <Zx-9WxXkmkMuGIlQ@redhat.com>
 <CAFEAcA9w0mb5bcU8p+fScQony-=oqLmNurGWpnL_sBneQCzxUg@mail.gmail.com>
 <Zx_EGxj2aqc_2-kY@redhat.com>
 <63c232c2-a325-48d6-8ed4-753a7c6e3b4e@redhat.com>
 <87ikstn8sc.fsf@redhat.com> <87frnwmn2v.fsf@redhat.com>
 <b7f25d3b-6ba7-4924-9383-74c1169dfe86@redhat.com>
 <87ldx2krdp.fsf@redhat.com>
 <CAFEAcA-Pi4GRXyY3Lf-rCYk0CDZ5cT22orHT6JDxK14k9JMkng@mail.gmail.com>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Fri, 29 Nov 2024 16:51:15 +0100
Message-ID: <87frnakpho.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-TUID: 51+cg48+yfck

On Fri, Nov 29 2024, Peter Maydell <peter.maydell@linaro.org> wrote:

> On Fri, 29 Nov 2024 at 15:10, Cornelia Huck <cohuck@redhat.com> wrote:
>> The good news is that in many cases we only have differences in bits
>> that map to a feature (and are actually writable in current KVM.) The
>> bad news is that we have a number of exceptions.
>>
>> Comparison #1:
>>
>> ID_AA64DFR0
>> f010307009      #of breakpoints:7
>> f010305009      #of breakpoints:5
>>
>> BRPs does not match to any feature (but has a different meaning when we
>> have FEAT_Debugv8p9 and 16+ breakpoints)
>> [this is a whole can of worms in general]
>>
>> ID_AA64MMFR0
>> 2100022200101026        FEAT_ECV, FEAT_FGT, 4PB
>> 0000022200101125        mixed endian, 256TB
>>
>> FEAT_ECV -> may be 1 or 2 in ECV, with different capabilities (I guess
>> we would need to allow something like FEAT_ECV=2 to expess this?)
>
> This one was an unfortunate oversight; I expect that there
> will be a separate feature name for the =2 case in some future
> spec release. But as you note for FEAT_BBM below, not
> every different ID field value always has its own FEAT_ name.
> (FEAT_HAFDBS is another -- it allows ID_AA64MMFR1_EL1.HAFDBS to
> be 1 or 2.)

Ah yes, I actually noticed FEAT_HAFDBS as well.

>
>> support for mixed endian -> indicated in BigEnd, no feature (how
>> relevant is this in practice?)
>
> ID_AA64MMFR0_EL1.BigEnd == 1 is FEAT_MixedEnd. Relevant if your
> guest or its userspace wants to use big-endian, which is probably
> approximately nobody in a KVM context but is theoretically possible.

Ok, that one I missed in the list; if there's a feature, we should be
able to use it.

>
>> PARange (52 bits/4PB vs 48 bits/256TB) -> no feature, but some values
>> depend on other features -- we care about this when creating a cpu, but
>> migrating to another system with a mismatched range would be
>> problematic, unless configuration outside of the cpu model would take
>> care of it
>>
>> Comparison #2:
>>
>> ID_AA64PFR0
>> 1101011021111111        FEAT_AMUv1, GIC v3.0/4.0
>> 1101001020111111
>>
>> GIC == 1 indicates GIC CPU sysreg interface for 3.0/4.0, but no feature
>> (I'm not quite sure how we handle this in QEMU)
>
> We basically defer GIC emulation almost entirely to the
> kernel (which will set the GIC bit in the ID registers
> according to whether userspace asked it for a GIC or not).
>
>> ID_AA64MMFR1
>> 1000000010312122        FEAT_ECBHB, !FEAT_ETS2, FEAT_PAN3, FEAT_HPDS2, FEAT_HAFDBS
>> 0000001010211120        !FEAT_ETS2, FEAT_PAN2, FEAT_HPDS
>>
>> both ETS == 0 and ETS == 1 indicate that FEAT_ETS2 is not implememented
>> (ETS == 2 would indicate FEAT_ETS2) -- I guess we would want to
>> standardize on ETS == 0
>> FEAT_PAN3 implies FEAT_PAN2, and FEAT_HPDS2 implies FEAT_HPDS2, so
>> probably fine
>
> Yes, in general if the number in the field gets bigger
> this should be a backwards-compatible improvement in
> the feature.

Indeed, I hope that this will be the case for new features.
