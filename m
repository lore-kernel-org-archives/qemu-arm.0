Received: by 10.223.159.74 with SMTP id f10csp3931161wrg;
        Tue, 12 Dec 2017 07:09:37 -0800 (PST)
X-Google-Smtp-Source: ACJfBouwYA07x/56++eua/rk+1GuGuXZIgd7DPkvA+gMkXJ4nFrXZJ5ASsuW77nAg3cSfj46fE//
X-Received: by 10.13.221.133 with SMTP id g127mr2956514ywe.125.1513091377518;
        Tue, 12 Dec 2017 07:09:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513091377; cv=none;
        d=google.com; s=arc-20160816;
        b=mMGGYZ8FoQWS0BcckVuoUhWTItj+kJsLaDkiTlA2DqtADFGUnirOeIkE9jm4T77YdU
         O/LklkNcthDdVDBv4gegfn9WTLWBPhfbpHFzM/TBz5uvQCrFg+L6XzbBtCgC2nG2IiuP
         8uv9bZZqbqqP9w5+/1Nnf5IbmJBfB7dMtsoyOUmp/ndJSxu7nkGumo1MH+1TyXJeNeVF
         xcjw+d4PJXTpfHnCl2vjs7KnYm/+GDzZo8AL8pKbQxBiSCpnUVUooYZ22wr83Uk0+0UH
         vg0W2rdpcw6tY3sRMeaQ2ZymxC0yTPgJmLTCw5pD7HK5UWhR1HqSbRizuCsvGi9HieJ0
         tLkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=2K4dq+1it3Bv9Wyei3KeEZMFo+yz9Y/HMcZTFxrvB9E=;
        b=dBMO+U3tykmlR+ZgsZytXCtT9qh1ZhxsMAt/83a9bpy7DwUnWQZZcVgWrkf9/AeWWG
         /P/RnxGPqDHMDGfigLGSlj2t+EfcVJ++UoPIOZ4wCTjriGaTWZ94ZY9KYvNw9dzEvzYb
         4bYltVdeAureCdrsEY5nwaCFjmwVacN6h+Mu5QlwcuwOsdP8VXTn+2F5Z45P5npGC6QT
         vWaztVrlJ/Zvfh17vCf1/zC1H+cbbMDXcROHYlbidmUmbzTOtrWKj7gD0eRB1qiuwi3W
         +GIRkirS9ivTIM+5B2MXqzTyzVkRsFXNC+xV5tgHDMzYwx/MFZMW/hoTWBC5SPj6dYC9
         uGAg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m66si3381867ywb.608.2017.12.12.07.09.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Dec 2017 07:09:37 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:58874 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eOmBd-00081z-0S
	for alex.bennee@linaro.org; Tue, 12 Dec 2017 10:09:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58351)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1eOmBR-00080t-0P
	for qemu-arm@nongnu.org; Tue, 12 Dec 2017 10:09:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1eOmBO-0004yz-Fq
	for qemu-arm@nongnu.org; Tue, 12 Dec 2017 10:09:25 -0500
Received: from mx1.redhat.com ([209.132.183.28]:45034)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1eOmBO-0004yL-6e; Tue, 12 Dec 2017 10:09:22 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4261EC070E31;
	Tue, 12 Dec 2017 15:09:20 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D6B676266F;
	Tue, 12 Dec 2017 15:09:14 +0000 (UTC)
Date: Tue, 12 Dec 2017 16:09:12 +0100
From: Andrew Jones <drjones@redhat.com>
To: Laszlo Ersek <lersek@redhat.com>
Message-ID: <20171212150912.b5oc4dz5hxcex22q@kamzik.brq.redhat.com>
References: <1512745328-5109-1-git-send-email-peter.maydell@linaro.org>
	<1512745328-5109-4-git-send-email-peter.maydell@linaro.org>
	<5A2F6ED9.5030605@huawei.com>
	<ac182406-8011-9f19-38e7-37328434095b@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ac182406-8011-9f19-38e7-37328434095b@redhat.com>
User-Agent: Mutt/1.6.0.1 (2016-04-01)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Tue, 12 Dec 2017 15:09:20 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 3/3] hw/arm/virt-acpi-build: Add
 second UART to ACPI tables
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>,
	qemu-devel@nongnu.org, Andrea Bolognani <abologna@redhat.com>,
	qemu-arm@nongnu.org, Shannon Zhao <zhaoshenglong@huawei.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zDkWX6PqoqvM

On Tue, Dec 12, 2017 at 12:06:39PM +0100, Laszlo Ersek wrote:
> On 12/12/17 06:53, Shannon Zhao wrote:
> > 
> > 
> > On 2017/12/8 23:02, Peter Maydell wrote:
> >> Add the second UART to the ACPI tables.
> >>
> >> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> >> ---
> >> Pure guesswork, as I don't have a UEFI setup to hand and
> >> am not familiar with ACPI table formats either...
> >> ---
> >>  hw/arm/virt-acpi-build.c | 5 +++++
> >>  1 file changed, 5 insertions(+)
> >>
> >> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> >> index 3d78ff6..a38287b 100644
> >> --- a/hw/arm/virt-acpi-build.c
> >> +++ b/hw/arm/virt-acpi-build.c
> >> @@ -689,6 +689,7 @@ static void build_fadt(GArray *table_data, BIOSLinker *linker,
> >>  static void
> >>  build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> >>  {
> >> +    VirtMachineClass *vmc = VIRT_MACHINE_GET_CLASS(vms);
> >>      Aml *scope, *dsdt;
> >>      const MemMapEntry *memmap = vms->memmap;
> >>      const int *irqmap = vms->irqmap;
> >> @@ -706,6 +707,10 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> >>      acpi_dsdt_add_cpus(scope, vms->smp_cpus);
> >>      acpi_dsdt_add_uart(scope, &memmap[VIRT_UART],
> >>                         (irqmap[VIRT_UART] + ARM_SPI_BASE));
> >> +    if (!vmc->no_second_uart) {
> >> +        acpi_dsdt_add_uart(scope, &memmap[VIRT_UART_2],
> >> +                           (irqmap[VIRT_UART_2] + ARM_SPI_BASE));
> >> +    }
> >>      acpi_dsdt_add_flash(scope, &memmap[VIRT_FLASH]);
> >>      acpi_dsdt_add_fw_cfg(scope, &memmap[VIRT_FW_CFG]);
> >>      acpi_dsdt_add_virtio(scope, &memmap[VIRT_MMIO],
> >>
> > Reviewed-by: Shannon Zhao <zhaoshenglong@huawei.com>
> > 
> 
> (Responding here so I don't have to manually update Shannon's email
> address while replying to patch 3/3 directly.)
> 
> acpi_dsdt_add_uart() does:
> 
>     Aml *dev = aml_device("COM0");
>     aml_append(dev, aml_name_decl("_HID", aml_string("ARMH0011")));
>     aml_append(dev, aml_name_decl("_UID", aml_int(0)));
> 
> The device name should be unique. Plus, within the same _HID, the _UID
> should be unique as well. I suggest adding another unsigned parameter to
> acpi_dsdt_add_uart(), and hooking it into COMx and _UID.

Yes, I agree with Laszlo here (and confirmed with Igor). Also, if memory
serves me, the _ADR part of acpi_dsdt_add_uart() is only there to deal
with early Linux ACPI support not finding the console UART correctly.
I believe it does now, meaning the _ADR could even be removed for COM0,
and we certainly don't want it for COM1 because it's point is to find
COM0, so the new unsigned parameter should also be used as condition for
it. A later patch could remove it altogether.

Thanks,
drew
