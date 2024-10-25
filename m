Received: by 2002:a17:504:5682:b0:1be9:327d:8ee3 with SMTP id r2csp1027040njx;
        Fri, 25 Oct 2024 05:55:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWuehhyngspzWgq6MFU+/DnoYhq9s2utOelmc6oWmftTxOduIT0Ne2jIIfpGY7eeoL5TVSsNE4jNrgu5w==@linaro.org
X-Google-Smtp-Source: AGHT+IHuhrjx0PXjjXQ7ll0Z2n2o+i0k/WHS//eG3AiGpDOTsViYPJ6KZzSrom1CLez9L2GtAVH+
X-Received: by 2002:a05:620a:444d:b0:7b1:4d6a:b99f with SMTP id af79cd13be357-7b186bb81d1mr726587885a.14.1729860934105;
        Fri, 25 Oct 2024 05:55:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729860934; cv=none;
        d=google.com; s=arc-20240605;
        b=ji2CPxvVmyJTt0aUqT/5X3d4KOxcTE5yspZJihi1RRdWb1BF7aR2kDT2s1PSM40MrY
         7kgKxBR6ijcbCvmB4X4BhIgDONxiriEKk5hMtSjXuWvXM2VuXWwbWv4+3rS50+0y3G0F
         +EjUsT8WNomTNexrLca+NMDRXHIXt2Gkoe9ooHDNqKyeWHbAqyzFLHaVWs4tBXzwi+6t
         /ADnRdfrN72uyBfnaQqzqmqeFDUEeZeHubyBtC/ONUuO3CWqyGO0cfZalMNypMYQJaeN
         sdXeVUTEUm8Rf+Pub+auzxjleH5pQjTlAn1wtlu1rmvIdCMgHYGBYa3Yi6tXVBCvGsWi
         geJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:dkim-signature;
        bh=e77XIlvulyf/f9Y8TZIkfwjukkAPIINCx9VWzDIMND4=;
        fh=xvAnbKHZqn/QIdcyEcvWukR35/6Gm2tQ0V5YAjW0SGw=;
        b=Q4lKhUQm8PhWcEYYesBZ7fJI3sJqR77CbPgAvSm1sTRCjrshRA6LuInlqNYf8Ac7NM
         vzTmEXU+hC3im2Do/iEBGvXkAZZ7CmhjpnK3+1KN5Prmx3R4PKxyNSIc9xaO7O2G0J6w
         Y6sfdEOfEsmQtU5W2ywdHvBXoePTl2hD6yz+PVX7M3Qg0SnvfAGqQns6YDdBm+yrx0XH
         /npS43fzH672Kih21PfODomBSu6U7FkU3+C9m/d4Smq0w9B4voO0Zrl7x41VXDpajBzS
         Jlf8Z0nimk5jl2m5Gb+u7t3TpaLc+tr+H3Bowj6m0zaG38w9uyBGRtePAqrtRat3Le72
         OxjQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BMAdzpqX;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7b18d26a942si147195585a.12.2024.10.25.05.55.33
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 05:55:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BMAdzpqX;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729860933;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=e77XIlvulyf/f9Y8TZIkfwjukkAPIINCx9VWzDIMND4=;
	b=BMAdzpqXI2x1ioGA8eNW4mdLzvBD+/35/nlzCCyRFFMrqhaPjXSgIfynuBL+aUPLeO3Gdn
	coZXmGDoEYruROovNQq4sGiL1aSaVe5YSK0NkwPimXlzOwqafd/UGvd2KoVSbZKQNycPTF
	lWSkHTOGANmLg0w5Uj8GXi12bwfWhMY=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-134-wj34u_MyPpag_U4is72eEw-1; Fri,
 25 Oct 2024 08:55:30 -0400
X-MC-Unique: wj34u_MyPpag_U4is72eEw-1
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 225771956048;
	Fri, 25 Oct 2024 12:55:28 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.164])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 994B519560A2;
	Fri, 25 Oct 2024 12:55:22 +0000 (UTC)
Date: Fri, 25 Oct 2024 13:55:19 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, cohuck@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, kvmarm@lists.linux.dev,
	peter.maydell@linaro.org, richard.henderson@linaro.org,
	alex.bennee@linaro.org, maz@kernel.org, oliver.upton@linux.dev,
	sebott@redhat.com, shameerali.kolothum.thodi@huawei.com,
	armbru@redhat.com, abologna@redhat.com, jdenemar@redhat.com,
	shahuang@redhat.com, mark.rutland@arm.com, philmd@linaro.org,
	pbonzini@redhat.com
Subject: Re: [RFC 13/21] arm/cpu: Add infra to handle generated ID register
 definitions
Message-ID: <ZxuVN905-TnOnHNn@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20241025101959.601048-1-eric.auger@redhat.com>
 <20241025101959.601048-14-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241025101959.601048-14-eric.auger@redhat.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: X324sm0FpQhm

On Fri, Oct 25, 2024 at 12:17:32PM +0200, Eric Auger wrote:
> The known ID regs are described in a new initialization function
> dubbed initialize_cpu_sysreg_properties(). That code will be
> automatically generated from linux arch/arm64/tools/sysreg. For the
> time being let's just describe a single id reg, CTR_EL0. In this
> description we only care about non RES/RAZ fields, ie. named fields.
> 
> The registers are populated in a 3x8x8 array and their fields are
> added in a sorted list.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  target/arm/cpu-custom.h            | 58 ++++++++++++++++++++++++++++++
>  target/arm/cpu-sysreg-properties.c | 41 +++++++++++++++++++++
>  target/arm/cpu64.c                 |  2 ++
>  target/arm/meson.build             |  1 +
>  4 files changed, 102 insertions(+)
>  create mode 100644 target/arm/cpu-custom.h
>  create mode 100644 target/arm/cpu-sysreg-properties.c
> 
> diff --git a/target/arm/cpu-custom.h b/target/arm/cpu-custom.h
> new file mode 100644
> index 0000000000..1952095bf7
> --- /dev/null
> +++ b/target/arm/cpu-custom.h
> @@ -0,0 +1,58 @@
> +#ifndef ARM_CPU_CUSTOM_H
> +#define ARM_CPU_CUSTOM_H

License header her.


> diff --git a/target/arm/cpu-sysreg-properties.c b/target/arm/cpu-sysreg-properties.c
> new file mode 100644
> index 0000000000..753e7c9127
> --- /dev/null
> +++ b/target/arm/cpu-sysreg-properties.c
> @@ -0,0 +1,41 @@
> +/*
> + * QEMU ARM CPU SYSREG PROPERTIES
> + * to be generated from linux sysreg
> + *
> + * Copyright (c) 2024, Inc. 2024

                        ^^^^  missing company name :-)


> + *
> + * This program is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU General Public License
> + * as published by the Free Software Foundation; either version 2
> + * of the License, or (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, see
> + * <http://www.gnu.org/licenses/gpl-2.0.html>
> + */
> +
> +#include "cpu-custom.h"
> +
> +ARM64SysReg arm64_id_regs[NR_ID_REGS];
> +
> +void initialize_cpu_sysreg_properties(void)
> +{
> +    memset(arm64_id_regs, 0, sizeof(ARM64SysReg) * NR_ID_REGS);

                                ^^^ just sizeof(arm64_id_regs)

> +    /* CTR_EL0 */
> +    ARM64SysReg *CTR_EL0 = arm64_sysreg_get(3, 3, 0, 0, 1);
> +    CTR_EL0->name = "CTR_EL0";
> +    arm64_sysreg_add_field(CTR_EL0, "TMinline", 32, 37);
> +    arm64_sysreg_add_field(CTR_EL0, "DIC", 29, 29);
> +    arm64_sysreg_add_field(CTR_EL0, "IDC", 28, 28);
> +    arm64_sysreg_add_field(CTR_EL0, "CWG", 24, 27);
> +    arm64_sysreg_add_field(CTR_EL0, "ERG", 20, 23);
> +    arm64_sysreg_add_field(CTR_EL0, "DMinLine", 16, 19);
> +    arm64_sysreg_add_field(CTR_EL0, "L1Ip", 14, 15);
> +    arm64_sysreg_add_field(CTR_EL0, "IminLine", 0, 3);
> +}
> +

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
