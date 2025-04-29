Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp129649njm;
        Tue, 29 Apr 2025 02:38:58 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXjw6oRM3S/8l+Fi6lvX6qs3FoRK5ZRPQyNzsauC64vfRS6Rc+EX7HjzcIJ8AH8cutg092Z9T2uf2gUew==@linaro.org
X-Google-Smtp-Source: AGHT+IEN0VszQluo6mm6wqIqVctZjYxlXdIn38bE7dEyaDsoP3r/p7hXcHsYxWAgsKRXGlNfXiJP
X-Received: by 2002:a05:6214:d4b:b0:6eb:2fd4:30a7 with SMTP id 6a1803df08f44-6f4f27a3929mr31704836d6.33.1745919538540;
        Tue, 29 Apr 2025 02:38:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745919538; cv=none;
        d=google.com; s=arc-20240605;
        b=T6MDPHEVV4/D2I0pswQNAVKvANKHYhG96t2GAdMhyw2bIZKitGERIBQeL7a6/VzXHZ
         3mmkYcqZgWywUkBumIpQbI9BpoaftuI3OQYJlrw7LpQq8ErPjlXuyhfFaLDOWHR6aqiD
         ef2+L9+2INTeueQkkm8b8HNXTn4WBBi1dPycD5mHH2uoN0AB+33DlIO/+epY9qfGOs6W
         lDkakr7/O2YqjALUvBkUQ0AOMh151GcFKeWUhevU7tJuuWWFHLRIODBIRDJoXHMbUZwm
         bpGrDOjt4r72vH/1cJruO4amUY5scUNlKgAF8yBih7en0CmkEfb+b5EpEUJSwODW7f9A
         w3nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:message-id:date:user-agent:references:organization
         :in-reply-to:subject:cc:to:from:dkim-signature;
        bh=KR1LcDvsP9uT0uOKvz6dwPjLfvp1L742V1Hmhtu47no=;
        fh=wcSkgx08J2c8+J/nuIxxa9nj1zB8FwiCrauqmmA5Ov4=;
        b=NKT3DNIWsaqHYOsfxgHMY/iNa8okGUig+cWpUekprPfGpdirtYOrYICIqJnFLmmJ+j
         hhMqdP4B147lfs8CAeU0uIzeOKYLYxrp3pG/3OYuIUqga15x7zFgYfDiOd5WO8BEvahu
         kxtQwy/SNTGME+jUnCM6xFyJGDrZ2Kp+Y5b8tfEpHJ4faXGNgjJx7i8DfOFJzy6SaF/Y
         W+mEU/F0rMcV2lgJN4+y62IXta8CGeCZrEqNh0hoykOpO4MQZz2p8BKSH2LwyVq0d5RM
         bbJIavef7oq6HHgL9d4Jwv8g7cvMALfeCBLNf/pP4BMxK8d9I4EGX6ftOk74MMuTfkns
         nYow==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VKPAI8xq;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f4c0932d60si116555826d6.133.2025.04.29.02.38.58
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 02:38:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VKPAI8xq;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745919538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KR1LcDvsP9uT0uOKvz6dwPjLfvp1L742V1Hmhtu47no=;
	b=VKPAI8xq0B/Acf7J6lcVobHsFr4OyKpreOO1IYGTHtJa+EMPrEHSmGztsF/D943+DBbmes
	cXKvSr3vfr45AuUvKaoArAzowZWMDXfRKDKiDeXWeuVy7f7M5MfCxsbF+ft37C5REaPU07
	xIXq0dvELSr98xhxY3Md2hJHvG/ZzfQ=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-691--vYir4OeNMaBV74Bv58JHw-1; Tue,
 29 Apr 2025 05:38:53 -0400
X-MC-Unique: -vYir4OeNMaBV74Bv58JHw-1
X-Mimecast-MFC-AGG-ID: -vYir4OeNMaBV74Bv58JHw_1745919531
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EE9D41800368;
	Tue, 29 Apr 2025 09:38:50 +0000 (UTC)
Received: from localhost (dhcp-192-216.str.redhat.com [10.33.192.216])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B73371800D97;
	Tue, 29 Apr 2025 09:38:49 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: eric.auger@redhat.com, eric.auger.pro@gmail.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, kvmarm@lists.linux.dev, peter.maydell@linaro.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
 oliver.upton@linux.dev, sebott@redhat.com,
 shameerali.kolothum.thodi@huawei.com, armbru@redhat.com,
 berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com,
 agraf@csgraf.de
Cc: shahuang@redhat.com, mark.rutland@arm.com, philmd@linaro.org,
 pbonzini@redhat.com
Subject: Re: [PATCH for-10.1 v5 04/13] arm/cpu: Store aa64pfr0/1 into the
 idregs array
In-Reply-To: <07b785e0-431d-40ba-ab04-56336fdac483@redhat.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20250409144304.912325-1-cohuck@redhat.com>
 <20250409144304.912325-5-cohuck@redhat.com>
 <07b785e0-431d-40ba-ab04-56336fdac483@redhat.com>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Tue, 29 Apr 2025 11:38:47 +0200
Message-ID: <87ldrjqpco.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-TUID: rYYiMXKJ1atc

On Mon, Apr 28 2025, Eric Auger <eric.auger@redhat.com> wrote:

> On 4/9/25 4:42 PM, Cornelia Huck wrote:
>> From: Eric Auger <eric.auger@redhat.com>
>>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> Reviewed-by: Sebastian Ott <sebott@redhat.com>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>> ---
>>  target/arm/cpu-features.h | 40 ++++++++++++++++-----------------
>>  target/arm/cpu.c          | 29 ++++++++----------------
>>  target/arm/cpu.h          |  2 --
>>  target/arm/cpu64.c        | 14 ++++--------
>>  target/arm/helper.c       |  6 ++---
>>  target/arm/hvf/hvf.c      |  9 ++++----
>>  target/arm/kvm.c          | 24 +++++++++-----------
>>  target/arm/tcg/cpu64.c    | 47 ++++++++++++++++++---------------------
>>  8 files changed, 73 insertions(+), 98 deletions(-)

>> @@ -380,10 +378,8 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>>           * than skipping the reads and leaving 0, as we must avoid
>>           * considering the values in every case.
>>           */
>> -        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_pfr0,
>> -                              ARM64_SYS_REG(3, 0, 0, 1, 0));
>> -        err |= read_sys_reg32(fdarray[2], &ahcf->isar.id_pfr1,
>> -                              ARM64_SYS_REG(3, 0, 0, 1, 1));
>> +        err |= get_host_cpu_reg(fd, ahcf, ID_AA64PFR0_EL1_IDX);
> Hum I think we have a conversion mistake here:
>
> +DEF(ID_PFR0_EL1, 3, 0, 0, 1, 0)
> +DEF(ID_PFR1_EL1, 3, 0, 0, 1, 1)

Indeed, wrong regs. Will fix.
