Received: by 10.25.44.15 with SMTP id s15csp4795783lfs;
        Tue, 11 Jul 2017 05:55:30 -0700 (PDT)
X-Received: by 10.200.45.241 with SMTP id q46mr11382393qta.177.1499777730671;
        Tue, 11 Jul 2017 05:55:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499777730; cv=none;
        d=google.com; s=arc-20160816;
        b=XCGT9K6nYe5SyiaeRJGfbHznOE3BLPbUbTUQ3JAKDi97AqTRO44BTaCWqVkYtQFjTf
         IhBtAt8e5ZcCpzzUFsj/MlFVh0zs0RlMaQCBoOveL/GrLtQ9TfKS59KjgQ9u9DayGt/a
         aZ4Wqf2oGcd1Uof+almijIU6LE/fT8SZK/BxwwzMtnBf1npjZ+RBeUq+ZYVxgLQ2oHjK
         BgQraoIL/E9/cKO+1IkaLMgw+OmLRXLmQ/ws8Du9eSsqAXLxmrvCh4oG5ae8VARd49C6
         LA24W0ZvX5UxT7pZmpX1vJ8AbhHaPztjHD+suYV3DW0aYXOUSpDX5x/7l4UiGfGxzqLx
         /Dpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:dkim-signature
         :arc-authentication-results;
        bh=rH7k+Fd475TlexJHoDntu1z+79mVA7+8CBKyX3PzAM0=;
        b=RTAViQTshGSkRnSzM9GJqaFPNxVWeP01mihbOKxwwpkLSwSkH/a8ymdLLPTBwBClN4
         SBPzN/Q6eHih/ST7szeC3MTIIzWnCyQWaOLWbROQHLG6n72cZf9j+X/h3GeL6XFWDxFL
         i/8WfFoYazj7yuJ6eLAFGe5Rj7zdIWj7tyY6idxiB4feKSzj8XxWC2BtHw9XFo9XJaOJ
         eMmh+pnJ7iX5PCnasbpjL+QRifmdTQdrCQg3+9Wc4SSy4R8gLjSUAI5rj/6DxhuynKoW
         LMEJN3524XBPHdt83s9I1d5k2xArKuXh52lGtu7j0edd2yEGnbSB6VjmyLCbX6n3A8Xs
         q6Jw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=slrIcD6i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id j2si3536896qke.391.2017.07.11.05.55.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 11 Jul 2017 05:55:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=slrIcD6i;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46216 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dUuhL-0006kp-VE
	for alex.bennee@linaro.org; Tue, 11 Jul 2017 08:55:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37711)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dUuhC-0006j2-3e
	for qemu-arm@nongnu.org; Tue, 11 Jul 2017 08:55:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dUuhB-0001K4-3B
	for qemu-arm@nongnu.org; Tue, 11 Jul 2017 08:55:18 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:33895)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dUuh6-0001IX-JC; Tue, 11 Jul 2017 08:55:12 -0400
Received: by mail-qk0-x243.google.com with SMTP id q66so6193760qki.1;
	Tue, 11 Jul 2017 05:55:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=rH7k+Fd475TlexJHoDntu1z+79mVA7+8CBKyX3PzAM0=;
	b=slrIcD6i+GekQ0yCucUhfEijKsQHVVl4yE+RLplNfrsYAinFB//ThXGa6YSsBA1fuj
	ORX/u9YvfYWBMTFeMrsraKE59U4RTw/5yQydF1spjReGYSRdtRm5tEOUAKo4QAV9UV4f
	xyEfWsXiyi0apTomAZtZgiXPdZk9A9yZ7Cee0tgBug8b8RhwlODJ08Ax1RUT96tMoMIn
	HzXUQcPCRgscNBhF/OX0PZg9Yg4bVvcgiuFMtCu9d95wVEQapjceGccN1uqwxjCngH4a
	nBnnpD+ERrZsNw3O8Pb7/2FHXLNtpG2l4xFanE8AUt85MuWCFc3uzNK1vd4YUfyKitqT
	ApuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=rH7k+Fd475TlexJHoDntu1z+79mVA7+8CBKyX3PzAM0=;
	b=Bdn/k03TT0d0xtv3dAS/yWfSFDXd9RZTKU0aJA5676G2N3Zs64sn2sjd+oFBXRjMQ1
	QwZm97Yr6cQPLnayyxUO9q3HHfUUCeq3JnddXY/OyRdOFw5djYpoTI0867/lM/4b8vEf
	Rit5Z/kKI/fRFIQFCnClUjEdJ0NQg1VJh1d4ErjrHzVFpaiu4EVHnejya8cM51XoNJKb
	PxCSIpJNpxkgYeXWPRQa8QVk/T2azRZobVcEBxrSQSHL1QdAtzg8HGWVCDFMeOYdpNZP
	DVV1S+I4sxwnEy37uM7TesxgPwDoQf5XOcQoggHp/HXEntjegpvGr3OT9hRuQ7VvDFE5
	hoiw==
X-Gm-Message-State: AIVw113nHGSTd9NiMPAlJrCOe9NBMRLBTFTG3TcpN4R4lnBAAvNb9Gsn
	cqbwXZGHiWNmYQzI0hUUtA==
X-Received: by 10.55.12.4 with SMTP id 4mr10223768qkm.151.1499777711853;
	Tue, 11 Jul 2017 05:55:11 -0700 (PDT)
Received: from [192.168.1.124] ([190.48.66.60])
	by smtp.gmail.com with ESMTPSA id
	f16sm11893444qte.18.2017.07.11.05.55.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Jul 2017 05:55:11 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1499771839-32518-1-git-send-email-peter.maydell@linaro.org>
	<1499771839-32518-8-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <fdb48dbe-b3c4-6641-b329-aeafb17a663c@amsat.org>
Date: Tue, 11 Jul 2017 09:55:08 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <1499771839-32518-8-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: Re: [Qemu-arm] [PATCH 7/7] hw/arm/mps2: Add SCC
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: U8+D/I/gIT8R

On 07/11/2017 08:17 AM, Peter Maydell wrote:
> Add the SCC to the MPS2 board models.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>   hw/arm/mps2.c | 17 ++++++++++++++++-
>   1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
> index b1a0df9..3dd61fe 100644
> --- a/hw/arm/mps2.c
> +++ b/hw/arm/mps2.c
> @@ -34,6 +34,7 @@
>   #include "hw/misc/unimp.h"
>   #include "hw/char/cmsdk-apb-uart.h"
>   #include "hw/timer/cmsdk-apb-timer.h"
> +#include "hw/misc/mps2-scc.h"
>   
>   typedef enum MPS2FPGAType {
>       FPGA_AN385,
> @@ -44,6 +45,7 @@ typedef struct {
>       MachineClass parent;
>       MPS2FPGAType fpga_type;
>       const char *cpu_model;
> +    uint32_t scc_id;
>   } MPS2MachineClass;
>   
>   typedef struct {
> @@ -60,6 +62,7 @@ typedef struct {
>       MemoryRegion blockram_m2;
>       MemoryRegion blockram_m3;
>       MemoryRegion sram;
> +    MPS2SCC scc;
>   } MPS2MachineState;
>   
>   #define TYPE_MPS2_MACHINE "mps2"
> @@ -114,7 +117,7 @@ static void mps2_common_init(MachineState *machine)
>   
>       MemoryRegion *system_memory = get_system_memory();
>   
> -    DeviceState *armv7m;
> +    DeviceState *armv7m, *sccdev;
>   
>       /* The FPGA images have an odd combination of different RAMs,
>        * because in hardware they are different implementations and
> @@ -298,6 +301,16 @@ static void mps2_common_init(MachineState *machine)
>       cmsdk_apb_timer_create(0x40000000, qdev_get_gpio_in(armv7m, 8), SYSCLK_FRQ);
>       cmsdk_apb_timer_create(0x40001000, qdev_get_gpio_in(armv7m, 9), SYSCLK_FRQ);
>   
> +    object_initialize(&mms->scc, sizeof(mms->scc), TYPE_MPS2_SCC);
> +    sccdev = DEVICE(&mms->scc);
> +    qdev_set_parent_bus(armv7m, sysbus_get_default());
> +    qdev_prop_set_uint32(sccdev, "scc-cfg4", 0x2);
> +    qdev_prop_set_uint32(sccdev, "scc-aid", 0x02000008);
> +    qdev_prop_set_uint32(sccdev, "scc-id", mmc->scc_id);
> +    object_property_set_bool(OBJECT(&mms->scc), true, "realized",
> +                             &error_fatal);
> +    sysbus_mmio_map(SYS_BUS_DEVICE(sccdev), 0, 0x4002f000);
> +
>       system_clock_scale = NANOSECONDS_PER_SECOND / SYSCLK_FRQ;
>   
>       armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
> @@ -320,6 +333,7 @@ static void mps2_an385_class_init(ObjectClass *oc, void *data)
>       mc->desc = "ARM MPS2 with AN385 FPGA image for Cortex-M3";
>       mmc->fpga_type = FPGA_AN385;
>       mmc->cpu_model = "cortex-m3";
> +    mmc->scc_id = 0x41040000 | (385 << 4);
>   }
>   
>   static void mps2_an511_class_init(ObjectClass *oc, void *data)
> @@ -330,6 +344,7 @@ static void mps2_an511_class_init(ObjectClass *oc, void *data)
>       mc->desc = "ARM MPS2 with AN511 DesignStart FPGA image for Cortex-M3";
>       mmc->fpga_type = FPGA_AN511;
>       mmc->cpu_model = "cortex-m3";
> +    mmc->scc_id = 0x4104000 | (511 << 4);
>   }
>   
>   static const TypeInfo mps2_info = {
> 
