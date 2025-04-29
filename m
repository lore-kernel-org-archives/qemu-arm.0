Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp134602njm;
        Tue, 29 Apr 2025 02:51:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWTnjhCp5vuYtvwBwwECt8oNR5WNlCdnnk9AuYYf+ItrzLdDPSzewoh2oAeqI1zknL7K3x8ZJPTykRscQ==@linaro.org
X-Google-Smtp-Source: AGHT+IExS24tKhTjzi/RH71Y7KDOMg41LYcMP8fs3nbxApT8Mdu1UYjcKWO2KvIKhAoljidWsNaB
X-Received: by 2002:a05:6214:2461:b0:6ea:d033:2853 with SMTP id 6a1803df08f44-6f4f058725cmr50332276d6.16.1745920300478;
        Tue, 29 Apr 2025 02:51:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745920300; cv=none;
        d=google.com; s=arc-20240605;
        b=GOmMnEQdsWrNBJwjBQBntHFwUX6ukTei06cPOAW7ejiNc3Dy/7Pc7bbjTmyKXgf72B
         SXh8eJJikB0eZ5Y0fwpHhApQg96PyogsZ27B84A8jKI7p8eDtbcXuekXSIwU8w3Yax0Q
         B0/pOdxHoSRPfz2O2F5BnLpAolq3g2SfnJYyFxuzGWr/bI36hf1riQHauT9UDL1mY7wE
         kHIKo0nK4dY27qHUYpPSWy0qT7kwri+CkHRXL+yaa1Bfc5zsH4khhUNL+q+/Ux7UIRVz
         VPTOlxsBaqY8p5ej4bdL4ARlY0+nQkZEwg5pwrBe/uMBBqIrTlWJuzp3A9rclLqzUo2L
         5kmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:message-id:date:user-agent:references:organization
         :in-reply-to:subject:cc:to:from:dkim-signature;
        bh=Y+8GuoJpXHY67E9m4XDNSYfnUTPZKJt4wgqR5NSW8jI=;
        fh=wcSkgx08J2c8+J/nuIxxa9nj1zB8FwiCrauqmmA5Ov4=;
        b=KnCKwlsswauQznUeg/bvydLzjVX5iYosTRXrP1ojb36TEF/Uiisx6e1p86HvAx6oLJ
         Si7lym2hjyxrb+pSnQWA8RT5mMCd9hK8L2NVqug8X3oTqnMLpp43D2RPKDmBAsMY8p4w
         YAz1irm6xN+L4f3QNCDVwv/u1W7Se/Z/SFY5y8bvqBCDqeyFo3CpzVuFXgpPdiD9JtHv
         v+lTxXEJEknhgoBfnBdTkl4gBb7CC4p/Y/Ys1Lex2ParME0Q40IbrSUfI25+lCi7jCUJ
         USBmIiq7OqWqrJjE9ojbR6SFhFb8upfwNBZCv/wj2GvjgAV8yeK/VQYtFuH+lbOsZlpx
         su6w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LfzKTD0A;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f4e120ba54si46445746d6.438.2025.04.29.02.51.40
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 02:51:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LfzKTD0A;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745920300;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Y+8GuoJpXHY67E9m4XDNSYfnUTPZKJt4wgqR5NSW8jI=;
	b=LfzKTD0AHyFy7CRPUTEi3q4cyXl8JznxZ9Z1GAeG86rMJDljodSZoFJdkOfrL4gah6Vii/
	KKXRe/jLNwLLScb95GSarwN3ZKqDJ9YW4aRpoHFZE8eDIiyrTSkjyHvEK1g/fWd/9NCDVE
	onmBArRlSiWhG/hreZDzGSOTFUOfZhQ=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-328-om2IXWQ8MdK3-8e0j9SxtQ-1; Tue,
 29 Apr 2025 05:51:33 -0400
X-MC-Unique: om2IXWQ8MdK3-8e0j9SxtQ-1
X-Mimecast-MFC-AGG-ID: om2IXWQ8MdK3-8e0j9SxtQ_1745920291
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 1C0081800360;
	Tue, 29 Apr 2025 09:51:30 +0000 (UTC)
Received: from localhost (dhcp-192-216.str.redhat.com [10.33.192.216])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5CD6C195608D;
	Tue, 29 Apr 2025 09:51:27 +0000 (UTC)
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
Subject: Re: [PATCH for-10.1 v5 08/13] arm/cpu: Store id_isar0-7 into the
 idregs array
In-Reply-To: <7424a39c-9bde-452e-99d5-a18bd9a432aa@redhat.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20250409144304.912325-1-cohuck@redhat.com>
 <20250409144304.912325-9-cohuck@redhat.com>
 <7424a39c-9bde-452e-99d5-a18bd9a432aa@redhat.com>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Tue, 29 Apr 2025 11:51:25 +0200
Message-ID: <87frhrqorm.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-TUID: wR0HGyYBCeB0

On Mon, Apr 28 2025, Eric Auger <eric.auger@redhat.com> wrote:

> On 4/9/25 4:42 PM, Cornelia Huck wrote:
>> From: Eric Auger <eric.auger@redhat.com>
>>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> Reviewed-by: Sebastian Ott <sebott@redhat.com>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>> ---
>>  hw/intc/armv7m_nvic.c     |  12 ++--
>>  target/arm/cpu-features.h |  36 +++++-----
>>  target/arm/cpu.c          |  24 +++----
>>  target/arm/cpu.h          |   7 --
>>  target/arm/cpu64.c        |  28 ++++----
>>  target/arm/helper.c       |  14 ++--
>>  target/arm/kvm.c          |  21 ++----
>>  target/arm/tcg/cpu-v7m.c  |  90 +++++++++++++-----------
>>  target/arm/tcg/cpu32.c    | 144 +++++++++++++++++++++-----------------
>>  target/arm/tcg/cpu64.c    | 108 ++++++++++++++--------------
>>  10 files changed, 243 insertions(+), 241 deletions(-)

>> @@ -599,13 +609,13 @@ static void cortex_r5_initfn(Object *obj)
>>      cpu->isar.id_mmfr1 = 0x00000000;
>>      cpu->isar.id_mmfr2 = 0x01200000;
>>      cpu->isar.id_mmfr3 = 0x0211;
>> -    cpu->isar.id_isar0 = 0x02101111;
>> -    cpu->isar.id_isar1 = 0x13112111;
>> -    cpu->isar.id_isar2 = 0x21232141;
>> -    cpu->isar.id_isar3 = 0x01112131;
>> -    cpu->isar.id_isar4 = 0x0010142;
>> -    cpu->isar.id_isar5 = 0x0;
>> -    cpu->isar.id_isar6 = 0x0;
>> +    SET_IDREG(isar, ID_ISAR0, 0x02101111);
>> +    SET_IDREG(isar, ID_ISAR1, 0x13112111);
>> +    SET_IDREG(isar, ID_ISAR2, 0x21232141);
>> +    SET_IDREG(isar, ID_ISAR3, 0x01112131);
>> +    SET_IDREG(isar, ID_ISAR4, 0x0010142);
>> +    SET_IDREG(isar, ID_ISAR5, 0x21232141);
> glurp this one is bad
> it should be SET_IDREG(isar, ID_ISAR5, 0x0);

Huh, no idea where that came from. Fixing.
