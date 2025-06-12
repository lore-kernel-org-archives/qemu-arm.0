Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp2439268njc;
        Thu, 12 Jun 2025 08:53:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVm6jdG3r29aOoniI7+EJOyQeo5U/BjG2crKj0q9OZ20wXF6kC/5uwJVRdGLyzT0s+D4au2BIDacNkEQw==@linaro.org
X-Google-Smtp-Source: AGHT+IEwASiSaRfp9acVwM9fcTdVlmOtn+MPCQvkjCtyQRT2ecnaUml+rWHLffUUjZL6jDCAUnqR
X-Received: by 2002:a05:622a:1b15:b0:4a6:f9e1:a840 with SMTP id d75a77b69052e-4a722914855mr70630351cf.1.1749743598998;
        Thu, 12 Jun 2025 08:53:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749743598; cv=none;
        d=google.com; s=arc-20240605;
        b=W3mQlcBixwMzYawA5TynuLmBc8IgC6L/NFVz+yciODpIrCSTs8xr1qOBTt2WdmTSEQ
         W58zSq38eG76ZYKjXqxSwSyIp2g14a51Ucpd9ScCravqmgL4YDuVw5BbH9fQ7hu7ayEP
         Z7xvM0Tl+ilJi8u+tqxZ0UVt/AKBRfMtUydCewU2t+cjF2IFGrH0CuCJ5kgp6Ph3pXjP
         vDm5D6pu60uFrFxy+ZMtBXP5kAQTo42PN5969kybi2UMibDKStuRkSuFO3gVqSx+hG7X
         //gUGaFrUo67tLGsIkwOMcBCOEaYnI1Qy84k2DBkufXV1PxozPO5tNbVp75xDWJ/D/db
         C6jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:message-id:date:user-agent:references:organization
         :in-reply-to:subject:cc:to:from:dkim-signature;
        bh=mUI+8vjhhSyqNoE3QrTGQqAzBmNIFi2uvoVlnXIO0eY=;
        fh=3AH/4enSkYH+0gdMWbJY9r7skS1O9K2SeH+yRsCcYPI=;
        b=TJo2Xaa0V2PfNGq0JxeAWOOUHLLmRvPenXliWZIaiHNx+UUD0TTzSzi7eWv45Q2i/f
         rgiCHixbsxdoNXR5pdlItxy8MkBfmy/OAD6yJg/bvldPeC2MuMzd23bbdK45bRTwU9JP
         w/aDzE3+McoUqG+iEceo12XWGxV02+cQ0B2QTLS7DC//hQtpDALbGYsUvrwMXoKoOYtI
         wVnQaPhAR216aOn08ZDgNZvj9Yogmz4/CfHIpupy3myMiR90Sb4TCbY7KiRlZcF+MoQe
         8KnjlUU25gq5Y11/pq3ASqLXkRlGkCtsPW+gUwhyDFFJHaUaph6Lh5EgVhjYqpffaAd6
         ttDw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SnSWtPvA;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4a72a47d8afsi9090421cf.286.2025.06.12.08.53.18
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 08:53:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SnSWtPvA;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749743598;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mUI+8vjhhSyqNoE3QrTGQqAzBmNIFi2uvoVlnXIO0eY=;
	b=SnSWtPvAtdkpD1TDdcyn7ofhWcTK++7YgzFNpIXdm0M1YpqKnxlxfVha1EJyYc8H8DXUlG
	sl4MibHhN4D3Yi5A3xpN9mcVJRDTlrJajx3KYeveISAQeBmscmSthG54j/dELVBx1b8FlG
	iZZycncfTjH2UHWR4AHpCJqtta7tZnI=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-528-5BU_AqztPBOJLHDrdiDD7Q-1; Thu,
 12 Jun 2025 11:53:15 -0400
X-MC-Unique: 5BU_AqztPBOJLHDrdiDD7Q-1
X-Mimecast-MFC-AGG-ID: 5BU_AqztPBOJLHDrdiDD7Q_1749743593
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B97CF1956089;
	Thu, 12 Jun 2025 15:53:12 +0000 (UTC)
Received: from localhost (unknown [10.45.224.54])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7EAD118003FC;
	Thu, 12 Jun 2025 15:53:10 +0000 (UTC)
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
In-Reply-To: <CAFEAcA-rYNaaZ3LFFkhek0duptPeMXUBbPbBnWa7teNPM+c6ug@mail.gmail.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Avril Crosse O'Flaherty"
References: <20250515153907.151174-1-cohuck@redhat.com>
 <20250515153907.151174-9-cohuck@redhat.com>
 <CAFEAcA-c=EaE-Y4DMVz_meVd2cbxuCyFGFOXET-COOgMWHXWWA@mail.gmail.com>
 <87a56d9dlb.fsf@redhat.com>
 <CAFEAcA-rYNaaZ3LFFkhek0duptPeMXUBbPbBnWa7teNPM+c6ug@mail.gmail.com>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Thu, 12 Jun 2025 17:53:07 +0200
Message-ID: <874iwl9ct8.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-TUID: 2SMcci5SEDVh

On Thu, Jun 12 2025, Peter Maydell <peter.maydell@linaro.org> wrote:

> On Thu, 12 Jun 2025 at 16:36, Cornelia Huck <cohuck@redhat.com> wrote:
>>
>> On Thu, Jun 12 2025, Peter Maydell <peter.maydell@linaro.org> wrote:
>>
>> > On Thu, 15 May 2025 at 16:40, Cornelia Huck <cohuck@redhat.com> wrote:
>> >>
>> >> From: Eric Auger <eric.auger@redhat.com>
>> >>
>> >> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> >> Reviewed-by: Sebastian Ott <sebott@redhat.com>
>> >> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> >> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>> >> ---
>> >>  hw/intc/armv7m_nvic.c     |  12 ++--
>> >>  target/arm/cpu-features.h |  36 +++++-----
>> >>  target/arm/cpu.c          |  24 +++----
>> >>  target/arm/cpu.h          |   7 --
>> >>  target/arm/cpu64.c        |  28 ++++----
>> >>  target/arm/helper.c       |  14 ++--
>> >>  target/arm/kvm.c          |  21 ++----
>> >>  target/arm/tcg/cpu-v7m.c  |  90 +++++++++++++-----------
>> >>  target/arm/tcg/cpu32.c    | 144 +++++++++++++++++++++-----------------
>> >>  target/arm/tcg/cpu64.c    | 108 ++++++++++++++--------------
>> >>  10 files changed, 243 insertions(+), 241 deletions(-)
>> >
>> > This doesn't compile:
>> >
>> > ../../target/arm/tcg/cpu-v7m.c:70:5: error: incompatible pointer types
>> > initializing 'ARMISARe
>> > gisters *' (aka 'struct ARMISARegisters *') with an expression of type
>> > 'uint64_t *' (aka 'unsigned long *')
>> > [-Werror,-Wincompatible-pointer-types]
>> >    70 |     SET_IDREG(idregs, ID_ISAR0, 0x01141110);
>> >       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> > ../../target/arm/cpu.h:875:26: note: expanded from macro 'SET_IDREG'
>> >   875 |         ARMISARegisters *i_ = (ISAR);
>> >          \
>> >       |                          ^    ~~~~~~
>> > ../../target/arm/tcg/cpu-v7m.c:71:5: error: incompatible pointer types
>> > initializing 'ARMISARegisters *' (aka 'struct ARMISARegisters *') with
>> > an expression of type 'uint64_t *' (aka 'unsigned long *')
>> > [-Werror,-Wincompatible-pointer-types]
>> >    71 |     SET_IDREG(idregs, ID_ISAR1, 0x02111000);
>> >       |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> > ../../target/arm/cpu.h:875:26: note: expanded from macro 'SET_IDREG'
>> >   875 |         ARMISARegisters *i_ = (ISAR);
>> >          \
>> >       |                          ^    ~~~~~~
>> >
>> > (and more similar errors until the compiler gives up).
>>
>> What configs/compiler are you using? I obviously would have fixed that
>> if I had hit it...
>
> This is clang 18.1.3 (1ubuntu1) on x86-64 Linux, configured with
>
> '../../configure' '--cc=clang' '--cxx=clang++' '--enable-ubsan'
> '--target-list=arm-softmmu,arm-linux-user,aarch64-softmmu,aarch64-linux-user'
>
> Whatever the problem is, it goes away on a later patch, so probably
> it's just that some fragment in a later patch needs to move into
> this one.

Ok, I should do more automated builds after every patch, because I
forget to do that too often. (I usually build with gcc.)
