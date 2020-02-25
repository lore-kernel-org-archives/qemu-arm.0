Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1376313lfg;
        Tue, 25 Feb 2020 00:34:22 -0800 (PST)
X-Google-Smtp-Source: APXvYqyOKllg1PAmntWUKZMkwbpR641OmSTvohOZCPgtSaMnJAtlZpVmY++GUTDOX6sJD7RoFT0v
X-Received: by 2002:aca:5f87:: with SMTP id t129mr2683896oib.36.1582619661973;
        Tue, 25 Feb 2020 00:34:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582619661; cv=none;
        d=google.com; s=arc-20160816;
        b=KNVamlIqE9GmKokT+OYk7G228E6eTp7GIWiqOTTGsemqENuGkIggY/zeSBMOYogcgw
         jJaGU6bFBETFCUh5BlQIyzMVWpeuoYwkEbBPS+czlxvF1d3c9llde1B7RTQk5ikhS7mJ
         /TSQCDQe+ZiCppyiMZ273tKAomjCG2okCDAotBDJ4njbRAo2DQxTlHLRMiiVO5BAHY+s
         SgfhKFSm6+Qbx2W/ezZoO3Gwb7nWxd14uIpC8UqvFE6yPNASqJbBT9SO/2MIbfodug/v
         z2FhlUOHOO8Or/5RELNfktOhd+CQwQ51aRD4YLcxhLE4ALI5KlAHEneDgBgWtti20N2U
         I9DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=Zeq8bfWrbjUWuhe9VoT/P8t5pKlOCkcgFST3tqDuVYU=;
        b=Qos8xMLsPcVN8Rut0MUhgSadQS386uUUmE1SzxtWIj8Yo5kEx3t8ijbbsl17eJJXE/
         r3Du10S8/h8Smla6ZG1P7eBzTmmKTB8DgzKC59JSTQz0lvB62nzhrj95wb3SVs1uYp3E
         WeK0fmrB5D60xZRMGX5bcAtd1VI5T6e9I7ARcIwsl+wrSnLf5E5KqAI7Z1ayBN7sP2rB
         VU7Uvdvr/g7kD14Z9ClYzL41mpnr73GH60p0TledWYKyvsaNkihX3kq0yO13EovfnJ/R
         4c1DkNIGxknMFBRILBbYhO/WhWSF8qpszjKwLluQaxmybeQugu/Bx5lag+nDzXjkRNdm
         0RWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=P1KgZ9l0;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id h18si7210320otj.114.2020.02.25.00.34.21;
        Tue, 25 Feb 2020 00:34:21 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=P1KgZ9l0;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729332AbgBYIeR (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Tue, 25 Feb 2020 03:34:17 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:36021 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725783AbgBYIeR (ORCPT <rfc822;kvm@vger.kernel.org>);
        Tue, 25 Feb 2020 03:34:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1582619656;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Zeq8bfWrbjUWuhe9VoT/P8t5pKlOCkcgFST3tqDuVYU=;
        b=P1KgZ9l0Rql8o6OqicmvbC92lYT9MWGzYsQDlJKBSa0b/V9XVMEHDCvbllSHpcePxrjdpG
        w6xfduxrhAIjrP5JgLbLnxf7p+gr1c0sp39ngcrDJsTKc3RzTPs5e7QKphGQhifizV78y9
        elwXA453iL1ASWRreBmKl6I2gzkj0k8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-XRADUvImPiC2RjB3yHQlfg-1; Tue, 25 Feb 2020 03:34:14 -0500
X-MC-Unique: XRADUvImPiC2RjB3yHQlfg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3F4A0800D50;
        Tue, 25 Feb 2020 08:34:12 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 7EA3090A04;
        Tue, 25 Feb 2020 08:34:06 +0000 (UTC)
Date:   Tue, 25 Feb 2020 09:34:04 +0100
From:   Igor Mammedov <imammedo@redhat.com>
To:     Dongjiu Geng <gengdongjiu@huawei.com>
Cc:     <mst@redhat.com>, <xiaoguangrong.eric@gmail.com>,
        <shannon.zhaosl@gmail.com>, <peter.maydell@linaro.org>,
        <fam@euphon.net>, <rth@twiddle.net>, <ehabkost@redhat.com>,
        <mtosatti@redhat.com>, <qemu-devel@nongnu.org>,
        <kvm@vger.kernel.org>, <qemu-arm@nongnu.org>,
        <pbonzini@redhat.com>, <james.morse@arm.com>, <lersek@redhat.com>,
        <jonathan.cameron@huawei.com>,
        <shameerali.kolothum.thodi@huawei.com>, <zhengxiang9@huawei.com>
Subject: Re: [PATCH v24 02/10] hw/arm/virt: Introduce a RAS machine option
Message-ID: <20200225093404.0ee40224@redhat.com>
In-Reply-To: <20200217131248.28273-3-gengdongjiu@huawei.com>
References: <20200217131248.28273-1-gengdongjiu@huawei.com>
        <20200217131248.28273-3-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: dgtl6bhOafft

On Mon, 17 Feb 2020 21:12:40 +0800
Dongjiu Geng <gengdongjiu@huawei.com> wrote:

> RAS Virtualization feature is not supported now, so add a RAS machine

> option and disable it by default.
             ^^^^

this doesn't match the patch.

I'd rephrase it as:

... feature is disabled by default ..
add an option so user could enable it with

   -machine virt,ras=on


> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
> Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
>  hw/arm/virt.c         | 23 +++++++++++++++++++++++
>  include/hw/arm/virt.h |  1 +
>  2 files changed, 24 insertions(+)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index f788fe2..9555b8b 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1823,6 +1823,20 @@ static void virt_set_its(Object *obj, bool value, Error **errp)
>      vms->its = value;
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
> @@ -2126,6 +2140,15 @@ static void virt_instance_init(Object *obj)
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
> index 71508bf..c32b7c7 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -123,6 +123,7 @@ typedef struct {
>      bool highmem_ecam;
>      bool its;
>      bool virt;
> +    bool ras;
>      int32_t gic_version;
>      VirtIOMMUType iommu;
>      struct arm_boot_info bootinfo;
