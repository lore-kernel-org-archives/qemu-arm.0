Received: by 10.25.205.13 with SMTP id d13csp2174062lfg;
        Tue, 13 Dec 2016 04:38:16 -0800 (PST)
X-Received: by 10.237.36.170 with SMTP id t39mr84301475qtc.115.1481632696615;
        Tue, 13 Dec 2016 04:38:16 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id c6si28102232qtb.27.2016.12.13.04.38.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Dec 2016 04:38:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:37863 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cGmLV-0006Jx-UG
	for alex.bennee@linaro.org; Tue, 13 Dec 2016 07:38:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56186)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1cGmLO-0006IX-BM
	for qemu-arm@nongnu.org; Tue, 13 Dec 2016 07:38:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1cGmLJ-0005kk-9u
	for qemu-arm@nongnu.org; Tue, 13 Dec 2016 07:38:06 -0500
Received: from mail-wm0-f66.google.com ([74.125.82.66]:36081)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1cGmLI-0005f3-WC; Tue, 13 Dec 2016 07:38:01 -0500
Received: by mail-wm0-f66.google.com with SMTP id m203so18050347wma.3;
	Tue, 13 Dec 2016 04:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=waOS09LD1axFdAiec46a5UoKVT1RQLzWkhx67PhTRNY=;
	b=OOAlYsEiHJPkChlWTqSM2UGJgpg2wgJUyNz70QvoCDhH9eL/D/cTSNMhOShxqfLNQR
	bSBQNviyHTorxLdpDzEKkrBaa3vWXmXOatvwAlGNX5W0scBSBpU80w9mBO/CC9gPdv6p
	hQjHD/FCigPDRniZ2a66ew3Op4Up/R0fVRKWm97x6xvRx0/ztxPnSZGZXmYIkQUk9xCe
	aRW0K+4jDUQvBA9d83BBEfVBDrwPg/73ObExvdfWIgSZEmOQZbqAe415VjW3rKE8awwT
	DQiwG73/ehdyfiN4X8G6cUpC+RGS3hvfUM2jspxGVC7Qb9gfYCAVdyaqkI5sYisxgkCZ
	XWNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=waOS09LD1axFdAiec46a5UoKVT1RQLzWkhx67PhTRNY=;
	b=mH6e3pP51SDJWEtyoWTWpqQig8Njnuk+Ose2OgA8JBNGvdK7nRJufeQ15rCKrUbTyv
	ecLVUdX6gMxm1c9Y0EJtlicw5rVZ15KvKkRrs7qNlGU56tu5DZrQlrMpxYv+oLcRYPP+
	JbKQyujowlHDZoz5v6c/ADAzWIwYuhlYL11Zn/ng/FecGRfqRmvusfVX7qQkCQqqDeFy
	svu7xlk8b9YCTfiEjrCvdRbnxMB/T6lkblgPq7dVOtNHMsEWWXB+PBBYUCZEPsqA5fq2
	b9pFHNVhaQ5XcXLUrlH8F7VkrXIfp1LVfz3Be8UgCvy/M5fKLsnnX1QgvJOP3m88RW4P
	RFfg==
X-Gm-Message-State: AKaTC02a68aWow+Leaipz2JcFhG1X5FAaUXM06wCiiQ9ZZepy442N3Zh7tkrJSs7tu8lkA==
X-Received: by 10.25.141.147 with SMTP id p141mr10087406lfd.147.1481632596839; 
	Tue, 13 Dec 2016 04:36:36 -0800 (PST)
Received: from localhost (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id f42sm9746288lji.2.2016.12.13.04.36.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Dec 2016 04:36:36 -0800 (PST)
Date: Tue, 13 Dec 2016 13:36:35 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20161213123635.GL9606@toto>
References: <1481625384-15077-1-git-send-email-peter.maydell@linaro.org>
	<1481625384-15077-22-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1481625384-15077-22-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.66
Subject: Re: [Qemu-arm] [PATCH 21/23] hw/arm/virt: Support using SMC for PSCI
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, Christoffer Dall <christoffer.dall@linaro.org>,
	patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6mBAbJXxIUQT

On Tue, Dec 13, 2016 at 10:36:22AM +0000, Peter Maydell wrote:
> If we are giving the guest a CPU with EL2, it is likely to
> want to use the HVC instruction itself, for instance for
> providing PSCI to inner guest VMs. This makes using HVC
> as the PSCI conduit for the outer QEMU a bad idea. We will
> want to use SMC instead is this case: this makes sense
> because QEMU's PSCI implementation is effectively an
> emulation of functionality provided by EL3 firmware.
> 
> Add code to support selecting the PSCI conduit to use,
> rather than hardcoding use of HVC.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> ---
>  hw/arm/virt.c | 29 ++++++++++++++++++++++-------
>  1 file changed, 22 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 7adb58b..cce8d2e 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -88,7 +88,7 @@ typedef struct {
>      uint32_t clock_phandle;
>      uint32_t gic_phandle;
>      uint32_t msi_phandle;
> -    bool using_psci;
> +    int psci_conduit;
>  } VirtMachineState;
>  
>  #define TYPE_VIRT_MACHINE   MACHINE_TYPE_NAME("virt")
> @@ -266,9 +266,19 @@ static void fdt_add_psci_node(const VirtMachineState *vms)
>      uint32_t migrate_fn;
>      void *fdt = vms->fdt;
>      ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(0));
> +    const char *psci_method;
>  
> -    if (!vms->using_psci) {
> +    switch (vms->psci_conduit) {
> +    case QEMU_PSCI_CONDUIT_DISABLED:
>          return;
> +    case QEMU_PSCI_CONDUIT_HVC:
> +        psci_method = "hvc";
> +        break;
> +    case QEMU_PSCI_CONDUIT_SMC:
> +        psci_method = "smc";
> +        break;
> +    default:
> +        g_assert_not_reached();
>      }
>  
>      qemu_fdt_add_subnode(fdt, "/psci");
> @@ -300,7 +310,7 @@ static void fdt_add_psci_node(const VirtMachineState *vms)
>       * However, the device tree binding uses 'method' instead, so that is
>       * what we should use here.
>       */
> -    qemu_fdt_setprop_string(fdt, "/psci", "method", "hvc");
> +    qemu_fdt_setprop_string(fdt, "/psci", "method", psci_method);
>  
>      qemu_fdt_setprop_cell(fdt, "/psci", "cpu_suspend", cpu_suspend_fn);
>      qemu_fdt_setprop_cell(fdt, "/psci", "cpu_off", cpu_off_fn);
> @@ -402,7 +412,8 @@ static void fdt_add_cpu_nodes(const VirtMachineState *vms)
>          qemu_fdt_setprop_string(vms->fdt, nodename, "compatible",
>                                      armcpu->dtb_compatible);
>  
> -        if (vms->using_psci && vms->smp_cpus > 1) {
> +        if (vms->psci_conduit != QEMU_PSCI_CONDUIT_DISABLED
> +            && vms->smp_cpus > 1) {
>              qemu_fdt_setprop_string(vms->fdt, nodename,
>                                          "enable-method", "psci");
>          }
> @@ -1270,7 +1281,11 @@ static void machvirt_init(MachineState *machine)
>       * let the boot ROM sort them out.
>       * The usual case is that we do use QEMU's PSCI implementation.
>       */
> -    vms->using_psci = !(vms->secure && firmware_loaded);
> +    if (vms->secure && firmware_loaded) {
> +        vms->psci_conduit = QEMU_PSCI_CONDUIT_DISABLED;
> +    } else {
> +        vms->psci_conduit = QEMU_PSCI_CONDUIT_HVC;
> +    }
>  
>      /* The maximum number of CPUs depends on the GIC version, or on how
>       * many redistributors we can fit into the memory map.
> @@ -1353,8 +1368,8 @@ static void machvirt_init(MachineState *machine)
>              object_property_set_bool(cpuobj, false, "has_el3", NULL);
>          }
>  
> -        if (vms->using_psci) {
> -            object_property_set_int(cpuobj, QEMU_PSCI_CONDUIT_HVC,
> +        if (vms->psci_conduit != QEMU_PSCI_CONDUIT_DISABLED) {
> +            object_property_set_int(cpuobj, vms->psci_conduit,
>                                      "psci-conduit", NULL);
>  
>              /* Secondary CPUs start in PSCI powered-down state */
> -- 
> 2.7.4
> 
