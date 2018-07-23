Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp5659483wru;
        Mon, 23 Jul 2018 06:28:55 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfTjg2IDWarQeLqdw9y+NCEvxsow5t9DupRzzi1KsALGVinuFt5oyX1ye2LruHRbAJjVZ5r
X-Received: by 2002:a37:85c5:: with SMTP id h188-v6mr11057219qkd.80.1532352535809;
        Mon, 23 Jul 2018 06:28:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532352535; cv=none;
        d=google.com; s=arc-20160816;
        b=bY0AAlTCY3MPdNUXnef/hdPhargHV20KdLa5RQhvayGA8iiPd08oNGC6UGSzI7xL7/
         dWqA0V1OkPbP+r38FFpTGkL6CNQO/3n5RqcYB0BmtZxtm5gVR/TmGomchASvvVDfFmo6
         qTVJxDjwc0gNk4ci6KJU2KU1jIjiFnqv9Ztt5zsbWviNCgnisWfaGshU6Gj4QEgk4S8J
         zAN4gA7Pgf0xfCuIu1yk+lTBVy1uaC8VG0w0DIbVUyLLn1GKILghfJNvnL7zoTHsCz5r
         Y0zXm0ncK3y/01YSAov7CpfIYw06edxgHTHNP88tY4pyorrJRqqLR11F2Acfli7CgO/A
         t0sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date:arc-authentication-results;
        bh=oo8ZBirqtP8rl9JsJbl2W8dMliHTnWxXOJxhcKU7d34=;
        b=Q/e5B3XsMXQ94XqJQGCKnEc1TPSYOaGnaMugVn13kNZmoJT1sbHN+3GtINegSAvAuv
         +ckXUTqW1oQzB8T9XO0PwXUSxBfrWvc2pCLEyqu1YKpDRaxAfxEhBtmKcy4+wDA0XR4N
         Ig/xn1HlIbd3e+ZG3q1X080Fuwrg6SFY7PzLtZ+v86UOWH6jBKG4Y/34dNYDgOqBHmRy
         /WvdW9Oz6FVP3WvYlTiZca9zFuSB2EeiG8cybXCPiBM75/6MfN0VPNAXeejHrdeltum9
         20flHF1LcMOSMOrBdZ7OZX75QO34k/5A+NAd+oqwV1GZOfbn0M+4B6goFRydgxa9R8N6
         NZdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v16-v6si3911478qvk.273.2018.07.23.06.28.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 23 Jul 2018 06:28:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34649 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fhatT-0000yq-CC
	for alex.bennee@linaro.org; Mon, 23 Jul 2018 09:28:55 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52668)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1fhatM-0000yk-5X
	for qemu-arm@nongnu.org; Mon, 23 Jul 2018 09:28:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1fhatI-0003Iw-4r
	for qemu-arm@nongnu.org; Mon, 23 Jul 2018 09:28:48 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:51884 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1fhatH-0003IL-V1; Mon, 23 Jul 2018 09:28:44 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BFD8287A74;
	Mon, 23 Jul 2018 13:28:42 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 39588111AF23;
	Mon, 23 Jul 2018 13:28:38 +0000 (UTC)
Date: Mon, 23 Jul 2018 15:28:36 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Andrew Jones <drjones@redhat.com>
Message-ID: <20180723152836.47d3047f@redhat.com>
In-Reply-To: <20180704124923.32483-5-drjones@redhat.com>
References: <20180704124923.32483-1-drjones@redhat.com>
	<20180704124923.32483-5-drjones@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.1]);
	Mon, 23 Jul 2018 13:28:42 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]);
	Mon, 23 Jul 2018 13:28:42 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'imammedo@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC PATCH 4/6] hw/arm/virt-acpi-build:
 distinguish possible and present cpus
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UtaWQRnCkwef

On Wed,  4 Jul 2018 14:49:21 +0200
Andrew Jones <drjones@redhat.com> wrote:

> When building ACPI tables regarding CPUs we should always build
> them for the number of possible CPUs, not the number of present
> CPUs. We then ensure only the present CPUs are enabled.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> ---
>  hw/arm/virt-acpi-build.c | 20 +++++++++++++++-----
>  1 file changed, 15 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 6ea47e258832..1d1fc824da6f 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -49,14 +49,22 @@
>  #define ARM_SPI_BASE 32
>  #define ACPI_POWER_BUTTON_DEVICE "PWRB"
>  
> -static void acpi_dsdt_add_cpus(Aml *scope, int smp_cpus)
> +static int possible_cpus(VirtMachineState *vms)
> +{
> +    return MACHINE_GET_CLASS(vms)->possible_cpu_arch_ids(MACHINE(vms))->len;
> +}
> +
> +static void acpi_dsdt_add_cpus(Aml *scope, int possible, int present)
>  {
>      uint16_t i;
>  
> -    for (i = 0; i < smp_cpus; i++) {
> +    for (i = 0; i < possible; i++) {
>          Aml *dev = aml_device("C%.03X", i);
>          aml_append(dev, aml_name_decl("_HID", aml_string("ACPI0007")));
>          aml_append(dev, aml_name_decl("_UID", aml_int(i)));
> +        if (i >= present) {

acpi_dsdt_add_cpus(Aml *scope, const CPUArchIdList *possible_cpus = mc->possible_cpu_arch_ids(machine)) {
      for (i = 0; i < possible_cpus->len; i++) {
          ...
          if (possible_cpus->cpus[i].cpu == NULL)
               aml_append(dev, aml_name_decl("_STA", aml_int(0)));
      }
}

would be better to be consistent with x86 variant (well I prefer using a single source for CPU enumeration whenever possible) and drop helper above.

> +            aml_append(dev, aml_name_decl("_STA", aml_int(0)));
> +        }
>          aml_append(scope, dev);
>      }
>  }
> @@ -650,7 +658,7 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      gicd->base_address = cpu_to_le64(memmap[VIRT_GIC_DIST].base);
>      gicd->version = vms->gic_version;
>  
> -    for (i = 0; i < vms->smp_cpus; i++) {
> +    for (i = 0; i < possible_cpus(vms); i++) {
ditto

>          AcpiMadtGenericCpuInterface *gicc = acpi_data_push(table_data,
>                                                             sizeof(*gicc));
>          ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(i));
> @@ -663,7 +671,9 @@ build_madt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>          gicc->cpu_interface_number = cpu_to_le32(i);
>          gicc->arm_mpidr = cpu_to_le64(armcpu->mp_affinity);
>          gicc->uid = cpu_to_le32(i);
> -        gicc->flags = cpu_to_le32(ACPI_MADT_GICC_ENABLED);
> +        if (i < vms->smp_cpus) {
> +            gicc->flags = cpu_to_le32(ACPI_MADT_GICC_ENABLED);
> +        }
>  
>          if (arm_feature(&armcpu->env, ARM_FEATURE_PMU)) {
>              gicc->performance_interrupt = cpu_to_le32(PPI(VIRTUAL_PMU_IRQ));
> @@ -763,7 +773,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>       * the RTC ACPI device at all when using UEFI.
>       */
>      scope = aml_scope("\\_SB");
> -    acpi_dsdt_add_cpus(scope, vms->smp_cpus);
> +    acpi_dsdt_add_cpus(scope, possible_cpus(vms), vms->smp_cpus);
>      acpi_dsdt_add_uart(scope, &memmap[VIRT_UART],
>                         (irqmap[VIRT_UART] + ARM_SPI_BASE));
>      acpi_dsdt_add_flash(scope, &memmap[VIRT_FLASH]);

