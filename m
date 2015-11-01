Received: by 10.182.105.169 with SMTP id gn9csp602204obb;
        Sat, 31 Oct 2015 17:04:59 -0700 (PDT)
X-Received: by 10.140.42.166 with SMTP id c35mr20221929qga.66.1446336299085;
        Sat, 31 Oct 2015 17:04:59 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x4si12339583qkx.21.2015.10.31.17.04.58
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Sat, 31 Oct 2015 17:04:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro_org.20150623.gappssmtp.com
Received: from localhost ([::1]:57407 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1Zsg8o-0001Sr-SR
	for alex.bennee@linaro.org; Sat, 31 Oct 2015 20:04:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32801)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Zsg8V-0001C7-7D
	for qemu-devel@nongnu.org; Sat, 31 Oct 2015 20:04:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Zsg8T-0000ma-09
	for qemu-devel@nongnu.org; Sat, 31 Oct 2015 20:04:39 -0400
Received: from mail-vk0-x22d.google.com ([2607:f8b0:400c:c05::22d]:36551)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Zsg8S-0000mT-S5
	for qemu-devel@nongnu.org; Sat, 31 Oct 2015 20:04:36 -0400
Received: by vkex70 with SMTP id x70so66871809vke.3
	for <qemu-devel@nongnu.org>; Sat, 31 Oct 2015 17:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro_org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=ygtsXw35Nj2dfjxOPRNagaWaT6js0PfzaAr8hgg5jk0=;
	b=FkdkW7y7Z5eY6l2UdEDPC7uOR6Mm7iy7xJHowaKtZ8kk5OxKOh1p5/g6p4Ruatd/E4
	kv4oI4DKZiLvkLx0d+vVZY4urM8YrfkEH7mhdZWbLat+GV8oZFGGuTWULFZXblAHKrgk
	5FbzHbTOEgNVeC9zdFDkszF1AC+1BVviasHxVESMCV6/BICgDXvbJcnTHTGPLb1SMN4y
	hehAe/Nm7aRWyYyc7QJFfOYY36ETaI9D1owAkNnFtEFEpdft3LtrkwgJrs2bwMxPKQHt
	lpXymFE98UjmJUgYBpj0sKGpn8klb2YYp5pbOFyRTtSCELOLb7qHhTFausY6MWPrSsU8
	fUlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=ygtsXw35Nj2dfjxOPRNagaWaT6js0PfzaAr8hgg5jk0=;
	b=mHoWpLwOZ0RbOqWQqV9ZfbiYtK3MIueJvDmfYNrYXP881SgPgr2L+EW2Cv3v6/smFm
	368PiMoRb1NnJx6m+zABo6mrgdkLCUEHtKVDKl8qvP0THkHKi6oWc2mRhR3iU+yQ7u8V
	/VnTFUm5S+AklWOL43cvI/dFzOjYpQIoOgkdFHDdiHy6Ddrbr0FK1FrcH3qtCGpJNu7t
	LV08QjtYiCTbijYZg8AJYU1AD+eRQN1psVtgE18j/wjVL1NSIJ+EkKLj1CwwOm1i8eCk
	PRGerc6B7rvaXtmPVvjmw+hAiKflY1BfXXDNdpQKJ91HrTdUWVXUJAgJaAugtFl+3a+f
	nYig==
X-Gm-Message-State: ALoCoQkQ5Y1u6zRwvfXGXXIU/azaCjQGURlz9j3oE/IVkyHuWAQGQXeuub0fsA1jSZ+I+dSRLYGa
X-Received: by 10.31.161.146 with SMTP id k140mr10578474vke.90.1446336276065; 
	Sat, 31 Oct 2015 17:04:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Sat, 31 Oct 2015 17:04:16 -0700 (PDT)
In-Reply-To: <CAPokK=o74VZSArfMBuybGFHhWu3g6+o=2Mcegwg7PDCT1n9n5g@mail.gmail.com>
References: <1446285001-7316-1-git-send-email-zhaoshenglong@huawei.com>
	<CAPokK=o74VZSArfMBuybGFHhWu3g6+o=2Mcegwg7PDCT1n9n5g@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 1 Nov 2015 00:04:16 +0000
Message-ID: <CAFEAcA9d2VLd=3spu_3Ji+Zw_pRJr_yEQUjyh87Av6c7wHHE-w@mail.gmail.com>
To: Peter Crosthwaite <crosthwaitepeter@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400c:c05::22d
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	"Huangpeng \(Peter\)" <peter.huangpeng@huawei.com>,
	qemu-arm@nongnu.org, Shannon Zhao <shannon.zhao@linaro.org>,
	Shannon Zhao <zhaoshenglong@huawei.com>
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH] ARM: ACPI: Fix MPIDR value in
	ACPI table
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 1rvj3/5vtsHu

On 31 October 2015 at 18:53, Peter Crosthwaite
<crosthwaitepeter@gmail.com> wrote:
> On Sat, Oct 31, 2015 at 2:50 AM, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
>> From: Shannon Zhao <shannon.zhao@linaro.org>
>>
>> Use mp_affinity of ARMCPU as the CPU MPIDR instead of the CPU index.
>>
>> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
>> ---
>> This patch is based on below patch.
>> http://lists.nongnu.org/archive/html/qemu-devel/2015-10/msg06919.html
>>
>>  hw/arm/virt-acpi-build.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
>> index 29a1980..1c621cb 100644
>> --- a/hw/arm/virt-acpi-build.c
>> +++ b/hw/arm/virt-acpi-build.c
>> @@ -451,13 +451,15 @@ build_madt(GArray *table_data, GArray *linker, VirtGuestInfo *guest_info,
>>      for (i = 0; i < guest_info->smp_cpus; i++) {
>>          AcpiMadtGenericInterrupt *gicc = acpi_data_push(table_data,
>>                                                       sizeof *gicc);
>> +        ARMCPU *armcpu = ARM_CPU(qemu_get_cpu(i));
>> +
>>          gicc->type = ACPI_APIC_GENERIC_INTERRUPT;
>>          gicc->length = sizeof(*gicc);
>>          if (guest_info->gic_version == 2) {
>>              gicc->base_address = memmap[VIRT_GIC_CPU].base;
>>          }
>>          gicc->cpu_interface_number = i;
>> -        gicc->arm_mpidr = i;
>> +        gicc->arm_mpidr = armcpu->mp_affinity;
>
> As a general rule, hw/ should not be reaching into the CPU state
> struct like this. What is the real HW equivalent of this query?

This is just doing the same thing the hw/arm/virt.c code does
to populate the dt... (In real firmware it would presumably
either (a) have a fixed ACPI table or (b) maybe read the MPIDR,
but neither of those really fits here I think.)

thanks
-- PMM
