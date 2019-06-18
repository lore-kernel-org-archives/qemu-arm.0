Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3682143wrg;
        Tue, 18 Jun 2019 05:44:28 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwKcVp8dmYWvebN9WjzrE81aBnEmKdvfIg4E4lRmZW3gL6BSq9J+9ZXr1QE0fCxCjxgUYxR
X-Received: by 2002:a17:906:4694:: with SMTP id a20mr87073693ejr.67.1560861868765;
        Tue, 18 Jun 2019 05:44:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560861868; cv=none;
        d=google.com; s=arc-20160816;
        b=Eq8GCDKzucvUqtKekjtzaPczbvx5dbRDYwNawzJJePxe9o/NYF/LfUhknSqDPrqdSm
         WL3GJBbjQlKNyoczT54bWeIuRG1xm2C1rdas2WdU3Ssu2QHfeqejFDWO7hZyKVC5bmdG
         liV6iYBvhWPovSgTV2dkSLbgujAkYv/bHsNANE+orgQhE0Y8TzliaixteIaCs32DKS+F
         NUDO7Uqemj92IYDlM2FtwHgjLtvpuAWDQc+R6/RT3G1DExrWaQEcutnBZiKgYCpdlYMi
         y+DRNR92KzT5nFxtxkK2IAjKcUIoMa6HrF/uwF35JRxwrBZx8+/g9htb9MNqHNGVirj4
         cu0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=YdPKhNpZGiyQAKlqGnXC+59jkwyofcZww5wM3TZIi2c=;
        b=QPClUg/VwCerxksfjMgzyQHWlCiNvwUzYiT3AOiAnEAlpKYItZ8iixQsafBjOhXASg
         ae71E4MI24h7+qiW67LKgfOLNHotfAgFUuvAsa6imhT64LzHN08Vm22gzi7VfwuvRaj1
         wZVfvvIni9o2LlEkdv8BroglHhfVYKJ1lg9QKwQ1xR7kTTarlipA4yX2Eeo7pvjahtD0
         lKUibrS8UGEK6buITLU4RH/JhHkASxZYK8ZzjUkLp7lFAUsdttiI73KdmhMpHzVRvNjZ
         eutV4+YHP7IoT3nAIMaYzs4heXN28U+5brgKyt8118/e80pfakTEW/OGySiu7OxBWr6x
         rnnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t24si8938929ejo.92.2019.06.18.05.44.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Jun 2019 05:44:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56740 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hdDTP-0005zI-Si
	for alex.bennee@linaro.org; Tue, 18 Jun 2019 08:44:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34899)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <eric.auger@redhat.com>) id 1hdDSn-0005xD-DF
 for qemu-arm@nongnu.org; Tue, 18 Jun 2019 08:43:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1hdDSk-0005vn-Ft
 for qemu-arm@nongnu.org; Tue, 18 Jun 2019 08:43:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:32804)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1hdDSk-0005tV-1T; Tue, 18 Jun 2019 08:43:46 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3E790811D8;
 Tue, 18 Jun 2019 12:43:45 +0000 (UTC)
Received: from [10.36.117.84] (ovpn-117-84.ams2.redhat.com [10.36.117.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A54A357AF;
 Tue, 18 Jun 2019 12:43:42 +0000 (UTC)
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, imammedo@redhat.com
References: <20190522162252.28568-1-shameerali.kolothum.thodi@huawei.com>
 <20190522162252.28568-8-shameerali.kolothum.thodi@huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <6bbdbb6a-1b93-7dd6-b73a-74df7321f281@redhat.com>
Date: Tue, 18 Jun 2019 14:43:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190522162252.28568-8-shameerali.kolothum.thodi@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Tue, 18 Jun 2019 12:43:45 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v5 7/8] hw/acpi: Add system power down
 support to GED
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, sameo@linux.intel.com, ard.biesheuvel@linaro.org,
 linuxarm@huawei.com, xuwei5@hisilicon.com, shannon.zhaosl@gmail.com,
 sebastien.boeuf@intel.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KriuF/0jq+CD

Hi Shameer,

On 5/22/19 6:22 PM, Shameer Kolothum wrote:
> This adds support to use GED for system power down event.
> 
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric

> ---
>  hw/acpi/generic_event_device.c         | 16 ++++++++++++++++
>  include/hw/acpi/generic_event_device.h |  4 ++++
>  2 files changed, 20 insertions(+)
> 
> diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
> index 914fe64716..27c1bb40d4 100644
> --- a/hw/acpi/generic_event_device.c
> +++ b/hw/acpi/generic_event_device.c
> @@ -20,6 +20,7 @@
>  
>  static const uint32_t ged_supported_events[] = {
>      ACPI_GED_MEM_HOTPLUG_EVT,
> +    ACPI_GED_PWR_DOWN_EVT,
>  };
>  
>  /*
> @@ -104,6 +105,11 @@ void build_ged_aml(Aml *table, const char *name, HotplugHandler *hotplug_dev,
>                  aml_append(if_ctx, aml_call0(MEMORY_DEVICES_CONTAINER "."
>                                               MEMORY_SLOT_SCAN_METHOD));
>                  break;
> +            case ACPI_GED_PWR_DOWN_EVT:
> +                aml_append(if_ctx,
> +                           aml_notify(aml_name(ACPI_POWER_BUTTON_DEVICE),
> +                                      aml_int(0x80)));
> +                break;
>              default:
>                  /*
>                   * Please make sure all the events in ged_supported_events[]
> @@ -228,6 +234,13 @@ static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
>      acpi_ged_event(s, sel);
>  }
>  
> +static void acpi_ged_pm_powerdown_req(Notifier *n, void *opaque)
> +{
> +    AcpiGedState *s = container_of(n, AcpiGedState, powerdown_notifier);
> +
> +    acpi_ged_event(s, ACPI_GED_PWR_DOWN_EVT);
> +}
> +
>  static void acpi_ged_device_realize(DeviceState *dev, Error **errp)
>  {
>      AcpiGedState *s = ACPI_GED(dev);
> @@ -239,6 +252,9 @@ static void acpi_ged_device_realize(DeviceState *dev, Error **errp)
>      }
>  
>      acpi_ged_init(get_system_memory(), dev, &s->ged_state);
> +
> +    s->powerdown_notifier.notify = acpi_ged_pm_powerdown_req;
> +    qemu_register_powerdown_notifier(&s->powerdown_notifier);
>  }
>  
>  static Property acpi_ged_properties[] = {
> diff --git a/include/hw/acpi/generic_event_device.h b/include/hw/acpi/generic_event_device.h
> index f69d084c89..9e63b72cb9 100644
> --- a/include/hw/acpi/generic_event_device.h
> +++ b/include/hw/acpi/generic_event_device.h
> @@ -61,6 +61,8 @@
>  
>  #include "hw/acpi/memory_hotplug.h"
>  
> +#define ACPI_POWER_BUTTON_DEVICE "PWRB"
> +
>  #define TYPE_ACPI_GED "acpi-ged"
>  #define ACPI_GED(obj) \
>      OBJECT_CHECK(AcpiGedState, (obj), TYPE_ACPI_GED)
> @@ -79,6 +81,7 @@
>   * through GED.
>   */
>  #define ACPI_GED_MEM_HOTPLUG_EVT   0x1
> +#define ACPI_GED_PWR_DOWN_EVT      0x2
>  
>  typedef struct GEDState {
>      MemoryRegion io;
> @@ -88,6 +91,7 @@ typedef struct GEDState {
>  
>  typedef struct AcpiGedState {
>      DeviceClass parent_obj;
> +    Notifier powerdown_notifier;
>      MemHotplugState memhp_state;
>      hwaddr memhp_base;
>      hwaddr ged_base;
> 
