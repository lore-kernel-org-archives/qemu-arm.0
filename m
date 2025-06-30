Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp2569606dye;
        Mon, 30 Jun 2025 09:03:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX5bVuQF1R5HVkZWGBCiA40vuFxHPi9gM47My3PtRnwwlcqbwVMaNj8evgv8NH27bCjU76RPoFYstgTHA==@linaro.org
X-Google-Smtp-Source: AGHT+IFq2yOzspUqBsNZjV+1YPxNCyUEsE3fmsWPQ7awJJ2SRYXP5vf+cfKLb9RV8WSdG22fPK/I
X-Received: by 2002:a05:620a:4103:b0:7d4:6672:5020 with SMTP id af79cd13be357-7d46672512amr30563785a.51.1751299390569;
        Mon, 30 Jun 2025 09:03:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751299390; cv=none;
        d=google.com; s=arc-20240605;
        b=bGJDSYihwFILRn/kY72tQHXrFUleBjI004kHK4RqHaOdY5zQ4Zpay2WRBM/X4ovzUv
         ajLrzZ3a8OCHBzWLMr9bkk0XW97iT1JbRfkQvIOzGg5FE2WodglXM4expgmIes+qMwHl
         bBYGdi8wOLO/hftBMUWt3aaOWsY9jC1giTOpKUALrPW3TzR2xvPaBY/XD42PvyRzwJKx
         cXUn4dd8Nt5C/c94aYYlag/fdiAmvwjMo/1DDAO8+kgZxY9ttQGKknHmALUdLdqzeNVx
         WbCf5e3bhDFn83/P+on9wVdlOLZ/KsMTkg4h4HWvzKbkSNj+EmGmJDpf2NVwuQcqfEET
         /2CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:message-id:date:user-agent:references:organization
         :in-reply-to:subject:cc:to:from:dkim-signature;
        bh=RWPcrPt/aVAFUlzQoNuvD3ku+IQ0fPMZyUJg1YgZvTI=;
        fh=3AH/4enSkYH+0gdMWbJY9r7skS1O9K2SeH+yRsCcYPI=;
        b=AFDcq0uKJHogVsoj3cEMfipJMKYUprqp2JCi4qRbD7E0V/XMOT4XcP9f+SW9fcsYsy
         /49NbxohEE9ZxVDsRmormnCIbd0WA98SaSIM1PYrbTqurYK5pIVFUkgPb6b+ZDjd9/Fw
         9FtUmHuqyxAIqvyaLYbcvaxxDWcUMnsmoosIiOz8FzN9jCCuV34AVsXUhpQcUibxt6hN
         zg3w8BhLrITK03yxunOJEqvh6O3JeDfn+vGYOrLAYmOHvCl/cQb3v6L+W9bfkNsU/JOJ
         1PsdJqLnUiLoladpw9h6npd/vR5fKk+jiPdrUo36/vBFl3/N8K5gn2Ji3lybmZ4+COXp
         srGg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bf7UAhrr;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7d443192410si806491785a.65.2025.06.30.09.03.10
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 09:03:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bf7UAhrr;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751299390;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RWPcrPt/aVAFUlzQoNuvD3ku+IQ0fPMZyUJg1YgZvTI=;
	b=bf7UAhrrHVsBOwbOygQ+iM6VenSZ5qAC6/J5PvEvLg6kAy297xEWuYdQm6V48ovssl0uUi
	NecNzqK4x6EqB/D6KgystJqUqRMiSfN4FlJCqlEdxWd0Lyhbr8GP9foCvYD+EaO5UcEYpl
	LHm2YBLmpsXNdsAFJ9brPKHBuZkdKiE=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-524-UOq3GucnMda1Cp-TsFcSTg-1; Mon,
 30 Jun 2025 12:03:06 -0400
X-MC-Unique: UOq3GucnMda1Cp-TsFcSTg-1
X-Mimecast-MFC-AGG-ID: UOq3GucnMda1Cp-TsFcSTg_1751299384
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CA22218089B4;
	Mon, 30 Jun 2025 16:03:03 +0000 (UTC)
Received: from localhost (dhcp-192-236.str.redhat.com [10.33.192.236])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 009DD195609D;
	Mon, 30 Jun 2025 16:03:01 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, kvmarm@lists.linux.dev, richard.henderson@linaro.org,
 alex.bennee@linaro.org, maz@kernel.org, oliver.upton@linux.dev,
 sebott@redhat.com, shameerali.kolothum.thodi@huawei.com,
 armbru@redhat.com, berrange@redhat.com, abologna@redhat.com,
 jdenemar@redhat.com, agraf@csgraf.de, shahuang@redhat.com,
 mark.rutland@arm.com, philmd@linaro.org, pbonzini@redhat.com
Subject: Re: [PATCH v8 00/14] arm: rework id register storage
In-Reply-To: <CAFEAcA-Zuqzqg_qUQh+yT4BGqEke3=OhSr0iSY1ztPtVV506sw@mail.gmail.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Avril Crosse O'Flaherty"
References: <20250617153931.1330449-1-cohuck@redhat.com>
 <CAFEAcA-Zuqzqg_qUQh+yT4BGqEke3=OhSr0iSY1ztPtVV506sw@mail.gmail.com>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Mon, 30 Jun 2025 18:02:59 +0200
Message-ID: <87ecv1qkss.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-TUID: GBOX+37qHA3a

On Mon, Jun 30 2025, Peter Maydell <peter.maydell@linaro.org> wrote:

> On Tue, 17 Jun 2025 at 16:39, Cornelia Huck <cohuck@redhat.com> wrote:
>>
>> Mostly addressed Peter's feedback:
>> - make sure every inbetween stage compiles (also fixed some bonus issues)
>> - try to make the scripts more robust, add a note the generated file,
>>   and make sure to grab only registers we actually want
>>   - I did a half-hearted attempt to use python instead of awk, but I'm
>>     out of my depth, especially with the script that will be used for
>>     the register fields in the cpu models series
>>
>> Also available at
>> https://gitlab.com/cohuck/qemu/-/commits/arm-rework-idreg-storage-v8
>
> The script seems to be creating array entries for some registers
> it should not still; I've left comments on that patch.

Hmn, will double-check.

>
> I've taken patches 1-11 and 14 into target-arm.next so you don't
> have to keep rebasing them.

Thanks!
