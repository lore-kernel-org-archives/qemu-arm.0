Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp227499lfq;
        Wed, 9 Sep 2020 01:28:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxES+C2nrAetL5n1VfsTnIPwUpSubl1joChT095u2lBEzSmJKNIkVRRhIE8tSf09XqPU4te
X-Received: by 2002:a25:3fc7:: with SMTP id m190mr4011471yba.450.1599640138507;
        Wed, 09 Sep 2020 01:28:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599640138; cv=none;
        d=google.com; s=arc-20160816;
        b=bbvcCQN1hEd+OGoPSEpQnZhjtkyMG2Edi8DQhT6OsI/s91G0e8NSYEBjZRIfMy8e9O
         ld7+1Xmj3W4PT6aC5pzWX/bSdL9+KuygiDsYWBLRjAe5EPeY7/HROYk6kxr2gKqlgESw
         QNNk/uLoFyoacHyWSv/wTZdW/wMLd4vPZST6vm76idX5skUUyEqG46+iD+8uxzrl2iKU
         OX6VtR2d8mJgWPMZzaAAymYtfxq0yifS53uUZoQvAIBToQoVdSOsabex86PHkzig84kI
         zUYzKqygE0pI1+Y0o44NUmpGxvDKzZDDv/DgPka4dtoVyiSXusOFn0vYTfG3OV3cam4/
         YGXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-language
         :content-transfer-encoding:in-reply-to:mime-version:date:message-id
         :from:references:to:subject:dkim-signature;
        bh=jducEbugDE4d9Z4emkwNsimY7KnaX2a8kR6H1NSv2hY=;
        b=RdMhyi+EOrWfN3PqffP615vYh8Fgdc9zdVmzuWuseNxNwtHcATpe5P+fNFwB2B6/4n
         Xc1czrHJJWNuFq3WWBmA23zN2Ig4JE3+hBO8S1I1+/3mNM1gCsATiyZzIDI10b3shNSt
         HbC3s7FWRWavvHYuIfhMY2At1slv/srK85MpCSTdv3m2aD9WP/gibYRJn+w+P6voqLnY
         jmk65niFeS5gzidZBZT4FTGnjUdwmuOxB1305F92jnv6I1F+OtVkB3LmC+cGt2ad4q3g
         Dw0r+qmJPCC8j4AAqM3cFY62lJRiMSQwsyw7hWEMCeOmcaH1pn8SZ8tTkHtwbsBDOxpe
         mQbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=K4hMSi++;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l4si2699563ybc.52.2020.09.09.01.28.58
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Sep 2020 01:28:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=K4hMSi++;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kFvTN-0007ZQ-Tl
	for alex.bennee@linaro.org; Wed, 09 Sep 2020 04:28:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1kFvTA-0007Yi-3M
 for qemu-arm@nongnu.org; Wed, 09 Sep 2020 04:28:44 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:26948
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1kFvT6-0005Uv-H6
 for qemu-arm@nongnu.org; Wed, 09 Sep 2020 04:28:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599640119;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jducEbugDE4d9Z4emkwNsimY7KnaX2a8kR6H1NSv2hY=;
 b=K4hMSi++vg8JFccwQZqy+XzV7ysYBPKF5/J6Hpl0KwKDUYuI1J/1rv6WFE1IDMjusWyjsC
 IDtTB2xZcQjs/GVJNdVyWiMfKi4hO8V9vhEmh9aYXPUeSUBEDN7i2RIb6Bkw0toEMMj/xK
 UJvwliFKz4qswHUhVpzKHM68xoxrSDQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-VqLD5tETP-C-ih6LjPF-Sw-1; Wed, 09 Sep 2020 04:28:35 -0400
X-MC-Unique: VqLD5tETP-C-ih6LjPF-Sw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 61392100746B;
 Wed,  9 Sep 2020 08:28:34 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-114-82.ams2.redhat.com
 [10.36.114.82])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8434978380;
 Wed,  9 Sep 2020 08:28:21 +0000 (UTC)
Subject: Re: [PATCH 5/5] hw/i386: expose a "smbios_ep" PC machine property
To: =?UTF-8?Q?Daniel_P._Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20200908165438.1008942-1-berrange@redhat.com>
 <20200908165438.1008942-6-berrange@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <b925820e-9329-2937-c0d9-998df43b00da@redhat.com>
Date: Wed, 9 Sep 2020 10:28:20 +0200
MIME-Version: 1.0
In-Reply-To: <20200908165438.1008942-6-berrange@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lersek@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=207.211.31.120; envelope-from=lersek@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/09 03:05:47
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Fl6tXGGBXgXb

On 09/08/20 18:54, Daniel P. Berrangé wrote:
> The i440fx and Q35 machine types are both hardcoded to use the legacy
> SMBIOS 2.1 entry point. This is a sensible conservative choice because
> SeaBIOS only supports SMBIOS 2.1
> 
> EDK2, however, can also support SMBIOS 3.0 and QEMU already uses this on
> the ARM virt machine type.
> 
> This adds a property to allow the choice of SMBIOS entry point versions
> For example to opt in to version 3.0
> 
>    $QEMU -machine q35,smbios_ep=3_0

s/smbios_ep/smbios-ep/

Thanks
Laszlo

> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  hw/i386/pc.c         | 26 ++++++++++++++++++++++++++
>  hw/i386/pc_piix.c    |  2 +-
>  hw/i386/pc_q35.c     |  2 +-
>  include/hw/i386/pc.h |  3 +++
>  4 files changed, 31 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index d11daacc23..cfce279eed 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -81,6 +81,7 @@
>  #include "hw/mem/nvdimm.h"
>  #include "qapi/error.h"
>  #include "qapi/qapi-visit-common.h"
> +#include "qapi/qapi-visit-machine.h"
>  #include "qapi/visitor.h"
>  #include "hw/core/cpu.h"
>  #include "hw/usb.h"
> @@ -1834,6 +1835,23 @@ static void pc_machine_set_pit(Object *obj, bool value, Error **errp)
>      pcms->pit_enabled = value;
>  }
>  
> +static void pc_machine_get_smbios_ep(Object *obj, Visitor *v, const char *name,
> +                                     void *opaque, Error **errp)
> +{
> +    PCMachineState *pcms = PC_MACHINE(obj);
> +    SmbiosEntryPointType smbios_ep = pcms->smbios_ep;
> +
> +    visit_type_SmbiosEntryPointType(v, name, &smbios_ep, errp);
> +}
> +
> +static void pc_machine_set_smbios_ep(Object *obj, Visitor *v, const char *name,
> +                                     void *opaque, Error **errp)
> +{
> +    PCMachineState *pcms = PC_MACHINE(obj);
> +
> +    visit_type_SmbiosEntryPointType(v, name, &pcms->smbios_ep, errp);
> +}
> +
>  static void pc_machine_get_max_ram_below_4g(Object *obj, Visitor *v,
>                                              const char *name, void *opaque,
>                                              Error **errp)
> @@ -1879,6 +1897,8 @@ static void pc_machine_initfn(Object *obj)
>      pcms->vmport = ON_OFF_AUTO_OFF;
>  #endif /* CONFIG_VMPORT */
>      pcms->max_ram_below_4g = 0; /* use default */
> +    pcms->smbios_ep = SMBIOS_ENTRY_POINT_TYPE_2_1;
> +
>      /* acpi build is enabled by default if machine supports it */
>      pcms->acpi_build_enabled = PC_MACHINE_GET_CLASS(pcms)->has_acpi_build;
>      pcms->smbus_enabled = true;
> @@ -2004,6 +2024,12 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
>  
>      object_class_property_add_bool(oc, PC_MACHINE_PIT,
>          pc_machine_get_pit, pc_machine_set_pit);
> +
> +    object_class_property_add(oc, PC_MACHINE_SMBIOS_EP, "str",
> +        pc_machine_get_smbios_ep, pc_machine_set_smbios_ep,
> +        NULL, NULL);
> +    object_class_property_set_description(oc, PC_MACHINE_SMBIOS_EP,
> +        "SMBIOS Entry Point version [v2_1, v3_0]");
>  }
>  
>  static const TypeInfo pc_machine_info = {
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 1c5bc6ae6e..3626e5425f 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -179,7 +179,7 @@ static void pc_init1(MachineState *machine,
>          smbios_set_defaults("QEMU", "Standard PC (i440FX + PIIX, 1996)",
>                              mc->name, pcmc->smbios_legacy_mode,
>                              pcmc->smbios_uuid_encoded,
> -                            SMBIOS_ENTRY_POINT_TYPE_2_1);
> +                            pcms->smbios_ep);
>      }
>  
>      /* allocate ram and load rom/bios */
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index cc202407c7..7cf08fa364 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -204,7 +204,7 @@ static void pc_q35_init(MachineState *machine)
>          smbios_set_defaults("QEMU", "Standard PC (Q35 + ICH9, 2009)",
>                              mc->name, pcmc->smbios_legacy_mode,
>                              pcmc->smbios_uuid_encoded,
> -                            SMBIOS_ENTRY_POINT_TYPE_2_1);
> +                            pcms->smbios_ep);
>      }
>  
>      /* allocate ram and load rom/bios */
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index fe52e165b2..f5d2ebcb49 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -10,6 +10,7 @@
>  
>  #include "hw/acpi/acpi_dev_interface.h"
>  #include "hw/hotplug.h"
> +#include "hw/firmware/smbios.h"
>  
>  #define HPET_INTCAP "hpet-intcap"
>  
> @@ -38,6 +39,7 @@ struct PCMachineState {
>      /* Configuration options: */
>      uint64_t max_ram_below_4g;
>      OnOffAuto vmport;
> +    SmbiosEntryPointType smbios_ep;
>  
>      bool acpi_build_enabled;
>      bool smbus_enabled;
> @@ -59,6 +61,7 @@ struct PCMachineState {
>  #define PC_MACHINE_SMBUS            "smbus"
>  #define PC_MACHINE_SATA             "sata"
>  #define PC_MACHINE_PIT              "pit"
> +#define PC_MACHINE_SMBIOS_EP        "smbios-ep"
>  
>  /**
>   * PCMachineClass:
> 

