Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp615762njb;
        Tue, 13 May 2025 08:57:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXtUFlTeAE0+nwhiBaLzkWSL6WF0MueEBkQtnI3R53vtsp5Yh2lNpsc9sbnzkFq42hyqG1062IRmoK92g==@linaro.org
X-Google-Smtp-Source: AGHT+IGDVNUl13mYYt7St9qn0zdNaWH8KcfPFPydrt4bhInFlhpSSRTrCP8tX0tbKt9z5bu/WEFU
X-Received: by 2002:a05:620a:1985:b0:7c8:c9c:2a8a with SMTP id af79cd13be357-7cd288636ebmr12961685a.49.1747151821555;
        Tue, 13 May 2025 08:57:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747151821; cv=none;
        d=google.com; s=arc-20240605;
        b=hhQubYRCHMh5xelpWPZKo2g/NDonynmrPLKtK02IwGBOZ9dVRAj46CdJaCr8wbXr/H
         7Gfrzrg13NUme5T8fJjZn/xyW5RWfnbpz6Owjit+p4vRqqLd2PXVboRWjCiST28vg0en
         JFdfWXcVOCuuj9ZCPBclFx2LnLT2f2fyIx1b+Yc/UFcaxZxvaxxYpa279enolTEwUMp8
         QqD15dO+WMEY5U2q+NUPDW+rypziJnZ0QoGUnSW2kBrk/n5gTAtsSqhgWvRGcO6BKZyG
         7ZWmDBbGg1AbxYtdelOO+8FPxswZHXdUvX5aU1EV7dmDTz4ABsEj+mVYe4dAG4fLTcD6
         dtGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:organization:in-reply-to:subject:cc:to:from
         :dkim-signature;
        bh=R4b+q5DZaq+brNYajdSGnOlZv1xADptKpVhan1d0w/M=;
        fh=/KoMIhHVH4bgnRnJJr9qjUY3evIdB8XTi4Rz87cJiSA=;
        b=ONYB8GMq3sGCmYXO7mAUYr99qLrw8bg8j/7vDlRGsLnbld06LxP743Rrt77dv/xbJV
         jq0OJt3QDtLnLLMnnF+i1uI6mFUbZe21ZrWlqOygpb/cgOaXxz9d3lDATD1VPTIg0ygn
         06lWbRmF/5N+jwOlenssQF+IHW+QW+5BQRuG0+nWeLpT7S2DOGekXYjw7QNY9bAb9aYk
         6Xxb9vBd24Lf33jous4iih5Y0hp96k+GSDf5d6amyFJsaX4yXt1VJG6NEJevb1FkI1KU
         8mYxfUd3vKllM3bnM5kj3X2q9d8rljyzV9BGZgVFez/USdxuUrJwfVJ8B+TP3hPPzI7z
         dV0A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cP1ApxHa;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7cd00fd44cbsi1085894885a.319.2025.05.13.08.57.01
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 08:57:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cP1ApxHa;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747151821;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=R4b+q5DZaq+brNYajdSGnOlZv1xADptKpVhan1d0w/M=;
	b=cP1ApxHadgBQ9bgU/1drRl+olz7M5MX3GvCxU2mteufFtiUdMTyl8foEnGlVlFY29UtDKX
	NrzJlpem/Xc7jxHAb+zUlo3iqDc8BAXFTlgOUacSNzkj4g2aJmlbg4QU9gxsELeWndPvo8
	06ezvfsLgK+rnQyIxZVScmUm73e0w9I=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-344-VdcnpdnAO2uV663BGQNMMg-1; Tue,
 13 May 2025 11:56:56 -0400
X-MC-Unique: VdcnpdnAO2uV663BGQNMMg-1
X-Mimecast-MFC-AGG-ID: VdcnpdnAO2uV663BGQNMMg_1747151812
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5CB36195DE45;
	Tue, 13 May 2025 15:56:51 +0000 (UTC)
Received: from localhost (dhcp-192-216.str.redhat.com [10.33.192.216])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id ECD791955E74;
	Tue, 13 May 2025 15:56:48 +0000 (UTC)
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
Subject: Re: [PATCH for-10.1 v5 02/13] arm/cpu: Store aa64isar0/aa64zfr0
 into the idregs arrays
In-Reply-To: <aCNoEs-jQ7IUTt8q@redhat.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20250409144304.912325-1-cohuck@redhat.com>
 <20250409144304.912325-3-cohuck@redhat.com> <aCNoEs-jQ7IUTt8q@redhat.com>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Tue, 13 May 2025 17:56:46 +0200
Message-ID: <875xi4pkqp.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-TUID: K3Ca5/KC6Gc1

On Tue, May 13 2025, Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> On Wed, Apr 09, 2025 at 04:42:53PM +0200, Cornelia Huck wrote:
>> From: Eric Auger <eric.auger@redhat.com>
>>=20
>> Also add kvm add accessors for storing host features into idregs.
>>=20
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> Reviewed-by: Sebastian Ott <sebott@redhat.com>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>> ---
>>  target/arm/cpu-features.h | 57 ++++++++++++++++++++-------------------
>>  target/arm/cpu-sysregs.h  |  4 +++
>>  target/arm/cpu.c          | 10 +++----
>>  target/arm/cpu.h          |  2 --
>>  target/arm/cpu64.c        |  8 +++---
>>  target/arm/helper.c       |  6 +++--
>>  target/arm/hvf/hvf.c      |  3 ++-
>>  target/arm/kvm.c          | 30 ++++++++++++++++++---
>>  target/arm/tcg/cpu64.c    | 44 ++++++++++++++++++------------
>>  9 files changed, 101 insertions(+), 63 deletions(-)
>
>> diff --git a/target/arm/cpu-sysregs.h b/target/arm/cpu-sysregs.h
>> index 7877a3b06a8e..e89a1105904c 100644
>> --- a/target/arm/cpu-sysregs.h
>> +++ b/target/arm/cpu-sysregs.h
>> @@ -39,4 +39,8 @@ extern const uint32_t id_register_sysreg[NUM_ID_IDX];
>>=20=20
>>  int get_sysreg_idx(ARMSysRegs sysreg);
>>=20=20
>> +#ifdef CONFIG_KVM
>> +uint64_t idregs_sysreg_to_kvm_reg(ARMSysRegs sysreg);
>> +#endif
>
> This breaks the build when KVM is disabled, and/or not available
> on the build target architecture
>
> In file included from ../target/arm/cpu.h:35,
>                  from /var/home/berrange/src/virt/qemu/include/hw/arm/dig=
ic.h:21,
>                  from ../hw/arm/digic_boards.c:31:
> /var/home/berrange/src/virt/qemu/target/arm/cpu-sysregs.h:42:8: error: at=
tempt to use poisoned =E2=80=98CONFIG_KVM=E2=80=99
>    42 | #ifdef CONFIG_KVM
>       |        ^
> In file included from /var/home/berrange/src/virt/qemu/include/exec/poiso=
n.h:7,
>                  from /var/home/berrange/src/virt/qemu/include/qemu/osdep=
.h:38,
>                  from ../hw/arm/digic_boards.c:26:
> ./config-poison.h:185:20: note: poisoned here
>   185 | #pragma GCC poison CONFIG_KVM
>       |                    ^~~~~~~~~~
> ninja: build stopped: subcommand failed.

I have already fixed that one in v6.
