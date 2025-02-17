Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp199225njb;
        Mon, 17 Feb 2025 09:45:59 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVYs9fJhE9+iW0iNv/awH5LSAXNc7+fuHqxoGa3MwuyXU4bwoAwwAo7t6TD+BhBzepmYWEjuhTl24/Rgg==@linaro.org
X-Google-Smtp-Source: AGHT+IFymEFE5Q/8eWLXUOGdhWql5fqynjHJ4KTR8yhYwXy4KvcdMbiNPnlHamo6agUW00FHKLsk
X-Received: by 2002:a05:620a:40c1:b0:7c0:61d2:4ec5 with SMTP id af79cd13be357-7c08aaad182mr1748683685a.53.1739814359487;
        Mon, 17 Feb 2025 09:45:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1739814359; cv=none;
        d=google.com; s=arc-20240605;
        b=k1LdBUhcwkUzPWr66hUI5zOcY2EvmPYy1A31hxLJwcgaGf9MvJhLknEGxYYb2mpDFW
         XF5eZqIJzWwaA4JGzSqNPetjSTdMdm+zSPi13vVy/om1jdeAdtyoYk+gAOxGayZIEcO3
         9F6LoBWR/4hHkRvPOlNQ5EYiWFLgUA3XoUOG8BQdMn67nU2cgIp4YKbxaqtz6ExW5FAJ
         YhhHnIx5vPLaynaXVx7ZwpZI7JOU2+gVlmQxwxmVbX7k0iEhc3jsB759FEEXMhpbuPkZ
         QFYzENNwkT0LDea6Ubo9nt2iIdshKIvwWXRD0xMlRB/xT1La7GOGNrk+dg7XulSo9K1o
         6DOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=bARpz6GEXYVosp14t8tSmIlTn9yfAWyKdBrSYpBepWY=;
        fh=raD6oBcmI/z2F84ZZ5nhi7CU5/iRFmIxACRBaTamy1U=;
        b=NcGV/xoM0PU2rMbszylUznXAWrNLatQyNV5QAoHW4vWnMrQnsNT2bijC3Jwy3vUCGO
         6jrdSuLt4lHXZWnsKN4zxAxnM9pSCqyyBMXV/YVXKulfrcdaWZJU+8Ts6dI7lBpUCYfu
         MHVFkWLQly4ny7sinpq25cMTJkpt18izNl+ij+gOuolm5ZDqE7DduXSRa5gR7dmI9Avl
         k9DvXwkRLvd4SfMDudS6PeHmiVfRICM/kieDcvIs1FWAJj4wmPqKDiZq/2qMwkAO7sL1
         d3ce1HhqCc3sJta3lCdELYmy2F2uyBBJanTQMqfkMvHCOzNAW1m0HurXGhFgOyZE44Ob
         Etvw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PPhruxzm;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7c07c8d5a63si954120385a.616.2025.02.17.09.45.59
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 09:45:59 -0800 (PST)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=PPhruxzm;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739814359;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bARpz6GEXYVosp14t8tSmIlTn9yfAWyKdBrSYpBepWY=;
	b=PPhruxzmXqcqs0IXn0QYEHehEbUXUHmqE59qw0WsGe7/5i/pOWpmjdDbuKVBI2B3XacP5l
	PDsDK6r2NPRDYU0oYWJJ8VjK3dBmZfb6a3kRaPv2QPb4M1capcT4NI9rh/m3B6cnBO9E9F
	msLwZFtBX1rGZpmRub41OXXnfbZY6QM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-25-RZRsW6vuOTy6AtrcyHzaQQ-1; Mon, 17 Feb 2025 12:45:58 -0500
X-MC-Unique: RZRsW6vuOTy6AtrcyHzaQQ-1
X-Mimecast-MFC-AGG-ID: RZRsW6vuOTy6AtrcyHzaQQ_1739814357
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-38f20b530dfso4863310f8f.3
        for <alex.bennee@linaro.org>; Mon, 17 Feb 2025 09:45:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739814357; x=1740419157;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bARpz6GEXYVosp14t8tSmIlTn9yfAWyKdBrSYpBepWY=;
        b=expB3+Swkk3oe8wp+5SMKwzkwTxRuL+Gt7fWbnULK9ao/5KL8+3yxC9mre8Mgg+LBk
         DAN477uEbQKatvd6FdPf5nlSTX7zC41sLyEJ3PgP2ZpnYlzGMBQxIPH5MGrZeCZM+VXX
         XkoJsJlnrJNU93DGMSV1rqLpeMkfwbIcshAK0W/MxB9lFP05NwnOZq6RKcsEZFsNij0T
         id63gCetk5yFWPQTx8cWNJ2YEMFWyIfmLL9dY/voefPcjaYc5ehsRmBYebGLNgHbE62H
         G4+Abj6zpTpsjxsZRo4qBs1Hu6hkRB9kP9OTHzvzC1ZpVkySUi5d+aZC/nXgvH9Ft7pX
         c/WQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKBclWNpqYG3JagJ0JoIN6ZjmM2jNNoNCgc07xtJxRkA6w2De5XUi+zVRLA6TQZhETnf+EzAE2TAc45g==@linaro.org
X-Gm-Message-State: AOJu0YwnCVNJwwDsn+G4D11EKeXLZQr1kICA3kSrNfxQQbzZ/XcK3+Mb
	AzY8G+GXbC2nD5AujHgGEP5ALru8SD3tiD6QEdq3N+97HrBzld0jS4I26a6B8qcbjmI9aX6iZTo
	eUuj4KQaOTC5fTFlluGPwVL9VcldRYxJS9wMRAAsHyMoWJQSVh5s/4A==
X-Gm-Gg: ASbGncsxokEU67fWkqZzZsTjPA/270gKZuYcQqhxapyLY7gpbxFB56r23Es94ArXfCH
	+Y4+TshF6kiocah5K9qU0JsHgTD5/WECNvJ0/FVtwgpyLNvJT1jnFgBZD0ZgY8e1MFmsvTDagf1
	yEx+pej9AEM0rfpGsHcDluddueZMoY+XZcxoalnDI6VzgSgO704GlC5TqR8UqZpdAgVF/WobL2f
	BYYNMfF4R7nHeLnBPl/ukeTGX9EBmup5SK6hAnETGjiQ0+++BJO7I5gqxcwdggMGMRM5dolnGHX
	59PRiANlzXtyYOq0x65/NHdIaOFU+WBvPM7zaZPADdts+bYOdZEq
X-Received: by 2002:a5d:6c66:0:b0:388:c61d:43e0 with SMTP id ffacd0b85a97d-38f34167d68mr11769343f8f.48.1739814356783;
        Mon, 17 Feb 2025 09:45:56 -0800 (PST)
X-Received: by 2002:a5d:6c66:0:b0:388:c61d:43e0 with SMTP id ffacd0b85a97d-38f34167d68mr11769307f8f.48.1739814356402;
        Mon, 17 Feb 2025 09:45:56 -0800 (PST)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f25914d73sm13039169f8f.54.2025.02.17.09.45.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2025 09:45:55 -0800 (PST)
Message-ID: <349acbc0-dfc2-4cb7-8d5e-21e48a4219e7@redhat.com>
Date: Mon, 17 Feb 2025 18:45:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v2 1/3] docs/cpu-features: Consistently use vCPU instead
 of VCPU
To: Kashyap Chamarthy <kchamart@redhat.com>, qemu-devel@nongnu.org
Cc: Ninad Palsule <ninad@linux.ibm.com>, sebott@redhat.com, maz@kernel.org,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Alistair Francis <alistair@alistair23.me>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Tyrone Ting <kfting@nuvoton.com>, Hao Wu <wuhaotsh@google.com>,
 Zhenzhong Duan <zhenzhong.duan@intel.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, =?UTF-8?Q?C=C3=A9dric_Le_Goater?=
 <clg@kaod.org>, Steven Lee <steven_lee@aspeedtech.com>,
 Troy Lee <leetroy@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Jamin Lin <jamin_lin@aspeedtech.com>, Yi Liu <yi.l.liu@intel.com>,
 qemu-arm@nongnu.org, Alexandre Iooss <erdnaxe@crans.org>
References: <20250217163732.3718617-1-kchamart@redhat.com>
 <20250217163732.3718617-2-kchamart@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250217163732.3718617-2-kchamart@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Pp1h8jh3MWfXx_wmGsJA73uSK3slDtPNiVqvszHJiOE_1739814357
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: Gho2vcfbHk2A




On 2/17/25 5:37 PM, Kashyap Chamarthy wrote:
> Signed-off-by: Kashyap Chamarthy <kchamart@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  docs/system/arm/cpu-features.rst | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
>
> diff --git a/docs/system/arm/cpu-features.rst b/docs/system/arm/cpu-features.rst
> index 37d5dfd15b..a596316384 100644
> --- a/docs/system/arm/cpu-features.rst
> +++ b/docs/system/arm/cpu-features.rst
> @@ -27,7 +27,7 @@ disabled, enables the optional AArch32 CPU feature, is only supported
>  when using the KVM accelerator and when running on a host CPU type that
>  supports the feature.  While ``aarch64`` currently only works with KVM,
>  it could work with TCG.  CPU features that are specific to KVM are
> -prefixed with "kvm-" and are described in "KVM VCPU Features".
> +prefixed with "kvm-" and are described in "KVM vCPU Features".
>  
>  CPU Feature Probing
>  ===================
> @@ -167,22 +167,22 @@ disabling many SVE vector lengths would be quite verbose, the ``sve<N>`` CPU
>  properties have special semantics (see "SVE CPU Property Parsing
>  Semantics").
>  
> -KVM VCPU Features
> +KVM vCPU Features
>  =================
>  
> -KVM VCPU features are CPU features that are specific to KVM, such as
> +KVM vCPU features are CPU features that are specific to KVM, such as
>  paravirt features or features that enable CPU virtualization extensions.
>  The features' CPU properties are only available when KVM is enabled and
> -are named with the prefix "kvm-".  KVM VCPU features may be probed,
> +are named with the prefix "kvm-".  KVM vCPU features may be probed,
>  enabled, and disabled in the same way as other CPU features.  Below is
> -the list of KVM VCPU features and their descriptions.
> +the list of KVM vCPU features and their descriptions.
>  
>  ``kvm-no-adjvtime``
>    By default kvm-no-adjvtime is disabled.  This means that by default
>    the virtual time adjustment is enabled (vtime is not *not* adjusted).
>  
>    When virtual time adjustment is enabled each time the VM transitions
> -  back to running state the VCPU's virtual counter is updated to
> +  back to running state the vCPU's virtual counter is updated to
>    ensure stopped time is not counted.  This avoids time jumps
>    surprising guest OSes and applications, as long as they use the
>    virtual counter for timekeeping.  However it has the side effect of
> @@ -200,15 +200,15 @@ the list of KVM VCPU features and their descriptions.
>  
>    When kvm-steal-time is enabled a 64-bit guest can account for time
>    its CPUs were not running due to the host not scheduling the
> -  corresponding VCPU threads.  The accounting statistics may influence
> +  corresponding vCPU threads.  The accounting statistics may influence
>    the guest scheduler behavior and/or be exposed to the guest
>    userspace.
>  
> -TCG VCPU Features
> +TCG vCPU Features
>  =================
>  
> -TCG VCPU features are CPU features that are specific to TCG.
> -Below is the list of TCG VCPU features and their descriptions.
> +TCG vCPU features are CPU features that are specific to TCG.
> +Below is the list of TCG vCPU features and their descriptions.
>  
>  ``pauth``
>    Enable or disable ``FEAT_Pauth`` entirely.
