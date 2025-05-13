Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp564500njb;
        Tue, 13 May 2025 07:33:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVGjwKyq4w6h2pLoCy4fWX0qaw9FiAObRZj4DvLr5YflLDfJpHrHodm05RLGYPU176CMN2iZCRz9R8JLg==@linaro.org
X-Google-Smtp-Source: AGHT+IGnw3Vvbu9Z+mVa6P3tVi8EB7iRtQUitd+ZPV5wEbtWDnWqjQsJqSNLv7XAoAEEYQMDc0QZ
X-Received: by 2002:ad4:5e88:0:b0:6f5:117c:76cf with SMTP id 6a1803df08f44-6f6e48408c9mr247402026d6.40.1747146831046;
        Tue, 13 May 2025 07:33:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747146831; cv=none;
        d=google.com; s=arc-20240605;
        b=C98eCWLvaJlfvJ3GnjgO7IhOhGfVK8P6zaOcVgJCF7MUb0v/a9AIjOtSYc7GEPxVnh
         FgzU1NtXcg4G8XPK+4NdRY5NKY1MkqRm6jiMjTiGkzpJSg0aRJDnrNXMnTlYFoJ0HRfk
         2dwuoahv2QdFOPRunp5ca6J1BZn8Z9xR6Ziu0LM8+1BX6qza4QDfVWWJV3aGVuFS8XJi
         xOcSPCNMPUl4Cb6f52Mc6FuLVSrzAEM7P8R8GE6jFvODnZMFj7kvqCqqFtjJ7g8hP1f7
         0+gkvQiOkTHP9ZCYMBYSJBDP/oqA/sqGtAtibSUTFfxMdpSbKuIcFvrHLhm41JmlJxmC
         fBng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=y909bR0YHzufKEcfXdMfMZPq0NlMISVrbvKpfk9Zrzg=;
        fh=zecEpyJ1UmWvDnnxppKKCwS03Cz3gchhpY94+2OkTJU=;
        b=fiXjrR2lP4XKH9923VEnCUdicIkgqOQmusncwYvZZwCb6uupMVAuOXXRA/cwmXg7bQ
         8yptOAvhZ0PXd24qWQnnX5e4IiqP/1XTUtEGjM6pdF2zWonp7560mZWIKQLXOLstEate
         6e6Ucv/1VdYrf4roMmut7ozNO/Eso+Va9Ur5yOhqiU+fytVpaqYAeYDzgcj/CEeMwgXK
         DUn3PEK1J+oD2Zja98J01o8uvWpjyQwWeF419uTpLbh85TNPYY+zyunj32hyKCoMRd+y
         JV1XfESCbB8JQHtp8bnjaOGoXelBYSraa79x6u+/y4XWUaLqExVJ1/KA38fSdteY4+bm
         /X0w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BrtAd9qk;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f6e3a6484fsi120000776d6.488.2025.05.13.07.33.50
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 07:33:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=BrtAd9qk;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747146830;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=y909bR0YHzufKEcfXdMfMZPq0NlMISVrbvKpfk9Zrzg=;
	b=BrtAd9qkmlGr4f7vMqz9uZySpp+g+enCvZIp4viJEMbo+FSfyRoOtqk5xrto7yITIHlkZS
	JuzQOkcCFuVBeTzGnw/9jv9hRyWkIigd4B+XduoXN6j374DKVf/9RyAgs7jENGSjtK4hEe
	devzQSpAXVHpgJvJrSsjHmZ5BTJtgL0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-175-GO_vmVkwOCaqw7V0k8blxg-1; Tue, 13 May 2025 10:33:49 -0400
X-MC-Unique: GO_vmVkwOCaqw7V0k8blxg-1
X-Mimecast-MFC-AGG-ID: GO_vmVkwOCaqw7V0k8blxg_1747146828
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43cf446681cso30858765e9.1
        for <alex.bennee@linaro.org>; Tue, 13 May 2025 07:33:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747146828; x=1747751628;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y909bR0YHzufKEcfXdMfMZPq0NlMISVrbvKpfk9Zrzg=;
        b=A6DhbePfXW0Eo7/yaY/ygqH8T4BpXP5EVlqiLeceCWOLvgO71+sYz1YCPm6EfEnent
         +y8s78Gl6F3kchWGYP9rE4gNZDfn92Opeo5FTDkxjaFBgBQhI8kS1vNyjpTHGhgCXqwH
         n+lzpj2wI4FjZ8Wx8vY2hO5uBUXnhBF5wyLFDHgkUr/iUwCsFpyCGerPfLTdwH3GD5tW
         GFdKBJOsmSoXS7e3yxMOjrZN5h2LDHKJpCrtqzq3WMUu8qEPzEBJSGara/RbVVDzINR/
         PK5CkwrmL0QmI90U0MBcOWdFxOCtvslNCbMcjqOIOviPQ255HeXKOnYKBIiNyct998Rd
         cOGQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEVthD9YmRuFpfJ0bjeg/GMhPLLsHiz/9DSEB/3EFrTvhakc5kt4uRwua8xIKocR263vjcuHLhLSg+mA==@linaro.org
X-Gm-Message-State: AOJu0YzU9a1pu9zVrW/0K3T38V8BQSFuxGz58dfWUxcmJDZ+U/SU7bd6
	G7WuVOUwefkR+09SSTLqITBZpEKk99AdG1WSJPxGzD7KWNXXpUglw3vDvNwEe99yHiFzrsU5Oyv
	IwTBFlHfBmq5/1d0H5RQD7viPT7CuEp+4V8e+i0mGI9oyr/h1npEWNQ==
X-Gm-Gg: ASbGnctyfVWP+XsC0HX+Z873c4x2OSwJpVZfgtBz+IOK1Q83F8FMU6rEAKvJZoktGY0
	eg+jsY/DHPhYUu8W7gK0AwVtIJ9G2MNffDPCzKR44B2/bnRpdKJSY+drTqKPOp2u/FY9fXdzIyR
	wVgHzNRds0+RxPGM4zQEeQWwDmVHvprzZ25zUAx/RbRnHcy95O4zxTl71Z2TFYCvE7EID81Qb1E
	7ZE1O/l1EBIrFWd1s+2GCTTZ+IuzKNEJwFBNeIH2e0WEOc7XMgJR8EqY0+vCQNtcOldZTk7pBk+
	bM6A5+sinbogbtzr6JiwTjxpoS/s9U6BK050V3DKDkPOy7JvD+z9Zh1WWaA=
X-Received: by 2002:a05:600c:4f53:b0:440:61eb:2ce5 with SMTP id 5b1f17b1804b1-442d9a0db9cmr143579035e9.17.1747146828129;
        Tue, 13 May 2025 07:33:48 -0700 (PDT)
X-Received: by 2002:a05:600c:4f53:b0:440:61eb:2ce5 with SMTP id 5b1f17b1804b1-442d9a0db9cmr143578685e9.17.1747146827672;
        Tue, 13 May 2025 07:33:47 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874? ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d687ad31sm168969195e9.34.2025.05.13.07.33.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 07:33:47 -0700 (PDT)
Message-ID: <412f69cc-a54a-496e-bee7-e80dc1246a42@redhat.com>
Date: Tue, 13 May 2025 16:33:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v3 07/10] arm/kvm: write back modified ID regs to KVM
To: Cornelia Huck <cohuck@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, kvmarm@lists.linux.dev,
 peter.maydell@linaro.org, richard.henderson@linaro.org,
 alex.bennee@linaro.org, maz@kernel.org, oliver.upton@linux.dev,
 sebott@redhat.com, shameerali.kolothum.thodi@huawei.com, armbru@redhat.com,
 berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com
Cc: agraf@csgraf.de, shahuang@redhat.com, mark.rutland@arm.com,
 philmd@linaro.org, pbonzini@redhat.com
References: <20250414163849.321857-1-cohuck@redhat.com>
 <20250414163849.321857-8-cohuck@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250414163849.321857-8-cohuck@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GHURRBQm72jV6gH-OX1p53gBrFa_t1Jy1HM_LDjiwYI_1747146828
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TUID: /E3BT+u1nMMw



On 4/14/25 6:38 PM, Cornelia Huck wrote:
> From: Eric Auger <eric.auger@redhat.com>
>
> We want to give a chance to override the value of host ID regs.
> In a previous patch we made sure all their values could be fetched
> through kvm_get_one_reg() calls before their modification. After
> their potential modification we need to make sure we write back
nit: write their value back?

Eric
> the values through kvm_set_one_reg() calls.
>
> Make sure the cpreg_list is modified with updated values and
> transfer those values back to kvm.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>  target/arm/kvm.c        | 44 ++++++++++++++++++++++++++++++++++++++++-
>  target/arm/trace-events |  1 +
>  2 files changed, 44 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index b07d5f16db50..9e4cca1705c8 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -1083,6 +1083,39 @@ void kvm_arm_cpu_post_load(ARMCPU *cpu)
>      }
>  }
>  
> +static void kvm_arm_writable_idregs_to_cpreg_list(ARMCPU *cpu)
> +{
> +    if (!cpu->writable_map) {
> +        return;
> +    }
> +    for (int i = 0; i < NR_ID_REGS; i++) {
> +        uint64_t writable_mask = cpu->writable_map->regs[i];
> +        uint64_t *cpreg;
> +
> +        if (writable_mask) {
> +            uint64_t previous, new;
> +            int idx = kvm_idx_to_idregs_idx(i);
> +            ARM64SysReg *sysregdesc;
> +            uint32_t sysreg;
> +
> +            if (idx == -1) {
> +                /* sysreg writable, but we don't know it */
> +                continue;
> +            }
> +            sysregdesc = &arm64_id_regs[idx];
> +            sysreg = sysregdesc->sysreg;
> +            cpreg = kvm_arm_get_cpreg_ptr(cpu, idregs_sysreg_to_kvm_reg(sysreg));
> +            previous = *cpreg;
> +            new = cpu->isar.idregs[idx];
> +            if (previous != new) {
> +                *cpreg = new;
> +                trace_kvm_arm_writable_idregs_to_cpreg_list(sysregdesc->name,
> +                                                            previous, new);
> +            }
> +        }
> +    }
> +}
> +
>  void kvm_arm_reset_vcpu(ARMCPU *cpu)
>  {
>      int ret;
> @@ -2050,7 +2083,16 @@ int kvm_arch_init_vcpu(CPUState *cs)
>      }
>      cpu->mp_affinity = mpidr & ARM64_AFFINITY_MASK;
>  
> -    return kvm_arm_init_cpreg_list(cpu);
> +    ret = kvm_arm_init_cpreg_list(cpu);
> +    if (ret) {
> +        return ret;
> +    }
> +    /* overwrite writable ID regs with their updated property values */
> +    kvm_arm_writable_idregs_to_cpreg_list(cpu);
> +
> +    write_list_to_kvmstate(cpu, 3);
> +
> +    return 0;
>  }
>  
>  int kvm_arch_destroy_vcpu(CPUState *cs)
> diff --git a/target/arm/trace-events b/target/arm/trace-events
> index 17e52c0705f2..955149ee1ac4 100644
> --- a/target/arm/trace-events
> +++ b/target/arm/trace-events
> @@ -14,3 +14,4 @@ arm_gt_update_irq(int timer, int irqstate) "gt_update_irq: timer %d irqstate %d"
>  # kvm.c
>  kvm_arm_fixup_msi_route(uint64_t iova, uint64_t gpa) "MSI iova = 0x%"PRIx64" is translated into 0x%"PRIx64
>  get_host_cpu_idregs(const char *name, uint64_t value) "scratch vcpu host value for %s is 0x%"PRIx64
> +kvm_arm_writable_idregs_to_cpreg_list(const char *name, uint64_t previous, uint64_t new) "%s overwrite default 0x%"PRIx64" with 0x%"PRIx64
