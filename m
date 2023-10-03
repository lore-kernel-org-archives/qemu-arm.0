Received: by 2002:a17:906:ce59:b0:9b2:89ee:1eb8 with SMTP id se25csp1774493ejb;
        Mon, 2 Oct 2023 23:33:53 -0700 (PDT)
X-Received: by 2002:a1c:4c13:0:b0:402:d72:bee5 with SMTP id z19-20020a1c4c13000000b004020d72bee5mr12028786wmf.21.1696314833471;
        Mon, 02 Oct 2023 23:33:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696314833; cv=none;
        d=google.com; s=arc-20160816;
        b=ES8Ro1JKvTwhARYgZJwHtZrnYk6upP2pu8rGjucp4bLfuY+mrRDG7h+nQ6oAqAmKM3
         KB4al65aF7mLTL5/uJODZ2/KWdi4dorKUeYXy4pats0zmqR4ZSXCl69hlbRtePF4oMj6
         hGKS9o9e8g2nt7zNaPWhO2R53PiE9ou6kiqRUqT5V3EG8mEA80F7Ta2eSgKzwh84vzdS
         sgj15ezOoj2UyqlxTdOOQl9I9CrIz6aQ5LinlVcatJPo5WDmzNZ0jiskfuw8JW4fKGT+
         BeK9FvC5OyDslgf2xZGLLlBou4m9XUqeZIl2qgbB83xhtOzZkkjSs1TO+/f1cHsYx58P
         /A5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=CbybdjagOW0E12ZUgpvobkKWcAkVuvl1rqYjBghDq3w=;
        fh=1D/c1ZC+2hX4Czk2NgQ0zjXcOqd0mAoUMdY69AVrRvE=;
        b=JyNWofn3Q7qEQjPgG34z6A2K358PYZpbJ5XFL0bJmVuqums0rXdmFE2kzdQ1XpNaXV
         uLtP2LTTOVc2qfTfGjuPVfs4qEq2oX5nektzh7UCrRgvxDoEVBEACC4QRuh39IV0FskP
         IMcCbFiECjyVQdWQ/OBMGFXlMvgpaMkyCtAw0FB81I7mCsfbT++Sc9YN/evfcS06WV6g
         vH0xvvA8R1IOJSVXOJDLT/D5Fheknhm16fzOOm1/sLs+6C+kO+yBB7CTL6R1/kRPes0B
         dw01GjtkzqBgTnPzY2jv+u/6tUkiZMrkFA6exKfmGc+3ObsRG6zZH0ZThFXqM1qQlQMS
         vZYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hG7aaKOm;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id f25-20020a7bcd19000000b003feae7226a8sor183196wmj.6.2023.10.02.23.33.53
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 02 Oct 2023 23:33:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hG7aaKOm;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696314833; x=1696919633; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CbybdjagOW0E12ZUgpvobkKWcAkVuvl1rqYjBghDq3w=;
        b=hG7aaKOm26yiDoUSdFLgpjKimbXgBY/iw4uoyjX2RBbz5nAsx/KDUQlRnrDv8E79eM
         SKuepcclz3dsmWPVOm8xRUtRVausz/8E57RDnRRDWB7SdN+i5rWnOlHKpN/StnfL18YF
         GQRrKb1RX8rk5PLv1/qLxd5pyl6hC+LZwMmxNdmEjAtI+v4qC/+UIMHsxsd01FNFyqIz
         JZBJMq3qxXWA8JBTK8mGq6VorKTUrzum0oK4bAA5ovtF1cYBueEbdJXgpvRsS1i/RIrO
         CE8dujSktZRON6vxTW6srtmvswXAsowVVGsdMMbcopddfx81zriC0DUFl0/+SCI1Eg2b
         Ve/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696314833; x=1696919633;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CbybdjagOW0E12ZUgpvobkKWcAkVuvl1rqYjBghDq3w=;
        b=wMtKwRjW0XfZSUsqmq3N4/gUWLw+/OQOod74RUp8NkNA1AOkq9VOuRA3ClbaJhmTxm
         HntAVbuEF0DUeAhjg7bGI6CgaelnE3v3SrME3Prm3CPUt4FpIsFgdE5G31yecpir5/1n
         VC4UU7z89rXgbyX2u7JSV38BFpEbn0QSB0EKgqtzwUyhrp0Ci3eOPA70J+ZpJLN3Aufv
         kM9P5Ovteu1o6RKCyvIDqUgrtaNj32xsR3v0G+elP76/XOI5CrOzCENa2tnAsY2raUt0
         I++skYy/1mUg26YdEPUrajAXqhVnqgf6AyxWByjjoeBebyJKah2U3dyEClJR+IsGbnha
         cbEA==
X-Gm-Message-State: AOJu0Yxu593TjsV3k8huc4bgD/gRt0xWTE4I1lbLomU3HXISjQ3d4ZaJ
	AAD4ENr9ZBjWA3DN1kZYYdMm4hAo
X-Google-Smtp-Source: AGHT+IHhPkbA1TBCzpYsp+Ke9IRYEFIe+iPHiSzReTvJ76g7qdSLSAYuYdQEWyQd9XgXa0bexeaXqQ==
X-Received: by 2002:a05:600c:294a:b0:403:7b2:6d8f with SMTP id n10-20020a05600c294a00b0040307b26d8fmr11878375wmd.2.1696314833096;
        Mon, 02 Oct 2023 23:33:53 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] (176-131-222-246.abo.bbox.fr. [176.131.222.246])
        by smtp.gmail.com with ESMTPSA id p7-20020adff207000000b003253523d767sm750699wro.109.2023.10.02.23.33.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Oct 2023 23:33:52 -0700 (PDT)
Message-ID: <b71a91cc-a0fe-230b-f895-e163b37be157@linaro.org>
Date: Tue, 3 Oct 2023 08:33:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.15.1
Subject: Re: [PATCH RFC V2 31/37] physmem,gdbstub: Common helping
 funcs/changes to *unrealize* vCPU
Content-Language: en-US
To: Salil Mehta <salil.mehta@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: maz@kernel.org, jean-philippe@linaro.org, jonathan.cameron@huawei.com,
 lpieralisi@kernel.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, imammedo@redhat.com, andrew.jones@linux.dev,
 david@redhat.com, eric.auger@redhat.com, will@kernel.org, ardb@kernel.org,
 oliver.upton@linux.dev, pbonzini@redhat.com, mst@redhat.com,
 gshan@redhat.com, rafael@kernel.org, borntraeger@linux.ibm.com,
 alex.bennee@linaro.org, linux@armlinux.org.uk,
 darren@os.amperecomputing.com, ilkka@os.amperecomputing.com,
 vishnu@os.amperecomputing.com, karl.heubaum@oracle.com,
 miguel.luis@oracle.com, salil.mehta@opnsrc.net, zhukeqian1@huawei.com,
 wangxiongfeng2@huawei.com, wangyanan55@huawei.com, jiakernel2@gmail.com,
 maobibo@loongson.cn, lixianglai@loongson.cn
References: <20230926100436.28284-1-salil.mehta@huawei.com>
 <20230926100436.28284-32-salil.mehta@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230926100436.28284-32-salil.mehta@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: lsDio3+V6MFd

Hi Salil,

On 26/9/23 12:04, Salil Mehta wrote:
> Supporting vCPU Hotplug for ARM arch also means introducing new functionality of
> unrealizing the ARMCPU. This requires some new common functions.
> 
> Defining them as part of architecture independent change so that this code could
> be reused by other interested parties.
> 
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> ---
>   gdbstub/gdbstub.c         | 13 +++++++++++++
>   include/exec/cpu-common.h |  8 ++++++++
>   include/exec/gdbstub.h    |  1 +
>   include/hw/core/cpu.h     |  1 +
>   softmmu/physmem.c         | 25 +++++++++++++++++++++++++
>   5 files changed, 48 insertions(+)


> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index dab572c9bd..ffd815a0d8 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -366,6 +366,7 @@ struct CPUState {
>       QSIMPLEQ_HEAD(, qemu_work_item) work_list;
>   
>       CPUAddressSpace *cpu_ases;
> +    int cpu_ases_ref_count;
>       int num_ases;
>       AddressSpace *as;
>       MemoryRegion *memory;
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index 3df73542e1..a93ae783af 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -762,6 +762,7 @@ void cpu_address_space_init(CPUState *cpu, int asidx,
>   
>       if (!cpu->cpu_ases) {
>           cpu->cpu_ases = g_new0(CPUAddressSpace, cpu->num_ases);
> +        cpu->cpu_ases_ref_count = cpu->num_ases;
>       }
>   
>       newas = &cpu->cpu_ases[asidx];
> @@ -775,6 +776,30 @@ void cpu_address_space_init(CPUState *cpu, int asidx,
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
> +    if (cpu->cpu_ases_ref_count == 1) {
> +        g_free(cpu->cpu_ases);
> +        cpu->cpu_ases = NULL;
> +    }
> +
> +    cpu->cpu_ases_ref_count--;

See Richard comment from:
https://lore.kernel.org/qemu-devel/594b2550-9a73-684f-6e54-29401dc6cd7a@linaro.org/

"I think it would be better to destroy all address spaces at once,
"so that you don't need  to invent a reference count that isn't used
"for anything else.

> +}
> +
>   AddressSpace *cpu_get_address_space(CPUState *cpu, int asidx)
>   {
>       /* Return the AddressSpace corresponding to the specified index */
