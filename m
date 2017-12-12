Received: by 10.223.159.74 with SMTP id f10csp3438074wrg;
        Mon, 11 Dec 2017 21:56:35 -0800 (PST)
X-Google-Smtp-Source: ACJfBou6kc5sgYFIXzHkCR9KczqpapGkxOdpv1Tz70qNAJRMDcNNLW9msr+lXnX6CgEFhHYqzLCQ
X-Received: by 10.129.241.10 with SMTP id h10mr2103463ywm.141.1513058195670;
        Mon, 11 Dec 2017 21:56:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513058195; cv=none;
        d=google.com; s=arc-20160816;
        b=QkDgIKf9z8qAbFcysRpBvlOMFqQREzFWvOynFqytpZrgeBlbXaNdEsEzR3suZD/987
         9mmy1yjPZp9w375NcTQFukYLCKuewZZWPHMy1gO4M6sPbO9iWb1cIlCcczVh+KkP3Ak6
         5SdCQqbRhyG5isI+mL9P1nXTBOpUkZBWFh02s3m5RV7uN9f0+VyO4W57R7oLMU6mk5fm
         be4pWSf3dyDpzkFr1EvyBYxYglZA+Pg/clZ0HA9b3aZ/zDT5xh1mkPaSYFOC8GtgOpiR
         ypJN8VMyPAm+nmsBlZM8rx99k6S/lA025wepJgDp9GlS+VOaIQan7ZouzlzNNqWxcwCB
         Bk1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:references:to:mime-version
         :user-agent:from:date:message-id:arc-authentication-results;
        bh=J2IY8AAx28/DkoCToFGwqChVEi1ekX/mXOTd8TViuEw=;
        b=CLeaVJcAjW4HCkCNuuNhrqEBHmpPJndeUTWStjH+YDbekM4G5ybElQwgFVo0tyb2fG
         ghOyXqY2hmAGDMDzhklSpyK9518VS7fGeV/I2vJ7+TDmgPApGts5NDhxTpJzfnR4xt1q
         NWJH4FW3EcRSxWQteMz2bXbguTQkh6l8bkvHa65xgE41eyvCyXnvybPMGFE0ByG+JZuR
         q7lMxBJv1yStGsMHtOreNc5nVYEBxLUjOBbSBVYx8YwhKHQHmF8uUN1XgtW7ACqyoLhW
         Ik6GAemdCqXn/CDVBvhGq5qqZkXj7PORO+7814fLYlDbp+VwyYnFdw6jJPnyGbCu8Jm5
         nRnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e11si561145ybn.749.2017.12.11.21.56.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Dec 2017 21:56:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:56818 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eOdYR-0007EW-5Q
	for alex.bennee@linaro.org; Tue, 12 Dec 2017 00:56:35 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54186)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1eOdY2-00073u-LL
	for qemu-arm@nongnu.org; Tue, 12 Dec 2017 00:56:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>) id 1eOdY1-0006Rl-If
	for qemu-arm@nongnu.org; Tue, 12 Dec 2017 00:56:10 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2842)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_ARCFOUR_SHA1:16) (Exim 4.71)
	(envelope-from <zhaoshenglong@huawei.com>)
	id 1eOdXu-0006HY-0o; Tue, 12 Dec 2017 00:56:02 -0500
Received: from 172.30.72.58 (EHLO DGGEMS406-HUB.china.huawei.com)
	([172.30.72.58])
	by dggrg04-dlp.huawei.com (MOS 4.4.6-GA FastPath queued)
	with ESMTP id DLY62553; Tue, 12 Dec 2017 13:55:51 +0800 (CST)
Received: from [127.0.0.1] (10.177.16.142) by DGGEMS406-HUB.china.huawei.com
	(10.3.19.206) with Microsoft SMTP Server id 14.3.361.1; Tue, 12 Dec 2017
	13:55:42 +0800
Message-ID: <5A2F6F44.8050602@huawei.com>
Date: Tue, 12 Dec 2017 13:55:16 +0800
From: Shannon Zhao <zhaoshenglong@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>,
	<qemu-devel@nongnu.org>
References: <1512745328-5109-1-git-send-email-peter.maydell@linaro.org>
	<1512745328-5109-3-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1512745328-5109-3-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.16.142]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A090202.5A2F6F67.009A, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2014-11-16 11:51:01, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: fea81807f4263d687784991bf0028d59
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
	[fuzzy]
X-Received-From: 45.249.212.190
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
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>,
	Shannon Zhao <shannon.zhao@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dkK/JnyAABxQ



On 2017/12/8 23:02, Peter Maydell wrote:
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
> 
I'm wondering if it need to provide a machine option for user to choose
whether adding the second uart or not.

Thanks,
-- 
Shannon

