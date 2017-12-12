Received: by 10.223.159.74 with SMTP id f10csp3903301wrg;
        Tue, 12 Dec 2017 06:45:33 -0800 (PST)
X-Google-Smtp-Source: ACJfBotjmCXtCFiJfckwD/XkWjfyGaTJAu5GAaZltqb3MtAQxwSOPJ31xTNeyaQ0ONfPQgh2BY0A
X-Received: by 10.37.144.137 with SMTP id t9mr3129369ybl.216.1513089933809;
        Tue, 12 Dec 2017 06:45:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513089933; cv=none;
        d=google.com; s=arc-20160816;
        b=IFDb+RppvZUq1NLxeqnGCZqYl5QC7vVq5+OQs2xbWUmTAj8o2kagIGVEULjNpNMnWu
         lUDnc9VTz5YEsvrD8zDcbuBYmR9sYHwE5AdFatlAyT9J3U5CPWZ2K3CJ7gnHh3LI5dlh
         uQKIpsC53L/NMepuo9Dr3NmMQhwp+Cbq2EdKYLlVvnkrasy1s131ikwEFS7fR6SoKUJr
         QMBvoHypLaVYTNFEwGGWH9nmngaPAJ0npWyfgjNUjPaMTyw8fyux5+F8p1VkI+Uj7mvE
         nZBC2cbQprOeT/5PLOmwFfrk6vOkWQzf7bbz9cvhRnUaYFERjCSkHKracDEyuYwMDAj8
         BuiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=1UrCsMjvjLGLzh0P2su8EOAf5vXJpImc0x9JwqzxYY0=;
        b=mPWHivuaX1RShyuUWV5xKXF3n8FDYZjCgzi9IA7CYfoebPV77OIrF9cKKzfRLNvhlK
         JippRA0vieLFBsIYt3wP9L6uqZX9sug77vrw7lh0Rmpm9NkUiiQJz2MgVbTmSK7I9ma8
         cuWfXqS2sQcLEYA97sagY6iD6prBNuOcAcM8DxcnszE/EwhMMW9HeLLvhVno89iBfRXa
         byzZI4tsV/8domFISRm3Yavi1XuF1Y0p0D+DS2joyyby+qwWKwfsEoMS8lZv5lCMbgp4
         rLbaxPXY6VHP8v50ObzN/Z0afqKTicr0xlDZN+yUOChiy0O7UX4SPCl+TSTHahTQQ96/
         OELw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f4si3446606ywd.384.2017.12.12.06.45.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Dec 2017 06:45:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58790 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eOloL-0006Dh-7t
	for alex.bennee@linaro.org; Tue, 12 Dec 2017 09:45:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53663)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1eOloC-0006DV-At
	for qemu-arm@nongnu.org; Tue, 12 Dec 2017 09:45:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1eOlo6-0007iH-6o
	for qemu-arm@nongnu.org; Tue, 12 Dec 2017 09:45:24 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51670)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1eOlo5-0007gj-U3; Tue, 12 Dec 2017 09:45:18 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C02EC3D95F;
	Tue, 12 Dec 2017 14:45:16 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9840C69315;
	Tue, 12 Dec 2017 14:45:15 +0000 (UTC)
Date: Tue, 12 Dec 2017 15:45:13 +0100
From: Andrew Jones <drjones@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20171212144513.sutjfenbjh33fm5n@kamzik.brq.redhat.com>
References: <1512745328-5109-1-git-send-email-peter.maydell@linaro.org>
	<1512745328-5109-3-git-send-email-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1512745328-5109-3-git-send-email-peter.maydell@linaro.org>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Tue, 12 Dec 2017 14:45:16 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 2/3] hw/arm/virt: Add another
 UART to the virt board
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
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org, Shannon Zhao <shannon.zhao@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: M9boIn52ZyIY

On Fri, Dec 08, 2017 at 03:02:07PM +0000, Peter Maydell wrote:
> Currently we only provide one non-secure UART on the virt
> board. This is OK for most purposes, but there are some
> use cases where having a second UART would be useful (like
> bare-metal testing where you don't really want to have to
> probe and set up a PCI device just to have a second comms
> channel).
> 
> Add a second NS UART to the virt board. This will be the
> second serial device if 'secure=no' (the default), and the
> third serial device if 'secure=yes'.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  include/hw/arm/virt.h |  2 ++
>  hw/arm/virt.c         | 19 ++++++++++++++++---
>  2 files changed, 18 insertions(+), 3 deletions(-)
> 
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 33b0ff3..685009a 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -72,6 +72,7 @@ enum {
>      VIRT_GPIO,
>      VIRT_SECURE_UART,
>      VIRT_SECURE_MEM,
> +    VIRT_UART_2,
>  };
>  
>  typedef struct MemMapEntry {
> @@ -85,6 +86,7 @@ typedef struct {
>      bool no_its;
>      bool no_pmu;
>      bool claim_edge_triggered_timers;
> +    bool no_second_uart;
>  } VirtMachineClass;
>  
>  typedef struct {
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 543f9bd..e234f55 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -139,6 +139,7 @@ static const MemMapEntry a15memmap[] = {
>      [VIRT_FW_CFG] =             { 0x09020000, 0x00000018 },
>      [VIRT_GPIO] =               { 0x09030000, 0x00001000 },
>      [VIRT_SECURE_UART] =        { 0x09040000, 0x00001000 },
> +    [VIRT_UART_2] =             { 0x09050000, 0x00001000 },
>      [VIRT_MMIO] =               { 0x0a000000, 0x00000200 },
>      /* ...repeating for a total of NUM_VIRTIO_TRANSPORTS, each of that size */
>      [VIRT_PLATFORM_BUS] =       { 0x0c000000, 0x02000000 },
> @@ -157,6 +158,7 @@ static const int a15irqmap[] = {
>      [VIRT_PCIE] = 3, /* ... to 6 */
>      [VIRT_GPIO] = 7,
>      [VIRT_SECURE_UART] = 8,
> +    [VIRT_UART_2] = 9,
>      [VIRT_MMIO] = 16, /* ...to 16 + NUM_VIRTIO_TRANSPORTS - 1 */
>      [VIRT_GIC_V2M] = 48, /* ...to 48 + NUM_GICV2M_SPIS - 1 */
>      [VIRT_PLATFORM_BUS] = 112, /* ...to 112 + PLATFORM_BUS_NUM_IRQS -1 */
> @@ -676,7 +678,7 @@ static void create_uart(const VirtMachineState *vms, qemu_irq *pic, int uart,
>  
>      if (uart == VIRT_UART) {
>          qemu_fdt_setprop_string(vms->fdt, "/chosen", "stdout-path", nodename);
> -    } else {
> +    } else if (uart == VIRT_SECURE_UART) {
>          /* Mark as not usable by the normal world */
>          qemu_fdt_setprop_string(vms->fdt, nodename, "status", "disabled");
>          qemu_fdt_setprop_string(vms->fdt, nodename, "secure-status", "okay");
> @@ -1260,6 +1262,7 @@ static void machvirt_init(MachineState *machine)
>      int n, virt_max_cpus;
>      MemoryRegion *ram = g_new(MemoryRegion, 1);
>      bool firmware_loaded = bios_name || drive_get(IF_PFLASH, 0, 0);
> +    int uart_count = 0;
>  
>      /* We can probe only here because during property set
>       * KVM is not available yet
> @@ -1419,11 +1422,16 @@ static void machvirt_init(MachineState *machine)
>  
>      fdt_add_pmu_nodes(vms);
>  
> -    create_uart(vms, pic, VIRT_UART, sysmem, serial_hds[0]);
> +    create_uart(vms, pic, VIRT_UART, sysmem, serial_hds[uart_count++]);
>  
>      if (vms->secure) {
>          create_secure_ram(vms, secure_sysmem);
> -        create_uart(vms, pic, VIRT_SECURE_UART, secure_sysmem, serial_hds[1]);
> +        create_uart(vms, pic, VIRT_SECURE_UART, secure_sysmem,
> +                    serial_hds[uart_count++]);
> +    }
> +
> +    if (!vmc->no_second_uart) {

Should this be

    if (!vmc->no_second_uart && serial_hds[uart_count] != NULL) {

A bit late now, but maybe the other UART resource allocations should have
been conditional on actually being wired up too?

Thanks,
drew

> +        create_uart(vms, pic, VIRT_UART_2, sysmem, serial_hds[uart_count++]);
>      }
>  
>      create_rtc(vms, pic);
> @@ -1693,8 +1701,13 @@ static void virt_2_11_instance_init(Object *obj)
>  
>  static void virt_machine_2_11_options(MachineClass *mc)
>  {
> +    VirtMachineClass *vmc = VIRT_MACHINE_CLASS(OBJECT_CLASS(mc));
> +
>      virt_machine_2_12_options(mc);
>      SET_MACHINE_COMPAT(mc, VIRT_COMPAT_2_11);
> +
> +    /* The second NS UART was added in 2.12 */
> +    vmc->no_second_uart = true;
>  }
>  DEFINE_VIRT_MACHINE(2, 11)
>  
> -- 
> 2.7.4
> 
> 
