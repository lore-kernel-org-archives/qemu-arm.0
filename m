Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp434941ejc;
        Wed, 11 Oct 2023 16:31:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG5+/yXN1Di2LVZLC3xT915SpRmj5BfzfIrOSZ9yf2U6BPbaW3Nz5u9e7LU7ofKd+LLOIeX
X-Received: by 2002:a54:478d:0:b0:3ae:5e7:6e89 with SMTP id o13-20020a54478d000000b003ae05e76e89mr22290886oic.2.1697067114656;
        Wed, 11 Oct 2023 16:31:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697067114; cv=none;
        d=google.com; s=arc-20160816;
        b=fcZYpmBgoKnwvwsjXMrYBTP08n0s8d1I4sAkh6jTVVtrTO+rxwLmmr7NfkRV+UoJO9
         EIuk5PJEBupnfIHWXS1J4zns4UayazIYaz5x6lYZRD/fupz/HdwoIFQOobOwmqxWhUmQ
         Ieb9rBTqO3SOhFIY9XzuQl3zJ5C/0oKTt+Q/ewRfu7X+L8ZcF+PJoXE/VsRhyjBX74uo
         yUvrCPObyekMR4+ZWNMo64TlLLSeCIuuZx1oVtpGzFdBOHEhgirQz5N2SegndkuEyUnI
         YdwDoaPazGQ74Et8eLp9QdHiuOZy2VJAGNPJFogTLUL4CGd6/5owLtjbx2paXluG8m3P
         qE1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=ccvT5bgod8s4o55Wr4OsVK5LtH0zk3OUuCZrUegvhBw=;
        fh=UoUFvcIH1Llqwj9lcubayb9wLqiblQuJi8py3jS56vc=;
        b=W4B0Nt4rsqf8Rur6gRjErdG/JdgFY1pqsQwwfoel0xgfMcs4EPgjXlwbOiFESveZeW
         tr3ThLje6skcVGRep5+3f48HcukyPh4UZ/tiqkFVsWNKu0NpJEEhpmAKVAxtILKVFC6Y
         bl75BEN+XZ2tISe/WYLoEfwL/PmjEV+z1ZWQrYXRN+sZuJIkftM0LAS1ypCXRW/9MDK4
         qMjI4Hv8GHZs2Aa4B84GuaOoYomD+2MOwpxB8PLg0ja+4D6tUXqvP3eRTpqs9GwiALuN
         PDhUAySEMj6WXKrg9qzrGOyN2J3v4ZRDzzOGRhlDKOKjB1Ez3ZgZIpOZRKJGVYRAvx7i
         yOrg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MbzcrzTf;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <gshan@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id e4-20020ac84e44000000b00419930eb097si10284182qtw.215.2023.10.11.16.31.54
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 16:31:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MbzcrzTf;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1697067114;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ccvT5bgod8s4o55Wr4OsVK5LtH0zk3OUuCZrUegvhBw=;
	b=MbzcrzTfvOkRc88LDhRPxi9WTPW9vt+wOpEIim/IP8cHkCTtTvnEN1Qfvlb/Mf/zXlPXo2
	r/pNyvg45a4xxz9FmOXb5KxXCDer4x7gIyy6bO4qIcMm6/Gey9ri2pUkInTGLmiZ53GXzh
	sV6DLal8pxoP4KTpGUErho+4h6Fe9hY=
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-195-kQYIZWuJP0WJqk6tScsatw-1; Wed, 11 Oct 2023 19:31:53 -0400
X-MC-Unique: kQYIZWuJP0WJqk6tScsatw-1
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-6933caa92a9so262615b3a.2
        for <alex.bennee@linaro.org>; Wed, 11 Oct 2023 16:31:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697067112; x=1697671912;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ccvT5bgod8s4o55Wr4OsVK5LtH0zk3OUuCZrUegvhBw=;
        b=IM280QgCC5WrPN8E6GMpV6SgVsZjwBUUOSajBKj7o4bSK+0iTmBAmFzUSaM7Oe94TK
         /hr3/ycYv2qkVClKklBS9Hx5HNwiv9Z8nEZZn2w0TWtBrHMtid9lFrSyIx0I2nxF+Lut
         uLks2cShwn+20R5gD/BL2J8tnQ3czI4OYIhXikqp7rWBH6fY2r98ZBMB8ZrSSimVAzCE
         ZsaPIN89RHOsEddtg95wsH+k0aZENYRH4q2iB5/hOvlvRbopkr4zgdtkD3faU8BuaEOW
         0GEG259/6Bsq1VG6bq9HtFTC/D34sAyVu7BhmUkwUPetzYIENxiP6FzyWSotj9VAhFMm
         AUnA==
X-Gm-Message-State: AOJu0YyBzgPssfl311twjfZZoGQJRCIXntKLtteQ9OWjUopRCbE/7Qhj
	W2DAYMwcti+ZefOdv6mJfSx6XSRhPOocJCUkz+d2OxjTUjDRqAMrPNtz0f0bffmCZ+qusvKDXER
	MZGre17e+DtAH2j75CORQtFud
X-Received: by 2002:a05:6a00:248a:b0:690:d008:8d02 with SMTP id c10-20020a056a00248a00b00690d0088d02mr25192766pfv.19.1697067111859;
        Wed, 11 Oct 2023 16:31:51 -0700 (PDT)
X-Received: by 2002:a05:6a00:248a:b0:690:d008:8d02 with SMTP id c10-20020a056a00248a00b00690d0088d02mr25192722pfv.19.1697067111491;
        Wed, 11 Oct 2023 16:31:51 -0700 (PDT)
Return-Path: <gshan@redhat.com>
Received: from ?IPV6:2001:8003:e5b0:9f00:b890:3e54:96bb:2a15? ([2001:8003:e5b0:9f00:b890:3e54:96bb:2a15])
        by smtp.gmail.com with ESMTPSA id a3-20020a62bd03000000b0063b898b3502sm10555190pff.153.2023.10.11.16.31.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Oct 2023 16:31:51 -0700 (PDT)
Message-ID: <69098d56-8b68-2734-ef40-7338386d7fa9@redhat.com>
Date: Thu, 12 Oct 2023 09:31:39 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH V5 8/9] physmem: Add helper function to destroy CPU
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
References: <20231011194355.15628-1-salil.mehta@huawei.com>
 <20231011194355.15628-9-salil.mehta@huawei.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20231011194355.15628-9-salil.mehta@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: kdIUQALklS8C

Hi Salil,

On 10/12/23 05:43, Salil Mehta wrote:
> Virtual CPU Hot-unplug leads to unrealization of a CPU object. This also
> involves destruction of the CPU AddressSpace. Add common function to help
> destroy the CPU AddressSpace.
> 
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
> ---
>   include/exec/cpu-common.h |  8 ++++++++
>   include/hw/core/cpu.h     |  1 +
>   softmmu/physmem.c         | 25 +++++++++++++++++++++++++
>   3 files changed, 34 insertions(+)
> 

I guess you need another respin since 'softmmu/physmem.c' has been
renamed to 'system/physmem.c' by 8d7f2e767d ("system: Rename softmmu/
directory as system/"). So please consider leveraging the respin chance
to address the following minor comments. With that,

Reviewed-by: Gavin Shan <gshan@redhat.com>

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

The prefix 'cpu_' is duplicate here because the container (CPUState)
indicates it explicitly. I think it was inherited from @cpu_ases.
Besides, @ases_count seems not better than @remaining_ases. If it
makes sense, please rename it to @remaining_ases

>       int num_ases;
>       AddressSpace *as;
>       MemoryRegion *memory;
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

The two asserts on @asidx and @cpu->cpu_ases can be combined
to one so that these 3 asserts can be combined to two.

        /* Only one address space is supported by KVM */
        assert(asidx == 0 || !kvm_enabled());
        assert(asidx >= 0 && asidx < cpu->cpu_ases_count)

> +    cpuas = &cpu->cpu_ases[asidx];
> +    if (tcg_enabled()) {
> +        memory_listener_unregister(&cpuas->tcg_as_listener);
> +    }
> +

We need to detach CPUState::as here if @asidx == 0 because the alias was
populated in cpu_address_space_init(). Even the CPUState is going to be
release pretty soon, we have inconsistent states temporarily.

        /* Detach the alias to address space 0 */
        if (asidx == 0) {
            cpu->as = NULL;
        }

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

I'm not sure, but Linux's kref_put() decreases the reference count before
the object is released. In order to follow that pattern, we need something
like below. However, it's something related to personal taste, I guess :)

        if (--cpu->cpu_ases_count == 0) {
            g_free(cpu->cpu_ases);
            cpu->cpu_ases = NULL;
        }



>   AddressSpace *cpu_get_address_space(CPUState *cpu, int asidx)
>   {
>       /* Return the AddressSpace corresponding to the specified index */

Thanks,
Gavin
