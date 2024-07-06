Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp1790570njb;
        Sat, 6 Jul 2024 07:37:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW92FQIp+9aTym3i38r29acQU+ui85GjxFn720B2zx/XWzos0+XQGGIwpRYP/gBsKA1n0MuXiTcUzUPiDTnSAzyPHqpMV/A
X-Google-Smtp-Source: AGHT+IH0nP7+al65CzCeOtWu0m+BkS9aXj5GzYt/8DfZZ2ldVCcFk6DWR2gy/mlU67HznXOI85JO
X-Received: by 2002:a05:6214:f02:b0:6b2:da3d:999f with SMTP id 6a1803df08f44-6b5ed0267b7mr87380136d6.41.1720276633225;
        Sat, 06 Jul 2024 07:37:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720276633; cv=none;
        d=google.com; s=arc-20160816;
        b=OIMJtLk/3/ZZ5FHhyt44nyHAiHlFWwfMVN5OV5ZZqPgp1NBnB+gIqw8+ov5p9qfTMY
         m5JI+ZRaJbB/z5gNkt6AbxrgWJsGOD9w2nUShp6EfMcidtuewPsN+JweGVlAUTYgKfxb
         Bytjswqqzcw5oumcoLL4ku9AiG2zpIV5PqwbCnm6gynX4jFsjdjOnKW9eWRlYFr+Xlbo
         CJlaaxx5rWDn6lnI5t3MXJSGE1/QRIv9lDwJGzcOQRxMVy2uB8+g6QKhgJGtmPJd7pS0
         Zdq7SXEroCa9sli8Pk6SywHEksdhBtH0NOSFfrrfJc78FKo+s0oIs7bAv1+BH3DWrDRF
         bl8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=OYIR22Y6ur7dGuiM4dyqKXye/Kx4OeEC8Q7B/SkT5So=;
        fh=DKnmW1/YerYWw/ZmSzwi50QptCCa44jjF2BbHfZKcmE=;
        b=KTVyohBHo71g68eyEAguiWT2N5ikBl3XVhKEC68OMu8m9K6hVVLNOaEja5CLWOd1sR
         q48SkWpjHJ2e17J1+cULtV2LFTsM2IrHmMhgwLli2Zh+b1jfFAJGg24DycqY67r9PJRQ
         Q7VzAPULlv4zzvCpIDJJsismCdhA5EJ2I48Cxic0+5xEzlAzbEdsjSytacmgsB30PedS
         2nZmnEF2RQRtQ1xZmlU0Em2spJHJbaPOwh//aNgpTEA1Mcq69khTZJSm6hVmahNXqP8J
         4m1uOqiu2TCGsOzNmDE8K4BVUJwMawhpbirOEDzXfq1OX1B40VgcsBnGYZthfPXw3B8a
         O7dA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=au3APc4Q;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b5d9510ae0si102176796d6.256.2024.07.06.07.37.13
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jul 2024 07:37:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=au3APc4Q;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720276632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OYIR22Y6ur7dGuiM4dyqKXye/Kx4OeEC8Q7B/SkT5So=;
	b=au3APc4Q1X7rdQCeDngCeXZ3N9RFq5kHeWZIsIJuFmnYiJGQwYUBi0a3ctv84lPve+SnB3
	MhG9LE6pAr2obRSmn9zCtS2EmcI2rtms8LbS/l/XFymess4xJtZX9moU9PHOwq9k4vWs38
	9m6AxjG1QBmazR1Kq+Q6wA4RzOp3Ui8=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-UGfYR-rmO0O399hLTKmWYA-1; Sat, 06 Jul 2024 10:37:09 -0400
X-MC-Unique: UGfYR-rmO0O399hLTKmWYA-1
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-52ea0d8adfcso2545593e87.0
        for <alex.bennee@linaro.org>; Sat, 06 Jul 2024 07:37:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720276628; x=1720881428;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OYIR22Y6ur7dGuiM4dyqKXye/Kx4OeEC8Q7B/SkT5So=;
        b=bR3Rfm+Pn9tUydKeTZSsj2faKpW/XMOKN8k8haTHL5AqSPcJTMINJqZjYcqe6zMQB8
         BuzNu2jkAs8he5MomnBzYaGY4YXv/XpagY7Jtuf6CZWdd0+C55o8UyRVHtDMG9U5ao3e
         IgoPCJaLdveUCVlen/nwireFFyV5u9cQ5bXPKkG3kD0UHG6ZZtih5d8VkCuEuMjBJ6xf
         VGcH4WVOzr1Dcyny47vvXllbJk3aOFvrVcXPCKiNW2WdHyID+YHxK/2c48kSGIDSWHfm
         8kpUlN9oHfzjxXVXz4P1+FvOwAOILAJxfhYXxeZ2h/Sh9xIPcluM4fxiriZwfTI5osx3
         5SVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVR4t+jp4f7sCGjxv1IdfkORG2zQDcvqE/NlnesOu9WK2kzE6nNLANQfK6WZBHzz6PYXqBTRN//2GUs3NaI/lk57oC60bgS
X-Gm-Message-State: AOJu0YylUzPJyiClg7coVtUbsQxyQPXgz/x3SNO6c8HHCWdSktgYQdXU
	pLlcY0TISdjH7+9QT74RIn1q+t5o4VKFpP3sWkASndfTVKmRmAVDTGvadsTFuw4Up2Xj6zJPvB4
	v212aPdxRBQtnydngPJIwaXKTwcKVeVV0vjFZ/NbJvwjcmA5VNPQseQ==
X-Received: by 2002:ac2:5dca:0:b0:52c:d84c:1182 with SMTP id 2adb3069b0e04-52ea06e62e3mr4360098e87.64.1720276627963;
        Sat, 06 Jul 2024 07:37:07 -0700 (PDT)
X-Received: by 2002:ac2:5dca:0:b0:52c:d84c:1182 with SMTP id 2adb3069b0e04-52ea06e62e3mr4360084e87.64.1720276627476;
        Sat, 06 Jul 2024 07:37:07 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a21cbc6sm99529345e9.24.2024.07.06.07.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jul 2024 07:37:07 -0700 (PDT)
Date: Sat, 6 Jul 2024 16:37:04 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Salil Mehta <salil.mehta@huawei.com>
Cc: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <maz@kernel.org>,
 <jean-philippe@linaro.org>, <jonathan.cameron@huawei.com>,
 <lpieralisi@kernel.org>, <peter.maydell@linaro.org>,
 <richard.henderson@linaro.org>, <andrew.jones@linux.dev>,
 <david@redhat.com>, <philmd@linaro.org>, <eric.auger@redhat.com>,
 <oliver.upton@linux.dev>, <pbonzini@redhat.com>, <mst@redhat.com>,
 <will@kernel.org>, <gshan@redhat.com>, <rafael@kernel.org>,
 <alex.bennee@linaro.org>, <linux@armlinux.org.uk>,
 <darren@os.amperecomputing.com>, <ilkka@os.amperecomputing.com>,
 <vishnu@os.amperecomputing.com>, <karl.heubaum@oracle.com>,
 <miguel.luis@oracle.com>, <salil.mehta@opnsrc.net>,
 <zhukeqian1@huawei.com>, <wangxiongfeng2@huawei.com>,
 <wangyanan55@huawei.com>, <jiakernel2@gmail.com>, <maobibo@loongson.cn>,
 <lixianglai@loongson.cn>, <npiggin@gmail.com>, <harshpb@linux.ibm.com>,
 <linuxarm@huawei.com>, Shaoqin Huang <shahuang@redhat.com>, Zhao Liu
 <zhao1.liu@intel.com>
Subject: Re: [PATCH V13 6/8] physmem: Add helper function to destroy CPU
 AddressSpace
Message-ID: <20240706163704.524ba618@imammedo.users.ipa.redhat.com>
In-Reply-To: <20240607115649.214622-7-salil.mehta@huawei.com>
References: <20240607115649.214622-1-salil.mehta@huawei.com>
	<20240607115649.214622-7-salil.mehta@huawei.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.42; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: s/r6jIzgNbPe

On Fri, 7 Jun 2024 12:56:47 +0100
Salil Mehta <salil.mehta@huawei.com> wrote:

> Virtual CPU Hot-unplug leads to unrealization of a CPU object. This also
> involves destruction of the CPU AddressSpace. Add common function to help
> destroy the CPU AddressSpace.
> 
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Xianglai Li <lixianglai@loongson.cn>
> Tested-by: Miguel Luis <miguel.luis@oracle.com>
> Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
> Tested-by: Zhao Liu <zhao1.liu@intel.com>


Acked-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  include/exec/cpu-common.h |  8 ++++++++
>  include/hw/core/cpu.h     |  1 +
>  system/physmem.c          | 29 +++++++++++++++++++++++++++++
>  3 files changed, 38 insertions(+)
> 
> diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
> index 815342d043..240ee04369 100644
> --- a/include/exec/cpu-common.h
> +++ b/include/exec/cpu-common.h
> @@ -129,6 +129,14 @@ size_t qemu_ram_pagesize_largest(void);
>   */
>  void cpu_address_space_init(CPUState *cpu, int asidx,
>                              const char *prefix, MemoryRegion *mr);
> +/**
> + * cpu_address_space_destroy:
> + * @cpu: CPU for which address space needs to be destroyed
> + * @asidx: integer index of this address space
> + *
> + * Note that with KVM only one address space is supported.
> + */
> +void cpu_address_space_destroy(CPUState *cpu, int asidx);
>  
>  void cpu_physical_memory_rw(hwaddr addr, void *buf,
>                              hwaddr len, bool is_write);
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index bb398e8237..60b160d0b4 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -486,6 +486,7 @@ struct CPUState {
>      QSIMPLEQ_HEAD(, qemu_work_item) work_list;
>  
>      struct CPUAddressSpace *cpu_ases;
> +    int cpu_ases_count;
>      int num_ases;
>      AddressSpace *as;
>      MemoryRegion *memory;
> diff --git a/system/physmem.c b/system/physmem.c
> index 342b7a8fd4..146f17826a 100644
> --- a/system/physmem.c
> +++ b/system/physmem.c
> @@ -763,6 +763,7 @@ void cpu_address_space_init(CPUState *cpu, int asidx,
>  
>      if (!cpu->cpu_ases) {
>          cpu->cpu_ases = g_new0(CPUAddressSpace, cpu->num_ases);
> +        cpu->cpu_ases_count = cpu->num_ases;
>      }
>  
>      newas = &cpu->cpu_ases[asidx];
> @@ -776,6 +777,34 @@ void cpu_address_space_init(CPUState *cpu, int asidx,
>      }
>  }
>  
> +void cpu_address_space_destroy(CPUState *cpu, int asidx)
> +{
> +    CPUAddressSpace *cpuas;
> +
> +    assert(cpu->cpu_ases);
> +    assert(asidx >= 0 && asidx < cpu->num_ases);
> +    /* KVM cannot currently support multiple address spaces. */
> +    assert(asidx == 0 || !kvm_enabled());
> +
> +    cpuas = &cpu->cpu_ases[asidx];
> +    if (tcg_enabled()) {
> +        memory_listener_unregister(&cpuas->tcg_as_listener);
> +    }
> +
> +    address_space_destroy(cpuas->as);
> +    g_free_rcu(cpuas->as, rcu);
> +
> +    if (asidx == 0) {
> +        /* reset the convenience alias for address space 0 */
> +        cpu->as = NULL;
> +    }
> +
> +    if (--cpu->cpu_ases_count == 0) {
> +        g_free(cpu->cpu_ases);
> +        cpu->cpu_ases = NULL;
> +    }
> +}
> +
>  AddressSpace *cpu_get_address_space(CPUState *cpu, int asidx)
>  {
>      /* Return the AddressSpace corresponding to the specified index */
