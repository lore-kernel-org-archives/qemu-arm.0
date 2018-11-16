Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp131797wrw;
        Fri, 16 Nov 2018 01:08:18 -0800 (PST)
X-Google-Smtp-Source: AJdET5cVFAy1cN5jvVv0tY2bBCcc2Cj+aJdWEO7fBbaDuXFI4UbH2nDPxuSdptTcxk6JQ2ITIYlp
X-Received: by 2002:ac8:32b2:: with SMTP id z47mr9199242qta.209.1542359298729;
        Fri, 16 Nov 2018 01:08:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542359298; cv=none;
        d=google.com; s=arc-20160816;
        b=cNYzZhmV3ZkFYEDUcRMfuzc9ada3Gvz50sKHKOzJEfALDj3Mg5p+3FfPx439xPzhLL
         YwL29l8rksHaro3e16S2CpwF87CuYQCtrEHKv/pWcUPKs0rHqkjbgohEaHfpJuNE6GXj
         anDv4AZ/78mg9+bgont1/iRbX+5MeOssMN0kXGngJ72lxgx9jD5S2PjIqHoF0CsglyZa
         8p/XrHfy/NRRpkVdCVG+Hc3q7Mw4XtQu44QFq/Jd1oGBU5x+puI++j33yiDbWn3DG8mL
         qjXkPUkJL+nHl7PX4LkdYrQadjKzY77vgV2tlxZY0gc3a0Ss8Lu2/733sRw4l+ZPZTqW
         1lJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=xZI4vCOztVkMvbtdFc1O2WaS4HwNRrNV+m4sf9TK6xk=;
        b=p7pjltFOeSANPz86nT3yuJAB95wXPcdvdsfe53kPTjua4+mohAxlCI8/sc0L007yFN
         iq308jzhSJpBB9Xap9P38Rnaoy+1qPYbDk2MItc3A1/ljuVRCIS2jTMLv2xrj6bSJBDD
         z3AkJFuMkl2sUcIdtnfIaTd530J+2AgsH3suKOZJ4A485W0zMwJBjpXHiHPwNUYAZeRI
         uzdHC+N73qGl2bVXFMt0VgeFZRG586432pfpKyQF1cTzyhBQX83UMCX9NfBWXx79d9Fs
         bDNgqbB5P1YF/exoJR+WVR3VQUevu/wfFpgajg1cGKvMxEF58JtU4/EVCZ7vSR5sVvDt
         vLAw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k3si5681947qvh.178.2018.11.16.01.08.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 16 Nov 2018 01:08:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43144 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gNa6s-0001d0-30
	for alex.bennee@linaro.org; Fri, 16 Nov 2018 04:08:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54147)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1gNa6i-0001ct-PH
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 04:08:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1gNa6c-0000pM-Si
	for qemu-arm@nongnu.org; Fri, 16 Nov 2018 04:08:08 -0500
Received: from mx1.redhat.com ([209.132.183.28]:52186)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1gNa6Z-0000ln-4h; Fri, 16 Nov 2018 04:08:00 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4DBCB81F13;
	Fri, 16 Nov 2018 09:07:57 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C5C7A5DE00;
	Fri, 16 Nov 2018 09:07:53 +0000 (UTC)
Date: Fri, 16 Nov 2018 10:07:51 +0100
From: Andrew Jones <drjones@redhat.com>
To: peng.hao2@zte.com.cn
Message-ID: <20181116090751.272tyagevqwvosy6@kamzik.brq.redhat.com>
References: <20181115141003.r6imovu25ymatm4w@kamzik.brq.redhat.com>
	<201811160945428164241@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201811160945428164241@zte.com.cn>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Fri, 16 Nov 2018 09:07:57 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH V6 5/6] hw/arm/virt: add pvpanic
 device invirt acpi table
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, philmd@redhat.com,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AFmw0kQzg5/J

On Fri, Nov 16, 2018 at 09:45:42AM +0800, peng.hao2@zte.com.cn wrote:
> >> add pvpanic device in virt acpi table, so when kenrel command line uses
> >> acpi=force, kernel can get info from acpi table in aarch64.
> 
> [...]
> 
> >>
> >> +static void acpi_dsdt_add_pvpanic(Aml *scope, const MemMapEntry *pvpanic_memmap)
> >> +{
> >> +    Aml *dev = aml_device("PANC");
> >
> >Shouldn't this be "PEVT" ("panic event"), like it is for x86?
> >
> yeah, I will change it.
> >> +    aml_append(dev, aml_name_decl("_HID", aml_string("QEMU0001")));
> >> +    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
> >
> >Why add _UID? Also, I see x86 had some issues with not having _STA and
> >then having a _STA without the UI flag. It now has _STA=0xf
> >(PRESENT|ENABLED|UI|FUNCTIONING). I'm not saying we need to do that to,
> >but I'd like to know if it was considered and decided we don't need to.
> >
> The way the kernel code processes _STA is that if _STA is not found, the default 
> setting is (PRESENT|ENABLED|UI|FUNCTIONING). So I think it is not necessary
>  to add it. It is only parsed in the pvpanic driver. 

Good enough for me.

> for _UID, I think it is used for device index. I just fill it with 0 because there is 
> only one pvpanic device.

OK, but I'm still not sure it's necessary.

> 
> by the way, How to get the value of ACPI conveniently? how dou you get the 
> value of _STA?

Not sure what you mean here. From where do you want to check the value?
If you mean from guest userspace, then there's nothing convenient that I
know of. You'll have to disassemble the tables you extract from sysfs,
afaik.

Thanks,
drew

> 
> Thanks.
> >> +
> >> +    Aml *crs = aml_resource_template();
> >> +    aml_append(crs, aml_memory32_fixed(pvpanic_memmap->base,
> >> +                                       pvpanic_memmap->size, AML_READ_WRITE));
> >> +
> >> +    aml_append(dev, aml_name_decl("_CRS", crs));
> >> +
> >> +    aml_append(scope, dev);
> >> +}
> >> +
> >>  static void acpi_dsdt_add_uart(Aml *scope, const MemMapEntry *uart_memmap,
> >>                                             uint32_t uart_irq)
> >>  {
> >> @@ -770,6 +785,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> >>      acpi_dsdt_add_cpus(scope, vms->smp_cpus);
> >>      acpi_dsdt_add_uart(scope, &memmap[VIRT_UART],
> >>                         (irqmap[VIRT_UART] + ARM_SPI_BASE));
> >> +    acpi_dsdt_add_pvpanic(scope, &memmap[VIRT_PVPANIC]);
> >>      acpi_dsdt_add_flash(scope, &memmap[VIRT_FLASH]);
> >>      acpi_dsdt_add_fw_cfg(scope, &memmap[VIRT_FW_CFG]);
> >>      acpi_dsdt_add_virtio(scope, &memmap[VIRT_MMIO],
> >> --
> >> 1.8.3.1
> >>
> >>
> >
> >Thanks,
> >drew
