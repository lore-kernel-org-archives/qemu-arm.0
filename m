Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp1629760wrx;
        Fri, 29 Mar 2019 02:32:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxtxTFvx9NCahlmmGDXYIs+14kGaEeo/n5HZ5LM5Rpm1tI/TXeIwNr259YW9MD3FC5i+NPd
X-Received: by 2002:a02:1d03:: with SMTP id 3mr18640229jaj.73.1553851923824;
        Fri, 29 Mar 2019 02:32:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1553851923; cv=none;
        d=google.com; s=arc-20160816;
        b=mP96Z5eeWiDEP0PmhUYst9txMwRR2jqOj4Lw+fUHdQAxat7H+GPPQF8gCbjVa7E0UQ
         jb9UTFF3YBxt/7Be9l37DpXExhFNiR9nG3jG00gQzMQlV9JvTKo1gnyKfgJv50HUV2Ej
         +6YSq6GvBprqU1oiQME4MSg8KMUzBblREHovMhIFJRBYuwrhuQp2JFI0kIKyCEbwFiIR
         m7PTOoTkCxOT72NSc9/8V3RJaA6zpUeutke3UzCWd2JaUzaBQvoieMjpKMgc2eLoxa4p
         ibm6RNLU9vloaUAM1lO4ruWs6HzYunrEAGjX/SXKd4dp+8wI+Wg2Nrc84l7mhbS1tQtU
         /aaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=+JQLB+DWWSJlgL8koVmYcp5D7011za4gfoxjh6ZsxCQ=;
        b=BSkqexfFVH0fWoAZgjTbSfAMnZZ2toybJw4siwVqwyA6WsC3KXNYi9AO7t82tUziYV
         83Zvk52uRBILnKc8YrmWPI88cLNWkfv9lFZihf+1B3VpbFyMgdUwXym6B6K7Xm5SF87q
         RDrBqoAx/F/t5S5xsMNtgS3EbyHkFz7DvVPJla/PO4XrwI1/pkrq7968Jrbwv4lTzw0I
         +AkjiEkO+XTluBh4Akb91CnMG9S+SFC2Cc3I0iAetqx0kz+7jqwd9jXO4BcuGYbhDJ+8
         8+wmgMfksOAMK/BdkMr7/JYlA9UC/HJvLoijDzrzOcwh3SCv6+CKOCAbtmBDcQS9bcSg
         Ym/A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k22si824640ioh.15.2019.03.29.02.32.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 29 Mar 2019 02:32:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:49458 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h9nrn-0006Kr-35
	for alex.bennee@linaro.org; Fri, 29 Mar 2019 05:32:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57209)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1h9nrW-0006Hs-2u
	for qemu-arm@nongnu.org; Fri, 29 Mar 2019 05:31:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1h9nrV-0008PJ-1S
	for qemu-arm@nongnu.org; Fri, 29 Mar 2019 05:31:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52362)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1h9nrU-0008OX-LM; Fri, 29 Mar 2019 05:31:44 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D08B23082A4C;
	Fri, 29 Mar 2019 09:31:43 +0000 (UTC)
Received: from [10.36.117.163] (ovpn-117-163.ams2.redhat.com [10.36.117.163])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E7325C23D;
	Fri, 29 Mar 2019 09:31:40 +0000 (UTC)
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	qemu-devel@nongnu.org, qemu-arm@nongnu.org, imammedo@redhat.com,
	peter.maydell@linaro.org, shannon.zhaosl@gmail.com, sameo@linux.intel.com, 
	sebastien.boeuf@intel.com
References: <20190321104745.28068-1-shameerali.kolothum.thodi@huawei.com>
	<20190321104745.28068-8-shameerali.kolothum.thodi@huawei.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <98c7f0fd-8446-8897-0808-e7615af29670@redhat.com>
Date: Fri, 29 Mar 2019 10:31:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190321104745.28068-8-shameerali.kolothum.thodi@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Fri, 29 Mar 2019 09:31:43 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v3 07/10] hw/arm/virt: Introduce opt-in
 feature "fdt"
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
Cc: Leif Lindholm <Leif.Lindholm@arm.com>, Laszlo Ersek <lersek@redhat.com>,
	linuxarm@huawei.com, xuwei5@hisilicon.com,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hOmjsP3gg9x3

Hi Shameer,

[ + Laszlo, Ard, Leif ]

On 3/21/19 11:47 AM, Shameer Kolothum wrote:
> This is to disable/enable populating DT nodes in case
> any conflict with acpi tables. The default is "off".
The name of the option sounds misleading to me. Also we don't really
know the scope of the disablement. At the moment this just aims to
prevent the hotpluggable dt nodes from being added if we boot in ACPI mode.

> 
> This will be used in subsequent patch where cold plug
> device-memory support is added for DT boot.
I am concerned about the fact that in dt mode, by default, you won't see
any PCDIMM nodes.
> 
> If DT memory node support is added for cold-plugged device
> memory, those memory will be visible to Guest kernel via
> UEFI GetMemoryMap() and gets treated as early boot memory.
Don't we have an issue in UEFI then. Normally the SRAT indicates whether
the slots are hotpluggable or not. Shouldn't the UEFI code look at this
info.
> Hence memory becomes non hot-un-unpluggable even if Guest
> is booted in ACPI mode.



> 
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> ---
>  hw/arm/virt.c         | 23 +++++++++++++++++++++++
>  include/hw/arm/virt.h |  1 +
>  2 files changed, 24 insertions(+)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 13db0e9..b602151 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1717,6 +1717,20 @@ static void virt_set_highmem(Object *obj, bool value, Error **errp)
>      vms->highmem = value;
>  }
>  
> +static bool virt_get_fdt(Object *obj, Error **errp)
> +{
> +    VirtMachineState *vms = VIRT_MACHINE(obj);
> +
> +    return vms->use_fdt;
> +}
> +
> +static void virt_set_fdt(Object *obj, bool value, Error **errp)
> +{
> +    VirtMachineState *vms = VIRT_MACHINE(obj);
> +
> +    vms->use_fdt = value;
> +}
> +
>  static bool virt_get_its(Object *obj, Error **errp)
>  {
>      VirtMachineState *vms = VIRT_MACHINE(obj);
> @@ -2005,6 +2019,15 @@ static void virt_instance_init(Object *obj)
>      object_property_set_description(obj, "gic-version",
>                                      "Set GIC version. "
>                                      "Valid values are 2, 3 and host", NULL);
> +    /* fdt is disabled by default */
> +    vms->use_fdt = false;
> +    object_property_add_bool(obj, "fdt", virt_get_fdt,
> +                             virt_set_fdt, NULL);
> +    object_property_set_description(obj, "fdt",
> +                                    "Set on/off to enable/disable device tree "
> +                                    "nodes in case any conflict with ACPI"
in case of

Thanks

Eric
> +                                    "(eg: device memory node)",
> +                                    NULL);
>  
>      vms->highmem_ecam = !vmc->no_highmem_ecam;
>  
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index c5e4c96..14b2e0a 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -119,6 +119,7 @@ typedef struct {
>      bool highmem_ecam;
>      bool its;
>      bool virt;
> +    bool use_fdt;
>      int32_t gic_version;
>      VirtIOMMUType iommu;
>      struct arm_boot_info bootinfo;
> 
