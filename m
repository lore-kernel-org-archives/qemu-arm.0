Received: by 10.80.166.35 with SMTP id d32csp86713edc;
        Mon, 10 Oct 2016 12:38:07 -0700 (PDT)
X-Received: by 10.55.47.199 with SMTP id v190mr33482387qkh.45.1476128287288;
        Mon, 10 Oct 2016 12:38:07 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z7si4658759qtz.23.2016.10.10.12.38.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 10 Oct 2016 12:38:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52238 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1btgOk-0000Ik-MC
	for alex.bennee@linaro.org; Mon, 10 Oct 2016 15:38:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58804)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1btgOd-0000H5-JK
	for qemu-arm@nongnu.org; Mon, 10 Oct 2016 15:38:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1btgOa-0004mu-EZ
	for qemu-arm@nongnu.org; Mon, 10 Oct 2016 15:37:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35452)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>)
	id 1btgOa-0004me-4j; Mon, 10 Oct 2016 15:37:56 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9DE8BC05A2BD;
	Mon, 10 Oct 2016 19:37:55 +0000 (UTC)
Received: from localhost.localdomain (vpn1-7-214.ams2.redhat.com [10.36.7.214])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9AJbo22016364
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 10 Oct 2016 15:37:53 -0400
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
References: <1476117341-32690-1-git-send-email-drjones@redhat.com>
	<1476117341-32690-3-git-send-email-drjones@redhat.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <d0e927f3-25a7-7c30-e55f-d45b33ffd71f@redhat.com>
Date: Mon, 10 Oct 2016 21:37:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <1476117341-32690-3-git-send-email-drjones@redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Mon, 10 Oct 2016 19:37:55 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 2/2] hw/arm/virt: no ITS on
 older machine types
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: m+ZRj+N8+dTh

Hi Drew,

On 10/10/2016 18:35, Andrew Jones wrote:
> We should avoid exposing new hardware (through DT and ACPI) on older
> machine types. This patch keeps 2.7 and older from changing, despite
> the introduction of ITS support for 2.8.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
> 
> As Eduardo pointed out long ago for a different reason, we should
> probably replace VirtGuestInfo with direct use of VirtMachineClass,
> like x86 has done to replace PcGuestInfo with direct use of
> PCMachineClass. I'll work on that, but wanted to get this ITS
> fixup in sooner than later, so I'm posting this patch now, which
> requires 'no_its' to be duplicated.
> 
> Also, this patch will have a trivial conflict with Wei's PMU
> property series.
> 
> 
>  hw/arm/virt-acpi-build.c         |  2 +-
>  hw/arm/virt.c                    | 15 +++++++++++----
>  include/hw/arm/virt-acpi-build.h |  1 +
>  3 files changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index c31349561c95..48820f372830 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -556,7 +556,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtGuestInfo *guest_info)
>          gicr->base_address = cpu_to_le64(memmap[VIRT_GIC_REDIST].base);
>          gicr->range_length = cpu_to_le32(memmap[VIRT_GIC_REDIST].size);
>  
> -        if (its_class_name()) {
> +        if (its_class_name() && !guest_info->no_its) {
>              gic_its = acpi_data_push(table_data, sizeof *gic_its);
>              gic_its->type = ACPI_APIC_GENERIC_TRANSLATOR;
>              gic_its->length = sizeof(*gic_its);
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 0f6305d3c7f6..e3734d47df81 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -84,6 +84,7 @@ typedef struct {
>      MachineClass parent;
>      VirtBoardInfo *daughterboard;
>      bool disallow_affinity_adjustment;
> +    bool no_its;
>  } VirtMachineClass;
>  
>  typedef struct {
> @@ -552,7 +553,8 @@ static void create_v2m(VirtBoardInfo *vbi, qemu_irq *pic)
>      fdt_add_v2m_gic_node(vbi);
>  }
>  
> -static void create_gic(VirtBoardInfo *vbi, qemu_irq *pic, int type, bool secure)
> +static void create_gic(VirtBoardInfo *vbi, qemu_irq *pic, int type,
> +                       bool secure, bool no_its)
>  {
>      /* We create a standalone GIC */
>      DeviceState *gicdev;
> @@ -616,9 +618,9 @@ static void create_gic(VirtBoardInfo *vbi, qemu_irq *pic, int type, bool secure)
>  
>      fdt_add_gic_node(vbi, type);
>  
> -    if (type == 3) {
> +    if (type == 3 && !no_its) {
>          create_its(vbi, gicdev);
> -    } else {
> +    } else if (type == 2) {
>          create_v2m(vbi, pic);
>      }
>  }
> @@ -1376,7 +1378,7 @@ static void machvirt_init(MachineState *machine)
>  
>      create_flash(vbi, sysmem, secure_sysmem ? secure_sysmem : sysmem);
>  
> -    create_gic(vbi, pic, gic_version, vms->secure);
> +    create_gic(vbi, pic, gic_version, vms->secure, vmc->no_its);
>  
>      fdt_add_pmu_nodes(vbi, gic_version);
>  
> @@ -1408,6 +1410,7 @@ static void machvirt_init(MachineState *machine)
>      guest_info->irqmap = vbi->irqmap;
>      guest_info->use_highmem = vms->highmem;
>      guest_info->gic_version = gic_version;
> +    guest_info->no_its = vmc->no_its;
>      guest_info_state->machine_done.notify = virt_guest_info_machine_done;
>      qemu_add_machine_init_done_notifier(&guest_info_state->machine_done);
>  
> @@ -1562,8 +1565,12 @@ static void virt_2_7_instance_init(Object *obj)
>  
>  static void virt_machine_2_7_options(MachineClass *mc)
>  {
> +    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
> +
>      virt_machine_2_8_options(mc);
>      SET_MACHINE_COMPAT(mc, VIRT_COMPAT_2_7);
> +    /* ITS was introduced with 2.8 */
> +    vmc->no_its = true;
>  }
>  DEFINE_VIRT_MACHINE(2, 7)
>  
> diff --git a/include/hw/arm/virt-acpi-build.h b/include/hw/arm/virt-acpi-build.h
> index e43330ad659b..f5ec749b8fea 100644
> --- a/include/hw/arm/virt-acpi-build.h
> +++ b/include/hw/arm/virt-acpi-build.h
> @@ -33,6 +33,7 @@ typedef struct VirtGuestInfo {
>      const int *irqmap;
>      bool use_highmem;
>      int gic_version;
> +    bool no_its;
>  } VirtGuestInfo;
>  
>  
> 
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
