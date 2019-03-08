Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp8546940wrx;
        Fri, 8 Mar 2019 08:09:41 -0800 (PST)
X-Google-Smtp-Source: APXvYqxxl9I2r8jK5BP5ozFuVrfQrTe23JVlKgANErQnrTlXGrwNtqR5fycUhEzfjck2vCkzPcwB
X-Received: by 2002:a81:1d58:: with SMTP id d85mr15280118ywd.286.1552061381335;
        Fri, 08 Mar 2019 08:09:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1552061381; cv=none;
        d=google.com; s=arc-20160816;
        b=x7pwr5iPWxf8OuDy94H8P4ZGBouitEy3m+Uf51tzkauIOsm28w6zPEfJH052nPOrVk
         unuTWuxi4nBFRnRWQQXKYDsTBGaD2Ng4WogODiIlQ4AOnuFgluTzIE9/WY+/aJKbBx27
         HO65ARZS5qXJpeD9KbvIz40BUL+8QJo3ECEr9ThzdltJv175lKT0oB+F5+pEb6J6aAvy
         URBHypMNWHudQdm5wbetY8wbszF4aoxt0XUuX1Ri92b7HXp+gqmrJYhqxbIKairYahIN
         mmABNacAyFFXov+khYFa1Qajm/EbAYqJifM3vcBmvuhL6estBE3IrbJ6VEnapaNSAKTo
         C/TA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=g/2K2feYYuOETQ0Y8h7U7aglU52yrHKIn1LihkDAQFs=;
        b=nZAhi3Ai/QGPt20SAGD5sOgqVXylBGHbQpKwfVnjHTWwYLgLMU2FTFddN2yJpBQJu5
         Ke7Bq9cIq5/drjVGzQGgOFAyBjFEpgGZXYmWMu1ztvTUHh86CA2OaUJMPXKMLbIasDls
         mDjyQYB1ZIccaKcOhGTKEKfd1ImUL4/cQTUFLmZ12nc7MqZaMoYdl8JO7WJQHn0iOkw8
         au1p1riFiClsHVPJFiqC/4gXDnJgj0cTzxUZOg9Xz+997q0/V6MZp3BCsOVLCD2g0b7s
         rzHslzUl/4vdMz4q0AvnPRr++OatFzh49JE5p2MGyzW/utNJDPLBNPw8sl2xd3R8inVV
         9qpg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d15si4623561ywa.49.2019.03.08.08.09.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Mar 2019 08:09:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:46179 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h2I44-0006vW-Qn
	for alex.bennee@linaro.org; Fri, 08 Mar 2019 11:09:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49393)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1h2I3w-0006vN-Gq
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 11:09:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1h2I3v-0000FY-If
	for qemu-arm@nongnu.org; Fri, 08 Mar 2019 11:09:32 -0500
Received: from mx1.redhat.com ([209.132.183.28]:54598)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1h2I3u-0000Dw-45; Fri, 08 Mar 2019 11:09:30 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 55E2E318A61F;
	Fri,  8 Mar 2019 16:09:28 +0000 (UTC)
Received: from [10.36.116.102] (ovpn-116-102.ams2.redhat.com [10.36.116.102])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D02595D9C5;
	Fri,  8 Mar 2019 16:09:23 +0000 (UTC)
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, imammedo@redhat.com,
	peter.maydell@linaro.org, shannon.zhaosl@gmail.com, sameo@linux.intel.com, 
	sebastien.boeuf@intel.com
References: <20190308114218.26692-1-shameerali.kolothum.thodi@huawei.com>
	<20190308114218.26692-2-shameerali.kolothum.thodi@huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <7490ad1c-d4a6-ad5b-ebbf-c27a674d9629@redhat.com>
Date: Fri, 8 Mar 2019 17:09:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190308114218.26692-2-shameerali.kolothum.thodi@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Fri, 08 Mar 2019 16:09:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 01/11] hw/acpi: Move constant definitions
 to header files
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
Cc: linuxarm@huawei.com, xuwei5@hisilicon.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vZiZfl0vc7Xj

Hi,

On 3/8/19 12:42 PM, Shameer Kolothum wrote:
> From: Sebastien Boeuf <sebastien.boeuf@intel.com>
> 
> By moving the definition of memory hotplug related constants used
> by ACPI for both CPU and memory, this commits allows those to be
> used from  other parts of the code.

Maybe elaborate on where you intend to use them.

> 
> Signed-off-by: Sebastien Boeuf <sebastien.boeuf@intel.com>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
>  hw/acpi/memory_hotplug.c         | 26 --------------------------
>  include/hw/acpi/memory_hotplug.h | 26 ++++++++++++++++++++++++++
>  2 files changed, 26 insertions(+), 26 deletions(-)
> 
> diff --git a/hw/acpi/memory_hotplug.c b/hw/acpi/memory_hotplug.c
> index 921cad2..a6beb10 100644
> --- a/hw/acpi/memory_hotplug.c
> +++ b/hw/acpi/memory_hotplug.c
> @@ -8,32 +8,6 @@
>  #include "qapi/error.h"
>  #include "qapi/qapi-events-misc.h"
>  
> -#define MEMORY_SLOTS_NUMBER          "MDNR"
> -#define MEMORY_HOTPLUG_IO_REGION     "HPMR"
> -#define MEMORY_SLOT_ADDR_LOW         "MRBL"
> -#define MEMORY_SLOT_ADDR_HIGH        "MRBH"
> -#define MEMORY_SLOT_SIZE_LOW         "MRLL"
> -#define MEMORY_SLOT_SIZE_HIGH        "MRLH"
> -#define MEMORY_SLOT_PROXIMITY        "MPX"
> -#define MEMORY_SLOT_ENABLED          "MES"
> -#define MEMORY_SLOT_INSERT_EVENT     "MINS"
> -#define MEMORY_SLOT_REMOVE_EVENT     "MRMV"
> -#define MEMORY_SLOT_EJECT            "MEJ"
> -#define MEMORY_SLOT_SLECTOR          "MSEL"
> -#define MEMORY_SLOT_OST_EVENT        "MOEV"
> -#define MEMORY_SLOT_OST_STATUS       "MOSC"
> -#define MEMORY_SLOT_LOCK             "MLCK"
> -#define MEMORY_SLOT_STATUS_METHOD    "MRST"
> -#define MEMORY_SLOT_CRS_METHOD       "MCRS"
> -#define MEMORY_SLOT_OST_METHOD       "MOST"
> -#define MEMORY_SLOT_PROXIMITY_METHOD "MPXM"
> -#define MEMORY_SLOT_EJECT_METHOD     "MEJ0"
> -#define MEMORY_SLOT_NOTIFY_METHOD    "MTFY"
> -#define MEMORY_SLOT_SCAN_METHOD      "MSCN"
> -#define MEMORY_HOTPLUG_DEVICE        "MHPD"
> -#define MEMORY_HOTPLUG_IO_LEN         24
> -#define MEMORY_DEVICES_CONTAINER     "\\_SB.MHPC"

Do we really need to expose all of them. I just can see
MEMORY_SLOT_SCAN_METHOD used in hw/acpi/ged.c? Maybe I missed some though?

Also at the beginning I tried to find some specification details for
those stuff but I failed. It would be helpful for a non specialist
reader to add a comment that helps to understand what is part of a
specification (link?) and what is arbitrarily defined.

Thanks

Eric
> -
>  static uint16_t memhp_io_base;
>  
>  static ACPIOSTInfo *acpi_memory_device_status(int slot, MemStatus *mdev)
> diff --git a/include/hw/acpi/memory_hotplug.h b/include/hw/acpi/memory_hotplug.h
> index 77c6576..fbfcbe6 100644
> --- a/include/hw/acpi/memory_hotplug.h
> +++ b/include/hw/acpi/memory_hotplug.h
> @@ -5,6 +5,32 @@
>  #include "hw/acpi/acpi.h"
>  #include "hw/acpi/aml-build.h"
>  
> +#define MEMORY_SLOTS_NUMBER          "MDNR"
> +#define MEMORY_HOTPLUG_IO_REGION     "HPMR"
> +#define MEMORY_SLOT_ADDR_LOW         "MRBL"
> +#define MEMORY_SLOT_ADDR_HIGH        "MRBH"
> +#define MEMORY_SLOT_SIZE_LOW         "MRLL"
> +#define MEMORY_SLOT_SIZE_HIGH        "MRLH"
> +#define MEMORY_SLOT_PROXIMITY        "MPX"
> +#define MEMORY_SLOT_ENABLED          "MES"
> +#define MEMORY_SLOT_INSERT_EVENT     "MINS"
> +#define MEMORY_SLOT_REMOVE_EVENT     "MRMV"
> +#define MEMORY_SLOT_EJECT            "MEJ"
> +#define MEMORY_SLOT_SLECTOR          "MSEL"
> +#define MEMORY_SLOT_OST_EVENT        "MOEV"
> +#define MEMORY_SLOT_OST_STATUS       "MOSC"
> +#define MEMORY_SLOT_LOCK             "MLCK"
> +#define MEMORY_SLOT_STATUS_METHOD    "MRST"
> +#define MEMORY_SLOT_CRS_METHOD       "MCRS"
> +#define MEMORY_SLOT_OST_METHOD       "MOST"
> +#define MEMORY_SLOT_PROXIMITY_METHOD "MPXM"
> +#define MEMORY_SLOT_EJECT_METHOD     "MEJ0"
> +#define MEMORY_SLOT_NOTIFY_METHOD    "MTFY"
> +#define MEMORY_SLOT_SCAN_METHOD      "MSCN"
> +#define MEMORY_HOTPLUG_DEVICE        "MHPD"
> +#define MEMORY_HOTPLUG_IO_LEN         24
> +#define MEMORY_DEVICES_CONTAINER     "\\_SB.MHPC"
> +
>  /**
>   * MemStatus:
>   * @is_removing: the memory device in slot has been requested to be ejected.
> 
