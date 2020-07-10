Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp990825lfm;
        Fri, 10 Jul 2020 12:08:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwftCUxlh07A7uDcrvBfH/MgJARPKoe4n1agEsvqoWxsOf5WuUwN4eUwua6qWegL+ajiw8f
X-Received: by 2002:a25:bb0d:: with SMTP id z13mr9983510ybg.488.1594408098476;
        Fri, 10 Jul 2020 12:08:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594408098; cv=none;
        d=google.com; s=arc-20160816;
        b=cvIOySQ4Wk5aZa0B81ufmjxS+GSFo4i6zLDoyrEy9f9pfetu310twTfEos9kdmvXNN
         UF0kzazu3E2L5q//v3+IC/SqtYO5EE1deC/2UHqJrHHvcGlzBYRs5K4oux/Nw1Ryu8Lt
         T5TmoRsw1zMfr5UlnDTBEppz1+b7Y6czaJjEXrxsYbxWE1S3plLmMVmrit+EsSURBPlt
         cHt0H5sysR4j/No7h1Mh85uCM7IBIdSdpNU/hNkstjsX+rt2SyyFBXmTQP/Bo5r11yrQ
         ofzX620ey2xBh6MAcF1whfhjI5lSVdnr0WqwXjEbUcq5+ZiU29scDA0E/0dULJ7p16PL
         QaIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=JNZP3Ad5OrIYTGvbklJxoWWmAz+7uwe/VqM7XeA7ghI=;
        b=HQ4nuM7PAjfiFw4hiF5R3pGnThkHLwPfs8+LHwot+Xdz7dIGr0fyqiepBUl72uJBlZ
         kEdTWlv38NZzpk9KGGJ2RE3G0xlruzu7XFWlQIJ93eXurol7IbGoSSWtLTN10cdAZmjB
         4z41qoISU89qxOdDpRRoYCroOiMtAMdJB2cPADPOeT8boHaEBwfR8a3yBJK7BlZhf5c8
         3ABqmdWlHT/jTEKSwbLCH96dYM3JH4KRNwPtutPxx1yh/u5LqObNGPWC3dONNw/sEpgm
         AucWaSiDVK9IjljIPP9BOE8XAEF+k0iDUuhy1ll/yTA5IsBht0svgnjPcBxDAxhakQSC
         eCpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WYVTF8LN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p63si6484101ybg.389.2020.07.10.12.08.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Jul 2020 12:08:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WYVTF8LN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jtyNd-00076i-Hm
	for alex.bennee@linaro.org; Fri, 10 Jul 2020 15:08:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jtyNW-00076C-98
 for qemu-arm@nongnu.org; Fri, 10 Jul 2020 15:08:10 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:49218
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jtyNU-0002JS-K2
 for qemu-arm@nongnu.org; Fri, 10 Jul 2020 15:08:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594408087;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JNZP3Ad5OrIYTGvbklJxoWWmAz+7uwe/VqM7XeA7ghI=;
 b=WYVTF8LNTzBeJQx3rmKsMzsPI1BPU5qzf6c2IJDgbxCg/wK05WCySO8obFMBOkqKSfLStr
 amsupY3+NQbt7mQAHKg3NqFzR6N9VLsd17F/CbeyntLETSERHFYS5rtbI7+pYz5HLHe/GU
 R2JCkSfOvVr39SAHivnEHQTgelnn1vI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-c1bfP5uSP36Udvv4aiPiHQ-1; Fri, 10 Jul 2020 15:08:04 -0400
X-MC-Unique: c1bfP5uSP36Udvv4aiPiHQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 81CB4107ACCA;
 Fri, 10 Jul 2020 19:08:03 +0000 (UTC)
Received: from localhost (unknown [10.40.208.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 653C6724A0;
 Fri, 10 Jul 2020 19:07:51 +0000 (UTC)
Date: Fri, 10 Jul 2020 21:07:49 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v5 04/20] acpi: ged: add control regs
Message-ID: <20200710210749.1da2e663@redhat.com>
In-Reply-To: <20200707125356.32450-5-kraxel@redhat.com>
References: <20200707125356.32450-1-kraxel@redhat.com>
 <20200707125356.32450-5-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/09 23:35:58
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dc/lFZ8zKZB/

On Tue,  7 Jul 2020 14:53:40 +0200
Gerd Hoffmann <kraxel@redhat.com> wrote:

> Add control regs (sleep, reset) for hw-reduced acpi.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

with below comments addressed:

   Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  include/hw/acpi/generic_event_device.h |  7 ++++
>  hw/acpi/generic_event_device.c         | 44 ++++++++++++++++++++++++++
>  2 files changed, 51 insertions(+)
> 
> diff --git a/include/hw/acpi/generic_event_device.h b/include/hw/acpi/generic_event_device.h
> index 90a9180db572..474c92198080 100644
> --- a/include/hw/acpi/generic_event_device.h
> +++ b/include/hw/acpi/generic_event_device.h
> @@ -72,6 +72,12 @@
>  #define ACPI_GED_EVT_SEL_OFFSET    0x0
>  #define ACPI_GED_EVT_SEL_LEN       0x4
>  
> +#define ACPI_GED_REG_SLEEP_CTL     0x00
> +#define ACPI_GED_REG_SLEEP_STS     0x01
> +#define ACPI_GED_REG_RESET         0x02
> +#define   ACPI_GED_RESET_VALUE     0x42
          ^^ too many ' '

also it would be nice to point out where vaule comes from
(if it's from spec then ref to spec pls)

> +#define ACPI_GED_REG_COUNT         0x03
> +
>  #define GED_DEVICE      "GED"
>  #define AML_GED_EVT_REG "EREG"
>  #define AML_GED_EVT_SEL "ESEL"
> @@ -87,6 +93,7 @@
>  
>  typedef struct GEDState {
>      MemoryRegion evt;
> +    MemoryRegion regs;
>      uint32_t     sel;
>  } GEDState;
>  
> diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
> index b8abdefa1c77..491df80a5cc7 100644
> --- a/hw/acpi/generic_event_device.c
> +++ b/hw/acpi/generic_event_device.c
> @@ -20,6 +20,7 @@
>  #include "hw/qdev-properties.h"
>  #include "migration/vmstate.h"
>  #include "qemu/error-report.h"
> +#include "sysemu/runstate.h"
>  
>  static const uint32_t ged_supported_events[] = {
>      ACPI_GED_MEM_HOTPLUG_EVT,
> @@ -176,6 +177,45 @@ static const MemoryRegionOps ged_evt_ops = {
>      },
>  };
>  
> +static uint64_t ged_regs_read(void *opaque, hwaddr addr, unsigned size)
> +{
> +    return 0;
> +}
> +
> +static void ged_regs_write(void *opaque, hwaddr addr, uint64_t data,
> +                           unsigned int size)
> +{
> +    bool slp_en;
> +    int slp_typ;
> +
> +    switch (addr) {
> +    case ACPI_GED_REG_SLEEP_CTL:
> +        slp_typ = (data >> 2) & 0x07;
> +        slp_en  = (data >> 5) & 0x01;
> +        if (slp_en && slp_typ == 5) {

replace magic 5 with something more descriptive and use it also in 8/20
during initializing _S5 package

> +            qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
> +        }
> +        return;
> +    case ACPI_GED_REG_SLEEP_STS:
> +        return;
> +    case ACPI_GED_REG_RESET:
> +        if (data == ACPI_GED_RESET_VALUE) {
> +            qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
> +        }
> +        return;
> +    }
> +}
> +
> +static const MemoryRegionOps ged_regs_ops = {
> +    .read = ged_regs_read,
> +    .write = ged_regs_write,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
> +    .valid = {
> +        .min_access_size = 1,
> +        .max_access_size = 1,
> +    },
> +};
> +
>  static void acpi_ged_device_plug_cb(HotplugHandler *hotplug_dev,
>                                      DeviceState *dev, Error **errp)
>  {
> @@ -332,6 +372,10 @@ static void acpi_ged_initfn(Object *obj)
>       sysbus_init_mmio(sbd, &s->container_memhp);
>       acpi_memory_hotplug_init(&s->container_memhp, OBJECT(dev),
>                                &s->memhp_state, 0);
> +
> +    memory_region_init_io(&ged_st->regs, obj, &ged_regs_ops, ged_st,
> +                          TYPE_ACPI_GED "-regs", ACPI_GED_REG_COUNT);
> +    sysbus_init_mmio(sbd, &ged_st->regs);
>  }
>  
>  static void acpi_ged_class_init(ObjectClass *class, void *data)

