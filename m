Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2179289njc;
        Mon, 4 Nov 2024 07:10:25 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCV9qjZGmKOHbxyLBHUIMpGw5hRRc+zI65b2w2Gk7QPow//DoRaolC6lOBaw5/W/VacEWDZnSo1dJB77sA==@linaro.org
X-Google-Smtp-Source: AGHT+IGs5nGoNTxq9bd77b3PposFGfiWaQsZdq6sgq7HTGiJp1xLjH7ZvmteDfhy1+0d6a4Leo++
X-Received: by 2002:a05:6830:6015:b0:717:fe2d:a4e4 with SMTP id 46e09a7af769-7189b4f40e0mr12694234a34.19.1730733025314;
        Mon, 04 Nov 2024 07:10:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730733025; cv=none;
        d=google.com; s=arc-20240605;
        b=Fgtx85x2jNi6xVBUP8nxlrs4VxJrb9BoiStKuAkdtU36i3nFvA2xFoBjX+n1YtVdLc
         J3Zw61EmPGvfygLLqB3ofWoyU/ZV52MdU/aZgZgOiUbTUjp4O1CuKPf/4m3XDWkbn3Cm
         S7UfpizY/iSC3ZuOBeg0OD0huA3XfWSrGEbzFXcjGqspT3ZihmsM5rI1F/sb5LIPzHBy
         6mpyN1kuThd/L+ZEsbsM5qJ3GLJpglt0F/hS/JQ9lzrdJwB65I59J4wMPia1E6Tw9dXy
         n8NAxE2L5UuJTl2xL+vYoYQResChNkLhGG71BmXnS0s/GzGNo6Q3H1uYr2WgNe3I75Dy
         Txxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:organization:in-reply-to:subject:cc:to:from
         :dkim-signature;
        bh=KBJ7PkpL3WRiaJXmMyl/XKwu2L7S7VQTOFmbr5G/qO4=;
        fh=ilEMv6/yY9WvStvLMAzrXhwdU5K3op49f3IZdXpv0Bc=;
        b=OtDdQ9/GjnBONhj7ltliz7L2+GXBcPSpxk1CtXe1klMC5LSEO1gBsvrq8gyRfSRcOm
         ICrbY3oXOexWLYoztEiq8tATlNgbzFq2UE69ZsD8MVK5PPUrVtME4t8oZXvixS+acQ6d
         foidkFSShRPMBxX7ayLSKgs4UjR5ypZcixt6r7+cJFnNfP+dGjUo4N5ohI3B3lqUrjIh
         4s2fHbNGVXTPzU5PPguHal4BfrKJ3V3Aaq2I6Z+gdYsAg44z56myPmcHC0bILRUa69jY
         AeoY/0n1QKrr9aAdW+fKIxf1b0HItTYaS2MnLwZAEYGeBwY9HtU/fmTYSby3LRKNsBB6
         VVuw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SARX8cma;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 71dfb90a1353d-5106eeae301si2100426e0c.0.2024.11.04.07.10.25
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 07:10:25 -0800 (PST)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SARX8cma;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1730733024;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KBJ7PkpL3WRiaJXmMyl/XKwu2L7S7VQTOFmbr5G/qO4=;
	b=SARX8cmaN5o1c1JxT6xelAEQTu0GB/xueQE/v8zw/2q0IO+KdxHNdCNz4WaeY2bSZ4/+hN
	40naid8nOTjZjexZaLvuMUt7GxwMh0OTa/DkBqmnrrJt95DqfomxDzDA2LLs2Ji7Q4h6iO
	CtMq0gESvzw7glGBEXPsgnfX0wPepWY=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-182-wfbnJoZUPda7qzDWiv5kcA-1; Mon,
 04 Nov 2024 10:10:21 -0500
X-MC-Unique: wfbnJoZUPda7qzDWiv5kcA-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D2F9A1955BF2;
	Mon,  4 Nov 2024 15:10:18 +0000 (UTC)
Received: from localhost (dhcp-192-244.str.redhat.com [10.33.192.244])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 655FC300018D;
	Mon,  4 Nov 2024 15:10:15 +0000 (UTC)
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
Subject: Re: [RFC 21/21] arm/cpu-features: Document custom vcpu model
In-Reply-To: <ZyjgWJ3bZ69sueE2@redhat.com>
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
 <24ca0278-5018-41e3-a097-ac560a16f8fa@redhat.com>
 <ZyjgWJ3bZ69sueE2@redhat.com>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Mon, 04 Nov 2024 16:10:12 +0100
Message-ID: <875xp3nigb.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-TUID: Swy+R/nvbt6c

On Mon, Nov 04 2024, Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> On Mon, Nov 04, 2024 at 03:45:13PM +0100, Eric Auger wrote:
>> Hi
>>=20
>> On 10/28/24 17:09, Daniel P. Berrang=C3=A9 wrote:
>> > On Mon, Oct 28, 2024 at 05:05:44PM +0100, Cornelia Huck wrote:
>> >> On Fri, Oct 25 2024, Daniel P. Berrang=C3=A9 <berrange@redhat.com> wr=
ote:
>> >>
>> >>> On Fri, Oct 25, 2024 at 03:28:35PM +0200, Eric Auger wrote:
>> >>>> Hi Daniel,
>> >>>>
>> >>>> On 10/25/24 15:13, Daniel P. Berrang=C3=A9 wrote:
>> >>>>> On Fri, Oct 25, 2024 at 12:17:40PM +0200, Eric Auger wrote:
>> >>>>>> From: Cornelia Huck <cohuck@redhat.com>
>> >>>>>>
>> >>>>>> Add some documentation for the custom model.
>> >>>>>>
>> >>>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> >>>>>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>> >>>>>> ---
>> >>>>>>  docs/system/arm/cpu-features.rst | 55 ++++++++++++++++++++++++++=
+-----
>> >>>>>>  1 file changed, 47 insertions(+), 8 deletions(-)
>> >>>>>> @@ -167,6 +196,16 @@ disabling many SVE vector lengths would be q=
uite verbose, the ``sve<N>`` CPU
>> >>>>>>  properties have special semantics (see "SVE CPU Property Parsing
>> >>>>>>  Semantics").
>> >>>>>>=20=20
>> >>>>>> +The ``custom`` CPU model needs to be configured via individual I=
D register
>> >>>>>> +field properties, for example::
>> >>>>>> +
>> >>>>>> +  $ qemu-system-aarch64 -M virt -cpu custom,SYSREG_ID_AA64ISAR0_=
EL1_DP=3D0x0
>> >>>>>> +
>> >>>>>> +This forces ID_AA64ISAR0_EL1 DP field to 0.
>> >>>>> What is the "baseline" featureset implied by 'custom' ?
>> >>>> there is no baseline at the moment. By default this is a host
>> >>>> passthrough model.
>> >>> Why do we need to create "custom" at all, as opposed to just letting
>> >>> users toggle features on "-cpu host" ?=20
>> >> We could consolidate that to the current "host" model, once we figure
>> >> out how to handle the currently already existing properties. Models
>> >> based on the different architecture extensions would probably be more
>> >> useable in the long run; maybe "custom" has a place for testing.
>> > If you can set the features against "host", then any testing could
>> > be done with "host" surely, making 'custom' pointless ?
>> Yeah I do agree that we may not need to introduce this "custom" model
>> bus just enhance the custom host model with the capability to tweek some
>> features. For instance we have the case where migration between 2 Ampere
>> systems fails with host model but if you tweek 1 field in CTR_EL0 it
>> passes. So I think in itself this modality can be useful. Same for
>> debug/test purpose. As mentionned in the cover letter the number of
>> writable ID regs continue to grow and this enhanced host model gives
>> flexibility to test new support and may provide enhanced debug
>> capabilities for migration (getting a straight understanding of which ID
>> reg field(s) causes the migration failure could be helpful I think)
>
> FYI, in x86 target the -cpu command has had a "migratable=3Dbool" property
> for a long time , which defaults to 'true' for 'host' model. This causes
> QEMU to explicitly drop features which would otherwise prevent migration
> between two hosts with identical physical CPUs.
>
> IOW, if there are some bits present in 'host' that cause migration
> problems on Ampere hosts, ideally either QEMU (or KVM kmod) would
> detect them and turn them off automatically if migratable=3Dtrue is
> set. See commit message in 84f1b92f & 120eee7d1fd for some background
> info

How does this work for version-sensitive features -- are they always
defaulting to off? How many features are left with that in the end?

>
> NB "migratable" is defined in i386 target code today, but conceptually
> we should expand/move that to apply to all targets for consistency,
> even if it is effectively a no-op some targets (eg if they are
> guaranteed migratable out of the box already with '-cpu host').

How does this compare to s390x, which defines some migration-safe cpu
models, based upon the different hw generations? If I look at the QEMU
code for x86 and s390x, the s390x approach seems cleaner to me (probably
because it came later, and therefore could start afresh without having
to care for legacy things.) Given that we'll cook up a new model for Arm
migration as well, we might as well start with a clean implementation :)

(Not sure what this looks like on the libvirt side.)
