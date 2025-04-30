Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp957592njm;
        Wed, 30 Apr 2025 06:48:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWRs9Y5WCn8FazNYmnT2tddEIWfDYmSej6NfPQkgT3te049uPUDw2cIuvXSPCTzWX+WxxkCZVZNjgjjeA==@linaro.org
X-Google-Smtp-Source: AGHT+IGY/6sQ5e1peiTJmyRPJCqlPguZTMdcni2+ga8uHk20WJLUYFv8cAQNqP7S+lEydvhtW0Tc
X-Received: by 2002:a05:620a:2545:b0:7c5:53ab:a722 with SMTP id af79cd13be357-7cac7e013b1mr381144285a.5.1746020916821;
        Wed, 30 Apr 2025 06:48:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746020916; cv=none;
        d=google.com; s=arc-20240605;
        b=O7JVmvN6zDyM3ZmBdoMFYslJQUpI8Vbo9HwUjHlrNz9TX1UPciGMkXJ7hOjcNdb/mo
         5tkWwujUX9Jj482KxSmCFbPQNLd1MIm4Hwt+aLN22hq9R0xEZQ+AuZ4xTzSfShTGPCSf
         Khx7ZjxAFWdllNTRihF4p6tclhs8vMWEwXQKO6PcI74tI0ubWDpSvu0RUJckHDUaAo1W
         onroVQD237Vh1RL+0xv0WhLDjzPEKoflqrSt8gQBffTdKYNKv1LMizi3gwzSxmxn2RUg
         hhKdr2gbZuftXIuhSwWKvTKPSwxfQGVINennD1gdpX9cNjDBxPNj6soOaqHDmU1+oOfZ
         2EuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:message-id:date:user-agent:references:organization
         :in-reply-to:subject:cc:to:from:dkim-signature;
        bh=oLVOo1RS7FiUiZjstQUcuIC9vXhBzHVmV4xEjiYp0vQ=;
        fh=0U8LTlSH/uwceEZmrxihEpL94sypADyLZ9l1MmaQxsw=;
        b=ll0fowg99x3jFIJkW06NZ5ms4EufoP/G6BCd0T0PpMKmsF+E+1mn9N5YX8LBUMEFtb
         fYayJHYajOD3uop+cu64fetZNkdIcEv8n/UrLhReFBliAg3DCE8qWjeSdSLDV/BrqmNs
         XH6lAo3EFUdTJFug/2AIjNkxtcE5VsII9NNRBoL9+KxGXaJZRMdTkuLJiRfILNhqDIuA
         ZWI7quezSDUMcNXKU+TIL8gVPt6hDQ8cUqZxsh/bRsa+mFNZtNwXwf/phKQr9eWJp3dj
         PMw9Ixff1ybwK1huJOwX2MtoZSYkkHhy/rrH0XixxElnBzumjv6NztVk7kjS/4lgUJft
         7ckQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Wv5hgiuA;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7c958c9f0f0si1481236085a.26.2025.04.30.06.48.36
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 06:48:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Wv5hgiuA;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746020916;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oLVOo1RS7FiUiZjstQUcuIC9vXhBzHVmV4xEjiYp0vQ=;
	b=Wv5hgiuAutQveD73855oWmIn59oe/yFKj6m/xaJfn+gB9Wd4egFgwgBXaeD//C+UW3oay9
	BSswPCkYg87thHylmFDjuPrtDR6CPw+53JXYMUxdoEzSUIspXcKezPf/uuBuzwn2KO04E9
	EDS8mFlAEAO1HzkTPifBK9BX06hUIQA=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-328-9t1_IlpnMES5Gy2AHNDGcA-1; Wed,
 30 Apr 2025 09:48:32 -0400
X-MC-Unique: 9t1_IlpnMES5Gy2AHNDGcA-1
X-Mimecast-MFC-AGG-ID: 9t1_IlpnMES5Gy2AHNDGcA_1746020910
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0574B1800446;
	Wed, 30 Apr 2025 13:48:29 +0000 (UTC)
Received: from localhost (unknown [10.67.24.156])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 100E919560A3;
	Wed, 30 Apr 2025 13:48:25 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Sebastian Ott <sebott@redhat.com>
Cc: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, kvmarm@lists.linux.dev, peter.maydell@linaro.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
 oliver.upton@linux.dev, shameerali.kolothum.thodi@huawei.com,
 armbru@redhat.com, berrange@redhat.com, abologna@redhat.com,
 jdenemar@redhat.com, agraf@csgraf.de, shahuang@redhat.com,
 mark.rutland@arm.com, philmd@linaro.org, pbonzini@redhat.com
Subject: Re: [PATCH v3 05/10] arm/cpu: accessors for writable id registers
In-Reply-To: <bebefcad-d9db-a2b7-ab69-8eed34b9e63d@redhat.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20250414163849.321857-1-cohuck@redhat.com>
 <20250414163849.321857-6-cohuck@redhat.com>
 <bebefcad-d9db-a2b7-ab69-8eed34b9e63d@redhat.com>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Wed, 30 Apr 2025 15:48:19 +0200
Message-ID: <877c31rc9o.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-TUID: 5vjuVUqyqUbg

On Tue, Apr 29 2025, Sebastian Ott <sebott@redhat.com> wrote:

> On Mon, 14 Apr 2025, Cornelia Huck wrote:
>> Also add conversion between the different indices.
>>
>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>> ---
>> target/arm/cpu.h | 18 ++++++++++++++++++
>> 1 file changed, 18 insertions(+)
>>
>> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
>> index bbee7ff2414a..775a8aebc5d3 100644
>> --- a/target/arm/cpu.h
>> +++ b/target/arm/cpu.h
>> @@ -876,6 +876,13 @@ typedef struct IdRegMap {
>>     uint64_t regs[NR_ID_REGS];
>> } IdRegMap;
>>
>> +#define ARM_FEATURE_ID_RANGE_IDX(op0, op1, crn, crm, op2)               \
>> +        ({                                                              \
>> +                __u64 __op1 = (op1) & 3;                                \
>> +                __op1 -= (__op1 == 3);                                  \
>> +                (__op1 << 6 | ((crm) & 7) << 3 | (op2));                \
>> +        })
>> +
>> /* REG is ID_XXX */
>> #define FIELD_DP64_IDREG(ISAR, REG, FIELD, VALUE)                       \
>>     ({                                                                  \
>> @@ -923,6 +930,17 @@ typedef struct IdRegMap {
>>         i_->idregs[REG ## _EL1_IDX];                                    \
>>     })
>>
>> +#define GET_IDREG_WRITABLE(MAP, REG)                                  \
>> +    ({                                                                \
>> +    const IdRegMap *m_ = (MAP);                                       \
>> +    int index = ARM_FEATURE_ID_RANGE_IDX((sysreg >> 14) & 0x0000c000, \
>> +                                         (sysreg >> 11) & 0x00003800, \
>> +                                         (sysreg >> 7) & 0x00000780,  \
>> +                                         (sysreg >> 3) & 0x00000078,  \
>> +                                         sysreg & 0x00000007);        \
>> +    m_->regs[index];                                                  \
>> +    })
>> +
>
> s/sysreg/REG/
>
> Also GET_IDREG_WRITABLE doesn't seem to be used in this series.

Hm, and it wouldn't have worked if we did use it... probably an artifact
left over from earlier refactorings, I think we can get rid of it.
