Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp721178lfp;
        Thu, 23 Jan 2020 06:27:09 -0800 (PST)
X-Google-Smtp-Source: APXvYqyoEUkEaOIDq1a7dW1cdtNsQXwP/tNQ2vwxhKKUFN+0mOvIAK/s6dabNpGRdbY79Qr+NHQk
X-Received: by 2002:a37:9e12:: with SMTP id h18mr12853833qke.420.1579789628897;
        Thu, 23 Jan 2020 06:27:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579789628; cv=none;
        d=google.com; s=arc-20160816;
        b=zwqy/Qf0Qe0P+vxWrzjdV2EttKND5x79HxP0iivYCFP8hR7OwSmgYq3vsArdS++HGo
         VZ+XbxzGChUkTLK2sC1BnBP6fHD/aCpeGesQLcwxkRBmmft6rhkYkUoEbhG1nTP16oAO
         3B9ZM6XALMEme2MqRVC5JPMjVWYe7ZaSH9F1S9zspurRaFsAFvQ0sDbz11ZofFcwwV1Z
         OamNXV6+D6Hmc8kKJYHQ99CNRoSe+yo4ES9fjNExNUpKM13hERx9DDTmOWI3PBL088cV
         YzX+Gqjuv/ImPwJbV3ujAXOV/2FbQW3M04ycVzYPYMWfQpZudy8TJGu93P14/I5nPXHv
         exSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition
         :content-transfer-encoding:in-reply-to:mime-version:references
         :message-id:subject:to:from:date:dkim-signature;
        bh=OIHo9nSGeSNM1Jx0RaQGNR+am3PYYKn0cacxfBZ/Pr4=;
        b=qykjfzHOxAZ17gG40H6lMO5tH2NvQz+i/HcJBn/s0yRyJzeJRp1jk+t7jDXwZMhc8N
         LzhwVRy/16VJGLPszixK7vlNedVVy/e+P0am+0eQAoNxMlgr/IomDOp65xUllKzfTW5t
         C1olTB6pqlstyCWptUv3gE6WP/Z9JoWLwfMdm+wzvokYHRhxLCjp2YIEGh+9EtjVznUK
         /uZ631y944Ku+mInsCXhXHubqLoZzfAxo2YcLpJTpdvXGou4Zx506luwev/4NLuZ53Ap
         1l93evQ8lxjDzctYVleUHYzIsxlDVQZSFA98zdC/Y1rTabTgPBxulKaaWW0BBKQGCV2e
         VXJg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Mo4g760O;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d15si1501690qtc.170.2020.01.23.06.27.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Jan 2020 06:27:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=Mo4g760O;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:57970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iudRr-0003Qs-Lm
	for alex.bennee@linaro.org; Thu, 23 Jan 2020 09:27:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37680)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <drjones@redhat.com>) id 1iuc4u-00022m-G0
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 07:59:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1iuc4s-0003S1-DZ
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 07:59:19 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:31958
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>) id 1iuc4s-0003Ok-9N
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 07:59:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579784357;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OIHo9nSGeSNM1Jx0RaQGNR+am3PYYKn0cacxfBZ/Pr4=;
 b=Mo4g760O8QA/wZQAkhDvkOPwGtNMmqgXlTOygwjj8XClGCgKfAOMRIwi3YCjbmx7LJbmUQ
 TOc9YNUl6CbCvfWFXuAyY8FBvGkOdrndZC79IrMrqGGd6bl26m2RT6yPxQrWfqkVB1Qiyb
 2UozzOyB45cMRvxJ7PnlJvnmTT0hlBU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-381-MUcgccStOrC0hQlsGnVWHA-1; Thu, 23 Jan 2020 07:59:13 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B88FB108597E;
 Thu, 23 Jan 2020 12:59:12 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C24711001920;
 Thu, 23 Jan 2020 12:59:11 +0000 (UTC)
Date: Thu, 23 Jan 2020 13:59:09 +0100
From: Andrew Jones <drjones@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH REPOST v3 20/80] arm/mps2-tz: use memdev for RAM
Message-ID: <20200123125909.p2aq3ad2x5l24zq5@kamzik.brq.redhat.com>
References: <1579779525-20065-1-git-send-email-imammedo@redhat.com>
 <1579779525-20065-21-git-send-email-imammedo@redhat.com>
MIME-Version: 1.0
In-Reply-To: <1579779525-20065-21-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-MC-Unique: MUcgccStOrC0hQlsGnVWHA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 207.211.31.81
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lfwyvTFRubS4

On Thu, Jan 23, 2020 at 12:37:45PM +0100, Igor Mammedov wrote:
> memory_region_allocate_system_memory() API is going away, so
> replace it with memdev allocated MemoryRegion. The later is
> initialized by generic code, so board only needs to opt in
> to memdev scheme by providing
>   MachineClass::default_ram_id
> and using MachineState::ram instead of manually initializing
> RAM memory region.
>=20
> PS:
>  while at it add check for user supplied RAM size and error
>  out if it mismatches board expected value.
>=20
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
> v2:
>   * fix format string causing build failure on 32-bit host
>     (Philippe Mathieu-Daud=E9 <philmd@redhat.com>)
>=20
> CC: drjones@redhat.com
> CC: peter.maydell@linaro.org
> CC: qemu-arm@nongnu.org
> ---
>  hw/arm/mps2-tz.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
>=20
> diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
> index f8b620b..06dacf6 100644
> --- a/hw/arm/mps2-tz.c
> +++ b/hw/arm/mps2-tz.c
> @@ -39,6 +39,7 @@
> =20
>  #include "qemu/osdep.h"
>  #include "qemu/units.h"
> +#include "qemu/cutils.h"
>  #include "qapi/error.h"
>  #include "qemu/error-report.h"
>  #include "hw/arm/boot.h"
> @@ -79,7 +80,6 @@ typedef struct {
>      MachineState parent;
> =20
>      ARMSSE iotkit;
> -    MemoryRegion psram;
>      MemoryRegion ssram[3];
>      MemoryRegion ssram1_m;
>      MPS2SCC scc;
> @@ -388,6 +388,13 @@ static void mps2tz_common_init(MachineState *machine=
)
>          exit(1);
>      }
> =20
> +    if (machine->ram_size !=3D mc->default_ram_size) {
> +        char *sz =3D size_to_str(mc->default_ram_size);
> +        error_report("Invalid RAM size, should be %s", sz);
> +        g_free(sz);
> +        exit(EXIT_FAILURE);
> +    }
> +
>      sysbus_init_child_obj(OBJECT(machine), "iotkit", &mms->iotkit,
>                            sizeof(mms->iotkit), mmc->armsse_type);
>      iotkitdev =3D DEVICE(&mms->iotkit);
> @@ -458,9 +465,7 @@ static void mps2tz_common_init(MachineState *machine)
>       * tradeoffs. For QEMU they're all just RAM, though. We arbitrarily
>       * call the 16MB our "system memory", as it's the largest lump.
>       */
> -    memory_region_allocate_system_memory(&mms->psram,
> -                                         NULL, "mps.ram", 16 * MiB);
> -    memory_region_add_subregion(system_memory, 0x80000000, &mms->psram);
> +    memory_region_add_subregion(system_memory, 0x80000000, machine->ram)=
;
> =20
>      /* The overflow IRQs for all UARTs are ORed together.
>       * Tx, Rx and "combined" IRQs are sent to the NVIC separately.
> @@ -642,6 +647,7 @@ static void mps2tz_class_init(ObjectClass *oc, void *=
data)
> =20
>      mc->init =3D mps2tz_common_init;
>      iic->check =3D mps2_tz_idau_check;
> +    mc->default_ram_id =3D "mps.ram";
>  }
> =20
>  static void mps2tz_an505_class_init(ObjectClass *oc, void *data)
> @@ -657,6 +663,7 @@ static void mps2tz_an505_class_init(ObjectClass *oc, =
void *data)
>      mc->default_cpu_type =3D ARM_CPU_TYPE_NAME("cortex-m33");
>      mmc->scc_id =3D 0x41045050;
>      mmc->armsse_type =3D TYPE_IOTKIT;
> +    mc->default_ram_size =3D 16 * MiB;

Shouldn't this line be added to mps2tz_class_init ?

Thanks,
drew

>  }
> =20
>  static void mps2tz_an521_class_init(ObjectClass *oc, void *data)
> --=20
> 2.7.4
>=20

