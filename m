Received: by 2002:a17:504:8616:b0:1be9:327d:8ee3 with SMTP id o22csp141487njm;
        Tue, 29 Apr 2025 03:05:20 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWpGuxhniSm79VlY2/a8rJ482uSGHoKYvGSIZogYj2TjviPlENipL6UCeQoN7+7+UQ5ODxt4rrZ9US87g==@linaro.org
X-Google-Smtp-Source: AGHT+IExb5FzWgNZxMmzeh21nvBG51SRoZY5mxj78coYSieYkFszoTby0TYfMwxSXg6jyvgf+jee
X-Received: by 2002:a05:6214:29c2:b0:6f2:c79b:ef9b with SMTP id 6a1803df08f44-6f4d1eff39bmr215296236d6.16.1745921120614;
        Tue, 29 Apr 2025 03:05:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745921120; cv=none;
        d=google.com; s=arc-20240605;
        b=XY+TLzn3G3mgQgTWLFExd+eAQVuahZT6SFtdAoVdRjGnH2xO9VngYiCLJEKJ7sb3L2
         L8lctzISr6HBcW15gENQqyMWxUctpNdOI1sNjiXabA/iaz1HQIsjUHWYuY9E3XkeFXvZ
         gG/ANLxdZbAEU4CHEajWlWuq55ettDOzl/egEa611p95QpHb276SITa+uLaJyq9vKeu4
         H96LZjRx8p8o67frEwJ9ZxRgCxPLcLZ6jIA+xLsxCZhqMEIRvvAuoctfMPCFmvJEDQTA
         wAjcVWd6jMYx50ZNJqKr3I2g75n0KyPcuEB6H2JLBgY/x4yHI4P5TYy/0fWhVIpbyJFx
         uXpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:message-id:date:user-agent:references:organization
         :in-reply-to:subject:cc:to:from:dkim-signature;
        bh=y5NLyC1kw2O3SwbJo3iBwg72l0WjQvkHhB9h33OsuH4=;
        fh=wcSkgx08J2c8+J/nuIxxa9nj1zB8FwiCrauqmmA5Ov4=;
        b=fkW8dMC97Y3MPqdQW4TsMJcOoA5bgVl+4CiHNoS0IQkY7X+GWBsEDeHnT5LWEjj12y
         2OhQRd17ldgGrdxjeuIcLsFo8jnUBNXWNW2dtgpCcg8RLrvj/reHalvM9Nv702GB6EQ2
         msrUYXFNGUMNefj3NvQhn3bh52ULAosEMBbWBbSEEqp50qdryIga59MSByqZFJsXgQlc
         f5KHKcnMIWZU5VhAntFoMpho15sU2jl3TxSN2RKLBgYpEhocRD22wiH8TBz/QLIpbN94
         E737bEMlaKoJgbDp7+8xSb+EmZ6IYS/QwE+MgaOpFrQck+0Rz+M0beWaB/ca2mwz/lRQ
         Lwow==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Gbwcc/gZ";
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f4c0acbf9esi118488576d6.251.2025.04.29.03.05.20
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 03:05:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Gbwcc/gZ";
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745921120;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=y5NLyC1kw2O3SwbJo3iBwg72l0WjQvkHhB9h33OsuH4=;
	b=Gbwcc/gZFpnFmtuNp12EkeW5hA9T01KRMY1e8IaD20f369oYx+IvMggk8ji/z5fQSVFp0o
	BIEnD24nYINgeImJbVhvrRbQalHGKZ8I8XXJltBzJvnvFX/iA6JrLYOn2+dt55cED11HBg
	EKfPdzP/smrdedjIr67+rR4YGwPwDkI=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-529-fPgnIaV_PFyAjTEEO3J8mg-1; Tue,
 29 Apr 2025 06:05:17 -0400
X-MC-Unique: fPgnIaV_PFyAjTEEO3J8mg-1
X-Mimecast-MFC-AGG-ID: fPgnIaV_PFyAjTEEO3J8mg_1745921115
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B3CE31956088;
	Tue, 29 Apr 2025 10:05:14 +0000 (UTC)
Received: from localhost (dhcp-192-216.str.redhat.com [10.33.192.216])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D7EDE195608D;
	Tue, 29 Apr 2025 10:05:13 +0000 (UTC)
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
Subject: Re: [PATCH for-10.1 v5 00/13] arm: rework id register storage
In-Reply-To: <4cbaa46b-2114-49b3-8d59-e92a4967665b@redhat.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20250409144304.912325-1-cohuck@redhat.com>
 <4cbaa46b-2114-49b3-8d59-e92a4967665b@redhat.com>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Tue, 29 Apr 2025 12:05:11 +0200
Message-ID: <87cycvqo4o.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-TUID: izXrn4IZYBrn

On Mon, Apr 28 2025, Eric Auger <eric.auger@redhat.com> wrote:

> Hi Connie,
>
> On 4/9/25 4:42 PM, Cornelia Huck wrote:
>> Just a quick respin to fix a missed conversion in hvf.c.
>>
>> Also available at
>> https://gitlab.com/cohuck/qemu/-/commits/arm-rework-idreg-storage-v5
>
> I reviewed it again - I can't send any R-b through since I am co-author
> ;-) - and I spotted few conversion mistakes (I am most probably the one
> to blame here sorry)

Oh, I think I'm perfectly capable of messing up on my own :)

>
> Once those fixed, I think we should be good.

Thanks for the review, I fixed things up and did fdarray[2] -> fd for
the few cases remaining at the end. Will probably repost after some
testing.
