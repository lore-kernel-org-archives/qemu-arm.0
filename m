Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp4820881njc;
        Tue, 27 May 2025 06:37:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVsm2OETK8MO5E1jUHuy60w8eEoGeDj9Y86hoEkgGyDE8ClRYqvZQEFWvSHC0t+wK0Dw0vEqj2Kdn45iA==@linaro.org
X-Google-Smtp-Source: AGHT+IFBnpDaTXcMsMkV47p80eRManB9WlFjWtZ2amDxgCfGTOIqew43vYAJ3L4PRGG8FBU7TjeV
X-Received: by 2002:a05:620a:270f:b0:7ce:b7d2:84c4 with SMTP id af79cd13be357-7cf06d3d567mr90574785a.7.1748353072664;
        Tue, 27 May 2025 06:37:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748353072; cv=none;
        d=google.com; s=arc-20240605;
        b=bcdC4WOlofpXJYpWYiyrF/Y1WZuLHh4P6jGMdYvDLrz5XYPIOipubX6QcQ+jXe4mfW
         Pc4nIHBnSFas4MOjX+TTNMpfS5ZcAutWnLwcr0WOVj08ir4YMm2/NeCXpF2sBzazbidH
         FUShVL0KtykiONlW8btBNGclwRBeriHqpfP/aH22+l+xNiAI0cmYv+FCX/aSDtNV+UMO
         3RSNhWOb8R9r+tL4pNXXHvJS87xKFa9RYJyCTXB6UabU7LdtCOaOL/Ev0ZnfGvlTAjVp
         PUFMpHx2Kc406/g6s6fTSSXIu34Xyu4r1vXe6ehr6UemGWnX2Ve/zGAOcDWI2F+G5aU4
         R8aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=0SQ5kQwicfysbKtjpVJhFRMadZlT2IejENdYEybwg8Y=;
        fh=YMgHEAP4BzWgDB8FhT0K/nisdGtCJmvolZoN3rScdx8=;
        b=egyESpSqG1bbaHukyMAbPX9BwtWx1dp6SIevWnYYjQcdJpCMUI5oJWfIALBAOBucMl
         qIW50ttYT9GkHaB3dZIrFFULXp1YYP5xXmFIBdO8obyhw7F/tE/s8SQsOInM10qf2sbp
         Yj+Q2Eh9TZVhQwC+3fw6ph0mN+9KtweUQrTCDPnYDxhKSYVQidITkgXCI4RcJk56FA5/
         apt0TEKv+L6IDYGhfVozAZLlWI5EjfC6cs6+qapIn4F9OXB18i37hX6y0lRo/HSBLwOl
         g0aIJFuNb83w6M+s6kdfbLXeBn4le6lNvFpB5PAtW6mkEBueI4Ri3OkHKz65ttcHcEFV
         jM0Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=K57xIgYs;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7cd467ea2fbsi2613864985a.184.2025.05.27.06.37.52
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 06:37:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=K57xIgYs;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748353072;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0SQ5kQwicfysbKtjpVJhFRMadZlT2IejENdYEybwg8Y=;
	b=K57xIgYsoHE/OBMHZ9QheyJsPsDWVVFz0QJsDnlLDQdxyMnY09dA75NvNJlKBrMkUDzg+y
	emAM53NtleMKLv2DKj/3p98WH55ErcK9SXY1k2/rOAtpvYToaKyAmidNGMQthzsICQAl+k
	Bgd6W7p2mUx6zzq90U1ATDeR9PYzLiY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-180--FU2XtPeNeiaL1Dn4a9_Vw-1; Tue, 27 May 2025 09:37:50 -0400
X-MC-Unique: -FU2XtPeNeiaL1Dn4a9_Vw-1
X-Mimecast-MFC-AGG-ID: -FU2XtPeNeiaL1Dn4a9_Vw_1748353070
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43d5ca7c86aso20123895e9.0
        for <alex.bennee@linaro.org>; Tue, 27 May 2025 06:37:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748353069; x=1748957869;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0SQ5kQwicfysbKtjpVJhFRMadZlT2IejENdYEybwg8Y=;
        b=gYmsTsYyl6WMEIvvcl/U0Ecc3YxSI1++VqHxT9Knl93lR/rolEpFJ2VXz9hBYI622/
         /MwDnTWm/AutFniy2RUFqXzz5uQ/nEQBf2S8jif+tatkpwvGgTIHUkGurepFcLos3FYB
         h+OhgXSHQMpIavY98t0ARbKTrcxzvsZ5MBsiVJ1Ir90qS9zODH5aaHSSTF5HSSfpgvwH
         WMAY8QyDSlAHTlTSqXM9LZc57MEAIqYAuU4YXZE8bsOspCZnUv5rOXmD59Trzn53T2+z
         YI+aNIyysHZtrlgTKYc/BorYip1pQzTURPmbGbgw1wa9acQYi6DW+b9t/RzdgaKJhIIN
         e08w==
X-Forwarded-Encrypted: i=1; AJvYcCU1IPVKjyBZBifnxsvBYkmkJo21AKE7RL94lwjykg+g8/XPzuZ+EoGVskoriYY6xsuE4frCowDRTJK6SA==@linaro.org
X-Gm-Message-State: AOJu0Yw8iYsSQHGwWL1TpIqskJXqOYPOqAv7d5av5OZ40z6jI8PH2Ec0
	UTKCw+xANFgeFdxMwkOxNXsDpeBNb3+CQFcZ+NrqtetQFuQVguEo4/uN85i/hxtRUru5q0HJgkD
	+BxuJw7pE13/FNjx4eTsC/n5ygHf8tf5Ft9SAzz1edYH6hE9lxdTPUNp9HA==
X-Gm-Gg: ASbGncuHQFX84JV8DG+2/0f15QLaUpHEJXWci15OcHXQPPK/BXnOd2H2OCw5grqXoJG
	Rd4JB7cK72sIQKonPcFPByuTPXbchS+AhnGWO1a5qC2cBmsp4LOTHCa2DYeo+AYf0a8Jt7YffUu
	SGQ1STMpBY7Aob6226Rv0E0FuLuAsp4O/Uk4gl0CGMy8viH3jzaBOE74CzbNYDuK6jWNFD4DGQ8
	YzHrromApI/vPzTcK/kVvuSf4OkKfHU51ktieXeO3F/W9ofkbMUyam/+T7w0EytDu0PosIOyR/8
	I3MP6l4t0uMsFg8MvGAPdb1+U+Q72CIE
X-Received: by 2002:a05:600c:1388:b0:442:f4a3:b5f2 with SMTP id 5b1f17b1804b1-44c916fc5efmr114842915e9.6.1748353069470;
        Tue, 27 May 2025 06:37:49 -0700 (PDT)
X-Received: by 2002:a05:600c:1388:b0:442:f4a3:b5f2 with SMTP id 5b1f17b1804b1-44c916fc5efmr114842455e9.6.1748353068980;
        Tue, 27 May 2025 06:37:48 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com ([85.93.96.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f3dd9c65sm279954375e9.39.2025.05.27.06.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 06:37:46 -0700 (PDT)
Date: Tue, 27 May 2025 15:37:45 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, gustavo.romero@linaro.org, anisinha@redhat.com,
 mst@redhat.com, shannon.zhaosl@gmail.com, pbonzini@redhat.com,
 Jonathan.Cameron@huawei.com, philmd@linaro.org, alex.bennee@linaro.org
Subject: Re: [PATCH v2 13/25] hw/i386/acpi-build: Move
 build_append_notification_callback to pcihp
Message-ID: <20250527153745.70c39f4c@imammedo.users.ipa.redhat.com>
In-Reply-To: <20250527074224.1197793-14-eric.auger@redhat.com>
References: <20250527074224.1197793-1-eric.auger@redhat.com>
	<20250527074224.1197793-14-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GyKxGNWgsiMVcTZOPP2CgdDxze7Rhpis8vDBJtFsCmA_1748353070
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: 7cfnNI1YVbMO

On Tue, 27 May 2025 09:40:15 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> We plan to reuse build_append_notification_callback() on ARM
> so let's move it to pcihp.c.
> 
> No functional change intended.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  include/hw/acpi/pcihp.h |  1 +
>  hw/acpi/pcihp.c         | 58 +++++++++++++++++++++++++++++++++++++++++
>  hw/i386/acpi-build.c    | 58 -----------------------------------------
>  3 files changed, 59 insertions(+), 58 deletions(-)
> 
> diff --git a/include/hw/acpi/pcihp.h b/include/hw/acpi/pcihp.h
> index 253ac6e483..f4fd44cb32 100644
> --- a/include/hw/acpi/pcihp.h
> +++ b/include/hw/acpi/pcihp.h
> @@ -78,6 +78,7 @@ void build_acpi_pci_hotplug(Aml *table, AmlRegionSpace rs, uint64_t pcihp_addr);
>  void build_append_pci_dsm_func0_common(Aml *ctx, Aml *retvar);
>  void build_append_pcihp_resources(Aml *table,
>                                    uint64_t io_addr, uint64_t io_len);
> +bool build_append_notification_callback(Aml *parent_scope, const PCIBus *bus);
>  
>  /* Called on reset */
>  void acpi_pcihp_reset(AcpiPciHpState *s);
> diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> index 310a5c54bd..907a08ac7f 100644
> --- a/hw/acpi/pcihp.c
> +++ b/hw/acpi/pcihp.c
> @@ -39,6 +39,7 @@
>  #include "migration/vmstate.h"
>  #include "qapi/error.h"
>  #include "qom/qom-qobject.h"
> +#include "qobject/qnum.h"
>  #include "trace.h"
>  
>  #define ACPI_PCIHP_SIZE 0x0018
> @@ -705,6 +706,63 @@ void build_append_pcihp_resources(Aml *scope /* \\_SB.PCI0 */,
>      aml_append(scope, dev);
>  }
>  
> +bool build_append_notification_callback(Aml *parent_scope, const PCIBus *bus)
> +{
> +    Aml *method;
> +    PCIBus *sec;
> +    QObject *bsel;
> +    int nr_notifiers = 0;
> +    GQueue *pcnt_bus_list = g_queue_new();
> +
> +    QLIST_FOREACH(sec, &bus->child, sibling) {
> +        Aml *br_scope = aml_scope("S%.02X", sec->parent_dev->devfn);
> +        if (pci_bus_is_root(sec)) {
> +            continue;
> +        }
> +        nr_notifiers = nr_notifiers +
> +                       build_append_notification_callback(br_scope, sec);
> +        /*
> +         * add new child scope to parent
> +         * and keep track of bus that have PCNT,
> +         * bus list is used later to call children PCNTs from this level PCNT
> +         */
> +        if (nr_notifiers) {
> +            g_queue_push_tail(pcnt_bus_list, sec);
> +            aml_append(parent_scope, br_scope);
> +        }
> +    }
> +
> +    /*
> +     * Append PCNT method to notify about events on local and child buses.
> +     * ps: hostbridge might not have hotplug (bsel) enabled but might have
> +     * child bridges that do have bsel.
> +     */
> +    method = aml_method("PCNT", 0, AML_NOTSERIALIZED);
> +
> +    /* If bus supports hotplug select it and notify about local events */
> +    bsel = object_property_get_qobject(OBJECT(bus), ACPI_PCIHP_PROP_BSEL, NULL);
> +    if (bsel) {
> +        uint64_t bsel_val = qnum_get_uint(qobject_to(QNum, bsel));
> +
> +        aml_append(method, aml_store(aml_int(bsel_val), aml_name("BNUM")));
> +        aml_append(method, aml_call2("DVNT", aml_name("PCIU"),
> +                                     aml_int(1))); /* Device Check */
> +        aml_append(method, aml_call2("DVNT", aml_name("PCID"),
> +                                     aml_int(3))); /* Eject Request */
> +        nr_notifiers++;
> +    }
> +
> +    /* Notify about child bus events in any case */
> +    while ((sec = g_queue_pop_head(pcnt_bus_list))) {
> +        aml_append(method, aml_name("^S%.02X.PCNT", sec->parent_dev->devfn));
> +    }
> +
> +    aml_append(parent_scope, method);
> +    qobject_unref(bsel);
> +    g_queue_free(pcnt_bus_list);
> +    return !!nr_notifiers;
> +}
> +
>  const VMStateDescription vmstate_acpi_pcihp_pci_status = {
>      .name = "acpi_pcihp_pci_status",
>      .version_id = 1,
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 6ca2b34ef8..3275675e60 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -563,64 +563,6 @@ void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus)
>      }
>  }
>  
> -static bool build_append_notification_callback(Aml *parent_scope,
> -                                               const PCIBus *bus)
> -{
> -    Aml *method;
> -    PCIBus *sec;
> -    QObject *bsel;
> -    int nr_notifiers = 0;
> -    GQueue *pcnt_bus_list = g_queue_new();
> -
> -    QLIST_FOREACH(sec, &bus->child, sibling) {
> -        Aml *br_scope = aml_scope("S%.02X", sec->parent_dev->devfn);
> -        if (pci_bus_is_root(sec)) {
> -            continue;
> -        }
> -        nr_notifiers = nr_notifiers +
> -                       build_append_notification_callback(br_scope, sec);
> -        /*
> -         * add new child scope to parent
> -         * and keep track of bus that have PCNT,
> -         * bus list is used later to call children PCNTs from this level PCNT
> -         */
> -        if (nr_notifiers) {
> -            g_queue_push_tail(pcnt_bus_list, sec);
> -            aml_append(parent_scope, br_scope);
> -        }
> -    }
> -
> -    /*
> -     * Append PCNT method to notify about events on local and child buses.
> -     * ps: hostbridge might not have hotplug (bsel) enabled but might have
> -     * child bridges that do have bsel.
> -     */
> -    method = aml_method("PCNT", 0, AML_NOTSERIALIZED);
> -
> -    /* If bus supports hotplug select it and notify about local events */
> -    bsel = object_property_get_qobject(OBJECT(bus), ACPI_PCIHP_PROP_BSEL, NULL);
> -    if (bsel) {
> -        uint64_t bsel_val = qnum_get_uint(qobject_to(QNum, bsel));
> -
> -        aml_append(method, aml_store(aml_int(bsel_val), aml_name("BNUM")));
> -        aml_append(method, aml_call2("DVNT", aml_name("PCIU"),
> -                                     aml_int(1))); /* Device Check */
> -        aml_append(method, aml_call2("DVNT", aml_name("PCID"),
> -                                     aml_int(3))); /* Eject Request */
> -        nr_notifiers++;
> -    }
> -
> -    /* Notify about child bus events in any case */
> -    while ((sec = g_queue_pop_head(pcnt_bus_list))) {
> -        aml_append(method, aml_name("^S%.02X.PCNT", sec->parent_dev->devfn));
> -    }
> -
> -    aml_append(parent_scope, method);
> -    qobject_unref(bsel);
> -    g_queue_free(pcnt_bus_list);
> -    return !!nr_notifiers;
> -}
> -
>  /*
>   * build_prt - Define interrupt routing rules
>   *
