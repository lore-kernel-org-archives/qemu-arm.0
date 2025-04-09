Received: by 2002:a17:504:17d6:b0:1be9:327d:8ee3 with SMTP id o22csp7609167njd;
        Wed, 9 Apr 2025 03:14:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUfnz7OAF9kyd6ARXAhVmUDWw8qSMoJ198Uuttc1Rx4dBrErybkpXIRd/6Ub1LQqzECvMM/14o2mGYVQg==@linaro.org
X-Google-Smtp-Source: AGHT+IEY1WK+1KspI7b5zasNEwx23vBl3A4V0dX0uYitrK9VPvsRa7zDoHMXcBLHSI+8niwDafxX
X-Received: by 2002:a05:690c:2506:b0:6fe:eaac:e55f with SMTP id 00721157ae682-705387ced2emr42629067b3.9.1744193661498;
        Wed, 09 Apr 2025 03:14:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744193661; cv=none;
        d=google.com; s=arc-20240605;
        b=KUOP0j2LagIoqmfe5+PzGj9VPBpx5QviJ3YdmeD+QZFR8pmzWQ8o6d5ZTKue9XiiOf
         vBvDHWBuN8xAAvET3ghEEkE5wzT7rcIlkXevMpSfYVcG1qcZgdiHs/yrpS+mZjna8Kcr
         TLequJ9uSrc1fVdfOxBOFLRpJMuiALf6WY6WbwVewWhJoOXJDrKvZ+Ibk56bMh0exSSB
         qigrh6xMB5JSIoJ7VMrStOvKFfAV5oK2iq18OQ5L/BtCM4xmdRFMeyO/bVfNfa8ZSsua
         P5c6AypJ6XU+9sagsK4JveaOz4l1M/wWIxsTIxvNT0Zmyy4ZtsQqT8kTQyUdL1045lLU
         8Xkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:message-id:date:user-agent:references:organization
         :in-reply-to:subject:cc:to:from:dkim-signature;
        bh=+/lkyCl8vM9EFCkDS8zkM7kt4Y5/de55KVxrVIc8hfM=;
        fh=wICZTdRVE8hcXpDo2ZiTXxCMq4RcRFA5Y76mB+7LaeM=;
        b=AfEC7S4kPVx+xrXO0Zn/cXTGzkvQHdTdNc4Nk2jRCg0IRoTyYVJC2OdnG/9eHsmbL1
         HSfsCMGBF6KRuQIexjQOY2y8Z9yCphE3Y46AUBg65oP30HQXqyu+dAeIL0EOfX+L4C2t
         /kA97DYmDJNm8JtB0oXcoECgsK93llZ5JXpIQpj4n9/PecnTrUFRiCWyeG78nawKxyjH
         kphhSdb6JlRxshEHOlzdVYG8bMGW8erFuAdc/bj0ZRG504rgiwsChEtUGWUGkVoU2gTL
         sc5MHSQoV2+qHpNPCd9snC12/17TNIdrw8li781JaZfJc1UHD2V8nsQMsFs6wAwvD6BK
         V7zw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bFJgoeUe;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <cohuck@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 00721157ae682-7053e3a9c81si13607657b3.475.2025.04.09.03.14.21
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 03:14:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bFJgoeUe;
       spf=pass (google.com: domain of cohuck@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=cohuck@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744193661;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+/lkyCl8vM9EFCkDS8zkM7kt4Y5/de55KVxrVIc8hfM=;
	b=bFJgoeUeN/WeZ+9eiIWpWXFZgwACHw+KybKF19M22XO94RKYjvqIgd1KylYr8Qi9v4GltO
	T4D6WvOax/S07O7/EsU0L0PViHHGbm8VDuWhII41fSN1V2gRzlb1IHWVTCiqqx3HQOHbHO
	ahyW2r+cPMHXocRFdxO3/bGk4zQOKf0=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-596-bKlSA2fpNqG4c5vRinQghQ-1; Wed,
 09 Apr 2025 06:14:16 -0400
X-MC-Unique: bKlSA2fpNqG4c5vRinQghQ-1
X-Mimecast-MFC-AGG-ID: bKlSA2fpNqG4c5vRinQghQ_1744193654
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 486FC1954B39;
	Wed,  9 Apr 2025 10:14:12 +0000 (UTC)
Received: from localhost (dhcp-192-216.str.redhat.com [10.33.192.216])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0EA1A19560AD;
	Wed,  9 Apr 2025 10:14:09 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, kvmarm@lists.linux.dev, peter.maydell@linaro.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
 oliver.upton@linux.dev, sebott@redhat.com,
 shameerali.kolothum.thodi@huawei.com, armbru@redhat.com,
 berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com,
 agraf@csgraf.de
Cc: shahuang@redhat.com, mark.rutland@arm.com, philmd@linaro.org,
 pbonzini@redhat.com
Subject: Re: [PATCH for-10.1 v4 04/13] arm/cpu: Store aa64pfr0/1 into the
 idregs array
In-Reply-To: <20250326173723.389988-5-cohuck@redhat.com>
Organization: "Red Hat GmbH, Sitz: Werner-von-Siemens-Ring 12, D-85630
 Grasbrunn, Handelsregister: Amtsgericht =?utf-8?Q?M=C3=BCnchen=2C?= HRB
 153243,
 =?utf-8?Q?Gesch=C3=A4ftsf=C3=BChrer=3A?= Ryan Barnhart, Charles Cachera,
 Michael O'Neill, Amy
 Ross"
References: <20250326173723.389988-1-cohuck@redhat.com>
 <20250326173723.389988-5-cohuck@redhat.com>
User-Agent: Notmuch/0.38.3 (https://notmuchmail.org)
Date: Wed, 09 Apr 2025 12:14:07 +0200
Message-ID: <87bjt5abgw.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: wEnv4AS23Axi

On Wed, Mar 26 2025, Cornelia Huck <cohuck@redhat.com> wrote:

> From: Eric Auger <eric.auger@redhat.com>
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Sebastian Ott <sebott@redhat.com>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>  target/arm/cpu-features.h | 40 ++++++++++++++++-----------------
>  target/arm/cpu.c          | 29 ++++++++----------------
>  target/arm/cpu.h          |  2 --
>  target/arm/cpu64.c        | 14 ++++--------
>  target/arm/helper.c       |  6 ++---
>  target/arm/hvf/hvf.c      |  6 ++---

I just noticed that there's a new line in hvf.c that needs to be
adapted, I'll respin :/

>  target/arm/kvm.c          | 24 +++++++++-----------
>  target/arm/tcg/cpu64.c    | 47 ++++++++++++++++++---------------------
>  8 files changed, 71 insertions(+), 97 deletions(-)
