Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp1248846njb;
        Wed, 14 May 2025 07:55:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWdaBdZ15X91V2NqmEOXb+GRwFheX2EaMxNxvajARIKXVPyt6AJQGrViff4M9dkxchjbswnZY5SXdWRBA==@linaro.org
X-Google-Smtp-Source: AGHT+IFijJkVUJ8/k/aJAQQzsmzrhakay+24CsK9rTVPF0MiQPio3lU9v5QgPvs+HHUUPpMRt8x3
X-Received: by 2002:a05:6214:29ee:b0:6f5:3cae:920f with SMTP id 6a1803df08f44-6f896e5b2b5mr61591606d6.27.1747234557628;
        Wed, 14 May 2025 07:55:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747234557; cv=none;
        d=google.com; s=arc-20240605;
        b=a6uxZebLuIEKdq/3ygge8nS2HiAcPAHdCze3Qn7prQrv4eKkmb1R7EN3GDjLx2oP7T
         1+Xe4PFvxi/4igzp1tqnIMEHQgP1/BLBuaVKtw+2cJIkCXnFZBKE2qPF3AQJUTCy/Hj1
         f6TBa8hU+d597WX4qh59CRF0FRBYDsXWV+wgTsiFe5r6O/xf1fTcu1JWIR7omY1SrFL3
         m4Nt+6881fZj0OhyP95WXs0VvlH4UdiloEu+thHPG9vmN2SM6wzwlPQOb2QADFNXeUfy
         vYBigQmipV71DG2cdc307G3Tw0R6jxXBiOc44qta1RzDb9U67dJ8T28B7n8L628AKXpp
         rBNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:organization:in-reply-to:subject:cc:to:from
         :dkim-signature;
        bh=gubBPWsy/XGhmDxkfMCBUD6QZxWOn0NBq1+dq/fTvQI=;
        fh=/KoMIhHVH4bgnRnJJr9qjUY3evIdB8XTi4Rz87cJiSA=;
        b=SiRzw8yLNbhK+MmI0vkq4Xrx6ktCURFXeGaqHncTa9Mfzge1/MyJWgU807yJR168ki
         PWMs1aqgimYU2Yy8so602rEdSCMNtAjfoFQKxUzXaBD7HQpEG3JhR3tN6gVQsh4icmsj
         JZJ+hlTvP2+H/7ih6caljoY/lChOyL9ivKo6mIA8PUBjdI5NddQ7g2WOCnNi4upT2CuF
         2gDmyStgpXffKA4T5xRScHZ0nh4RgrNLHX3BsPDrqLrEr67djihbpWZnM3HHXM/J9U3B
         r52w1RDgQ+arPdK0i1wOlr6qeDGjzMn8KudFZk4b6+W4ZPjfrlXhoWlMUxrtxwjHjG+n
         gdEg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ug8XiFw+;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7cd00fe264dsi1450222485a.380.2025.05.14.07.55.57
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 07:55:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ug8XiFw+;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747234557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gubBPWsy/XGhmDxkfMCBUD6QZxWOn0NBq1+dq/fTvQI=;
	b=Ug8XiFw+s/vSp2P2Ll/1darrqGFaTHnW/x1XVNRlsIn2vecRcrECQFhNgltT2N4WHKcQBT
	R+td6mz5bGH0ttu/vu0MirctqBh+jopxb+AGVo/kP0s9lSFR+NQPFiJxfKbCbcvWk69zQS
	pd+aSM/fm4ZPq9l7/mwSdN5/RqC1Lc0=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-564-Mj8NsofDMnClnEKQIjtqPw-1; Wed,
 14 May 2025 10:55:54 -0400
X-MC-Unique: Mj8NsofDMnClnEKQIjtqPw-1
X-Mimecast-MFC-AGG-ID: Mj8NsofDMnClnEKQIjtqPw_1747234552
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 590011956050;
	Wed, 14 May 2025 14:55:51 +0000 (UTC)
Received: from localhost (dhcp-192-216.str.redhat.com [10.33.192.216])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9396018004A7;
	Wed, 14 May 2025 14:55:48 +0000 (UTC)
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
Subject: Re: [PATCH v6 02/14] arm/cpu: Store aa64isar0/aa64zfr0 into the
 idregs arrays
In-Reply-To: <aCNvHgB0dzJIQ8Yt@redhat.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20250506085234.855779-1-cohuck@redhat.com>
 <20250506085234.855779-3-cohuck@redhat.com> <aCNvHgB0dzJIQ8Yt@redhat.com>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Wed, 14 May 2025 16:55:46 +0200
Message-ID: <87bjrvckct.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-TUID: 9yx8q9gaq9CK

On Tue, May 13 2025, Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> On Tue, May 06, 2025 at 10:52:22AM +0200, Cornelia Huck wrote:
>> From: Eric Auger <eric.auger@redhat.com>
>>=20
>> Also add kvm accessors for storing host features into idregs.
>>=20
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> Reviewed-by: Sebastian Ott <sebott@redhat.com>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>> ---
>>  target/arm/cpu-features.h | 57 ++++++++++++++++++++-------------------
>>  target/arm/cpu.c          | 10 +++----
>>  target/arm/cpu.h          |  2 --
>>  target/arm/cpu64.c        |  8 +++---
>>  target/arm/helper.c       |  6 +++--
>>  target/arm/hvf/hvf.c      |  3 ++-
>>  target/arm/kvm.c          | 30 ++++++++++++++++++---
>>  target/arm/tcg/cpu64.c    | 44 ++++++++++++++++++------------
>>  8 files changed, 97 insertions(+), 63 deletions(-)
>>=20
>
>> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
>> index 5e951675c606..dc4b6edaa1d6 100644
>> --- a/target/arm/cpu.c
>> +++ b/target/arm/cpu.c
>> @@ -2225,12 +2226,9 @@ static void arm_cpu_realizefn(DeviceState *dev, E=
rror **errp)
>>      }
>>=20=20
>>      if (!cpu->has_neon && !cpu->has_vfp) {
>> -        uint64_t t;
>
> Premature removal because ....
>
>>          uint32_t u;
>>=20=20
>> -        t =3D cpu->isar.id_aa64isar0;
>> -        t =3D FIELD_DP64(t, ID_AA64ISAR0, FHM, 0);
>> -        cpu->isar.id_aa64isar0 =3D t;
>> +        FIELD_DP64_IDREG(isar, ID_AA64ISAR0, FHM, 0);
>>=20=20
>>          t =3D cpu->isar.id_aa64isar1;
>
> ...it is still used here and so breaks the build.
>
> Your next patch removes this line, so just need
> to shift the variable removal to the next patch
>
>>          t =3D FIELD_DP64(t, ID_AA64ISAR1, FRINTTS, 0);

To a v7 it goes, hopefully the last one...
