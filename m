Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp15833lfb;
        Tue, 5 May 2020 03:24:18 -0700 (PDT)
X-Google-Smtp-Source: APiQypJgEuBSEbve5QT36UXBlGYXf3oB3sOcYGzP6AfyfmU1EiM3glr3I3xNck75Zy+xXeBO03xW
X-Received: by 2002:a50:ef18:: with SMTP id m24mr1816787eds.281.1588674258666;
        Tue, 05 May 2020 03:24:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588674258; cv=none;
        d=google.com; s=arc-20160816;
        b=kDwJxtgCvAiLhBfOy4VGjQsZ0F9Sg6HLRbL2Nu9FAjfMoK6q2u4DTNqL2ypmk4YiV1
         fsQkETW2zLU0RAT2IGMDArw+Bxw3axhS+VhiX0DB26zMlcnIxxQ3F1ewtfUZa7I/7Ls8
         aMKKlq0wMnTTHvL0M6/5DPRKlbCmJI44PussfI12G/FdEiNgyc4kvQbER8E3n1dKfHrS
         kQXzVtXbMOar9Dm5EucUUNJzzAtTHWGJQIDGYtXGho69UJ926XzQQKGQKrhe7MKCUQQf
         bcz/HuDoAA7R81r84BOmi9AceM5jAZ6pK8BLDtY7SwxHxUDVzXgRYMn1lPcAJ4y3vQAb
         QHRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=/yUu2AgEYpC2lzDCQ8LMb7oZvPqSWZ/fLkeTxUFGypI=;
        b=K76mw4c46IN7Fk8SCZMhMsi+3PWg55Wlj3YL24vCw0y/1wlQPTNUtfLKUKuu+oMj9C
         BytLJi85aqC96yG5eXAKX8TBkE5v2sXMVin+xgIqxGU528RniUHAuUw9D2YYqwhlwwUo
         BzenOgRHdAoAZJtYC/4a3Vl1Pi8VWA8jE639FU8XKWxO05q8SKSYsO6tzf7fLW2G+lnb
         snAdI/2jcA2nIafQ3ZLtKUQqWG6WxvdlMogE9tJLQLi23+Er6gafzK9Bv5iWSontWiJv
         kCu2CHa8B1Ge5CYBMp4EUn2DRn6nMrWZ7+hy4lgxleQDrCeJChEUxk6sZsVDOApU/XtL
         8t+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VRrJgxHb;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [23.128.96.18])
        by mx.google.com with ESMTP id b26si906401edw.447.2020.05.05.03.24.18;
        Tue, 05 May 2020 03:24:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) client-ip=23.128.96.18;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=VRrJgxHb;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728402AbgEEKYR (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Tue, 5 May 2020 06:24:17 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:24949 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725766AbgEEKYR (ORCPT
        <rfc822;kvm@vger.kernel.org>); Tue, 5 May 2020 06:24:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588674255;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/yUu2AgEYpC2lzDCQ8LMb7oZvPqSWZ/fLkeTxUFGypI=;
        b=VRrJgxHb01FDOdc+HA4/c0+awZMOwc1OYWImP9xneYwXioovjaXKQzPBREQ7Pcp/YHzOOI
        tE9u11aioUC+CrIPNI42n64rcSMo8N9z1n5WZA0KKyzQIcZx8tAf1KtxWhlVqMYkJKVNxR
        zCSVNh/gzdhK9NhsIFZZex623VnSoPI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-5Kku06bROk-slWMxzj4fZQ-1; Tue, 05 May 2020 06:24:11 -0400
X-MC-Unique: 5Kku06bROk-slWMxzj4fZQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B757C107ACCA;
        Tue,  5 May 2020 10:24:09 +0000 (UTC)
Received: from localhost (unknown [10.40.208.7])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D82D32DE9D;
        Tue,  5 May 2020 10:23:59 +0000 (UTC)
Date:   Tue, 5 May 2020 12:23:58 +0200
From:   Igor Mammedov <imammedo@redhat.com>
To:     Dongjiu Geng <gengdongjiu@huawei.com>
Cc:     <mst@redhat.com>, <xiaoguangrong.eric@gmail.com>,
        <peter.maydell@linaro.org>, <shannon.zhaosl@gmail.com>,
        <fam@euphon.net>, <rth@twiddle.net>, <ehabkost@redhat.com>,
        <mtosatti@redhat.com>, <qemu-devel@nongnu.org>,
        <kvm@vger.kernel.org>, <qemu-arm@nongnu.org>,
        <pbonzini@redhat.com>, zhengxiang9@huawei.com,
        Jonathan.Cameron@huawei.com, linuxarm@huawei.com
Subject: Re: [PATCH v25 02/10] hw/arm/virt: Introduce a RAS machine option
Message-ID: <20200505122358.1aaaccf4@redhat.com>
In-Reply-To: <20200410114639.32844-3-gengdongjiu@huawei.com>
References: <20200410114639.32844-1-gengdongjiu@huawei.com>
        <20200410114639.32844-3-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: v37hM/cWGbpk

On Fri, 10 Apr 2020 19:46:31 +0800
Dongjiu Geng <gengdongjiu@huawei.com> wrote:

> RAS Virtualization feature is not supported now, so
> add a RAS machine option and disable it by default.
> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
> Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/arm/virt.c         | 23 +++++++++++++++++++++++
>  include/hw/arm/virt.h |  1 +
>  2 files changed, 24 insertions(+)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 7dc96ab..20409b9 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1960,6 +1960,20 @@ static void virt_set_acpi(Object *obj, Visitor *v, const char *name,
>      visit_type_OnOffAuto(v, name, &vms->acpi, errp);
>  }
>  
> +static bool virt_get_ras(Object *obj, Error **errp)
> +{
> +    VirtMachineState *vms = VIRT_MACHINE(obj);
> +
> +    return vms->ras;
> +}
> +
> +static void virt_set_ras(Object *obj, bool value, Error **errp)
> +{
> +    VirtMachineState *vms = VIRT_MACHINE(obj);
> +
> +    vms->ras = value;
> +}
> +
>  static char *virt_get_gic_version(Object *obj, Error **errp)
>  {
>      VirtMachineState *vms = VIRT_MACHINE(obj);
> @@ -2284,6 +2298,15 @@ static void virt_instance_init(Object *obj)
>                                      "Valid values are none and smmuv3",
>                                      NULL);
>  
> +    /* Default disallows RAS instantiation */
> +    vms->ras = false;
> +    object_property_add_bool(obj, "ras", virt_get_ras,
> +                             virt_set_ras, NULL);
> +    object_property_set_description(obj, "ras",
> +                                    "Set on/off to enable/disable reporting host memory errors "
> +                                    "to a KVM guest using ACPI and guest external abort exceptions",
> +                                    NULL);
> +
>      vms->irqmap = a15irqmap;
>  
>      virt_flash_create(vms);
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 60b2f52..6401662 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -131,6 +131,7 @@ typedef struct {
>      bool highmem_ecam;
>      bool its;
>      bool virt;
> +    bool ras;
>      OnOffAuto acpi;
>      VirtGICType gic_version;
>      VirtIOMMUType iommu;
