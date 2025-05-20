Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp718882njc;
        Tue, 20 May 2025 11:59:21 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWGQgdBCjWRxtGenwVUvrK9VDld91xcMj9u0STI5WYGp649TDpoR8A+gHtrfQk/iyzUZulsxkMd0K/uiQ==@linaro.org
X-Google-Smtp-Source: AGHT+IG1PYBN0q7WZBoUeL8hP09u+PMHvklk6tgwyAP2HWKFllMg2wKIvRzOQZMnyke1vdUX+GoK
X-Received: by 2002:a05:620a:361e:b0:7ce:bc1a:4902 with SMTP id af79cd13be357-7cebc1a4a05mr1064383485a.13.1747767561325;
        Tue, 20 May 2025 11:59:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747767561; cv=none;
        d=google.com; s=arc-20240605;
        b=BhBTeG9TEvkBM47InLY7x1ol9gLJPYJW2DTQTA5le9w7z86AToZLxdjtGTNyITXD8a
         IHR7Cn6KrxmbTia8yTTaxTTLD4ObA+Xk4r1ppmUd0L+ik/ELwuKYraKtEtTGrC7sbVce
         6qJaptXLGFb8OeKMdJyFc4SZdNDAWtIQTAXPX24zAWqRX618JoI2MznKnABT+8FzbHFm
         FTVzvlruqIlTNr644hPcXoA4AhUX+wynV8SAHhD8aBSTROpPhpkW+/6Kyu7GexErAJqO
         UwjqhxmsZLEEkZ67GSNPBwqmtppyBEaHxKnuZsHZ2VNBv6jNdyDZ9liquFLJUxVb72qn
         1WNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=BghkL5YTYyzBopr8l6K7Nfeo1AvLqxr9rgJv299vPXQ=;
        fh=FvVv/VFe+np7CUmA0zWinjs/TcJu1zDOT/OTyCxBRUo=;
        b=Nt1uLOoCmLbi3BgWRyWfKrNY/ASa3/zc+61jcL3553O9J7vDHv+qo7CAvGc9stHIY/
         KXBKs5VLYkV6rozv704xIkfDMAPRWdCxz6dpp0M/8gABFfkvJCmhJ/LfSdA+ioPeRZoO
         SlUeg9tq7/0aFrAlVsd0vnI8TVg8FKrX7boKv9X5LVHhbGUpxtNdRiFL1tMWcGGLrRro
         LSZsG4aP0M8WmrtrLMFsv/JIeW3qFPVO+95LODvXZj9OIVbz5M2+BX1MtXtrezAAjX63
         JRAwz2uKL5Rm/LBLCGvwWfiSSshrvdXTTniKGgxV3g2ZjfwhObeB9Xxkrwc6WgZowoMl
         7Drw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="v7cNDeG/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7cd468b24b4si1143332585a.388.2025.05.20.11.59.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 May 2025 11:59:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="v7cNDeG/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uHSAv-0007TY-GT; Tue, 20 May 2025 14:58:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uHSAt-0007TA-EC
 for qemu-arm@nongnu.org; Tue, 20 May 2025 14:58:51 -0400
Received: from mail-ua1-x933.google.com ([2607:f8b0:4864:20::933])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uHSAr-0006wV-5o
 for qemu-arm@nongnu.org; Tue, 20 May 2025 14:58:51 -0400
Received: by mail-ua1-x933.google.com with SMTP id
 a1e0cc1a2514c-877c48657f9so1289890241.1
 for <qemu-arm@nongnu.org>; Tue, 20 May 2025 11:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747767527; x=1748372327; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BghkL5YTYyzBopr8l6K7Nfeo1AvLqxr9rgJv299vPXQ=;
 b=v7cNDeG/G9XWHujpiMrwz/UrSTiNm7xxciQJ31/PguNrMMpVJ4HG5IjBwEQETpa47A
 ZbYjf/jTdhlqMyrnIJ/w1NbJwwZ0AvUYcMtDnm2qahTSfJ5bZJ/BdfxgBRGqv8/jWTnA
 +8V/rXjdmCobmcnISXQMMrYs0CvKPBGAppf1qnrJrreEvba9wJnnIbhKKGVrBWxFjq3b
 f/6bRofOeFJy/5QmHCQ2cNnpcAya/Si+oSfTROHgdSJetJtsVlPkXUDAvDvsG7j4tr4b
 SMKBncjCakXLpAb0/p0uFAkE1rj1S/03WUnP6RUn8eDIa+OVscYsEzG2RlABk+U71YH/
 k6RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747767527; x=1748372327;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BghkL5YTYyzBopr8l6K7Nfeo1AvLqxr9rgJv299vPXQ=;
 b=as1LfAXJmotkblN44q61j2bifFWWY+dbZy80DIJ2J3lc6dANc9p/E4AmwT3DlROagA
 FiEzyKvjMn9WBdWlSP6HjfrnTKv6AhrMw2w/y8fLEcKtDPGGCnG7HUfWxg3KssxyBA7C
 m21pKOd3Jnys1NrjM3CnZG1Gz+4/fCzxuipoR/jP1lpAOTyw5sPLXRnyuQLEyEFvpS2c
 MPJbThtQv+tia5A9FFGNTyuuPDivOU5BFXV9QSIa79P0WJVwC7VOXfX6iQLbV73Yd7gU
 Nxbt03Yysjk+cDSCIM0q9j+I34Myvgcata8WXyjqMybttj58rrl+Gjz2uZ217vh8NLLh
 nX8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCX5mdj/yrdRQieQsA6DozXvFkAl+vlXQlFyyXHAfs8Jb6+JgWm6P3K8TFoHWCKDwZkU13fnqg/6rA==@nongnu.org
X-Gm-Message-State: AOJu0Yxz+D3EN47CSUeu8mCqigL2Liu8oFKWwIJNWyEKy8GyAxa8eU1P
 CjV6uxx/sKyv7GSHoVjMWiHlGNPyqVXGIWbyPWDWIpJckyGLZXJO3tWiwe6U9Z/ByhQ=
X-Gm-Gg: ASbGncsbIlosLC3iV2MJ4cdO0dD2eppfSH0qNsXuC0PDJnBkr5pFuTHd19z3nVsPDON
 kE6v47QJBZQlEQKPi01koGqUuko+drw0ep/2X9lMUnf0+yg3Rk3T+ZME8tDGXHNMJ/x5ovPVTOY
 PuIeumzqF2h7PudYd3optSK0J7ZYRfL40mBMGhTrbU4RuKJ7/iGPLHKpWoLjwFacdMCl/xEGQDG
 PGCsZ7tt5qs1Ne9ILS8ZKT9SZ0n17aBJQewHPpIH3n+eRi8wLuN68IegRNd/nvBBGRUQKwP7Dm3
 RyjqH9N8y66+Xetjr2Ajp06vT6X3eI0/gDJE3erzOKRSTTbDsImFJlK0DeURwBYiC3QipAv5Ib8
 esb+v9O5LwSOBgSsqJOoeGAvDy1eNEQ==
X-Received: by 2002:a05:6102:b0f:b0:4e2:a132:c50c with SMTP id
 ada2fe7eead31-4e2a132c627mr6833556137.2.1747767527256; 
 Tue, 20 May 2025 11:58:47 -0700 (PDT)
Received: from ?IPV6:2804:7f0:b401:d47f:6989:b93e:2caa:f174?
 ([2804:7f0:b401:d47f:6989:b93e:2caa:f174])
 by smtp.gmail.com with ESMTPSA id
 a1e0cc1a2514c-87bec155e21sm7834268241.17.2025.05.20.11.58.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 May 2025 11:58:46 -0700 (PDT)
Message-ID: <fef4807e-a407-49ac-8e52-5767f9e1f6cf@linaro.org>
Date: Tue, 20 May 2025 15:58:34 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/22] hw/i386/acpi-build: Move
 build_append_notification_callback to pcihp
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 imammedo@redhat.com, anisinha@redhat.com, mst@redhat.com,
 shannon.zhaosl@gmail.com
Cc: pbonzini@redhat.com, Jonathan.Cameron@huawei.com, philmd@linaro.org
References: <20250514170431.2786231-1-eric.auger@redhat.com>
 <20250514170431.2786231-12-eric.auger@redhat.com>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <20250514170431.2786231-12-eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::933;
 envelope-from=gustavo.romero@linaro.org; helo=mail-ua1-x933.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
X-TUID: er9jviSGLPly

Hi Eric,

On 5/14/25 14:00, Eric Auger wrote:
> We plan to reuse build_append_notification_callback() on ARM
> so let's move it to pcihp.c.
> 
> No functional change intended.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>   include/hw/acpi/pcihp.h |  1 +
>   hw/acpi/pcihp.c         | 58 +++++++++++++++++++++++++++++++++++++++++
>   hw/i386/acpi-build.c    | 58 -----------------------------------------
>   3 files changed, 59 insertions(+), 58 deletions(-)

Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>


Cheers,
Gustavo

> diff --git a/include/hw/acpi/pcihp.h b/include/hw/acpi/pcihp.h
> index 525e61a2a9..7c5d59243f 100644
> --- a/include/hw/acpi/pcihp.h
> +++ b/include/hw/acpi/pcihp.h
> @@ -78,6 +78,7 @@ void build_acpi_pci_hotplug(Aml *table, AmlRegionSpace rs, uint64_t pcihp_addr);
>   void build_append_pci_dsm_func0_common(Aml *ctx, Aml *retvar);
>   void build_append_pcihp_resources(Aml *table,
>                                     uint64_t io_addr, uint64_t io_len);
> +bool build_append_notification_callback(Aml *parent_scope, const PCIBus *bus);
>   
>   /* Called on reset */
>   void acpi_pcihp_reset(AcpiPciHpState *s);
> diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> index 310a5c54bd..907a08ac7f 100644
> --- a/hw/acpi/pcihp.c
> +++ b/hw/acpi/pcihp.c
> @@ -39,6 +39,7 @@
>   #include "migration/vmstate.h"
>   #include "qapi/error.h"
>   #include "qom/qom-qobject.h"
> +#include "qobject/qnum.h"
>   #include "trace.h"
>   
>   #define ACPI_PCIHP_SIZE 0x0018
> @@ -705,6 +706,63 @@ void build_append_pcihp_resources(Aml *scope /* \\_SB.PCI0 */,
>       aml_append(scope, dev);
>   }
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
>   const VMStateDescription vmstate_acpi_pcihp_pci_status = {
>       .name = "acpi_pcihp_pci_status",
>       .version_id = 1,
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 87bb3d5cee..f08ce407c8 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -563,64 +563,6 @@ void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus)
>       }
>   }
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
>   /*
>    * build_prt - Define interrupt routing rules
>    *

