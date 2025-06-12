Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp2431484njc;
        Thu, 12 Jun 2025 08:34:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXlPE9WiRex4swknPmSJpKW7ULo2U0clBMHyJaDDIfv5IuPquFOyaDqyb4CqLIGMxDQ/duB87fVWKtEKQ==@linaro.org
X-Google-Smtp-Source: AGHT+IF4rKPj6mWpjVt8g8PEqKmeT5QzuvFXU6+I0aJWETguaJIOvCXi19NhKdRxO4Jfm60b27mF
X-Received: by 2002:a05:6214:d04:b0:6fa:864f:87cc with SMTP id 6a1803df08f44-6fb2c37285cmr114961266d6.33.1749742478991;
        Thu, 12 Jun 2025 08:34:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749742478; cv=none;
        d=google.com; s=arc-20240605;
        b=CA+yTUBf1pVqTkB0AxxRKS9in4MxW2orQBMj/LsJQq/OACYVOQ+ZGaQ5k/K/qP9mDr
         y46/Sd8H7DIbeRA0oivYRzQ/h5QVwdodMbjQj+efgPkpZ11axDoav7l5qAde80AmoliT
         yyBQY2ZY+JegnZp1LXlRU9luc9DCubke2d7mz2a8yTN9++GLT/ipNL6ZRBWIKTjhJ0oN
         78imXEqFXf7NBLwIwGB3c3E/kUffbq+oVT8i6wrw1GzmhqG5RGFUT6yzweHIZLxcJ2uv
         S/0Rz/lmbtAUR4ewGNdgHdplzOe9BZowu70pQ7tofhgIH4rRl2NqZmpAayEng0uMMtgS
         xmFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:message-id:date:user-agent:references:organization
         :in-reply-to:subject:cc:to:from:dkim-signature;
        bh=zjWEWalRhjt+Jmg9fJ1nInmzuE3X/VWFJ2VSJWP1rn8=;
        fh=3AH/4enSkYH+0gdMWbJY9r7skS1O9K2SeH+yRsCcYPI=;
        b=JTjH9bpMOoDE2vfStlzAGJGLEvgDINJj+2o+GoOpHfiHUUMsu+EoM0nMrKboYFhZrA
         mpWyRxkAEA+rxTmlWg9a7PxEBNnQFJFyKGHtLvg11mBpX0PHBwvbjGaycoKslGnn7qzU
         PmYJ2HzEw3KE4VqC/BxQfx2eMEDGm3qNjB1eRLTUmfv8QvUhwlloyrsihT6QGEK/Emar
         vVhSdLIHlyUuzbjNIph7B3mw2QuXGzdTnx9mbgWmPy+AdaMK77gqZ5aW+DhSGEq4QYZt
         R6FUIvBXG7r603IVCg0YYQ7jYGXfc8LWTZSK+yn3ijFzXWMt21jEQApC7YaHWULCBzN/
         TSNQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QZIsp1Mp;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7d3b8f10973si92640785a.453.2025.06.12.08.34.38
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 08:34:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QZIsp1Mp;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749742478;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zjWEWalRhjt+Jmg9fJ1nInmzuE3X/VWFJ2VSJWP1rn8=;
	b=QZIsp1MpPbzdtZkUTQBrJaboDm3U85z+eBiWd85yaWPCn+MtLXLBvf60dE7xtj0fyOMgPE
	6iuEdBSfH4xWtP1bBIXe2a83CNkQQWKi/cYGjBd2B4NB7ja9VGqu0kCnn3y6bjLj7W4T7F
	+oDYYzmtHTw+e08RHuPdSL2KcmXbqKA=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-110-tRi18R-kMvCLwqUtRyyPkQ-1; Thu,
 12 Jun 2025 11:34:34 -0400
X-MC-Unique: tRi18R-kMvCLwqUtRyyPkQ-1
X-Mimecast-MFC-AGG-ID: tRi18R-kMvCLwqUtRyyPkQ_1749742471
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 90A1E1801BD8;
	Thu, 12 Jun 2025 15:34:30 +0000 (UTC)
Received: from localhost (unknown [10.45.224.54])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 3D58B18003FC;
	Thu, 12 Jun 2025 15:34:27 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, kvmarm@lists.linux.dev, richard.henderson@linaro.org,
 alex.bennee@linaro.org, maz@kernel.org, oliver.upton@linux.dev,
 sebott@redhat.com, shameerali.kolothum.thodi@huawei.com,
 armbru@redhat.com, berrange@redhat.com, abologna@redhat.com,
 jdenemar@redhat.com, agraf@csgraf.de, shahuang@redhat.com,
 mark.rutland@arm.com, philmd@linaro.org, pbonzini@redhat.com
Subject: Re: [PATCH v7 02/14] arm/cpu: Store aa64isar0/aa64zfr0 into the
 idregs arrays
In-Reply-To: <CAFEAcA8y_wwZPoqkyPrNscRNTEwiOQm5Or9C=aiSNMGcZmq8CQ@mail.gmail.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Avril Crosse O'Flaherty"
References: <20250515153907.151174-1-cohuck@redhat.com>
 <20250515153907.151174-3-cohuck@redhat.com>
 <CAFEAcA8y_wwZPoqkyPrNscRNTEwiOQm5Or9C=aiSNMGcZmq8CQ@mail.gmail.com>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Thu, 12 Jun 2025 17:34:25 +0200
Message-ID: <87cyb99doe.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-TUID: IyjQk9Hars/4

On Thu, Jun 12 2025, Peter Maydell <peter.maydell@linaro.org> wrote:

> On Thu, 15 May 2025 at 16:39, Cornelia Huck <cohuck@redhat.com> wrote:
>>
>> From: Eric Auger <eric.auger@redhat.com>
>>
>> Also add kvm accessors for storing host features into idregs.
>>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> Reviewed-by: Sebastian Ott <sebott@redhat.com>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>
>
>>      if (!cpu->has_neon && !cpu->has_vfp) {
>> -        uint64_t t;
>> +        unit64_t t;
>
> This doesn't compile :-)
>
> -- PMM

Hum... weird that my compile didn't hit it.
