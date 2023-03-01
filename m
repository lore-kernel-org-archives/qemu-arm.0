Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp6997869ejc;
        Wed, 1 Mar 2023 06:08:54 -0800 (PST)
X-Google-Smtp-Source: AK7set+n7Di7SwEucwy7sOUqmAY482DK3Y6rwvgX2oMEzvM03WIZh0yboDZk6wij5KmbVlnvT2ee
X-Received: by 2002:a1f:a848:0:b0:410:fa68:78ff with SMTP id r69-20020a1fa848000000b00410fa6878ffmr2523709vke.5.1677679734052;
        Wed, 01 Mar 2023 06:08:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677679734; cv=none;
        d=google.com; s=arc-20160816;
        b=FnW0kCwtnnRUtLgkRSkTn9jGHnU9DfyVHqJmrcWbRYDVkjpHiJVwQNUEY+hZ+ga3RV
         qR2zWF8fw3fkbUqsBpFDsB3X0nZmNJBAlFwfjCGTT3BMCvMp7uTOW+DOBYD+oYtIeVRu
         iM3zqFXlqKcaMBESmSF0rMVTwEOxRp8ul+Kkp3QVFRkxW1pX5/G8Sfm4JkiYxhEgJRSZ
         FdJ0FmalA5f3uKG6wSqXOgCL/e0hT0kQsisQbegi8gmOIpkZqPygqi/cnpxe3AoKz/5m
         zLQtBLS8aWle8+p9LBSGZoWK3DH4RPy7xGz6NsWggmu3tj7+iOGutplh22OCsnf8HNWI
         QaWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=sTYW1e7hircUTAoDaT8QZeHGZrDCroXvmwr6zWljRP4=;
        b=zR0N+Nn4V4AZW4rE9muWh4LVsL/xicQVRhP9IHAXzMbQlXt+5GNBu4nMesAJpwjrB+
         FLYESBRzO0pE+lGuSXn/ReEb3NH+BBnofFNH5IOR/Gf8441cjQv3QwT6DLjeJa3C0OLf
         GClSBEwMeGyst047Ajsct0pxHVuObcUmzDoOknZSiagnHhb2QIvgCp6CgGc1Vuu6M/wY
         0Ov/5jO4ME5InuSs1Juqvc8dUiYHBedTNtHPTpe+Ky8wUxUZPDmeKaxm6iSUzEC+Gt9X
         fWPu1h8+DOqa4nt72Yvznd5NORWrY03XRYOhRoMMpy6rR0SMUgG2d39SmTMj+dS9ikS+
         mRWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Z1G2ZZ3P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j6-20020a1f2306000000b003ea013684d5si3895572vkj.38.2023.03.01.06.08.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 01 Mar 2023 06:08:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Z1G2ZZ3P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pXN7M-0007px-00; Wed, 01 Mar 2023 09:07:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pXN76-0007gr-6J
 for qemu-arm@nongnu.org; Wed, 01 Mar 2023 09:07:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pXN74-0005sl-EE
 for qemu-arm@nongnu.org; Wed, 01 Mar 2023 09:07:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677679641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sTYW1e7hircUTAoDaT8QZeHGZrDCroXvmwr6zWljRP4=;
 b=Z1G2ZZ3PvXL9QRFjmo3dCtpTb5/WrV4MQPFGdXDTfyviGTg8Fdzhue/IGjOdzC9M1UPenF
 U/i39BIS/9QtCGtw4jM/HwDexP/BHxmzDVakXh8PINdaBvkrhO426DMKndZRyKMTViQ3Hh
 /pTWA9b+Rzjc7udYceWZba3vTg7V4Wk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-457-PqjwjKTqMb-kcEajOC8gNg-1; Wed, 01 Mar 2023 09:07:20 -0500
X-MC-Unique: PqjwjKTqMb-kcEajOC8gNg-1
Received: by mail-wr1-f70.google.com with SMTP id
 i18-20020a05600011d200b002c94d861113so2541122wrx.16
 for <qemu-arm@nongnu.org>; Wed, 01 Mar 2023 06:07:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677679635;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2eU6CUJmsaj+DRHhWhs2AoNFyx1lPX7SG8r6IebtsJY=;
 b=f9nS5a46LQp3WCP2llQArMGWUbm3rE/7qRWjWssNndCa8cZiq6Hqq+g327RRwnxC7q
 O7BLSaR3p8qnjrTLE1/DDDPb2iZX0G2Y5kFFBQ/iglCJamHWDCKPFC3kVvxjjLgynaFH
 xV1rRLUhjv65k6JkXyNoeTpUX8ooeBEGVoWgN4ad0BHmXJ7JjE1vH9yOXjYDQJEjYNwe
 b9xs8lzzZlJIdrytsrR5DXPjrLkLavteEbVw9DXz0/CLxXAUtLl0eIXJ3OaSls0HYHqz
 BE/thwQklsO6xIo9MczQau52qLtzva+tdcjCYqePPgN3xDmmVfZH3LUaVbJ92iVvuxo/
 b8zg==
X-Gm-Message-State: AO0yUKXrU7+LATkv0Ip+EsUx1mANrwn+urm09D4miqRgKk5pGhz0rkHJ
 +QkICXEY4F7hChQjYVbTyMgPVbwm9FkpKx8T8T7Q5S9NgKeqBEaFf7F1oxZEMeh3TrY+xVW64dD
 Xws0r1KHKaZic
X-Received: by 2002:a5d:5092:0:b0:2c9:97f8:2604 with SMTP id
 a18-20020a5d5092000000b002c997f82604mr4466667wrt.14.1677679635126; 
 Wed, 01 Mar 2023 06:07:15 -0800 (PST)
X-Received: by 2002:a5d:5092:0:b0:2c9:97f8:2604 with SMTP id
 a18-20020a5d5092000000b002c997f82604mr4466652wrt.14.1677679634801; 
 Wed, 01 Mar 2023 06:07:14 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com ([185.140.112.229])
 by smtp.gmail.com with ESMTPSA id
 a2-20020adfdd02000000b002c3f03d8851sm13000492wrm.16.2023.03.01.06.07.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 06:07:14 -0800 (PST)
Date: Wed, 1 Mar 2023 15:07:13 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, Markus Armbruster
 <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 qemu-riscv@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha
 <ani@anisinha.ca>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Aurelien
 Jarno <aurelien@aurel32.net>
Subject: Re: [PATCH 03/19] hw/acpi: Set QDev properties using QDev API
Message-ID: <20230301150713.48d4ef36@imammedo.users.ipa.redhat.com>
In-Reply-To: <20230203180914.49112-4-philmd@linaro.org>
References: <20230203180914.49112-1-philmd@linaro.org>
 <20230203180914.49112-4-philmd@linaro.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.36; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: fBW2bs9oxc50

On Fri,  3 Feb 2023 19:08:58 +0100
Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:

> No need to use the low-level QOM API when an object
> inherits from QDev. Directly use the QDev API to set
> its properties.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/acpi/cpu_hotplug.c | 7 +++----
>  hw/acpi/ich9.c        | 4 ++--
>  hw/acpi/piix4.c       | 4 ++--
>  3 files changed, 7 insertions(+), 8 deletions(-)
>=20
> diff --git a/hw/acpi/cpu_hotplug.c b/hw/acpi/cpu_hotplug.c
> index b8c9081738..5bc5f435f4 100644
> --- a/hw/acpi/cpu_hotplug.c
> +++ b/hw/acpi/cpu_hotplug.c
> @@ -10,6 +10,7 @@
>   * See the COPYING file in the top-level directory.
>   */
>  #include "qemu/osdep.h"
> +#include "hw/qdev-properties.h"
>  #include "hw/acpi/cpu_hotplug.h"
>  #include "qapi/error.h"
>  #include "hw/core/cpu.h"
> @@ -41,8 +42,7 @@ static void cpu_status_write(void *opaque, hwaddr addr,=
 uint64_t data,
>       */
>      if (addr =3D=3D 0 && data =3D=3D 0) {
>          AcpiCpuHotplug *gpe =3D opaque;
> -        object_property_set_bool(OBJECT(gpe->parent), "cpu-hotplug-legac=
y",
> -                                 false, &error_abort);
> +        qdev_prop_set_bit(gpe->parent, "cpu-hotplug-legacy", false);
>      }
>  }
> =20
> @@ -66,8 +66,7 @@ static void acpi_set_cpu_present_bit(AcpiCpuHotplug *gp=
e, CPUState *cpu)
> =20
>      cpu_id =3D k->get_arch_id(cpu);
>      if ((cpu_id / 8) >=3D ACPI_GPE_PROC_LEN) {
> -        object_property_set_bool(OBJECT(gpe->parent), "cpu-hotplug-legac=
y",
> -                                 false, &error_abort);
> +        qdev_prop_set_bit(gpe->parent, "cpu-hotplug-legacy", false);
>          return;
>      }
> =20
> diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
> index 6c9a737479..9759119b32 100644
> --- a/hw/acpi/ich9.c
> +++ b/hw/acpi/ich9.c
> @@ -30,6 +30,7 @@
>  #include "hw/pci/pci.h"
>  #include "migration/vmstate.h"
>  #include "qemu/timer.h"
> +#include "hw/qdev-properties.h"
>  #include "hw/core/cpu.h"
>  #include "sysemu/reset.h"
>  #include "sysemu/runstate.h"
> @@ -197,8 +198,7 @@ static bool vmstate_test_use_cpuhp(void *opaque)
>  static int vmstate_cpuhp_pre_load(void *opaque)
>  {
>      ICH9LPCPMRegs *s =3D opaque;
> -    Object *obj =3D OBJECT(s->gpe.parent);
> -    object_property_set_bool(obj, "cpu-hotplug-legacy", false, &error_ab=
ort);
> +    qdev_prop_set_bit(s->gpe.parent, "cpu-hotplug-legacy", false);
>      return 0;
>  }
> =20
> diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
> index 3a61d89f92..9a86d506de 100644
> --- a/hw/acpi/piix4.c
> +++ b/hw/acpi/piix4.c
> @@ -206,8 +206,8 @@ static bool vmstate_test_use_cpuhp(void *opaque)
> =20
>  static int vmstate_cpuhp_pre_load(void *opaque)
>  {
> -    Object *obj =3D OBJECT(opaque);
> -    object_property_set_bool(obj, "cpu-hotplug-legacy", false, &error_ab=
ort);
> +    PIIX4PMState *s =3D opaque;

In other series you were aiming for type safety converting Object to Device=
State
and here you do opposite of that

> +    qdev_prop_set_bit(DEVICE(s), "cpu-hotplug-legacy", false);
if you have to, just use DEVICE(opaque) here and drop above pointer casting=
.

>      return 0;
>  }
> =20

