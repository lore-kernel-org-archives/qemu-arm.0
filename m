Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp1676268ejb;
        Mon, 2 Oct 2023 18:36:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhG5HF8bsj7N67aX0pkTQanYpaAQlWTIfFQdFzrqkMd9+6F4ZvJBRk8ye5JXk0/XtrXCoA
X-Received: by 2002:a05:6512:400c:b0:4fb:a088:cfca with SMTP id br12-20020a056512400c00b004fba088cfcamr1202656lfb.6.1696297012217;
        Mon, 02 Oct 2023 18:36:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696297012; cv=none;
        d=google.com; s=arc-20160816;
        b=RqgVZCr3oapyXBAWHtcuI3kMnBUXw8uvdJny8I20QFAoTN+L/8zDsgFf2wNWD/it/1
         D5gIKsRglXATuH67T5MxXAhd8yh4/0ZpNdeO7A+TgvCuFMevHXR8Lfrxk6SXMrnpryKx
         Zc7zUnnTauZA9ObvgmtDE6hXRoSCrgXSPSnMeRuRhwWAQFmvv5C/2kxCZHYsaMUngN9e
         HxYd22l62JeZ/b5+6rW05/AA3kdm3xCawcMn7oCscwIJYJcAZA3yrjzUlWZqsMvmjA1f
         KMepzWRJZG9uql8vGhpVjchQPcsYG0PRxtrbbW85+Qm17AcVIDaKjHH8OuT5Zp9EYVHo
         uokg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=xTv0J1qp9acbOQ+Hqz/QicTRToQwM0piQLmWmZTl0ko=;
        fh=UoUFvcIH1Llqwj9lcubayb9wLqiblQuJi8py3jS56vc=;
        b=xR1yGwCHsw9q+C4FY8/yvyZdeKuQ6jYxR/lN18pMQoBpgZoUL4dwH6qbikjjcxb4B7
         OD7BQakAPHJe2QjCEsyv3AhZaIbFML5j6P/yiR8G3ZnxNgNh+BeCwDVfYm5/xnaPulCJ
         4QInBjGGzc3hHOyEBEqbl6wGJ/MnQ8sWjsxmuQNHJNWBoEXN9zmi9IebD4VJYQfnlVyr
         sDlpa4TNoYhin0m2IzWr9JKqGlXyitl7WjOXUOlv8TcdbnyvxDedl7eznm2pUoOE7Cib
         wfHQta28glf5aP9NH3bPvwacZlQjB6Vbk3lrXMmFijMk4YW3zVrLVyYq3qghfUE/vF7s
         MBZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=c79zhytJ;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <gshan@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id s8-20020ac25fa8000000b004f628d74d4csi51731lfe.107.2023.10.02.18.36.51
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Oct 2023 18:36:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=c79zhytJ;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1696297010;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xTv0J1qp9acbOQ+Hqz/QicTRToQwM0piQLmWmZTl0ko=;
	b=c79zhytJvSRN1WNRM/y4hyJHKHAjv1ReCZzeZz0TC1vVcGOiGd+ZV/Lad97YboC1LW7+6u
	rEhG19zs4JlrzhomHnEuM/EkSROH3IJmchM7zzxi/WDFdudtVdCA96XueByKky66o687NI
	SSCAU3+1pQGNJRuW0aarW1kxlBGp/1Y=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-500-essi8dHJMA2gVevsc0Lrww-1; Mon, 02 Oct 2023 21:36:49 -0400
X-MC-Unique: essi8dHJMA2gVevsc0Lrww-1
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-573fdb618eeso339200a12.0
        for <alex.bennee@linaro.org>; Mon, 02 Oct 2023 18:36:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696297008; x=1696901808;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xTv0J1qp9acbOQ+Hqz/QicTRToQwM0piQLmWmZTl0ko=;
        b=mzLta56Kd+26LckARDvhaA5FulBixK/DJ3tpokh6LzDTSxcHxb8az4i/DFe5yKuiNo
         BqsfWmr7J8XsxcN2dTlWSPc6KrD+1vgmhoAtPUG+IJUo78/RdWE7NRL5QGz7HWXtJOOe
         gH6uB4ivLOds80aVI5QCqefFEW3xcBQ9kN0kU1H8Lmn9a+89XtPQnYH8neTzcmcAma3P
         HHiSP+MWvP1ysRFJ7LINJAL7EzTvnx0m41saRg+cEPGTap2vXJdvS1hphJZECiIM3vnX
         lbfYoLhQY1qZX6+/b07zPzaHbQkRy3iRoaxiJWa4SOi7zRD5kqGqzhu7lJPRelH5n64q
         n1FQ==
X-Gm-Message-State: AOJu0Ywg6mXZBKMTDhL38iizFjVKQyeTzCwo/huQFEqlfeyiiLsI1z2G
	XuE/gpO4kGxGaNtCwRqwzUroVcXo1KwKmqeiGFpG4zrsamRs/6IOSfPu8bwpvDFswyM5rQwJ54M
	ov7/TEsmHoQOfLfXh
X-Received: by 2002:a05:6a20:3d21:b0:15e:7323:5c0f with SMTP id y33-20020a056a203d2100b0015e73235c0fmr16503292pzi.16.1696297007944;
        Mon, 02 Oct 2023 18:36:47 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d21:b0:15e:7323:5c0f with SMTP id y33-20020a056a203d2100b0015e73235c0fmr16503273pzi.16.1696297007608;
        Mon, 02 Oct 2023 18:36:47 -0700 (PDT)
Return-Path: <gshan@redhat.com>
Received: from ?IPV6:2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5? ([2001:8003:e5b0:9f00:dbbc:1945:6e65:ec5])
        by smtp.gmail.com with ESMTPSA id jk12-20020a170903330c00b001c6189ce950sm111426plb.188.2023.10.02.18.36.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Oct 2023 18:36:47 -0700 (PDT)
Message-ID: <bc5e5558-8899-30d1-e64a-c1012437766e@redhat.com>
Date: Tue, 3 Oct 2023 11:36:34 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH V2 08/10] physmem: Add helper function to destroy CPU
 AddressSpace
To: Salil Mehta <salil.mehta@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: maz@kernel.org, jean-philippe@linaro.org, jonathan.cameron@huawei.com,
 lpieralisi@kernel.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, imammedo@redhat.com, andrew.jones@linux.dev,
 david@redhat.com, philmd@linaro.org, eric.auger@redhat.com,
 oliver.upton@linux.dev, pbonzini@redhat.com, mst@redhat.com,
 will@kernel.org, rafael@kernel.org, alex.bennee@linaro.org,
 linux@armlinux.org.uk, darren@os.amperecomputing.com,
 ilkka@os.amperecomputing.com, vishnu@os.amperecomputing.com,
 karl.heubaum@oracle.com, miguel.luis@oracle.com, salil.mehta@opnsrc.net,
 zhukeqian1@huawei.com, wangxiongfeng2@huawei.com, wangyanan55@huawei.com,
 jiakernel2@gmail.com, maobibo@loongson.cn, lixianglai@loongson.cn,
 linuxarm@huawei.com
References: <20230930001933.2660-1-salil.mehta@huawei.com>
 <20230930001933.2660-9-salil.mehta@huawei.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20230930001933.2660-9-salil.mehta@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: kz1B38EXdClr

On 9/30/23 10:19, Salil Mehta wrote:
> Virtual CPU Hot-unplug leads to unrealization of a CPU object. This also
> involves destruction of the CPU AddressSpace. Add common function to help
> destroy the CPU AddressSpace.
> 
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> ---
>   include/exec/cpu-common.h |  8 ++++++++
>   include/hw/core/cpu.h     |  1 +
>   softmmu/physmem.c         | 25 +++++++++++++++++++++++++
>   3 files changed, 34 insertions(+)
> 
> diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
> index 41788c0bdd..eb56a228a2 100644
> --- a/include/exec/cpu-common.h
> +++ b/include/exec/cpu-common.h
> @@ -120,6 +120,14 @@ size_t qemu_ram_pagesize_largest(void);
>    */
>   void cpu_address_space_init(CPUState *cpu, int asidx,
>                               const char *prefix, MemoryRegion *mr);
> +/**
> + * cpu_address_space_destroy:
> + * @cpu: CPU for which address space needs to be destroyed
> + * @asidx: integer index of this address space
> + *
> + * Note that with KVM only one address space is supported.
> + */
> +void cpu_address_space_destroy(CPUState *cpu, int asidx);
>   
>   void cpu_physical_memory_rw(hwaddr addr, void *buf,
>                               hwaddr len, bool is_write);
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index 648b5b3586..65d2ae4581 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -355,6 +355,7 @@ struct CPUState {
>       QSIMPLEQ_HEAD(, qemu_work_item) work_list;
>   
>       CPUAddressSpace *cpu_ases;
> +    int cpu_ases_count;
>       int num_ases;
>       AddressSpace *as;
>       MemoryRegion *memory;

@num_ases and @cpu_ases_count are duplicate to each other to some extent. The
real problem is @cpu_ases is allocated at once and we need to make the allocation
sparse. In that way, each CPU address space is independent and can be destroyed
independently. The sparse allocation for the CPU address space can be done in
cpu_address_space_init() like below:

#define CPU_ADDRESS_SPACE_MAX 8

struct CPUState {
     CPUAddressSpace *cpu_ases[CPU_ADDRESS_SPACE_MAX];
}

void cpu_address_space_init(CPUState *cpu, int asidx, const char *prefix, MemoryRegion *mr)
{
     assert(asidx < CPU_ADDRESS_SPACE_MAX);

     /* The address space has been initialized ? */
     if (cpu->cpu_ases[asidx]) {
         return;
     }

     cpu->cpu_ases[asidx] = g_new0(CPUAddressSpace, 1);

}

void cpu_address_destroy(CPUState *cpu, int asidx)
{
     assert(asidx < CPU_ADDRESS_SPACE_MAX);

     /* The address space isn't initialized? */
     if (!cpu->cpu_ases[asidx]) {
         return;
     }

     :
     g_free(cpu->cpu_ases[asidx]);
     cpu->cpu_ases[asidx] = NULL;
     
}

> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index 4f6ca653b3..4dfa0ca66f 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -761,6 +761,7 @@ void cpu_address_space_init(CPUState *cpu, int asidx,
>   
>       if (!cpu->cpu_ases) {
>           cpu->cpu_ases = g_new0(CPUAddressSpace, cpu->num_ases);
> +        cpu->cpu_ases_count = cpu->num_ases;
>       }
>   
>       newas = &cpu->cpu_ases[asidx];
> @@ -774,6 +775,30 @@ void cpu_address_space_init(CPUState *cpu, int asidx,
>       }
>   }
>   
> +void cpu_address_space_destroy(CPUState *cpu, int asidx)
> +{
> +    CPUAddressSpace *cpuas;
> +
> +    assert(asidx < cpu->num_ases);
> +    assert(asidx == 0 || !kvm_enabled());
> +    assert(cpu->cpu_ases);
> +
> +    cpuas = &cpu->cpu_ases[asidx];
> +    if (tcg_enabled()) {
> +        memory_listener_unregister(&cpuas->tcg_as_listener);
> +    }
> +
> +    address_space_destroy(cpuas->as);
> +    g_free_rcu(cpuas->as, rcu);
> +
> +    if (cpu->cpu_ases_count == 1) {
> +        g_free(cpu->cpu_ases);
> +        cpu->cpu_ases = NULL;
> +    }
> +
> +    cpu->cpu_ases_count--;
> +}
> +
>   AddressSpace *cpu_get_address_space(CPUState *cpu, int asidx)
>   {
>       /* Return the AddressSpace corresponding to the specified index */

Thanks,
Gavin
