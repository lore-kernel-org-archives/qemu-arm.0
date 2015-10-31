Received: by 10.182.105.169 with SMTP id gn9csp519383obb;
        Sat, 31 Oct 2015 11:53:12 -0700 (PDT)
X-Received: by 10.140.93.195 with SMTP id d61mr19172177qge.89.1446317592925;
        Sat, 31 Oct 2015 11:53:12 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 43si11353903qgc.61.2015.10.31.11.53.12
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Sat, 31 Oct 2015 11:53:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:56710 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZsbH6-0000Mk-Ko
	for alex.bennee@linaro.org; Sat, 31 Oct 2015 14:53:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42504)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ZsbH3-0000ID-1R
	for qemu-arm@nongnu.org; Sat, 31 Oct 2015 14:53:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ZsbH1-0000sF-Ua
	for qemu-arm@nongnu.org; Sat, 31 Oct 2015 14:53:08 -0400
Received: from mail-wi0-x22e.google.com ([2a00:1450:400c:c05::22e]:33207)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1ZsbGy-0000oa-GR; Sat, 31 Oct 2015 14:53:04 -0400
Received: by wijp11 with SMTP id p11so29394884wij.0;
	Sat, 31 Oct 2015 11:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=pXL58P93Tu6RVun8vVtOi/G8JmhJClp/z4LDb7PUEP4=;
	b=ao7B5vJBHsb60Q4k5YQWd/DWSuuHm8Dn4vkmiZgS60jRbxQMqxlbvML5jHpnEAJy/a
	tWezLvDJ0iFlTJKFX+YhLDuVviABRuugGJRrobXbNtEfyX6jpf7h5pRJT5ZdOHbPpnWo
	lZgJTwcWYiI/aIwZYPNSJG0BT+AldIn9zSMaRNl4z9WdbOBF1a5pZqhCdGm+zbXzM6uh
	4RTSslz3GjXNqNUBL/u/mLAi/ye0uHtISkpcD7c+n7ZpzgJZ1IblFUH/ha0hYfJ1sED4
	N2eUtfM8WdcoEmSM8qWV4QZRtS3F3BJntxqiLsLJ7efXdgLQ2PumCEI+6IRkVw+6cZaa
	0+WA==
MIME-Version: 1.0
X-Received: by 10.194.23.228 with SMTP id p4mr16897251wjf.151.1446317583870;
	Sat, 31 Oct 2015 11:53:03 -0700 (PDT)
Received: by 10.28.88.75 with HTTP; Sat, 31 Oct 2015 11:53:03 -0700 (PDT)
In-Reply-To: <1446285001-7316-1-git-send-email-zhaoshenglong@huawei.com>
References: <1446285001-7316-1-git-send-email-zhaoshenglong@huawei.com>
Date: Sat, 31 Oct 2015 11:53:03 -0700
Message-ID: <CAPokK=o74VZSArfMBuybGFHhWu3g6+o=2Mcegwg7PDCT1n9n5g@mail.gmail.com>
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::22e
Cc: peter.huangpeng@huawei.com, qemu-arm@nongnu.org, shannon.zhao@linaro.org,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [PATCH] ARM: ACPI: Fix MPIDR value in ACPI table
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: AtEYvXMTXJua

On Sat, Oct 31, 2015 at 2:50 AM, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
> From: Shannon Zhao <shannon.zhao@linaro.org>
>
> Use mp_affinity of ARMCPU as the CPU MPIDR instead of the CPU index.
>
> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> ---
> This patch is based on below patch.
> http://lists.nongnu.org/archive/html/qemu-devel/2015-10/msg06919.html
>
>  hw/arm/virt-acpi-build.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 29a1980..1c621cb 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -451,13 +451,15 @@ build_madt(GArray *table_data, GArray *linker, VirtGuestInfo *guest_info,
>      for (i = 0; i < guest_info->smp_cpus; i++) {
>          AcpiMadtGenericInterrupt *gicc = acpi_data_push(table_data,
>                                                       sizeof *gicc);
> +        ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(i));
> +
>          gicc->type = ACPI_APIC_GENERIC_INTERRUPT;
>          gicc->length = sizeof(*gicc);
>          if (guest_info->gic_version == 2) {
>              gicc->base_address = memmap[VIRT_GIC_CPU].base;
>          }
>          gicc->cpu_interface_number = i;
> -        gicc->arm_mpidr = i;
> +        gicc->arm_mpidr = armcpu->mp_affinity;

As a general rule, hw/ should not be reaching into the CPU state
struct like this. What is the real HW equivalent of this query?

Regards,
Peter

>          gicc->uid = i;
>          if (test_bit(i, cpuinfo->found_cpus)) {
>              gicc->flags = cpu_to_le32(ACPI_GICC_ENABLED);
> --
> 2.0.4
>
>
>
