Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp569869njb;
        Tue, 13 May 2025 07:42:49 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW2nsEmb2bSzH0/n5WDCftsC9MzhOrzyPB/Ww62pyFuz0fzBhHjAuMWeKAZKpPY2/eJrS+NEQGsTVVwAA==@linaro.org
X-Google-Smtp-Source: AGHT+IFIKT+a0hmcR8QGp2bk9E9UKPLJnSiVuLN9+1ENBBvRAdMDpdUhQeUoqM/CYsXfM+/x/WpX
X-Received: by 2002:a05:622a:111:b0:48c:5c4d:68e7 with SMTP id d75a77b69052e-49452714663mr268459261cf.6.1747147368899;
        Tue, 13 May 2025 07:42:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747147368; cv=none;
        d=google.com; s=arc-20240605;
        b=QRY8nyc4fLfW2vn1K447qk1WaO6Bi0cU67v4DphB4gS+NF1HAfOOqv+j/dn1DjuPqX
         2UM4eVid48m3F+9DszTceeN/tcYabUD3p6brA5Xdf8kEoxHSR9ApdXA64iZpKNmdANc8
         lUnN/cZfvCBbFU6jqF4+G8zr4y5srSTukr3d3+P3jqjLugN6bFuhVQ/CURmNyHZaoGV4
         ZRpnnD9zRlYxV9c/7R7x5nluzFOyfNUvnoftQ5jqXSCfHJDdgDdRSCNI8UgDb+nnvRNV
         GeoREmid6LjlQk5DhNfvGq5+5UUIMJjBAysUbwTGarWYf3+hoxug9kkRFStg2eAZyYUO
         Vppg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:message-id:date:user-agent:references:organization
         :in-reply-to:subject:cc:to:from:dkim-signature;
        bh=p6Pc/DoCV1c6L4UtfRaupclGbLmRZkZUjIct4ZRvSAg=;
        fh=iQ7n1v0snccwxUvUyN2HRcGQY4i7GKA5J/Y52/7OCuQ=;
        b=I5/l/jKsHR95N6iOJHBoVg4ia8spQRfiBM51OUMuFggmNvm6O1HwJyz73y8H62eG44
         pIVT02dEjC7OnrzL8s5FtXKuLif5TgHkxVOdNSYCqOv2xHHFZdNRi2gnIfGR9Ieu+GA6
         Grg+9Lh4KskstNUxI+0zKFEvBFBooGDuDEQ5xaaoW4agwECREORYrFJGimPxtRqrOE+G
         ZaidxYsBsoV9W2M0WgnJaN9V4F8D3VHAuehwJiPf5mOyZMFQqUCN5mrAWDN44b7WOHBd
         wbtw6JAfyB/cRb6hO3fVys67gIukrt67WFQeRtnCX2XCXWtndxxIhh72yPIQ0GeOfCcK
         kZ0w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="V17PIx/b";
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4945255a09dsi110955941cf.208.2025.05.13.07.42.48
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 07:42:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="V17PIx/b";
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747147368;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=p6Pc/DoCV1c6L4UtfRaupclGbLmRZkZUjIct4ZRvSAg=;
	b=V17PIx/beLSYZu397kOYCecBTfH2Zw1mpsOjbKzTEHuGwSU4H195MEtEthRGaHQKiTpBye
	3QmdyiwG33UqfGjDnsTTbgFxecHILwsFAK2ju2BGeXPLxoxPtof18EwvmzURFv6RaTr5fb
	IWARx13bCjMystNKUZWUHK2y9KtEjeY=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-177-qDPC7BQuNki1Jg3wfs3r-A-1; Tue,
 13 May 2025 10:42:45 -0400
X-MC-Unique: qDPC7BQuNki1Jg3wfs3r-A-1
X-Mimecast-MFC-AGG-ID: qDPC7BQuNki1Jg3wfs3r-A_1747147362
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 085671800368;
	Tue, 13 May 2025 14:42:42 +0000 (UTC)
Received: from localhost (dhcp-192-216.str.redhat.com [10.33.192.216])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D93A7180049D;
	Tue, 13 May 2025 14:42:40 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: eric.auger@redhat.com, eric.auger.pro@gmail.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, kvmarm@lists.linux.dev, peter.maydell@linaro.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
 oliver.upton@linux.dev, sebott@redhat.com,
 shameerali.kolothum.thodi@huawei.com, armbru@redhat.com,
 berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com
Cc: agraf@csgraf.de, shahuang@redhat.com, mark.rutland@arm.com,
 philmd@linaro.org, pbonzini@redhat.com
Subject: Re: [PATCH v3 04/10] kvm: kvm_get_writable_id_regs
In-Reply-To: <4f370fae-8234-48ca-97e2-3b7038092974@redhat.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20250414163849.321857-1-cohuck@redhat.com>
 <20250414163849.321857-5-cohuck@redhat.com>
 <4f370fae-8234-48ca-97e2-3b7038092974@redhat.com>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Tue, 13 May 2025 16:42:38 +0200
Message-ID: <878qn0po69.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-TUID: WwNpIATe59rW

On Tue, May 13 2025, Eric Auger <eric.auger@redhat.com> wrote:

> Hi Connie,
>
> On 4/14/25 6:38 PM, Cornelia Huck wrote:
>> Add an helper to retrieve the writable id reg bitmask. The
>> status of the query is stored in the CPU struct so that an
>> an error, if any, can be reported on vcpu realize().
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>> ---
>>  target/arm/cpu.h     | 26 ++++++++++++++++++++++++++
>>  target/arm/kvm.c     | 32 ++++++++++++++++++++++++++++++++
>>  target/arm/kvm_arm.h |  7 +++++++
>>  3 files changed, 65 insertions(+)
>>
>> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
>> index d27134f4a025..bbee7ff2414a 100644
>> --- a/target/arm/cpu.h
>> +++ b/target/arm/cpu.h
>> @@ -856,6 +856,26 @@ typedef struct {
>>      uint32_t map, init, supported;
>>  } ARMVQMap;
>>  
>> +typedef enum ARMIdRegsState {
>> +    WRITABLE_ID_REGS_UNKNOWN,
>> +    WRITABLE_ID_REGS_NOT_DISCOVERABLE,
>> +    WRITABLE_ID_REGS_FAILED,
>> +    WRITABLE_ID_REGS_AVAIL,
>> +} ARMIdRegsState;
>> +
>> +/*
>> + * The following structures are for the purpose of mapping the output of
>> + * KVM_ARM_GET_REG_WRITABLE_MASKS that also may cover id registers we do
>> + * not support in QEMU
>> + * ID registers in op0==3, op1=={0,1,3}, crn=0, crm=={0-7}, op2=={0-7},
>> + * as used by the KVM_ARM_GET_REG_WRITABLE_MASKS ioctl call.
>> + */
>> +#define NR_ID_REGS (3 * 8 * 8)
> We may rename this define to better associate to the KVM API. I tend to
> mix it with NUM_ID_IDX now ;-)
> maybe something like KVM_NR_EXPOSED_ID_REGS

The kernel calls it KVM_FEATURE_ID_RANGE_SIZE, but I'd like to avoid
adding 'KVM' in the name, as it is basically a range of registers and
nothing really KVM specific... maybe ID_REG_RANGE_SIZE?

>> +
>> +typedef struct IdRegMap {
>> +    uint64_t regs[NR_ID_REGS];
>> +} IdRegMap;
> I would add a comment saying this is the mask array, just to prevent the
> reading from thinking it is the actual reg content.

"More comments" seems to be a theme :) I'll go ahead and add them where
it makes sense.

>> +
>>  /* REG is ID_XXX */
>>  #define FIELD_DP64_IDREG(ISAR, REG, FIELD, VALUE)                       \
>>      ({                                                                  \
>> @@ -1044,6 +1064,12 @@ struct ArchCPU {
>>       */
>>      bool host_cpu_probe_failed;
>>  
>> +    /*
>> +     * state of writable id regs query used to report an error, if any,
>> +     * on KVM custom vcpu model realize
>> +     */
>> +    ARMIdRegsState writable_id_regs;
> maybe rename into writable_id_reg_status that would better reflect what
> it is.

Indeed.
