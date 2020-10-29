Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp737955lfa;
        Thu, 29 Oct 2020 10:08:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxMFfC2anTHvF1+uQBAhcBbPs84cHGW9yv1ublxyNmW63JibvNhuIJ12Du3g8pRRkl5HYw5
X-Received: by 2002:a67:e889:: with SMTP id x9mr4452022vsn.26.1603991318523;
        Thu, 29 Oct 2020 10:08:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603991318; cv=none;
        d=google.com; s=arc-20160816;
        b=PXA4xvWo5vZyIgqNgCld1qdx7HlHSLY/We2zwXFRoUL0kKcuSCtDnKYulwl/E+eATV
         YIOYZeiRU49eNDcnEMJeYNwB9Afa4Bcerj7jf3ER2cQqigX1jGD5DmJXzuolc4XIjcVF
         XQqkqBzQN4Lgs1WafvGSV99j23Fx2PdlEtACwEDeoQnxjv+qLz2S2nYI1ql5mE5KeNli
         BE4KRdvCPuYG2ZQsCR4N4pnioBdLhqTMB611OXGg0NbAtlW0l1Xn1NUJSjA/DnlvxyCh
         SuVjJ1SUmT09d5h+jHX35yWeOU5KToeaOdPgtKlLX+TZdoJEQFLa3m7OYvbrd5uKszoX
         Dovw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=B+zVOemFiHVTDcIVUt1Y4hBbU2kugiOlwPQQVEZxo/o=;
        b=GMXT+aFMrmu2SRN8fRmWcSB6VJrnHTogsjllmmRbVHePk0PVwFdd6fXUEQSPF4dPUZ
         7Z5L2pVvG+KjLbDCos0s99GkgarviqNgDiPU/moymMt8XXKlLH+Vlz4KLSn/AY6njDLS
         CrrG4LsQ1WRWMDKDBSA5rkkZYQkvo1MMlTyGJuggmyklvXnWvfoqP0yj5pn2hkoYoNdG
         MDcaIyWa2QqUPrXbRaCavnLjUpuJU2AA9/6tb+oM/5xorMv9VkmCCATSh3hXLAS23WYh
         UrkQ2BP6DUgciMTyMnNzXAXT9CPiUAbPZTNX0/Ys0+Ua3KNqhAxqEk/zohZUK353Mm5b
         Ncvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZGMBNKB4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k3si642177uao.37.2020.10.29.10.08.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 29 Oct 2020 10:08:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ZGMBNKB4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:39254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kYBPh-0004mN-Se
	for alex.bennee@linaro.org; Thu, 29 Oct 2020 13:08:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kYBPZ-0004lu-Uy
 for qemu-arm@nongnu.org; Thu, 29 Oct 2020 13:08:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1kYBPW-0002CH-P5
 for qemu-arm@nongnu.org; Thu, 29 Oct 2020 13:08:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603991305;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=B+zVOemFiHVTDcIVUt1Y4hBbU2kugiOlwPQQVEZxo/o=;
 b=ZGMBNKB4ITx/dEdYmuJ/yvvzrKhPv7UFqgWhPows3KlsGPm6olSjZ9R1n2rLPJvtmCBPUz
 iShyADZV1M2woFfb1PjeXfOS0GPrVjYohpYiHZZ6GhkkwGTWyUkIClKA6GuWolTjRXKIb2
 2F87LH/PsxCvdmIjsnptFzcfumvRX1U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-Mf_lySZxNdmvUJFN3HCKhA-1; Thu, 29 Oct 2020 13:08:21 -0400
X-MC-Unique: Mf_lySZxNdmvUJFN3HCKhA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7580A809DC9;
 Thu, 29 Oct 2020 17:08:19 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.192.219])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 71B5D5C26A;
 Thu, 29 Oct 2020 17:08:16 +0000 (UTC)
Date: Thu, 29 Oct 2020 18:08:13 +0100
From: Andrew Jones <drjones@redhat.com>
To: Ying Fang <fangying1@huawei.com>
Subject: Re: [RFC PATCH v2 05/13] hw: add compat machines for 5.3
Message-ID: <20201029170813.n7kst474zrh24m2t@kamzik.brq.redhat.com>
References: <20201020131440.1090-1-fangying1@huawei.com>
 <20201020131440.1090-6-fangying1@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20201020131440.1090-6-fangying1@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/29 01:47:28
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, zhang.zhanghailiang@huawei.com,
 qemu-devel@nongnu.org, alex.chen@huawei.com, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, alistair.francis@wdc.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zaNy7Jty431u

On Tue, Oct 20, 2020 at 09:14:32PM +0800, Ying Fang wrote:
> Add 5.2 machine types for arm/i440fx/q35/s390x/spapr.
      ^ 5.3

Thanks,
drew

> 
> Signed-off-by: Ying Fang <fangying1@huawei.com>
> ---
>  hw/arm/virt.c              |  9 ++++++++-
>  hw/core/machine.c          |  3 +++
>  hw/i386/pc.c               |  3 +++
>  hw/i386/pc_piix.c          | 15 ++++++++++++++-
>  hw/i386/pc_q35.c           | 14 +++++++++++++-
>  hw/ppc/spapr.c             | 15 +++++++++++++--
>  hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
>  include/hw/boards.h        |  3 +++
>  include/hw/i386/pc.h       |  3 +++
>  9 files changed, 73 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index ba902b53ba..ff8a14439e 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2665,10 +2665,17 @@ static void machvirt_machine_init(void)
>  }
>  type_init(machvirt_machine_init);
>  
> +static void virt_machine_5_3_options(MachineClass *mc)
> +{
> +}
> +DEFINE_VIRT_MACHINE_AS_LATEST(5, 3)
> +
>  static void virt_machine_5_2_options(MachineClass *mc)
>  {
> +    virt_machine_5_3_options(mc);
> +    compat_props_add(mc->compat_props, hw_compat_5_2, hw_compat_5_2_len);
>  }
> -DEFINE_VIRT_MACHINE_AS_LATEST(5, 2)
> +DEFINE_VIRT_MACHINE(5, 2)
>  
>  static void virt_machine_5_1_options(MachineClass *mc)
>  {
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 7e2f4ec08e..6dc77699a9 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -28,6 +28,9 @@
>  #include "hw/mem/nvdimm.h"
>  #include "migration/vmstate.h"
>  
> +GlobalProperty hw_compat_5_2[] = { };
> +const size_t hw_compat_5_2_len = G_N_ELEMENTS(hw_compat_5_2);
> +
>  GlobalProperty hw_compat_5_1[] = {
>      { "vhost-scsi", "num_queues", "1"},
>      { "vhost-user-blk", "num-queues", "1"},
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index e87be5d29a..eaa046ff5d 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -97,6 +97,9 @@
>  #include "trace.h"
>  #include CONFIG_DEVICES
>  
> +GlobalProperty pc_compat_5_2[] = { };
> +const size_t pc_compat_5_2_len = G_N_ELEMENTS(pc_compat_5_2);
> +
>  GlobalProperty pc_compat_5_1[] = {
>      { "ICH9-LPC", "x-smi-cpu-hotplug", "off" },
>  };
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 3c2ae0612b..01254090ce 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -426,7 +426,7 @@ static void pc_i440fx_machine_options(MachineClass *m)
>      machine_class_allow_dynamic_sysbus_dev(m, TYPE_VMBUS_BRIDGE);
>  }
>  
> -static void pc_i440fx_5_2_machine_options(MachineClass *m)
> +static void pc_i440fx_5_3_machine_options(MachineClass *m)
>  {
>      PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
>      pc_i440fx_machine_options(m);
> @@ -435,6 +435,19 @@ static void pc_i440fx_5_2_machine_options(MachineClass *m)
>      pcmc->default_cpu_version = 1;
>  }
>  
> +DEFINE_I440FX_MACHINE(v5_3, "pc-i440fx-5.3", NULL,
> +                      pc_i440fx_5_3_machine_options);
> +
> +static void pc_i440fx_5_2_machine_options(MachineClass *m)
> +{
> +    PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
> +    pc_i440fx_machine_options(m);
> +    m->alias = NULL;
> +    m->is_default = false;
> +    compat_props_add(m->compat_props, hw_compat_5_2, hw_compat_5_2_len);
> +    compat_props_add(m->compat_props, pc_compat_5_2, pc_compat_5_2_len);
> +}
> +
>  DEFINE_I440FX_MACHINE(v5_2, "pc-i440fx-5.2", NULL,
>                        pc_i440fx_5_2_machine_options);
>  
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index a3f4959c43..dd14803edb 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -344,7 +344,7 @@ static void pc_q35_machine_options(MachineClass *m)
>      m->max_cpus = 288;
>  }
>  
> -static void pc_q35_5_2_machine_options(MachineClass *m)
> +static void pc_q35_5_3_machine_options(MachineClass *m)
>  {
>      PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
>      pc_q35_machine_options(m);
> @@ -352,6 +352,18 @@ static void pc_q35_5_2_machine_options(MachineClass *m)
>      pcmc->default_cpu_version = 1;
>  }
>  
> +DEFINE_Q35_MACHINE(v5_3, "pc-q35-5.3", NULL,
> +                   pc_q35_5_3_machine_options);
> +
> +static void pc_q35_5_2_machine_options(MachineClass *m)
> +{
> +    PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
> +    pc_q35_machine_options(m);
> +    m->alias = NULL;
> +    compat_props_add(m->compat_props, hw_compat_5_2, hw_compat_5_2_len);
> +    compat_props_add(m->compat_props, pc_compat_5_2, pc_compat_5_2_len);
> +}
> +
>  DEFINE_Q35_MACHINE(v5_2, "pc-q35-5.2", NULL,
>                     pc_q35_5_2_machine_options);
>  
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 2db810f73a..c292a3edd9 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -4511,15 +4511,26 @@ static void spapr_machine_latest_class_options(MachineClass *mc)
>      }                                                                \
>      type_init(spapr_machine_register_##suffix)
>  
> +/*
> + * pseries-5.3
> + */
> +static void spapr_machine_5_3_class_options(MachineClass *mc)
> +{
> +    /* Defaults for the latest behaviour inherited from the base class */
> +}
> +
> +DEFINE_SPAPR_MACHINE(5_3, "5.3", true);
> +
>  /*
>   * pseries-5.2
>   */
>  static void spapr_machine_5_2_class_options(MachineClass *mc)
>  {
> -    /* Defaults for the latest behaviour inherited from the base class */
> +    spapr_machine_5_3_class_options(mc);
> +    compat_props_add(mc->compat_props, hw_compat_5_2, hw_compat_5_2_len);
>  }
>  
> -DEFINE_SPAPR_MACHINE(5_2, "5.2", true);
> +DEFINE_SPAPR_MACHINE(5_2, "5.2", false);
>  
>  /*
>   * pseries-5.1
> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
> index 28266a3a35..bde084e13d 100644
> --- a/hw/s390x/s390-virtio-ccw.c
> +++ b/hw/s390x/s390-virtio-ccw.c
> @@ -789,14 +789,26 @@ bool css_migration_enabled(void)
>      }                                                                         \
>      type_init(ccw_machine_register_##suffix)
>  
> +static void ccw_machine_5_3_instance_options(MachineState *machine)
> +{
> +}
> +
> +static void ccw_machine_5_3_class_options(MachineClass *mc)
> +{
> +}
> +DEFINE_CCW_MACHINE(5_3, "5.3", true);
> +
>  static void ccw_machine_5_2_instance_options(MachineState *machine)
>  {
> +    ccw_machine_5_3_instance_options(machine);
>  }
>  
>  static void ccw_machine_5_2_class_options(MachineClass *mc)
>  {
> +    ccw_machine_5_3_class_options(mc);
> +    compat_props_add(mc->compat_props, hw_compat_5_2, hw_compat_5_2_len);
>  }
> -DEFINE_CCW_MACHINE(5_2, "5.2", true);
> +DEFINE_CCW_MACHINE(5_2, "5.2", false);
>  
>  static void ccw_machine_5_1_instance_options(MachineState *machine)
>  {
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index bf53e8a16e..f631c1799d 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -311,6 +311,9 @@ struct MachineState {
>      } \
>      type_init(machine_initfn##_register_types)
>  
> +extern GlobalProperty hw_compat_5_2[];
> +extern const size_t hw_compat_5_2_len;
> +
>  extern GlobalProperty hw_compat_5_1[];
>  extern const size_t hw_compat_5_1_len;
>  
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index 84639d0ebc..6f1531ed14 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -190,6 +190,9 @@ void pc_system_firmware_init(PCMachineState *pcms, MemoryRegion *rom_memory);
>  void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
>                         const CPUArchIdList *apic_ids, GArray *entry);
>  
> +extern GlobalProperty pc_compat_5_2[];
> +extern const size_t pc_compat_5_2_len;
> +
>  extern GlobalProperty pc_compat_5_1[];
>  extern const size_t pc_compat_5_1_len;
>  
> -- 
> 2.23.0
> 
> 

