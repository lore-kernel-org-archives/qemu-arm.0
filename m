Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp1326046njb;
        Wed, 14 May 2025 09:47:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVtNqG/oyq1CWIs33IbdUoMbKJgVugJPDyNPIaCGtZOlz4w+zUrdXpO2v0XwFyOqqOdux4ppaiojrrORQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGX1ZAdOZDKPsAhwNhwdyuY3p0AGA5eOrY+QlLdId87UytFruqw3fkI2/SysXY+R6FeF4qo
X-Received: by 2002:a05:6214:19ed:b0:6f5:4508:fd84 with SMTP id 6a1803df08f44-6f896ec9ca4mr62054416d6.35.1747241226068;
        Wed, 14 May 2025 09:47:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747241226; cv=none;
        d=google.com; s=arc-20240605;
        b=AW72U+kKpICjELOhahOgrKK3K7v6YjyGFNWOmJ5GyugWiIHDAysD7MnGz24Ml8UXR6
         0aL+g4FFQ6ca0XEiyfoCRwW9ao0lKDrdCUDUVwRhOI3HIoLhkJA4H0A4QQa/m7YrSsiU
         RpLIoO5QrzfwkvJ9KRxKEWGQ7UleplC5W32F/3KQr5A2Yo8GF2ifp93aivHPkCxdMfFd
         gYy1bb2zV3RdhrZCkdzu+Xu/M71S+K8kbkxERKuCbR0d+jPZaLgdiME7MIWkTlVkUJH3
         TPS6xG6v7i+ZKx9masnqGwZ39xz1RIjERfP1blACc1jMpGbGHePAEQLn8/4L3o+nOVUR
         GJug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=8893/NzsFk9tQOeGxihb/t7h/4NJ94lUWPU/ys1E+Tw=;
        fh=Sp1hDIiTShcBZMyB7JNBkG5HJD97p8l4Dmj/+HBJR6c=;
        b=hqRrpMFMiDgUl5zCA/bTKnVkeooCD1BN/o3fjHXzY+ld+HMo/Yg737+8fiYxLnzYYu
         L3YgQAqTK9RxR3KfDJaCTWnvGFrGtwWlz1JmdgbbX/wfJ9uGHI8lEC/xh1dlm8h23Zee
         ySlAZvpJj4WaIKJUJzd/zFSg6mrQE9MWqmbsUIHKkd4hQX64aL9ewPPbZ63LXfBIgOEw
         fTUZpBhqxUkm+jgnG/kmbKWEQWV6UqU9aO7uqsbVwa/abKRufIVWhAi1TAEkcdQEL+9p
         ESfTmBSOh+H7rXyjKcpSH+8r+wnGfIqm9qK2isqH3YgrFCvKL0mPV0FWXCOO9vtIWcdo
         y4hg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="GUpPd3/8";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f6e39e7202si111840586d6.2.2025.05.14.09.47.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 May 2025 09:47:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="GUpPd3/8";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uFFFz-0002zu-Py; Wed, 14 May 2025 12:46:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uFFFm-0002jc-2b
 for qemu-arm@nongnu.org; Wed, 14 May 2025 12:46:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1uFFFh-0004na-Rd
 for qemu-arm@nongnu.org; Wed, 14 May 2025 12:46:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747241200;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8893/NzsFk9tQOeGxihb/t7h/4NJ94lUWPU/ys1E+Tw=;
 b=GUpPd3/8KCib7O8BPDRKqBD6n6u+iqALiu19LqQYtJuHBu6a+ZycWxGI/lsNWjAQZRfd1n
 73zyKvi1lCRl0Apuret65IxVunHJ6H+uQrE0kmGJH1Co25eqbF2AA2fFV0YINDhOvw5oAJ
 8hta0Md0jfUxqpFh3wlC99rM2dpc4Is=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-231-gqwJ1Q5jNVmLpKwOnK8YfQ-1; Wed, 14 May 2025 12:46:38 -0400
X-MC-Unique: gqwJ1Q5jNVmLpKwOnK8YfQ-1
X-Mimecast-MFC-AGG-ID: gqwJ1Q5jNVmLpKwOnK8YfQ_1747241198
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-440667e7f92so127965e9.3
 for <qemu-arm@nongnu.org>; Wed, 14 May 2025 09:46:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747241197; x=1747845997;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8893/NzsFk9tQOeGxihb/t7h/4NJ94lUWPU/ys1E+Tw=;
 b=QzdqNwBB1lsFLzp33zV71u65SAnP70kdnRmsSj9TP8uAZamBsLdJinTwLOV9izmX5J
 EO1RSEbHqBnJfkUVSCHbT5iRUtGAlKv4goCXnvKHu1THydtqABFE7Ep9z2790JrjDgtv
 cgFsO0bBRZc9za8O4tEdh1Kttlrc3X6Sv9qPinI51akZeRm25hmdywYz7bPStBc/GGPr
 49WwrykKhKiRblPpfqEoChZS0awiKyznzX38hQ1tepvUAE5kAmUxdDr0QU8hNBdGoBfY
 Ez5/YUqb7uYabpawvxQPz86T/SlX/0PLVRTSWKL4c3+4Gzs1PLT/5kssbkf6UewqPAA5
 Gp4w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqIb1Z2dSff5pztzpkOdNt8TSqkRX8ev+aDmeAThHwztuH91IvIfN90NlxRHjLHtRP5sELUHSOEg==@nongnu.org
X-Gm-Message-State: AOJu0Yz2WhV+RzdQenruFHZq6hq+6Pdu6bhS8ijQ5O5uu33lUI1l9uk2
 V4ACIG8d6NzC71zXkS1MMSjsAlQgpEzhyaaFxzoOwSTE2CAj2FamKKoYeC9yLszP34JWANM00KB
 ZIvKbDmcUfYH+/G7bN9tLD7FAZYsvaWRryoKzAzdBMTUQ6+jPXg==
X-Gm-Gg: ASbGncuthzaYm8XP3B23zGxEAbML6eDqOKaBirhZQ3BluPxfYluOWlAcLac9HZTuShg
 tkYUDMhohdfbEN77QXUVLOKxQVPdG3EeGJsbDByhgxxqfcOBfw83GB1Ljt75+ZmbsOOtci+BsVj
 /4I2/gYc6av5y2mJxBHvj1+YqV86aJUanCL1TDhiAz2HOCW8N6NX/dpq5zo2CCtiJCHZJl+Y07m
 9ZXv01eTZB3tuBdgyeOBEcqGGXS1NrVY89vsu2XrNGb0k9zIRELpwXWiU1nr6IyinGDVZE/gkE5
 fWXzhGMhylJl1FB9D8bBNOC6DfURWv3PouWTE4fv2jub+OpZcorEwXYa5p4=
X-Received: by 2002:a05:600c:a42:b0:442:f4d4:522 with SMTP id
 5b1f17b1804b1-442f4d44013mr25334685e9.5.1747241197408; 
 Wed, 14 May 2025 09:46:37 -0700 (PDT)
X-Received: by 2002:a05:600c:a42:b0:442:f4d4:522 with SMTP id
 5b1f17b1804b1-442f4d44013mr25334515e9.5.1747241196939; 
 Wed, 14 May 2025 09:46:36 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442f3380498sm38676575e9.11.2025.05.14.09.46.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 May 2025 09:46:35 -0700 (PDT)
Message-ID: <b7f9bd89-e1a1-45bb-bbc0-c44f495ae82f@redhat.com>
Date: Wed, 14 May 2025 18:46:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 18/24] hw/acpi/ged: Prepare the device to react to PCI
 hotplug events
To: Gustavo Romero <gustavo.romero@linaro.org>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 imammedo@redhat.com, anisinha@redhat.com, mst@redhat.com,
 shannon.zhaosl@gmail.com
Cc: pbonzini@redhat.com, Jonathan.Cameron@huawei.com
References: <20250428102628.378046-1-eric.auger@redhat.com>
 <20250428102628.378046-19-eric.auger@redhat.com>
 <e68728e0-c478-475c-8cab-f64907afbcfb@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <e68728e0-c478-475c-8cab-f64907afbcfb@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bYE9YVO3L-_7Ua5eJ7tpJ_6htfgMSLDSGvBS1BrwWNE_1747241198
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.686,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: Ppu03YaDNgHt

Hi Gustavo,

On 5/14/25 6:20 PM, Gustavo Romero wrote:
> Hi Eric,
>
> On 4/28/25 07:25, Eric Auger wrote:
>> QEMU will notify the OS about PCI hotplug/hotunplug events through
>> GED interrupts. Let the GED device handle a new PCI hotplug event.
>> On its occurence it calls the \\_SB.PCI0.PCNT method with the BLCK
>
> nit: occurrence -^
>
>
>> mutex held.
>>
>> The GED device uses a dedicated MMIO region that will be mapped
>> by the machine code.
>>
>> At this point the GED still does not support PCI device hotplug in
>> its TYPE_HOTPLUG_HANDLER implementation. This will come in a
>> subsequent patch
>
> nit: period missing ^
>
>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> ---
>>   include/hw/acpi/generic_event_device.h |  5 +++++
>>   include/hw/acpi/pcihp.h                |  2 ++
>>   hw/acpi/generic_event_device.c         | 14 ++++++++++++++
>>   3 files changed, 21 insertions(+)
>>
>> diff --git a/include/hw/acpi/generic_event_device.h
>> b/include/hw/acpi/generic_event_device.h
>> index d2dac87b4a..28be6c0582 100644
>> --- a/include/hw/acpi/generic_event_device.h
>> +++ b/include/hw/acpi/generic_event_device.h
>> @@ -63,6 +63,7 @@
>>   #include "hw/acpi/memory_hotplug.h"
>>   #include "hw/acpi/ghes.h"
>>   #include "hw/acpi/cpu.h"
>> +#include "hw/acpi/pcihp.h"
>>   #include "qom/object.h"
>>     #define ACPI_POWER_BUTTON_DEVICE "PWRB"
>> @@ -101,6 +102,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(AcpiGedState, ACPI_GED)
>>   #define ACPI_GED_PWR_DOWN_EVT      0x2
>>   #define ACPI_GED_NVDIMM_HOTPLUG_EVT 0x4
>>   #define ACPI_GED_CPU_HOTPLUG_EVT    0x8
>> +#define ACPI_GED_PCI_HOTPLUG_EVT    0x10
>>     typedef struct GEDState {
>>       MemoryRegion evt;
>> @@ -114,6 +116,9 @@ struct AcpiGedState {
>>       MemoryRegion container_memhp;
>>       CPUHotplugState cpuhp_state;
>>       MemoryRegion container_cpuhp;
>> +    AcpiPciHpState pcihp_state;
>> +    MemoryRegion container_pcihp;
>> +
>>       GEDState ged_state;
>>       uint32_t ged_event_bitmap;
>>       qemu_irq irq;
>> diff --git a/include/hw/acpi/pcihp.h b/include/hw/acpi/pcihp.h
>> index 451ef74284..abb6e14549 100644
>> --- a/include/hw/acpi/pcihp.h
>> +++ b/include/hw/acpi/pcihp.h
>> @@ -38,6 +38,8 @@
>>   #define ACPI_PCIHP_SEJ_BASE 0x8
>>   #define ACPI_PCIHP_BNMR_BASE 0x10
>>   +#define ACPI_PCI_HOTPLUG_REG_LEN 0x14
>
> This is wrong, no? It should be 0x18, i.e. 24 bytes or 6 registers of
> 4 bytes.
yes this is wrong. you are totally right. I am about to send a new
version where this is fixed, sorry. I noticed that when testing the acpi
index modality which did not work with the RFC series.

Now I am using ACPI_PCIHP_SIZE.

Cheers

Eric
>
> I think it's better to move the defines in pcihp.c into pcihp.h and
> use them to define ACPI_PCI_HOTPLUG_REG_LEN so the values are
> consistent, like:
>
> diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> index 82b8ea2811..3ab8b9de94 100644
> --- a/hw/acpi/pcihp.c
> +++ b/hw/acpi/pcihp.c
> @@ -44,14 +44,6 @@
>  #include "qobject/qnum.h"
>  #include "trace.h"
>  
> -#define ACPI_PCIHP_SIZE 0x0018
> -#define PCI_UP_BASE 0x0000
> -#define PCI_DOWN_BASE 0x0004
> -#define PCI_EJ_BASE 0x0008
> -#define PCI_RMV_BASE 0x000c
> -#define PCI_SEL_BASE 0x0010
> -#define PCI_AIDX_BASE 0x0014
> -
>  typedef struct AcpiPciHpFind {
>      int bsel;
>      PCIBus *bus;
> diff --git a/include/hw/acpi/pcihp.h b/include/hw/acpi/pcihp.h
> index abb6e14549..6b79adcaef 100644
> --- a/include/hw/acpi/pcihp.h
> +++ b/include/hw/acpi/pcihp.h
> @@ -38,7 +38,15 @@
>  #define ACPI_PCIHP_SEJ_BASE 0x8
>  #define ACPI_PCIHP_BNMR_BASE 0x10
>  
> -#define ACPI_PCI_HOTPLUG_REG_LEN 0x14
> +#define ACPI_PCIHP_SIZE 0x0018
> +#define PCI_UP_BASE 0x0000
> +#define PCI_DOWN_BASE 0x0004
> +#define PCI_EJ_BASE 0x0008
> +#define PCI_RMV_BASE 0x000c
> +#define PCI_SEL_BASE 0x0010
> +#define PCI_AIDX_BASE 0x0014
> +
> +#define ACPI_PCI_HOTPLUG_REG_LEN ACPI_PCIHP_SIZE
>  
>  typedef struct AcpiPciHpPciStatus {
>      uint32_t up;
>
>
> or even use only one of them (ACPI_PCI_HOTPLUG_REG_LEN,
> ACPI_PCIHP_SIZE, or
> another new name that would fit better in both contexts).
>
>
> Cheers,
> Gustavo
>
>> +
>>   typedef struct AcpiPciHpPciStatus {
>>       uint32_t up;
>>       uint32_t down;
>> diff --git a/hw/acpi/generic_event_device.c
>> b/hw/acpi/generic_event_device.c
>> index 7b2d582fff..0fd8baba97 100644
>> --- a/hw/acpi/generic_event_device.c
>> +++ b/hw/acpi/generic_event_device.c
>> @@ -26,6 +26,7 @@ static const uint32_t ged_supported_events[] = {
>>       ACPI_GED_PWR_DOWN_EVT,
>>       ACPI_GED_NVDIMM_HOTPLUG_EVT,
>>       ACPI_GED_CPU_HOTPLUG_EVT,
>> +    ACPI_GED_PCI_HOTPLUG_EVT,
>>   };
>>     /*
>> @@ -121,6 +122,12 @@ void build_ged_aml(Aml *table, const char *name,
>> HotplugHandler *hotplug_dev,
>>                              aml_notify(aml_name("\\_SB.NVDR"),
>>                                         aml_int(0x80)));
>>                   break;
>> +            case ACPI_GED_PCI_HOTPLUG_EVT:
>> +                aml_append(if_ctx,
>> +                           aml_acquire(aml_name("\\_SB.PCI0.BLCK"),
>> 0xFFFF));
>> +                aml_append(if_ctx, aml_call0("\\_SB.PCI0.PCNT"));
>> +                aml_append(if_ctx,
>> aml_release(aml_name("\\_SB.PCI0.BLCK")));
>> +                break;
>>               default:
>>                   /*
>>                    * Please make sure all the events in
>> ged_supported_events[]
>> @@ -299,6 +306,8 @@ static void acpi_ged_send_event(AcpiDeviceIf
>> *adev, AcpiEventStatusBits ev)
>>           sel = ACPI_GED_NVDIMM_HOTPLUG_EVT;
>>       } else if (ev & ACPI_CPU_HOTPLUG_STATUS) {
>>           sel = ACPI_GED_CPU_HOTPLUG_EVT;
>> +    } else if (ev & ACPI_PCI_HOTPLUG_STATUS) {
>> +        sel = ACPI_GED_PCI_HOTPLUG_EVT;
>>       } else {
>>           /* Unknown event. Return without generating interrupt. */
>>           warn_report("GED: Unsupported event %d. No irq injected", ev);
>> @@ -428,6 +437,11 @@ static void acpi_ged_realize(DeviceState *dev,
>> Error **errp)
>>               cpu_hotplug_hw_init(&s->container_cpuhp, OBJECT(dev),
>>                                   &s->cpuhp_state, 0);
>>               break;
>> +        case ACPI_GED_PCI_HOTPLUG_EVT:
>> +            memory_region_init(&s->container_pcihp, OBJECT(dev),
>> +                                "pcihp container",
>> +                                ACPI_PCI_HOTPLUG_REG_LEN);
>> +            sysbus_init_mmio(sbd, &s->container_pcihp);
>>           }
>>           ged_events--;
>>       }
>

