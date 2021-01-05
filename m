Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp16317041lfq;
        Tue, 5 Jan 2021 03:03:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzUSYkz5dU5kjgtz0HpnTMcUCGEOY/BfsXvbZ3+MczPOWt9oMbV5MQiZvazUB1QxPLmTRPY
X-Received: by 2002:a25:d913:: with SMTP id q19mr118192005ybg.180.1609844618398;
        Tue, 05 Jan 2021 03:03:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1609844618; cv=none;
        d=google.com; s=arc-20160816;
        b=B/KXt1/iJVrcp3S5NBX85SEIAEb9Loghnm9SFTDGcWkuZG2eivGS7Xqvhv8x5A1w11
         OEfgOUYjbML0Sod5m4hl5bHTzuuhh57AHCqgh+mOeKGptoqGmWKb7ySar7LJksyVf4VP
         ANfuAJ0mcNMg3CBLJu+n2RJwkWHI57VAbFhyOwUa2DtFqprBYF4IrWd//wmV4pW1igGx
         ZLg93DsbbNSsEv6t4f/IvNm6qqJFiW11uCKdkdNOCgR6IitfxmXi9+wXnPLyMKf4t83/
         fUdR+HgkZ9ruEDX1bbwsg8uh2vBob2JDpYBdUzGWCG05wyc3xVyPT2FZ2mwxfFk3tshb
         QTiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:to:from:date:dkim-signature;
        bh=8cu6HkCB5CpxmqJ03sR67WS1+WODTfgIc3D+gNm2MqU=;
        b=UrNzsvslR24Lu2FKOfy3/uQkTcq854fN4hDA2WS5YFeaqAdC1OHgElYj5l/SMU0rx3
         5l0F5qQirDsobSy52EPXBAbpyCpQuuCTseWe3BSaE/+rC7kg6cLTY0p2Dp1aibIsVSrc
         4wFTaB1SzAIGMxs2np+kFr6pnGWkFidzFNCPufNAdRYmTHLPR0HT1tG8BqKsRpGXoidA
         189NZPe0ho6BXDqxfW8Z7hsA09ar12x+j2bOfxocBVL9uYyaYVsVy4zjKcEiH2+LmkAI
         XNjcoLPW4hUFDUggruhJ2KlLdQHjCUER7AFHvbEEu3FLE3gg7uYn8sPcpOV+R54OpXOB
         7hTw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GdlseIO5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o13si57634847yba.386.2021.01.05.03.03.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Jan 2021 03:03:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GdlseIO5;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kwk7l-0003JC-L4
	for alex.bennee@linaro.org; Tue, 05 Jan 2021 06:03:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kwk72-0003HI-AK
 for qemu-arm@nongnu.org; Tue, 05 Jan 2021 06:02:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kwk6z-00076c-Ir
 for qemu-arm@nongnu.org; Tue, 05 Jan 2021 06:02:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609844568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8cu6HkCB5CpxmqJ03sR67WS1+WODTfgIc3D+gNm2MqU=;
 b=GdlseIO5+by6Y1DM04m8GNhJmEQabEZEFK5TZOpKUMmc/XWpnycRxWW+9WFdqZHcuiVOtt
 +mDHvAPJLmS+oxlKJTs7+vVDIe85Niy0HqjrDKneuLdgJihdvZbzmFDraywSiczdnaozyY
 KJTgUUnlY7j/fOWf9I0/LJg5DuNGfNs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-6n4ElkjYN1-n9V1Oa3Lp5A-1; Tue, 05 Jan 2021 06:02:47 -0500
X-MC-Unique: 6n4ElkjYN1-n9V1Oa3Lp5A-1
Received: by mail-wr1-f69.google.com with SMTP id q18so14673618wrc.20
 for <qemu-arm@nongnu.org>; Tue, 05 Jan 2021 03:02:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=mbl5QmC5aHI8ZfdwVbKvx4Xv3Z0CQD3R2rpo6FmAyfQ=;
 b=Mr/nfy5keRyWb45nEa+2pUwLhxPHew8HtSWmJoa+jbnXdVXSgB68i3vzgwX//Psl1k
 +KCaEsf88U4oJ42XR/03b5WKACAPv3aBnWuj43XW1R+KpAjiHRcsugbihSGioMjXHC0h
 lTqWBqdwEsl3PJqCaJ3kf0QBkyy4WgW8KdRrQ3WP/dbVw7s6YtlvM48W9e99a851miFU
 9oNpfIpA6Uc8fO+u/7Q/kKot63us55O2j1bDlx4JMbTtWn/raKJgPg3L2cSRxI+6rVD5
 QyluyOyN8o3j5TeQKtIqhDlNlJP95JVe90ZpuZzAma1E72KF89uLCiZmetmst45irkMQ
 S1qA==
X-Gm-Message-State: AOAM531TkJ8aQPaiwKfGfgmjlRv71Hnx37JOQ6AkMhwQTUQ0tpoRbw1E
 m4jEBb5+2G6LfXPC1iY7AbGPLt0I7TWrVkTg65lH+rfeQkGTBUhLgY17CTYJFuQGFToObm4vpK7
 y2ZxRi7vKk5K7
X-Received: by 2002:a05:6000:1d1:: with SMTP id
 t17mr86763568wrx.164.1609844563962; 
 Tue, 05 Jan 2021 03:02:43 -0800 (PST)
X-Received: by 2002:a05:6000:1d1:: with SMTP id
 t17mr86763531wrx.164.1609844563667; 
 Tue, 05 Jan 2021 03:02:43 -0800 (PST)
Received: from redhat.com (bzq-79-178-32-166.red.bezeqint.net. [79.178.32.166])
 by smtp.gmail.com with ESMTPSA id j2sm61399868wrh.78.2021.01.05.03.02.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 03:02:42 -0800 (PST)
Date: Tue, 5 Jan 2021 06:02:39 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH v2 3/3] hw/i386: expose a "smbios-ep" PC machine property
Message-ID: <20210105055815-mutt-send-email-mst@kernel.org>
References: <20201214205029.2991222-1-ehabkost@redhat.com>
 <20201214205029.2991222-4-ehabkost@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201214205029.2991222-4-ehabkost@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 "Daniel P. Berrange" <berrange@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0seHNGrK9Yf2

On Mon, Dec 14, 2020 at 03:50:29PM -0500, Eduardo Habkost wrote:
> From: Daniel P. Berrangé <berrange@redhat.com>
> 
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
>    $QEMU -machine q35,smbios-ep=3_0
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Just one small point: wouldn't it be a good idea to eschew
abbreviation here, and call the property smbios-entry-point
or even smbios-entry-point-type or smbios-entry-point-version?

> ---
> This is patch was previously submitted at:
> https://lore.kernel.org/qemu-devel/20200908165438.1008942-6-berrange@redhat.com
> 
> Changes from v1:
> * Include qapi-visit-smbios.h instead of qapi-visit-machine.h
> * Commit message fix: s/smbios_ep/smbios-ep/
> ---
>  include/hw/i386/pc.h |  3 +++
>  hw/i386/pc.c         | 26 ++++++++++++++++++++++++++
>  hw/i386/pc_piix.c    |  2 +-
>  hw/i386/pc_q35.c     |  2 +-
>  4 files changed, 31 insertions(+), 2 deletions(-)
> 
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index 2aa8797c6e..2075093b32 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -11,6 +11,7 @@
>  #include "hw/acpi/acpi_dev_interface.h"
>  #include "hw/hotplug.h"
>  #include "qom/object.h"
> +#include "hw/firmware/smbios.h"
>  
>  #define HPET_INTCAP "hpet-intcap"
>  
> @@ -38,6 +39,7 @@ typedef struct PCMachineState {
>      /* Configuration options: */
>      uint64_t max_ram_below_4g;
>      OnOffAuto vmport;
> +    SmbiosEntryPointType smbios_ep;
>  
>      bool acpi_build_enabled;
>      bool smbus_enabled;
> @@ -62,6 +64,7 @@ typedef struct PCMachineState {
>  #define PC_MACHINE_SATA             "sata"
>  #define PC_MACHINE_PIT              "pit"
>  #define PC_MACHINE_MAX_FW_SIZE      "max-fw-size"
> +#define PC_MACHINE_SMBIOS_EP        "smbios-ep"
>  
>  /**
>   * PCMachineClass:
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 640fb5b0b7..3cc559e0d9 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -81,6 +81,7 @@
>  #include "hw/mem/nvdimm.h"
>  #include "qapi/error.h"
>  #include "qapi/qapi-visit-common.h"
> +#include "qapi/qapi-visit-smbios.h"
>  #include "qapi/visitor.h"
>  #include "hw/core/cpu.h"
>  #include "hw/usb.h"
> @@ -1532,6 +1533,23 @@ static void pc_machine_set_hpet(Object *obj, bool value, Error **errp)
>      pcms->hpet_enabled = value;
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
> @@ -1621,6 +1639,8 @@ static void pc_machine_initfn(Object *obj)
>      pcms->vmport = ON_OFF_AUTO_OFF;
>  #endif /* CONFIG_VMPORT */
>      pcms->max_ram_below_4g = 0; /* use default */
> +    pcms->smbios_ep = SMBIOS_ENTRY_POINT_TYPE_2_1;
> +
>      /* acpi build is enabled by default if machine supports it */
>      pcms->acpi_build_enabled = PC_MACHINE_GET_CLASS(pcms)->has_acpi_build;
>      pcms->smbus_enabled = true;
> @@ -1759,6 +1779,12 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
>          NULL, NULL);
>      object_class_property_set_description(oc, PC_MACHINE_MAX_FW_SIZE,
>          "Maximum combined firmware size");
> +
> +    object_class_property_add(oc, PC_MACHINE_SMBIOS_EP, "str",
> +        pc_machine_get_smbios_ep, pc_machine_set_smbios_ep,
> +        NULL, NULL);
> +    object_class_property_set_description(oc, PC_MACHINE_SMBIOS_EP,
> +        "SMBIOS Entry Point version [v2_1, v3_0]");

To me this reads like the legal values are v2_1 and v3_0, in fact
they are 2_1 and 3_0.


>  }
>  
>  static const TypeInfo pc_machine_info = {
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index 08b82df4d1..30ae7f27af 100644
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
> index f71b1e2dcf..9974426806 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -198,7 +198,7 @@ static void pc_q35_init(MachineState *machine)
>          smbios_set_defaults("QEMU", "Standard PC (Q35 + ICH9, 2009)",
>                              mc->name, pcmc->smbios_legacy_mode,
>                              pcmc->smbios_uuid_encoded,
> -                            SMBIOS_ENTRY_POINT_TYPE_2_1);
> +                            pcms->smbios_ep);
>      }
>  
>      /* allocate ram and load rom/bios */
> -- 
> 2.28.0

