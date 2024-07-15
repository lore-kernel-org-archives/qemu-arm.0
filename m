Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp2230220nji;
        Mon, 15 Jul 2024 05:55:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXAURbxrNA17Lip4E6pTIo25ecrusNe3YQnfdBJVqQt9sh0ath+hyNNRbSSRV+9bFbtlmwwO0IvkWZn2K5xNxnQZk9qHjjE
X-Google-Smtp-Source: AGHT+IGsZ4RcJWAyjIQG2raj6q/J0rZ3NEV+KyGR5fCL814rbTo0tW4Zs55Y6pkKvuj60irhFLHZ
X-Received: by 2002:a05:622a:13d1:b0:447:e863:cc15 with SMTP id d75a77b69052e-447faaa495emr254280001cf.62.1721048140602;
        Mon, 15 Jul 2024 05:55:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721048140; cv=none;
        d=google.com; s=arc-20160816;
        b=Z8ivMgr7ZcyTS5L0uQrkIMjkK49ZVwaGC8uZLzzQH0yj82zVBnDuL7JsdlkNLH8RxC
         sq6SBXx2ylSNia0DXzroMvMk8f8aNjE+/4PtesTJRkC/AucDSr6X3B8RDIr+kGiLQxJq
         uI0RMbkZsaRxa2lKnpHLdMqlytX8k8I8VO1piinsYXvlUQAMt7TSNWJt9/+JSIj2XsMm
         v32xbX9GWymgsqZ/p6D4Qu7U4YvztqAWU2KEhGDQoguElv8rHdwzY4/SOzfJGRKLtuXp
         6eSj1XYdGoeh9Mr8Lxq/iGpG99RUUXHy36FbxSVaZTXMzn/McjE6wbnng6TZtKoBLxZk
         78/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=iXhi9NpfTXWHgY2dNzLAaqkM6ZDMZMLVgAna//bNgsM=;
        fh=vrBz3HmYYFYlsdpIYxT4b7uciFiQTtJWEETdB8YqIQU=;
        b=FTKhvRRWMPuwSTNqJF2uMyyg/bpPs511cCDIm1cdtZeSxt33PUWmk8l58aqwQa6MW/
         UgdCEOCSRrlYRRHVt6XFkWGb+Tqq+31uyANFlnZnW0u267yLHHwzl++RAn9sgnoK4k5I
         KMVXNryw8te1zFN+MYAUfU4WVDtT+YrbPcSI7GoR15DF4UdCig59iKGX1AqCWyG874yL
         YZvDQmxzLyBqZvXCZ9drWog/uxjDADS2HgifkOihrAbcFnNSQ91ZzXEEIsssF9cacuRl
         CJ/IHo56owbOd3SFC0IC8RAp9h7Oq34jO9Ur2L+7wSuP1obgk9TOqqX+90LEe+VKXEPk
         lUmQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bcL5geH5;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-44f5b7f698csi51790981cf.379.2024.07.15.05.55.40
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 05:55:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bcL5geH5;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721048140;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iXhi9NpfTXWHgY2dNzLAaqkM6ZDMZMLVgAna//bNgsM=;
	b=bcL5geH5egfaRohoHdpevmYgxb8OiAYjc1k0yUA2yDnWiv+x4ENEA0vOGVEtRU0Q/W4d4q
	GQ7P/WKEn5YxRDpn3Mq+1Buza9B0AHfH7Ux8e9Kdexjo9SZBuVCg+fKTtllLpCMDJGT+qA
	2De0sMl5g4romLHKxpkGTZzaC8gDo00=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-456-tOlsZ3mgMTaKg7-TEYWREQ-1; Mon, 15 Jul 2024 08:55:38 -0400
X-MC-Unique: tOlsZ3mgMTaKg7-TEYWREQ-1
Received: by mail-lj1-f200.google.com with SMTP id 38308e7fff4ca-2ee91ac534bso43967181fa.1
        for <alex.bennee@linaro.org>; Mon, 15 Jul 2024 05:55:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721048137; x=1721652937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iXhi9NpfTXWHgY2dNzLAaqkM6ZDMZMLVgAna//bNgsM=;
        b=SkdcydOLs9ra75lELUvTBxQeaow+ku7xFnz3Il125frmZd7MUog4MPCe52cSrXtfbz
         s517j2+vcgO5fTiatq+7uSkR56ZJEMQOg4RlxDUcAhWMDyB9RVK4ySSIPIRDgwwajOQS
         OHcwJJiwBwvazpdQrKoM1T02yqUCqlwCASzzE/61mf2Lv0dWk/926EtkuqLeITbmI80F
         b4oAHWJa+7pAlh53wwhKd7AVR80UCy1lonenyk3v4Y8a/2bEjv+Yw6pjLJyL9o5abNuS
         8Lp8k6O6NCTzywOhYwNEV2EwZlYlPd87EOyKAFCrwMvDAsxaVywHBIfsgjO4FXA2GYGa
         xQkA==
X-Forwarded-Encrypted: i=1; AJvYcCVo2RjfWh1Oo9vZPWJb4v2ar62Na4tqBIjzYtZjBTGSKqSk2mOKFZJl4g12PvhGeZX9Zdgm/2uwpFEwejzy1KG93/msISMr
X-Gm-Message-State: AOJu0YwYtsMiYFbwGqV4iFsiywU/UsV5mCHfS/oHtWvAV0nVdCo8PFVO
	5IixCdlBsou3TN/pmNasANdigtA9bxpppegJfCJTa92TPg+DkLTpOs8EzrAIJOMnkFiHPW+FHRL
	hX/xjq4091/gu4cXU5sPsZECZnt6t1w4arHEdhrNxJ3tHaVKBBL7p3A==
X-Received: by 2002:a2e:984b:0:b0:2ec:42db:96a2 with SMTP id 38308e7fff4ca-2eeb30feb61mr121242211fa.29.1721048137442;
        Mon, 15 Jul 2024 05:55:37 -0700 (PDT)
X-Received: by 2002:a2e:984b:0:b0:2ec:42db:96a2 with SMTP id 38308e7fff4ca-2eeb30feb61mr121241981fa.29.1721048136979;
        Mon, 15 Jul 2024 05:55:36 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4279f25a957sm120311775e9.13.2024.07.15.05.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 05:55:36 -0700 (PDT)
Date: Mon, 15 Jul 2024 14:55:35 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Salil Mehta <salil.mehta@huawei.com>
Cc: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <maz@kernel.org>,
 <jean-philippe@linaro.org>, <jonathan.cameron@huawei.com>,
 <lpieralisi@kernel.org>, <peter.maydell@linaro.org>,
 <richard.henderson@linaro.org>, <andrew.jones@linux.dev>,
 <david@redhat.com>, <philmd@linaro.org>, <eric.auger@redhat.com>,
 <oliver.upton@linux.dev>, <pbonzini@redhat.com>, <mst@redhat.com>,
 <will@kernel.org>, <gshan@redhat.com>, <rafael@kernel.org>,
 <alex.bennee@linaro.org>, <linux@armlinux.org.uk>,
 <darren@os.amperecomputing.com>, <ilkka@os.amperecomputing.com>,
 <vishnu@os.amperecomputing.com>, <karl.heubaum@oracle.com>,
 <miguel.luis@oracle.com>, <salil.mehta@opnsrc.net>,
 <zhukeqian1@huawei.com>, <wangxiongfeng2@huawei.com>,
 <wangyanan55@huawei.com>, <jiakernel2@gmail.com>, <maobibo@loongson.cn>,
 <lixianglai@loongson.cn>, <npiggin@gmail.com>, <harshpb@linux.ibm.com>,
 <linuxarm@huawei.com>, Shaoqin Huang <shahuang@redhat.com>, Zhao Liu
 <zhao1.liu@intel.com>
Subject: Re: [PATCH V15 4/7] hw/acpi: Update GED _EVT method AML with CPU
 scan
Message-ID: <20240715145535.0626527e@imammedo.users.ipa.redhat.com>
In-Reply-To: <20240713182516.1457-5-salil.mehta@huawei.com>
References: <20240713182516.1457-1-salil.mehta@huawei.com>
	<20240713182516.1457-5-salil.mehta@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: XWepxaZ+mMPV

On Sat, 13 Jul 2024 19:25:13 +0100
Salil Mehta <salil.mehta@huawei.com> wrote:

> OSPM evaluates _EVT method to map the event. The CPU hotplug event eventually
> results in start of the CPU scan. Scan figures out the CPU and the kind of
> event(plug/unplug) and notifies it back to the guest. Update the GED AML _EVT
> method with the call to method \\_SB.CPUS.CSCN (via \\_SB.GED.CSCN)
> 
> Architecture specific code [1] might initialize its CPUs AML code by calling
> common function build_cpus_aml() like below for ARM:
> 
> build_cpus_aml(scope, ms, opts, xx_madt_cpu_entry, memmap[VIRT_CPUHP_ACPI].base,
>                "\\_SB", "\\_SB.GED.CSCN", AML_SYSTEM_MEMORY);
> 
> [1] https://lore.kernel.org/qemu-devel/20240613233639.202896-13-salil.mehta@huawei.com/
> 
> Co-developed-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
> Tested-by: Xianglai Li <lixianglai@loongson.cn>
> Tested-by: Miguel Luis <miguel.luis@oracle.com>
> Reviewed-by: Shaoqin Huang <shahuang@redhat.com>
> Tested-by: Zhao Liu <zhao1.liu@intel.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/acpi/generic_event_device.c         | 3 +++
>  include/hw/acpi/generic_event_device.h | 1 +
>  2 files changed, 4 insertions(+)
> 
> diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
> index 1b31d633ba..15ffa12cb2 100644
> --- a/hw/acpi/generic_event_device.c
> +++ b/hw/acpi/generic_event_device.c
> @@ -108,6 +108,9 @@ void build_ged_aml(Aml *table, const char *name, HotplugHandler *hotplug_dev,
>                  aml_append(if_ctx, aml_call0(MEMORY_DEVICES_CONTAINER "."
>                                               MEMORY_SLOT_SCAN_METHOD));
>                  break;
> +            case ACPI_GED_CPU_HOTPLUG_EVT:
> +                aml_append(if_ctx, aml_call0(AML_GED_EVT_CPU_SCAN_METHOD));
> +                break;
>              case ACPI_GED_PWR_DOWN_EVT:
>                  aml_append(if_ctx,
>                             aml_notify(aml_name(ACPI_POWER_BUTTON_DEVICE),
> diff --git a/include/hw/acpi/generic_event_device.h b/include/hw/acpi/generic_event_device.h
> index e091ac2108..40af3550b5 100644
> --- a/include/hw/acpi/generic_event_device.h
> +++ b/include/hw/acpi/generic_event_device.h
> @@ -87,6 +87,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(AcpiGedState, ACPI_GED)
>  #define GED_DEVICE      "GED"
>  #define AML_GED_EVT_REG "EREG"
>  #define AML_GED_EVT_SEL "ESEL"
> +#define AML_GED_EVT_CPU_SCAN_METHOD "\\_SB.GED.CSCN"
>  
>  /*
>   * Platforms need to specify the GED event bitmap
