Received: by 2002:a19:ee0d:0:0:0:0:0 with SMTP id g13csp4622147lfb;
        Tue, 27 Apr 2021 02:47:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw2cGUvXNe1GK7H6JibYJSneSo7TxU9g92STPsph10sgF2SoL5TiG4DJbKBKhX+fA+KlIaG
X-Received: by 2002:a25:c08e:: with SMTP id c136mr25977252ybf.103.1619516860680;
        Tue, 27 Apr 2021 02:47:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1619516860; cv=none;
        d=google.com; s=arc-20160816;
        b=m+OoMfUt3uh6U9pqn0pp4qRPyvLBvIeD/xAQvUxhEmK/6+0xegdJFRnSMIc1mTgmFE
         9joxcnp3nNV+QsY31O93GZkWX2f2kUG+VhdZxqSIcp6bHRzg0liR/130NVpWHFfF1jfu
         2+erUks712mv8cfoPKXtI4nq7TS9BhvV1q76cZXTYa6Q4vobickj9vQ+4D86JjneVE6a
         VJpm4MA3slTonbQKswNNy+ooYk95/bu6pHLNcF6c8W787vp3vlrqvQ/sSZTCSURVgxFN
         9gYuv+eX79glzHJmUV+Sx/TN6kfa4Zdm03mtm7/1PqNo2lnpie64PySosHnnu9yW4BW+
         Ynng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=krFmCDcJxLT5+gaPetSe7BYsvCcjKk2OQhbuBjS8Cmk=;
        b=hg32D1UKD5N4mlvJU5PMrkvFXw3sh4NgE/QZSKS+bVzXP1wb1DpfJ3VHU8z71gSXeL
         FBAMKGEhEDDqVPgqmYqcOlf92p7pTxyy0RMOcTQAmjpdTLoQY+ofYUTy5hP6lA4F81kK
         dQhaF/PiZOUmWneT/hAhe2cjpQrMtw8SKXtMRCerAqYTEy4tiewkCHYGhZsJlv76sxXP
         e+pPG/rjuoSyynqUWvgdTi0BWuKabV4wngyUPeVwTVtBPIBzcsqrzd+WptErDxqiKZdY
         9mQY5OJhyECvG7dqotvKQJbs/2k+qO7bhVEOSoGywcHAq2WJshEhh4yRVOvvANBtN69A
         UGEQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=e0j+0yJ6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i9si19562692ybj.95.2021.04.27.02.47.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 27 Apr 2021 02:47:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=e0j+0yJ6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47292 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lbKJf-00083g-VN
	for alex.bennee@linaro.org; Tue, 27 Apr 2021 05:47:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lbKJT-00082C-JH
 for qemu-arm@nongnu.org; Tue, 27 Apr 2021 05:47:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30181)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lbKJQ-0005m3-2F
 for qemu-arm@nongnu.org; Tue, 27 Apr 2021 05:47:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619516842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=krFmCDcJxLT5+gaPetSe7BYsvCcjKk2OQhbuBjS8Cmk=;
 b=e0j+0yJ6S7O3mRSz2qO3aHxcLnSZZDqhFzbxDHAwFP7tPI2/5s8g+6sOW/93RKrwOcMGg1
 UdkZx3U3FCvKL3dvswQTb8R4PKNqKJAVkxM0LnKaEdnETd59y/zJjz/Ua8CHrIVqJQ5Gdc
 T8u9jGvrc5bHyHhnF1Mpqq1ZsasVmME=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-VRWdoHs1M2eFcpTsJl02RQ-1; Tue, 27 Apr 2021 05:47:20 -0400
X-MC-Unique: VRWdoHs1M2eFcpTsJl02RQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 89-20020adf83e20000b029010c35eb9917so2520464wre.1
 for <qemu-arm@nongnu.org>; Tue, 27 Apr 2021 02:47:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=krFmCDcJxLT5+gaPetSe7BYsvCcjKk2OQhbuBjS8Cmk=;
 b=YAhFNsXlUrht4vWER8P4qGvMBbyyyZAndnAqT88Q+93MrNRstEy5SiTrJv5P1LuUrQ
 AIztBvj0f1yP4uf1ln6ivO1tV9mJQasl7pOPVAUQlDQNr8KNWv8pv1m/8f38GcANAf71
 40FSKTzrRSm2J302Jb7hZWvzTI3Y22qinEZ55FpjkeeOyoTsCUO7W+EkyrSRK+oD98x0
 jmYNTDsCW1t6kE6skQ1nysG1ur3OnF4elh7F+IC5haYhJJWMBRnts+nnWnN2m2P+JYuF
 5Zk+VotZ3Fhkod/cikBOQ/hzl1jt9KygZGxkcJyp7DotibQYFlnH73n6LSoaRcGUUe0h
 ZH2w==
X-Gm-Message-State: AOAM531C1yCzxgM2GGmTW/K9OY8WQoYTyLBNwT1onqWxF8Jp/cGwpuJn
 sHIp+XDOi8Qs8A6/eUF6t70zrHdHk2VjvtNbxOEe0A4ztjO0EAE77H05iH1gSCxTGGDMU5/dlO9
 BlA6rOjSVs8bc
X-Received: by 2002:a5d:4c87:: with SMTP id z7mr14793871wrs.144.1619516838973; 
 Tue, 27 Apr 2021 02:47:18 -0700 (PDT)
X-Received: by 2002:a5d:4c87:: with SMTP id z7mr14793846wrs.144.1619516838736; 
 Tue, 27 Apr 2021 02:47:18 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id h8sm18116193wmq.19.2021.04.27.02.47.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Apr 2021 02:47:18 -0700 (PDT)
Subject: Re: [RFC PATCH v2 2/6] hw/arm/virt: DT: Add cpu-map
To: Yanan Wang <wangyanan55@huawei.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Andrew Jones <drjones@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20210413080745.33004-1-wangyanan55@huawei.com>
 <20210413080745.33004-3-wangyanan55@huawei.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <648ff988-35f6-1857-2194-0d3e11e0d15c@redhat.com>
Date: Tue, 27 Apr 2021 11:47:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210413080745.33004-3-wangyanan55@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Igor Mammedov <imammedo@redhat.com>,
 Alistair Francis <alistair.francis@wdc.com>, prime.zeng@hisilicon.com,
 yangyicong@huawei.com, yuzenghui@huawei.com, wanghaibin.wang@huawei.com,
 zhukeqian1@huawei.com, Jiajie Li <lijiajie11@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: u6dJVFTMAvEc

Hi Yanan, Drew,

On 4/13/21 10:07 AM, Yanan Wang wrote:
> From: Andrew Jones <drjones@redhat.com>
> 
> Support device tree CPU topology descriptions.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> Signed-off-by: Yanan Wang <wangyanan55@huawei.com>
> ---
>  hw/arm/virt.c         | 41 ++++++++++++++++++++++++++++++++++++++++-
>  include/hw/arm/virt.h |  1 +
>  2 files changed, 41 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 9f01d9041b..f4ae60ded9 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -352,10 +352,11 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
>      int cpu;
>      int addr_cells = 1;
>      const MachineState *ms = MACHINE(vms);
> +    const VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
>      int smp_cpus = ms->smp.cpus;
>  
>      /*
> -     * From Documentation/devicetree/bindings/arm/cpus.txt
> +     *  See Linux Documentation/devicetree/bindings/arm/cpus.yaml
>       *  On ARM v8 64-bit systems value should be set to 2,
>       *  that corresponds to the MPIDR_EL1 register size.
>       *  If MPIDR_EL1[63:32] value is equal to 0 on all CPUs
> @@ -408,8 +409,45 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
>                  ms->possible_cpus->cpus[cs->cpu_index].props.node_id);
>          }
>  
> +        if (ms->smp.cpus > 1 && !vmc->no_cpu_topology) {
> +            qemu_fdt_setprop_cell(ms->fdt, nodename, "phandle",
> +                                  qemu_fdt_alloc_phandle(ms->fdt));
> +        }
> +
>          g_free(nodename);
>      }
> +
> +    if (ms->smp.cpus > 1 && !vmc->no_cpu_topology) {
> +        /*
> +         * See Linux Documentation/devicetree/bindings/cpu/cpu-topology.txt
> +         * In a SMP system, the hierarchy of CPUs is defined through four
> +         * entities that are used to describe the layout of physical CPUs
> +         * in the system: socket/cluster/core/thread.
> +         */
> +        qemu_fdt_add_subnode(ms->fdt, "/cpus/cpu-map");
> +
> +        for (cpu = ms->smp.cpus - 1; cpu >= 0; cpu--) {
> +            char *cpu_path = g_strdup_printf("/cpus/cpu@%d", cpu);
> +            char *map_path;
> +
> +            if (ms->smp.threads > 1) {
> +                map_path = g_strdup_printf(
> +                    "/cpus/cpu-map/%s%d/%s%d/%s%d",
> +                    "socket", cpu / (ms->smp.cores * ms->smp.threads),
> +                    "core", (cpu / ms->smp.threads) % ms->smp.cores,
> +                    "thread", cpu % ms->smp.threads);
> +            } else {
> +                map_path = g_strdup_printf(
> +                    "/cpus/cpu-map/%s%d/%s%d",
> +                    "socket", cpu / ms->smp.cores,
> +                    "core", cpu % ms->smp.cores);
> +            }
> +            qemu_fdt_add_path(ms->fdt, map_path);
> +            qemu_fdt_setprop_phandle(ms->fdt, map_path, "cpu", cpu_path);
> +            g_free(map_path);
> +            g_free(cpu_path);
> +        }
> +    }
>  }
>  
>  static void fdt_add_its_gic_node(VirtMachineState *vms)
> @@ -2769,6 +2807,7 @@ static void virt_machine_5_2_options(MachineClass *mc)
>      virt_machine_6_0_options(mc);
>      compat_props_add(mc->compat_props, hw_compat_5_2, hw_compat_5_2_len);
>      vmc->no_secure_gpio = true;
> +    vmc->no_cpu_topology = true;

Bare with me because "machine versioning" is something new to me, I was
expecting it to be only related to migrated fields.
Why do we need to care about not adding the FDT node in older machines?
Shouldn't the guest skip unknown FDT nodes?

Thanks,

Phil.

>  }
>  DEFINE_VIRT_MACHINE(5, 2)
>  
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 921416f918..4a4b98e4a7 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -129,6 +129,7 @@ struct VirtMachineClass {
>      bool no_kvm_steal_time;
>      bool acpi_expose_flash;
>      bool no_secure_gpio;
> +    bool no_cpu_topology;
>  };
>  
>  struct VirtMachineState {
> 

