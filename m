Received: by 10.25.0.147 with SMTP id 141csp82116lfa;
        Mon, 20 Feb 2017 08:25:40 -0800 (PST)
X-Received: by 10.237.55.169 with SMTP id j38mr19180933qtb.286.1487607940751;
        Mon, 20 Feb 2017 08:25:40 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d190si13227578qkb.262.2017.02.20.08.25.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 Feb 2017 08:25:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39611 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cfqmS-00088S-4L
	for alex.bennee@linaro.org; Mon, 20 Feb 2017 11:25:40 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55869)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cfqlP-00085y-QR
	for qemu-devel@nongnu.org; Mon, 20 Feb 2017 11:24:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cfqlL-0002xZ-QL
	for qemu-devel@nongnu.org; Mon, 20 Feb 2017 11:24:35 -0500
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:35818)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1cfqlL-0002wk-LV; Mon, 20 Feb 2017 11:24:31 -0500
Received: by mail-qk0-x242.google.com with SMTP id n127so3963259qkf.2;
	Mon, 20 Feb 2017 08:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=AaAbc8lfn5Hu3b44XqMNsPDo75NLK0786KKfQCNZego=;
	b=B+SCVpByztcc/irIze9K7qp3PSbNoxQMgTfDDxZQ3Q19vWqpHHnz2JAKY6c09iBAD1
	Eu0nRIP1r99fYVHaIpdH8WbGQ4QtPptJvk6aUqqki88bIgEnbo/Yq57nnY5PMQToVRH8
	yBiFwqHMdO08D8T2UEHg/E6vBcEHLVGZxoTX43z+EZII4plwdmi7tkOt0OAVa9VBuEAK
	pv+tuv5LqBt93Md+vWD1kzZ1cOPrQea2xw5Poq1UR/rbuJTGOQf4fkeh1lzR+iciD2CI
	hoF69wNdJEgh2dh4XUgpftxqCbAb9D3KkUAWLgl8QBkCrjDoA927oGFRo6E/95Ar04xw
	9u7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:cc:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=AaAbc8lfn5Hu3b44XqMNsPDo75NLK0786KKfQCNZego=;
	b=s/6opIvv42F8W4Aa0136kO5/HDrEFl5/zIDk1WI5OkF2qT6m/9XxxVTw9h4hjTcndv
	eWB7qjlXVYOjnij3WPVt3WaNbOU4NvkD61q+jwL/QJtBBl9VlnDGzzxRDoLfwIoHFK7s
	ojdE/A1hBpaSAnJCvxZoTRd7HpoQANp9tBMHzNGwzqXxwtYj3j4uvUkI9as7GjL/QiW9
	7gYVqCXGSIaE6SUrKTIhzPmvdkbl3yIb8TCc9maNRuPyY2AJHQrSNgaEcIvWrBNc1Qh/
	tAIOeIsaQX8TQV27Qm/p5tlJQ6h51Uhr/S5hSUxYOWVjAvztjzOwPDO0YFeIy5OCUrkK
	l5mg==
X-Gm-Message-State: AMke39nHIbL/lyCRfQRRFXHXvwpzpNHWAvVdVNISTjBOwwva1PEbPSUon53k8+yPx3hXkQ==
X-Received: by 10.55.177.133 with SMTP id a127mr19929854qkf.301.1487607870122; 
	Mon, 20 Feb 2017 08:24:30 -0800 (PST)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	k18sm12229006qtc.12.2017.02.20.08.24.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Feb 2017 08:24:29 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
References: <1487604965-23220-1-git-send-email-peter.maydell@linaro.org>
	<1487604965-23220-3-git-send-email-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d1c1bc8f-31e8-0751-ef7b-c1af559bad72@amsat.org>
Date: Mon, 20 Feb 2017 13:24:26 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <1487604965-23220-3-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400d:c09::242
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 02/11] armv7m: Move NVICState
 struct definition into header
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Alistair Francis <alistair23@gmail.com>,
	Michael Davidsaver <mdavidsaver@gmail.com>, patches@linaro.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +BYTHFlLSgv+

On 02/20/2017 12:35 PM, Peter Maydell wrote:
> Move the NVICState struct definition into a header, so we can
> embed it into other QOM objects like SoCs.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> ---
>  include/hw/arm/armv7m_nvic.h | 66 ++++++++++++++++++++++++++++++++++++++++++++
>  hw/intc/armv7m_nvic.c        | 49 +-------------------------------
>  2 files changed, 67 insertions(+), 48 deletions(-)
>  create mode 100644 include/hw/arm/armv7m_nvic.h
>
> diff --git a/include/hw/arm/armv7m_nvic.h b/include/hw/arm/armv7m_nvic.h
> new file mode 100644
> index 0000000..39b94ee
> --- /dev/null
> +++ b/include/hw/arm/armv7m_nvic.h
> @@ -0,0 +1,66 @@
> +/*
> + * ARMv7M NVIC object
> + *
> + * Copyright (c) 2017 Linaro Ltd
> + * Written by Peter Maydell <peter.maydell@linaro.org>
> + *
> + * This code is licensed under the GPL version 2 or later.
> + */
> +
> +#ifndef HW_ARM_ARMV7M_NVIC_H
> +#define HW_ARM_ARMV7M_NVIC_H
> +
> +#include "target/arm/cpu.h"
> +#include "hw/sysbus.h"
> +
> +#define TYPE_NVIC "armv7m_nvic"
> +
> +#define NVIC(obj) \
> +    OBJECT_CHECK(NVICState, (obj), TYPE_NVIC)
> +
> +/* Highest permitted number of exceptions (architectural limit) */
> +#define NVIC_MAX_VECTORS 512
> +
> +typedef struct VecInfo {
> +    /* Exception priorities can range from -3 to 255; only the unmodifiable
> +     * priority values for RESET, NMI and HardFault can be negative.
> +     */
> +    int16_t prio;
> +    uint8_t enabled;
> +    uint8_t pending;
> +    uint8_t active;
> +    uint8_t level; /* exceptions <=15 never set level */
> +} VecInfo;
> +
> +typedef struct NVICState {
> +    /*< private >*/
> +    SysBusDevice parent_obj;
> +    /*< public >*/
> +
> +    ARMCPU *cpu;
> +
> +    VecInfo vectors[NVIC_MAX_VECTORS];
> +    uint32_t prigroup;
> +
> +    /* vectpending and exception_prio are both cached state that can
> +     * be recalculated from the vectors[] array and the prigroup field.
> +     */
> +    unsigned int vectpending; /* highest prio pending enabled exception */
> +    int exception_prio; /* group prio of the highest prio active exception */
> +
> +    struct {
> +        uint32_t control;
> +        uint32_t reload;
> +        int64_t tick;
> +        QEMUTimer *timer;
> +    } systick;
> +
> +    MemoryRegion sysregmem;
> +    MemoryRegion container;
> +
> +    uint32_t num_irq;
> +    qemu_irq excpout;
> +    qemu_irq sysresetreq;
> +} NVICState;
> +
> +#endif
> diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
> index 76097b4..f2ada39 100644
> --- a/hw/intc/armv7m_nvic.c
> +++ b/hw/intc/armv7m_nvic.c
> @@ -17,6 +17,7 @@
>  #include "hw/sysbus.h"
>  #include "qemu/timer.h"
>  #include "hw/arm/arm.h"
> +#include "hw/arm/armv7m_nvic.h"
>  #include "target/arm/cpu.h"
>  #include "exec/address-spaces.h"
>  #include "qemu/log.h"
> @@ -47,7 +48,6 @@
>   * "exception" more or less interchangeably.
>   */
>  #define NVIC_FIRST_IRQ 16
> -#define NVIC_MAX_VECTORS 512
>  #define NVIC_MAX_IRQ (NVIC_MAX_VECTORS - NVIC_FIRST_IRQ)
>
>  /* Effective running priority of the CPU when no exception is active
> @@ -55,53 +55,6 @@
>   */
>  #define NVIC_NOEXC_PRIO 0x100
>
> -typedef struct VecInfo {
> -    /* Exception priorities can range from -3 to 255; only the unmodifiable
> -     * priority values for RESET, NMI and HardFault can be negative.
> -     */
> -    int16_t prio;
> -    uint8_t enabled;
> -    uint8_t pending;
> -    uint8_t active;
> -    uint8_t level; /* exceptions <=15 never set level */
> -} VecInfo;
> -
> -typedef struct NVICState {
> -    /*< private >*/
> -    SysBusDevice parent_obj;
> -    /*< public >*/
> -
> -    ARMCPU *cpu;
> -
> -    VecInfo vectors[NVIC_MAX_VECTORS];
> -    uint32_t prigroup;
> -
> -    /* vectpending and exception_prio are both cached state that can
> -     * be recalculated from the vectors[] array and the prigroup field.
> -     */
> -    unsigned int vectpending; /* highest prio pending enabled exception */
> -    int exception_prio; /* group prio of the highest prio active exception */
> -
> -    struct {
> -        uint32_t control;
> -        uint32_t reload;
> -        int64_t tick;
> -        QEMUTimer *timer;
> -    } systick;
> -
> -    MemoryRegion sysregmem;
> -    MemoryRegion container;
> -
> -    uint32_t num_irq;
> -    qemu_irq excpout;
> -    qemu_irq sysresetreq;
> -} NVICState;
> -
> -#define TYPE_NVIC "armv7m_nvic"
> -
> -#define NVIC(obj) \
> -    OBJECT_CHECK(NVICState, (obj), TYPE_NVIC)
> -
>  static const uint8_t nvic_id[] = {
>      0x00, 0xb0, 0x1b, 0x00, 0x0d, 0xe0, 0x05, 0xb1
>  };
>
