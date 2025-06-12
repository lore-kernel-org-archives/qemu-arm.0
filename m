Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp2432156njc;
        Thu, 12 Jun 2025 08:36:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVljQ6n5qeVAqFiu1BeLhu18MkqiiDBzHrZ1oB3CYNq7Lv6nPUD1LjsUj1A/+W2E4+s18e/YY8JFaV1yQ==@linaro.org
X-Google-Smtp-Source: AGHT+IF41I2uys2N8KGOCtSXhfTeFPexJ8eOfAOi03xlUx0tEqxstfJwpWJsyseWUfAkrasvFPqa
X-Received: by 2002:a05:622a:18a2:b0:4a7:24bd:aa70 with SMTP id d75a77b69052e-4a724bdab17mr45688371cf.36.1749742588974;
        Thu, 12 Jun 2025 08:36:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749742588; cv=none;
        d=google.com; s=arc-20240605;
        b=TdZA9KFfduIIYGHnOrSwkQ6L8T7Yvd0G32gIIgGIPjsQKpHsNTuO5g3Nt2Dbbx0owL
         AMyiN++m2CpcvcLRMWJ+ABO1ZtBE7+cgtDIG0l95nmgDt/wDu8KmLe7p8shJOQpo/dFG
         CJzahe+GccQFmIp/Ez6eE21BgEfxDB3CGXVBChUxnOfTpxNZlD/i2ZKAz2CjS9rDjv5R
         j3GEVyyRgvxoqoeaTJ51o29rytPCI7vfceMhHP1Mtt4RzRKeaed+t8TPTRIduRPDrU6q
         qXSd0N3QKcssf/J5AG43vJG5GyUa8NjU5H64CW1ySACYDzyAy9JEVuJu7lulAvi5LzWk
         UUTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:message-id:date:user-agent:references:organization
         :in-reply-to:subject:cc:to:from:dkim-signature;
        bh=aN7OZ8GnoaJUynVwVsXnb6hzJQk2C53xbbNuavIdXdE=;
        fh=3AH/4enSkYH+0gdMWbJY9r7skS1O9K2SeH+yRsCcYPI=;
        b=XJYzpaxxpHZx9paQgJltOMzk7SBhcu4lDwGgRbUt632cHAgRkxkAA3jHkPz1ecQ0DS
         qf4SbyEreDx2h8UrdPLlIhHMs98w6lCJtbWbZcGaCLT+SSvpB6aZJRu3ZbYP2YAd6Aeu
         K4vuC//i+JDKhvjoRnWCYCNzdRSj3l/41IIkoiaKyMPf1Lc7QjfeBuxOthciJckleEum
         kjR2XbsaPZNw4ZiUYUejz5EcfsS8O/gFC2P1CYGga+IC3mfhhfZwGLWOubMasLbEKJCb
         R/SwIVkNlIlmuf6nE3/qYPL/jiCwfsRow3F87imZzP+vkVMNetFzrO0C6YJTzIRx2GKs
         qPBQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ID4sIDpZ;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4a72a2b9a5bsi9823411cf.110.2025.06.12.08.36.28
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 08:36:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ID4sIDpZ;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749742588;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aN7OZ8GnoaJUynVwVsXnb6hzJQk2C53xbbNuavIdXdE=;
	b=ID4sIDpZoZaSgwX8tbVUe8SYR7U+cLZTJyNP6e3A0IwnJoQiyTrcYZU/X6XhaHtMlFLivS
	UsRXg9+7aU2vutwRfkoAYJ5OFx+KeLiz30EyVD6iYv12Re+fAlvwVZcU+8Iynnh9m36QmK
	uHJxPj0iZLlo8+KuIdmGjUCbC9/vBcg=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-692-YKlXxlMZPkW2jWRmhKvNrA-1; Thu,
 12 Jun 2025 11:36:23 -0400
X-MC-Unique: YKlXxlMZPkW2jWRmhKvNrA-1
X-Mimecast-MFC-AGG-ID: YKlXxlMZPkW2jWRmhKvNrA_1749742581
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B1DFD18011CD;
	Thu, 12 Jun 2025 15:36:20 +0000 (UTC)
Received: from localhost (unknown [10.45.224.54])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D06E230044CC;
	Thu, 12 Jun 2025 15:36:18 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, kvmarm@lists.linux.dev, richard.henderson@linaro.org,
 alex.bennee@linaro.org, maz@kernel.org, oliver.upton@linux.dev,
 sebott@redhat.com, shameerali.kolothum.thodi@huawei.com,
 armbru@redhat.com, berrange@redhat.com, abologna@redhat.com,
 jdenemar@redhat.com, agraf@csgraf.de, shahuang@redhat.com,
 mark.rutland@arm.com, philmd@linaro.org, pbonzini@redhat.com
Subject: Re: [PATCH v7 08/14] arm/cpu: Store id_isar0-7 into the idregs array
In-Reply-To: <CAFEAcA-c=EaE-Y4DMVz_meVd2cbxuCyFGFOXET-COOgMWHXWWA@mail.gmail.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Avril Crosse O'Flaherty"
References: <20250515153907.151174-1-cohuck@redhat.com>
 <20250515153907.151174-9-cohuck@redhat.com>
 <CAFEAcA-c=EaE-Y4DMVz_meVd2cbxuCyFGFOXET-COOgMWHXWWA@mail.gmail.com>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Thu, 12 Jun 2025 17:36:16 +0200
Message-ID: <87a56d9dlb.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-TUID: iEa/xzWxJLF4

On Thu, Jun 12 2025, Peter Maydell <peter.maydell@linaro.org> wrote:

> On Thu, 15 May 2025 at 16:40, Cornelia Huck <cohuck@redhat.com> wrote:
>>
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
>
> This doesn't compile:
>
> ../../target/arm/tcg/cpu-v7m.c:70:5: error: incompatible pointer types
> initializing 'ARMISARe
> gisters *' (aka 'struct ARMISARegisters *') with an expression of type
> 'uint64_t *' (aka 'unsigned long *')
> [-Werror,-Wincompatible-pointer-types]
>    70 |     SET_IDREG(idregs, ID_ISAR0, 0x01141110);
>       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../../target/arm/cpu.h:875:26: note: expanded from macro 'SET_IDREG'
>   875 |         ARMISARegisters *i_ = (ISAR);
>          \
>       |                          ^    ~~~~~~
> ../../target/arm/tcg/cpu-v7m.c:71:5: error: incompatible pointer types
> initializing 'ARMISARegisters *' (aka 'struct ARMISARegisters *') with
> an expression of type 'uint64_t *' (aka 'unsigned long *')
> [-Werror,-Wincompatible-pointer-types]
>    71 |     SET_IDREG(idregs, ID_ISAR1, 0x02111000);
>       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> ../../target/arm/cpu.h:875:26: note: expanded from macro 'SET_IDREG'
>   875 |         ARMISARegisters *i_ = (ISAR);
>          \
>       |                          ^    ~~~~~~
>
> (and more similar errors until the compiler gives up).

What configs/compiler are you using? I obviously would have fixed that
if I had hit it...
