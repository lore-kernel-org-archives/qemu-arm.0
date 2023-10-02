Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp1426248ejb;
        Mon, 2 Oct 2023 09:20:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEv/SnX19ZSNqsW4wQnWQMryIhMVJyl/VOwzNI8VZgmtPihis7brLCGzICp+pYXkfAap3bU
X-Received: by 2002:adf:dc84:0:b0:317:dadc:4a63 with SMTP id r4-20020adfdc84000000b00317dadc4a63mr74120wrj.8.1696263627526;
        Mon, 02 Oct 2023 09:20:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696263627; cv=none;
        d=google.com; s=arc-20160816;
        b=lU/woAGO+wJeDwkr5Gg+ScneRQd7v9FOrOGLVTM5Zi/eQdqkmHUY5vjM7Jnc/z3giR
         TsIUTjLd2KkrI51A2/4syzzlWLbxD5Fo/1vkOurZ/FPWg2IUdtsv/I4fLdy7batpFRzy
         ChQ7xtVNmiqM2Nc6SBbe9z+/sZv1+MJEVWNNhc8gL+D3tiP9I1XF5nnOk3x4OlyIds+l
         sB0Eaf+lLZVpv/26Swzl5mcfNXtBnAZkAcVu3Qv8EC0WFVdRJQ2P93geCaXZw4oAu0N6
         lj6YAEeBpCC2yHLECbBk9ntOmO98VxCqwQx/vHDxaGYI+2DYq69Mmms2KLfbs7VrVKUe
         3aZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date;
        bh=x0isxmr5jNMITZZf58MJd1w8Qdj0eYG1pQrVO4w/W28=;
        fh=/EBauY3IXh4VobPm5b6w815uXOAKkGQo/xHlRV7Dr5E=;
        b=DBT1i4j0eYVrlnfbhYKYpp5T4JU4LXN3VeMXoRZZ4rn+VHZRZ8ZJa3Mdm0V89NAzwp
         VqPghePq4k42UNT6FAWzNfZ9ZTMx0G2zqTbAeRvQ7XROEjwWyijuuC1nMsSnnEHmvSat
         lgrhA+M/OyImt7e7cp64Ca3KIKlaZnbKKf8Ml2YgD3DZ3b0swoCX2GalPf+1MumXr+oC
         TGgBpyAXeHJVb60amuUqqfmiWZj25Yy9NBrDJPJC3SSYJSYF4fnOzG/yHiQD/S8PiTth
         dnsOG6kjDxXoFftC4dZZKTcTeRTvpDIxB1N4dewsdaD2wvVSdIdxwi3RjEXLhkz69rXu
         pQnA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id r16-20020a5d4990000000b0031934aaa84esi12973154wrq.161.2023.10.02.09.20.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 02 Oct 2023 09:20:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.226])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4RzmMJ1HPtz6HJZN;
	Tue,  3 Oct 2023 00:17:48 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.31; Mon, 2 Oct
 2023 17:20:25 +0100
Date: Mon, 2 Oct 2023 17:20:24 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Salil Mehta <salil.mehta@huawei.com>
CC: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <maz@kernel.org>,
	<jean-philippe@linaro.org>, <lpieralisi@kernel.org>,
	<peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
	<imammedo@redhat.com>, <andrew.jones@linux.dev>, <david@redhat.com>,
	<philmd@linaro.org>, <eric.auger@redhat.com>, <oliver.upton@linux.dev>,
	<pbonzini@redhat.com>, <mst@redhat.com>, <will@kernel.org>,
	<gshan@redhat.com>, <rafael@kernel.org>, <alex.bennee@linaro.org>,
	<linux@armlinux.org.uk>, <darren@os.amperecomputing.com>,
	<ilkka@os.amperecomputing.com>, <vishnu@os.amperecomputing.com>,
	<karl.heubaum@oracle.com>, <miguel.luis@oracle.com>,
	<salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
	<wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
	<jiakernel2@gmail.com>, <maobibo@loongson.cn>, <lixianglai@loongson.cn>,
	<linuxarm@huawei.com>
Subject: Re: [PATCH V2 08/10] physmem: Add helper function to destroy CPU
 AddressSpace
Message-ID: <20231002172024.000042aa@Huawei.com>
In-Reply-To: <20230930001933.2660-9-salil.mehta@huawei.com>
References: <20230930001933.2660-1-salil.mehta@huawei.com>
	<20230930001933.2660-9-salil.mehta@huawei.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml100006.china.huawei.com (7.191.160.224) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
X-TUID: ki2tU40LiY9W

On Sat, 30 Sep 2023 01:19:31 +0100
Salil Mehta <salil.mehta@huawei.com> wrote:

> Virtual CPU Hot-unplug leads to unrealization of a CPU object. This also
> involves destruction of the CPU AddressSpace. Add common function to help
> destroy the CPU AddressSpace.
> 
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>

I'm not that familiar with this bit of the code, so no tag, but
as far as I can tell from a fairly superficial look, this is good.

> ---
>  include/exec/cpu-common.h |  8 ++++++++
>  include/hw/core/cpu.h     |  1 +
>  softmmu/physmem.c         | 25 +++++++++++++++++++++++++
>  3 files changed, 34 insertions(+)
> 
> diff --git a/include/exec/cpu-common.h b/include/exec/cpu-common.h
> index 41788c0bdd..eb56a228a2 100644
> --- a/include/exec/cpu-common.h
> +++ b/include/exec/cpu-common.h
> @@ -120,6 +120,14 @@ size_t qemu_ram_pagesize_largest(void);
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
> index 648b5b3586..65d2ae4581 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -355,6 +355,7 @@ struct CPUState {
>      QSIMPLEQ_HEAD(, qemu_work_item) work_list;
>  
>      CPUAddressSpace *cpu_ases;
> +    int cpu_ases_count;
>      int num_ases;
>      AddressSpace *as;
>      MemoryRegion *memory;
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index 4f6ca653b3..4dfa0ca66f 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -761,6 +761,7 @@ void cpu_address_space_init(CPUState *cpu, int asidx,
>  
>      if (!cpu->cpu_ases) {
>          cpu->cpu_ases = g_new0(CPUAddressSpace, cpu->num_ases);
> +        cpu->cpu_ases_count = cpu->num_ases;
>      }
>  
>      newas = &cpu->cpu_ases[asidx];
> @@ -774,6 +775,30 @@ void cpu_address_space_init(CPUState *cpu, int asidx,
>      }
>  }
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
>  AddressSpace *cpu_get_address_space(CPUState *cpu, int asidx)
>  {
>      /* Return the AddressSpace corresponding to the specified index */
