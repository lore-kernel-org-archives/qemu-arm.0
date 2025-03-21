Received: by 2002:a17:504:5f65:b0:1be9:327d:8ee3 with SMTP id gl5csp398824njc;
        Fri, 21 Mar 2025 08:29:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVe8ar8jkiU6vW//i4bbBVTd09YDTAwHKeH+buQVMLdrsUHT/Rf/h+j2wZ6pjS0ZAk2mIu8uFldNO/69g==@linaro.org
X-Google-Smtp-Source: AGHT+IEYpG1yjFqkxtiLetz3N3j+QHXpEW7n8LTc81CMMp9G2iecMszL+bbG8OQO4IZSuvV5/jsW
X-Received: by 2002:a05:6214:400c:b0:6e4:4484:f35b with SMTP id 6a1803df08f44-6eb3f35b170mr57124376d6.30.1742570971592;
        Fri, 21 Mar 2025 08:29:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1742570971; cv=none;
        d=google.com; s=arc-20240605;
        b=MzsMl01zcOl6L5cwssZJyD1Ttj0aG3qd1cqLM/kjbmFxRQxnU9mNYQoU+KvkHHLAtT
         k9lOU9nxL3Q19+eZXUUZzEb4sXMburBcS/U1/mbkgj418xzMfp2VXSfNpLl8B8fUlfjE
         i3QPCksgj1uO9x3giT7/vZGIvbM3M5S3VbuWM+1e31YkJbmk8B48OEV2fUP1l+OVO52i
         5NK7EBJDLuZb8AvgTnWZxuy9AjaT/ZUiie6IYCZmdp1aJ1fXq/nrBf9OxsssuuDx5HMt
         kMsVwp9+hnO1T9L4NulFYNwV241JNHS7MJqUMgbYHwoxH9EVz4/afMqm9nwn7myjzOXC
         vCvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:message-id:date:user-agent:references:organization
         :in-reply-to:subject:cc:to:from:dkim-signature;
        bh=4tZTzGgPKruPQVAWMAtbqY5MZg/vcSrQFesspSXYw08=;
        fh=0U8LTlSH/uwceEZmrxihEpL94sypADyLZ9l1MmaQxsw=;
        b=EKaEjI7rrYynzQkDa/VsPNsFx2MH6tjEirWn1O9jYrjgAwDTxkFAw9bs1KSxz0PBTd
         fYpa7md9bqEb8XVEEOBcKz6WEV2AfiNFrr2bLlmIQKd4BTRH6w5G9qxlzbpEOfgdvJyo
         ZSt5m82gnyxwwlIbo5Ai7hveiyCT7rsUM9tfj4qgZ2V16KgYSHvurBBblcBp1dZ7BufY
         zeaUEbWo9FE+gDkPzSbQiMc0Maz0dhygiFZOuak9zAYWX8nshiTBBNLQKzNT2GpL/uYF
         yAnTn/bxnGV564jhWE2AlCYFOjnVaWbkIeAlTjtY0lShjKwOY709MqrM76U7l4Th6LY7
         Z6vg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fjevIMUV;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6eb3f01a3eesi20256676d6.325.2025.03.21.08.29.31
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 08:29:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=fjevIMUV;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742570971;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4tZTzGgPKruPQVAWMAtbqY5MZg/vcSrQFesspSXYw08=;
	b=fjevIMUVy3jnqTeBQ+qywsKZRr/Q92dNTZtFAEF+q8KHYHuok/nADGBtizVo+OQYOjBOk4
	sHn1HB9XnalX61yvdFkzq3W6jYbewRBa09CZQcdZeQqILytGLDAWFiu44f9xB2w2LjFbf4
	GtzTSHY8RZC3vR6FlZUC2q2A9b40nls=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-351-z9XOUjvyPIWnnUBBdnLNDg-1; Fri,
 21 Mar 2025 11:29:26 -0400
X-MC-Unique: z9XOUjvyPIWnnUBBdnLNDg-1
X-Mimecast-MFC-AGG-ID: z9XOUjvyPIWnnUBBdnLNDg_1742570965
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CAD31180AF50;
	Fri, 21 Mar 2025 15:29:23 +0000 (UTC)
Received: from localhost (unknown [10.67.24.51])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4C0541954B04;
	Fri, 21 Mar 2025 15:29:19 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Sebastian Ott <sebott@redhat.com>
Cc: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, kvmarm@lists.linux.dev, peter.maydell@linaro.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
 oliver.upton@linux.dev, shameerali.kolothum.thodi@huawei.com,
 armbru@redhat.com, berrange@redhat.com, abologna@redhat.com,
 jdenemar@redhat.com, agraf@csgraf.de, shahuang@redhat.com,
 mark.rutland@arm.com, philmd@linaro.org, pbonzini@redhat.com
Subject: Re: [PATCH v3 01/14] arm/cpu: Add sysreg definitions in cpu-sysregs.h
In-Reply-To: <7c6ab887-2c9f-6646-4f0c-790671b28c62@redhat.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20250311162824.199721-1-cohuck@redhat.com>
 <20250311162824.199721-2-cohuck@redhat.com>
 <7c6ab887-2c9f-6646-4f0c-790671b28c62@redhat.com>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Fri, 21 Mar 2025 16:29:13 +0100
Message-ID: <87v7s2tnau.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-TUID: E7RYfrnlakbo

On Thu, Mar 20 2025, Sebastian Ott <sebott@redhat.com> wrote:

> On Tue, 11 Mar 2025, Cornelia Huck wrote:
>> +++ b/target/arm/cpu.h
> [...]
>> +/* REG is ID_XXX */
>> +#define FIELD_DP64_IDREG(ISAR, REG, FIELD, VALUE)                       \
>> +    ({                                                                  \
>> +        ARMISARegisters *i_ = (ISAR);                                   \
>> +        uint64_t regval = i_->idregs[REG ## _EL1_IDX];                  \
>
> This won't work for regs that don't fit this naming scheme. Up to this
> point in the series that's only CTR_EL0, later with the auto generation it
> will be more. But I guess this can be extended when/if there's an actual
> need..

All ID_XXX registers fit the "has an _EL1 suffix" scheme, though, and
these are what we use the _IDREG() accessors for (we use FIELD_DP64 for
CTR_EL0 fields.) (At least, that matches what I see called "ID
registers" in the Arm Arm.)

The sysregs we get via
KVM_ARM_GET_REG_WRITABLE_MASKS/KVM_ARM_FEATURE_ID_RANGE
contain ID_XXX registers, and some more writable registers in the
feature id range which are not really id registers (but which we want to
handle via the command line as well). I think all the non _EL1 registers
we want to handle fall into the latter category (i.e. we're not going to
use the _IDREG() accessors for them?)
