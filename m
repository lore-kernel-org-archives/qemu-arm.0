Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp782026njb;
        Tue, 18 Feb 2025 07:55:14 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUVodDvGL3V8v1G0tA2pzTauu1wJUag8ar7fVa7GhqtHcnPaqCTBC+0dJ6BHYJAhfyHMUS2oLRb+WZ/fQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEkUZ4goFvxHS1+vmtig5OtnO29n5aNZDkvARLIlGVvwLTlKHYfA+9fVswzxAv2yhaEgBpT
X-Received: by 2002:a05:622a:1a09:b0:471:fee7:9610 with SMTP id d75a77b69052e-4720826e0f1mr2049931cf.12.1739894114438;
        Tue, 18 Feb 2025 07:55:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739894114; cv=none;
        d=google.com; s=arc-20240605;
        b=k6pF0apKF8Ki+2h5HEr3tVS6L6VMMoZv77MfqV4k6dTtZH5Ap3k2DLrrgGuJFBQFJw
         3ZvqlqtCJ3QGb/0/pqPkokVPVM5k4zfFO2gemftzoygoKUHPutPjjpa0EWc9FBO2yzYY
         +bdzJ5apX36edkDXAZtUqdAjspE4TbuDIGvMhTed5KoUx1PfMQXWdpHDbfytE0nY05vx
         9z1T0ST1pthmQ2mKt7PAe/kKxTnBuDGEWKXm8tAzrHdb4RusSod3SxS9MjsA0gwQVNBN
         adCALbFS0JzHJWgo4C6UQlNPGtxvqTPvtMhw3y3ssrjOt8ByceBZ3t+7fuGeIj/uL40Y
         cR5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:message-id:date:user-agent:references:organization
         :in-reply-to:subject:cc:to:from:dkim-signature;
        bh=j90RWZALR1P7KicoAf1AmydoBRa+BXoXUs125IAi9hQ=;
        fh=5EbKAKXusbjR2z3WfV6tA91hfzB/YvLBnvQy0XS/1QY=;
        b=Bkvdu2e8v0WazQ1l4GiJuAUrVpHWPB40c9E7smzSdWIxPtV5+iXhlhcwXeh6Xk9I7G
         9P8kykDyhwH56h4xVuuVnkdwa9dRIlHHIumlrcd3ndji/ceHHaPzsz1AmvtB8ebPESKP
         7e4buZOBo/khMBC7hrQpX0bu6IfPl/tglTtQzJDBwdXmGsqfdQSJIfaZIAFXTg3y8epa
         AftuPsiBsLitb5VYFcRvbkY07DJ3uqe7gvg5vanwanjavesm/7RpRQKxvC2RYw2lhfdS
         miSzTQYOaiqvGBZCcifsVr6LHMIr74jesL8rzpLCY3T2q6HGB/V+5m2nXyZoUcHixtH5
         ZT2Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=awfH8RwC;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-471f4d2137esi34536431cf.460.2025.02.18.07.55.14
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 07:55:14 -0800 (PST)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=awfH8RwC;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739894114;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=j90RWZALR1P7KicoAf1AmydoBRa+BXoXUs125IAi9hQ=;
	b=awfH8RwCtk7XKNsIWUqD76HI277GhPbam3TxX2ny2ZMKTn9x7HYREhcs//I77B65KVagqX
	jweBUxI5S10+TkTLg+FCZxQ9SszjzaesXJhqG92c89NCDFYXPmrm8q5qGXec3DU/atn5ju
	lKuMzBlGwB3IJ+ueLOI/gIOADlHofIQ=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-99-pIBM1XteNju7bqO1WirvZQ-1; Tue,
 18 Feb 2025 10:55:09 -0500
X-MC-Unique: pIBM1XteNju7bqO1WirvZQ-1
X-Mimecast-MFC-AGG-ID: pIBM1XteNju7bqO1WirvZQ_1739894108
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 632AD180087A;
	Tue, 18 Feb 2025 15:55:07 +0000 (UTC)
Received: from localhost (unknown [10.67.24.70])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0263E1800874;
	Tue, 18 Feb 2025 15:55:04 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: eric.auger@redhat.com, eric.auger.pro@gmail.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, kvmarm@lists.linux.dev, peter.maydell@linaro.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
 oliver.upton@linux.dev, sebott@redhat.com,
 shameerali.kolothum.thodi@huawei.com, armbru@redhat.com,
 berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com
Cc: shahuang@redhat.com, mark.rutland@arm.com, philmd@linaro.org,
 pbonzini@redhat.com
Subject: Re: [PATCH 02/15] arm/kvm: add accessors for storing host features
 into idregs
In-Reply-To: <b1a2e796-b2f5-4acc-9d6d-e85d99d67a0d@redhat.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20250207110248.1580465-1-cohuck@redhat.com>
 <20250207110248.1580465-3-cohuck@redhat.com>
 <b1a2e796-b2f5-4acc-9d6d-e85d99d67a0d@redhat.com>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Tue, 18 Feb 2025 16:54:58 +0100
Message-ID: <874j0r459p.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-TUID: v1s9D9jhuN9j

On Tue, Feb 18 2025, Eric Auger <eric.auger@redhat.com> wrote:

> Hi Connie
>
> On 2/7/25 12:02 PM, Cornelia Huck wrote:
>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>> ---
>>  target/arm/cpu-sysregs.h |  3 +++
>>  target/arm/cpu64.c       | 25 +++++++++++++++++++++++++
>>  target/arm/kvm.c         | 30 ++++++++++++++++++++++++++++++
>>  3 files changed, 58 insertions(+)
>>
>> diff --git a/target/arm/cpu-sysregs.h b/target/arm/cpu-sysregs.h
>> index de09ebae91a5..54a4fadbf0c1 100644
>> --- a/target/arm/cpu-sysregs.h
>> +++ b/target/arm/cpu-sysregs.h
>> @@ -128,4 +128,7 @@ static const uint32_t id_register_sysreg[NUM_ID_IDX] = {
>>      [CTR_EL0_IDX] = SYS_CTR_EL0,
>>  };
>>  
>> +int get_sysreg_idx(ARMSysRegs sysreg);
>> +uint64_t idregs_sysreg_to_kvm_reg(ARMSysRegs sysreg);
>> +
>>  #endif /* ARM_CPU_SYSREGS_H */
>> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
>> index 8188ede5cc8a..9ae78253cb34 100644
>> --- a/target/arm/cpu64.c
>> +++ b/target/arm/cpu64.c
>> @@ -736,6 +736,31 @@ static void aarch64_a53_initfn(Object *obj)
>>      define_cortex_a72_a57_a53_cp_reginfo(cpu);
>>  }
>>  
>> +#ifdef CONFIG_KVM
>> +
>> +int get_sysreg_idx(ARMSysRegs sysreg)
>> +{
>> +    int i;
>> +
>> +    for (i = 0; i < NUM_ID_IDX; i++) {
>> +        if (id_register_sysreg[i] == sysreg) {
> I agree with Richard that if we could get rid of this linear search it
> would be nicer.

FWIW, I have a local branch which reworks the lookup and the macros that
is currently in the "it compiles" stage. Hopefully progressing to the
"it works" stage (provided I'm not preempted by other things again.)

>> +            return i;
>> +        }
>> +    }
>> +    return -1;
>> +}
>> +
>> +uint64_t idregs_sysreg_to_kvm_reg(ARMSysRegs sysreg)
>> +{
>> +    return ARM64_SYS_REG((sysreg & CP_REG_ARM64_SYSREG_OP0_MASK) >> CP_REG_ARM64_SYSREG_OP0_SHIFT,
>> +                         (sysreg & CP_REG_ARM64_SYSREG_OP1_MASK) >> CP_REG_ARM64_SYSREG_OP1_SHIFT,
>> +                         (sysreg & CP_REG_ARM64_SYSREG_CRN_MASK) >> CP_REG_ARM64_SYSREG_CRN_SHIFT,
>> +                         (sysreg & CP_REG_ARM64_SYSREG_CRM_MASK) >> CP_REG_ARM64_SYSREG_CRM_SHIFT,
>> +                         (sysreg & CP_REG_ARM64_SYSREG_OP2_MASK) >> CP_REG_ARM64_SYSREG_OP2_SHIFT);
>> +}
>> +
>> +#endif
>> +
>>  static void aarch64_host_initfn(Object *obj)
>>  {
>>  #if defined(CONFIG_KVM)
>> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
>> index da30bdbb2349..3b8bb5661f2b 100644
>> --- a/target/arm/kvm.c
>> +++ b/target/arm/kvm.c
>> @@ -246,6 +246,36 @@ static bool kvm_arm_pauth_supported(void)
>>              kvm_check_extension(kvm_state, KVM_CAP_ARM_PTRAUTH_GENERIC));
>>  }
>>  
>> +/* read a 32b sysreg value and store it in the idregs */
>> +static int get_host_cpu_reg32(int fd, ARMHostCPUFeatures *ahcf, ARMSysRegs sysreg)
> those are defined as static but there is no user so this will break
> compilation locally

Hm, didn't see that, but noticed a few other places that are b0rken. I
think I need to fiddle with my config to broaden compilation coverage.
