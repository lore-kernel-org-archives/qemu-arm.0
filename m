Received: by 2002:a17:906:14cc:b0:9b2:89ee:1eb8 with SMTP id y12csp91736ejc;
        Wed, 4 Oct 2023 22:56:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFIXFBggd0n5yp8699TBolDEAc0FhqICNmSGzltmkyMP85kGD04hkjIPJS71oOMSXtmv1F3
X-Received: by 2002:a05:620a:46ab:b0:773:ac84:3f57 with SMTP id bq43-20020a05620a46ab00b00773ac843f57mr2158899qkb.5.1696485377703;
        Wed, 04 Oct 2023 22:56:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1696485377; cv=none;
        d=google.com; s=arc-20160816;
        b=hYCMDljeYPJscLuXzrjmXSrxMYxnsIyyzQ+a9u/ACHvlwO5QUEbsNtBfx+Uqw5hely
         Iv3A6OJiOk/64lyaxSM8lQUG9D1YUJTPI8Pl/DucAokM1+skRcCCE4mh75N6vBvl5nO+
         qBX6B8oNdCsVdvSVl7kZA4mLRr2i/6dCbyoKeOcciTHv7Tx/uboEQa5AYcpjd8pqEC6h
         SeAgMWm9UtdC5W5UpYCZYsSnEWau06Eegi3YYlSdNA1lLSfYpdXIFdysB9Jfn/2dimHq
         GphWtwxhTTIrMizJOEN0enII17+GnyFOoHWaSZhD2Zm5w9Hcnd8HmaO8gG4WGPVLTBtG
         lvkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id;
        bh=MQDQ/IdPqgy9QOhKGakX8ldLMrhswD2LcoLE9zTXiDw=;
        fh=r+3leG1A75C6Wk6ksmTdxCNFc1EYum2vbQBV1ayLLGI=;
        b=CqSm9zHpCR4oIRuBa1OVINvYZIe4FbMwtu4awYSoh9LbIFWJqZ2N1J+cF2/cVtmld+
         hpPxv7Vwz848qzGqGNYIzd0MDhPPumdFXdJqrh8+UJQmHuZLF4/Rnu/ik7jKpO93GO0a
         GpCpK5K1MHAQb2MhlZ4gYUE8NNeHFWo2PFYa9DE0LFZXjQhX2qpsTkl6Xw+tEdCdo5jM
         pEUMJ453gDPH5rGSYa/9qGLoJueEp2I7bks4O8uXSRjUt4J/AWH1KX4DNbviZxwpsUVE
         iKssvCRkNgdco18tbc6UaA3xFwvnkoKy6N8t388XgfeQ5ChnSd4GQO6vejJB2P8d9QvL
         8olA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id tn24-20020a05620a3c1800b00775a1063051si449002qkn.501.2023.10.04.22.56.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Oct 2023 22:56:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qoHL4-0007uv-7t; Thu, 05 Oct 2023 01:55:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=AqEq=FT=kaod.org=clg@ozlabs.org>)
 id 1qoHL0-0007tm-UB; Thu, 05 Oct 2023 01:55:55 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=AqEq=FT=kaod.org=clg@ozlabs.org>)
 id 1qoHKy-0002WD-JJ; Thu, 05 Oct 2023 01:55:54 -0400
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4S1LQ40kZBz4xQW;
 Thu,  5 Oct 2023 16:55:40 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4S1LPz5S0Tz4xLy;
 Thu,  5 Oct 2023 16:55:35 +1100 (AEDT)
Message-ID: <a0e552ad-e3fd-6ff7-fd92-6be890ddce47@kaod.org>
Date: Thu, 5 Oct 2023 07:55:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v2 01/22] qapi: Inline and remove QERR_BUS_NO_HOTPLUG
 definition
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-block@nongnu.org,
 qemu-s390x@nongnu.org, Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Harsh Prateek Bora <harshpb@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Eduardo Habkost <eduardo@habkost.net>
References: <20231005045041.52649-1-philmd@linaro.org>
 <20231005045041.52649-2-philmd@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20231005045041.52649-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=AqEq=FT=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.528, SPF_HELO_PASS=-0.001,
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
X-TUID: 2JmjDbLTin/r

On 10/5/23 06:50, Philippe Mathieu-Daudé wrote:
> Address the comment added in commit 4629ed1e98
> ("qerror: Finally unused, clean up"), from 2015:
> 
>    /*
>     * These macros will go away, please don't use
>     * in new code, and do not add new ones!
>     */
> 
> Mechanical transformation using sed, manually
> removing the definition in include/qapi/qmp/qerror.h.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

Thanks,

C.


> ---
>   include/qapi/qmp/qerror.h | 3 ---
>   hw/ppc/spapr_pci.c        | 4 ++--
>   softmmu/qdev-monitor.c    | 8 +++++---
>   3 files changed, 7 insertions(+), 8 deletions(-)
> 
> diff --git a/include/qapi/qmp/qerror.h b/include/qapi/qmp/qerror.h
> index 8dd9fcb071..1a9c2d3502 100644
> --- a/include/qapi/qmp/qerror.h
> +++ b/include/qapi/qmp/qerror.h
> @@ -17,9 +17,6 @@
>    * add new ones!
>    */
>   
> -#define QERR_BUS_NO_HOTPLUG \
> -    "Bus '%s' does not support hotplugging"
> -
>   #define QERR_DEVICE_HAS_NO_MEDIUM \
>       "Device '%s' has no medium"
>   
> diff --git a/hw/ppc/spapr_pci.c b/hw/ppc/spapr_pci.c
> index 370c5a90f2..7f063f5852 100644
> --- a/hw/ppc/spapr_pci.c
> +++ b/hw/ppc/spapr_pci.c
> @@ -1550,7 +1550,7 @@ static void spapr_pci_pre_plug(HotplugHandler *plug_handler,
>            * we need to let them know it's not enabled
>            */
>           if (plugged_dev->hotplugged) {
> -            error_setg(errp, QERR_BUS_NO_HOTPLUG,
> +            error_setg(errp, "Bus '%s' does not support hotplugging",
>                          object_get_typename(OBJECT(phb)));
>               return;
>           }
> @@ -1671,7 +1671,7 @@ static void spapr_pci_unplug_request(HotplugHandler *plug_handler,
>       SpaprDrc *drc = drc_from_dev(phb, pdev);
>   
>       if (!phb->dr_enabled) {
> -        error_setg(errp, QERR_BUS_NO_HOTPLUG,
> +        error_setg(errp, "Bus '%s' does not support hotplugging",
>                      object_get_typename(OBJECT(phb)));
>           return;
>       }
> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
> index 74f4e41338..3a9740dcbd 100644
> --- a/softmmu/qdev-monitor.c
> +++ b/softmmu/qdev-monitor.c
> @@ -656,7 +656,8 @@ DeviceState *qdev_device_add_from_qdict(const QDict *opts,
>   
>       if (qdev_should_hide_device(opts, from_json, errp)) {
>           if (bus && !qbus_is_hotpluggable(bus)) {
> -            error_setg(errp, QERR_BUS_NO_HOTPLUG, bus->name);
> +            error_setg(errp, "Bus '%s' does not support hotplugging",
> +                       bus->name);
>           }
>           return NULL;
>       } else if (*errp) {
> @@ -664,7 +665,7 @@ DeviceState *qdev_device_add_from_qdict(const QDict *opts,
>       }
>   
>       if (phase_check(PHASE_MACHINE_READY) && bus && !qbus_is_hotpluggable(bus)) {
> -        error_setg(errp, QERR_BUS_NO_HOTPLUG, bus->name);
> +        error_setg(errp, "Bus '%s' does not support hotplugging", bus->name);
>           return NULL;
>       }
>   
> @@ -904,7 +905,8 @@ void qdev_unplug(DeviceState *dev, Error **errp)
>       }
>   
>       if (dev->parent_bus && !qbus_is_hotpluggable(dev->parent_bus)) {
> -        error_setg(errp, QERR_BUS_NO_HOTPLUG, dev->parent_bus->name);
> +        error_setg(errp, "Bus '%s' does not support hotplugging",
> +                   dev->parent_bus->name);
>           return;
>       }
>   

