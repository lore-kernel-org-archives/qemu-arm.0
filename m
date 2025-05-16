Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp2612316njb;
        Fri, 16 May 2025 08:13:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWIPpwhcGGCJrFH+q1CxDkEUefIfKs2YBXH2WrS8iVw4AJnvbrY/auJC6c4DvZf5aN6VEq+CWlTjM4ycQ==@linaro.org
X-Google-Smtp-Source: AGHT+IG1vnVKQfTt+mH3S8b19Ohn58JsFlAPLdFr9bJ5eOurq99Jo8Xj4Zq2O4YBsjU8ScHziI1D
X-Received: by 2002:a05:600c:a0d:b0:440:54ef:dfdc with SMTP id 5b1f17b1804b1-442fefefd08mr23309685e9.8.1747408419588;
        Fri, 16 May 2025 08:13:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747408419; cv=none;
        d=google.com; s=arc-20240605;
        b=PjUVfkd0h3GYKYJq/VcH+fM2mY7yHNmIhhdARoNSboIz1KmHgqvYxUiq1JSyKoAT03
         pByTRH2Wg99BnPxanacTrhFHyIrIlCSHcqEaM1Xzm6YdL2ckCxXhjUi18SSkWd3K7e1w
         j+KbCBAqGlC61nB4UNTI+9EEut2r0h1AbOpyR1feuvQiJfUKHKLISu67x1DJIyMMfgce
         ylXKoKA1zmJauIqOn4s6N5vdXV80bf3uYLN+J75NCG3236o2etzfLXPNu/eeJLqYYNDu
         Qs3TIbp7SCwCutOpH4eZEKd5i1kzACJs01TRfUSW0ExKgYGvnmQlXA9V9kbJskqUN+MY
         Y60A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:organization:in-reply-to:subject:cc:to:from
         :dkim-signature;
        bh=9Ruv5/J5VYkKEWrD/cz7hCgfh11LAVpqqxOAHUaNUOI=;
        fh=/KoMIhHVH4bgnRnJJr9qjUY3evIdB8XTi4Rz87cJiSA=;
        b=ehkdLZFPzkIiakKwATSZp5oU3uKcnogGb8fMgf4n1qiC10EzPQMsu/tUonucxyv/UZ
         ARQEBRjV4HQqu/cbEibKbREQOx8gg4tfIdpaV7kF/ma8jrrbpBw8C0UC9zLUCbpi8taZ
         Y2Tcn32OYIjOvo+m/iL2degekhhTC76A2C1EB2XHXOt9Tbokr54dcJxjYvM8gZOtwfAc
         dme6g2mChz9iEPIO4r8R4bsvyo2FjJOExHjdybLXn5L5B2VG/A22rwvJdeGzo6025A+a
         aeQG8mSVzov8emLZtF8SPYDCLJ1ecI6gP2QminCzE6Gw1tsRI8VU5E3MNyODISwODoea
         gnww==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=f47Epi19;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a35ca4c135si1735666f8f.129.2025.05.16.08.13.39
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 08:13:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=f47Epi19;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747408418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9Ruv5/J5VYkKEWrD/cz7hCgfh11LAVpqqxOAHUaNUOI=;
	b=f47Epi19ey8q90soORT3DppmQRRZIaYvw9M4mbuOXvCNNqStC9sAgqIvH01QnmkjWn24k0
	A9Dcw5h8S1tC4EV6Hob8fk8e/VJVj+IhC9X+cZLA566NZNmaRKqGnA1Fewu68a/1v1aF0n
	FTAIPdOLtiUGsIoaoEqW2wPiALyv+Ks=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-456-cadUfcVzOxujBeu41zZfUA-1; Fri,
 16 May 2025 11:13:37 -0400
X-MC-Unique: cadUfcVzOxujBeu41zZfUA-1
X-Mimecast-MFC-AGG-ID: cadUfcVzOxujBeu41zZfUA_1747408415
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 56D261954235;
	Fri, 16 May 2025 15:13:34 +0000 (UTC)
Received: from localhost (dhcp-192-216.str.redhat.com [10.33.192.216])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A890119560AE;
	Fri, 16 May 2025 15:13:32 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, kvmarm@lists.linux.dev, peter.maydell@linaro.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
 oliver.upton@linux.dev, sebott@redhat.com,
 shameerali.kolothum.thodi@huawei.com, armbru@redhat.com,
 abologna@redhat.com, jdenemar@redhat.com, agraf@csgraf.de,
 shahuang@redhat.com, mark.rutland@arm.com, philmd@linaro.org,
 pbonzini@redhat.com
Subject: Re: [PATCH v3 08/10] arm/cpu: more customization for the kvm host
 cpu model
In-Reply-To: <aCdSZD5n2GCRXjVQ@redhat.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20250414163849.321857-1-cohuck@redhat.com>
 <20250414163849.321857-9-cohuck@redhat.com> <aCNsSbDoi5oKWYul@redhat.com>
 <875xi3cig5.fsf@redhat.com> <aCTe5kEN1WdgZ74T@redhat.com>
 <87v7q0bocp.fsf@redhat.com> <aCdSZD5n2GCRXjVQ@redhat.com>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Fri, 16 May 2025 17:13:30 +0200
Message-ID: <87sel4bnc5.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: 8wANKGj183kc

On Fri, May 16 2025, Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> On Fri, May 16, 2025 at 04:51:34PM +0200, Cornelia Huck wrote:
>> On Wed, May 14 2025, Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
>>=20
>> > On Wed, May 14, 2025 at 05:36:58PM +0200, Cornelia Huck wrote:
>> >> On Tue, May 13 2025, Daniel P. Berrang=C3=A9 <berrange@redhat.com> wr=
ote:
>> >>=20
>> >> > On Mon, Apr 14, 2025 at 06:38:47PM +0200, Cornelia Huck wrote:
>> >> >> From: Eric Auger <eric.auger@redhat.com>
>> >> >>=20
>> >> >> If the interface for writable ID registers is available, expose ui=
nt64
>> >> >> SYSREG properties for writable ID reg fields exposed by the host
>> >> >> kernel. Properties are named  SYSREG_<REG>_<FIELD> with REG and FI=
ELD
>> >> >> being those used  in linux arch/arm64/tools/sysreg. This done by
>> >> >> matching the writable fields retrieved from the host kernel agains=
t the
>> >> >> generated description of sysregs.
>> >> >>=20
>> >> >> An example of invocation is:
>> >> >> -cpu host,SYSREG_ID_AA64ISAR0_EL1_DP=3D0x0
>> >> >> which sets DP field of ID_AA64ISAR0_EL1 to 0.
>> >> >
>> >> > For the value you are illustrating 0x0 - is this implying that
>> >> > all the flags take an arbitrary integer hex value ?
>> >> >
>> >> > This would be different from x86, where CPU feature flags are
>> >> > a boolean on/off state.
>> >>=20
>> >> Most of the fields are 4 bits, the allowed values vary (there are also
>> >> some fields that are single bits, or wider.) The FEAT_xxx values (whi=
ch
>> >> can be expressed via ID register fields, or a combination thereof) are
>> >> mostly boolean, but there are also some of them that can take values.
>> >>=20
>> >> We could cook up pseudo-features that are always on/off, but I don't
>> >> like that approach: they would be QEMU only, whereas the ID register
>> >> fields and FEAT_xxx features are all defined in the Arm documentation.
>> >
>> > Fortunately from a libvirt POV we can likely expand our config
>> > to cope with hex values for arm features without too much
>> > trouble.
>> >
>> >>=20
>> >> An additional difference from x86 would be that FEAT_xxx featues are =
not
>> >> neccessarily configurable (only if the host kernel supports changing =
the
>> >> ID register field(s) backing the feature.)
>> >
>> > Is the kernel able to tell us which ones are configurable and which
>> > are not ? If so, it'd be helpful to expose this info in QAPI some
>> > place.
>>=20
>> The kernel can tell us which ID register fields are writable (we won't
>> generate properties if we don't.) For FEAT_xxx, this depends on how
>> we'll end up handling them (maybe we should only expose them if all ID
>> register bits backing them are actually writable.)
>>=20
>> What worries me a bit is that QEMU exposing a certain set of FEAT_xxx
>> values could be interpreted as "those features are present, any other
>> features aren't", while it is only the list of configurable features.
>>=20
>> Another issue: If libvirt is trying to baseline two cpus, it might end
>> up creating a model that looks sane on paper, but migrations will fail
>> because there are differences in non-writable bits. It would be much
>> better if libvirt could detect beforehand that there was no common
>> determinator. Not yet sure how to handle this.
>
> For "host" model that's probably not the end of the world. Apps have
> already given up strong guarantee of migration compat by using 'host'
> CPU and so in that context libvirt's feature comparison can assume
> the underlying silicon is a match and just compare features.
>
>
> In that sense the ability to list features and baseline two cpus
> lets you guarantee that whatever CPU you boot the guest on, will
> have at least those requested features. That's useful, even if it
> does not give you a strong migration compat guarantee.
>
> Doing better would require info on non-writable features, and
> possibly even that might not be sufficient to guarantee compat

We'd probably want to use named models rather than 'host' for better
generic handling, but that's a whole different can of worms that I'd
prefer to keep closed right now.

OTOH, 'host' with some features tweaked is already useful if you want to
migrate across machines in a heterogeneous environment with known
players (i.e. you know that the various machines only differ in features
that you can actually configure.)
