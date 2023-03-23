Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp6228799ejb;
        Thu, 23 Mar 2023 01:13:37 -0700 (PDT)
X-Google-Smtp-Source: AK7set/P3UVeG0rgpFDkAKY0LBi/5PxyLPBM01RQ2zAcb//5CYlyjWSnE/EdlnfrfPQqM3z9lyza
X-Received: by 2002:a05:6214:246b:b0:5a2:2a1d:bfb1 with SMTP id im11-20020a056214246b00b005a22a1dbfb1mr9667169qvb.28.1679559217536;
        Thu, 23 Mar 2023 01:13:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679559217; cv=none;
        d=google.com; s=arc-20160816;
        b=s5xs/WWiAyqcvdJSwE3vrJZdMFfV8QYkISFS81kpmKWRmt4npzBx1w9U/ZCI1bw4au
         xSGferJX/7ncZudl/xW4qBysAMwFByY39+mlfwDpJ7Em4/KwvPDRpcrnT1wxcbTSAQuQ
         j2BH0JILn2VAnew+EnJdkAS3hOwWffRR76F0zSqLn+RZfLI2scbDA7jS6rrnJVJog9ph
         JsyDa4f9s9qxa6/FxbHALNNfy+hg0lY2K3Qh6Bno2GZ2SsilWsgsHKZdB/eIdQmQCb5s
         Fdcis6S/WV0ekcI/gxHnV57vXZEVy4LzaC2vRjXJmn0gCG/7zK29yXWtowtfK23fKnhp
         dExA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=1A55O1U2VNz/qzAA97wTguCz1Ttw/UYyzwsuzD+rNb0=;
        b=UngZ4aFVj8NSX527e4qUPH3WorKM4hHZPUGwtq7LK/8pJ4E8cHDVz+wW8wZaH6s1kt
         71qbiyICuPQhX7onJIN4Q+7WC71Ijg5cjuc4TgAnK+oyk78vhuOM9I6gIhldlJbxHhDc
         K5M22/ICSyAwk+8N0iXaJZplXWTtUUHk3vhM5LN2g6dx2V/Jyf140yL9qwOCeY7M6TsD
         kHLpFvb82f6AZSWmYiIxQADpN2kYxgvruxHDkD0zlT5k/GsuO6ENwAhmt3fZUn8cq/Yo
         ChAP29fZRqnjs31r+BkwFH+JD//KYfKpHsf+ZjV3ifYAQovSXu9w9czyvIhxU/SlwdP/
         8BLA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vn8bV4I+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kh7-20020a056214514700b0056ebc103ec6si11270224qvb.200.2023.03.23.01.13.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Mar 2023 01:13:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=vn8bV4I+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pfG4S-0008Vj-Q1; Thu, 23 Mar 2023 04:13:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pfG4K-0008TP-01
 for qemu-arm@nongnu.org; Thu, 23 Mar 2023 04:13:10 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pfG4H-0001AT-PG
 for qemu-arm@nongnu.org; Thu, 23 Mar 2023 04:13:07 -0400
Received: by mail-wr1-x429.google.com with SMTP id r11so2700232wrr.12
 for <qemu-arm@nongnu.org>; Thu, 23 Mar 2023 01:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679559184;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1A55O1U2VNz/qzAA97wTguCz1Ttw/UYyzwsuzD+rNb0=;
 b=vn8bV4I++OmDcST+/WhWJQ+UsVssJUQTklnwyEd1bg73MOywiMIUK6jokzF05iTiC6
 oJN6xQVreb38pmdL1+Tp8X2uxyR3M2iDtpJxM42+uHsuyXyxWsPgvEA3C3niliQgFUmY
 rGruMI5z4mWU/hLJzUmQUfUUc9jhJejRQR3RxQ7YoQr/HzaNtn6Ea6BqFOP5/esWC4kl
 Whzpsshl7S8cRPFu2B4QAZ5wetHYlh12uuM1imIM3G5lzyKf2fmoip/X/lCrDDXhyp9Q
 fHIlgO1YNo1+c5FQ8erwh0spQXZHAxbrOWAIiD4dnti7ec8o6XgUdATtkddX1xlMo3Zu
 Ca5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679559184;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1A55O1U2VNz/qzAA97wTguCz1Ttw/UYyzwsuzD+rNb0=;
 b=gfOVk0nM+/IGTke+aHJfj1KS1dU0bKsd1ovojYmKmfQyu+g1uS4KaLEiWSNbvlC+J9
 ZP07hRz++gGbdKC4AN6GzpE18tIW6gXm8OtaNtjh/DCYNIRVowYDXJ0Pd2d+Z48Z86bp
 ryAoxoot4xzFR33OIdfRyrHxCnyrHGXxrEvQXxOSrHpp1I9URnEQb0JdjzsBtAfYUSFr
 A6GsA6rR7uD025o16sAw7p8LxCHVg1PU/h/xKbUd+i5AOqPVZrm7J7tJyqTEXnmJvp1f
 qFzZnjL5PjtHB9BGDrVKoBXW2eWh8L1JX4b1XJPlEEPG2UWj3c0H56bjzFAvbgEvTsrS
 pexw==
X-Gm-Message-State: AAQBX9dWjJNVMnjpHtT9l38jHYWwqUpGda3fkH+KwWTyBoloer0QrtdZ
 rJnUx1Ra6WKuOjLxue+GPCoVWQ==
X-Received: by 2002:adf:ed43:0:b0:2ce:a8d5:4a89 with SMTP id
 u3-20020adfed43000000b002cea8d54a89mr1830598wro.37.1679559184227; 
 Thu, 23 Mar 2023 01:13:04 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 fc13-20020a05600c524d00b003ee65e7acbcsm1145920wmb.20.2023.03.23.01.13.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Mar 2023 01:13:03 -0700 (PDT)
Message-ID: <f9d044f3-a6cb-f211-e28f-8b9f056c0913@linaro.org>
Date: Thu, 23 Mar 2023 09:13:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.0
Subject: Re: [PATCH] hw/arm/virt: support both pl011 and 16550 uart
Content-Language: en-US
To: Patrick Venture <venture@google.com>, peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, Shu-Chun Weng <scw@google.com>
References: <20230322232704.206683-1-venture@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230322232704.206683-1-venture@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Tc+6/P79umiS

On 23/3/23 00:27, Patrick Venture wrote:
> From: Shu-Chun Weng <scw@google.com>
> 
> Select uart for virt machine from pl011 and ns16550a with
> -M virt,uart={pl011|ns16550a}.

This commit description is missing the "why" we want this change.

In which case the pl011 isn't enough or we don't want it?

> Signed-off-by: Shu-Chun Weng <scw@google.com>
> Signed-off-by: Patrick Venture <venture@google.com>
> ---
>   hw/arm/virt.c         | 85 ++++++++++++++++++++++++++++++++++++++++++-
>   include/hw/arm/virt.h |  6 +++
>   2 files changed, 89 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index ac626b3bef..84b335a5d7 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -80,6 +80,7 @@
>   #include "hw/virtio/virtio-iommu.h"
>   #include "hw/char/pl011.h"
>   #include "qemu/guest-random.h"
> +#include "hw/char/serial.h"
>   
>   #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
>       static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
> @@ -847,8 +848,37 @@ static void create_gic(VirtMachineState *vms, MemoryRegion *mem)
>       }
>   }
>   
> -static void create_uart(const VirtMachineState *vms, int uart,
> -                        MemoryRegion *mem, Chardev *chr)
> +static void create_uart_ns16550a(const VirtMachineState *vms, int uart,
> +                                 MemoryRegion *mem, Chardev *chr)
> +{
> +    char *nodename;
> +    hwaddr base = vms->memmap[uart].base;
> +    hwaddr size = vms->memmap[uart].size;
> +    int irq = vms->irqmap[uart];
> +    const char compat[] = "ns16550a";
> +
> +    serial_mm_init(get_system_memory(), base, 0,
> +                   qdev_get_gpio_in(vms->gic, irq), 19200, serial_hd(0),
> +                   DEVICE_LITTLE_ENDIAN);
> +
> +    nodename = g_strdup_printf("/serial@%" PRIx64, base);
> +
> +    MachineState *ms = MACHINE(vms);
> +
> +    qemu_fdt_add_subnode(ms->fdt, nodename);
> +    qemu_fdt_setprop(ms->fdt, nodename, "compatible", compat, sizeof(compat));
> +    qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "reg", 2, base, 2, size);
> +    qemu_fdt_setprop_sized_cells(ms->fdt, nodename, "clock-frequency",
> +                                 1, 0x825f0);
> +    qemu_fdt_setprop_cells(ms->fdt, nodename, "interrupts",
> +                           GIC_FDT_IRQ_TYPE_SPI, irq,
> +                           GIC_FDT_IRQ_FLAGS_LEVEL_HI);
> +
> +    g_free(nodename);
> +}
> +
> +static void create_uart_pl011(const VirtMachineState *vms, int uart,
> +                              MemoryRegion *mem, Chardev *chr)
>   {
>       char *nodename;
>       hwaddr base = vms->memmap[uart].base;
> @@ -895,6 +925,16 @@ static void create_uart(const VirtMachineState *vms, int uart,
>       g_free(nodename);
>   }
>   
> +static void create_uart(const VirtMachineState *vms, int uart,
> +                        MemoryRegion *mem, Chardev *chr)
> +{
> +    if (vms->uart == UART_NS16550A) {
> +        create_uart_ns16550a(vms, uart, mem, chr);
> +    } else {
> +        create_uart_pl011(vms, uart, mem, chr);
> +    }
> +}
> +
>   static void create_rtc(const VirtMachineState *vms)
>   {
>       char *nodename;
> @@ -2601,6 +2641,39 @@ static void virt_set_gic_version(Object *obj, const char *value, Error **errp)
>       }
>   }
>   
> +static char *virt_get_uart_type(Object *obj, Error **errp)
> +{
> +    VirtMachineState *vms = VIRT_MACHINE(obj);
> +    const char *val = NULL;
> +
> +    switch (vms->uart) {
> +    case UART_PL011:
> +        val = "pl011";
> +        break;
> +    case UART_NS16550A:
> +        val = "ns16550a";
> +        break;
> +    default:
> +        error_setg(errp, "Invalid uart value");
> +    }
> +
> +    return g_strdup(val);
> +}
> +
> +static void virt_set_uart_type(Object *obj, const char *value, Error **errp)
> +{
> +    VirtMachineState *vms = VIRT_MACHINE(obj);
> +
> +    if (!strcmp(value, "pl011")) {
> +        vms->uart = UART_PL011;
> +    } else if (!strcmp(value, "ns16550a")) {
> +        vms->uart = UART_NS16550A;
> +    } else {
> +        error_setg(errp, "Invalid uart type");
> +        error_append_hint(errp, "Valid values are pl011, and ns16550a.\n");
> +    }
> +}
> +
>   static char *virt_get_iommu(Object *obj, Error **errp)
>   {
>       VirtMachineState *vms = VIRT_MACHINE(obj);
> @@ -3172,6 +3245,14 @@ static void virt_instance_init(Object *obj)
>       vms->highmem_compact = !vmc->no_highmem_compact;
>       vms->gic_version = VIRT_GIC_VERSION_NOSEL;
>   
> +    /* Default uart type is pl011 */
> +    vms->uart = UART_PL011;
> +    object_property_add_str(obj, "uart", virt_get_uart_type,
> +                            virt_set_uart_type);
> +    object_property_set_description(obj, "uart",
> +                                    "Set uart type. "
> +                                    "Valid values are pl011 and ns16550a");
> +
>       vms->highmem_ecam = !vmc->no_highmem_ecam;
>       vms->highmem_mmio = true;
>       vms->highmem_redists = true;
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index e1ddbea96b..04539f347d 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -122,6 +122,11 @@ typedef enum VirtGICType {
>   #define VIRT_GIC_VERSION_3_MASK BIT(VIRT_GIC_VERSION_3)
>   #define VIRT_GIC_VERSION_4_MASK BIT(VIRT_GIC_VERSION_4)
>   
> +typedef enum UartType {
> +    UART_PL011,
> +    UART_NS16550A,
> +} UartType;
> +
>   struct VirtMachineClass {
>       MachineClass parent;
>       bool disallow_affinity_adjustment;
> @@ -183,6 +188,7 @@ struct VirtMachineState {
>       PCIBus *bus;
>       char *oem_id;
>       char *oem_table_id;
> +    UartType uart;
>   };
>   
>   #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM : VIRT_PCIE_ECAM)

