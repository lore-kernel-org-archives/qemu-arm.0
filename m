Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp750918njc;
        Tue, 20 May 2025 13:00:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUufp+Z3bHiW0NWHeAqRrlpgA80S3vygw0ikuzK+1GijFJlogaLMTZWUWi5Llj1VtXNxgRoM+iHqLazrw==@linaro.org
X-Google-Smtp-Source: AGHT+IHb2WaqA7jhyX9Bwl6guRvgaczdXw/bv8q7XtvrK8ddD5Ze889HweT50lUfr4fEDH7k2DBp
X-Received: by 2002:a05:622a:2305:b0:476:b7cf:4d42 with SMTP id d75a77b69052e-494b07da8c9mr321089131cf.27.1747771245160;
        Tue, 20 May 2025 13:00:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747771245; cv=none;
        d=google.com; s=arc-20240605;
        b=dUuJdWhCqIpGyZkNwJGmtxNXIzW+miejdM40Y/RqLSTkSz7CS5Z1li3XkyPpWVzi/x
         ecIofHbgVppVvrrn2dbNgn0Zk2ByhlVGdO6EbjRT+1GX/shqw7l9lqljmz7IVON6U/uU
         ABNnblGJhErUAvbxQciLyu5RoBSu3aEBi0tlhLQoDCIXS+qbc54oliPXD95SyISjV8w6
         CaAucT+h1jKWpMGnyNkT/3b8NmR9CoRj7IrlyUtfC7aQaPUzbI3py/dUrsl9RNaISD/i
         SYPZTPE5YYHOcUDdFv98aBn52tplKd6CGEaP0kdlt8fD9NSy+wbaj4j6CX8dSi1pMtzD
         +RJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=GuujTtlKxG0Vdawkfcvu+aUrsLj2lJNKbbFDPjMIYSY=;
        fh=xmC/rh9/AuC5FCg2yypQmfZrbKdzbR5KETgBnLqTDYs=;
        b=Ku1c9ccRe6+nkJ7TfzTKho2+qiiKZGw15e4si8/dzoQI/QClnMOCQbqp9bJBEIcblc
         LqiqOWyW5V+DAqbq1w1Knx5vYqeHarnlVKqkl6Z8WHZWRSYAjKe6wZ+ULDMZ+0x/tuSX
         ITwp5mY5YBJ+Y+jMgJ2qP8a34w1yddTmleTlPGyKibSkRd3+PmlHFVN3ptckrEt6ZIFF
         7OQ5llfHfBA+4LKhUYEYKOidsAbd2vk1JGLbnryjrdTnwXrd84jHwMqVYaCh8SHdUj6B
         PG+jiWt2PEWmxV07igon/mJtQFkIZcJUyQfyn0gG6rgLRaL8+KvINkY7CC666FKuzMq8
         Z7hA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HYo8B01n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-494ae577422si118214781cf.385.2025.05.20.13.00.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 May 2025 13:00:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HYo8B01n;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uHT8Z-0002tl-0W; Tue, 20 May 2025 16:00:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uHT8X-0002rM-L3
 for qemu-arm@nongnu.org; Tue, 20 May 2025 16:00:29 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uHT8Q-0007pC-Ik
 for qemu-arm@nongnu.org; Tue, 20 May 2025 16:00:29 -0400
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-231c86bffc1so61255465ad.0
 for <qemu-arm@nongnu.org>; Tue, 20 May 2025 13:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747771217; x=1748376017; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GuujTtlKxG0Vdawkfcvu+aUrsLj2lJNKbbFDPjMIYSY=;
 b=HYo8B01n2sZD1MuRIDKyfIo1W7R2ZMQtGVIdZPVaKh4FynqejtaJUE7rrfsmaGKonU
 +hEumGz7zlA7ILpH319TvPJ+HdmsuiwxNBrUylj5SsOwqTvQVhLB//+xB4bK3qWx3Wqf
 44zhFrKKE+zzt1ZY43Hjvm6RUuuS5NKSwSDI+39Oocac8AGM+5P9eEwQfGVsO18ZzZvy
 HrSiZ0rHFwppXEiNHnpVkTVJ7cdMK0xQS7z5IrTU3CysqKqdzEfRd1R2uMoDickFktLA
 fh0E9zF53a1AR3uHThT6fvY7Cx4dwMJwoEf2jwLZwHAo3h8AJjl3wG8uwN4rr9eRyNKS
 lt3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747771217; x=1748376017;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GuujTtlKxG0Vdawkfcvu+aUrsLj2lJNKbbFDPjMIYSY=;
 b=oPIyJrwL6cmtx6lZBmh/B2IFvrO8zutAQNjcRFlXKG//Lqqk3haWSFAQFX/PBRwPZr
 RmIL2v04jR5/CkARZmc5EncuxYY8FOUnXBWCt5aAbkJrUrvtoW6LMR7+QUoPjWqkmrzl
 h+uwfdDuMstoGxS+pWoIsz2CV6SVvzg7SVMQOaAenZsNBCUqxg6j+jNIbmYpJ2uBo9R6
 QEsl8sDNdnDHgWfgl4qrv24x2cpbas1/DqtNVaemgijDU9UvOqRo/4DgYTk565v8SRFq
 9+jrVaUeDMiFABoN7CvxyNCkKDsIy/Luy5/88wGYFKKkEWuPdIa0UICY/+a4vVE88vz9
 zCPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfNJEb/+ZzNwdOnjM2JGgsKw6HbEnId9JvmaylQzTdVT6rPMh0LzbCnoMNBYpfzd952n8x5SZudg==@nongnu.org
X-Gm-Message-State: AOJu0YxLkZIgHVBFfAeRjjWq6cVzbZhqpbj9lIyyi17WrRmF+RJoPqjh
 wOZat0ef2H8J+Vc0ry9lTm3KupGsqQSk1QZL0vojst3gHZMqsSOqTyjLha/4eVjwqCM=
X-Gm-Gg: ASbGncvDQTLW5udrIawP4GP7xGwo6qj/sBtEtScdmf1G32YtHnhks2ugtIPf/2qYHK/
 ZH89Wd20AiSjymGOl1/Laka0hM0AT4vlpZjGEC1zKhW+sG94LOgHyUxStxCvlYgiGe5VNRc9bqp
 4A7GoYHzJtPYX59InLEXL+j4+4/GXOLeiy9TVKR+U39RxxY2THzMgFRV7OglEg/LDAtm0qvEIq1
 D4fzYoHvHdinPXyttzitGCICgVKPh62h4kDdrW8ABaDO1NlCM9GTr29nd2eqrfyrTRdykjFZvt0
 k2McO4bw854u3QIfp/n2WWPNkbcDtKw3kTXQ5Iv3iWSATNp/KT2UYUEDtHKps0wGvEWx+kKoFu6
 J/juu5n0mAxdyCaeb4O7MHeTV+fgG1Q==
X-Received: by 2002:a17:902:fc46:b0:231:bf74:e1df with SMTP id
 d9443c01a7336-231de3515demr238550995ad.7.1747771216649; 
 Tue, 20 May 2025 13:00:16 -0700 (PDT)
Received: from ?IPV6:2804:7f0:b401:d47f:6989:b93e:2caa:f174?
 ([2804:7f0:b401:d47f:6989:b93e:2caa:f174])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-231d4ebaef0sm80368435ad.203.2025.05.20.13.00.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 May 2025 13:00:16 -0700 (PDT)
Message-ID: <9b996b3a-cc60-499e-a8a6-028f16156180@linaro.org>
Date: Tue, 20 May 2025 17:00:03 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/22] hw/i386/acpi-build: Introduce and use
 acpi_get_pci_host
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 imammedo@redhat.com, anisinha@redhat.com, mst@redhat.com,
 shannon.zhaosl@gmail.com
Cc: pbonzini@redhat.com, Jonathan.Cameron@huawei.com, philmd@linaro.org
References: <20250514170431.2786231-1-eric.auger@redhat.com>
 <20250514170431.2786231-14-eric.auger@redhat.com>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <20250514170431.2786231-14-eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: aecUpw150Fqa

Hi Eric,

On 5/14/25 14:01, Eric Auger wrote:
> pcihp acpi_set_pci_info() generic code currently uses
> acpi_get_i386_pci_host() to retrieve the pci host bridge.
> 
> Let's rename acpi_get_i386_pci_host into acpi_get_pci_host and
> move it in pci generic code.
> 
> The helper is augmented with the support of ARM GPEX.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>   include/hw/acpi/pci.h |  2 ++
>   hw/acpi/pci.c         | 20 ++++++++++++++++++++
>   hw/acpi/pcihp.c       |  3 ++-
>   hw/i386/acpi-build.c  | 24 ++++--------------------
>   4 files changed, 28 insertions(+), 21 deletions(-)
> 
> diff --git a/include/hw/acpi/pci.h b/include/hw/acpi/pci.h
> index 4dca22c0e2..310cbd02db 100644
> --- a/include/hw/acpi/pci.h
> +++ b/include/hw/acpi/pci.h
> @@ -41,4 +41,6 @@ void build_pci_bridge_aml(AcpiDevAmlIf *adev, Aml *scope);
>   
>   void build_srat_generic_affinity_structures(GArray *table_data);
>   
> +Object *acpi_get_pci_host(void);
> +
>   #endif
> diff --git a/hw/acpi/pci.c b/hw/acpi/pci.c
> index d511a85029..4191886ebe 100644
> --- a/hw/acpi/pci.c
> +++ b/hw/acpi/pci.c
> @@ -26,6 +26,7 @@
>   #include "qemu/osdep.h"
>   #include "qemu/error-report.h"
>   #include "qom/object_interfaces.h"
> +#include "qom/object.h"
>   #include "qapi/error.h"
>   #include "hw/boards.h"
>   #include "hw/acpi/aml-build.h"
> @@ -33,6 +34,9 @@
>   #include "hw/pci/pci_bridge.h"
>   #include "hw/pci/pci_device.h"
>   #include "hw/pci/pcie_host.h"
> +#include "hw/pci-host/i440fx.h"
> +#include "hw/pci-host/q35.h"
> +#include "hw/pci-host/gpex.h"
>   
>   /*
>    * PCI Firmware Specification, Revision 3.0
> @@ -301,3 +305,19 @@ void build_srat_generic_affinity_structures(GArray *table_data)
>       object_child_foreach_recursive(object_get_root(), build_acpi_generic_port,
>                                      table_data);
>   }
> +
> +Object *acpi_get_pci_host(void)
> +{
> +    Object *host;
> +
> +    host = object_resolve_type_unambiguous(TYPE_I440FX_PCI_HOST_BRIDGE, NULL);
> +    if (host) {
> +        return host;
> +    }
> +    host = object_resolve_type_unambiguous(TYPE_Q35_HOST_DEVICE, NULL);
> +    if (host) {
> +        return host;
> +    }
> +    host = object_resolve_type_unambiguous(TYPE_GPEX_HOST, NULL);
> +    return host;
> +}
> diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> index 942669ea89..d800371ddc 100644
> --- a/hw/acpi/pcihp.c
> +++ b/hw/acpi/pcihp.c
> @@ -36,6 +36,7 @@
>   #include "hw/pci-bridge/xio3130_downstream.h"
>   #include "hw/i386/acpi-build.h"
>   #include "hw/acpi/acpi.h"
> +#include "hw/acpi/pci.h"
>   #include "hw/pci/pci_bus.h"
>   #include "migration/vmstate.h"
>   #include "qapi/error.h"
> @@ -102,7 +103,7 @@ static void *acpi_set_bsel(PCIBus *bus, void *opaque)
>   static void acpi_set_pci_info(bool has_bridge_hotplug)
>   {
>       static bool bsel_is_set;
> -    Object *host = acpi_get_i386_pci_host();
> +    Object *host = acpi_get_pci_host();
>       PCIBus *bus;
>       BSELInfo info = { .bsel_alloc = ACPI_PCIHP_BSEL_DEFAULT,
>                         .has_bridge_hotplug = has_bridge_hotplug };
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 06b4b8eed4..bcfba2ccb3 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -269,27 +269,11 @@ static void acpi_get_misc_info(AcpiMiscInfo *info)
>   #endif
>   }
>   
> -/*
> - * Because of the PXB hosts we cannot simply query TYPE_PCI_HOST_BRIDGE.
> - * On i386 arch we only have two pci hosts, so we can look only for them.
> - */
> -Object *acpi_get_i386_pci_host(void)
> -{
> -    PCIHostState *host;
> -
> -    host = PCI_HOST_BRIDGE(object_resolve_path("/machine/i440fx", NULL));
> -    if (!host) {
> -        host = PCI_HOST_BRIDGE(object_resolve_path("/machine/q35", NULL));
> -    }
> -
> -    return OBJECT(host);
> -}
> -

It's also possible to add a child prop to the TYPE_GPEX_HOST in create_pcie, like:

@@ -1510,6 +1510,7 @@ static void create_pcie(VirtMachineState *vms)
      MachineClass *mc = MACHINE_GET_CLASS(ms);
  
      dev = qdev_new(TYPE_GPEX_HOST);
+    object_property_add_child(OBJECT(vms), "gpex", OBJECT(dev));

then follow to logic in acpi_get_i386_pci_host via:

PCI_HOST_BRIDGE(object_resolve_path("/machine/gpex", NULL))

but I like better your solution of using the final class types, so:

Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>


Cheers,
Gustavo

>   static void acpi_get_pci_holes(Range *hole, Range *hole64)
>   {
>       Object *pci_host;
>   
> -    pci_host = acpi_get_i386_pci_host();
> +    pci_host = acpi_get_pci_host();
>   
>       if (!pci_host) {
>           return;
> @@ -1245,7 +1229,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>   
>       sb_scope = aml_scope("\\_SB");
>       {
> -        Object *pci_host = acpi_get_i386_pci_host();
> +        Object *pci_host = acpi_get_pci_host();
>   
>           if (pci_host) {
>               PCIBus *pbus = PCI_HOST_BRIDGE(pci_host)->bus;
> @@ -1306,7 +1290,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>       if (pm->pcihp_bridge_en || pm->pcihp_root_en) {
>           bool has_pcnt;
>   
> -        Object *pci_host = acpi_get_i386_pci_host();
> +        Object *pci_host = acpi_get_pci_host();
>           PCIBus *b = PCI_HOST_BRIDGE(pci_host)->bus;
>   
>           scope = aml_scope("\\_SB.PCI0");
> @@ -1946,7 +1930,7 @@ static bool acpi_get_mcfg(AcpiMcfgInfo *mcfg)
>       Object *pci_host;
>       QObject *o;
>   
> -    pci_host = acpi_get_i386_pci_host();
> +    pci_host = acpi_get_pci_host();
>       if (!pci_host) {
>           return false;
>       }

