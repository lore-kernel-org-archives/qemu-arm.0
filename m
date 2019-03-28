Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp680367wrx;
        Thu, 28 Mar 2019 07:15:30 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzI4oVcS9t7dBrDpr7BFtGlpehkJDY/U6LorMPr/NVS6Lm1A50tAVK1cH6CMvoTCAzdUUyP
X-Received: by 2002:a24:254c:: with SMTP id g73mr171348itg.77.1553782530584;
        Thu, 28 Mar 2019 07:15:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553782530; cv=none;
        d=google.com; s=arc-20160816;
        b=m6Kbl98IOnvbaXWBc9FU/Ezj4ZvRipu4nEY/gaY9Sxy4NGwTWbTbgf0bQN3Hn88jE1
         wxPqYX8PHf9yFjnIo+uwOO0heT+6ydzT1VCDN3SKHFdQq6GvCgEQL00NIDoUZQwUk9Ow
         yUGy9iG8xMlCzrNOH6VwMJbSlv8WNnKiZ24CWK/jO2Pz8UJY7gagslU2ChlVvIz6qn0Q
         toDhnd/9yv1ACpTx9W1wcEIpxgrxYPoDf6ZQYfjjLMgRjuhh9EA31aYrQDkd+mPhZz7c
         snWHftIR8zGi9Xvo7Yyk4rFhQ1AtNw1bQ2oNuN5RM/YvFgDjIu2kprB4nlekWK7W+gzZ
         dmCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from;
        bh=dNjCjQcmxpjCncl3j3JhUz3JgIe4gg33Xzx03VVGgQQ=;
        b=XTPQnOywJSr8rYOO3s5p/AeXETVnIv/lS/3ouu0APiP5MOCI3Jf/227yJcf8X1aVpN
         F7nnl/9PXo85xv3ncfLna+OyVY/D7uJqLXBIkR95L8VZHkEQ9h5Izt0RpDSVtdP+6qq5
         /qNTV+ANbwUaPYTAEEA6ddAz/J0KTFyHXxc/XgTOZMPBglny5ka08g4uuIO/oJB/dppz
         Y6g7rCb7DQ5FmBrds+vIrwFynkOli7wZ2oxEJIopcqj7qxaWPoOoTKT4qniwEMqspSim
         YfGdKJH9ouAE+etcLdcH/DamQjtWvj7qA69kZ7AzdTXO6oUWm7aKLRDk3PaqcObIX7xi
         zndQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t2si1840320jai.35.2019.03.28.07.15.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 28 Mar 2019 07:15:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:37260 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h9VoX-0000Wo-Sd
	for alex.bennee@linaro.org; Thu, 28 Mar 2019 10:15:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55522)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1h9VoE-0000TV-Jm
	for qemu-arm@nongnu.org; Thu, 28 Mar 2019 10:15:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1h9VoC-0005ri-0P
	for qemu-arm@nongnu.org; Thu, 28 Mar 2019 10:15:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57778)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1h9VoB-0005rY-IT; Thu, 28 Mar 2019 10:15:07 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 44D4C307E06B;
	Thu, 28 Mar 2019 14:14:57 +0000 (UTC)
Received: from [10.36.117.163] (ovpn-117-163.ams2.redhat.com [10.36.117.163])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E624437F;
	Thu, 28 Mar 2019 14:14:51 +0000 (UTC)
From: Auger Eric <eric.auger@redhat.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, imammedo@redhat.com,
	peter.maydell@linaro.org, shannon.zhaosl@gmail.com, sameo@linux.intel.com, 
	sebastien.boeuf@intel.com
References: <20190321104745.28068-1-shameerali.kolothum.thodi@huawei.com>
	<20190321104745.28068-3-shameerali.kolothum.thodi@huawei.com>
Message-ID: <f05226b7-bddf-580a-ca08-81cf71770ac2@redhat.com>
Date: Thu, 28 Mar 2019 15:14:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190321104745.28068-3-shameerali.kolothum.thodi@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.42]);
	Thu, 28 Mar 2019 14:15:01 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v3 02/10] hw/acpi: Do not create memory
 hotplug method when handler is not defined
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
X-TUID: cqyHUTu0E9qL

Hi Shameer,
On 3/21/19 11:47 AM, Shameer Kolothum wrote:
> From: Samuel Ortiz <sameo@linux.intel.com>
> 
> With Hardware-reduced ACPI, the GED device will manage ACPI
s/Hardware-reduced/hardware-reduced
> hotplug entirely. As a consequence, make the memory specific
> events AML generation optional The code will only be added
> when the method name is not NULL.
> 
> Signed-off-by: Samuel Ortiz <sameo@linux.intel.com>
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
> ---
>  hw/acpi/memory_hotplug.c | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/acpi/memory_hotplug.c b/hw/acpi/memory_hotplug.c
> index 80e25f0..98407e3 100644
> --- a/hw/acpi/memory_hotplug.c
> +++ b/hw/acpi/memory_hotplug.c
> @@ -720,10 +720,12 @@ void build_memory_hotplug_aml(Aml *table, uint32_t nr_mem,
>      }
>      aml_append(table, dev_container);
>  
> -    method = aml_method(event_handler_method, 0, AML_NOTSERIALIZED);
> -    aml_append(method,
> -        aml_call0(MEMORY_DEVICES_CONTAINER "." MEMORY_SLOT_SCAN_METHOD));
> -    aml_append(table, method);
> +    if (event_handler_method) {
> +        method = aml_method(event_handler_method, 0, AML_NOTSERIALIZED);
> +        aml_append(method,
> +                   aml_call0(MEMORY_DEVICES_CONTAINER "." MEMORY_SLOT_SCAN_METHOD));
> +        aml_append(table, method);
> +    }
>  
>      g_free(mhp_res_path);
>  }
> 
