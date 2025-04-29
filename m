Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp133294njm;
        Tue, 29 Apr 2025 02:48:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVKjQs7Ob6h5fm4Ih2+Ewob7odFyToWaxwRhBGDL4EF4GEXhE3NQtFoSwExTgB2LwFmQ+LbHrvh8MdQiw==@linaro.org
X-Google-Smtp-Source: AGHT+IEFXDfz/kg5A3BLbP+1QaZ4u+P9u5gFDQR50zj6p6kPYqcyU+gKurgd/LIvFjw4Atk21s+H
X-Received: by 2002:a05:620a:4506:b0:7c7:a5f5:5616 with SMTP id af79cd13be357-7c9668c21bamr2107306785a.42.1745920098088;
        Tue, 29 Apr 2025 02:48:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745920098; cv=none;
        d=google.com; s=arc-20240605;
        b=ZgBS4QPAs+X4P3oeqJRlZGJkyIkExpQJGLj4pUlkTUw3OZgQ7kRKKn0veuZIBf+/z7
         ovuwRbVY/Eg6CGkJftUjnA0GDbfaOihT7xbvtacd3pmgdNphcX/9G4A1Ma8hCbSlUZJc
         08sGBWmS2S3EBQe+jJGDIkUzBWc3VL9yq82yXENGdhVk5bPVhQikn5L3EoYOmybmygwB
         WnG/arbMvxfHaddlG09I4/Cutp/Dgw5t9dImHhFgg4V8rBAXyGI4MEMazj3cCD5X60qs
         8378SouDTDvOtGGfIxOQS0XYol21RUY0vJvj2oF1FzreaLVbcHHYXQpRpAab+Wa5V8qY
         2SrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:message-id:date:user-agent:references:organization
         :in-reply-to:subject:cc:to:from:dkim-signature;
        bh=uAzYfmEA4ZlzMGzQV5ZXsXVfrmBmz8sqT7sNKurT35g=;
        fh=wcSkgx08J2c8+J/nuIxxa9nj1zB8FwiCrauqmmA5Ov4=;
        b=H4lOdx8pO82GIQ9GxRBZVGT64vAtGZE+/n6eXL8DU2fikB3f2ngtyrEmiCxWSH/Ez0
         oicwhN1P7sIvlNJ2o3Nq0gZHHNopq5NHBEeXtzDoj0SlVNKIDXkXHip7nk/cpl61El7s
         SRwgzMmV3+xm3qK3GOcwRdDFRCGG+8EW/8u47gtvVD7x0MJxzOvnv0zWJuBoThCYkvP3
         92CIsikogJ1PeHJz4szUOjzkjuwPcddpc57sgRHInenT43meSh3L/H1KisOXNVmHR92G
         mQLeLWoT30EIUgZwIF2gabimWJOmJdg1Gyr7ZAllVZYsNGsZ4pgENSdSuS/OWhvA+Iq3
         xPDQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hzkThwcY;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7c958d87479si1133194085a.245.2025.04.29.02.48.17
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 02:48:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hzkThwcY;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745920097;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uAzYfmEA4ZlzMGzQV5ZXsXVfrmBmz8sqT7sNKurT35g=;
	b=hzkThwcYQVlsO3lFCuEibH0nkOUoFxub03ac/JCP9WchVNh1HY2eyWGdaP1sHHgWxt/l4v
	/0aDNVJb0PfoT/SAAhiWDolN2wsLktT2oCw3BNB1kR8VFI9qmWnDYO0tR1xY5TESo8abmv
	9OkxyQ6AcYRUQ3omRYCbvUyzu8Dc2+4=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-82-3twGYU2DOAuXCRt-6zbOow-1; Tue,
 29 Apr 2025 05:48:16 -0400
X-MC-Unique: 3twGYU2DOAuXCRt-6zbOow-1
X-Mimecast-MFC-AGG-ID: 3twGYU2DOAuXCRt-6zbOow_1745920094
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0D4581800876;
	Tue, 29 Apr 2025 09:48:13 +0000 (UTC)
Received: from localhost (dhcp-192-216.str.redhat.com [10.33.192.216])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 606EF1956094;
	Tue, 29 Apr 2025 09:48:10 +0000 (UTC)
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
Subject: Re: [PATCH for-10.1 v5 06/13] arm/cpu: Store aa64dfr0/1 into the
 idregs array
In-Reply-To: <c150cb74-d11a-4090-90fa-0405a488c471@redhat.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20250409144304.912325-1-cohuck@redhat.com>
 <20250409144304.912325-7-cohuck@redhat.com>
 <c150cb74-d11a-4090-90fa-0405a488c471@redhat.com>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Tue, 29 Apr 2025 11:48:08 +0200
Message-ID: <87ikmnqox3.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-TUID: DkVuUHvEhFqb

On Mon, Apr 28 2025, Eric Auger <eric.auger@redhat.com> wrote:

> On 4/9/25 4:42 PM, Cornelia Huck wrote:
>> From: Eric Auger <eric.auger@redhat.com>
>>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> Reviewed-by: Sebastian Ott <sebott@redhat.com>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>> ---
>>  target/arm/cpu-features.h | 16 ++++++++--------
>>  target/arm/cpu.c          | 15 +++++----------
>>  target/arm/cpu.h          |  2 --
>>  target/arm/cpu64.c        |  4 ++--
>>  target/arm/helper.c       |  4 ++--
>>  target/arm/hvf/hvf.c      |  4 ++--
>>  target/arm/internals.h    |  6 +++---
>>  target/arm/kvm.c          | 12 +++++-------
>>  target/arm/tcg/cpu64.c    | 33 +++++++++++++++++----------------
>>  9 files changed, 44 insertions(+), 52 deletions(-)

>> @@ -925,8 +925,9 @@ static void aarch64_a710_initfn(Object *obj)
>>      SET_IDREG(isar, ID_AA64PFR0, 0x1201111120111112ull); /* GIC filled in later */
>>      SET_IDREG(isar, ID_AA64PFR1, 0x0000000000000221ull);
>>      SET_IDREG(isar, ID_AA64ZFR0, 0x0000110100110021ull); /* with Crypto */
>> -    cpu->isar.id_aa64dfr0  = 0x000011f010305619ull;
>> -    cpu->isar.id_aa64dfr1  = 0;
>> +    SET_IDREG(isar, ID_AA64DFR0, 0x000011f010305619ull);
>> +    SET_IDREG(isar, ID_AA64DFR0, 0x000011f010305619ull);
> this line is doubled.

Indeed, fixing.
