Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp2535242njc;
        Tue, 15 Apr 2025 02:54:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWb7p234LhwDYM8plPbh4bWdAQRihicZ5XL79A6Ez52nx5r49bpJ8zKDgTXgGIUvBeGq74wqKw6DlV6Fw==@linaro.org
X-Google-Smtp-Source: AGHT+IHQTd59Mq9kwvB7mUvNPA0ajwuB4sLE6GRlBSwG83AD5UBvpy4EY4aFixtTm4b49qsT/1Lu
X-Received: by 2002:ac8:5888:0:b0:476:7eca:57e7 with SMTP id d75a77b69052e-4797755492dmr237781181cf.26.1744710894799;
        Tue, 15 Apr 2025 02:54:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744710894; cv=none;
        d=google.com; s=arc-20240605;
        b=HcyLvQ28GMVdYOEikIWLUMesVKN89o5cQXETdVPoUK3tyfSgfCxIKVzzNVVkiuA3At
         6rz6gRSxxXaXCbkiKiNyrTF6z7QU10zGqeoy2AMRQm8FkG6qqMBgLZ8RgrYnkzVVo5PN
         oDOHWHEAZH351damE+2Sl74JRtQzHbg32Jhey8sGBIW8AS58QFgy6A1pwaYPNmTHzkPn
         u+uCbpQT+1OXE8Vz2z0l9+WuX7kbJyT7RwGug7xUmwIzYy61f+a0wZycSgL4Qxva/nSU
         Li5AKLgKN3DsnEd3calKndcxXttemv2pceL28l/V7r8xPyRKP01oJLiOgnoeNsESrlnO
         knkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:message-id:date:user-agent
         :references:organization:in-reply-to:subject:cc:to:from
         :dkim-signature;
        bh=zfu+55ya+LNp+fnrMbsION4V9pzLKLFVggb5s8FgwLA=;
        fh=NYR/i0hCuykZbKQfuL9okEilyP5UINvoOTnEK6qJ6Ms=;
        b=CYTmVVfks0Xo+dRYjIxvqybrqQ3eNvzuOD/8aWiFbnLztEkD/bBoXsFYbgPMeY8cIf
         fFBrVQfY6TNHpqx3bvv6WQe1xSnal5vCrcnBWY6FFS95Pq6StZpOH3l0jf1e24xgmTkY
         kUGCxdQ3PgeIJY64Dxjw/ZCGX7a/67iikV/mx4wwu6ckw1xaH83xR1U3rrWrx0i3NWB3
         ROzg/vcvesuOBPeQTe5eVpY7Otsz78w2/nUj4MT1cxfn3Ixz+H2OGv/EjJOwFVE0IT7u
         slbz4HMFzQEsDvw+CMaRDe3ixD98DCYiBQrBEmpAwU9a5Cj63gPueCUem8B5/ObmF7hm
         BJEQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=N+Tgh7CC;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4796edbe6b7si108995341cf.233.2025.04.15.02.54.54
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 02:54:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=N+Tgh7CC;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744710894;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zfu+55ya+LNp+fnrMbsION4V9pzLKLFVggb5s8FgwLA=;
	b=N+Tgh7CCduJLWtobonyt6p18mv6mWTiJk4pC0dyY/8+DlIbVC+theIQg7WRHWgeW5Y3fak
	LwMOZb3C9u9NarALRCI9QRFevkPbNqF1BC8fvHxLy9X9nv6jUWEh63P9NPs+KKPRSaPwRH
	saniYHoJ83RNyrWIvdKLpTD8MtSdig8=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-237-3fd-xUXcMnCxHSbgIPPQqA-1; Tue,
 15 Apr 2025 05:54:51 -0400
X-MC-Unique: 3fd-xUXcMnCxHSbgIPPQqA-1
X-Mimecast-MFC-AGG-ID: 3fd-xUXcMnCxHSbgIPPQqA_1744710889
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DEC6D180035C;
	Tue, 15 Apr 2025 09:54:48 +0000 (UTC)
Received: from localhost (dhcp-192-216.str.redhat.com [10.33.192.216])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D564F19560AD;
	Tue, 15 Apr 2025 09:54:46 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 eric.auger.pro@gmail.com,
 eric.auger@redhat.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 kvmarm@lists.linux.dev, peter.maydell@linaro.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
 oliver.upton@linux.dev, sebott@redhat.com,
 shameerali.kolothum.thodi@huawei.com, armbru@redhat.com,
 berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com
Cc: agraf@csgraf.de, shahuang@redhat.com, mark.rutland@arm.com,
 pbonzini@redhat.com
Subject: Re: [PATCH v3 07/10] arm/kvm: write back modified ID regs to KVM
In-Reply-To: <5f9a4bc5-5569-437f-8e8d-f386dd51e33a@linaro.org>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20250414163849.321857-1-cohuck@redhat.com>
 <20250414163849.321857-8-cohuck@redhat.com>
 <5f9a4bc5-5569-437f-8e8d-f386dd51e33a@linaro.org>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Tue, 15 Apr 2025 11:54:44 +0200
Message-ID: <87sem9sqaj.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: yJkFZ0kckaKp

On Tue, Apr 15 2025, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:

> On 14/4/25 18:38, Cornelia Huck wrote:
>> From: Eric Auger <eric.auger@redhat.com>
>>=20
>> We want to give a chance to override the value of host ID regs.
>> In a previous patch we made sure all their values could be fetched
>> through kvm_get_one_reg() calls before their modification. After
>> their potential modification we need to make sure we write back
>> the values through kvm_set_one_reg() calls.
>>=20
>> Make sure the cpreg_list is modified with updated values and
>> transfer those values back to kvm.
>>=20
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>> ---
>>   target/arm/kvm.c        | 44 ++++++++++++++++++++++++++++++++++++++++-
>>   target/arm/trace-events |  1 +
>>   2 files changed, 44 insertions(+), 1 deletion(-)
>
>
>>   void kvm_arm_reset_vcpu(ARMCPU *cpu)
>>   {
>>       int ret;
>> @@ -2050,7 +2083,16 @@ int kvm_arch_init_vcpu(CPUState *cs)
>>       }
>>       cpu->mp_affinity =3D mpidr & ARM64_AFFINITY_MASK;
>>=20=20=20
>> -    return kvm_arm_init_cpreg_list(cpu);
>> +    ret =3D kvm_arm_init_cpreg_list(cpu);
>> +    if (ret) {
>> +        return ret;
>> +    }
>> +    /* overwrite writable ID regs with their updated property values */
>> +    kvm_arm_writable_idregs_to_cpreg_list(cpu);
>> +
>> +    write_list_to_kvmstate(cpu, 3);
>
> s/3/KVM_PUT_FULL_STATE/?

Indeed, that's more obvious. Thanks!
