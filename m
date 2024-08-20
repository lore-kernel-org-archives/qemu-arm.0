Received: by 2002:a17:505:4e90:b0:1be9:327d:8ee3 with SMTP id y16csp147980njx;
        Mon, 19 Aug 2024 17:22:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVGVL3eRQ1hxrxFqA8UOM+6Z/Bd4XFLBqOwJ6Kx+dbtfLMdawDlRH2FqjRo6fjsqNHdVEX1CG2OXF5HbC6QPK9pw8WK3caH
X-Google-Smtp-Source: AGHT+IH+g15K+SzA+er8bEDrYS6MW6/AmuTSX5/ax6/gl97BlR8tZ6v1EPnJtw9q1rAeZxG30j59
X-Received: by 2002:a05:6102:a54:b0:493:b9a0:8ee8 with SMTP id ada2fe7eead31-497799d5f60mr9747852137.22.1724113338808;
        Mon, 19 Aug 2024 17:22:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1724113338; cv=none;
        d=google.com; s=arc-20160816;
        b=wHAZ7i/8LG55sTph2dnphEgy0RZVvo04KzkeevmIZAK2AWNUDkCVuStvNHYCDfJ7pI
         8l+hsPqVJM0QTnVr0VUbuLZX+BSf4fKG1NEiwQ2fbvyy8gkFsZYpuBY5t8JMaxLlbtbl
         0hYpDqMMWMAutu7lqi4aWFm1Q0L9viNnharyqktNUJOEb4MFEyd5nxzAbwAc8RLfwlSb
         fwrSl4RNVSqrlaV7t29uOoafpswc0cagzSP7L67y3Wzaj5cK83E14mTjIG9WzXyBSNJE
         fnZxD5uz852AEQUDirmm6cNm/hZB1RWtUo4Ew2Fl/4m4lrxm8syKBXZ9X1qdWHbudPjt
         xT5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=4MKczJNn7eWeSgYJzFg8/eo5vyV7rrNgXziv7QtGHbg=;
        fh=XXZKB4d5BxXV9hGG1/36/EneC88vhGYidmQvgJ8ULig=;
        b=msWb8IdM6n5TfCl5iJb0oVPMlVfO+DHJaop0hZ5Zse8ulazQq8uyYCY0unwXEyeJeI
         HkubekfpolwWQTJQPOIyH87kpvuQBbyc3yoryCV/7AK5KeVfpObFPwoJr/xo1Gtw3FAz
         V+S2x/fy+EcIijKDBWni89naCPtW5+MZIBV+MIyuCdXqBL/q8ihi7nd6j3dqAifHuSTS
         Ft0oTvBrGw0r9+s5ePLS6FIxGjXl+Q2+JYBonz+W/2YVRc+tptXLUckthsF0bYCv0X8C
         844MKwLKDEJHPJ/DmAclG9g7D6es1AeArUPJeqZGjOlIK8suqIYDYZnh/p5HvjSMH/1t
         vAAw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KBCoNrS6;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <gshan@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-7a4ff1272f7si1123495485a.783.2024.08.19.17.22.18
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 17:22:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KBCoNrS6;
       spf=pass (google.com: domain of gshan@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=gshan@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724113338;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4MKczJNn7eWeSgYJzFg8/eo5vyV7rrNgXziv7QtGHbg=;
	b=KBCoNrS6u2yowQ+ex8frEV2WbnddWLfO0Iy2P7GveRswdTnEkN6ucMW/k5evUPtPu/SuZD
	vtzRsMuer/FWLoW5JUQko6Oj10xiTN8vBjanyInwRrM8opshfVFAUyaiVUC7GqY2jZ2yGg
	IUzfFs7g9NKdxp0+cIgLWCRgNYinhVQ=
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-435-feJPtocEMKierxhPbJ-d1A-1; Mon, 19 Aug 2024 20:22:17 -0400
X-MC-Unique: feJPtocEMKierxhPbJ-d1A-1
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-70d1a9bad5dso4908020b3a.0
        for <alex.bennee@linaro.org>; Mon, 19 Aug 2024 17:22:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724113336; x=1724718136;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4MKczJNn7eWeSgYJzFg8/eo5vyV7rrNgXziv7QtGHbg=;
        b=WTZPF/aGjO5jtHp5YmTtO5GFuh6rchplZh+jxVYJUoO7DOldqnFxmij/U7eQbwvJe3
         iJBVywOxUgW8wUtNwxPsGhc0pX2rLrXB9/LVt0pm4muweq1YjRJjm0NIj28jx8kX4Uwy
         5NlYzRAXEumhrzw0cFBXpTn93NBX/AdbJp5EPs3Stmuj/yvOSQh0d2lZdM50Kj2+vUpK
         lPDBnzP98BnMD0OHOPn4+v+Bpvs6wTJnUbBB8f4fJM+h6eDR+lY1dRTcxNs1GgE5n/yH
         7AZ5rapDHZdaukcNz9c9Z+0/0AaGhhqHYDgMdyKWj3HAZHFA+Vl8Xz4v8+udqHe7z8Gv
         9Lrg==
X-Forwarded-Encrypted: i=1; AJvYcCWvjxpEdfWfZDt4qtiw+5aQBGgQ2VdQ/HrFDON2P3JQwy3vX+gDO6jBOz4Bb6O3lBKHgqXdVGhwO5k0IuJ2MaQrqdReQM3n
X-Gm-Message-State: AOJu0YycRJ6nYcxqSXprmWp+nlLlYhaEeL8rNQ3hFUR0FUYfiiBdt0Im
	R/oTBpI4rcS+7PFpqiaQ0WKPdl9Nh5awKoKtan0sfR/qlLlf3aGaHLEK00Ot6A3PYi4Ygw5UlJJ
	t1oqHjtQnxTFJIBb+Xxh9O7H9S1EITZJ58HuExUqxTUjnxBvPy2dd7w==
X-Received: by 2002:a05:6a00:148b:b0:70d:278e:4e94 with SMTP id d2e1a72fcca58-713c5285995mr13467681b3a.30.1724113336254;
        Mon, 19 Aug 2024 17:22:16 -0700 (PDT)
X-Received: by 2002:a05:6a00:148b:b0:70d:278e:4e94 with SMTP id d2e1a72fcca58-713c5285995mr13467659b3a.30.1724113335722;
        Mon, 19 Aug 2024 17:22:15 -0700 (PDT)
Return-Path: <gshan@redhat.com>
Received: from [192.168.68.54] ([103.210.27.48])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7127aef574asm7120615b3a.114.2024.08.19.17.22.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Aug 2024 17:22:15 -0700 (PDT)
Message-ID: <52ae18ca-0a5a-44d4-95f5-56cfc7a035a8@redhat.com>
Date: Tue, 20 Aug 2024 10:22:00 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC V3 11/29] arm/virt: Create GED dev before *disabled*
 CPU Objs are destroyed
To: Salil Mehta <salil.mehta@huawei.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "mst@redhat.com"
 <mst@redhat.com>
Cc: "maz@kernel.org" <maz@kernel.org>,
 "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "imammedo@redhat.com" <imammedo@redhat.com>,
 "andrew.jones@linux.dev" <andrew.jones@linux.dev>,
 "david@redhat.com" <david@redhat.com>, "philmd@linaro.org"
 <philmd@linaro.org>, "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "will@kernel.org" <will@kernel.org>, "ardb@kernel.org" <ardb@kernel.org>,
 "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "rafael@kernel.org" <rafael@kernel.org>,
 "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
 "npiggin@gmail.com" <npiggin@gmail.com>,
 "harshpb@linux.ibm.com" <harshpb@linux.ibm.com>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 "darren@os.amperecomputing.com" <darren@os.amperecomputing.com>,
 "ilkka@os.amperecomputing.com" <ilkka@os.amperecomputing.com>,
 "vishnu@os.amperecomputing.com" <vishnu@os.amperecomputing.com>,
 "karl.heubaum@oracle.com" <karl.heubaum@oracle.com>,
 "miguel.luis@oracle.com" <miguel.luis@oracle.com>,
 "salil.mehta@opnsrc.net" <salil.mehta@opnsrc.net>,
 zhukeqian <zhukeqian1@huawei.com>,
 "wangxiongfeng (C)" <wangxiongfeng2@huawei.com>,
 "wangyanan (Y)" <wangyanan55@huawei.com>,
 "jiakernel2@gmail.com" <jiakernel2@gmail.com>,
 "maobibo@loongson.cn" <maobibo@loongson.cn>,
 "lixianglai@loongson.cn" <lixianglai@loongson.cn>,
 "shahuang@redhat.com" <shahuang@redhat.com>,
 "zhao1.liu@intel.com" <zhao1.liu@intel.com>, Linuxarm <linuxarm@huawei.com>
References: <20240613233639.202896-1-salil.mehta@huawei.com>
 <20240613233639.202896-12-salil.mehta@huawei.com>
 <143ad7d2-8f45-4428-bed3-891203a49029@redhat.com>
 <b6bdee28101741169048819c0d562bfc@huawei.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <b6bdee28101741169048819c0d562bfc@huawei.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 4rMj7uKZ+SU4

Hi Salil,

On 8/19/24 10:10 PM, Salil Mehta wrote:
>>   From: Gavin Shan <gshan@redhat.com>
>>   Sent: Tuesday, August 13, 2024 2:05 AM
>>   To: Salil Mehta <salil.mehta@huawei.com>; qemu-devel@nongnu.org;
>>   qemu-arm@nongnu.org; mst@redhat.com
>>   
>>   On 6/14/24 9:36 AM, Salil Mehta wrote:
>>   > ACPI CPU hotplug state (is_present=_STA.PRESENT,
>>   > is_enabled=_STA.ENABLED) for all the possible vCPUs MUST be
>>   > initialized during machine init. This is done during the creation of
>>   > the GED device. VMM/Qemu MUST expose/fake the ACPI state of the
>>   > disabled vCPUs to the Guest kernel as 'present' (_STA.PRESENT) always
>>   > i.e. ACPI persistent. if the 'disabled' vCPU objectes are destroyed
>>   > before the GED device has been created then their ACPI hotplug state
>>   > might not get initialized correctly as acpi_persistent flag is part of the
>>   CPUState. This will expose wrong status of the unplugged vCPUs to the
>>   Guest kernel.
>>   >
>>   > Hence, moving the GED device creation before disabled vCPU objects get
>>   > destroyed as part of the post CPU init routine.
>>   >
>>   > Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
>>   > ---
>>   >   hw/arm/virt.c | 10 +++++++---
>>   >   1 file changed, 7 insertions(+), 3 deletions(-)
>>   >
>>   > diff --git a/hw/arm/virt.c b/hw/arm/virt.c index
>>   > 918bcb9a1b..5f98162587 100644
>>   > --- a/hw/arm/virt.c
>>   > +++ b/hw/arm/virt.c
>>   > @@ -2467,6 +2467,12 @@ static void machvirt_init(MachineState
>>   > *machine)
>>   >
>>   >       create_gic(vms, sysmem);
>>   >
>>   > +    has_ged = has_ged && aarch64 && firmware_loaded &&
>>   > +              virt_is_acpi_enabled(vms);
>>   > +    if (has_ged) {
>>   > +        vms->acpi_dev = create_acpi_ged(vms);
>>   > +    }
>>   > +
>>   >       virt_cpu_post_init(vms, sysmem);
>>   >
>>   >       fdt_add_pmu_nodes(vms);
>>   > @@ -2489,9 +2495,7 @@ static void machvirt_init(MachineState
>>   *machine)
>>   >
>>   >       create_pcie(vms);
>>   >
>>   > -    if (has_ged && aarch64 && firmware_loaded &&
>>   virt_is_acpi_enabled(vms)) {
>>   > -        vms->acpi_dev = create_acpi_ged(vms);
>>   > -    } else {
>>   > +    if (!has_ged) {
>>   >           create_gpio_devices(vms, VIRT_GPIO, sysmem);
>>   >       }
>>   >
>>   
>>   It's likely the GPIO device can be created before those disabled CPU objects
>>   are destroyed. It means the whole chunk of code can be moved together, I
>>   think.
> 
> I was not totally sure of this. Hence, kept the order of the rest like that. I can
> definitely check again if we can do that to reduce the change.
> 

@has_ged is the equivalent to '!vmc->no_ged' initially and then it's overrided by
the following changes in this patch. The syntax of @has_ged has been changed and
it's not the best name to match the changes. There are two solutions: (1) Rename
@has_ged to something meaningful and matching with the changes; (2) Move the whole
chunk of codes, which I preferred. The GPIO device and GED device are supplementing
to each other, meaning GPIO device will be created when GED device has been disallowed.

     has_ged = has_ged && aarch64 && firmware_loaded && virt_is_acpi_enabled(vms);

The code to be moved together in virt.c since they're correlated:

     if (has_ged && aarch64 && firmware_loaded && virt_is_acpi_enabled(vms)) {
         vms->acpi_dev = create_acpi_ged(vms);
     } else {
         create_gpio_devices(vms, VIRT_GPIO, sysmem);
     }
     
     if (vms->secure && !vmc->no_secure_gpio) {
         create_gpio_devices(vms, VIRT_SECURE_GPIO, secure_sysmem);
     }

      /* connect powerdown request */
      vms->powerdown_notifier.notify = virt_powerdown_req;
      qemu_register_powerdown_notifier(&vms->powerdown_notifier);

Thanks,
Gavin



