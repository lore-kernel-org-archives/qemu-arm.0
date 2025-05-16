Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp2572770njb;
        Fri, 16 May 2025 07:17:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXif/GQ8S2Cg1bXG7h3gxCl6vrj0ezmjg6yndwFAI0cU88lg4TXz3seERbbKed0pj/SsnJSrWSKbYTtAQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHg5A4bJU0Y2gtAUm6Cdk/vgYHcCziSXtdcQLOM2FvPwNBXa9nyfOLbF2ke7H2ee2PzPHvr
X-Received: by 2002:a05:620a:44d0:b0:7cd:35:52d0 with SMTP id af79cd13be357-7cd460b921bmr453448785a.0.1747405036758;
        Fri, 16 May 2025 07:17:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747405036; cv=none;
        d=google.com; s=arc-20240605;
        b=U4BaxH4zMA2I3jWvOnFlkpR4sKU3WOl8kN9XeO629sK8CQ0uGLkSXWWe83nBzEM2vn
         ziuVJ1mSt/5XwJQSafhJ+ra7WFvi24iKJR2iIX9MZJxTC53x8LbkJdu/qHkQwNeOSS+f
         2nPuAl5AjpAubru2/8dVwPEyHBsJQvqS/67molytVNRG+DmROIX2IaH+P7ZEAOpos2/j
         DwkDV0yRs/YGfwsCYXNrUeON7PioCOqHP7CRy0xDbB+9ZDqByfFSl/gkqx3NO1djHTQ1
         W7LUuXdMuvvKGbd8Z5PT29Lfhu7XWp4Wt5h0bD/o/zAppRRLVN5XfFBG8nGxT8PFNAD1
         iRgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:message-id:date:user-agent:references:organization
         :in-reply-to:subject:cc:to:from:dkim-signature;
        bh=TERTr/nzmmczkc5dKkRLFBUYCo0L45Zgj3qT12f3LLU=;
        fh=iQ7n1v0snccwxUvUyN2HRcGQY4i7GKA5J/Y52/7OCuQ=;
        b=b8+kn0jbwCBOiDBrUInUm2F6h7Men7ic9pUQkpaQOpAcESvdxigVlB55F50h3cgI7f
         vhGLCdRzNuVhO5czVa0ByhfRMcu3EhAPAV2WkCbNuPJp+2HPZra8vrP2ockdgethmCEu
         w7MsGFQm9+NViGa+dWpF9f19fmvu28tQ43biWOut5zHIKiRiruKf+CLEYDi52/ndfvkK
         b9wChkRF3xectU4pCCtmGcSdynHD5aH5wzTEKzkYY06B1DZaaLIDOQ+a+qSj8tUz23ZL
         UK48BuX2WWA72UhPvxG+gBdAHzTp0YhQCr/3gQOTgc/2t8xcl+Z1KniuLlF5a7Rhwdon
         sjvw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Bvb2dyEx;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7cd467cf192si257802185a.48.2025.05.16.07.17.16
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 07:17:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Bvb2dyEx;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747405036;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TERTr/nzmmczkc5dKkRLFBUYCo0L45Zgj3qT12f3LLU=;
	b=Bvb2dyExi1KsUt9u52YpWpP41QpD3agRXjD9HE1Lc+RU97q0/Z30lM+dlhzbi/jBwFfprS
	d7GDmeqfoDw5wHBxt8VlNjGNOKHpWUPKSsEm1rk+DcVOVUJFzQMt9qjSA1jqWSunncd0gD
	AI7CZgft6PkxFihHxsHXNn0/4Md3a8Y=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-489-GNsxUTNXPbqjfztNOK0eSw-1; Fri,
 16 May 2025 10:17:13 -0400
X-MC-Unique: GNsxUTNXPbqjfztNOK0eSw-1
X-Mimecast-MFC-AGG-ID: GNsxUTNXPbqjfztNOK0eSw_1747405031
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CF948195608C;
	Fri, 16 May 2025 14:17:09 +0000 (UTC)
Received: from localhost (dhcp-192-216.str.redhat.com [10.33.192.216])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D154B195608D;
	Fri, 16 May 2025 14:17:07 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: eric.auger@redhat.com, eric.auger.pro@gmail.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, kvmarm@lists.linux.dev, peter.maydell@linaro.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
 oliver.upton@linux.dev, sebott@redhat.com,
 shameerali.kolothum.thodi@huawei.com, armbru@redhat.com,
 berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com
Cc: agraf@csgraf.de, shahuang@redhat.com, mark.rutland@arm.com,
 philmd@linaro.org, pbonzini@redhat.com
Subject: Re: [PATCH v3 06/10] arm/kvm: Allow reading all the writable ID
 registers
In-Reply-To: <a706e9a2-0a49-4296-ba0a-8001f433b8b8@redhat.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20250414163849.321857-1-cohuck@redhat.com>
 <20250414163849.321857-7-cohuck@redhat.com>
 <a706e9a2-0a49-4296-ba0a-8001f433b8b8@redhat.com>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Fri, 16 May 2025 16:17:05 +0200
Message-ID: <871psod4im.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-TUID: nlou7n4euBE4

On Tue, May 13 2025, Eric Auger <eric.auger@redhat.com> wrote:

> On 4/14/25 6:38 PM, Cornelia Huck wrote:
>> From: Eric Auger <eric.auger@redhat.com>
(...)

>> +static bool
>> +kvm_arm_get_host_cpu_features(ARMCPU *cpu, ARMHostCPUFeatures *ahcf,
>> +                              bool exhaustive)
> maybe the exhaustive term shall be replaced by handle_writable_id_regs
> which tells more explicitly what it does

Maybe get_all_writable_id_regs?

>>  {
>>      /* Identify the feature bits corresponding to the host CPU, and
>>       * fill out the ARMHostCPUClass fields accordingly. To do this

(...)

>> diff --git a/target/arm/kvm_arm.h b/target/arm/kvm_arm.h
>> index 8d1f20ca8d89..90ba4f7d8987 100644
>> --- a/target/arm/kvm_arm.h
>> +++ b/target/arm/kvm_arm.h
>> @@ -141,8 +141,12 @@ uint32_t kvm_arm_sve_get_vls(ARMCPU *cpu);
>>   *
>>   * Set up the ARMCPU struct fields up to match the information probed
>>   * from the host CPU.
>> + *
>> + * @cpu: cpu object
>> + * @exhaustive: if true, all the feature ID regs are queried instead of
> s/queried/handled
>> + *              a subset

And make this "if true, additionally get the contents of all writable ID
registers as well"?

>>   */
>> -void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu);
>> +void kvm_arm_set_cpu_features_from_host(ARMCPU *cpu, bool exhaustive);
