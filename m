Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp1619677lfy;
        Wed, 29 Jul 2020 07:11:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzJu213OOZiBfkg1xunrmm+lDSru6NrgRy/Id0yaKG6wDKPDfb4Wf+E+oCImftt70i9ePRv
X-Received: by 2002:a25:9789:: with SMTP id i9mr19775406ybo.243.1596031918595;
        Wed, 29 Jul 2020 07:11:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596031918; cv=none;
        d=google.com; s=arc-20160816;
        b=hBBwhiwqD0NP6UhLEQ9EmbfLrld7M7c6F//wlH7QIiljPOUumgjhu1FLq92prSextj
         rmX05/jRyyQ/jai8KJisqywOVoHG9K5fO8qmNkpZzjb7mYkWNkMKSFOq40uuYlyBx4IZ
         SYjAtnGvgZ7n+SCjE5q6/4IuGCDpo1tR5dIG5+G+j5Vs5qTAWAxCRdQ/bjoVQPk1vJ+g
         nHb3L8xPEUZd3/LLUcRYBHhJ/NWG3kGt6PL1gkHXGJD1NxXY5pDALWUytm8fNrwKCAJi
         bf75x76LeLEn/ot5Yl+W63kOh77osxJ/6So1Gq+/KoVx/vSmmhQO3B1lSMcUA6BV2mjT
         Fomw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=41rKLPHfRjo1IrFanpHQc1/6wKqY0LgZwOqqRKXyEMI=;
        b=y5VykSJq7u/1iEdK6EPsFZcQPfYLfMKwLi8HQ9Pot7WqR4pBLgTu+H3oZJ8PtL7zLM
         v1suFcqlVySRSP5RQLt509wOneEEI4jTrRNO+b6k8omX+vypa4/yXnt9J+yZwX/rEEDu
         rCgs6k+A7EOW2/5tVLic78TJ7GA3VnJUD3wpjReEqCDQpWhfuB9AZPK98ordnMUAPYri
         t7ldCokjdiK3UABORZNr6QnPgxIaW1ut8gTwZovITvIl3tLIk/lf+tKo+ac1f+kfCua9
         5md0iYE/ak9aAoZ1iwPvfpyN9xjyDeS9OyfFNzfuFrJUF3u9+50ant2v5SBNXYi2Wkgv
         LPrw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HtV4r50s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z12si2300491ybm.201.2020.07.29.07.11.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Jul 2020 07:11:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HtV4r50s;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k0moH-00012W-U4
	for alex.bennee@linaro.org; Wed, 29 Jul 2020 10:11:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1k0mnX-0008Ad-1t
 for qemu-arm@nongnu.org; Wed, 29 Jul 2020 10:11:11 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:57181
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1k0mnT-0007Zl-3R
 for qemu-arm@nongnu.org; Wed, 29 Jul 2020 10:11:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596031866;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=41rKLPHfRjo1IrFanpHQc1/6wKqY0LgZwOqqRKXyEMI=;
 b=HtV4r50sfUOnCTHgosNu+iSE9ZUtqVb7Du0i39R+525dYH7eImaXbGC/u2kdLNNAndUXHI
 Wx4pRYaF/DHFdvwJ2mvDdUDU/sze96BZR6Vf7M1IBomfhPbBzAJYOATG2vNpEkcsQwjHx7
 NyywaFiai5pRyIgagricbaCvrYgFfIA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-MXHf4BFUP5y5TOUjHHpJfA-1; Wed, 29 Jul 2020 10:11:02 -0400
X-MC-Unique: MXHf4BFUP5y5TOUjHHpJfA-1
Received: by mail-wr1-f70.google.com with SMTP id v4so6771122wrb.2
 for <qemu-arm@nongnu.org>; Wed, 29 Jul 2020 07:11:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=41rKLPHfRjo1IrFanpHQc1/6wKqY0LgZwOqqRKXyEMI=;
 b=R7pYPQ8piKkezev/7J6a6k8ZmA/1oQzB7hOaLDlbOkZrb3o2dpeO0kFUUn/gv03Qjp
 9S1hpliK9TkyOxI6nMsvGidsMb0ZJHBhI1HWqKc+5AF4UNGAeVjv7uEIfG/Yblgf8LPD
 JvRw0WFR2LycqTv85oAH9qSxTcHsW8LNjYXPWxBoUfomQkAYup3Qn0WnfVvNASEfQPRd
 ekl3gilh14UYvPOb5ncg9ksfkWeaBvA3THJp5zBVO2JuWsL8pNpqgKVl90ewUIv86Hei
 t776YBhVsAcSBX6qf8rUvynLlZCcM1IuazF/DBPfeJ8mmKFdwYd8hQX09kYwX55GChd8
 T4Rw==
X-Gm-Message-State: AOAM531RdJZLauiAqXJ3KXGbLzIcm7TA7Bn2FMCkabB/DyvPZz9e4I64
 ASOxqE1vM8n2Sv+kRMf51mzSlHoV6iO3CCCZ6W/RjGgNb0qd4OnB2S0n/PgbS1pjns8VSP/lJgl
 Xo2ntj6LkmvyU
X-Received: by 2002:a1c:81c8:: with SMTP id c191mr8812272wmd.23.1596031860831; 
 Wed, 29 Jul 2020 07:11:00 -0700 (PDT)
X-Received: by 2002:a1c:81c8:: with SMTP id c191mr8812250wmd.23.1596031860525; 
 Wed, 29 Jul 2020 07:11:00 -0700 (PDT)
Received: from redhat.com (bzq-79-179-105-63.red.bezeqint.net. [79.179.105.63])
 by smtp.gmail.com with ESMTPSA id p6sm4988552wru.33.2020.07.29.07.10.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jul 2020 07:10:59 -0700 (PDT)
Date: Wed, 29 Jul 2020 10:10:56 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH] hw: add compat machines for 5.2
Message-ID: <20200729101032-mutt-send-email-mst@kernel.org>
References: <20200728094645.272149-1-cohuck@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200728094645.272149-1-cohuck@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/29 09:18:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xWKamUNsU8+w

On Tue, Jul 28, 2020 at 11:46:45AM +0200, Cornelia Huck wrote:
> Add 5.2 machine types for arm/i440fx/q35/s390x/spapr.
> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>


We merge this kind of thing after the release, right?


> ---
>  hw/arm/virt.c              |  9 ++++++++-
>  hw/core/machine.c          |  3 +++
>  hw/i386/pc.c               |  3 +++
>  hw/i386/pc_piix.c          | 14 +++++++++++++-
>  hw/i386/pc_q35.c           | 13 ++++++++++++-
>  hw/ppc/spapr.c             | 15 +++++++++++++--
>  hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
>  include/hw/boards.h        |  3 +++
>  include/hw/i386/pc.h       |  3 +++
>  9 files changed, 71 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index ecfee362a182..acf9bfbeceaf 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2546,10 +2546,17 @@ static void machvirt_machine_init(void)
>  }
>  type_init(machvirt_machine_init);
>  
> +static void virt_machine_5_2_options(MachineClass *mc)
> +{
> +}
> +DEFINE_VIRT_MACHINE_AS_LATEST(5, 2)
> +
>  static void virt_machine_5_1_options(MachineClass *mc)
>  {
> +    virt_machine_5_2_options(mc);
> +    compat_props_add(mc->compat_props, hw_compat_5_1, hw_compat_5_1_len);
>  }
> -DEFINE_VIRT_MACHINE_AS_LATEST(5, 1)
> +DEFINE_VIRT_MACHINE(5, 1)
>  
>  static void virt_machine_5_0_options(MachineClass *mc)
>  {
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 2f881d6d75b8..a24fe18ab6a6 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -28,6 +28,9 @@
>  #include "hw/mem/nvdimm.h"
>  #include "migration/vmstate.h"
>  
> +GlobalProperty hw_compat_5_1[] = {};
> +const size_t hw_compat_5_1_len = G_N_ELEMENTS(hw_compat_5_1);
> +
>  GlobalProperty hw_compat_5_0[] = {
>      { "virtio-balloon-device", "page-poison", "false" },
>      { "vmport", "x-read-set-eax", "off" },
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 3d419d599127..1733b5341a62 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -97,6 +97,9 @@
>  #include "fw_cfg.h"
>  #include "trace.h"
>  
> +GlobalProperty pc_compat_5_1[] = {};
> +const size_t pc_compat_5_1_len = G_N_ELEMENTS(pc_compat_5_1);
> +
>  GlobalProperty pc_compat_5_0[] = {};
>  const size_t pc_compat_5_0_len = G_N_ELEMENTS(pc_compat_5_0);
>  
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index b789e83f9acb..c5ba70ca17cb 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -426,7 +426,7 @@ static void pc_i440fx_machine_options(MachineClass *m)
>      machine_class_allow_dynamic_sysbus_dev(m, TYPE_VMBUS_BRIDGE);
>  }
>  
> -static void pc_i440fx_5_1_machine_options(MachineClass *m)
> +static void pc_i440fx_5_2_machine_options(MachineClass *m)
>  {
>      PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
>      pc_i440fx_machine_options(m);
> @@ -435,6 +435,18 @@ static void pc_i440fx_5_1_machine_options(MachineClass *m)
>      pcmc->default_cpu_version = 1;
>  }
>  
> +DEFINE_I440FX_MACHINE(v5_2, "pc-i440fx-5.2", NULL,
> +                      pc_i440fx_5_2_machine_options);
> +
> +static void pc_i440fx_5_1_machine_options(MachineClass *m)
> +{
> +    pc_i440fx_5_2_machine_options(m);
> +    m->alias = NULL;
> +    m->is_default = false;
> +    compat_props_add(m->compat_props, hw_compat_5_1, hw_compat_5_1_len);
> +    compat_props_add(m->compat_props, pc_compat_5_1, pc_compat_5_1_len);
> +}
> +
>  DEFINE_I440FX_MACHINE(v5_1, "pc-i440fx-5.1", NULL,
>                        pc_i440fx_5_1_machine_options);
>  
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index a3e607a544a5..0cb9c18cd44d 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -353,7 +353,7 @@ static void pc_q35_machine_options(MachineClass *m)
>      m->max_cpus = 288;
>  }
>  
> -static void pc_q35_5_1_machine_options(MachineClass *m)
> +static void pc_q35_5_2_machine_options(MachineClass *m)
>  {
>      PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
>      pc_q35_machine_options(m);
> @@ -361,6 +361,17 @@ static void pc_q35_5_1_machine_options(MachineClass *m)
>      pcmc->default_cpu_version = 1;
>  }
>  
> +DEFINE_Q35_MACHINE(v5_2, "pc-q35-5.2", NULL,
> +                   pc_q35_5_2_machine_options);
> +
> +static void pc_q35_5_1_machine_options(MachineClass *m)
> +{
> +    pc_q35_5_2_machine_options(m);
> +    m->alias = NULL;
> +    compat_props_add(m->compat_props, hw_compat_5_1, hw_compat_5_1_len);
> +    compat_props_add(m->compat_props, pc_compat_5_1, pc_compat_5_1_len);
> +}
> +
>  DEFINE_Q35_MACHINE(v5_1, "pc-q35-5.1", NULL,
>                     pc_q35_5_1_machine_options);
>  
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 0ae293ec9431..1c8d0981b382 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -4579,15 +4579,26 @@ static void spapr_machine_latest_class_options(MachineClass *mc)
>      }                                                                \
>      type_init(spapr_machine_register_##suffix)
>  
> +/*
> + * pseries-5.2
> + */
> +static void spapr_machine_5_2_class_options(MachineClass *mc)
> +{
> +    /* Defaults for the latest behaviour inherited from the base class */
> +}
> +
> +DEFINE_SPAPR_MACHINE(5_2, "5.2", true);
> +
>  /*
>   * pseries-5.1
>   */
>  static void spapr_machine_5_1_class_options(MachineClass *mc)
>  {
> -    /* Defaults for the latest behaviour inherited from the base class */
> +    spapr_machine_5_2_class_options(mc);
> +    compat_props_add(mc->compat_props, hw_compat_5_1, hw_compat_5_1_len);
>  }
>  
> -DEFINE_SPAPR_MACHINE(5_1, "5.1", true);
> +DEFINE_SPAPR_MACHINE(5_1, "5.1", false);
>  
>  /*
>   * pseries-5.0
> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
> index 403d30e13bca..3dc22737a389 100644
> --- a/hw/s390x/s390-virtio-ccw.c
> +++ b/hw/s390x/s390-virtio-ccw.c
> @@ -804,14 +804,26 @@ bool css_migration_enabled(void)
>      }                                                                         \
>      type_init(ccw_machine_register_##suffix)
>  
> +static void ccw_machine_5_2_instance_options(MachineState *machine)
> +{
> +}
> +
> +static void ccw_machine_5_2_class_options(MachineClass *mc)
> +{
> +}
> +DEFINE_CCW_MACHINE(5_2, "5.2", true);
> +
>  static void ccw_machine_5_1_instance_options(MachineState *machine)
>  {
> +    ccw_machine_5_2_instance_options(machine);
>  }
>  
>  static void ccw_machine_5_1_class_options(MachineClass *mc)
>  {
> +    ccw_machine_5_2_class_options(mc);
> +    compat_props_add(mc->compat_props, hw_compat_5_1, hw_compat_5_1_len);
>  }
> -DEFINE_CCW_MACHINE(5_1, "5.1", true);
> +DEFINE_CCW_MACHINE(5_1, "5.1", false);
>  
>  static void ccw_machine_5_0_instance_options(MachineState *machine)
>  {
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index 426ce5f625a4..bc5b82ad209e 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -319,6 +319,9 @@ struct MachineState {
>      } \
>      type_init(machine_initfn##_register_types)
>  
> +extern GlobalProperty hw_compat_5_1[];
> +extern const size_t hw_compat_5_1_len;
> +
>  extern GlobalProperty hw_compat_5_0[];
>  extern const size_t hw_compat_5_0_len;
>  
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index 3d7ed3a55e30..fe52e165b27c 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -193,6 +193,9 @@ void pc_system_firmware_init(PCMachineState *pcms, MemoryRegion *rom_memory);
>  void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
>                         const CPUArchIdList *apic_ids, GArray *entry);
>  
> +extern GlobalProperty pc_compat_5_1[];
> +extern const size_t pc_compat_5_1_len;
> +
>  extern GlobalProperty pc_compat_5_0[];
>  extern const size_t pc_compat_5_0_len;
>  
> -- 
> 2.25.4

