Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp2054208wrq;
        Thu, 14 Jun 2018 06:44:23 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIclfgw4+Ie7q+67SYZ8kdqqaQXC4JAaaksCJrm2N8FL6J4V1xXavZFISxQb5KUWn8EWFlF
X-Received: by 2002:aed:3c78:: with SMTP id u53-v6mr2393731qte.201.1528983863708;
        Thu, 14 Jun 2018 06:44:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528983863; cv=none;
        d=google.com; s=arc-20160816;
        b=dgQQQEkrBIWs8Ml5ngv2Frz63NJ/kkQlUm7yVS5HdOu8aTBcmjAKvpj3ufu9k6XvR/
         Gf/PhKrmtBcEUnQMrSr3IEeZo8N1nlkXq2UHbR4iICf2cE2yE6BdJHYQN6IRoF7oHEbu
         UEXyrcIZF/04dT8wk33rPFT/ZiANOw7UPBEQKpQQmnL9j5DzQ4znbPD/Hl9P1QI4ndfY
         88siF/vC2oISM5OgbwWgiXPFya+kicfse9tkQ14UzjJegzTguPVA1kPVoKEKps2lJ1P8
         XPoa4v3swdk/JBDCkGhVlRu7cB8lGrAEQDMiiYegRzMcmqSlc1jddGDoz9SzBWmkenX9
         B0Wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=xWpsG75rUs19kaN08y2IkKP6LNdCc/rgw/cstPAj75c=;
        b=ITAH0ufMyZUkdelyd+p/zbBoS64CLKFOg207+JSPLBTYChy/jOcyMIoNzCojx/nr3w
         NJ76o18tqLUj7d3j1a3GwhoCjdx9IxyhqrBS/dAACGbI6GPsdKa3VSflBOYKa9ec7fqO
         wPBq1w5+iaFmcp+QhGbRujkoYCllfAwjYeLBwUVQYX52URLxVYL/PdCO8uv8WuNUItl+
         1M+0BohfRaGd6+PLgA+9B5Vi+KlqEnxm8K/wOwF/XuVggUlH/TeZS5sFc1Z0BAs5t9nR
         K4bBoG1y3xT9CPiwtsbZzKFvegmNGM8NIeawR/UY7NC0tt1soJruA+dhPAy2g/gOkTrJ
         zYog==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j47-v6si5114816qtk.21.2018.06.14.06.44.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 14 Jun 2018 06:44:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:40759 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fTSY3-0008Rd-91
	for alex.bennee@linaro.org; Thu, 14 Jun 2018 09:44:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50191)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1fTSXd-0008DA-Vv
	for qemu-arm@nongnu.org; Thu, 14 Jun 2018 09:43:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1fTSXZ-000321-3F
	for qemu-arm@nongnu.org; Thu, 14 Jun 2018 09:43:58 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:60888 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1fTSXY-00031x-VY; Thu, 14 Jun 2018 09:43:53 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 733AA40201BD;
	Thu, 14 Jun 2018 13:43:52 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BE01220244E2;
	Thu, 14 Jun 2018 13:43:50 +0000 (UTC)
Date: Thu, 14 Jun 2018 15:43:48 +0200
From: Andrew Jones <drjones@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Message-ID: <20180614134348.n32qcfr2hrsn7eri@kamzik.brq.redhat.com>
References: <1528879723-24675-1-git-send-email-eric.auger@redhat.com>
	<1528879723-24675-7-git-send-email-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1528879723-24675-7-git-send-email-eric.auger@redhat.com>
User-Agent: NeoMutt/20180512
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Thu, 14 Jun 2018 13:43:52 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Thu, 14 Jun 2018 13:43:52 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'drjones@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 6/9] hw/arm/virt-acpi-build:
 Advertise one or two GICR structures
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
Cc: peter.maydell@linaro.org, ard.biesheuvel@linaro.org, marc.zyngier@arm.com,
	qemu-devel@nongnu.org, christoffer.dall@arm.com,
	qemu-arm@nongnu.org, zhaoshenglong@huawei.com, lersek@redhat.com,
	eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TKjlBaLWWSOY

On Wed, Jun 13, 2018 at 10:48:40AM +0200, Eric Auger wrote:
> Depending on the number of smp_cpus we now register one or two
> GICR structures.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/arm/virt-acpi-build.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 74f5744..eefd1d4 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -670,6 +670,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>  
>      if (vms->gic_version == 3) {
>          AcpiMadtGenericTranslator *gic_its;
> +        int nb_redist_regions = virt_gicv3_redist_region_count(vms);
>          AcpiMadtGenericRedistributor *gicr = acpi_data_push(table_data,
>                                                           sizeof *gicr);
>  
> @@ -678,6 +679,14 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>          gicr->base_address = cpu_to_le64(memmap[VIRT_GIC_REDIST].base);
>          gicr->range_length = cpu_to_le32(memmap[VIRT_GIC_REDIST].size);
>  
> +        if (nb_redist_regions == 2) {
> +            gicr = acpi_data_push(table_data, sizeof(*gicr));
> +            gicr->type = ACPI_APIC_GENERIC_REDISTRIBUTOR;
> +            gicr->length = sizeof(*gicr);
> +            gicr->base_address = cpu_to_le64(memmap[VIRT_GIC_REDIST2].base);
> +            gicr->range_length = cpu_to_le32(memmap[VIRT_GIC_REDIST2].size);
> +        }
> +
>          if (its_class_name() && !vmc->no_its) {
>              gic_its = acpi_data_push(table_data, sizeof *gic_its);
>              gic_its->type = ACPI_APIC_GENERIC_TRANSLATOR;
> -- 
> 2.5.5
> 
>

Reviewed-by: Andrew Jones <drjones@redhat.com>
