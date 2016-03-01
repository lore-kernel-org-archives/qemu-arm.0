Received: by 10.25.208.211 with SMTP id h202csp1757059lfg;
        Tue, 1 Mar 2016 09:54:37 -0800 (PST)
X-Received: by 10.140.254.9 with SMTP id z9mr29600716qhc.5.1456854877717;
        Tue, 01 Mar 2016 09:54:37 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c127si31748272qhd.121.2016.03.01.09.54.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 01 Mar 2016 09:54:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51489 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aaoVJ-0006tB-8G
	for alex.bennee@linaro.org; Tue, 01 Mar 2016 12:54:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58982)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1aaoVG-0006si-HZ
	for qemu-arm@nongnu.org; Tue, 01 Mar 2016 12:54:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1aaoVD-0003KE-A5
	for qemu-arm@nongnu.org; Tue, 01 Mar 2016 12:54:34 -0500
Received: from mx1.redhat.com ([209.132.183.28]:58891)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>)
	id 1aaoVD-0003K2-2X; Tue, 01 Mar 2016 12:54:31 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 3AD64155DC;
	Tue,  1 Mar 2016 17:54:30 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-113-49.phx2.redhat.com
	[10.3.113.49])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u21HsSeU021762; Tue, 1 Mar 2016 12:54:28 -0500
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <1456853976-7592-1-git-send-email-peter.maydell@linaro.org>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <56D5D753.4050609@redhat.com>
Date: Tue, 1 Mar 2016 18:54:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1456853976-7592-1-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>, qemu-arm@nongnu.org,
	patches@linaro.org
Subject: Re: [Qemu-arm] [PATCH v2] hw/arm/virt: Assume EL3 boot rom will
 handle PSCI if one is provided
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: qaoW1D3D3zKx

On 03/01/16 18:39, Peter Maydell wrote:
> If the user passes us an EL3 boot rom, then it is going to want to
> implement the PSCI interface itself. In this case, disable QEMU's
> internal PSCI implementation so it does not get in the way, and
> instead start all CPUs in an SMP configuration at once (the boot
> rom will catch them all and pen up the secondaries until needed).
> The boot rom code is also responsible for editing the device tree
> to include any necessary information about its own PSCI implementation
> before eventually passing it to a NonSecure guest.
> 
> (This "start all CPUs at once" approach is what both ARM Trusted
> Firmware and UEFI expect, since it is what the ARM Foundation Model
> does; the other approach would be to provide some emulated hardware
> for "start the secondaries" but this is simplest.)
> 
> This is a compatibility break, but I don't believe that anybody
> was using a secure boot ROM with an SMP configuration. Such a setup
> would be somewhat broken since there was nothing preventing nonsecure
> guest code from calling the QEMU PSCI function to start up a secondary
> core in a way that completely bypassed the secure world.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> v1->v2 changes:
>  * rearranged so we initialise vbi->using_psci properly
> 
>  hw/arm/virt.c | 32 +++++++++++++++++++++++++-------
>  1 file changed, 25 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 4499e2c..9d07b6d 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -73,6 +73,7 @@ typedef struct VirtBoardInfo {
>      uint32_t clock_phandle;
>      uint32_t gic_phandle;
>      uint32_t v2m_phandle;
> +    bool using_psci;
>  } VirtBoardInfo;
>  
>  typedef struct {
> @@ -231,6 +232,10 @@ static void fdt_add_psci_node(const VirtBoardInfo *vbi)
>      void *fdt = vbi->fdt;
>      ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(0));
>  
> +    if (!vbi->using_psci) {
> +        return;
> +    }
> +
>      qemu_fdt_add_subnode(fdt, "/psci");
>      if (armcpu->psci_version == 2) {
>          const char comp[] = "arm,psci-0.2\0arm,psci";
> @@ -342,7 +347,7 @@ static void fdt_add_cpu_nodes(const VirtBoardInfo *vbi)
>          qemu_fdt_setprop_string(vbi->fdt, nodename, "compatible",
>                                      armcpu->dtb_compatible);
>  
> -        if (vbi->smp_cpus > 1) {
> +        if (vbi->using_psci && vbi->smp_cpus > 1) {
>              qemu_fdt_setprop_string(vbi->fdt, nodename,
>                                          "enable-method", "psci");
>          }
> @@ -1081,6 +1086,7 @@ static void machvirt_init(MachineState *machine)
>      VirtGuestInfoState *guest_info_state = g_malloc0(sizeof *guest_info_state);
>      VirtGuestInfo *guest_info = &guest_info_state->info;
>      char **cpustr;
> +    bool firmware_loaded = bios_name || drive_get(IF_PFLASH, 0, 0);
>  
>      if (!cpu_model) {
>          cpu_model = "cortex-a15";
> @@ -1108,6 +1114,15 @@ static void machvirt_init(MachineState *machine)
>          exit(1);
>      }
>  
> +    /* If we have an EL3 boot ROM then the assumption is that it will
> +     * implement PSCI itself, so disable QEMU's internal implementation
> +     * so it doesn't get in the way. Instead of starting secondary
> +     * CPUs in PSCI powerdown state we will start them all running and
> +     * let the boot ROM sort them out.
> +     * The usual case is that we do use QEMU's PSCI implementation.
> +     */
> +    vbi->using_psci = !(vms->secure && firmware_loaded);
> +
>      /* The maximum number of CPUs depends on the GIC version, or on how
>       * many redistributors we can fit into the memory map.
>       */
> @@ -1175,12 +1190,15 @@ static void machvirt_init(MachineState *machine)
>              object_property_set_bool(cpuobj, false, "has_el3", NULL);
>          }
>  
> -        object_property_set_int(cpuobj, QEMU_PSCI_CONDUIT_HVC, "psci-conduit",
> -                                NULL);
> +        if (vbi->using_psci) {
> +            object_property_set_int(cpuobj, QEMU_PSCI_CONDUIT_HVC,
> +                                    "psci-conduit", NULL);
>  
> -        /* Secondary CPUs start in PSCI powered-down state */
> -        if (n > 0) {
> -            object_property_set_bool(cpuobj, true, "start-powered-off", NULL);
> +            /* Secondary CPUs start in PSCI powered-down state */
> +            if (n > 0) {
> +                object_property_set_bool(cpuobj, true,
> +                                         "start-powered-off", NULL);
> +            }
>          }
>  
>          if (object_property_find(cpuobj, "reset-cbar", NULL)) {
> @@ -1249,7 +1267,7 @@ static void machvirt_init(MachineState *machine)
>      vbi->bootinfo.board_id = -1;
>      vbi->bootinfo.loader_start = vbi->memmap[VIRT_MEM].base;
>      vbi->bootinfo.get_dtb = machvirt_dtb;
> -    vbi->bootinfo.firmware_loaded = bios_name || drive_get(IF_PFLASH, 0, 0);
> +    vbi->bootinfo.firmware_loaded = firmware_loaded;
>      arm_load_kernel(ARM_CPU(first_cpu), &vbi->bootinfo);
>  
>      /*
> 

I compared this with v1 and the discussion under it:

http://thread.gmane.org/gmane.comp.emulators.qemu/395305

The new, explicit condition looks valid.

Also, the location is right; albeit not visible in the context above,
"vbi->using_psci" is set right after "vbi" is set from find_machine_info().

Reviewed-by: Laszlo Ersek <lersek@redhat.com>

Thanks
Laszlo
