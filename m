Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp632218wrt;
        Tue, 20 Nov 2018 06:33:13 -0800 (PST)
X-Google-Smtp-Source: AFSGD/V6XE5tNtL+t3Le9dmv3hkdfSKU+/nePH23Q0eTgxtlHF55pHcXznMfepdUtlVxZuuVQbtf
X-Received: by 2002:a25:46c5:: with SMTP id t188-v6mr2045658yba.108.1542724393627;
        Tue, 20 Nov 2018 06:33:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542724393; cv=none;
        d=google.com; s=arc-20160816;
        b=jLkXWolLGXqx2W1Id5QCXyR50YKfff76uMwAnprXn3qgz6OfdJFzDML/Z832tALkan
         AMvu17WyONMnNqxqPoH3Dn3yG5JVJaAWVqgs3aNN63oNb0pRFlJNQrbugAGNCYBffykV
         aVuNJwVHhvYYO10mpcHImEhl82K1CNrX6IbRiT0W+eQ30jKvcyjk7vCw+cWkKsb9/nnf
         Xiu//hsTdRS/Uz0EQAX3CKsQD8Tv2nWE25fx61pYDV+QXrvxhwsrKZDoCSWRIfZu1sxr
         scK7p42tEy1kSb+R4DcT37g37LzczFVVfxTBc/x/MVkjD0L3SKK1rDgAdGKVwc+MmXPy
         0mrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature;
        bh=KA0d7qfBGKgnxJ0nItrMW7Yq7F5F82+O6PhV1meWwNE=;
        b=bkEO1+JesALCXtl01CFRyIWb9U/DSOginTets3yIIsdlmHkIDFge41xn5PT55u7GBM
         3K/0dFL6FLiFBnRu1v9JccHz+10FMq19vleL3gbi4jsKuw61I3VXiobddHB5x+9kg+Rn
         S8/EW10VqK1N92o8SdQJaejO/OenjT5FuQO9hdFrW5q0LCEmUeE92u1JUhupE4iX5k7K
         7nKjJfpy55zazgxnJ0D/qmBjls0W7VdSw7MNG/6+T8QJkVJX/jDH/GEgMdvoR2vrOXqq
         FfbT6E0Ezoih/MaT+QegKp1G5GM79PWshGNnxt2ZCgeQeWtODDwfYW5fV+lWk1/9og8X
         1EYQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XXTXR0RS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t96-v6si25912909ybi.263.2018.11.20.06.33.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 20 Nov 2018 06:33:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XXTXR0RS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34076 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gP75V-0006Qo-3Q
	for alex.bennee@linaro.org; Tue, 20 Nov 2018 09:33:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41080)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gP75G-0006NQ-MO
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 09:32:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gP75F-0008N1-Pu
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 09:32:58 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:33329)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gP75F-0008Mh-L9
	for qemu-arm@nongnu.org; Tue, 20 Nov 2018 09:32:57 -0500
Received: by mail-oi1-x244.google.com with SMTP id c206so1658308oib.0
	for <qemu-arm@nongnu.org>; Tue, 20 Nov 2018 06:32:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=KA0d7qfBGKgnxJ0nItrMW7Yq7F5F82+O6PhV1meWwNE=;
	b=XXTXR0RSCGNj4j3r6CZ0agjwb3amsrsNSMpReziYCoDzfc09lDYLEB5+bncIhOsY00
	3CjUzWlbO932z5QkEzaUiWwTzo3UvRW8boAYc6xMrmkKRvxaRi5ZPKyoNqzxwaNl+SQ6
	0D7vxAeZIe4+cVHi/PP2sXbGAMTNbUhS0Bw40=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=KA0d7qfBGKgnxJ0nItrMW7Yq7F5F82+O6PhV1meWwNE=;
	b=TMmjbxQSWJaXhH6RvDREwg2aKs/3UQTxGsGMgFIRZ4c0REnWsH9d+5vx40UTCaqE2x
	YZfB1jkAQRyltl0J7DBoQXqrynxl72litQzyFWSvk+oAaHdl8jZXy/XjFkke2X6lYJsD
	4NpvUZkyW+biMU8PPZHE7eLZSIV6PoXUmcvppjosMQRbueP1dcVaJvFVOOjypz2jso3H
	yCSB1C/ahDBpAKN21o1/ACfb+GjdVgZM1Ql9/7nPwRZRKoKgGUN8iK5iO43pJXC2ioOR
	J+UMVcRpkAUyXOmgXIYEAXVdV95RhI4vkhg+1DjZE9Q/WTEDVNF26FOoSwSta6zNm5CE
	WF8w==
X-Gm-Message-State: AGRZ1gIP/pTGAfyTK5iitPUFsUy2ixEL6xgUWkj2vDmqeqAoa2LCeOZB
	v6JL612q1nqO300lJcaCEi5JTAFjF54sfzsV9RCL6w==
X-Received: by 2002:aca:f1d6:: with SMTP id
	p205-v6mr1272063oih.332.1542724377056; 
	Tue, 20 Nov 2018 06:32:57 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP; Tue, 20 Nov 2018 06:32:36
	-0800 (PST)
In-Reply-To: <1542365406-81310-5-git-send-email-peng.hao2@zte.com.cn>
References: <1542365406-81310-1-git-send-email-peng.hao2@zte.com.cn>
	<1542365406-81310-5-git-send-email-peng.hao2@zte.com.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Nov 2018 14:32:36 +0000
Message-ID: <CAFEAcA-u=_kq66ZxawHhGCjkKjCo=urw7W3GfOwYK00AMRfWjg@mail.gmail.com>
To: Peng Hao <peng.hao2@zte.com.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-arm] [PATCH V7 4/6] hw/arm/virt: Use the pvpanic device
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pBzZzzRICWaL

On 16 November 2018 at 10:50, Peng Hao <peng.hao2@zte.com.cn> wrote:
>  Add pvpanic device in arm virt machine.
>
> Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  default-configs/arm-softmmu.mak |  1 +
>  hw/arm/virt.c                   | 21 +++++++++++++++++++++
>  include/hw/arm/virt.h           |  1 +
>  3 files changed, 23 insertions(+)
>
> diff --git a/default-configs/arm-softmmu.mak b/default-configs/arm-softmm=
u.mak
> index 2420491..50345df 100644
> --- a/default-configs/arm-softmmu.mak
> +++ b/default-configs/arm-softmmu.mak
> @@ -159,3 +159,4 @@ CONFIG_PCI_DESIGNWARE=3Dy
>  CONFIG_STRONGARM=3Dy
>  CONFIG_HIGHBANK=3Dy
>  CONFIG_MUSICPAL=3Dy
> +CONFIG_PVPANIC=3Dy
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 9f67782..c4f29c8 100644
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
> @@ -143,6 +144,7 @@ static const MemMapEntry a15memmap[] =3D {
>      [VIRT_GPIO] =3D               { 0x09030000, 0x00001000 },
>      [VIRT_SECURE_UART] =3D        { 0x09040000, 0x00001000 },
>      [VIRT_SMMU] =3D               { 0x09050000, 0x00020000 },
> +    [VIRT_PVPANIC] =3D            { 0x09070000, 0x00000002 },
>      [VIRT_MMIO] =3D               { 0x0a000000, 0x00000200 },
>      /* ...repeating for a total of NUM_VIRTIO_TRANSPORTS, each of that s=
ize */
>      [VIRT_PLATFORM_BUS] =3D       { 0x0c000000, 0x02000000 },
> @@ -190,6 +192,23 @@ static bool cpu_type_valid(const char *cpu)
>      return false;
>  }
>
> +static void create_pvpanic_device(const VirtMachineState *vms)
> +{
> +    char *nodename;
> +    hwaddr base =3D vms->memmap[VIRT_PVPANIC].base;
> +    hwaddr size =3D vms->memmap[VIRT_PVPANIC].size;
> +
> +    sysbus_create_simple(TYPE_PVPANIC_MMIO, base, NULL);
> +
> +    nodename =3D g_strdup_printf("/pvpanic-mmio@%" PRIx64, base);
> +    qemu_fdt_add_subnode(vms->fdt, nodename);
> +    qemu_fdt_setprop_string(vms->fdt, nodename,
> +                            "compatible", "qemu,pvpanic-mmio");
> +    qemu_fdt_setprop_sized_cells(vms->fdt, nodename, "reg",
> +                                 2, base, 2, size);

Note that we can't take these patches into QEMU until the device
tree binding has been agreed upstream and accepted into the kernel.

> +    g_free(nodename);
> +}
> +
>  static void create_fdt(VirtMachineState *vms)
>  {
>      void *fdt =3D create_device_tree(&vms->fdt_size);
> @@ -1531,6 +1550,8 @@ static void machvirt_init(MachineState *machine)
>
>      create_flash(vms, sysmem, secure_sysmem ? secure_sysmem : sysmem);
>
> +    create_pvpanic_device(vms);
> +
>      create_gic(vms, pic);

As Shannon suggests, we should not be creating this device by default.

thanks
-- PMM
