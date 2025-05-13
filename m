Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp597010njb;
        Tue, 13 May 2025 08:23:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXo/p+yW+IsFiCwJTQlk+ngru+pViYHM1sjPFuq+dUDIrSokCrcHnD3XD7UPqqeKtCSL3XRyjvFgYRozQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHx2dEytRCy1Y14/uAu+IpycaxRKlTYqQj8okPzopA2mFGn1RM+/UCiHZxloMCoVKoHGOlK
X-Received: by 2002:a05:6102:945:b0:4dd:b6df:1908 with SMTP id ada2fe7eead31-4df6e4d1a33mr3562262137.12.1747149810633;
        Tue, 13 May 2025 08:23:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747149810; cv=none;
        d=google.com; s=arc-20240605;
        b=crGrNyHxkMIezGm8eVUVxIdtbibayfMl5gl9H4x0ItA7ddXgjY1+BYZidJkjfRGnpA
         1WmtKwHP5OZXor4Stwt+GVeI85p0tYqjSoqOI5hNC1D6a0+ouejPsfLzcursJ0giCmf2
         YNMQbRwgwffvWc4gGgzRksmX4S9TWEUp6u9ER5kcTwIo70Fa54MlRUMSM5AwliBZB916
         mdM9nnsmezpgewhi18Ei7U+7MZoTnBhHAYnAXEIu8w9kcCQURSEHYk/FKmA2pK0zs+LA
         CvN3s8k+3D9sWUI2y2v+jo70yqhG34iaf39VvYLAZnQJKOTGteU5UblVao26QuSSy/vN
         x05Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:dkim-signature;
        bh=cgbu7nue8vQ9ere64ITgIcQRi4NqnKKSII3mmlr4q+U=;
        fh=iM9GwfGv21/blqyxO272EqVSEyp03V2YmKTOh+3dT00=;
        b=Ej0Yty3JN85pAKKrvivIjq4yjOlB8jdN56hGJkNIjCOoLMXL24Pmr3XG/8/pdHTfKB
         7mrrCsRi6KihlnAIFO9F2O8Ll2iPJHreif17XIC3wwI1QrdCTAmsnGoyDTo+/Xn36SyC
         FYr+2X0f9xc6smKpWdn8uZ1gguCdIAOgmZSW5eaDH0fcp8kBAO0PxGGw5aU4XOolBbD7
         Mfu2OU4N3szGblFX22ZQMblnsT7NWddECogxE+p40lzgnkCy/pJnKqhM51tgPIpkdoE7
         0P+zwryTDRBuBm88bC9AZ/tm3Mume7bY96momZWgl50xTg+6Wsu4hoXb8gSVaZcflH8Z
         mNIA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZRsP34et;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-879f62f3d2dsi3914844241.164.2025.05.13.08.23.30
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 08:23:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ZRsP34et;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747149810;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=cgbu7nue8vQ9ere64ITgIcQRi4NqnKKSII3mmlr4q+U=;
	b=ZRsP34etH4pHoTsHtiujKhfL+70Z5mti1uVWYe2NGZ6hDrj6D7dot4V9ByswUmsfHXb6xh
	SJzzPlwC/aXC+QzkHvKUyg9FVuHMDsyv0Sbj4dM99iFhkjCxhgQFJOY4/PAyHG+oqjWPd4
	pjVCV2XhPzyiUaBvzjZRSB/zHTu1Zjc=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-195-GJWtSxzUOQ2zpbXRAKwSLg-1; Tue,
 13 May 2025 11:23:26 -0400
X-MC-Unique: GJWtSxzUOQ2zpbXRAKwSLg-1
X-Mimecast-MFC-AGG-ID: GJWtSxzUOQ2zpbXRAKwSLg_1747149804
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AB46819560AF;
	Tue, 13 May 2025 15:23:23 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.110])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6FEF919560A7;
	Tue, 13 May 2025 15:23:16 +0000 (UTC)
Date: Tue, 13 May 2025 16:23:13 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, kvmarm@lists.linux.dev,
	peter.maydell@linaro.org, richard.henderson@linaro.org,
	alex.bennee@linaro.org, maz@kernel.org, oliver.upton@linux.dev,
	sebott@redhat.com, shameerali.kolothum.thodi@huawei.com,
	armbru@redhat.com, abologna@redhat.com, jdenemar@redhat.com,
	agraf@csgraf.de, shahuang@redhat.com, mark.rutland@arm.com,
	philmd@linaro.org, pbonzini@redhat.com
Subject: Re: [PATCH v3 02/10] arm/cpu: Add sysreg properties generation
Message-ID: <aCNj4dFWLkBZrmmh@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20250414163849.321857-1-cohuck@redhat.com>
 <20250414163849.321857-3-cohuck@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250414163849.321857-3-cohuck@redhat.com>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: ceEEn5xXoSFx

On Mon, Apr 14, 2025 at 06:38:41PM +0200, Cornelia Huck wrote:
> From: Eric Auger <eric.auger@redhat.com>
> 
> Introduce a script that automates the generation of system register
> properties definitions from a given linux source tree
> arch/arm64/tools/sysreg.
> 
> Invocation of
> ./update-aarch64-sysreg-code.sh $PATH_TO_LINUX_SOURCE_TREE
> in scripts directory additionally generates
> target/arm/cpu-sysreg-properties.c containing definitions for
> feature ID registers.
> 
> update-aarch64-sysreg-code.sh additionally calls
> gen-cpu-sysreg-properties.awk which is inherited from kernel
> arch/arm64/tools/gen-sysreg.awk. All credits to Mark Rutland
> the original author of this script.
> 
> [CH: split off from original patch adding both sysreg definitions
>  and properties]
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>  scripts/gen-cpu-sysreg-properties.awk | 325 ++++++++++++++++++++++++++
>  scripts/update-aarch64-sysreg-code.sh |   5 +-
>  2 files changed, 329 insertions(+), 1 deletion(-)
>  create mode 100755 scripts/gen-cpu-sysreg-properties.awk
> 
> diff --git a/scripts/gen-cpu-sysreg-properties.awk b/scripts/gen-cpu-sysreg-properties.awk
> new file mode 100755
> index 000000000000..76c37938b168
> --- /dev/null
> +++ b/scripts/gen-cpu-sysreg-properties.awk
> @@ -0,0 +1,325 @@
> +#!/bin/awk -f
> +# SPDX-License-Identifier: GPL-2.0

GPL-2.0 is a deprecated SPDX identifier. checkpatch.pl ought to
have complained about this, requiring GPL-2.0-or-later as the
preference, with GPL-2.0-only requiring justification in the
commit.

> +# gen-cpu-sysreg-properties.awk: arm64 sysreg header generator
> +#
> +# Usage: awk -f gen-cpu-sysreg-properties.awk $LINUX_PATH/arch/arm64/tools/sysreg

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
