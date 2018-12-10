Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3713878wrt;
        Mon, 10 Dec 2018 07:11:02 -0800 (PST)
X-Google-Smtp-Source: AFSGD/Xs63JTQ0hZhtKscDzrFVmXB+CpQc/Xs2A2zXzEQOv0x58/LdFfs6prGqh6uEeyDYJ3ObHs
X-Received: by 2002:a0c:d29b:: with SMTP id q27mr11840122qvh.62.1544454662362;
        Mon, 10 Dec 2018 07:11:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544454662; cv=none;
        d=google.com; s=arc-20160816;
        b=JlXEtf4K258Kki8PTY7mAULCjQGoNRkXTM9CqDwo8wUgK6bnTnyD7nr9bUec/bLFoy
         rgwuiNk8d/+uCYbH5hhYQZZBhfWxCe+3tDyAcqcoxe4YmJT9mrzg9LZYN05suKvFUvuT
         0ZsnGY6vrVT30s2W5mKq27eYRCaH/7W6xrWOUvtK+709D1ygL/RuEQVALHYW9SPaWNAF
         SPMg4jMZHX6knSMSCU6Dvn+6+dgi9UJKL0NWvhJr4Xg3bI7pyonSCMyt7Q3DNUJLBDqz
         yCUfFk39YiQHrvbzjzKynlj4Y+9bUeNICE17K2J0bbMvMgYZ7BySGvpKiad5068oXOlv
         h8EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=Y+u4bjpfmpvX0y+MqLxIkgvdOx74xe1HOE+MmkuYXEk=;
        b=u+6jpzyfdjUumAuvrGsdqCaGcrCqp/gquydwjH2ikZt2J8BzCvCBICWnl3u2ID0mOP
         +U0YrutjWYw0kM3/1EvHSdPXvkEz4DRq6eIhpDgSgHHUydGNU/St6agUVHGSz2xARk7A
         rFOHYXInKgc7QTrDNb5z3mG0OWJCc2htACXhUdlwCmrcCgNstt+OXIPunpkcCmDfIfgt
         XlL96U8kROBwzw2RXgH7SP8SB/Alpy5T/GDNCxnpVyHNR1jMe8zQqXcPW7Eh620V6/qN
         7beorgendKfenmOuLt7re+Ny7MCjOF26PYIl43I85WX8w9UjENjf2oCdxSd96TAFBp5T
         fNuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b23si3845130qto.84.2018.12.10.07.11.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 10 Dec 2018 07:11:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33245 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gWND3-0007q4-7F
	for alex.bennee@linaro.org; Mon, 10 Dec 2018 10:11:01 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36471)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1gWNCr-0007lc-67
	for qemu-arm@nongnu.org; Mon, 10 Dec 2018 10:10:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1gWNCn-00009t-2L
	for qemu-arm@nongnu.org; Mon, 10 Dec 2018 10:10:49 -0500
Received: from mx1.redhat.com ([209.132.183.28]:64037)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lersek@redhat.com>)
	id 1gWNCl-0008ME-6v; Mon, 10 Dec 2018 10:10:44 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 83FF44E902;
	Mon, 10 Dec 2018 15:10:41 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-124-101.rdu2.redhat.com
	[10.10.124.101])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7FE281059588;
	Mon, 10 Dec 2018 15:10:29 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>,
	"Michael S . Tsirkin" <mst@redhat.com>, Corey Minyard <minyard@acm.org>,
	Peter Maydell <peter.maydell@linaro.org>
References: <20181207165103.3992-1-philmd@redhat.com>
	<20181207165103.3992-5-philmd@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <59daee09-d797-3340-3fd3-c6d521d2cf68@redhat.com>
Date: Mon, 10 Dec 2018 16:10:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20181207165103.3992-5-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Mon, 10 Dec 2018 15:10:41 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 4/4] hw/smbios: Move to the hw/firmware/
 namespace
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: u/N7+Et3kNFt

On 12/07/18 17:51, Philippe Mathieu-Daud=C3=A9 wrote:
> SMBIOS is just another firmware used by some QEMU models.
> We will later introduce more firmwares in this namespace.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  MAINTAINERS                              | 2 +-
>  hw/arm/virt.c                            | 2 +-
>  hw/i386/pc.c                             | 2 +-
>  hw/i386/pc_piix.c                        | 2 +-
>  hw/i386/pc_q35.c                         | 2 +-
>  hw/smbios/smbios-stub.c                  | 2 +-
>  hw/smbios/smbios.c                       | 2 +-
>  hw/smbios/smbios_type_38.c               | 2 +-
>  include/hw/{smbios =3D> firmware}/smbios.h | 0
>  tests/bios-tables-test.c                 | 2 +-
>  vl.c                                     | 2 +-
>  11 files changed, 10 insertions(+), 10 deletions(-)
>  rename include/hw/{smbios =3D> firmware}/smbios.h (100%)

(1) Please replace the word "namespace" in the subject, and in the
commit message too, with "subdirectory".

(2) Please replace "firmware" -- both instances -- in the commit message
with "firmware interface", or perhaps "firmware specification".

With the updates:

Reviewed-by: Laszlo Ersek <lersek@redhat.com>

Thanks,
Laszlo


> diff --git a/MAINTAINERS b/MAINTAINERS
> index 63effdc473..f7ba25c146 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1238,7 +1238,7 @@ M: Michael S. Tsirkin <mst@redhat.com>
>  M: Igor Mammedov <imammedo@redhat.com>
>  S: Supported
>  F: include/hw/acpi/*
> -F: include/hw/smbios/*
> +F: include/hw/firmware/smbios.h
>  F: hw/mem/*
>  F: hw/acpi/*
>  F: hw/smbios/*
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index f69e7eb399..49813bca1b 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -55,7 +55,7 @@
>  #include "hw/intc/arm_gic.h"
>  #include "hw/intc/arm_gicv3_common.h"
>  #include "kvm_arm.h"
> -#include "hw/smbios/smbios.h"
> +#include "hw/firmware/smbios.h"
>  #include "qapi/visitor.h"
>  #include "standard-headers/linux/input.h"
>  #include "hw/arm/smmuv3.h"
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index f095725dba..afa1098082 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -37,7 +37,7 @@
>  #include "hw/pci/pci_bus.h"
>  #include "hw/nvram/fw_cfg.h"
>  #include "hw/timer/hpet.h"
> -#include "hw/smbios/smbios.h"
> +#include "hw/firmware/smbios.h"
>  #include "hw/loader.h"
>  #include "elf.h"
>  #include "multiboot.h"
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 7092d6d13f..e3ee3091d2 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -30,7 +30,7 @@
>  #include "hw/i386/pc.h"
>  #include "hw/i386/apic.h"
>  #include "hw/display/ramfb.h"
> -#include "hw/smbios/smbios.h"
> +#include "hw/firmware/smbios.h"
>  #include "hw/pci/pci.h"
>  #include "hw/pci/pci_ids.h"
>  #include "hw/usb.h"
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index 4702bb13c4..bc31cd5822 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -47,7 +47,7 @@
>  #include "hw/i386/amd_iommu.h"
>  #include "hw/i386/intel_iommu.h"
>  #include "hw/display/ramfb.h"
> -#include "hw/smbios/smbios.h"
> +#include "hw/firmware/smbios.h"
>  #include "hw/ide/pci.h"
>  #include "hw/ide/ahci.h"
>  #include "hw/usb.h"
> diff --git a/hw/smbios/smbios-stub.c b/hw/smbios/smbios-stub.c
> index d3a385441a..64e5ba93ec 100644
> --- a/hw/smbios/smbios-stub.c
> +++ b/hw/smbios/smbios-stub.c
> @@ -23,7 +23,7 @@
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
>  #include "qapi/qmp/qerror.h"
> -#include "hw/smbios/smbios.h"
> +#include "hw/firmware/smbios.h"
> =20
>  void smbios_entry_add(QemuOpts *opts, Error **errp)
>  {
> diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
> index 9d737642cb..2a61f38637 100644
> --- a/hw/smbios/smbios.c
> +++ b/hw/smbios/smbios.c
> @@ -24,7 +24,7 @@
>  #include "sysemu/sysemu.h"
>  #include "qemu/uuid.h"
>  #include "sysemu/cpus.h"
> -#include "hw/smbios/smbios.h"
> +#include "hw/firmware/smbios.h"
>  #include "hw/loader.h"
>  #include "exec/cpu-common.h"
>  #include "smbios_build.h"
> diff --git a/hw/smbios/smbios_type_38.c b/hw/smbios/smbios_type_38.c
> index a1ad28d059..0c08f282de 100644
> --- a/hw/smbios/smbios_type_38.c
> +++ b/hw/smbios/smbios_type_38.c
> @@ -9,7 +9,7 @@
> =20
>  #include "qemu/osdep.h"
>  #include "hw/ipmi/ipmi.h"
> -#include "hw/smbios/smbios.h"
> +#include "hw/firmware/smbios.h"
>  #include "qemu/error-report.h"
>  #include "smbios_build.h"
> =20
> diff --git a/include/hw/smbios/smbios.h b/include/hw/firmware/smbios.h
> similarity index 100%
> rename from include/hw/smbios/smbios.h
> rename to include/hw/firmware/smbios.h
> diff --git a/tests/bios-tables-test.c b/tests/bios-tables-test.c
> index d661d9be62..dfa74a5bec 100644
> --- a/tests/bios-tables-test.c
> +++ b/tests/bios-tables-test.c
> @@ -13,7 +13,7 @@
>  #include "qemu/osdep.h"
>  #include <glib/gstdio.h>
>  #include "qemu-common.h"
> -#include "hw/smbios/smbios.h"
> +#include "hw/firmware/smbios.h"
>  #include "qemu/bitmap.h"
>  #include "acpi-utils.h"
>  #include "boot-sector.h"
> diff --git a/vl.c b/vl.c
> index a5ae5f23d2..bfc3114dd4 100644
> --- a/vl.c
> +++ b/vl.c
> @@ -61,7 +61,7 @@ int main(int argc, char **argv)
>  #include "hw/display/vga.h"
>  #include "hw/bt.h"
>  #include "sysemu/watchdog.h"
> -#include "hw/smbios/smbios.h"
> +#include "hw/firmware/smbios.h"
>  #include "hw/acpi/acpi.h"
>  #include "hw/xen/xen.h"
>  #include "hw/qdev.h"
>=20

