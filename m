Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp1786842njb;
        Sat, 6 Jul 2024 07:28:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVaqzDHHAUtRZbRwVhCI0mOnQniV5Ra1AbYNwi0V05Y5fXonAqp9bK7ASusvGfstM2QSReBOfboNo2xwzMWdRZIYKE8K6sl
X-Google-Smtp-Source: AGHT+IGp9f0nzW6tvvjMp8f18VQFDnm7876G7eF4R7RDd0rMkNFcCmO5hmpCpA9I6+Ogc9AEt4oa
X-Received: by 2002:a25:297:0:b0:dfa:5748:124c with SMTP id 3f1490d57ef6-e03c1930c95mr6695553276.10.1720276133358;
        Sat, 06 Jul 2024 07:28:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720276133; cv=none;
        d=google.com; s=arc-20160816;
        b=QGpRtyZSNPnofeVg9D1d8Qu5jG/1GPiDe4KLVOWcW1EMetwRQt3xe8x9aC5AHf17xc
         Xlb+eTjM8EEGu/6Gb8B0x37zix/ssIbYwVM8k9thXG3+mX70OgB4fAZD7O9kHMM7oWY8
         dMaVKohjyJaksjdDOIeRLwtdu14XKjOfJ1wk6gmSpBy7+KcLX2AR4YIxVMoXA7HJOsKt
         tcIL817sxHBuoT8RCzZLnpzHycEg+PdTTTHdKX1adh3jbjmGu2n2Ac32tkFE+NygT9I+
         gHkfMIMh4xrxI3oQ+Dx3KTN9nLh+hWTAMzDTug4BOl2ZVpwQm0HLUs25joDRk3YIG/Yq
         4ZQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=HPBDjfTjuF+1RRN0i/503tnhkMdhIKx1HHFpJpRnKIM=;
        fh=xwxS5nm6TNSnfJhRkOGFpANeqSzgCg6yVpnxHklzx6o=;
        b=tXoSo6Aa/VMFKvYOfF8CS1PFa6nBn1F5f1LGG1TWw8iMyL80D6n1ZvG/iWTMIwNNtg
         YiGmJgy75EBEo+01u+bs//g/g6hwL+O7pH5l9gY3HZ142oI/2X5GV3LjvNlN+b9/q/vM
         apQZXYP0zyl0Iy4PvcL78esi813ErR3lNnffGTUZD4M6FGRqvpU0I1q7Uw3Tb8i86eWR
         plqRV6+mJ8FP5D2ihr5J+eoUECkIryNBT2Bz+PnptbBMHZXf2MJdbs2JihKXyYupNQkV
         awXp5agVGBZPHX0YuDX/fuSNFrQIPJ0ZuOFdxGW0FCE3HFVT61MAY9oIQibjiciFUWwr
         4qQw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Xmg+Lc0+;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-446514da0f9si188837681cf.695.2024.07.06.07.28.53
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jul 2024 07:28:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Xmg+Lc0+;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720276133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HPBDjfTjuF+1RRN0i/503tnhkMdhIKx1HHFpJpRnKIM=;
	b=Xmg+Lc0+/h8N1GgmaBIGexH/xwHzfbuZrABVbXCS+tOYRs862/fKHPl88d2lyR4Nr4eznT
	h+3P2IqOGMxk9becMc1ULXBn3aSFryccm1AVTqkYwTYVltC8lD2HJu6o4JunArwtZ8egIs
	JQ3mg6ulIeQJqCI0KqyWmHyR+YCaSJI=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-235-M-57tD0EP6iKgAo5vddwTw-1; Sat, 06 Jul 2024 10:28:51 -0400
X-MC-Unique: M-57tD0EP6iKgAo5vddwTw-1
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-52e9cc6a99eso2718172e87.3
        for <alex.bennee@linaro.org>; Sat, 06 Jul 2024 07:28:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720276130; x=1720880930;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HPBDjfTjuF+1RRN0i/503tnhkMdhIKx1HHFpJpRnKIM=;
        b=Rt+kjyz59zSH6wangDblwrwflFXN5nHvXY+Q624PYTmX4/9AyLnkFxXoH/3Swv0l3Z
         PK/rFo4lW181KO+TjfYhHpUK4m+4ITbEbfgClvstUMf4J19mAl/SN8iMZj1ZRvU3G91y
         ne/uJEEyYtKNha+tf6oUDEkPrjtmKcIV603FzSxM5ImeUk+AI2iAa54v4Dj+r8Ng6Nzl
         y81aoL0VZjNoLzwiHfqfjttrsgY8TaJbdSwszAP3FrID/gFFT5JhI5V/JneTXOeS11jw
         fYHWORatukYlk5z5qk1xwmS8A7k/7hnApqiULoTVnsyuacRfU25MYdXZHmZDpeNw36YY
         QhIA==
X-Forwarded-Encrypted: i=1; AJvYcCVExih/YbDzRft3tiUpmeO05dHiig1CeF+TeUhpfSkTdMzKlrHZnUqBokYkJEqYhr9FbNMtun7wgYYgXBb+GXepGU08/OtK
X-Gm-Message-State: AOJu0Yyiy9ljCvHZVtH4//Ohz/7Z7PDzSVdU1eAicJHuRnm0OzEZQWih
	aZQh/TdrScZPjsVoKkl/48TyzpB7Lnyxu9KjCrF0dOzlxr8jqgPJdNPBUrc7TWD2rggx5Dmkk8v
	Gy8WKaoVvaFwN+GRGKQ4iDAh8yLFoIe3pgycKyqMZTUQOUYyUMrMOaA==
X-Received: by 2002:a19:a412:0:b0:52c:dbc2:ea1 with SMTP id 2adb3069b0e04-52ea061f5b7mr4464259e87.6.1720276129921;
        Sat, 06 Jul 2024 07:28:49 -0700 (PDT)
X-Received: by 2002:a19:a412:0:b0:52c:dbc2:ea1 with SMTP id 2adb3069b0e04-52ea061f5b7mr4464228e87.6.1720276129405;
        Sat, 06 Jul 2024 07:28:49 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a283498sm97965215e9.41.2024.07.06.07.28.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jul 2024 07:28:48 -0700 (PDT)
Date: Sat, 6 Jul 2024 16:28:45 +0200
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
Subject: Re: [PATCH V13 4/8] hw/acpi: Update GED _EVT method AML with CPU
 scan
Message-ID: <20240706162845.3baf5568@imammedo.users.ipa.redhat.com>
In-Reply-To: <20240607115649.214622-5-salil.mehta@huawei.com>
References: <20240607115649.214622-1-salil.mehta@huawei.com>
	<20240607115649.214622-5-salil.mehta@huawei.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.42; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: EmOe3vXksX+K

On Fri, 7 Jun 2024 12:56:45 +0100
Salil Mehta <salil.mehta@huawei.com> wrote:

> OSPM evaluates _EVT method to map the event. The CPU hotplug event eventually
> results in start of the CPU scan. Scan figures out the CPU and the kind of
> event(plug/unplug) and notifies it back to the guest. Update the GED AML _EVT
> method with the call to \\_SB.CPUS.CSCN
> 
> Also, macro CPU_SCAN_METHOD might be referred in other places like during GED
> intialization so it makes sense to have its definition placed in some common
> header file like cpu_hotplug.h. But doing this can cause compilation break
> because of the conflicting macro definitions present in cpu.c and cpu_hotplug.c

one of the reasons is that you reusing legacy hw/acpi/cpu_hotplug.h,
see below for suggestion.

> and because both these files get compiled due to historic reasons of x86 world
> i.e. decision to use legacy(GPE.2)/modern(GED) CPU hotplug interface happens
> during runtime [1]. To mitigate above, for now, declare a new common macro
> ACPI_CPU_SCAN_METHOD for CPU scan method instead.
> (This needs a separate discussion later on for clean-up)
> 
> Reference:
> [1] https://lore.kernel.org/qemu-devel/1463496205-251412-24-git-send-email-imammedo@redhat.com/
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
> ---
>  hw/acpi/cpu.c                  | 2 +-
>  hw/acpi/generic_event_device.c | 4 ++++
>  include/hw/acpi/cpu_hotplug.h  | 2 ++
>  3 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
> index 473b37ba88..af2b6655d2 100644
> --- a/hw/acpi/cpu.c
> +++ b/hw/acpi/cpu.c
> @@ -327,7 +327,7 @@ const VMStateDescription vmstate_cpu_hotplug = {
>  #define CPUHP_RES_DEVICE  "PRES"
>  #define CPU_LOCK          "CPLK"
>  #define CPU_STS_METHOD    "CSTA"
> -#define CPU_SCAN_METHOD   "CSCN"
> +#define CPU_SCAN_METHOD   ACPI_CPU_SCAN_METHOD
>  #define CPU_NOTIFY_METHOD "CTFY"
>  #define CPU_EJECT_METHOD  "CEJ0"
>  #define CPU_OST_METHOD    "COST"
> diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
> index 54d3b4bf9d..63226b0040 100644
> --- a/hw/acpi/generic_event_device.c
> +++ b/hw/acpi/generic_event_device.c
> @@ -109,6 +109,10 @@ void build_ged_aml(Aml *table, const char *name, HotplugHandler *hotplug_dev,
>                  aml_append(if_ctx, aml_call0(MEMORY_DEVICES_CONTAINER "."
>                                               MEMORY_SLOT_SCAN_METHOD));
>                  break;
> +            case ACPI_GED_CPU_HOTPLUG_EVT:
> +                aml_append(if_ctx, aml_call0(ACPI_CPU_CONTAINER "."
> +                                             ACPI_CPU_SCAN_METHOD));

I don't particularly like exposing cpu hotplug internals for outside code
and then making that code do plumbing hoping that nothing will explode
in the future.

build_cpus_aml() takes event_handler_method to create a method that
can be called by platform. What I suggest is to call that method here
instead of trying to expose CPU hotplug internals and manually building
call path here.
aka:
  build_cpus_aml(event_handler_method = PATH_TO_GED_DEVICE.CSCN)
and then call here 
  aml_append(if_ctx, aml_call0(CSCN));
which will call  CSCN in GED scope, that was be populated by
build_cpus_aml() to do cpu scan properly without need to expose
cpu hotplug internal names and then trying to fixup conflicts caused by that.

PS:
we should do the same for memory hotplug, we see in context above


> +                break;
>              case ACPI_GED_PWR_DOWN_EVT:
>                  aml_append(if_ctx,
>                             aml_notify(aml_name(ACPI_POWER_BUTTON_DEVICE),
> diff --git a/include/hw/acpi/cpu_hotplug.h b/include/hw/acpi/cpu_hotplug.h
> index 48b291e45e..ef631750b4 100644
> --- a/include/hw/acpi/cpu_hotplug.h
> +++ b/include/hw/acpi/cpu_hotplug.h
> @@ -20,6 +20,8 @@
>  #include "hw/acpi/cpu.h"
>  
>  #define ACPI_CPU_HOTPLUG_REG_LEN 12
> +#define ACPI_CPU_SCAN_METHOD "CSCN"
> +#define ACPI_CPU_CONTAINER "\\_SB.CPUS"
>  
>  typedef struct AcpiCpuHotplug {
>      Object *device;
