Received: by 2002:a17:505:42a7:b0:1be9:327d:8ee3 with SMTP id rt7csp253970njb;
        Thu, 19 Sep 2024 08:05:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVJdu3Eqa0RDQI/yt/6L1Pr3fg4k25uOgTkom97ZawdxmGNMhMHpM1sPn2MIoFPAZn89rcnC7yW5l1x3A==@linaro.org
X-Google-Smtp-Source: AGHT+IH6salVbC7BHUD7Aj09rFtsvvDbxVoKIq4Mney/ttcfxpLziXDMv1B6N2LTsSLcUoH4rjL7
X-Received: by 2002:a05:600c:4fcd:b0:42c:bf0b:c489 with SMTP id 5b1f17b1804b1-42cdb53bf72mr166093165e9.18.1726758331518;
        Thu, 19 Sep 2024 08:05:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726758331; cv=none;
        d=google.com; s=arc-20240605;
        b=ZoEf9iwzxfvFYSXscA2Fvuk3BQH0JJi2772Y8NBJS7QNVPyp07npDk2jf0K1G3o+fx
         1MTQQY0V858b87RMC/7Jz8xYuZQKJd/7gf2/dzY+X3T/siNHUMfw3GdQlYOIOpfSVsub
         UEk1vQuXIFgNcwiCIUMDqhg3olVZWmJ83mZbjqS+qQz1x0m+WZUjH+1AKnD8yBVMC2O+
         0JmOQwOZsKbH4j9zQ78vDSy5v3IKvMDTQKcoSvgFJRk03lAsZsv0IOBE0dVliylm8cpy
         G52CHXTxRx95ZJ2vSnyJJxW4KGJ78Cj8Myh68wPkvdjfbKRoXSEbziKP61OEGWYgaJhi
         hpeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:message-id:date:user-agent:references:organization
         :in-reply-to:subject:cc:to:from:dkim-signature;
        bh=CRBaIT1ZiEL/UGx9VPyJK7064AwhFwjo48bUXISveq8=;
        fh=usHiMpzFrJ7vcM57hwS4lE9vDKZA3keG5nyFOjXIAxg=;
        b=TfcY/LgQizT2z7TkiBTEFbEa6Dzxr881qFjj7xVUMRhfwHcm15DeSZ8ZtFcovYBocv
         5GMiBgg9AeSIReGtz1pw/WeTRtx+c0BZLYBiWU+2m/eYDdwP9ijM2riz6IyChxorVwft
         yORrngLktXU8Q2GprVCGucRV5Jx/wrRdx2oVau0K7WASA7XLUIBXOeLMLC0eRN4RD7CW
         3z/6nOqILtXbsRCTsvPqxz0zsdAj+gAi4kztT4SqcQ4Ck3jMTPkJ3FFEK69FxZYlBcjP
         dNSfglYMeEj5nisO5eE3MZgXDsulSwJiDK2BWs5faHy9CnutcLq9GMKw7SyR6P+yxRJD
         xZfw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JBwG3LZv;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-42e754271a8si8668135e9.89.2024.09.19.08.05.31
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 08:05:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JBwG3LZv;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726758330;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=CRBaIT1ZiEL/UGx9VPyJK7064AwhFwjo48bUXISveq8=;
	b=JBwG3LZvE/HZGQCnvDmvEaVgoNcVRkuSaH8olqwE+Tb4iqzI+QXWbyavP2JR+Fb68bhzsf
	mNJ4YcT/es9VMyP9kOgH7aRoWNBo0UHo5JIe9RUxo3jki37cj+7IcJPCeF+lmy5EuBxi6V
	s6AOFMONb0dXe1coM6c5fwn/pPgAQtA=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-112-9YGylzwgNteCDK_4Ujoq1g-1; Thu,
 19 Sep 2024 11:05:27 -0400
X-MC-Unique: 9YGylzwgNteCDK_4Ujoq1g-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (unknown [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7260E193611E;
	Thu, 19 Sep 2024 15:05:25 +0000 (UTC)
Received: from localhost (unknown [10.39.194.77])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7EB8719560AF;
	Thu, 19 Sep 2024 15:05:24 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>, Gustavo Romero
 <gustavo.romero@linaro.org>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 alex.bennee@linaro.org, darren@os.amperecomputing.com
Subject: Re: [PATCH V2] arm/kvm: add support for MTE
In-Reply-To: <879f7e65-070a-4d9b-b70f-60576b7b5319@os.amperecomputing.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20240912091616.393685-1-gankulkarni@os.amperecomputing.com>
 <0faf9a7c-0400-482c-974f-7b70e1d58202@linaro.org>
 <879f7e65-070a-4d9b-b70f-60576b7b5319@os.amperecomputing.com>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Thu, 19 Sep 2024 17:05:21 +0200
Message-ID: <8734lvu1ji.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: HGN6U/GjenKW

On Thu, Sep 19 2024, Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com> wrote:

> I have modified as below diff to keep TCG if loop as it is and adding if 
> for KVM case to clear/mask the MTE bits if MTE in KVM mode is not 
> enabled by user command(if no mte=on).
>
> Is below diff makes sense?
>
> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index a59417aac8..523996576d 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -2390,15 +2390,20 @@ static void arm_cpu_realizefn(DeviceState *dev, 
> Error **errp)
>
>   #ifndef CONFIG_USER_ONLY
>           /*
> -         * If we do not have tag-memory provided by the TCG
> -         * nor MTE at KVM enabled, reduce MTE support to
> -         * instructions enabled at EL0.
> +         * If we do not have tag-memory provided by the TCG,
> +         * reduce MTE support to instructions enabled at EL0.
>            * This matches Cortex-A710 BROADCASTMTE input being LOW.
>            */
> -        if (cpu->tag_memory == NULL && !cpu->kvm_mte) {
> +        if (tcg_enabled() && cpu->tag_memory == NULL) {
>               cpu->isar.id_aa64pfr1 =
>                   FIELD_DP64(cpu->isar.id_aa64pfr1, ID_AA64PFR1, MTE, 1);
>           }
> +
> +        /* Disable MTE, if it is not enabled by the user for KVM mode.
> +         */
> +        if (kvm_enabled() && !cpu->kvm_mte) {
> +                FIELD_DP64(cpu->isar.id_aa64pfr1, ID_AA64PFR1, MTE, 0);
> +        }
>   #endif
>       }

Wouldn't that be a possibly guest-visible change?
