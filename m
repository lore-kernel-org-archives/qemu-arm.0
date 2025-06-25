Received: by 2002:a05:7301:4085:b0:178:84eb:402c with SMTP id pt5csp977762dyb;
        Wed, 25 Jun 2025 09:38:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWgXcQ/ov2rYz9EV2atQrrLguVEAfAoDq9vUV62K4LEQKI+agxM8o96gI9iv4aFC+tVPsNFGG8fQd6n0g==@linaro.org
X-Google-Smtp-Source: AGHT+IF6T/WfAp/sZlQNeK6tvNzICoy50QlOt90myBvv+NnnSVQDZqATkGe+PhoBxvfeySCnIgmt
X-Received: by 2002:ad4:596c:0:b0:6fb:24ea:5c36 with SMTP id 6a1803df08f44-6fd74cefd56mr7757736d6.24.1750869488994;
        Wed, 25 Jun 2025 09:38:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750869488; cv=none;
        d=google.com; s=arc-20240605;
        b=bkEM3lN2sQXau5EzZqfqCDXW2iNNjg1y7uNnsWbqmjc291LzqHuH+dfBKZY5a1TviF
         cQgPmttd9Tn+18vVJFQ5CXrjcL9vk81K51ksuj/LfL5qJEW1TmowmNAAgX1RozjHrFFD
         QUzKQ0+bWVr9OImK38LigeVM+c8KJQqmKjoKm8A95FJbSceCpWcvNHWP0W180MmNhuPr
         ThPtZoCxPhN7reV3xbhejHXscjpERzCLZv+kj79N+oHgn86xGwNBaytsW0xOBRK8CrbS
         Vnoj+FbV4znYxsClJQH4o434OlfLrQUbyazBBIPwLPjMFRRTH1YpyH2wPEy1GPCHt6sx
         0/ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:message-id:date:user-agent:references:organization
         :in-reply-to:subject:cc:to:from:dkim-signature;
        bh=oGUU/IPrSry2Fwx2P5b8O9w0u3Wyi69gqhC1KaKfI04=;
        fh=Cw/uTxqYpXOo8rd3llYqbXY3S1KJM92Kmr/q+FVOGMc=;
        b=imN4vsP8DeOopCnbBS/nmEYSK2K/4MHQPsKJi0Z1dTJafxYraQSTOL4BP1LaJFSZnF
         CxorRdOvhusnYDwquk2X6bMxH4XBiK/SWp9FbG21d0GHuHLght1qcJvnsGsGR8W/Db8u
         DxcdBVWxKldMSP1PUIbISjmtDl1LCXqqPqZjIkAR4hhm8urB6H85XehMd1tjybMw9M+G
         C6EWeuWzl91PuwtELuyte5UBi8sYCcry7FcKqbEhf9buxu9GnB1orlFdt+VG62X7i2rN
         XJMI03MOwJ3/zIS+XoKZfmY/luYhTStJsjdbxrrGpKKi9eSmDUFoGjQFxMoqMoI4qxF7
         cctw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=guS8dz6t;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd095872c6si138881826d6.329.2025.06.25.09.38.08
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 09:38:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=guS8dz6t;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750869488;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oGUU/IPrSry2Fwx2P5b8O9w0u3Wyi69gqhC1KaKfI04=;
	b=guS8dz6tAhRd1aONf7FHgjpgZwkV+upD2Vel+m6aqyygwQDtLyHs4/lsotr35YIgLk04oX
	UYc9gwX/YmwKMtk3uYHNnzmG3fFuik9q6F63id2qWc3OjlvppfdNY2tacW8t3ioB2VVsTq
	dLjW8wRBLUCMdh2w5oyrqG+diDAJNXI=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-67-zT2ApMJhOfizHJsQaD8EkA-1; Wed,
 25 Jun 2025 12:38:05 -0400
X-MC-Unique: zT2ApMJhOfizHJsQaD8EkA-1
X-Mimecast-MFC-AGG-ID: zT2ApMJhOfizHJsQaD8EkA_1750869483
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 119CB19560BA;
	Wed, 25 Jun 2025 16:38:02 +0000 (UTC)
Received: from localhost (mschlens-int.str.redhat.com [10.33.192.203])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AD52F1956096;
	Wed, 25 Jun 2025 16:37:59 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, eric.auger@redhat.com
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 kvmarm@lists.linux.dev, richard.henderson@linaro.org,
 alex.bennee@linaro.org, maz@kernel.org, oliver.upton@linux.dev,
 sebott@redhat.com, shameerali.kolothum.thodi@huawei.com,
 armbru@redhat.com, berrange@redhat.com, abologna@redhat.com,
 jdenemar@redhat.com, agraf@csgraf.de, shahuang@redhat.com,
 mark.rutland@arm.com, philmd@linaro.org, pbonzini@redhat.com
Subject: Re: [PATCH v8 00/14] arm: rework id register storage
In-Reply-To: <CAFEAcA95vCKpk1wXQh49xAWnqY=JZnKdr8NEQuYaRJr=jrKWyA@mail.gmail.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Avril Crosse O'Flaherty"
References: <20250617153931.1330449-1-cohuck@redhat.com>
 <05e903b3-02bf-4c04-ac2b-cdec0b45fe3f@redhat.com>
 <CAFEAcA95vCKpk1wXQh49xAWnqY=JZnKdr8NEQuYaRJr=jrKWyA@mail.gmail.com>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Wed, 25 Jun 2025 18:37:57 +0200
Message-ID: <87y0tfhj4q.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-TUID: xs/j2/fk4V+c

On Wed, Jun 25 2025, Peter Maydell <peter.maydell@linaro.org> wrote:

> On Wed, 25 Jun 2025 at 10:10, Eric Auger <eric.auger@redhat.com> wrote:
>> However there are other checkpatch errors besides the one you reported, in
>> 52873a54ad arm/cpu: Store aa64isar0/aa64zfr0 into the idregs arrays
>> ERROR: line over 90 characters
>> #388: FILE: target/arm/kvm.c:225:
>> +    return ARM64_SYS_REG((sysreg & CP_REG_ARM64_SYSREG_OP0_MASK) >>
>> CP_REG_ARM64_SYSREG_OP0_SHIFT,
>>
>> ERROR: line over 90 characters
>> #389: FILE: target/arm/kvm.c:226:
>> +                         (sysreg & CP_REG_ARM64_SYSREG_OP1_MASK) >>
>> CP_REG_ARM64_SYSREG_OP1_SHIFT,
>>
>> ERROR: line over 90 characters
>> #390: FILE: target/arm/kvm.c:227:
>> +                         (sysreg & CP_REG_ARM64_SYSREG_CRN_MASK) >>
>> CP_REG_ARM64_SYSREG_CRN_SHIFT,
>>
>> ERROR: line over 90 characters
>> #391: FILE: target/arm/kvm.c:228:
>> +                         (sysreg & CP_REG_ARM64_SYSREG_CRM_MASK) >>
>> CP_REG_ARM64_SYSREG_CRM_SHIFT,
>>
>> ERROR: line over 90 characters
>> #392: FILE: target/arm/kvm.c:229:
>> +                         (sysreg & CP_REG_ARM64_SYSREG_OP2_MASK) >>
>> CP_REG_ARM64_SYSREG_OP2_SHIFT);
>>
>> WARNING: line over 80 characters
>> #396: FILE: target/arm/kvm.c:233:
>> +static int get_host_cpu_reg(int fd, ARMHostCPUFeatures *ahcf,
>> ARMIDRegisterIdx index)
>
> The last one of those is probably easily fixed, but note the general
> remark in style.rst that it's better to have an overlong line than
> one with an awkward and unreadable wrapping. (We ought to fix
> checkpatch and style.rst to agree on whether to warn or error and
> whether that should be at 90 chars or 100 chars, but that would require
> reopening an old style argument and it's too much effort.)

I would not disagree with fixing the last one if wanted, but I think the
others are more readable if we do not try to break them up.

>
>> 5f15ebdf3f arm/cpu: Add sysreg definitions in cpu-sysregs.h
>> ERROR: Macros with complex values should be enclosed in parenthesis
>> #56: FILE: target/arm/cpu-sysregs.h:21:
>> +#define DEF(NAME, OP0, OP1, CRN, CRM, OP2) NAME##_IDX,
>>
>> ERROR: Macros with complex values should be enclosed in parenthesis
>> #64: FILE: target/arm/cpu-sysregs.h:29:
>> +#define DEF(NAME, OP0, OP1, CRN, CRM, OP2) \
>> +    SYS_##NAME = ENCODE_ID_REG(OP0, OP1, CRN, CRM, OP2),
>>
>> ERROR: Macros with complex values should be enclosed in parenthesis
>> #203: FILE: target/arm/cpu64.c:40:
>> +#define DEF(NAME, OP0, OP1, CRN, CRM, OP2)      \
>> +    [NAME##_IDX] = SYS_##NAME,
>
> This is checkpatch not being able to cope with more complex
> uses of the preprocessor; the warning only makes sense for
> "acts like a function" macros.

Yep, that's why I ignored it.

In general, should we mention that we intentionally ignored
checkpatch.pl feedback, or would that be just noise?
