Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp2249114wrv;
        Thu, 18 Jul 2019 06:07:29 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwSam3XHOXWOopQLs8/omcn9x9RdzMv7Q3Pz0R8ARRwzysiJuVex8XITkFW4Qx2zz00gRiy
X-Received: by 2002:a17:906:6582:: with SMTP id x2mr13722053ejn.2.1563455249043;
        Thu, 18 Jul 2019 06:07:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563455249; cv=none;
        d=google.com; s=arc-20160816;
        b=gOtuEk5wmZJZagAvl8P61snMQcdmrBVM86sp/1DFG5EO+t47yEPh10j/EnQ7uRqWEy
         DHb0gQinbxXf/lFPIzjn58ZBqx2TqgITAg3xCXGqGt0TUoE2sXK/04JoU9tHE/AXB2Px
         QgaA5g/Jalpq6Llj7i9l+/2eEDyPukETvCLE1TtNGWxr59eP0q0CEyykjlO0FAexcdrQ
         lhJ5QFPSgF7t1/ERo3N+Y1JHX67o4KzfvntBqdM2XI8DVEudtjdk6YrMbiu5eQLm4EDZ
         KFHdOV9w1t5kNvs8J12PDV4hLXFAsk8wRRnfQnrQDEEJsgUaSGdISBOh19UAaUY4cJDJ
         sfwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=7COdLhwu1ux9GlGIghEf4KOrlca+eYnbqHzPvijg4RQ=;
        b=r5aeyYJi+Jm2rr9b5hTqwRrCOVZ/4bI1iL00PIN8dTVr1kWWVP8TKhYtW6mpfn9MsL
         ImXhhUkeYEHJwckALPKztK1O0gAaoASxDJ9pDIGyPHCOry4rWgH9HOZFMtdh6Kg7LTHu
         I1Ulmq0Qi9cu2TXYkyeJ84K5x0V6VegCYZpq3HLZ4RmCUXygSeISIhhGoFBmJiVCvekX
         QFHoNxVpaPEP++pGAfII9KtBWOYkYVDgNagPlDNf/LiuXebKBb4PddW91Ws684RQM08h
         YFcvuG/XlJ9spKO4cZ9stEyv5qvwx1nbpulRp92SynDyYidEcSIbLfBF1W+2xeTGflFV
         OAlg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h19si447764ede.279.2019.07.18.06.07.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Jul 2019 06:07:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ho687-0001Ed-OA
	for alex.bennee@linaro.org; Thu, 18 Jul 2019 09:07:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55107)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <imammedo@redhat.com>) id 1ho683-0001EB-EP
 for qemu-arm@nongnu.org; Thu, 18 Jul 2019 09:07:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1ho682-0003bZ-Eu
 for qemu-arm@nongnu.org; Thu, 18 Jul 2019 09:07:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33422)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>)
 id 1ho682-0003b0-9L; Thu, 18 Jul 2019 09:07:22 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id EBDB330BD1B1;
 Thu, 18 Jul 2019 13:07:20 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 323DB1001B02;
 Thu, 18 Jul 2019 13:07:15 +0000 (UTC)
Date: Thu, 18 Jul 2019 15:07:14 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Message-ID: <20190718150714.691f91f9@redhat.com>
In-Reply-To: <20190716153816.17676-9-shameerali.kolothum.thodi@huawei.com>
References: <20190716153816.17676-1-shameerali.kolothum.thodi@huawei.com>
 <20190716153816.17676-9-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Thu, 18 Jul 2019 13:07:21 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH-for-4.2 v7 08/10] hw/acpi: Add system power
 down support to GED
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
Cc: peter.maydell@linaro.org, sameo@linux.intel.com, shannon.zhaosl@gmail.com,
 ard.biesheuvel@linaro.org, qemu-devel@nongnu.org, xuwei5@hisilicon.com,
 linuxarm@huawei.com, eric.auger@redhat.com, qemu-arm@nongnu.org,
 sebastien.boeuf@intel.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: G+rx8DJ2c/KC

On Tue, 16 Jul 2019 16:38:14 +0100
Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:

> This adds support to use GED for system power down event.
[...]

> @@ -232,6 +238,13 @@ static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
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
> @@ -243,6 +256,9 @@ static void acpi_ged_device_realize(DeviceState *dev, Error **errp)
>      }
>  
>      acpi_ged_init(get_system_memory(), dev, &s->ged_state);
> +
> +    s->powerdown_notifier.notify = acpi_ged_pm_powerdown_req;

one more thing:
I'd reuse virt_powerdown_req() instead.

pass it machine pointer and then from notifier you'd be able to get to acpi_dev

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

