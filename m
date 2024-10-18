Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp852345njb;
        Fri, 18 Oct 2024 07:24:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVcTOEcNYeacxyc7PIMJyK2mgPBuBjjdNYxSI6fFMWfhBQW4/8fPJ7aClUK9AXoBLdx1D7+LBeNn3cZBA==@linaro.org
X-Google-Smtp-Source: AGHT+IH/z+pN7BglgtLQRuU2mwbv0gZa7F5LoZg810ZhH8ljxAfTksB1gL5gUNcBP80ONrpeNko/
X-Received: by 2002:a05:620a:46a8:b0:7a9:b424:ffec with SMTP id af79cd13be357-7b157b6ddc0mr272735685a.30.1729261484126;
        Fri, 18 Oct 2024 07:24:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729261484; cv=none;
        d=google.com; s=arc-20240605;
        b=jWvbSEYjW4GW5UUpWCFv8xMcoAz2lYZWrNcirC1DkXTLISMjVl9u3kNk3Z7979pwQ9
         iRWm52FlzvEmpdZxhlYFnEu8hlK1aVp/gCpHhrghqlteO/X0sTSlBCVrw0BOEWqG+A/2
         bslB4gf1g1qOVwaYUg4aSdJanNct6HqpsB7RqafVYRI6qkf8NqA7To8r6aAzC7dFSvEs
         jm4pT92QVx7ymtlNR04wTecILB1Z3lQ/hmRQBSK8hUAHOIQsApRWWx9pstMe/zsKuYms
         QwTCCc88Rj+ueiFUtT7/vqm4My506+sGDOYDYlrar91p9HTRIWruE8xCJQ1ZngoFjPBB
         r0UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=XIB7KuZSSWkTQLub4v9O07wAXHZMt+FjPvQsi1A2fIk=;
        fh=cIx6HlQWgRuE9rUQ+oung0jpdPO6bD5IYTCbSk6tTAo=;
        b=LmWrlX74LRLoWgFBhWGkzQjVsHN9QtyeSgzLYYurx5YEi+hWeOp3K195BzKiS9zuFa
         rYBqxEV4K7vVUMrxjHm9bMXNWeM1Q5Zq9dHbXGDu38uGW+RqXZaxJ67NAvK8AnWmBfVp
         dOcI/NqS0b4Y95t2skcYV9/muxDFB5fv25E11iE9dsBg0+19nltQGz0TXwkW2kqqACXw
         rlMDFKwYeX/b1QQ5NYP1/XmaGKKN8nlYgoO5HUe/zBarmNfXxssky4X0cQ73CtXYME56
         r+GAxNZTEIPsnWC5baABJpZ/wfWeRxJPqtLOQQgXlm6BdiLo1PjVroWleN36YcBFyJHT
         FY9w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NZOlAv0q;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7b156fd87a1si190935885a.244.2024.10.18.07.24.43
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 07:24:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=NZOlAv0q;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729261483;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XIB7KuZSSWkTQLub4v9O07wAXHZMt+FjPvQsi1A2fIk=;
	b=NZOlAv0qldgo802UaCE6aq32bYJNaQNRpEZ7/Ioc9Sf6hPjI3JrL9u/I1kLBUXrDRufgFJ
	1/z+gCvB/JqmuwkITjQ5tEnCppzZ66dnKQHa2BnzBVf/YetbWOXrNjTOLzE+TO3NhCP122
	2HXu2XJKM3fFCvyQlOQPUn/+zRICPjg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-497-jSDKh9hLOtqyS7rQ4SiCoQ-1; Fri, 18 Oct 2024 10:24:42 -0400
X-MC-Unique: jSDKh9hLOtqyS7rQ4SiCoQ-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43151e4ef43so15510295e9.3
        for <alex.bennee@linaro.org>; Fri, 18 Oct 2024 07:24:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729261481; x=1729866281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XIB7KuZSSWkTQLub4v9O07wAXHZMt+FjPvQsi1A2fIk=;
        b=GWvLLuQsReG4fodKb7IddHsG/+WOVBYODS4+jfUwxjE5bICc7YzIagXxnqnNoSN8Kf
         Pr+w57FiwHLNUjWMDSwpmR4Edmsdfq5CxEOytDVLhiFmm9fmadqKoz9TQ9dvI9+rgqfD
         xiM+K0uADr5eSnWyn7Y5YtHCn1a8WEObbDLk26699R9eC8EaD5AZq7o5TR6baxaEuX5g
         d9uv6jqXUS45yanw6tQxnD6mbocXcGq7UjnYfWiKVQC27HuIWFapIqaK+bs8swzvydbu
         ySVR+Cp3WDeDNF+rYh4ZNU/1PcecBw1kSh8Ecdu/u4TAJv02NdpsnO5+chCVWkanfyJV
         O++A==
X-Forwarded-Encrypted: i=1; AJvYcCUQHSQD2iWj++s6AZx1IywZWNP2Orbbe/BDClFGS/V04RSXAX+X1mcoGfkOsK2DOJ7GT43Um+0ZHuyxLg==@linaro.org
X-Gm-Message-State: AOJu0YzmIMf8lz7lXYXUIw8uVaD19MsMSuJ9FjkTK7dK0yiX04o2WUtP
	h1P9ixHTINPIdPfmDWrhH9aRMa9xi4tzmeS/otaFfQ/nueM17HX4F0P4VGI/C4OFONEWDXPqv9D
	2yYmq7gKciBMoa3tiXif4cYjT2UWu2UOI7ATe7anjHNi/PnMPNf1s1Q==
X-Received: by 2002:a05:600c:1554:b0:431:58b3:affa with SMTP id 5b1f17b1804b1-43161642df5mr23413105e9.9.1729261481492;
        Fri, 18 Oct 2024 07:24:41 -0700 (PDT)
X-Received: by 2002:a05:600c:1554:b0:431:58b3:affa with SMTP id 5b1f17b1804b1-43161642df5mr23412765e9.9.1729261480988;
        Fri, 18 Oct 2024 07:24:40 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316067de15sm28867275e9.5.2024.10.18.07.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 07:24:40 -0700 (PDT)
Date: Fri, 18 Oct 2024 16:24:37 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Salil Mehta <salil.mehta@huawei.com>
Cc: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <mst@redhat.com>,
 <maz@kernel.org>, <jean-philippe@linaro.org>,
 <jonathan.cameron@huawei.com>, <lpieralisi@kernel.org>,
 <peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
 <andrew.jones@linux.dev>, <david@redhat.com>, <philmd@linaro.org>,
 <eric.auger@redhat.com>, <will@kernel.org>, <ardb@kernel.org>,
 <oliver.upton@linux.dev>, <pbonzini@redhat.com>, <gshan@redhat.com>,
 <rafael@kernel.org>, <borntraeger@linux.ibm.com>, <alex.bennee@linaro.org>,
 <npiggin@gmail.com>, <harshpb@linux.ibm.com>, <linux@armlinux.org.uk>,
 <darren@os.amperecomputing.com>, <ilkka@os.amperecomputing.com>,
 <vishnu@os.amperecomputing.com>, <karl.heubaum@oracle.com>,
 <miguel.luis@oracle.com>, <salil.mehta@opnsrc.net>,
 <zhukeqian1@huawei.com>, <wangxiongfeng2@huawei.com>,
 <wangyanan55@huawei.com>, <jiakernel2@gmail.com>, <maobibo@loongson.cn>,
 <lixianglai@loongson.cn>, <shahuang@redhat.com>, <zhao1.liu@intel.com>,
 <linuxarm@huawei.com>, <gustavo.romero@linaro.org>
Subject: Re: [PATCH V1 3/4] hw/acpi: Reflect ACPI vCPU {present,enabled}
 states in ACPI _STA.{PRES,ENA} Bits
Message-ID: <20241018162437.782c12c1@imammedo.users.ipa.redhat.com>
In-Reply-To: <20241014192205.253479-4-salil.mehta@huawei.com>
References: <20241014192205.253479-1-salil.mehta@huawei.com>
	<20241014192205.253479-4-salil.mehta@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: 0zs2B6Vd51bA

On Mon, 14 Oct 2024 20:22:04 +0100
Salil Mehta <salil.mehta@huawei.com> wrote:

> Reflect the ACPI CPU hotplug `is_{present, enabled}` states in the `_STA.PRES`
> (presence) and `_STA.ENA` (enabled) bits when the guest kernel evaluates the
> ACPI `_STA` method during initialization, as well as when vCPUs are hot-plugged
> or hot-unplugged. The presence of unplugged vCPUs may need to be deliberately
> *simulated* at the ACPI level to maintain a *persistent* view of vCPUs for the
> guest kernel.

given questionable future of is_present/is_enabled fields,
it probably premature to review this part.
The only thing, I have to say here is repeating spec/doc
update patch describing how it should work should come 1st,
so that we could compare this impl. with it. 

> 
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> ---
>  hw/acpi/cpu.c | 26 ++++++++++++++++++++++----
>  1 file changed, 22 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
> index 700aa855e9..23ea2b9c70 100644
> --- a/hw/acpi/cpu.c
> +++ b/hw/acpi/cpu.c
> @@ -63,10 +63,11 @@ static uint64_t cpu_hotplug_rd(void *opaque, hwaddr addr, unsigned size)
>      cdev = &cpu_st->devs[cpu_st->selector];
>      switch (addr) {
>      case ACPI_CPU_FLAGS_OFFSET_RW: /* pack and return is_* fields */
> -        val |= cdev->cpu ? 1 : 0;
> +        val |= cdev->is_enabled ? 1 : 0;
>          val |= cdev->is_inserting ? 2 : 0;
>          val |= cdev->is_removing  ? 4 : 0;
>          val |= cdev->fw_remove  ? 16 : 0;
> +        val |= cdev->is_present ? 32 : 0;
>          trace_cpuhp_acpi_read_flags(cpu_st->selector, val);
>          break;
>      case ACPI_CPU_CMD_DATA_OFFSET_RW:
> @@ -376,6 +377,7 @@ const VMStateDescription vmstate_cpu_hotplug = {
>  #define CPU_REMOVE_EVENT  "CRMV"
>  #define CPU_EJECT_EVENT   "CEJ0"
>  #define CPU_FW_EJECT_EVENT "CEJF"
> +#define CPU_PRESENT       "CPRS"
>  
>  void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
>                      build_madt_cpu_fn build_madt_cpu, hwaddr base_addr,
> @@ -436,7 +438,9 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
>          aml_append(field, aml_named_field(CPU_EJECT_EVENT, 1));
>          /* tell firmware to do device eject, write only */
>          aml_append(field, aml_named_field(CPU_FW_EJECT_EVENT, 1));
> -        aml_append(field, aml_reserved_field(3));
> +        /* 1 if present, read only */
> +        aml_append(field, aml_named_field(CPU_PRESENT, 1));
> +        aml_append(field, aml_reserved_field(2));
>          aml_append(field, aml_named_field(CPU_COMMAND, 8));
>          aml_append(cpu_ctrl_dev, field);
>  
> @@ -466,6 +470,7 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
>          Aml *ctrl_lock = aml_name("%s.%s", cphp_res_path, CPU_LOCK);
>          Aml *cpu_selector = aml_name("%s.%s", cphp_res_path, CPU_SELECTOR);
>          Aml *is_enabled = aml_name("%s.%s", cphp_res_path, CPU_ENABLED);
> +        Aml *is_present = aml_name("%s.%s", cphp_res_path, CPU_PRESENT);
>          Aml *cpu_cmd = aml_name("%s.%s", cphp_res_path, CPU_COMMAND);
>          Aml *cpu_data = aml_name("%s.%s", cphp_res_path, CPU_DATA);
>          Aml *ins_evt = aml_name("%s.%s", cphp_res_path, CPU_INSERT_EVENT);
> @@ -494,13 +499,26 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
>          {
>              Aml *idx = aml_arg(0);
>              Aml *sta = aml_local(0);
> +            Aml *ifctx2;
> +            Aml *else_ctx;
>  
>              aml_append(method, aml_acquire(ctrl_lock, 0xFFFF));
>              aml_append(method, aml_store(idx, cpu_selector));
>              aml_append(method, aml_store(zero, sta));
> -            ifctx = aml_if(aml_equal(is_enabled, one));
> +            ifctx = aml_if(aml_equal(is_present, one));
>              {
> -                aml_append(ifctx, aml_store(aml_int(0xF), sta));
> +                ifctx2 = aml_if(aml_equal(is_enabled, one));
> +                {
> +                    /* cpu is present and enabled */
> +                    aml_append(ifctx2, aml_store(aml_int(0xF), sta));
> +                }
> +                aml_append(ifctx, ifctx2);
> +                else_ctx = aml_else();
> +                {
> +                    /* cpu is present but disabled */
> +                    aml_append(else_ctx, aml_store(aml_int(0xD), sta));
> +                }
> +                aml_append(ifctx, else_ctx);
>              }
>              aml_append(method, ifctx);
>              aml_append(method, aml_release(ctrl_lock));
