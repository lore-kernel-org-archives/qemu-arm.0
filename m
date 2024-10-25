Received: by 2002:a17:504:5682:b0:1be9:327d:8ee3 with SMTP id r2csp1036535njx;
        Fri, 25 Oct 2024 06:06:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUjaDzf+7WPC8O2ixiwwiq4NLAnd+zBe2ZIxjePaDZIm6HomXU18vjbtDLkz8v3xuMC+PBppWOQV4dBLg==@linaro.org
X-Google-Smtp-Source: AGHT+IFA2WiLqT+AgP/jGqUu84p26+ciNpo4vaue4hAWc16/38Jg0rBqfHypKtOcyZdXlYvl6GHa
X-Received: by 2002:a05:6358:5e10:b0:1c3:d56f:75d5 with SMTP id e5c5f4694b2df-1c3d8119c46mr710084355d.12.1729861619451;
        Fri, 25 Oct 2024 06:06:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729861619; cv=none;
        d=google.com; s=arc-20240605;
        b=kr6NfB/TWA8ZZCCk3QyjXHMtg3O0kmzy9ZxTOj/Ox3imh8uJKLsI408P/qLuVyfPqZ
         SbRv+OIMswzvC2zXQ0KYlNjFCEhgBmiVG6apoQLtfDmGng3f4RJ+P27OhgwzghFC8NUh
         jbLlTEx2OYPQgCHzrNYyEMTibXGxOP8BS3ZQ7Zx6Mt5rJjtt7dpESLWbwEMotsQaMroZ
         dNVhDex/TrwmNoPMI0WtnzSYebRPyVH+swuN3MhNTHMU+EOsIoVA3aromN3Kd7nE08El
         Km4YfVR1oTrXS+P8xTOeJK2mBYTjxF7mD8wjSj/hT2G3eXutYP8iBL8xsgLwPUSDXu93
         Lsjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:dkim-signature;
        bh=xsCzoibnSTl/nXMnbdZJ3n//wdWYLvbIDAUZDZZBDm4=;
        fh=xvAnbKHZqn/QIdcyEcvWukR35/6Gm2tQ0V5YAjW0SGw=;
        b=PQzVGV3N2XFHR9v6r6WY7/O4yw2MEH1ywdXxl35PUmSTlFtVVQbrYzNgQVXGvFl/aC
         neSvMohHx82DHmEUNWZgHFGLPyYieu9K1GSX29+8iBQAl7DidxVof0Hh1BMeY42D6Ec9
         /v9kHoM1p61MqFyMK2uASVaHUuHzpeMSorPEsKXeElxAurB/CL3yfVv2EvCZQmds9g16
         TIK3hMMdSXf+JW5zeMCpFHJeofl5t2Vvyfi2yGGfQObN7B0IiJ6Q+3Dhp5lORuNZfbey
         9dB7SByRv/q07UCeUJ830AyEA+BLcxz7Nmgb5NVPgnl11mMt5y3GuYSM1O58sGFWfnxN
         wemQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JKFRgFvN;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 71dfb90a1353d-510047a65dasi212880e0c.282.2024.10.25.06.06.59
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 06:06:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=JKFRgFvN;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729861619;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=xsCzoibnSTl/nXMnbdZJ3n//wdWYLvbIDAUZDZZBDm4=;
	b=JKFRgFvNVrq0f+ACXGIyOP+uOeOpfJCnqzolgVW1UnY1RGuFb7RFRaTAOH4aySLnlGPFOc
	ICFOo1D6XWrq7yimLZNzMXQkcwujJ+BaBUhyBaD2EqUZmY7yTWtsRbuWJjNy8PrisP/UzL
	8eVW96Lgfi6i3bWoVSykqwZDvBqiONM=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-119-5XZE1yUWNaW-rEI11PDeNg-1; Fri,
 25 Oct 2024 09:06:55 -0400
X-MC-Unique: 5XZE1yUWNaW-rEI11PDeNg-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 9294D1955F06;
	Fri, 25 Oct 2024 13:06:53 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.164])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2A8051956088;
	Fri, 25 Oct 2024 13:06:44 +0000 (UTC)
Date: Fri, 25 Oct 2024 14:06:42 +0100
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
Subject: Re: [RFC 18/21] arm/cpu: Introduce a customizable kvm host cpu model
Message-ID: <ZxuX4i9NjVRizB72@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20241025101959.601048-1-eric.auger@redhat.com>
 <20241025101959.601048-19-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241025101959.601048-19-eric.auger@redhat.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-TUID: PA7bMjq1t4zC

On Fri, Oct 25, 2024 at 12:17:37PM +0200, Eric Auger wrote:
> This new cpu model takes by default the host cpu values.
> However it exposes uint64 SYSREG properties for writable ID reg
> fields exposed by the host kernel. Properties are named
> SYSREG_<REG>_<FIELD> with REG and FIELD being those used
> in linux arch/arm64/tools/sysreg. This done by matching the
> writable fields retrieved from the host kernel against the
> generated description of sysregs.
> 
> An example of invocation is:
> -cpu custom,SYSREG_ID_AA64ISAR0_EL1_DP=0x0
> which sets DP field of ID_AA64ISAR0_EL1 to 0.

"SYSREG_" feels kinda redundant to repeat on every single
feature. 

Also, is this naming convention really the same one that users
will see when they look at /proc/cpuinfo to view features ? It
feels pretty low level to me ?  Naming after the registers &
fields, would be like configuring x86 CPU features by asking
for "SYSREG_EAX_1_ECX_20" instead of saying "vmx" which is the
human friendly name.


> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> 
> ---
> 
> At the moment, the custom model does not support legacy options
> of the host cpu model. We need to understand what we do with those
> latter (SVE, ...). This means that related KVM ioctl are
> not called yet.

It will be pretty painful to have to use different feature
terminology for different CPU models. Everything in libvirt
assuming feature terminology varies per-arch, not per-CPU
model.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
