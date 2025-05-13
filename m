Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp587495njb;
        Tue, 13 May 2025 08:09:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW/TAhAenWmsssZg3z2MCfjD7DolOlgGcUaw83whH1j+v1BI6d3zXUQ2kPZBJmqw9KCmS2QYk4cTNzkTA==@linaro.org
X-Google-Smtp-Source: AGHT+IHwjaVeJD6inR/i3QoJT77UiWk64q0OQU0ziUjZV63whgj+3jm/OKcNZ2TNXgNyDKy3//qj
X-Received: by 2002:a2e:9a09:0:b0:308:f5f0:c415 with SMTP id 38308e7fff4ca-326c453da39mr74724211fa.6.1747148948961;
        Tue, 13 May 2025 08:09:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747148948; cv=none;
        d=google.com; s=arc-20240605;
        b=TsJHE7Kn8jcyXsZEf45E3K7MO3AATNh3zdOxFiOm2xKwJNsOwm7h0k7loClik1LicC
         4P0unFlYVLXgXpmnlNV1YUkKX8IcWPqhf7XKtQ+hvBKcv2VjfI0IQOZH86gfvFBxjlob
         i4n6pbd2FLAK3QRiS2NulYiQit14S1NIZJ+/bI2GMDR9PdzDEZZqzinK6wU+Yp2iWrVo
         4wEJWq14onN5eXFpTHXvJUUDP0r0kMFizQnIpjuIGYimJG1xmePjf+I2pYNdUkvthpFQ
         NiT7+oFq/f6cM6hAuYSo5lrlmf+HdNfbvCuOcv5++VXkv4J2IyJiNhTtRExhLjpRQ4Xo
         QlsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=tsf45tDGJpQUW9ECsgv4qDKfMcOicJK49979YGwTnvk=;
        fh=Zh07SkXFY5KCsF4T0oNJcVly5rx+T5GsNOFhi1nXuCM=;
        b=K73fNeEQxhkDBd2bAJ9cOYvLSCpbNGs81qM0JHQU87ZG+X8on9O1V6q5C0YXGGnv2Q
         6N0qVzuXhsaKNdWZd0ZNM4m+JFGSuHSATJynhVIJEAiH7r6fc/7NF0vdtwl+x/lW6g4c
         gilvJZP2b7QpcVkEtJNh4FKpSSYoHjr2nLCgYeoVnBWQ906czi0GsVSZvx51YMt5TxtN
         inPUYoB6+efNII9S3/QhG5Lh4iJ5LgV/OQQm7RwdBeORh2u+SK9hGvwCBR11adzO2ivB
         ATul+gy4VO1ujl0C6qT4rQGn77Jh4E3/EkKPoHFagQihbrCo/Ayg4sRzc2Vz/acuC2ql
         Y6BA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Yrvm6Z+O;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 38308e7fff4ca-326c33a6950si43627131fa.26.2025.05.13.08.09.08
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 08:09:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Yrvm6Z+O;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747148947;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tsf45tDGJpQUW9ECsgv4qDKfMcOicJK49979YGwTnvk=;
	b=Yrvm6Z+ObhwB3gsARIaS/v7TZrbLvUxO/ZiI/G9MkXmfE13TXvTU1ToK3ZIBUhkllA7xNu
	5wgp/Jmzpqeq3J8bN0cSICdp2gnJNhbaPdXGoQq4KRTxlL0Xz5X+9Fs6KC8k8b+hTKxPsD
	x0xuvTLJkgrbMnZ+fA5f2jI/nMkdb+Y=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-208-192Ld4jENB6y1zFIffQ2Cg-1; Tue, 13 May 2025 11:09:06 -0400
X-MC-Unique: 192Ld4jENB6y1zFIffQ2Cg-1
X-Mimecast-MFC-AGG-ID: 192Ld4jENB6y1zFIffQ2Cg_1747148945
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-441c96c1977so37736435e9.0
        for <alex.bennee@linaro.org>; Tue, 13 May 2025 08:09:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747148945; x=1747753745;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tsf45tDGJpQUW9ECsgv4qDKfMcOicJK49979YGwTnvk=;
        b=aQ2yGcIWPM9O+ac+a810LBHWAlU6qkr7FmfHgp6IyvcyqoNNYr7w3RrT0wXDZMq0ak
         KOM6rdTRx2EMKG+vMnJ3MXhMzyVNXASzk2M2SbNm1JpkgZ6W+IzMHPSTa+PnpWmrSS2X
         kPdhdOV8jQlWanQlnt12hbQ8bkXwKNPB0Cv4PFbqcr4d0kuyIsvxkQwEFl5dhoEuq1Nl
         dCtUk66b880eReMUwugcRp9n/IFAfTUfbvlooz6CyNCPslgvdBcsbdpu9gGl4EfeuML8
         rgyumlzaudQvYlfPVDuTLQId03T/OV3KO1r+lTW3GWocqouXMCvxrNhQ7XJjbeWueKjS
         jZ3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWBj5tIhcN48f3UxMxjGrg7yeYNipwgMyz5VTIp6wig4Kwkk/4Giyy859/1VVqne3rBRN45q8od5bjVgw==@linaro.org
X-Gm-Message-State: AOJu0YzZEbtXn0KFxeNIMtWly6YJP+9JgfR4VSPbCHiEn3ER2LlYvQq2
	bMRFsAo28ukol2dxabsrDZ1TqQ/sL/Gz9cKpCgplreUbzx1Bijd2C5wgYu5c1SaFnrojOLYzk7r
	pu5Lyet8iUnIIIsWz4NMYVJI9RzwlQKnUVgYGWChAIyS673FVklLxTQ==
X-Gm-Gg: ASbGncsoLNOP3jKFyZXKJRdA1VnbZ/5JNcoIvPzqmzFaS31zXTi2Ve8ImaajVoA3DAf
	1wX6Fg8R4YFORwdmQOLHixbl1yWVXLk2oMrrwoC9EWA5KxZomQbzC8NbiEJiSVjsNJGM073Q4yH
	lqCtUp1evpZmF2PFkXFAADh0WlRItg7Df5lzwFs1YFu4SQQTdlkfbUpWroDM4wH1P3KG2g9qm0V
	Di39xa1LEqIKOZ05Q326Z7oYGTwtR/XFCWDQ8iis4Kk8buSzP9+o3KLdGOuZXTzpGOlwlOjYbEj
	7JWQii8UYKADG2TL5/UyO9b7mvQevHUXQSrPvgfeEaFMf01Z72E5DsI98v4=
X-Received: by 2002:a05:600c:384a:b0:43c:ea36:9840 with SMTP id 5b1f17b1804b1-442d6dd24a4mr147700005e9.22.1747148944932;
        Tue, 13 May 2025 08:09:04 -0700 (PDT)
X-Received: by 2002:a05:600c:384a:b0:43c:ea36:9840 with SMTP id 5b1f17b1804b1-442d6dd24a4mr147699335e9.22.1747148944357;
        Tue, 13 May 2025 08:09:04 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d687ad31sm170026065e9.34.2025.05.13.08.09.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 08:09:03 -0700 (PDT)
Message-ID: <131502e7-d487-48f6-84de-02a296116fb4@redhat.com>
Date: Tue, 13 May 2025 17:09:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v3 10/10] arm/cpu-features: document ID reg properties
To: Cornelia Huck <cohuck@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvmarm@lists.linux.dev,
 peter.maydell@linaro.org, richard.henderson@linaro.org,
 alex.bennee@linaro.org, maz@kernel.org, oliver.upton@linux.dev,
 sebott@redhat.com, shameerali.kolothum.thodi@huawei.com, armbru@redhat.com,
 berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com
Cc: agraf@csgraf.de, shahuang@redhat.com, mark.rutland@arm.com,
 philmd@linaro.org, pbonzini@redhat.com
References: <20250414163849.321857-1-cohuck@redhat.com>
 <20250414163849.321857-11-cohuck@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250414163849.321857-11-cohuck@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: csGCEAbin4QZfgH3z2YDsad7hiLzJ02qChXyS-JQtno_1747148945
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: ePqUJnaaduzv

Hi Connie,
On 4/14/25 6:38 PM, Cornelia Huck wrote:
> Add some documentation for how individual ID registers can be
> configured with the host cpu model.
>
> [CH: adapt to removal of the 'custom' model, added some more
>  explanations about using the ID register props]
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>  docs/system/arm/cpu-features.rst | 104 ++++++++++++++++++++++++++++---
>  1 file changed, 96 insertions(+), 8 deletions(-)
>
> diff --git a/docs/system/arm/cpu-features.rst b/docs/system/arm/cpu-features.rst
> index 37d5dfd15b34..22faefd76edd 100644
> --- a/docs/system/arm/cpu-features.rst
> +++ b/docs/system/arm/cpu-features.rst
> @@ -2,7 +2,10 @@ Arm CPU Features
>  ================
>  
>  CPU features are optional features that a CPU of supporting type may
> -choose to implement or not.  In QEMU, optional CPU features have
> +choose to implement or not.  QEMU provides two different mechanisms
> +to configure those features:
> +
> +1. For most CPU models, optional CPU features may have
>  corresponding boolean CPU proprieties that, when enabled, indicate
>  that the feature is implemented, and, conversely, when disabled,
>  indicate that it is not implemented. An example of an Arm CPU feature
> @@ -29,6 +32,16 @@ supports the feature.  While ``aarch64`` currently only works with KVM,
>  it could work with TCG.  CPU features that are specific to KVM are
>  prefixed with "kvm-" and are described in "KVM VCPU Features".
>  
> +2. Additionally, the ``host`` CPU model on KVM allows to configure optional
> +CPU features via the corresponding ID registers. The host kernel allows
> +to write a subset of ID register fields. The host model exposes
> +properties for each writable ID register field. Those options are named
> +SYSREG_<IDREG>_<FIELD>. IDREG and FIELD names are those used in the
> +ARM ARM Reference Manual. They can also be found in the Linux
> +arch/arm64/tool/sysreg file which is used to automatically generate the
> +description for those registers and fields. This currently only has been
> +implemented for KVM.
> +
>  CPU Feature Probing
>  ===================
>  
> @@ -124,13 +137,20 @@ A note about CPU models and KVM
>  
>  Named CPU models generally do not work with KVM.  There are a few cases
>  that do work, e.g. using the named CPU model ``cortex-a57`` with KVM on a
> -seattle host, but mostly if KVM is enabled the ``host`` CPU type must be
> -used.  This means the guest is provided all the same CPU features as the
> -host CPU type has.  And, for this reason, the ``host`` CPU type should
> -enable all CPU features that the host has by default.  Indeed it's even
> -a bit strange to allow disabling CPU features that the host has when using
> -the ``host`` CPU type, but in the absence of CPU models it's the best we can
> -do if we want to launch guests without all the host's CPU features enabled.
> +seattle host, but mostly if KVM is enabled, the ``host`` CPU model must be
> +used.
> +
> +Using the ``host`` type means the guest is provided all the same CPU
> +features as the host CPU type has.  And, for this reason, the ``host``
> +CPU type should enable all CPU features that the host has by default.
> +
> +In case some features need to be hidden to the guest, and the host kernel
> +supports it, the ``host`` model can be instructed to disable individual
> +ID register values. This is especially useful for migration purposes.
> +However, this interface will not allow configuring an arbitrary set of
> +features; the ID registers must describe a subset of the host's features,
> +and all differences to the host's configuration must actually be supported
> +by the kernel to be deconfigured.
>  
>  Enabling KVM also affects the ``query-cpu-model-expansion`` QMP command.  The
>  affect is not only limited to specific features, as pointed out in example
> @@ -167,6 +187,13 @@ disabling many SVE vector lengths would be quite verbose, the ``sve<N>`` CPU
>  properties have special semantics (see "SVE CPU Property Parsing
>  Semantics").
>  
> +Additionally, if supported by KVM on the host kernel, the ``host`` CPU model
> +may be configured via individual ID register field properties, for example::
> +
> +  $ qemu-system-aarch64 -M virt -cpu host,SYSREG_ID_AA64ISAR0_EL1_DP=0x0
> +
> +This forces ID_AA64ISAR0_EL1 DP field to 0.
> +
>  KVM VCPU Features
>  =================
>  
> @@ -466,3 +493,64 @@ Legal values for ``S`` are 30, 34, 36, and 39; the default is 30.
>  
>  As with ``x-rme``, the ``x-l0gptsz`` property may be renamed or
>  removed in some future QEMU release.
> +
> +Configuring CPU features via ID register fields
> +===============================================
> +
> +Note that this is currently only supported under KVM, and with the
> +``host`` CPU model.
> +
> +Querying available ID register fields
> +-------------------------------------
> +
> +QEMU will create properties for all ID register fields that are
> +reported as being writable by the kernel, and that are known to the
> +QEMU instance. Therefore, the same QEMU binary may expose different
> +properties when run under a different kernel.
> +
> +To find out all available writable ID register fields, use the
> +``query-cpu-model-expansion`` QMP command::
> +
> +  (QEMU) query-cpu-model-expansion type=full model={"name":"host"}
> +  {"return": {
> +   "model": {"name": "host", "props": {
> +   "SYSREG_ID_AA64PFR0_EL1_EL3": 1, "SYSREG_ID_AA64ISAR2_EL1_CLRBHB": 0,
> +   "SYSREG_CTR_EL0_L1Ip": 3, "SYSREG_CTR_EL0_DminLine": 4,
> +   "SYSREG_ID_AA64MMFR0_EL1_BIGEND": 1, "SYSREG_ID_AA64MMFR1_EL1_ECBHB": 0,
> +   "SYSREG_ID_AA64MMFR2_EL1_CnP": 1, "SYSREG_ID_DFR0_EL1_PerfMon": 4,
> +   "SYSREG_ID_AA64PFR0_EL1_DIT": 0, "SYSREG_ID_AA64MMFR1_EL1_HAFDBS": 2,
> +   "SYSREG_ID_AA64ISAR0_EL1_FHM": 0, "SYSREG_ID_AA64ISAR2_EL1_CSSC": 0,
> +   "SYSREG_ID_AA64ISAR0_EL1_DP": 1, (...)
> +   }}}}
> +
> +If a certain field in an ID register does not show up in this list, it
> +is not writable with the specific host kernel.
> +
> +A note on compatibility
> +-----------------------
> +
> +A common use case for providing a defined set of ID register values is
> +to be able to present a fixed set of features to a guest, often referred
> +to as "stable guest ABI". This may take the form of ironing out differences
> +between two similar CPUs with the intention of being able to migrate
> +between machines with those CPUs, or providing the same CPU across Linux
> +kernel updates on the host.
> +
> +Over the course of time, the Linux kernel is changing the set of ID register
> +fields that are writable by userspace. Newly introduced writable ID
> +registers should be initialized to 0 to ensure compatibility. However, ID
why 0? shouldn't they just be ommitted from the explicit command line?
> +registers that have already been introduced that undergo a change as to
> +which fields are writable may introduce incompatibities that need to be
Aren't incompatibilities due to changed default values only. The fact a
new writable field gets exposed does not change the default value in
general. If it was not exposed before, the end user couldn't change its
value, no?

Thanks

Eric
> +addressed on a case-by-case basis for the systems that you wish to migrate
> +inbetween.
> +
> +A note on Arm CPU features (FEAT_xxx)
> +-------------------------------------
> +
> +Configuring CPUs is done on a feature level on other architectures, and this
> +would imply configuring FEAT_xxx values on Arm. However, differences between
> +CPUs may not map to FEAT_xxx, but to differences in other registers in the
> +ID register range; for example, differences in the cache architecture exposed
> +via ``CTR_EL0``. We therefore cannot rely on configuration via FEAT_xxx. A
> +feature-based interface more similar to other architectures may be implemented
> +on top of the ID register interface in the future.
