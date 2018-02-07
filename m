Received: by 10.28.71.27 with SMTP id u27csp786476wma;
        Wed, 7 Feb 2018 06:30:08 -0800 (PST)
X-Google-Smtp-Source: AH8x2253iv+bHju355L3+f/zHuwOBVfGtZ7bdrInMRxK0v689hFrKrvEydA8ATMhXalRebyqZd4G
X-Received: by 10.129.115.86 with SMTP id o83mr3970711ywc.0.1518013808496;
        Wed, 07 Feb 2018 06:30:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518013808; cv=none;
        d=google.com; s=arc-20160816;
        b=wC8TcZdfE8/DzDmoUEKwtEJWt4BLSLkqp6h0exaMarfS9NRB3E8JAP3fzhJ+c2aV6c
         z8TEbDnHMZQngK+yFa2hASGKZOZ90uGk6AghbhyPlYxl2PiAtsrgHsQz/3ktmq6cBrbV
         2N6v2EJrCWuGlhxi46JBK64S1vd7wsuzAqjjDGOXS26NTV5Xtnd1w/HckCddK6Ezlfgs
         luwZzO4BLnz3uRMY/F6acOvksnxbK4G+YkaaG/I5mSK3kh32rA0QI1VoLJO/jAvrKM7H
         582A671cShw5fgU3NuE9yOYmmHxjYqaajAXlmwQnDdQVvCe245njERL+dT2mINKJWTLO
         +APw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=WMrDsVYc88yT8c9cI4GmXzXOQ0MB8c09OKSD/5YTtOk=;
        b=B0VztmlJRHPYJoPu+OhskL4hgY/rAgNLwDCOMTvhwTJuYgkXMuGppFHGXOOs2MZcb1
         6nqThdCOgNxr+4YZvMRCrTBKEeg0UUa2gClayWzNI2beSqZbXXY2gAg9OQzA3Pf7qq5D
         mkcG7Hgei+yL/iSejeVdD1JiEybURuZtWjmrGE1yohiTe/s7ErTeSJZPZLxF1EV9o3CD
         ND9XvYfbFWjKX/dH35IigGiT69kiaBYH3zzJaUhAmX9qS6jtokPUeueIX/oM3XYvZn9v
         HV0xbznoUDnCpuY+axfi93OuvIvOG3G4hDe/sw16KmvHKfc/pm5WxRWzk4am2mbd+C4g
         wP4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=q+EoENw5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 17si282000ybl.749.2018.02.07.06.30.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 07 Feb 2018 06:30:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=q+EoENw5;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:45211 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ejQjf-0002c3-Pk
	for alex.bennee@linaro.org; Wed, 07 Feb 2018 09:30:07 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55629)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ejQha-0001RO-WB
	for qemu-devel@nongnu.org; Wed, 07 Feb 2018 09:28:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ejQhX-0002AE-Gl
	for qemu-devel@nongnu.org; Wed, 07 Feb 2018 09:27:58 -0500
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:40157)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1ejQhX-0002A3-Cg; Wed, 07 Feb 2018 09:27:55 -0500
Received: by mail-qk0-x241.google.com with SMTP id e20so1284963qkm.7;
	Wed, 07 Feb 2018 06:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=WMrDsVYc88yT8c9cI4GmXzXOQ0MB8c09OKSD/5YTtOk=;
	b=q+EoENw5S0i+7/CHC0Zy77BUhdidux9c/op9JG04GIPg9JZt9q9SmwuGozXUMaDs7q
	g6HJ8v7qL6iUMq1kv4OlLXAV3W5XaKncGXCtQwQiDVwZdtZIcD5vZ5A5PgFtG0Ubtq7I
	2Rb5PvZ8KauK8fhdg24V7ODgNpRAb02ye1FnJsm6t8u6gLDf1zm20O48UYxPR7qiJqKl
	umLJZ7Rd56qK7PMHWfeuzV5MxIbSYtUi3qTsbwpUw75cA4tRbMpavYSLdskcZX4zj2+L
	ZqwXNd59NufjjmxgHnhLBhyyBlEjBZNkVv5zjGv0cAQUmv4lxBipIZpvqKMzc0+oBJ/X
	09HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=WMrDsVYc88yT8c9cI4GmXzXOQ0MB8c09OKSD/5YTtOk=;
	b=ApTal/DFI/OlKgM6UT8GgRrq/qNMGmOXuBm12UzKZtY/++dxZwFesPDepRGcwMN40V
	077BImO9WqeTSifgNjmFoVgKNzGwVYQ+EAwzL0lNN6DBOP+BpKNMwG3CdFlU1So4pcRF
	E21kZ2XlTU56Ruvj2s2GlXbEJb78ffh7GqisTFo5XOxLUNHJ3Pg6/buVGCGw6lYL8lLq
	Z9hyzUWf+1ZJrdlcve17q5TFjmuqX47PHSACEK/zswioCC2jHhDcwNjP4FmHYeoGGzbl
	RhORbtucurJcTNFctqBDadivvnoiOPydmARgG/D37gkCYCm+jFSEJEAV+r0MYTdC0dmu
	bp9g==
X-Gm-Message-State: APf1xPBXAnHvRrErd0Hjibk03rGjufgYCRPQmK9bQa62BJRUjlxRYBtr
	wTmJONRj/KlWqXK62YNdK0E=
X-Received: by 10.55.135.1 with SMTP id j1mr8666138qkd.321.1518013674820;
	Wed, 07 Feb 2018 06:27:54 -0800 (PST)
Received: from [192.168.1.11] ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id
	f125sm1077607qkd.58.2018.02.07.06.27.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 Feb 2018 06:27:54 -0800 (PST)
To: Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-arm@nongnu.org
References: <20180207042438.15422-1-andrew.smirnov@gmail.com>
	<20180207042438.15422-14-andrew.smirnov@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <cb7e0d04-9de7-43c2-d9e3-e900d1d9b7f8@amsat.org>
Date: Wed, 7 Feb 2018 11:27:51 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <20180207042438.15422-14-andrew.smirnov@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: Re: [Qemu-devel] [PATCH v5 13/14] hw/arm: Move virt's PSCI DT fixup
 code to arm/boot.c
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@zoho.com>,
	qemu-devel@nongnu.org, yurovsky@gmail.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Rx5Vo7moBwFQ

On 02/07/2018 01:24 AM, Andrey Smirnov wrote:
> Move virt's PSCI DT fixup code to arm/boot.c and set this fixup to
> happen automatically for every board that doesn't mark "psci-conduit"
> as disabled. This way emulated boards other than "virt" that rely on
> PSIC for SMP could benefit from that code.
> 
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Cc: Marcel Apfelbaum <marcel.apfelbaum@zoho.com>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org
> Cc: yurovsky@gmail.com
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  hw/arm/boot.c | 65 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  hw/arm/virt.c | 61 -------------------------------------------------------
>  2 files changed, 65 insertions(+), 61 deletions(-)
> 
> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
> index c2720c8046..18ada9152c 100644
> --- a/hw/arm/boot.c
> +++ b/hw/arm/boot.c
> @@ -384,6 +384,69 @@ static void set_kernel_args_old(const struct arm_boot_info *info)
>      }
>  }
>  
> +static void fdt_add_psci_node(void *fdt)
> +{
> +    uint32_t cpu_suspend_fn;
> +    uint32_t cpu_off_fn;
> +    uint32_t cpu_on_fn;
> +    uint32_t migrate_fn;
> +    ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(0));
> +    const char *psci_method;
> +    int64_t psci_conduit;
> +
> +    psci_conduit = object_property_get_int(OBJECT(armcpu),
> +                                           "psci-conduit",
> +                                           &error_abort);
> +    switch (psci_conduit) {
> +    case QEMU_PSCI_CONDUIT_DISABLED:
> +        return;
> +    case QEMU_PSCI_CONDUIT_HVC:
> +        psci_method = "hvc";
> +        break;
> +    case QEMU_PSCI_CONDUIT_SMC:
> +        psci_method = "smc";
> +        break;
> +    default:
> +        g_assert_not_reached();
> +    }
> +
> +    qemu_fdt_add_subnode(fdt, "/psci");
> +    if (armcpu->psci_version == 2) {
> +        const char comp[] = "arm,psci-0.2\0arm,psci";
> +        qemu_fdt_setprop(fdt, "/psci", "compatible", comp, sizeof(comp));
> +
> +        cpu_off_fn = QEMU_PSCI_0_2_FN_CPU_OFF;
> +        if (arm_feature(&armcpu->env, ARM_FEATURE_AARCH64)) {
> +            cpu_suspend_fn = QEMU_PSCI_0_2_FN64_CPU_SUSPEND;
> +            cpu_on_fn = QEMU_PSCI_0_2_FN64_CPU_ON;
> +            migrate_fn = QEMU_PSCI_0_2_FN64_MIGRATE;
> +        } else {
> +            cpu_suspend_fn = QEMU_PSCI_0_2_FN_CPU_SUSPEND;
> +            cpu_on_fn = QEMU_PSCI_0_2_FN_CPU_ON;
> +            migrate_fn = QEMU_PSCI_0_2_FN_MIGRATE;
> +        }
> +    } else {
> +        qemu_fdt_setprop_string(fdt, "/psci", "compatible", "arm,psci");
> +
> +        cpu_suspend_fn = QEMU_PSCI_0_1_FN_CPU_SUSPEND;
> +        cpu_off_fn = QEMU_PSCI_0_1_FN_CPU_OFF;
> +        cpu_on_fn = QEMU_PSCI_0_1_FN_CPU_ON;
> +        migrate_fn = QEMU_PSCI_0_1_FN_MIGRATE;
> +    }
> +
> +    /* We adopt the PSCI spec's nomenclature, and use 'conduit' to refer
> +     * to the instruction that should be used to invoke PSCI functions.
> +     * However, the device tree binding uses 'method' instead, so that is
> +     * what we should use here.
> +     */
> +    qemu_fdt_setprop_string(fdt, "/psci", "method", psci_method);
> +
> +    qemu_fdt_setprop_cell(fdt, "/psci", "cpu_suspend", cpu_suspend_fn);
> +    qemu_fdt_setprop_cell(fdt, "/psci", "cpu_off", cpu_off_fn);
> +    qemu_fdt_setprop_cell(fdt, "/psci", "cpu_on", cpu_on_fn);
> +    qemu_fdt_setprop_cell(fdt, "/psci", "migrate", migrate_fn);
> +}
> +
>  /**
>   * load_dtb() - load a device tree binary image into memory
>   * @addr:       the address to load the image at
> @@ -540,6 +603,8 @@ static int load_dtb(hwaddr addr, const struct arm_boot_info *binfo,
>          }
>      }
>  
> +    fdt_add_psci_node(fdt);
> +
>      if (binfo->modify_dtb) {
>          binfo->modify_dtb(binfo, fdt);
>      }
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index b334c82eda..dbb3c8036a 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -244,66 +244,6 @@ static void create_fdt(VirtMachineState *vms)
>      }
>  }
>  
> -static void fdt_add_psci_node(const VirtMachineState *vms)
> -{
> -    uint32_t cpu_suspend_fn;
> -    uint32_t cpu_off_fn;
> -    uint32_t cpu_on_fn;
> -    uint32_t migrate_fn;
> -    void *fdt = vms->fdt;
> -    ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(0));
> -    const char *psci_method;
> -
> -    switch (vms->psci_conduit) {
> -    case QEMU_PSCI_CONDUIT_DISABLED:
> -        return;
> -    case QEMU_PSCI_CONDUIT_HVC:
> -        psci_method = "hvc";
> -        break;
> -    case QEMU_PSCI_CONDUIT_SMC:
> -        psci_method = "smc";
> -        break;
> -    default:
> -        g_assert_not_reached();
> -    }
> -
> -    qemu_fdt_add_subnode(fdt, "/psci");
> -    if (armcpu->psci_version == 2) {
> -        const char comp[] = "arm,psci-0.2\0arm,psci";
> -        qemu_fdt_setprop(fdt, "/psci", "compatible", comp, sizeof(comp));
> -
> -        cpu_off_fn = QEMU_PSCI_0_2_FN_CPU_OFF;
> -        if (arm_feature(&armcpu->env, ARM_FEATURE_AARCH64)) {
> -            cpu_suspend_fn = QEMU_PSCI_0_2_FN64_CPU_SUSPEND;
> -            cpu_on_fn = QEMU_PSCI_0_2_FN64_CPU_ON;
> -            migrate_fn = QEMU_PSCI_0_2_FN64_MIGRATE;
> -        } else {
> -            cpu_suspend_fn = QEMU_PSCI_0_2_FN_CPU_SUSPEND;
> -            cpu_on_fn = QEMU_PSCI_0_2_FN_CPU_ON;
> -            migrate_fn = QEMU_PSCI_0_2_FN_MIGRATE;
> -        }
> -    } else {
> -        qemu_fdt_setprop_string(fdt, "/psci", "compatible", "arm,psci");
> -
> -        cpu_suspend_fn = QEMU_PSCI_0_1_FN_CPU_SUSPEND;
> -        cpu_off_fn = QEMU_PSCI_0_1_FN_CPU_OFF;
> -        cpu_on_fn = QEMU_PSCI_0_1_FN_CPU_ON;
> -        migrate_fn = QEMU_PSCI_0_1_FN_MIGRATE;
> -    }
> -
> -    /* We adopt the PSCI spec's nomenclature, and use 'conduit' to refer
> -     * to the instruction that should be used to invoke PSCI functions.
> -     * However, the device tree binding uses 'method' instead, so that is
> -     * what we should use here.
> -     */
> -    qemu_fdt_setprop_string(fdt, "/psci", "method", psci_method);
> -
> -    qemu_fdt_setprop_cell(fdt, "/psci", "cpu_suspend", cpu_suspend_fn);
> -    qemu_fdt_setprop_cell(fdt, "/psci", "cpu_off", cpu_off_fn);
> -    qemu_fdt_setprop_cell(fdt, "/psci", "cpu_on", cpu_on_fn);
> -    qemu_fdt_setprop_cell(fdt, "/psci", "migrate", migrate_fn);
> -}
> -
>  static void fdt_add_timer_nodes(const VirtMachineState *vms)
>  {
>      /* On real hardware these interrupts are level-triggered.
> @@ -1409,7 +1349,6 @@ static void machvirt_init(MachineState *machine)
>      }
>      fdt_add_timer_nodes(vms);
>      fdt_add_cpu_nodes(vms);
> -    fdt_add_psci_node(vms);
>  
>      memory_region_allocate_system_memory(ram, NULL, "mach-virt.ram",
>                                           machine->ram_size);
> 
