Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp2113315njb;
        Sun, 20 Oct 2024 19:09:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW5QEWCEpN+/oNgl3owv4nE7cvCPrXF0BbTw5JyfIEMNGYiiGq6cmkalmerXogEM7/z7GE6pxc5phblfg==@linaro.org
X-Received: by 2002:a17:903:2302:b0:207:1675:6709 with SMTP id d9443c01a7336-20e59a97bf7mr145466765ad.0.1729476588463;
        Sun, 20 Oct 2024 19:09:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729476588; cv=none;
        d=google.com; s=arc-20240605;
        b=ZFQSyswQUyJ2X1R2nJKJf97CCqoXexjvHql+znSIxDpB8a5Tb3B2+phzdx3WQeMKeb
         X9m5rB97/7+7evDkjsskCyzklEr5nAU9SFrF/CBnfghOrbN5KVJklZvRDSPucd5tsWIT
         lJ6zPQzQLe6pqVUCVi2dIZctyrLJJVx1qiOmpUytSFOabFtHwH3SnEkDMH7l22pcGNNl
         w8CmwtIDHsEbaGdBK1Zgl0rir8OunK9Hiwev1IIJzDl0lM06p61035Cs6OcE4AaM4JvQ
         DWoqONps8Xzg9ECi/Cu6fA7kSPSkwzPT8VeuZjZlZTy+QiGH8ADgnKLZEmQR+6LC8uEs
         ilig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=t+B5k0OIf9JD/kCuC10w5oEnui5YaC88U76aEr+T5BY=;
        fh=2en/26h9G2uPYW4lzRvl0qMF47JvSDpycmzAHuAubDg=;
        b=BaVpekT8SraH65vMZvrTCoLUCS9TftY/ZOPx3Br5UoXya7zlfYfQGK8WoZYuS6QEmH
         q2fPdGADTlxg+bHL00KUW3JXPvtzJJH0vRrpJUxVJu54oCpq4+XpIs/GuP+mUDDWu7xe
         g1C+jpfgODiK1d21DP4SLuuUKMJBAkCZjSUn2KgMYno6kM7d7br0sUQ0wewTLmcQwGwQ
         lpc6BYtAoljTpU1G+NCyx9B50TgzrVEIj8SNcOYxkfVeKZHLY5Coxnc94BvW10dn9P6k
         t4H6sSGvLOudfjN+glpP460juGARrrz/qChJFDiq6IWhoSliRK8yRVCKYgR5w700uZZJ
         33Dw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vRwwr4Iq;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <gustavo.romero@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d9443c01a7336-20e7f0f33dcsor13128055ad.5.2024.10.20.19.09.48
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 20 Oct 2024 19:09:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vRwwr4Iq;
       spf=pass (google.com: domain of gustavo.romero@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=gustavo.romero@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729476588; x=1730081388; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t+B5k0OIf9JD/kCuC10w5oEnui5YaC88U76aEr+T5BY=;
        b=vRwwr4IqxUU349SuLWIP6J94mXCJ5w0x2yhDwn2wYsLXAnKxTeX0qlKK53F43iRlxU
         HudNYuiz96aAPOava2iHrNEUkDPryTjF48pomi1qDvT++BpprAVXGL+HX79943Laxlxs
         HtLCNbsfNxQfXqtFoNUhLyWy0GSaUX2J60mH2OBl6WPaj1g7eP2EOUwj7U80wnlb194z
         8+3qWPp6jnsg86/6+yGbmq3nja1WBs2wdNf0cG78FK/oBsOeQlbmVM0K0tO2xFr2vS9N
         6jbDr3/pJYvhxPZlIvESu/vx9D7UWPc6REa0sVsqLXiRVO24I6omygeI/31XUH5OJpnt
         latA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729476588; x=1730081388;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t+B5k0OIf9JD/kCuC10w5oEnui5YaC88U76aEr+T5BY=;
        b=YqUTa0WvAtlfI2roDl7gimc0sWslhT5VWYQNy7QCJ0/u9+/ywsu/692rcL571fH4No
         R6TXUDevR42oTr7p94eOF9sMQjYKDevvXlk3qs9Irw559McHHAs8cNOHg1T8jc/ctDyA
         k//oPE579kQVkcL8o3DRJPNLF/un7KxkpO77C87z0L9vxUsfO+ZWNH2Q6puvQ4dMOBZM
         wkmFtmUbhJcUQ8HCLxlKASmwYa8Cm8+OT+EfofY5MLqaCCrH7yzJC1VOuN2CBwfD2OTU
         vT8Vypo2JWE8NW8RmEF1R6ChGbfgcK40pxa56P6yLViR2rfEHf2NpXjdShjWz3T1BeJT
         A7Bg==
X-Forwarded-Encrypted: i=1; AJvYcCXuD19hNnBmwvagy+5rGtDCGyMe9NQBupLhTuy/jlDAgHN5hZgW0NU32CVnLjKRlX/IYRbGyzXA0yVfxg==@linaro.org
X-Gm-Message-State: AOJu0YxRCKJhs6XSliH0Wh3HQpSy91fSywiXMkAU3aTIlgoat+HojNwh
	v9LqERDTz8MH7C6CG5Tu4oELh96TXzS8xC1jbfSe2VQ60NttvRBWOgUxwoNIpBEptw==
X-Google-Smtp-Source: AGHT+IFSPN/N8NU7wAYTx1hTZ3wa3ZfNOxByIPkQJZLgNgoOOvwgKGcb7UA/LYVie5Zh5e87Xv/X/g==
X-Received: by 2002:a17:903:40ce:b0:205:709e:1949 with SMTP id d9443c01a7336-20e5aaab6camr108995705ad.57.1729476587944;
        Sun, 20 Oct 2024 19:09:47 -0700 (PDT)
Return-Path: <gustavo.romero@linaro.org>
Received: from [192.168.0.102] ([187.121.94.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7eee622dsm15941015ad.6.2024.10.20.19.09.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 20 Oct 2024 19:09:47 -0700 (PDT)
Message-ID: <700f6b4b-e609-42fe-afaf-e9ea62a049e1@linaro.org>
Date: Sun, 20 Oct 2024 23:09:33 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V1 3/4] hw/acpi: Reflect ACPI vCPU {present,enabled}
 states in ACPI _STA.{PRES,ENA} Bits
To: Salil Mehta <salil.mehta@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, mst@redhat.com
Cc: maz@kernel.org, jean-philippe@linaro.org, jonathan.cameron@huawei.com,
 lpieralisi@kernel.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, imammedo@redhat.com, andrew.jones@linux.dev,
 david@redhat.com, philmd@linaro.org, eric.auger@redhat.com, will@kernel.org,
 ardb@kernel.org, oliver.upton@linux.dev, pbonzini@redhat.com,
 gshan@redhat.com, rafael@kernel.org, borntraeger@linux.ibm.com,
 alex.bennee@linaro.org, npiggin@gmail.com, harshpb@linux.ibm.com,
 linux@armlinux.org.uk, darren@os.amperecomputing.com,
 ilkka@os.amperecomputing.com, vishnu@os.amperecomputing.com,
 karl.heubaum@oracle.com, miguel.luis@oracle.com, salil.mehta@opnsrc.net,
 zhukeqian1@huawei.com, wangxiongfeng2@huawei.com, wangyanan55@huawei.com,
 jiakernel2@gmail.com, maobibo@loongson.cn, lixianglai@loongson.cn,
 shahuang@redhat.com, zhao1.liu@intel.com, linuxarm@huawei.com
References: <20241014192205.253479-1-salil.mehta@huawei.com>
 <20241014192205.253479-4-salil.mehta@huawei.com>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <20241014192205.253479-4-salil.mehta@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: MGvvaTnQnLyh

Hi Salil,

On 10/14/24 16:22, Salil Mehta wrote:
> Reflect the ACPI CPU hotplug `is_{present, enabled}` states in the `_STA.PRES`
> (presence) and `_STA.ENA` (enabled) bits when the guest kernel evaluates the
> ACPI `_STA` method during initialization, as well as when vCPUs are hot-plugged
> or hot-unplugged. The presence of unplugged vCPUs may need to be deliberately
> *simulated* at the ACPI level to maintain a *persistent* view of vCPUs for the
> guest kernel.
> 
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> ---
>   hw/acpi/cpu.c | 26 ++++++++++++++++++++++----
>   1 file changed, 22 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
> index 700aa855e9..23ea2b9c70 100644
> --- a/hw/acpi/cpu.c
> +++ b/hw/acpi/cpu.c
> @@ -63,10 +63,11 @@ static uint64_t cpu_hotplug_rd(void *opaque, hwaddr addr, unsigned size)
>       cdev = &cpu_st->devs[cpu_st->selector];
>       switch (addr) {
>       case ACPI_CPU_FLAGS_OFFSET_RW: /* pack and return is_* fields */
> -        val |= cdev->cpu ? 1 : 0;
> +        val |= cdev->is_enabled ? 1 : 0;
>           val |= cdev->is_inserting ? 2 : 0;
>           val |= cdev->is_removing  ? 4 : 0;
>           val |= cdev->fw_remove  ? 16 : 0;
> +        val |= cdev->is_present ? 32 : 0;
>           trace_cpuhp_acpi_read_flags(cpu_st->selector, val);
>           break;
>       case ACPI_CPU_CMD_DATA_OFFSET_RW:
> @@ -376,6 +377,7 @@ const VMStateDescription vmstate_cpu_hotplug = {
>   #define CPU_REMOVE_EVENT  "CRMV"
>   #define CPU_EJECT_EVENT   "CEJ0"
>   #define CPU_FW_EJECT_EVENT "CEJF"
> +#define CPU_PRESENT       "CPRS"
>   
>   void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
>                       build_madt_cpu_fn build_madt_cpu, hwaddr base_addr,
> @@ -436,7 +438,9 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
>           aml_append(field, aml_named_field(CPU_EJECT_EVENT, 1));
>           /* tell firmware to do device eject, write only */
>           aml_append(field, aml_named_field(CPU_FW_EJECT_EVENT, 1));
> -        aml_append(field, aml_reserved_field(3));
> +        /* 1 if present, read only */
> +        aml_append(field, aml_named_field(CPU_PRESENT, 1));
> +        aml_append(field, aml_reserved_field(2));
>           aml_append(field, aml_named_field(CPU_COMMAND, 8));
>           aml_append(cpu_ctrl_dev, field);
>   
> @@ -466,6 +470,7 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
>           Aml *ctrl_lock = aml_name("%s.%s", cphp_res_path, CPU_LOCK);
>           Aml *cpu_selector = aml_name("%s.%s", cphp_res_path, CPU_SELECTOR);
>           Aml *is_enabled = aml_name("%s.%s", cphp_res_path, CPU_ENABLED);
> +        Aml *is_present = aml_name("%s.%s", cphp_res_path, CPU_PRESENT);
>           Aml *cpu_cmd = aml_name("%s.%s", cphp_res_path, CPU_COMMAND);
>           Aml *cpu_data = aml_name("%s.%s", cphp_res_path, CPU_DATA);
>           Aml *ins_evt = aml_name("%s.%s", cphp_res_path, CPU_INSERT_EVENT);
> @@ -494,13 +499,26 @@ void build_cpus_aml(Aml *table, MachineState *machine, CPUHotplugFeatures opts,
>           {
>               Aml *idx = aml_arg(0);
>               Aml *sta = aml_local(0);
> +            Aml *ifctx2;
> +            Aml *else_ctx;
>   
>               aml_append(method, aml_acquire(ctrl_lock, 0xFFFF));
>               aml_append(method, aml_store(idx, cpu_selector));
>               aml_append(method, aml_store(zero, sta));
> -            ifctx = aml_if(aml_equal(is_enabled, one));
> +            ifctx = aml_if(aml_equal(is_present, one));
>               {
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

Here, the return value for _STA method is set to reflect the state of
CPU_PRESENT and CPU_ENABLED fields. I can't see these two fields being
mapped to AcpiCpuStatus.{is_present,is_enabled}. They look to be mapped
to the MMIO region (base_addr), which doesn't mapped to AcpiCpuStatus
afaics. So where CPU_PRESENT and CPU_ENABLED are set and where exactly
they reside?


Cheers,
Gustavo

> +                }
> +                aml_append(ifctx, else_ctx);
>               }
>               aml_append(method, ifctx);
>               aml_append(method, aml_release(ctrl_lock));
