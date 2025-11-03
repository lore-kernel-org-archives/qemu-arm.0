Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B4F9CCFA04
	for <qemu-arm@archiver.kernel.org>; Mon,  3 Nov 2025 09:52:56 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vFrEq-0004Ge-GU; Mon, 03 Nov 2025 04:52:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1vFrEp-0004GH-Lj
 for qemu-arm@nongnu.org; Mon, 03 Nov 2025 04:52:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1vFrEe-0007OS-L1
 for qemu-arm@nongnu.org; Mon, 03 Nov 2025 04:52:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762163541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VcAIOZZ3d5XNJNg3P8cQJlolVFcqvq0I8RonPpmyS4Y=;
 b=G85SdFPj1ugJsQR7O99BNCvsUFC2cad+Q8BxaVYSnitWL982QVDzNMZuSf+7m/GR842DU3
 RQpAYlH+cQ+8BKKHxKCiZFu5iYBbQc9LpBsRWgs4Px2Pm2QqHWCbSupBxXL0TCP0SRE2/I
 CPU0c3Bc2WOwHrDDd7RG59CVqOnE6BM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-502-ExIdeAmaOne1AU5Rqj7umw-1; Mon, 03 Nov 2025 04:52:20 -0500
X-MC-Unique: ExIdeAmaOne1AU5Rqj7umw-1
X-Mimecast-MFC-AGG-ID: ExIdeAmaOne1AU5Rqj7umw_1762163539
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-47106a388cfso33184215e9.0
 for <qemu-arm@nongnu.org>; Mon, 03 Nov 2025 01:52:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762163539; x=1762768339;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VcAIOZZ3d5XNJNg3P8cQJlolVFcqvq0I8RonPpmyS4Y=;
 b=vEsgWhn8xTZXA2FqlNkctozii6TMRhQPM+xC8XU8wnWkxfgSjCUU+UZbMxXRzwtvGK
 9tJaXRWRJVrOhnY5RrzrppI3jr9BzXwOv3mLDDIwwa9xehdBSDoUOPXML+hz2xkeL6uC
 EjXG4qxuLHEp+KTMGgW7GWAeT5dqZuWBPVOqjzW29vgNazWfFV1uXJqu3PSN+NHbX46Y
 J/4f4JwaA7lBySAODpCWw3oXODflfi//X8QTTROi38NkiE9wDo9rcGSlIU1MWaUwE2BA
 u0Mx88f6I4EzthfQ46up5NkqmDsyQWYhy8H1yCSuNcqFaI0dYOZZm3OaJQnUH9WC8NX+
 u2sQ==
X-Gm-Message-State: AOJu0Yzo1cPogFM330SNChuMm4AM0P82nfoubk4agjS80wv5G64QdVhl
 c7Vu6cR+kjFdrPC8y+RLdfLWJ2A9rHHBAJ+Kn0Vh6UGtrd524lT6sONzd/OlhyiU9zwJuzzMsY4
 IUHjDf3E6aX3rxPwnkckjTaXllc2mGsz+HkwmmNBzUQxBGRTXRtO5NoRcsBuWxw==
X-Gm-Gg: ASbGncvZXaRWdAp/VD8XP4GCkL4xukwc8ZKz4p+jojckKqH5/KEAu7SJTVWzI8erQT4
 vVkXEKLakj9Br0HGW70aOiLIO+55zR2ai4//xVORcFuYTJawtq+UcZOwsyVAChlP1vjMGaOY49u
 mP97FJLXlCeNv7mFEq48jlOqSpT0Pkm5w+3On/pvxyMh2tpZ/UoDauc5OyYm2DCpV7N4mXqxaha
 76lLsoaOMvrQ34crGelDeWhv/P0QgGo92WduT5GOX2WCWInNCKIw5BTbFeecW+jBXb9p7riQkZH
 hpI2J4bbggP0YSY0EERiNE5qmJ6o/uBKFfZnnkc350gKUn4EGPekrgYO/NCLkU2eCA==
X-Received: by 2002:a05:600d:8314:b0:477:4345:7c59 with SMTP id
 5b1f17b1804b1-47743458444mr34153125e9.40.1762163538864; 
 Mon, 03 Nov 2025 01:52:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEHrpKvuEcpdjJgG2drC9CG2GulQfK0IBVYPY0JGIQAUg5kL10oY2PxuO7fAavRV3IeUgPX/g==
X-Received: by 2002:a05:600d:8314:b0:477:4345:7c59 with SMTP id
 5b1f17b1804b1-47743458444mr34152935e9.40.1762163538430; 
 Mon, 03 Nov 2025 01:52:18 -0800 (PST)
Received: from fedora ([85.93.96.130]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4773c374f84sm144441465e9.0.2025.11.03.01.52.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Nov 2025 01:52:18 -0800 (PST)
Date: Mon, 3 Nov 2025 10:52:16 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, mst@redhat.com,
 anisinha@redhat.com, gengdongjiu1@gmail.com, peter.maydell@linaro.org,
 pbonzini@redhat.com, mchehab+huawei@kernel.org,
 Jonathan.Cameron@huawei.com, shan.gavin@gmail.com
Subject: Re: [PATCH RESEND v2 3/3] target/arm/kvm: Support multiple memory
 CPERs injection
Message-ID: <20251103105216.1f4241d7@fedora>
In-Reply-To: <88a41137-d5fb-4b61-a3f2-dd73133c17ec@redhat.com>
References: <20251007060810.258536-1-gshan@redhat.com>
 <20251007060810.258536-4-gshan@redhat.com>
 <20251017162746.2a99015b@fedora>
 <a635de53-71fa-4edb-87c0-8775722c284d@redhat.com>
 <20251031145539.3551b0a5@fedora>
 <88a41137-d5fb-4b61-a3f2-dd73133c17ec@redhat.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: bXGaNyV3Zuxh-ls9cV_FPaHY74gN6nHBm-35soFkTcM_1762163539
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Mon, 3 Nov 2025 09:02:54 +1000
Gavin Shan <gshan@redhat.com> wrote:

> On 10/31/25 11:55 PM, Igor Mammedov wrote:
> > On Sun, 19 Oct 2025 10:36:16 +1000
> > Gavin Shan <gshan@redhat.com> wrote:  
> >> On 10/18/25 12:27 AM, Igor Mammedov wrote:  
> >>> On Tue,  7 Oct 2025 16:08:10 +1000
> >>> Gavin Shan <gshan@redhat.com> wrote:
> >>>      
> >>>> In the combination of 64KB host and 4KB guest, a problematic host page
> >>>> affects 16x guest pages. In this specific case, it's reasonable to
> >>>> push 16 consecutive memory CPERs. Otherwise, QEMU can run into core
> >>>> dump due to the current error can't be delivered as the previous error
> >>>> isn't acknoledges. It's caused by the nature the host page can be
> >>>> accessed in parallel due to the mismatched host and guest page sizes.  
> >>>
> >>> can you explain a bit more what goes wrong?
> >>>
> >>> I'm especially interested in parallel access you've mentioned
> >>> and why batch adding error records is needed
> >>> as opposed to adding records every time invalid access happens?
> >>>
> >>> PS:
> >>> Assume I don't remember details on how HEST works,
> >>> Answering it in this format also should improve commit message
> >>> making it more digestible for uninitiated.
> >>>      
> >>
> >> Thanks for your review and I'm trying to answer your question below. Please let
> >> me know if there are more questions.
> >>
> >> There are two signals (BUS_MCEERR_AR and BUS_MCEERR_AO) and BUS_MCEERR_AR is
> >> concerned here. This signal BUS_MCEERR_AR is sent by host's stage2 page fault
> >> handler when the resolved host page has been marked as marked as poisoned.
> >> The stage2 page fault handler is invoked on every access to the host page.
> >>
> >> In the combination where host and guest has 64KB and 4KB separately, A 64KB
> >> host page corresponds to 16x consecutive 4KB guest pages. It means we're
> >> accessing the 64KB host page when any of those 16x consecutive 4KB guest pages
> >> is accessed. In other words, a problematic 64KB host page affects the accesses
> >> on 16x 4KB guest pages. Those 16x 4KB guest pages can be owned by different
> >> threads on the guest and they run in parallel, potentially to access those
> >> 16x 4KB guest pages in parallel. It potentially leading to 16x BUS_MCEERR_AR
> >> signals at one point.
> >>
> >> In current implementation, the error record is built as the following calltrace
> >> indicates. There are 16 error records in the extreme case (parallel accesses on
> >> 16x 4KB guest pages, mapped to one 64KB host page). However, we can't handle
> >> multiple error records at once due to the acknowledgement mechanism in
> >> ghes_record_cper_errors(). For example, the first error record has been sent,
> >> but not consumed by the guest yet. We fail to send the second error record.
> >>
> >> kvm_arch_on_sigbus_vcpu
> >>     acpi_ghes_memory_errors
> >>       ghes_gen_err_data_uncorrectable_recoverable      // Generic Error Data Entry
> >>       acpi_ghes_build_append_mem_cper                  // Memory Error
> >>       ghes_record_cper_errors
> >>         
> >> So this series improves this situation by simply sending 16x error records in
> >> one shot for the combination of 64KB host + 4KB guest.  
> > 
> > 1) What I'm concerned about is that it target one specific case only.
> > Imagine if 1st cpu get error on page1 and another on page2=(page1+host_page_size)
> > and so on for other CPUs. Then we are back where we were before this series.
> > 
> > Also in abstract future when ARM gets 1Gb pages, that won't scale well.
> > 
> > Can we instead of making up CPERs to cover whole host page,
> > create 1/vcpu GHES source?
> > That way when vcpu trips over bad page, it would have its own
> > error status block to put errors in.
> > That would address [1] and deterministically scale
> > (well assuming that multiple SEA error sources are possible in theory)
> >   
> 
> I think it's a good idea to have individual error source for each vCPU. In this
> way, the read_ack_reg won't be a limitation. I hope Jonathan is ok to this scheme.
> 
> Currently, we have two (fixed) error sources like below. I assume the index of
> the error source per vCPU will starts from (ACPI_HEST_SRC_ID_QMP + 1) based on
> CPUState::cpu_index.

I'd suggest ditch cpu index and use arch_id instead.

> 
> enum AcpiGhesSourceID {
>      ACPI_HEST_SRC_ID_SYNC,
>      ACPI_HEST_SRC_ID_QMP,       /* Use it only for QMP injected errors */
> };
> 
> 
> > PS:
> > I also wonder what real HW does when it gets in similar situation
> > (i.e. error status block is not yet acknowledged but another async
> > error arrived for the same error source)?
> >   
> 
> I believe real HW also have this specific issue. As to ARM64, I ever did some
> google search and was told the error follows the firmware-first policy and
> handled by a component of trustfirmware-a. However, I was unable to get the
> source code. So it's hard for me to know how this specific issue is handled
> there.

Perhaps Jonathan can help with finding how real hw works around it?

My idea using per cpu source is just a speculation based on spec
on how workaround the problem,
I don't really know if guest OS will be able to handle it (aka,
need to be tested is it's viable). That also probably was a reason
in previous review, why should've waited for multiple sources
support be be merged first before this series.

 
> Thanks,
> Gavin
> 
> >>>> Imporve push_ghes_memory_errors() to push 16x consecutive memory CPERs
> >>>> for this specific case. The maximal error block size is bumped to 4KB,
> >>>> providing enough storage space for those 16x memory CPERs.
> >>>>
> >>>> Signed-off-by: Gavin Shan <gshan@redhat.com>
> >>>> ---
> >>>>    hw/acpi/ghes.c   |  2 +-
> >>>>    target/arm/kvm.c | 46 +++++++++++++++++++++++++++++++++++++++++++++-
> >>>>    2 files changed, 46 insertions(+), 2 deletions(-)
> >>>>
> >>>> diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> >>>> index 045b77715f..5c87b3a027 100644
> >>>> --- a/hw/acpi/ghes.c
> >>>> +++ b/hw/acpi/ghes.c
> >>>> @@ -33,7 +33,7 @@
> >>>>    #define ACPI_HEST_ADDR_FW_CFG_FILE          "etc/acpi_table_hest_addr"
> >>>>    
> >>>>    /* The max size in bytes for one error block */
> >>>> -#define ACPI_GHES_MAX_RAW_DATA_LENGTH   (1 * KiB)
> >>>> +#define ACPI_GHES_MAX_RAW_DATA_LENGTH   (4 * KiB)
> >>>>    
> >>>>    /* Generic Hardware Error Source version 2 */
> >>>>    #define ACPI_GHES_SOURCE_GENERIC_ERROR_V2   10
> >>>> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> >>>> index c5d5b3b16e..3ecb85e4b7 100644
> >>>> --- a/target/arm/kvm.c
> >>>> +++ b/target/arm/kvm.c
> >>>> @@ -11,6 +11,7 @@
> >>>>     */
> >>>>    
> >>>>    #include "qemu/osdep.h"
> >>>> +#include "qemu/units.h"
> >>>>    #include <sys/ioctl.h>
> >>>>    
> >>>>    #include <linux/kvm.h>
> >>>> @@ -2433,10 +2434,53 @@ static void push_ghes_memory_errors(CPUState *c, AcpiGhesState *ags,
> >>>>                                        uint64_t paddr)
> >>>>    {
> >>>>        GArray *addresses = g_array_new(false, false, sizeof(paddr));
> >>>> +    uint64_t val, start, end, guest_pgsz, host_pgsz;
> >>>>        int ret;
> >>>>    
> >>>>        kvm_cpu_synchronize_state(c);
> >>>> -    g_array_append_vals(addresses, &paddr, 1);
> >>>> +
> >>>> +    /*
> >>>> +     * Sort out the guest page size from TCR_EL1, which can be modified
> >>>> +     * by the guest from time to time. So we have to sort it out dynamically.
> >>>> +     */
> >>>> +    ret = read_sys_reg64(c->kvm_fd, &val, ARM64_SYS_REG(3, 0, 2, 0, 2));
> >>>> +    if (ret) {
> >>>> +        goto error;
> >>>> +    }
> >>>> +
> >>>> +    switch (extract64(val, 14, 2)) {
> >>>> +    case 0:
> >>>> +        guest_pgsz = 4 * KiB;
> >>>> +        break;
> >>>> +    case 1:
> >>>> +        guest_pgsz = 64 * KiB;
> >>>> +        break;
> >>>> +    case 2:
> >>>> +        guest_pgsz = 16 * KiB;
> >>>> +        break;
> >>>> +    default:
> >>>> +        error_report("unknown page size from TCR_EL1 (0x%" PRIx64 ")", val);
> >>>> +        goto error;
> >>>> +    }
> >>>> +
> >>>> +    host_pgsz = qemu_real_host_page_size();
> >>>> +    start = paddr & ~(host_pgsz - 1);
> >>>> +    end = start + host_pgsz;
> >>>> +    while (start < end) {
> >>>> +        /*
> >>>> +         * The precise physical address is provided for the affected
> >>>> +         * guest page that contains @paddr. Otherwise, the starting
> >>>> +         * address of the guest page is provided.
> >>>> +         */
> >>>> +        if (paddr >= start && paddr < (start + guest_pgsz)) {
> >>>> +            g_array_append_vals(addresses, &paddr, 1);
> >>>> +        } else {
> >>>> +            g_array_append_vals(addresses, &start, 1);
> >>>> +        }
> >>>> +
> >>>> +        start += guest_pgsz;
> >>>> +    }
> >>>> +
> >>>>        ret = acpi_ghes_memory_errors(ags, ACPI_HEST_SRC_ID_SYNC, addresses);
> >>>>        if (ret) {
> >>>>            goto error;  
> >>>      
> >>  
> >   
> 


