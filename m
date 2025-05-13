Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp401594njb;
        Tue, 13 May 2025 02:57:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV83/ue8P6YAb2lYHddEPZv+OOwlj85S6N1PIeE0yaovVJBds6CibJbKw2F3MWs+NquqXYtnqofi8IGRQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEM4egfpkCGNKsOyF+bCyD9odMLW+6COwRmoqFcZ2ev6b8sbyYg0E1EGpXGeiJ95cLoeCh+
X-Received: by 2002:a05:622a:229a:b0:477:1ee2:1260 with SMTP id d75a77b69052e-49452713006mr303397491cf.1.1747130232086;
        Tue, 13 May 2025 02:57:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747130232; cv=none;
        d=google.com; s=arc-20240605;
        b=hc4ay3Hy/NG6a0vCWPtqhrY57WlsM+GlAIVJCt5+y6ml/p/M+rdxjrDFms6yZFG0z9
         33NTcBUjIiCzX6nYFgN7sf7aRbPODXSoyB1mH+gcj1ZlY6GsCuYVvhX2E/jqU+EjMgnw
         90x3ZZIIbjiA1D/HDiTV03AFWD3PetBe4mYED5L9LIZys+YhdrrhRpNHtpd5+ASrMkX7
         RnQbFOqWDpOwABjSIWA7Ab966UeAskYDByu0uhVWJVWJTWGRMRfmTJ8//aSxnhaj7uVr
         SEBUnVTnZRVhVcpmY4DkYoHepeRey4QqpYMLNuqyngZRXWlyryx3KZ5MtLPyTz9HqES4
         f2sg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:message-id:date:user-agent:references:organization
         :in-reply-to:subject:cc:to:from:dkim-signature;
        bh=YnC7a/3jwBN04nZ+a9wUHK595rXowUPNwOgXxoConWA=;
        fh=wcSkgx08J2c8+J/nuIxxa9nj1zB8FwiCrauqmmA5Ov4=;
        b=Mrb/HIOzRopI3UooI8Y01F9F5UbscwX/956bWLSFbgpHUYH91K2jo/VuP1N1UWs50w
         OzoOXLlKRL44Fi4Nw6HahJ4qP6MimJEJv5EzxIgOjEVJr24ExiPm+mlNcdvuG7bMzKSe
         9il53mHkYfl6sZZrWvsiidO9Ra7HmMYgtr0wEUdIwhTSHT+P6x+rFIazr+VjZuuzyJs0
         rAL9FerXHE2MLdpvK/+qcQnlJymU6oqeN+Yiw1C1H5Ag3EJRQvvpEN1mezHnoX0X+V1m
         yDqo6wcjaUJkfY5UsjaOE62PSGWL6pk/2JDS5/yvYhPb/kkun0LuG2eh3pA3UXmdBPwf
         ZeoQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aewXmcoy;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-4945247966esi107949941cf.173.2025.05.13.02.57.11
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 02:57:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aewXmcoy;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747130231;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YnC7a/3jwBN04nZ+a9wUHK595rXowUPNwOgXxoConWA=;
	b=aewXmcoyoDxpLgemq3XPymlF/P55McZGesG4hTKOP864/gBm4uBZjSKLBaY59EliRfyq1z
	N1lCsMJw+Qr8NYq3qf3mGD5NcnSoqRxRUP0OXjTetjvm2x+O6TLg9dsRHHD5588HvgRBnd
	ua6TaaGudZrra1nMkeOItcDjPz0/lqw=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-387-Ht71ptH-MaG1_QK-pVMAtg-1; Tue,
 13 May 2025 05:57:08 -0400
X-MC-Unique: Ht71ptH-MaG1_QK-pVMAtg-1
X-Mimecast-MFC-AGG-ID: Ht71ptH-MaG1_QK-pVMAtg_1747130226
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 81A3E1801A08;
	Tue, 13 May 2025 09:57:05 +0000 (UTC)
Received: from localhost (dhcp-192-216.str.redhat.com [10.33.192.216])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AE2861801390;
	Tue, 13 May 2025 09:57:03 +0000 (UTC)
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
Subject: Re: [PATCH v6 00/14] arm: rework id register storage
In-Reply-To: <7efea440-f472-4115-9133-436347632c50@redhat.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20250506085234.855779-1-cohuck@redhat.com>
 <7efea440-f472-4115-9133-436347632c50@redhat.com>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Tue, 13 May 2025 11:57:01 +0200
Message-ID: <87h61oq1ea.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-TUID: mlzyBR1ey93r

On Tue, May 13 2025, Eric Auger <eric.auger@redhat.com> wrote:

> Hi Connie,
>
> On 5/6/25 10:52 AM, Cornelia Huck wrote:
>> Just some small changes:
>> - fixed up some botched conversions noted by Eric (thanks!)
>> - rebased to current master
>> - new patch with a small cleanup suggested by Eric
>>
>> Also available at
>> https://gitlab.com/cohuck/qemu/-/commits/arm-rework-idreg-storage-v6
>
> The series looks good to me and I have not spotted any additional
> conversion issue.

Great, thanks for looking!
