Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp2299733wrt;
        Thu, 18 Oct 2018 06:37:51 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61toqGySkt/Pg/uIs+l5WM8Qo0PoTs6YjOCES1WAJaNVLPy4ij47Bl4ozZKabV+/829RaYS
X-Received: by 2002:ae9:c307:: with SMTP id n7-v6mr28609403qkg.70.1539869871718;
        Thu, 18 Oct 2018 06:37:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539869871; cv=none;
        d=google.com; s=arc-20160816;
        b=Ziq1sLdfeknRjaNIwP9lB03BDXO1AX1QfilEivu9WejMWyhrjqz25Qei4/+18I4xFt
         G3DnEF4VePf/E5pracKT7L2XCNwLYScafKpBlAudn07pHuCwXw0bc8xhXjQNXpnAYZ5H
         92mKh/4p4va0mssYKzYauKMkOMK7ZCqXizOanR822ibG+NDOPKbg1nqOT1UXaBRCGBgi
         pyeqapA36RT47O9wjLc1V32MybVQqw9+3rXqcKK0vjdybcBCGBVjR3/sNfHNwA9qV01x
         lWI21TPv9Y084UWPKB3huCGko7W813CMVPblpqqA06R7hyKlRYf7EopuIsa4I5KZrq4W
         kPWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature;
        bh=V7MsKepnGTdSoTNGng/GdvKGt7imA6uQ9G5BYHREmCA=;
        b=kb35ykOz1Th3azM7coViBrQKnB3+yUFvuzglMMauaSX2+FkRYtDBQSq9uCcSo7x5Z0
         IxUa3KbnXqv4ewnUplOCT3QvKjay7upqSgPhtdS9+PMIhgz8Tk6t/tWasn/U+G3vc4JL
         4jsMfDUYnavKGYm1h2Ap5atU7lydNZasf2gmYCX9KUYg92RTgKrNyHgQdIq0+z8dg3H4
         vJv/z+GRGSRvM3V1jRWHxZR6fSpuP/AMDoV4tGB7ShbVzXmx2fEevJmEOJYBV15QLkFE
         cU18wDsLPYE1MkIy7MJFlct+zHiX0mMybb5Q1OM8syb55p6+szpgqnswhATUwCFQwaOU
         q3RA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dP1VmTCZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r13-v6si3646244qtt.38.2018.10.18.06.37.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Oct 2018 06:37:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=dP1VmTCZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42459 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gD8Up-0003x8-8b
	for alex.bennee@linaro.org; Thu, 18 Oct 2018 09:37:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48890)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gD8Ua-0003tx-Db
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 09:37:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gD8UZ-0004QS-C7
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 09:37:36 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:32980)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gD8UZ-0004OR-5c
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 09:37:35 -0400
Received: by mail-ot1-x341.google.com with SMTP id q50so29789892otd.0
	for <qemu-arm@nongnu.org>; Thu, 18 Oct 2018 06:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=V7MsKepnGTdSoTNGng/GdvKGt7imA6uQ9G5BYHREmCA=;
	b=dP1VmTCZYldYUf0rwNu4eE/ij8YIVsNw0huHkn0fRPzhvBg6IuVSdEKvU4U2YQLG0H
	ZCk7cgSkXQMFP708pvG6UmZfV8AT0iwbTyl/rXVlKU4ZGXCRNSBSZIZunjnKGrunk8f7
	qbRRAHfKyD6bfustxQkOmxawcy0C/WrznKvyM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=V7MsKepnGTdSoTNGng/GdvKGt7imA6uQ9G5BYHREmCA=;
	b=dpR4Pbc/AmdXK48vh3rj+Il8gYRJ4DBLug4eONAfzwED+w9s/i7VbF1ivi2AbB8XOJ
	0y/ixUFhpccPKt1Vf9Vweh6VYHEphV21fFySdIYNalyL9yi84rJ93PaDsXMQOAUXq/ld
	OXoQb8LxyI0pximfM1+fVsnpbb+xrPk4weqNzBm0G5kx7zsds07LgdMHb9x3PGgE9NlL
	vPjLp7lX1crLrG9cRy9Gs8EwmKL5pMzgsJPdmDVfmOYKhTPaipAM6urG3DQ5YHJyrtNo
	FD0xDUSdL+U8WzYBXGBNgjXWvKw2y9LppbDA324r3Es9F5sDbRyDn3OBLleplTEiwCX3
	/DnA==
X-Gm-Message-State: ABuFfoiP8gnvSnoIQpjS5WMZMJwD51dhxqq4dDfyhQO8xb3IgvPHwqqk
	KsJXjjtCX4xuSJkLPc2UQWMFVNgKJ+hjn+4XAXYe4x1l8ZQ=
X-Received: by 2002:a9d:1ea3:: with SMTP id n32mr18522414otn.352.1539869853070;
	Thu, 18 Oct 2018 06:37:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:7c90:0:0:0:0:0 with HTTP; Thu, 18 Oct 2018 06:37:12
	-0700 (PDT)
In-Reply-To: <20181018130434.23237-5-philmd@redhat.com>
References: <20181018130434.23237-1-philmd@redhat.com>
	<20181018130434.23237-5-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Oct 2018 14:37:12 +0100
Message-ID: <CAFEAcA-WC1vRmGH0t87hHFtMNTRW16xYy5R4kqickohNhECOPw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-arm] [PATCH v3 4/4] hw/arm/virt: Use the pvpanic device
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
Cc: Hu Tao <hutao@cn.fujitsu.com>, Peng Hao <peng.hao2@zte.com.cn>,
	"open list:ARM" <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Wen Congyang <wency@cn.fujitsu.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7rlxD6X3FDCT

On 18 October 2018 at 14:04, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com=
> wrote:
> Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> [PMD: Use TYPE_PVPANIC definition, split in 2 patches]
> ---
>  default-configs/arm-softmmu.mak |  2 +-
>  hw/arm/virt.c                   | 21 +++++++++++++++++++++
>  include/hw/arm/virt.h           |  1 +
>  3 files changed, 23 insertions(+), 1 deletion(-)
>
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
> index 2420491aac..def07fa095 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -43,7 +43,7 @@ CONFIG_USB_MUSB=3Dy
>  CONFIG_USB_EHCI_SYSBUS=3Dy
>  CONFIG_PLATFORM_BUS=3Dy
>  CONFIG_VIRTIO_MMIO=3Dy
> -
> +CONFIG_PVPANIC=3Dy
>  CONFIG_ARM11MPCORE=3Dy
>  CONFIG_A9MPCORE=3Dy
>  CONFIG_A15MPCORE=3Dy
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 9f677825f9..40469e6785 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -59,6 +59,7 @@
>  #include "qapi/visitor.h"
>  #include "standard-headers/linux/input.h"
>  #include "hw/arm/smmuv3.h"
> +#include "hw/misc/pvpanic.h"
>
>  #define DEFINE_VIRT_MACHINE_LATEST(major, minor, latest) \
>      static void virt_##major##_##minor##_class_init(ObjectClass *oc, \
> @@ -140,6 +141,7 @@ static const MemMapEntry a15memmap[] =3D {
>      [VIRT_UART] =3D               { 0x09000000, 0x00001000 },
>      [VIRT_RTC] =3D                { 0x09010000, 0x00001000 },
>      [VIRT_FW_CFG] =3D             { 0x09020000, 0x00000018 },
> +    [VIRT_PVPANIC_MMIO] =3D       { 0x09020018, 0x00000002 },

This shouldn't be in the same physical 64K page as the preceding device:
we carefully keep them all separate so that the guest can give them
separate MMU permissions if it wants.

>      [VIRT_GPIO] =3D               { 0x09030000, 0x00001000 },
>      [VIRT_SECURE_UART] =3D        { 0x09040000, 0x00001000 },
>      [VIRT_SMMU] =3D               { 0x09050000, 0x00020000 },
> @@ -802,6 +804,23 @@ static void create_gpio(const VirtMachineState *vms,=
 qemu_irq *pic)
>      g_free(nodename);
>  }
>
> +static void create_pvpanic_device(const VirtMachineState *vms)
> +{
> +    char *nodename;
> +    hwaddr base =3D vms->memmap[VIRT_PVPANIC_MMIO].base;
> +    hwaddr size =3D vms->memmap[VIRT_PVPANIC_MMIO].size;
> +
> +    sysbus_create_simple(TYPE_PVPANIC, base, NULL);
> +
> +    nodename =3D g_strdup_printf("/pvpanic-mmio@%" PRIx64, base);
> +    qemu_fdt_add_subnode(vms->fdt, nodename);
> +    qemu_fdt_setprop_string(vms->fdt, nodename,
> +                            "compatible", "pvpanic,mmio");
> +    qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "reg",
> +                                 2, base, 2, size);

This doesn't seem to be an official DT binding. It would need to be
accepted upstream (ie in the kernel's Documentation/devicetree/bindings/)
before we could add the device in QEMU.

What about an ACPI table entry?

Does this really need to be an MMIO device, rather than a PCI device?
Being a PCI device would avoid all of these issues:
 * having to specify a dt binding
 * having to specify an ACPI binding
 * having to either have the thing always present, or some custom
   way for the user to enable/disable it
plus it means it's available for other boards and architectures than
just the Arm virt board.

I'd also like some confirmation from folks more familiar with the
current state of the art in guest-to-management-layer communication
that pvpanic is still the recommended way to achieve this goal,
and hasn't been obsoleted by something else.

thanks
-- PMM
