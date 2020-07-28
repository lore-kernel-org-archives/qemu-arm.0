Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp637477lfy;
        Tue, 28 Jul 2020 07:16:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwMBqsgpJ2BKR3qs4GXVyaRM+4Z8vmPmB2Aj9fRMst+OACi23q9t85gAIf9W2JieO9nSS+8
X-Received: by 2002:a25:f20d:: with SMTP id i13mr14647647ybe.152.1595945766403;
        Tue, 28 Jul 2020 07:16:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595945766; cv=none;
        d=google.com; s=arc-20160816;
        b=niLv9Vmr8cP9Gvy98o92u4WOdbKpJeS3gpAhVr7TqGhy6iO3h39UfTke/N4K75pFru
         fq6lX2opDRvWMFXLlkvzi86/UafxuN8hzz+mTZzEqHNK5I57By3iRoSPZRT/77lPl767
         GZmQnMOcSJQEMjOLh2/cDID/ax6HLlNG+XQpsEXMphZRuWmcy+Qr3k7rJqbhuurXDo0H
         TkZnB/MeTTnJcZWu9K9gVMB/JJqzamQntE4j3LD0/Gy7QCR9cfDu6eFOJwtOaATb32ka
         bfaLvj2Xxvf9gKYTVDUjfsm/hEuMqb5V0JgEbRba9vNlrr1DfrPB4QWw1mM3KQTyheDb
         b08w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date;
        bh=YcDKPKdiPZI26nexWS3E+j4zExcr3J6qWXzQdVIdPbA=;
        b=AuZKbEvOAQRQXKDyTjL/pFYhWPTpq1M6VVZV+uM+bOIgqvAf1ascsZ3skUUNCg+DDs
         xQJuMV4BZ5W9SrAenowGjKA6iumtZ28VyeDmllfXT388ehY+Sw3o5IF5ZVdu1EauKzbL
         VWSmOigHU5LnLEJ46bRANcbG+qovHTLEBofkPRC57JAhd/7gIg8puiUgWDWWC82MQTWA
         M6enCi3tpu43b4uojZ37rcd3os0NWkfDsJ3TOGdxW98R4+tSebDSax9lKR7eYUUtULOt
         Z8H/xYflyQlNbnpSdd8NGTQW47P1deWFM838H/CwpfUgGev79YrqWpcHEX+ITrilGkd1
         wXyA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l204si2184625ybc.374.2020.07.28.07.16.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jul 2020 07:16:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:44956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k0QOj-0001AG-P1
	for alex.bennee@linaro.org; Tue, 28 Jul 2020 10:16:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1k0QOC-0000do-5u
 for qemu-arm@nongnu.org; Tue, 28 Jul 2020 10:15:32 -0400
Received: from 8.mo2.mail-out.ovh.net ([188.165.52.147]:54395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1k0QO8-0007Ls-6F
 for qemu-arm@nongnu.org; Tue, 28 Jul 2020 10:15:31 -0400
Received: from player799.ha.ovh.net (unknown [10.108.35.131])
 by mo2.mail-out.ovh.net (Postfix) with ESMTP id A1E8F1E2366
 for <qemu-arm@nongnu.org>; Tue, 28 Jul 2020 16:15:23 +0200 (CEST)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player799.ha.ovh.net (Postfix) with ESMTPSA id F21B114C4A6ED;
 Tue, 28 Jul 2020 14:15:07 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002c2846e45-abce-40ea-b9b6-ba6f467127c4,
 96196EA346850768E7E70500A314E772A5EF2CEB) smtp.auth=groug@kaod.org
Date: Tue, 28 Jul 2020 16:15:06 +0200
From: Greg Kurz <groug@kaod.org>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH] hw: add compat machines for 5.2
Message-ID: <20200728161506.259ef93d@bahia.lan>
In-Reply-To: <20200728094645.272149-1-cohuck@redhat.com>
References: <20200728094645.272149-1-cohuck@redhat.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 3673248448625154498
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedriedvgdejvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgsehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehkefhtdehgeehheejledufeekhfdvleefvdeihefhkefhudffhfeuuedvffdthfenucfkpheptddrtddrtddrtddpkedvrddvheefrddvtdekrddvgeeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeelledrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdqrghrmhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=188.165.52.147; envelope-from=groug@kaod.org;
 helo=8.mo2.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/28 10:15:25
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LPcGBYGhpbQ6

On Tue, 28 Jul 2020 11:46:45 +0200
Cornelia Huck <cohuck@redhat.com> wrote:

> Add 5.2 machine types for arm/i440fx/q35/s390x/spapr.
> 

Heh, you win the race for adding new machine types again :)

> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>  hw/arm/virt.c              |  9 ++++++++-
>  hw/core/machine.c          |  3 +++
>  hw/i386/pc.c               |  3 +++
>  hw/i386/pc_piix.c          | 14 +++++++++++++-
>  hw/i386/pc_q35.c           | 13 ++++++++++++-
>  hw/ppc/spapr.c             | 15 +++++++++++++--

For ppc parts:

Reviewed-by: Greg Kurz <groug@kaod.org>

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

