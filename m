Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3882802wrg;
        Mon, 24 Jun 2019 08:11:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz7IydKMmvqwJ4RilnSfL3iZEer5K1nfyGy9X+sBYEVBOQOw5KnP1d+gGg6rep4pwAZcbtf
X-Received: by 2002:a17:906:4694:: with SMTP id a20mr117463425ejr.67.1561389096285;
        Mon, 24 Jun 2019 08:11:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561389096; cv=none;
        d=google.com; s=arc-20160816;
        b=AzolOw4rlHLamK+d4B4iqN+tKCrFIW6w2tNL0J9C1fJHymnnH78HZBT4PPlv8NGMIa
         j78RKMHVI2mCpJKAl7NPBAp+xaZVjFj/DmrYj/ftZZUdL6hDpBY2HYkx1pbdLS55JhQJ
         bjwQk6nUE3OrtsBEg1iOw+V21JAzlWF6jXQ7HXxTSVj3y/AG5uFsqX7v8K478y7hHlBR
         OYdnPcTNFVHFTUKlX2F4ETPi3KaXD2H5zSQ71RUGxJM434Vm88PzGHAyPJP4oXUcjpxT
         WAuT9pgulJxegvJt4BrCNqgXiIOUjArsow5D9Ixmezby16po0uew8xpgWv6YH6iKRdxa
         6d3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=CUMJBTuxM7lHaIgVNvYIrObUqCjgENXLFeyJPlp/nYE=;
        b=ZME82Nwm59jv0JN53FPpCZkxUXBQEUcVRtkY/p0FHGJ29s4f5XwAvd6RkcZjDweasi
         jxJDXPhnEAlmn5OTLbe6aFBzpqhnGTfBMVRYbXDus0mxoCZVTWaDJGhMRdcjF/mFkjXN
         vC60xN9yeeh891JLJR7CqlD74pKVfDV0BQvr4nDxK94MfgMWwUdLntGV4gbw8sMIZOCC
         IdPlMIdOswjMGTb/G2MS/NtvfoziaAikfDltRwXs5SiBKuBGoNC+5Cs5VX4i4dJl73qb
         a4Jzgb7+ZNoVvC5PY1FWkejiPoYOsJPCEHpLhZoXbj5fo+9wPfvjoMpmsdQI1lCriC4I
         FZlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f30si9919910edf.183.2019.06.24.08.11.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Jun 2019 08:11:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52154 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hfQd5-0005ZK-AN
	for alex.bennee@linaro.org; Mon, 24 Jun 2019 11:11:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36253)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <lersek@redhat.com>) id 1hfQTU-0007gc-JK
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 11:01:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <lersek@redhat.com>) id 1hfQTS-0002kX-FO
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 11:01:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:53854)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <lersek@redhat.com>)
 id 1hfQTJ-0002LP-PF; Mon, 24 Jun 2019 11:01:29 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E640F30BBE9D;
 Mon, 24 Jun 2019 15:01:19 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-116-226.ams2.redhat.com
 [10.36.116.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BDB915D9D5;
 Mon, 24 Jun 2019 15:01:02 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20190620122132.10075-1-philmd@redhat.com>
 <20190620122132.10075-4-philmd@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <0d19df15-040b-b9e4-936c-d14210fe2c87@redhat.com>
Date: Mon, 24 Jun 2019 17:01:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190620122132.10075-4-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Mon, 24 Jun 2019 15:01:20 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v5 3/3] hw/arm/virt: Use
 edk2_add_host_crypto_policy()
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: a++vzM6bLrGx

On 06/20/19 14:21, Philippe Mathieu-Daud=C3=A9 wrote:
> Enable the EDK2 Crypto Policy features on the Virt machine.
>=20
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  hw/arm/virt.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 431e2900fd..15727b3d59 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -59,6 +59,7 @@
>  #include "hw/intc/arm_gicv3_common.h"
>  #include "kvm_arm.h"
>  #include "hw/firmware/smbios.h"
> +#include "hw/firmware/uefi_edk2.h"
>  #include "qapi/visitor.h"
>  #include "standard-headers/linux/input.h"
>  #include "hw/arm/smmuv3.h"
> @@ -1355,6 +1356,11 @@ static void virt_build_smbios(VirtMachineState *=
vms)
>      }
>  }
> =20
> +static void virt_uefi_setup(VirtMachineState *vms)
> +{
> +    edk2_add_host_crypto_policy(vms->fw_cfg);
> +}
> +
>  static
>  void virt_machine_done(Notifier *notifier, void *data)
>  {
> @@ -1383,6 +1389,7 @@ void virt_machine_done(Notifier *notifier, void *=
data)
> =20
>      virt_acpi_setup(vms);
>      virt_build_smbios(vms);
> +    virt_uefi_setup(vms);
>  }
> =20
>  static uint64_t virt_cpu_mp_affinity(VirtMachineState *vms, int idx)
>=20

Reviewed-by: Laszlo Ersek <lersek@redhat.com>
