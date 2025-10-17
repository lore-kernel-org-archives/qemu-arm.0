Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EFC2CCD195
	for <qemu-arm@archiver.kernel.org>; Fri, 17 Oct 2025 14:28:47 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v9lRD-0006aR-Jk; Fri, 17 Oct 2025 10:28:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1v9lRC-0006Z1-3W
 for qemu-arm@nongnu.org; Fri, 17 Oct 2025 10:28:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1v9lR2-0007iP-DP
 for qemu-arm@nongnu.org; Fri, 17 Oct 2025 10:28:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1760711275;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CrSl8hLKSJGOG68Ko42eLHWtHGcpztcPu+p1QpZ1ErY=;
 b=VleO3bh67nB62ksKF8IANiS/2aIcBlqiEbSl6anQsjjZdtTzEIxirmZFIeRZP18tWhfyVn
 jrzPHdneGouyTUZ5DaloRuMZx0baBKy87ZDZl0V/A4f9DyUAWSv8vFTdkYbCC9TM4o2OnH
 GC9YorJl9ZvSKDWE0WHz9peUOasyDco=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-391-FjIMGsZHOl6N1qBuA9ed8Q-1; Fri, 17 Oct 2025 10:27:52 -0400
X-MC-Unique: FjIMGsZHOl6N1qBuA9ed8Q-1
X-Mimecast-MFC-AGG-ID: FjIMGsZHOl6N1qBuA9ed8Q_1760711271
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-47113538d8cso13073945e9.1
 for <qemu-arm@nongnu.org>; Fri, 17 Oct 2025 07:27:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760711271; x=1761316071;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CrSl8hLKSJGOG68Ko42eLHWtHGcpztcPu+p1QpZ1ErY=;
 b=rx0FDNAQiVsbwqtmAZv/tG4V2JA4WHO19AvTygaHxMqqXlyQe2zctvUXvz6+yq5S0U
 DLT5B9jfWsjUxuU6gwTZIvLMGkml4lBhnZHD4iupVUDfWkOBRnwmhy/5RONA2/4ZdOJG
 u9ed4CHGRz3/B3tXCK8mnnMpIK/nnsrWgbHFyGDSEK+b4leZAH3eoo34iGwNODTnKzOO
 nI0FFLJv9f6KSUYq/0y7OY4nU9u7NVt7AJcSyWbjg97iopASDiK94GlkzPsMc6B0j3Hr
 87+DD6F837nJjE4WJGpybMGbQYGHhg/1ja6jQSH60dKDNNbyLr7K7/f9chvY+8bUoife
 skcQ==
X-Gm-Message-State: AOJu0YymeBQiFVXFcpTJctZx8FyRV5hjQ+Q1VFXJzOHfyZ15e8q5Xitp
 HU+InTQ2BH58T+jipOuPwSy7uTORUthPSd/lxbUV5OR67dzl4Tl3IbtStN7X3HzZ1mjfZQRfaLL
 PVh+jiJAplamOiokbmruZltjScb25wFifawg4Nc4HFZGZB+rPBr0C6A==
X-Gm-Gg: ASbGncu5QEXZBTb+Q7TRlzq/6QFVoMa/wEF1FxyWWtQ5of7jRO91AphgsY1/6JmGH6Q
 ePl04ZnWx3rYUsNR6rAzWLXIsqVXdwsRFlquVSOgt9iVJyye5Jtdsa0ZkJGkjPb7kTez6OmvUMy
 xBZa65ZwyvM1/x0Qnr6HOqMfgsbQOmf672UlXdaKBdMjujUFAIq97+mUgmwxtvoLHrbq1Yk2KRm
 aFQzgMfySrMpZ1t1G4hlqDBxo2jk0O4Yp0nxD8ig/CjVSg19twimtlauCy8fewZudT0iTYd9GEI
 Bg66gwAsoxaWx910r/oro2hIF7FBQphwlcCDeRqzRLdEzdcQKkGnfAgA5T6OvJut8g==
X-Received: by 2002:a05:600c:3149:b0:46f:aac5:daf with SMTP id
 5b1f17b1804b1-4711792a51bmr27864125e9.35.1760711271063; 
 Fri, 17 Oct 2025 07:27:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGwxVVNwsFMcWZO8p1xAkGtRVwJetDwQ/aJgYFkjFuZehLt2Orir2SzfvRVDUMVmkG0vm+Yw==
X-Received: by 2002:a05:600c:3149:b0:46f:aac5:daf with SMTP id
 5b1f17b1804b1-4711792a51bmr27863865e9.35.1760711270574; 
 Fri, 17 Oct 2025 07:27:50 -0700 (PDT)
Received: from fedora ([85.93.96.130]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-471144b5c34sm93546185e9.10.2025.10.17.07.27.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Oct 2025 07:27:49 -0700 (PDT)
Date: Fri, 17 Oct 2025 16:27:46 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, mst@redhat.com,
 anisinha@redhat.com, gengdongjiu1@gmail.com, peter.maydell@linaro.org,
 pbonzini@redhat.com, mchehab+huawei@kernel.org,
 Jonathan.Cameron@huawei.com, shan.gavin@gmail.com
Subject: Re: [PATCH RESEND v2 3/3] target/arm/kvm: Support multiple memory
 CPERs injection
Message-ID: <20251017162746.2a99015b@fedora>
In-Reply-To: <20251007060810.258536-4-gshan@redhat.com>
References: <20251007060810.258536-1-gshan@redhat.com>
 <20251007060810.258536-4-gshan@redhat.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: TEjq3sRMswys3d9FuN0I7NTLJKexiiSc1rJWW3NtnZQ_1760711271
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue,  7 Oct 2025 16:08:10 +1000
Gavin Shan <gshan@redhat.com> wrote:

> In the combination of 64KB host and 4KB guest, a problematic host page
> affects 16x guest pages. In this specific case, it's reasonable to
> push 16 consecutive memory CPERs. Otherwise, QEMU can run into core
> dump due to the current error can't be delivered as the previous error
> isn't acknoledges. It's caused by the nature the host page can be
> accessed in parallel due to the mismatched host and guest page sizes.

can you explain a bit more what goes wrong?

I'm especially interested in parallel access you've mentioned
and why batch adding error records is needed
as opposed to adding records every time invalid access happens?

PS:
Assume I don't remember details on how HEST works,
Answering it in this format also should improve commit message
making it more digestible for uninitiated.

> Imporve push_ghes_memory_errors() to push 16x consecutive memory CPERs
> for this specific case. The maximal error block size is bumped to 4KB,
> providing enough storage space for those 16x memory CPERs.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>  hw/acpi/ghes.c   |  2 +-
>  target/arm/kvm.c | 46 +++++++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 46 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> index 045b77715f..5c87b3a027 100644
> --- a/hw/acpi/ghes.c
> +++ b/hw/acpi/ghes.c
> @@ -33,7 +33,7 @@
>  #define ACPI_HEST_ADDR_FW_CFG_FILE          "etc/acpi_table_hest_addr"
>  
>  /* The max size in bytes for one error block */
> -#define ACPI_GHES_MAX_RAW_DATA_LENGTH   (1 * KiB)
> +#define ACPI_GHES_MAX_RAW_DATA_LENGTH   (4 * KiB)
>  
>  /* Generic Hardware Error Source version 2 */
>  #define ACPI_GHES_SOURCE_GENERIC_ERROR_V2   10
> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> index c5d5b3b16e..3ecb85e4b7 100644
> --- a/target/arm/kvm.c
> +++ b/target/arm/kvm.c
> @@ -11,6 +11,7 @@
>   */
>  
>  #include "qemu/osdep.h"
> +#include "qemu/units.h"
>  #include <sys/ioctl.h>
>  
>  #include <linux/kvm.h>
> @@ -2433,10 +2434,53 @@ static void push_ghes_memory_errors(CPUState *c, AcpiGhesState *ags,
>                                      uint64_t paddr)
>  {
>      GArray *addresses = g_array_new(false, false, sizeof(paddr));
> +    uint64_t val, start, end, guest_pgsz, host_pgsz;
>      int ret;
>  
>      kvm_cpu_synchronize_state(c);
> -    g_array_append_vals(addresses, &paddr, 1);
> +
> +    /*
> +     * Sort out the guest page size from TCR_EL1, which can be modified
> +     * by the guest from time to time. So we have to sort it out dynamically.
> +     */
> +    ret = read_sys_reg64(c->kvm_fd, &val, ARM64_SYS_REG(3, 0, 2, 0, 2));
> +    if (ret) {
> +        goto error;
> +    }
> +
> +    switch (extract64(val, 14, 2)) {
> +    case 0:
> +        guest_pgsz = 4 * KiB;
> +        break;
> +    case 1:
> +        guest_pgsz = 64 * KiB;
> +        break;
> +    case 2:
> +        guest_pgsz = 16 * KiB;
> +        break;
> +    default:
> +        error_report("unknown page size from TCR_EL1 (0x%" PRIx64 ")", val);
> +        goto error;
> +    }
> +
> +    host_pgsz = qemu_real_host_page_size();
> +    start = paddr & ~(host_pgsz - 1);
> +    end = start + host_pgsz;
> +    while (start < end) {
> +        /*
> +         * The precise physical address is provided for the affected
> +         * guest page that contains @paddr. Otherwise, the starting
> +         * address of the guest page is provided.
> +         */
> +        if (paddr >= start && paddr < (start + guest_pgsz)) {
> +            g_array_append_vals(addresses, &paddr, 1);
> +        } else {
> +            g_array_append_vals(addresses, &start, 1);
> +        }
> +
> +        start += guest_pgsz;
> +    }
> +
>      ret = acpi_ghes_memory_errors(ags, ACPI_HEST_SRC_ID_SYNC, addresses);
>      if (ret) {
>          goto error;


