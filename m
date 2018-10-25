Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp574537wro;
        Thu, 25 Oct 2018 04:31:53 -0700 (PDT)
X-Google-Smtp-Source: AJdET5elWmbAVLV/KdPysZE1RzDQTouEPSh6HAc5JASZ/OwAlDU72ZfV0lqNCbCwy+kTvbfZreOw
X-Received: by 2002:ac8:2fa2:: with SMTP id l31-v6mr985118qta.83.1540467113082;
        Thu, 25 Oct 2018 04:31:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540467113; cv=none;
        d=google.com; s=arc-20160816;
        b=SWEH3NBIuGc8EnpcWjPYK/jOtsPFcJ6yIqweU729OLxy+GRla0hRqftrRn2eSsgQA1
         dEKDEM0zywb6Dg9nXvAyPM/H0t1ur3qzne5sxdM+Q2Ps4BhtZa12y3iwNpTn5OnJWSRv
         v54980qsFPFsjwjtK40sr4QyacYZlaQJMLsxkbsokuWsnG2r1/Fapru6IuqZqwFmS2HT
         gxIAtXnaLlNriFf+blWtKVrN9cxejRJ8qALcOerblVpn8GuRPU0vgtk0NxCAPsNktD6l
         PLIaLqPOkDUdRwv9HBfqWib7z2bMGKx2JqDUd+Nsl8gtCklPGkhT0WOLDPTQsgcCZIsn
         LyYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=AMppXnlxeGlcyZEmluLZWckATcGhS2TelUKU/JEWVqo=;
        b=cs7sOVS5poCLHdXP27GPgU3S8NMhPDj4822uwh0p1lJwtjzvjzL7WQ1+C1x+QrcLdN
         hXgznPVWB2x1zN6yfXye764gspBh54ZbdfmJ7pcVRFZtXYLmXrCgpw+jP5esi+gPH1WS
         mTxc3AcXrDva7/m2B9UVQsvpq+UitbaluRu2Bf4byPaj9MhALksSQLG14UgiUV2//Clg
         9GkQ1uu+4xr49DTL4PPqm1xriLcZwfS0O6wNK7XMlQsiLY1+I9flk9ybbUTNQ3us8/qY
         RMlv9K+uR2lHZXOnDcOSkTmxtfz86mMU+BYCLoyzGpgBwLPN0kDhpPz5orS5OkN04jle
         ioow==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n83si5270880qkl.183.2018.10.25.04.31.52
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 25 Oct 2018 04:31:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53846 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gFdrk-0007Ia-Ks
	for alex.bennee@linaro.org; Thu, 25 Oct 2018 07:31:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53115)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gFdrV-0007Dd-D7
	for qemu-arm@nongnu.org; Thu, 25 Oct 2018 07:31:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gFdoR-0002iQ-AB
	for qemu-arm@nongnu.org; Thu, 25 Oct 2018 07:28:32 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:38867)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1gFdoQ-0002QJ-UD
	for qemu-arm@nongnu.org; Thu, 25 Oct 2018 07:28:27 -0400
Received: by mail-wr1-f66.google.com with SMTP id d10-v6so8938278wrs.5
	for <qemu-arm@nongnu.org>; Thu, 25 Oct 2018 04:28:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=AMppXnlxeGlcyZEmluLZWckATcGhS2TelUKU/JEWVqo=;
	b=i3aASimZTBNp57CcgbwbzCy+EVz+zWmxo9f+9dUY7oxs4X60cIo2eg87EY0o/jUihM
	L0ix2RkfuP5PYvdR7abp/US+doypCMDnZX9FCmnDdTTMlXgQI3C4OGryCMIuEhRLuCbr
	9SaD5ut9bwiDLq/4uMMQmaFfj6tTqoF5qZlVJ3MDxCdgXAu7qT5nKN4G8pMQg8+aZ//n
	mQOIHhLSu9hjBEC7GJLic8G5SnUdgqIOFpQC10dXxwZDzLD0/a8/m7ujZsJn4HZW0sL+
	Qk3GphotAACY98MS1fb9DvCoLl4puI25SPvecw77ujpGAh516HW70ZMDWva4RtV34dgM
	Vcng==
X-Gm-Message-State: AGRZ1gLkNxpL/Hb42TMzm6PDvA2mOoC9IwJ3mOylUuIARHGwVReVfE3n
	Ma/PdVo7d452ufg3t3dzfyZfX/oK1ao=
X-Received: by 2002:a5d:4e03:: with SMTP id
	p3-v6mr1537973wrt.320.1540466900971; 
	Thu, 25 Oct 2018 04:28:20 -0700 (PDT)
Received: from [10.101.215.143] ([185.7.230.216])
	by smtp.gmail.com with ESMTPSA id
	t143-v6sm1383537wmt.2.2018.10.25.04.28.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 25 Oct 2018 04:28:20 -0700 (PDT)
To: Peng Hao <peng.hao2@zte.com.cn>, peter.maydell@linaro.org
References: <1540495397-88089-1-git-send-email-peng.hao2@zte.com.cn>
	<1540495397-88089-5-git-send-email-peng.hao2@zte.com.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <f15d7c94-a7ab-0616-0719-e12f997729b6@redhat.com>
Date: Thu, 25 Oct 2018 13:28:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <1540495397-88089-5-git-send-email-peng.hao2@zte.com.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-arm] [PATCH V4 4/5] hw/arm/virt: Use the pvpanic device
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7PxvK3/YU1Eg

Hi,

On 25/10/18 21:23, Peng Hao wrote:
> add pvpanic device in aarch64 virt machine.
> 
> Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   default-configs/aarch64-softmmu.mak |  1 +
>   hw/arm/virt.c                       | 21 +++++++++++++++++++++
>   include/hw/arm/virt.h               |  1 +
>   3 files changed, 23 insertions(+)
> 
> diff --git a/default-configs/aarch64-softmmu.mak b/default-configs/aarch64-softmmu.mak
> index 6f790f0..57c6ca5 100644
> --- a/default-configs/aarch64-softmmu.mak
> +++ b/default-configs/aarch64-softmmu.mak
> @@ -9,3 +9,4 @@ CONFIG_DPCD=y
>   CONFIG_XLNX_ZYNQMP=y
>   CONFIG_XLNX_ZYNQMP_ARM=y
>   CONFIG_ARM_SMMUV3=y
> +CONFIG_PVPANIC=y
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 9f67782..ffe8d00 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -59,6 +59,7 @@
>   #include "qapi/visitor.h"
>   #include "standard-headers/linux/input.h"
>   #include "hw/arm/smmuv3.h"
> +#include "hw/misc/pvpanic.h"
>   
>   #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
>       static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
> @@ -143,6 +144,7 @@ static const MemMapEntry a15memmap[] = {
>       [VIRT_GPIO] =               { 0x09030000, 0x00001000 },
>       [VIRT_SECURE_UART] =        { 0x09040000, 0x00001000 },
>       [VIRT_SMMU] =               { 0x09050000, 0x00020000 },
> +    [VIRT_PVPANIC_MMIO] =       { 0x09060000, 0x00000002 },
>       [VIRT_MMIO] =               { 0x0a000000, 0x00000200 },
>       /* ...repeating for a total of NUM_VIRTIO_TRANSPORTS, each of that size */
>       [VIRT_PLATFORM_BUS] =       { 0x0c000000, 0x02000000 },
> @@ -190,6 +192,23 @@ static bool cpu_type_valid(const char *cpu)
>       return false;
>   }
>   
> +static void create_pvpanic_device(const VirtMachineState *vms)
> +{
> +    char *nodename;
> +    hwaddr base = vms->memmap[VIRT_PVPANIC_MMIO].base;
> +    hwaddr size = vms->memmap[VIRT_PVPANIC_MMIO].size;
> +
> +    sysbus_create_simple(TYPE_PVPANIC_MMIO, base, NULL);
> +
> +    nodename = g_strdup_printf("/pvpanic-mmio@%" PRIx64, base);

Can you add a link in the cover linking to the kernel side series?

> +    qemu_fdt_add_subnode(vms->fdt, nodename);
> +    qemu_fdt_setprop_string(vms->fdt, nodename,
> +                            "compatible", "qemu,pvpanic-mmio");
> +    qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "reg",
> +                                 2, base, 2, size);
> +    g_free(nodename);
> +}
> +
>   static void create_fdt(VirtMachineState *vms)
>   {
>       void *fdt = create_device_tree(&vms->fdt_size);
> @@ -1531,6 +1550,8 @@ static void machvirt_init(MachineState *machine)
>   
>       create_flash(vms, sysmem, secure_sysmem ? secure_sysmem : sysmem);
>   
> +    create_pvpanic_device(vms);
> +
>       create_gic(vms, pic);
>   
>       fdt_add_pmu_nodes(vms);
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 4cc57a7..ba54b84 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -66,6 +66,7 @@ enum {
>       VIRT_GIC_REDIST,
>       VIRT_GIC_REDIST2,
>       VIRT_SMMU,
> +    VIRT_PVPANIC_MMIO,

All those enums are MMIO, so we can simply use VIRT_PVPANIC here.

>       VIRT_UART,
>       VIRT_MMIO,
>       VIRT_RTC,
> 
