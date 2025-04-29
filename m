Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp126376njm;
        Tue, 29 Apr 2025 02:31:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWu1x97N/uBqB6meam9V65wHg60JEaF8UIfz+BEGju5A1FSDW1AzsMaShhmXurQZt8ReCYjrTgr03cIQg==@linaro.org
X-Google-Smtp-Source: AGHT+IHmlHtphC6tyBHk/jfQCQeyOxpQYwZfkQx8WqPm50adybKnxBF45OSjwHPa+d4AsgA4XDft
X-Received: by 2002:a05:620a:2a04:b0:7c7:5a9f:7a90 with SMTP id af79cd13be357-7cabe5dec28mr342079585a.4.1745919082569;
        Tue, 29 Apr 2025 02:31:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745919082; cv=none;
        d=google.com; s=arc-20240605;
        b=G6MtoJBZBrl8qLXd/L1XP+KsnLGGkOeFDDrj5WeIOS/nSA0o1YYW91szS+ZH455/hd
         VKbm4/DtaGg5xZP3NKTWmXlKeb3lndDGwjWyn8Dxcelj8xlYx8zSy5QJ6uKTlC31C0jU
         d+a3CEZ1arVJtGsxqHlQTlIby4kzzja5p8VRFi/4UkCCn/47Ni2mfUDUAXz0N75SkpEU
         QEKLa3aoPGUPiXgYSvLtQW3NaLfaLiZoAwcPW1ey9ZoaHa6NYhtl/c9vQit2VIJ6jH+n
         rePgq/W1blT3I6QK6uukIwrTM66JItSxt77xecGFT2PNya//pzsbwqXTcoBLuEHMXttR
         tzFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:message-id:date:user-agent:references:organization
         :in-reply-to:subject:cc:to:from:dkim-signature;
        bh=Awc9uIR+YA34p1U+v9K0ZISzl9LL1kxrbkjQifYsg8Q=;
        fh=wcSkgx08J2c8+J/nuIxxa9nj1zB8FwiCrauqmmA5Ov4=;
        b=A9o3HgG01BstwyTFblbBP1H3eYSBmIN7RdH3UG2JTUuglwGsbfdSa7/8yGiiPygsaw
         +V2Pdbdkjo812OAi8ID1QyJPs07hbQHQfvubcG6M0Nz69UsUUlL1WjcVLyD0yFXZwOOS
         vMtx6PK7XuGM260Gnfi9oLcc21bE2ulckTQCYgvKuRXPzS4Bu10q4RXG9q3RmdSFln1m
         KyIU6sjgJhGjhY2PRJ8Q5xjHUkkEXHLZ/ewWjQalnSm1JBBTnbUHhUbYdV8d2jnIn9Va
         GnFSDbqUqDLbX6tRTFUGn5mSx+icmoRWIXlabjMLQu+yRYxVU+ZlEMQytIWHn5qXODd5
         Ee7Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iE2RUTTc;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7c958ea455bsi1176926385a.455.2025.04.29.02.31.22
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 02:31:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iE2RUTTc;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745919082;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Awc9uIR+YA34p1U+v9K0ZISzl9LL1kxrbkjQifYsg8Q=;
	b=iE2RUTTcdip/+ZpVtMdPOtiYqqSF1M3XJ+tKynTkI4xb6aRvfYEhncU1vmxN/P9VgL5eps
	B+SJGNRAsv+Cyep/N/A/mMQuta+IGljO9mqcTv5fybskk3hZsvN9yoLI5dzsv0YP9l0J5J
	d5okjwOlrKSWNBvSASBHM3Zmk35iO1w=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-601-cepCTW6KMW22o_qpF_ecqA-1; Tue,
 29 Apr 2025 05:31:17 -0400
X-MC-Unique: cepCTW6KMW22o_qpF_ecqA-1
X-Mimecast-MFC-AGG-ID: cepCTW6KMW22o_qpF_ecqA_1745919076
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2B0FF1955DCF;
	Tue, 29 Apr 2025 09:31:15 +0000 (UTC)
Received: from localhost (dhcp-192-216.str.redhat.com [10.33.192.216])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 128BB30002C3;
	Tue, 29 Apr 2025 09:31:12 +0000 (UTC)
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
Subject: Re: [PATCH for-10.1 v5 02/13] arm/cpu: Store aa64isar0/aa64zfr0
 into the idregs arrays
In-Reply-To: <470349f3-2539-4099-8958-980480459345@redhat.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20250409144304.912325-1-cohuck@redhat.com>
 <20250409144304.912325-3-cohuck@redhat.com>
 <470349f3-2539-4099-8958-980480459345@redhat.com>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Tue, 29 Apr 2025 11:31:09 +0200
Message-ID: <87o6wfqppe.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-TUID: qhwZGKgyBgqS

On Mon, Apr 28 2025, Eric Auger <eric.auger@redhat.com> wrote:

> Hi Connie,
>
> On 4/9/25 4:42 PM, Cornelia Huck wrote:
>> From: Eric Auger <eric.auger@redhat.com>
>>
>> Also add kvm add accessors for storing host features into idregs.
> nit: add kvm add?

Too much adding, will substract one add :)

>>
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

>> @@ -337,8 +361,7 @@ static bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
>>                                ARM64_SYS_REG(3, 0, 0, 5, 0));
>>          err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64dfr1,
>>                                ARM64_SYS_REG(3, 0, 0, 5, 1));
>> -        err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64isar0,
> while at it you could add use fd in this other calls instead of
> fdarray[2]. But this can be done later.

Given that this series needs a respin anyway, might as well do that.

>> -                              ARM64_SYS_REG(3, 0, 0, 6, 0));
>> +        err |= get_host_cpu_reg(fd, ahcf, ID_AA64ISAR0_EL1_IDX);
>>          err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64isar1,
>>                                ARM64_SYS_REG(3, 0, 0, 6, 1));
>>          err |= read_sys_reg64(fdarray[2], &ahcf->isar.id_aa64isar2,
