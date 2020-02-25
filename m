Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp1716089lfg;
        Tue, 25 Feb 2020 05:57:30 -0800 (PST)
X-Google-Smtp-Source: APXvYqwr+Na5z9fFT/UE/0EY2gyJsk4mMhctRPFNSZxai/DiEr+IGjWcue/XOX0Rx73ArDNmW5xg
X-Received: by 2002:aca:1108:: with SMTP id 8mr3649062oir.127.1582639050827;
        Tue, 25 Feb 2020 05:57:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582639050; cv=none;
        d=google.com; s=arc-20160816;
        b=KPBez+TAiE/1gpEH5Pc8CM9UNAEZ6uz4FgcagenXaq0jiPNrvSh26ZBfcJcefR6+Vb
         /Ly1+jQSqFpS9nzzwIBoXnNlRfgPzfNYlssEKPSgiB6ccmTU5C32DwGpnzh/Fu4PbCZB
         ue7kB3uBG4E87OatlyQhFc4hkltpZAY3T44BCkvT3h1g1DwCsYk1+K14h24ehxH05sSp
         RHNI7jUOZ9ikOo0CK6garUbdr1MjTBuDvY3UhtEp/2X+VK8ZZU3EZGYHV3dgczu3jYZf
         YDLLo4ndPQIBwhDpH0F5eSCNCofvY7SK4QTWREz5lRfOS+9UAqKwuQzLtbtJ3ccflX5t
         eTBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=7u5oyKfwsQp27bsa1IAdlRDT3QgLdAO2qyRAcmzr55s=;
        b=d8y/OY53V/0/DZFIoKCpdnbACjt03RR+BkQ+rUUTnwHqt3OSYOXdqvF6Dk30+0bb+k
         26kDfgmpJ9/3zGaKUMnhbLoiKINyVxSkIZ+/zqUpf5JjD4yzl9cGJkFVxzLKVm8AWdT4
         0YFBuQhsJUiuvYdcxud40Jx8h2g1w4vRwyl6W+/3n8os+zJBSzGwxMk1YprcHkzAWMe1
         lU+sQMPAGS7LsMiueClRuedTHvn+qWWeflFsZIwRh3AGYTIE5iO8OmRGQ1ApWqXEs9X6
         757fkpySiVAKfgN+0ay929+5WXO4Av3dU5YR9ow4K6hxxPbm9Er2vxEDTACMxojSDnvM
         g/JQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=O+XLYenn;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id b2si6726442oic.205.2020.02.25.05.57.30;
        Tue, 25 Feb 2020 05:57:30 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=O+XLYenn;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730540AbgBYN53 (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Tue, 25 Feb 2020 08:57:29 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:59446 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725788AbgBYN53 (ORCPT
        <rfc822;kvm@vger.kernel.org>); Tue, 25 Feb 2020 08:57:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1582639048;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7u5oyKfwsQp27bsa1IAdlRDT3QgLdAO2qyRAcmzr55s=;
        b=O+XLYenn4TAA/vBnZQYKFmarxIUjPp+RCV1vbUEwFcYy0PIoOa9PsL30dFStUAfS3LsTKz
        q0HSRLuxORvO+dygZVZYzWpDCMvNxI6lt7ns6E8UkUsmj7tpBO6f6bTWUnY63iNlJnEaWo
        KewKstdc/HfrzCnPfh1o+igTGzRIVms=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-430-yqzhWlsOPaSQZmysm31UDA-1; Tue, 25 Feb 2020 08:57:24 -0500
X-MC-Unique: yqzhWlsOPaSQZmysm31UDA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3D649477;
        Tue, 25 Feb 2020 13:57:21 +0000 (UTC)
Received: from localhost (unknown [10.43.2.114])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 6582F65E80;
        Tue, 25 Feb 2020 13:57:14 +0000 (UTC)
Date:   Tue, 25 Feb 2020 14:57:12 +0100
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
Subject: Re: [PATCH v24 04/10] ACPI: Build related register address fields
 via hardware error fw_cfg blob
Message-ID: <20200225145712.4dd410d2@redhat.com>
In-Reply-To: <20200225094804.3ae51b86@redhat.com>
References: <20200217131248.28273-1-gengdongjiu@huawei.com>
        <20200217131248.28273-5-gengdongjiu@huawei.com>
        <20200225094804.3ae51b86@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: VvzQoqKtYJlz

On Tue, 25 Feb 2020 09:48:04 +0100
Igor Mammedov <imammedo@redhat.com> wrote:

> On Mon, 17 Feb 2020 21:12:42 +0800
> Dongjiu Geng <gengdongjiu@huawei.com> wrote:
> 
> > This patch builds error_block_address and read_ack_register fields
> > in hardware errors table , the error_block_address points to Generic
> > Error Status Block(GESB) via bios_linker. The max size for one GESB
> > is 1kb in bytes, For more detailed information, please refer to  
> 
> s/1kb in bytes/1Kb/
> 
> > document: docs/specs/acpi_hest_ghes.rst
> > 
> > Now we only support one Error source, if necessary, we can extend to
> > support more.
> > 
> > Suggested-by: Laszlo Ersek <lersek@redhat.com>
> > Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
> > Signed-off-by: Xiang Zheng <zhengxiang9@huawei.com>
> > Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > ---  
>

On the second glance,


[...]
> > diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> > index bd5f771..6819fcf 100644
> > --- a/hw/arm/virt-acpi-build.c
> > +++ b/hw/arm/virt-acpi-build.c
> > @@ -48,6 +48,7 @@
> >  #include "sysemu/reset.h"
> >  #include "kvm_arm.h"
> >  #include "migration/vmstate.h"
> > +#include "hw/acpi/ghes.h"
> >  
> >  #define ARM_SPI_BASE 32
> >  
> > @@ -830,6 +831,11 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
> >      acpi_add_table(table_offsets, tables_blob);
> >      build_spcr(tables_blob, tables->linker, vms);
> >  
> > +    if (vms->ras) {

> > +        acpi_add_table(table_offsets, tables_blob);
that doesn't look right, it's for tables that  should be referenced
from XSDT

> > +        build_ghes_error_table(tables->hardware_errors, tables->linker);

but this table isn't pointed by XSDT directly.

I suggest to move acpi_add_table() to the patch that adds acpi_build_hest()

> > +    }
> > +
> >      if (ms->numa_state->num_nodes > 0) {
> >          acpi_add_table(table_offsets, tables_blob);
> >          build_srat(tables_blob, tables->linker, vms);
[...]
