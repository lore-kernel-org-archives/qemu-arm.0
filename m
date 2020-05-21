Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp1332057lfb;
        Thu, 21 May 2020 00:59:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz483+IhC8k5i9/QqIbtZlPM1j3Jtf4NxfK/sBQ0xHsxy8Qx0bFSP4rRTmbHRiIIOtqX1r+
X-Received: by 2002:a0c:f388:: with SMTP id i8mr9172804qvk.124.1590047965539;
        Thu, 21 May 2020 00:59:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590047965; cv=none;
        d=google.com; s=arc-20160816;
        b=T67ryEH5pzwKi3Bn+O15VZGM7wWoW42dX/MiyeK7+63FGskE0lz9gw6oVMVapKMDQx
         GxlZ16WVUnR4HvKU5n49eRbNkI0ndzHbvU1p8HXxXtBtrfOJIEumwIDyGdYzx3X1W/Dv
         /CBm2EuzAcrXHSRP7fZN7dFHIhRMF19Ur8CRJU+uZetA/6O6tRVDHnGbHsZG7DetNxQn
         9ORiaFZKiR//giuLv36HhgDF31L/egrfaq20N0+Q6t2ue6Y0kI69CEGzMd2zGlnIFw1d
         1TMwhugBwSiAwg5DBPpl7dWjfxu1guoav0MHXI4+HFDHOFEzEwDoSlYfZscwd3zzN94w
         2PpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=57YaKa9BHFEUtBziFfUy/l9IGUB153INf5Tvp3kpsqc=;
        b=XdlnSMmqWQpVCRh9NOuhONYac3GMrA6yCSTeDaL+eP4cdGoY/N2vQTp2V0rfPkVMmY
         YpVoPUXbvNBxBLj4b7+4WoRYhmCq1k4c1F2KgVFrVyvrzGaNDcExdrQO4RwDKIXaaaX7
         f0MXINTxmLquTrbMzGKWXXiiA45towxwoIGI+p+QZXKcLqouU2UX1nVpcUlnGE/6vhzL
         HJQKZMJ1+9WO0RghD3ZF5/zVC/RxVDsNAcJ3/zMVU2JYkZbC+BCLH/rGljUj+pbzkeZ8
         /jmiSFqhNR+HdcqVswKF5v/BF8C1sESA5VZ4A0DfWqQ1/M1EZe1TluymKyIXp3X/pWyz
         CCIA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=jSZIiFZT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 20si3124231qkf.237.2020.05.21.00.59.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 May 2020 00:59:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=jSZIiFZT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jbg6v-000582-1c
	for alex.bennee@linaro.org; Thu, 21 May 2020 03:59:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jbg6o-00057a-VV
 for qemu-arm@nongnu.org; Thu, 21 May 2020 03:59:18 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:42742
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1jbg6o-0000ZG-8o
 for qemu-arm@nongnu.org; Thu, 21 May 2020 03:59:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590047956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=57YaKa9BHFEUtBziFfUy/l9IGUB153INf5Tvp3kpsqc=;
 b=jSZIiFZTYGDPqmuZIC+lRaCqQ+obfof6pLOu0w47KJArhuzvEeAXytAGLFlK2PXcnGhtLH
 XG2rzQnTFlaOtNmfFmmIQRFwrB6FQakqPiL6Is9dyZ/8H43w/uqxn4mJTSTsBVH6ckDD71
 HWvjSj78Y0Oc2+MxLu0z5dLbmT5e2ds=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-1IXsag8KPb6BdouentaxGA-1; Thu, 21 May 2020 03:59:13 -0400
X-MC-Unique: 1IXsag8KPb6BdouentaxGA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E8063107ACCA;
 Thu, 21 May 2020 07:59:11 +0000 (UTC)
Received: from nas.mammed.net (unknown [10.40.193.252])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6167B5C1B0;
 Thu, 21 May 2020 07:59:01 +0000 (UTC)
Date: Thu, 21 May 2020 09:58:59 +0200
From: Igor Mammedow <imammedo@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3 09/22] acpi: ged: rename event memory region
Message-ID: <20200521095859.45791508@nas.mammed.net>
In-Reply-To: <20200520132003.9492-10-kraxel@redhat.com>
References: <20200520132003.9492-1-kraxel@redhat.com>
 <20200520132003.9492-10-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=imammedo@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/21 00:43:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LlmNU0STyIQx

On Wed, 20 May 2020 15:19:50 +0200
Gerd Hoffmann <kraxel@redhat.com> wrote:

> Rename memory region and callbacks and ops to carry "evt" in the name
> because a second region will be added shortly.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

Reviewed-by: Igor Mammedow <imammedo@redhat.com>

> ---
>  include/hw/acpi/generic_event_device.h |  2 +-
>  hw/acpi/generic_event_device.c         | 16 ++++++++--------
>  2 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/include/hw/acpi/generic_event_device.h
> b/include/hw/acpi/generic_event_device.h index
> 83917de02425..90a9180db572 100644 ---
> a/include/hw/acpi/generic_event_device.h +++
> b/include/hw/acpi/generic_event_device.h @@ -86,7 +86,7 @@
>  #define ACPI_GED_NVDIMM_HOTPLUG_EVT 0x4
>  
>  typedef struct GEDState {
> -    MemoryRegion io;
> +    MemoryRegion evt;
>      uint32_t     sel;
>  } GEDState;
>  
> diff --git a/hw/acpi/generic_event_device.c
> b/hw/acpi/generic_event_device.c index b1cbdd86b66c..1cb34111e59a
> 100644 --- a/hw/acpi/generic_event_device.c
> +++ b/hw/acpi/generic_event_device.c
> @@ -142,7 +142,7 @@ void build_ged_aml(Aml *table, const char *name,
> HotplugHandler *hotplug_dev, }
>  
>  /* Memory read by the GED _EVT AML dynamic method */
> -static uint64_t ged_read(void *opaque, hwaddr addr, unsigned size)
> +static uint64_t ged_evt_read(void *opaque, hwaddr addr, unsigned
> size) {
>      uint64_t val = 0;
>      GEDState *ged_st = opaque;
> @@ -161,14 +161,14 @@ static uint64_t ged_read(void *opaque, hwaddr
> addr, unsigned size) }
>  
>  /* Nothing is expected to be written to the GED memory region */
> -static void ged_write(void *opaque, hwaddr addr, uint64_t data,
> -                      unsigned int size)
> +static void ged_evt_write(void *opaque, hwaddr addr, uint64_t data,
> +                          unsigned int size)
>  {
>  }
>  
> -static const MemoryRegionOps ged_ops = {
> -    .read = ged_read,
> -    .write = ged_write,
> +static const MemoryRegionOps ged_evt_ops = {
> +    .read = ged_evt_read,
> +    .write = ged_evt_write,
>      .endianness = DEVICE_LITTLE_ENDIAN,
>      .valid = {
>          .min_access_size = 4,
> @@ -287,9 +287,9 @@ static void acpi_ged_initfn(Object *obj)
>      SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
>      GEDState *ged_st = &s->ged_state;
>  
> -    memory_region_init_io(&ged_st->io, obj, &ged_ops, ged_st,
> +    memory_region_init_io(&ged_st->evt, obj, &ged_evt_ops, ged_st,
>                            TYPE_ACPI_GED, ACPI_GED_EVT_SEL_LEN);
> -    sysbus_init_mmio(sbd, &ged_st->io);
> +    sysbus_init_mmio(sbd, &ged_st->evt);
>  
>      sysbus_init_irq(sbd, &s->irq);
>  

