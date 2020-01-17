Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp9575403lff;
        Fri, 17 Jan 2020 01:47:33 -0800 (PST)
X-Google-Smtp-Source: APXvYqwFzeS7STYukhFb07PtgBr2FMHI6mvC5bc+iSd49K6AIInYK1a6uvijtEVTEgY3FYMDCAts
X-Received: by 2002:a37:c24b:: with SMTP id j11mr36396371qkm.57.1579254453119;
        Fri, 17 Jan 2020 01:47:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579254453; cv=none;
        d=google.com; s=arc-20160816;
        b=cpYxe3Hw/l7s5fVDBQ6rDRPTNQVf+JKY8L3geIFC6LxA1LBi2lE1OmGWTut0vTQ2VI
         r4+vvulWMw6UOZnFff4vwRgmdctTbLIvGR8sI6YZz6fb6AC5x1tjz26NsmCNpalolkKh
         T61esjJGB5WDya/t3PD7wbmfqwJqvbtu1CrjcQfjuQwE5rWmV4QZeR/84Md1SXphtt+N
         O5tqggt0h1EOrXrlaSbfJZ4ZYogBDW/ubRy6MhFPgSW1sEm+vpWPYLm2zf0Rv5OeQR83
         95mBtRBVth6EW4e8kopL9wxZQJ8xQ0hVtM/JD7RH16GykWs0RnyzkEEERKRF9hasA+3V
         6p2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=SPkIXciK6E3wUC+dxJgDQm8p/aYfCKeUbCuWsiNqGHg=;
        b=qcJJYeyMgRKmsvEhOo8gkmIcfFuhse3DWoUlT1g7H0SK7VOW1HC8XKNWS/Xl45VdxL
         ySf/YWCRYCyTEUnehwfw0Mk9LOfukyrlaQflZvhSkhl8OQPob3tXgKUpGQcEMFLPgkWf
         vGwrcq9/28cCC5pMFzIhM0ujrckLseZflGijWmU/5uVe9LLg4waLiTArXteaoVKBHUZ8
         IPYO3/2psRtJks9ZFtN70KCaGl6tbOc8jHBwKDcpNJUKbhZw0P7t7xDHABXP13IRbWla
         b16ZWhfwNYb183kW/4DD04UVGXJ0AMTuflQBJsUj/gjP7c3S24bacOiny8UtvtThUK1L
         eHUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GroLfiWB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m23si13733558qtu.162.2020.01.17.01.47.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 17 Jan 2020 01:47:33 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GroLfiWB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:54620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1isODz-0007oK-VB
	for alex.bennee@linaro.org; Fri, 17 Jan 2020 04:47:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50642)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1isODg-0007j1-5S
 for qemu-arm@nongnu.org; Fri, 17 Jan 2020 04:47:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1isODc-0005Bb-HF
 for qemu-arm@nongnu.org; Fri, 17 Jan 2020 04:47:11 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:48673
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1isODc-0005B3-DG
 for qemu-arm@nongnu.org; Fri, 17 Jan 2020 04:47:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579254427;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SPkIXciK6E3wUC+dxJgDQm8p/aYfCKeUbCuWsiNqGHg=;
 b=GroLfiWBke8QcsnBuXYhVNY80KBxj9Vd9UaqFdsFhwWkAlO5BQ6snNfiBDRyxjpGEYb6Nh
 pfstJT+tpdQM2+atmbX22yC6alawlA34CZcc721ajFy8yo6mIsj11Up/+UrgxYOf+SjnCG
 2mRM5CW0d2vMqEw7rVNZ6EHDO1DN6Pk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-267-kEQZXIRUMZ6lsoqqjxdrbQ-1; Fri, 17 Jan 2020 04:47:04 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 28CB518FF660;
 Fri, 17 Jan 2020 09:47:03 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E05505C241;
 Fri, 17 Jan 2020 09:46:58 +0000 (UTC)
Date: Fri, 17 Jan 2020 10:46:57 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Keqian Zhu <zhukeqian1@huawei.com>
Subject: Re: [PATCH v2] hw/arm: Adjust some coding styles about memory hotplug
Message-ID: <20200117104657.583abb3d@redhat.com>
In-Reply-To: <20200117063822.57918-1-zhukeqian1@huawei.com>
References: <20200117063822.57918-1-zhukeqian1@huawei.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: kEQZXIRUMZ6lsoqqjxdrbQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>, qemu-arm@nongnu.org,
 wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: r30083UmrYML

On Fri, 17 Jan 2020 14:38:22 +0800
Keqian Zhu <zhukeqian1@huawei.com> wrote:

> From: zhukeqian <zhukeqian1@huawei.com>
> 
> There is extra indent in ACPI GED plug cb. And we can use
> existing helper function to trigger hotplug handler plug.
> 
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> Signed-off-by: Keqian Zhu <zhukeqian1@huawei.com>
> ---
> 
> v1->v2:
>  - Add Igor's R-b

FYI one does not need to repost v2 for the purpose of
picking up tags, usually maintainer takes care of that
when patch is queued 

> 
> Cc: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> ---
>  hw/acpi/generic_event_device.c | 2 +-
>  hw/arm/virt.c                  | 6 +++---
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
> index 9cee90cc70..55eb29d80a 100644
> --- a/hw/acpi/generic_event_device.c
> +++ b/hw/acpi/generic_event_device.c
> @@ -175,7 +175,7 @@ static void acpi_ged_device_plug_cb(HotplugHandler *hotplug_dev,
>      AcpiGedState *s = ACPI_GED(hotplug_dev);
>  
>      if (object_dynamic_cast(OBJECT(dev), TYPE_PC_DIMM)) {
> -            acpi_memory_plug_cb(hotplug_dev, &s->memhp_state, dev, errp);
> +        acpi_memory_plug_cb(hotplug_dev, &s->memhp_state, dev, errp);
>      } else {
>          error_setg(errp, "virt: device plug request for unsupported device"
>                     " type: %s", object_get_typename(OBJECT(dev)));
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 39ab5f47e0..656b0081c2 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1934,7 +1934,6 @@ static void virt_memory_pre_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
>  static void virt_memory_plug(HotplugHandler *hotplug_dev,
>                               DeviceState *dev, Error **errp)
>  {
> -    HotplugHandlerClass *hhc;
>      VirtMachineState *vms = VIRT_MACHINE(hotplug_dev);
>      Error *local_err = NULL;
>  
> @@ -1943,8 +1942,9 @@ static void virt_memory_plug(HotplugHandler *hotplug_dev,
>          goto out;
>      }
>  
> -    hhc = HOTPLUG_HANDLER_GET_CLASS(vms->acpi_dev);
> -    hhc->plug(HOTPLUG_HANDLER(vms->acpi_dev), dev, &error_abort);
> +    hotplug_handler_plug(HOTPLUG_HANDLER(vms->acpi_dev),
> +                         dev, &error_abort);
> +
>  out:
>      error_propagate(errp, local_err);
>  }

