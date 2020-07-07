Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp797713lfm;
        Tue, 7 Jul 2020 03:15:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxbFLNnso+SNqjT/uOPQF3RA7/j/8KbVjYV6c4ast3L9vT0vvSnFvj/zx75NiInMmHkihAx
X-Received: by 2002:a25:41d4:: with SMTP id o203mr24318339yba.378.1594116929437;
        Tue, 07 Jul 2020 03:15:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1594116929; cv=none;
        d=google.com; s=arc-20160816;
        b=iwAW3oSFqt8393YBkVTz7/9H04PmV2pyMCnBoOA63gXEBPFqpT5b+hyNbw6wMk3YPG
         lGErxH+NTcDG2mWkvShyR+fsoyKwJ9D/VJG5L7d0OAJSulNCeU6z1RuOABINH8kJqdn4
         u8aoeI2vkwGzEOASFh7TnPa3d3orXHNIvM+/3m4dKu/n36trk6XjbYKcYGy3scKujVlB
         iFyvTnWQDeigcjRTehHiYCYWdLZhXNHTYZtT3nlqSQhaEM7CQqapjlD+OlZiaaox8kZe
         1vEnRIZgouTECjWxigxXejkOFdlSVPw/wV5PdGo2fCBUOlNRA4uHif6bT8GNY90Vz3rG
         tRpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=ntxF86zyCTgxTRPWczFnChpYattYIeVXv6cHyagvD4I=;
        b=MqsYG8T3EGZnApCSWRaArJl7JMdKyN0PVkNM+W9S6IWcVnHjvIUDL18IMmVts40JUb
         sXgBLBDFnKRhQ0KWrfzlMdkfrvK7wP0ldCwiHSu2yQhQ8lJLk8OxbOBs2T2MD00T2GIh
         u8OQks2PiaYBDihx2ySOKxCzRIgZi5RWOK4SGpdPUoDmIVVZWLB/pXu0AwXUPqYedK1r
         EeGZ2Ik8Nn2C4P7SGJos6ygXun4ZXcF0obT+s3SxBeWnO4/h67+eAel4VLdBzO2W7mx/
         4vq8sHfOoe7kJ/hRUO7dKyhEQ4mzT8cre0GWgEk4rD2tZxqEUR8xl58YfBZpmdUdmKv/
         nCaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WBLQnQHn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q72si22751891ybg.133.2020.07.07.03.15.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jul 2020 03:15:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=WBLQnQHn;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jskdM-0000b2-Qe
	for alex.bennee@linaro.org; Tue, 07 Jul 2020 06:15:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1jskdE-0000aG-H7
 for qemu-arm@nongnu.org; Tue, 07 Jul 2020 06:15:20 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:47826
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1jskdC-0001uL-Ju
 for qemu-arm@nongnu.org; Tue, 07 Jul 2020 06:15:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594116917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ntxF86zyCTgxTRPWczFnChpYattYIeVXv6cHyagvD4I=;
 b=WBLQnQHnxeFyriloGOu675dvYg1DpFLxQjUef21vBhFww8gTJm1FmdiAiBJSXlIr8uSapB
 YbMKritmG4uPlOn+NeXOd/klhfZDAoCy20acscVlzFBlS9/MTap3xS4CVP9PP7WfbiBXls
 9uw0tp8pn+2w0cPt0QVVFQG3wXAlbIQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-366-5fsI_buAPda24pMu0_XhSw-1; Tue, 07 Jul 2020 06:15:00 -0400
X-MC-Unique: 5fsI_buAPda24pMu0_XhSw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 40C748005B0;
 Tue,  7 Jul 2020 10:14:59 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.193.152])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4756F19C58;
 Tue,  7 Jul 2020 10:14:53 +0000 (UTC)
Date: Tue, 7 Jul 2020 12:14:51 +0200
From: Andrew Jones <drjones@redhat.com>
To: Heyi Guo <guoheyi@linux.alibaba.com>
Subject: Re: [RFC] virt/acpi: set PSCI flag even when psci_conduit is disabled
Message-ID: <20200707101451.usrho4qbn55ffaq5@kamzik.brq.redhat.com>
References: <1593769409-13534-1-git-send-email-guoheyi@linux.alibaba.com>
MIME-Version: 1.0
In-Reply-To: <1593769409-13534-1-git-send-email-guoheyi@linux.alibaba.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=drjones@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=drjones@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/07 06:04:49
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, yitian.ly@alibaba-inc.com,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: h+gjVHESQT+S

On Fri, Jul 03, 2020 at 05:43:29PM +0800, Heyi Guo wrote:
> vms->psci_conduit being disabled only means PSCI is not implemented by
> qemu; it doesn't mean PSCI is not supported on this virtual machine.
> Actually vms->psci_conduit is set to disabled when vms->secure and
> firmware_loaded are both set, which means we will run ARM trusted
> firmware, which will definitely provide PSCI.
> 
> The issue can be reproduced when running qemu in TCG mode with secure
> enabled, while using ARM trusted firmware + qemu virt UEFI as firmware
> binaries, and we can see secondary cores will not be waken up.
> 
> Signed-off-by: Heyi Guo <guoheyi@linux.alibaba.com>
> 
> ---
> Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> Cc: Igor Mammedov <imammedo@redhat.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> ---
>  hw/arm/virt-acpi-build.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 1384a2c..7622b97 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -728,13 +728,16 @@ static void build_fadt_rev5(GArray *table_data, BIOSLinker *linker,
>      };
>  
>      switch (vms->psci_conduit) {
> -    case QEMU_PSCI_CONDUIT_DISABLED:
> -        fadt.arm_boot_arch = 0;
> -        break;
>      case QEMU_PSCI_CONDUIT_HVC:
>          fadt.arm_boot_arch = ACPI_FADT_ARM_PSCI_COMPLIANT |
>                               ACPI_FADT_ARM_PSCI_USE_HVC;
>          break;
> +    /*
> +     * QEMU_PSCI_CONDUIT_DISABLED only means PSCI is not implemented by qemu,
> +     * but typically it will still be provided by secure firmware, and it should
> +     * use SMC as PSCI conduit.
> +     */

How about elaborating on this in the comment like below?

 QEMU_PSCI_CONDUIT_DISABLED means PSCI is not implemented by QEMU. In
 this case we must have an EL3 firmware, which will most likely provide
 PSCI to the guest with the SMC conduit. If this assumption is wrong,
 then it is no worse than assuming PSCI is not available to the guest
 when it should be. The only way a user can be sure that the ACPI tables
 match what the firmware supports is if the firmware provides the ACPI
 tables itself.

> +     * but typically it will still be provided by secure firmware, and it should
> +     * use SMC as PSCI conduit.


> +    case QEMU_PSCI_CONDUIT_DISABLED:
>      case QEMU_PSCI_CONDUIT_SMC:
>          fadt.arm_boot_arch = ACPI_FADT_ARM_PSCI_COMPLIANT;
>          break;
> -- 
> 2.7.4
> 
>

Otherwise

Reviewed-by: Andrew Jones <drjones@redhat.com>

