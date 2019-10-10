Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp2410105wrm;
        Thu, 10 Oct 2019 06:57:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwJmuDsq+p+u1q+aKa2BHbDPKdGuWDDzcVyr9ka+2VyKgQoCl4uCtAxgXpg2fYFs/pTSsY7
X-Received: by 2002:ac8:234e:: with SMTP id b14mr10675622qtb.346.1570715856835;
        Thu, 10 Oct 2019 06:57:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570715856; cv=none;
        d=google.com; s=arc-20160816;
        b=IsPTDJlYbgbifXf05PH7N+l05NSKPA7YCbYBpwgUFvPQOIzsoEdwzV1d/paI2iomk/
         rNuU7g0PJ1idiNHG9MG0nr3YxX/g2EESHbroJqb+t44EuzvVTk8MWNf1eyfHbDA/qrev
         hfJoVf85MdL0Re/mgfdf+ViF0yg0W3S88ud8siQC6IrYwIQA6cxUL+xraTuHmv0sz45K
         t7hY/T+AApUozcdUk2J6BDpXrfAuL2pgSHO7qzHwuI+9Id6LB/Z/ek4vpBFvZLmlYbOx
         eZ4hFGaqAQ69ef7jR9ZAJGMiHD+gNF4Ro0nlJ1xpvo7NCDPxK4iBavF8MlQrh0lbBNRJ
         9WwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:content-transfer-encoding:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:cc
         :mime-version:references:in-reply-to:message-id:subject:to:from:date;
        bh=k+gx6IXXHAXBoqr90FL8h1OK6Qg9teP6CDpMeZ7IvFo=;
        b=BpzTQ1HjKqdShxMydNe/YXQEEkO9BmuDJ3xI9OezQAjm5zTgcBrKjPDziNlyb/2MwD
         shg7KRqaPmSGxNu4Ybi8a0exL+GnuQOZeLrU0YmGrZcBXCNMSBduWUWa5tnBfM2c20k5
         YA+n4CuB2e5WSC6KRhpP/aS+BueDsr/3NyEH8zAiN86IVOhDUMAm0tNyeCHkt2MwVIYf
         6wYiDkNIstpeXzgtCatIzK2/6c2V8x4OZs89UAwHfMnjSo8WpkKrtBxDrandSZb0L0JH
         HzNfkYCHArATlatJlZVABf6LgUVuWQd1rAVS+E/pzgmPgSGpmnBYbynXvbQQOa/FZL1V
         y8Iw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvmarm-bounces@lists.cs.columbia.edu>
Received: from mm01.cs.columbia.edu (mm01.cs.columbia.edu. [128.59.11.253])
        by mx.google.com with ESMTP id x187si6153644qkd.117.2019.10.10.06.57.36;
        Thu, 10 Oct 2019 06:57:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) client-ip=128.59.11.253;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of kvmarm-bounces@lists.cs.columbia.edu designates 128.59.11.253 as permitted sender) smtp.mailfrom=kvmarm-bounces@lists.cs.columbia.edu;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 756324A82A;
	Thu, 10 Oct 2019 09:57:36 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
X-Spam-Flag: NO
X-Spam-Score: -4.202
X-Spam-Level: 
X-Spam-Status: No, score=-4.202 required=6.1 tests=[BAYES_00=-1.9,
	DNS_FROM_AHBL_RHSBL=2.699, RCVD_IN_DNSWL_HI=-5, SPF_HELO_PASS=-0.001]
	autolearn=unavailable
Received: from mm01.cs.columbia.edu ([127.0.0.1])
	by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U4+VUQGI3IW1; Thu, 10 Oct 2019 09:57:35 -0400 (EDT)
Received: from mm01.cs.columbia.edu (localhost [127.0.0.1])
	by mm01.cs.columbia.edu (Postfix) with ESMTP id 4E2094A82E;
	Thu, 10 Oct 2019 09:57:35 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
 by mm01.cs.columbia.edu (Postfix) with ESMTP id D769B4A80E
 for <kvmarm@lists.cs.columbia.edu>; Thu, 10 Oct 2019 09:57:34 -0400 (EDT)
X-Virus-Scanned: at lists.cs.columbia.edu
Received: from mm01.cs.columbia.edu ([127.0.0.1])
 by localhost (mm01.cs.columbia.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QjN2M5MXM3OX for <kvmarm@lists.cs.columbia.edu>;
 Thu, 10 Oct 2019 09:57:32 -0400 (EDT)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by mm01.cs.columbia.edu (Postfix) with ESMTPS id 1988C4A6B2
 for <kvmarm@lists.cs.columbia.edu>; Thu, 10 Oct 2019 09:57:32 -0400 (EDT)
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 434418372F2;
 Thu, 10 Oct 2019 13:57:31 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 80CE16012A;
 Thu, 10 Oct 2019 13:57:25 +0000 (UTC)
Date: Thu, 10 Oct 2019 15:57:23 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Guoheyi <guoheyi@huawei.com>
Subject: Re: [RFC PATCH 12/12] virt/acpi: add SDEI table if SDEI is enabled
Message-ID: <20191010155723.24acb321@redhat.com>
In-Reply-To: <3e889d37-b877-f7b5-7ee3-70cef6d8e9c1@huawei.com>
References: <1569338511-3572-1-git-send-email-guoheyi@huawei.com>
 <1569338511-3572-13-git-send-email-guoheyi@huawei.com>
 <20191010111537.5e2dd584@redhat.com>
 <3e889d37-b877-f7b5-7ee3-70cef6d8e9c1@huawei.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.68]); Thu, 10 Oct 2019 13:57:31 +0000 (UTC)
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Marc Zyngier <marc.zyngier@arm.com>,
 qemu-devel@nongnu.org, Dave Martin <Dave.Martin@arm.com>, qemu-arm@nongnu.org,
 kvmarm@lists.cs.columbia.edu, linux-arm-kernel@lists.infradead.org
X-BeenThere: kvmarm@lists.cs.columbia.edu
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: Where KVM/ARM decisions are made <kvmarm.lists.cs.columbia.edu>
List-Unsubscribe: <https://lists.cs.columbia.edu/mailman/options/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=unsubscribe>
List-Archive: <https://lists.cs.columbia.edu/pipermail/kvmarm>
List-Post: <mailto:kvmarm@lists.cs.columbia.edu>
List-Help: <mailto:kvmarm-request@lists.cs.columbia.edu?subject=help>
List-Subscribe: <https://lists.cs.columbia.edu/mailman/listinfo/kvmarm>,
 <mailto:kvmarm-request@lists.cs.columbia.edu?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: kvmarm-bounces@lists.cs.columbia.edu
Sender: kvmarm-bounces@lists.cs.columbia.edu
X-TUID: PBx2pdntfVSe

On Thu, 10 Oct 2019 21:08:10 +0800
Guoheyi <guoheyi@huawei.com> wrote:

> Thanks for your comments.
> 
> On 2019/10/10 17:15, Igor Mammedov wrote:
> > On Tue, 24 Sep 2019 23:21:51 +0800
> > Heyi Guo <guoheyi@huawei.com> wrote:
> >  
> >> Add SDEI table if SDEI is enabled, so that guest OS can get aware and
> >> utilize the interfaces.
> >>
> >> Signed-off-by: Heyi Guo <guoheyi@huawei.com>
> >> Cc: Peter Maydell <peter.maydell@linaro.org>
> >> Cc: Dave Martin <Dave.Martin@arm.com>
> >> Cc: Marc Zyngier <marc.zyngier@arm.com>
> >> Cc: Mark Rutland <mark.rutland@arm.com>
> >> Cc: James Morse <james.morse@arm.com>
> >> Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
> >> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> >> Cc: Igor Mammedov <imammedo@redhat.com>
> >> ---
> >>   hw/arm/virt-acpi-build.c    | 16 ++++++++++++++++
> >>   include/hw/acpi/acpi-defs.h |  5 +++++
> >>   2 files changed, 21 insertions(+)
> >>
> >> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> >> index 6cdf156..1088214 100644
> >> --- a/hw/arm/virt-acpi-build.c
> >> +++ b/hw/arm/virt-acpi-build.c
> >> @@ -32,6 +32,7 @@
> >>   #include "trace.h"
> >>   #include "hw/core/cpu.h"
> >>   #include "target/arm/cpu.h"
> >> +#include "target/arm/sdei.h"
> >>   #include "hw/acpi/acpi-defs.h"
> >>   #include "hw/acpi/acpi.h"
> >>   #include "hw/nvram/fw_cfg.h"
> >> @@ -475,6 +476,16 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> >>   }
> >>     
> > here should be a comment describing purpose with a reference to spec  
> OK.
> 
> >  
> >>   static void
> >> +build_sdei(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> >> +{
> >> +    int sdei_start = table_data->len;
> >> +
> >> +    (void)acpi_data_push(table_data, sizeof(AcpiSdei));
> >> +    build_header(linker, table_data, (void *)(table_data->data + sdei_start),
> >> +                 "SDEI", table_data->len - sdei_start, 1, NULL, NULL);
> >> +}  
> > that's dummy table and doesn't match what spec describes,
> > It doesn't look correct SDEI table.  
> 
> Refer to below document, Appendix C, I see the definition of SDEI is 
> really a dummy table, also it is said in the document: The table 
> consists only of a basic header with revision 1.
> 
> http://infocenter.arm.com/help/topic/com.arm.doc.den0054a/ARM_DEN0054A_Software_Delegated_Exception_Interface.pdf
> 
> Do I miss anything?
No you are right and I was mistaken.
It's pretty waste-full way to communicate to OS a Boolean flag
that a new GHEST event is supported. But since they managed to make
it a spec, it should be coded as such.


> 
> >  
> >> +
> >> +static void
> >>   build_spcr(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
> >>   {
> >>       AcpiSerialPortConsoleRedirection *spcr;
> >> @@ -796,6 +807,11 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
> >>       acpi_add_table(table_offsets, tables_blob);
> >>       build_spcr(tables_blob, tables->linker, vms);
> >>   
> >> +    if (sdei_enabled) {
> >> +        acpi_add_table(table_offsets, tables_blob);
> >> +        build_sdei(tables_blob, tables->linker, vms);
> >> +    }
> >> +
> >>       if (ms->numa_state->num_nodes > 0) {
> >>           acpi_add_table(table_offsets, tables_blob);
> >>           build_srat(tables_blob, tables->linker, vms);
> >> diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
> >> index 57a3f58..0a2265d 100644
> >> --- a/include/hw/acpi/acpi-defs.h
> >> +++ b/include/hw/acpi/acpi-defs.h
> >> @@ -634,4 +634,9 @@ struct AcpiIortRC {
> >>   } QEMU_PACKED;
> >>   typedef struct AcpiIortRC AcpiIortRC;
> >>   
> >> +struct AcpiSdei {
> >> +    ACPI_TABLE_HEADER_DEF     /* ACPI common table header */
> >> +} QEMU_PACKED;
> >> +typedef struct AcpiSdei AcpiSdei;  
> > we don't use packed structures for ACPI anymore, see build_rsdp() for
> > example of how tables are composed and comment style required for each field.  
> Sure; will fix it in v2.
> 
> Thanks,
> 
> Heyi
> 
> >  
> >>   #endif  
> >
> > .
> >  
> 
> 

_______________________________________________
kvmarm mailing list
kvmarm@lists.cs.columbia.edu
https://lists.cs.columbia.edu/mailman/listinfo/kvmarm
