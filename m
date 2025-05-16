Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp2595960njb;
        Fri, 16 May 2025 07:51:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUoPh0L5cAO+pnp4bk8Dq5IPA8GQT/wkrmgX71LI/Xn6Mj7pOpXIcTZXozj0g6ITROUhmNSberlrzyHFg==@linaro.org
X-Google-Smtp-Source: AGHT+IGEzq6eY5mkLiz3JGUhtFMpDa5Y11Fr+wfHLDwoONRFGs1HYift5KVGxjZNVaqxWuP2Z/U5
X-Received: by 2002:a05:622a:591b:b0:47b:4d3:5d12 with SMTP id d75a77b69052e-494b096b020mr49894411cf.49.1747407105312;
        Fri, 16 May 2025 07:51:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747407105; cv=none;
        d=google.com; s=arc-20240605;
        b=CgpwY5Df0gPgFonaF76AtjOpkphqp8lTEz2991nLX1cIJ85ruYzQz6Wlwy6J8Gj4vS
         K0XPYyoDd0RBtASeDxdCuUtD0Z2jCMIhV1xCR0Vke4u0wHrIn7amPpRhp/sdhJ3CVpZY
         1+tYVp+3JS/8XdLYvkfEKrEPGBeMmN7XApn1ATvMHjaXkGIWOumOAl8dLwijxeApBwOh
         IoqVFtU7FPPiZfQzxw3mLYs7Uv6MpqoTxBKLyik5H2Gki4ANGIhAXd51FB0ma0GcO8Ae
         cftvmQF360IyJGTQPy3nE1qE1H1mZGT3KnGxnzotBytbYh5OCs3tzygKTKGCfKb3Jp7v
         jNxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:organization:in-reply-to:subject:cc:to:from
         :dkim-signature;
        bh=AWLc64ftfi9awzJ/f+axMzzlW6B2oAcDqHjxbKPcvQA=;
        fh=/KoMIhHVH4bgnRnJJr9qjUY3evIdB8XTi4Rz87cJiSA=;
        b=Sl/iS8KKLRZTd+ZnvSaVcIbRH0NxbL6u6BJ0WLgl55Y5RTvGf2feKqddQm7KoR96Ik
         mvEizoFMKhMQ8cG2Cg3ADvwsK+ZtcxDK7bMaGOmnq4K13KRZQUFRJIWTrSpRoTh6kdhi
         nVYPDAjwyYuBNkhGzGsCK6KDMtOFF8Qo2vQn0iaigPLxCwRPFBy/7sTiGwnIoo9JA4hw
         cAu49yxexlS8GZ3ORNdz+03C0Wpetp+2Gcgx4jB19VL6cZza2Ckd/vvroWDk1CK0RDtD
         cgnIWdXnybozt+8QEbj4jMrOkS+lBZ2goAZVZLORzjo66HC7kC/TG0nkyYFcRAt6iVbO
         rUeg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VRdEh7Ot;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-494ae40d53esi22828671cf.106.2025.05.16.07.51.45
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 07:51:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VRdEh7Ot;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747407105;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AWLc64ftfi9awzJ/f+axMzzlW6B2oAcDqHjxbKPcvQA=;
	b=VRdEh7Ot3rk1nWLL+isG74H3r51FYvJwjm0B7/mEZumkcrdRatrS+4qo/4XuYai0NFMiPJ
	IMV/H3//ZRCMAjeUQNB1Rt+z822Tnx8syoRIomWpG2hgIaY0SmLECJdruvB9fo+lr4JPlk
	GDFWcMSIqxv90lmm/G3Ud+YbbNiqzJ8=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-397-NPVtR_kuM4Gzp11Hkg5PPg-1; Fri,
 16 May 2025 10:51:42 -0400
X-MC-Unique: NPVtR_kuM4Gzp11Hkg5PPg-1
X-Mimecast-MFC-AGG-ID: NPVtR_kuM4Gzp11Hkg5PPg_1747407100
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 809B119560BA;
	Fri, 16 May 2025 14:51:39 +0000 (UTC)
Received: from localhost (dhcp-192-216.str.redhat.com [10.33.192.216])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1076E1956094;
	Fri, 16 May 2025 14:51:36 +0000 (UTC)
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
In-Reply-To: <aCTe5kEN1WdgZ74T@redhat.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20250414163849.321857-1-cohuck@redhat.com>
 <20250414163849.321857-9-cohuck@redhat.com> <aCNsSbDoi5oKWYul@redhat.com>
 <875xi3cig5.fsf@redhat.com> <aCTe5kEN1WdgZ74T@redhat.com>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Fri, 16 May 2025 16:51:34 +0200
Message-ID: <87v7q0bocp.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-TUID: QfcC7UyzOziu

On Wed, May 14 2025, Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> On Wed, May 14, 2025 at 05:36:58PM +0200, Cornelia Huck wrote:
>> On Tue, May 13 2025, Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
>>=20
>> > On Mon, Apr 14, 2025 at 06:38:47PM +0200, Cornelia Huck wrote:
>> >> From: Eric Auger <eric.auger@redhat.com>
>> >>=20
>> >> If the interface for writable ID registers is available, expose uint64
>> >> SYSREG properties for writable ID reg fields exposed by the host
>> >> kernel. Properties are named  SYSREG_<REG>_<FIELD> with REG and FIELD
>> >> being those used  in linux arch/arm64/tools/sysreg. This done by
>> >> matching the writable fields retrieved from the host kernel against t=
he
>> >> generated description of sysregs.
>> >>=20
>> >> An example of invocation is:
>> >> -cpu host,SYSREG_ID_AA64ISAR0_EL1_DP=3D0x0
>> >> which sets DP field of ID_AA64ISAR0_EL1 to 0.
>> >
>> > For the value you are illustrating 0x0 - is this implying that
>> > all the flags take an arbitrary integer hex value ?
>> >
>> > This would be different from x86, where CPU feature flags are
>> > a boolean on/off state.
>>=20
>> Most of the fields are 4 bits, the allowed values vary (there are also
>> some fields that are single bits, or wider.) The FEAT_xxx values (which
>> can be expressed via ID register fields, or a combination thereof) are
>> mostly boolean, but there are also some of them that can take values.
>>=20
>> We could cook up pseudo-features that are always on/off, but I don't
>> like that approach: they would be QEMU only, whereas the ID register
>> fields and FEAT_xxx features are all defined in the Arm documentation.
>
> Fortunately from a libvirt POV we can likely expand our config
> to cope with hex values for arm features without too much
> trouble.
>
>>=20
>> An additional difference from x86 would be that FEAT_xxx featues are not
>> neccessarily configurable (only if the host kernel supports changing the
>> ID register field(s) backing the feature.)
>
> Is the kernel able to tell us which ones are configurable and which
> are not ? If so, it'd be helpful to expose this info in QAPI some
> place.

The kernel can tell us which ID register fields are writable (we won't
generate properties if we don't.) For FEAT_xxx, this depends on how
we'll end up handling them (maybe we should only expose them if all ID
register bits backing them are actually writable.)

What worries me a bit is that QEMU exposing a certain set of FEAT_xxx
values could be interpreted as "those features are present, any other
features aren't", while it is only the list of configurable features.

Another issue: If libvirt is trying to baseline two cpus, it might end
up creating a model that looks sane on paper, but migrations will fail
because there are differences in non-writable bits. It would be much
better if libvirt could detect beforehand that there was no common
determinator. Not yet sure how to handle this.
