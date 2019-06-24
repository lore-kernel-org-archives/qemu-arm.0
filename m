Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3660189wrg;
        Mon, 24 Jun 2019 04:22:03 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwLoVMBLPiCL/Of15SmQQJcatWa4W9rHsi4ooZodfgZy4Nhz36u982JRb5UNg4MGhWlOXoh
X-Received: by 2002:a63:50f:: with SMTP id 15mr19035508pgf.148.1561375322984;
        Mon, 24 Jun 2019 04:22:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561375322; cv=none;
        d=google.com; s=arc-20160816;
        b=VB8PlODQgEn4/QThIuxrOZ+7SdVsGxHOUfXTUFJrKQk9CpI4e2NQnxvbX6+hVCitXm
         Yttl1zNteWv9l3auyOMf9a91B39L2oPmkmhtY4M9av/K9UFR1y1DU6P3F6NyWH3+BeOy
         ZeL83jMHUb4Eppu8x5muQXnyn/1M9eBZtSZ0BUWmgs9ukvUU4WuxT0UlTOAYe/rU/VdW
         S0Ac7mi+lAofgiOsHMX7BOmdKc+hdZuFStn7/yoorUC/7rGjOePD//7LYyWC32RN1Dh7
         r6FuD7jQLgMa8Ph08dsVKr9aYTFPQSeuU3ifo8nBl9QUe8QMWZdf3PpniQpd9F2Z1pHe
         BKXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:subject:cc:to:from:date;
        bh=te4FGEvCzcn2u1lyiqfzWvKatwWfmwhXkMkNXCEanqY=;
        b=lVEDna85Ry5K3+rNM0jkCoDBkjrXBa+tY1yR/e7L85vEMquSW975egQFDK9PC+Nuw6
         nAZWrGo9WfrNkwomOwU1fTTuZQ8xtQF4IxpuAoWzVLQfXDQt57lrTmyNwCGuGRLUbxom
         8BCoLlCHoeEiPgXzgtnZs+5BIkvYZWtnqzO4vD5RbHbzC2PRBQ5zpUlkSHWFDkkwSIJ8
         EIIHYh4kCBZ/pttaUUmDz1jpQLKP0aNchinSKZ1iKlCZpB5cFxoIeGCFa89n8MozjkmG
         PX2CjKDoAdl42ISvjG7rspRaLM9mti1z1QO8ZAB3NSIt6EF9ex343zEvBy8ojKX7U5fU
         fDrA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id bh8si221594plb.175.2019.06.24.04.22.02;
        Mon, 24 Jun 2019 04:22:02 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728871AbfFXLWB (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 5 others); Mon, 24 Jun 2019 07:22:01 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34492 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727722AbfFXLWB (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 24 Jun 2019 07:22:01 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id B8A61368FF;
        Mon, 24 Jun 2019 11:21:59 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 8CD8B608D0;
        Mon, 24 Jun 2019 11:21:53 +0000 (UTC)
Date:   Mon, 24 Jun 2019 13:21:49 +0200
From:   Igor Mammedov <imammedo@redhat.com>
To:     Dongjiu Geng <gengdongjiu@huawei.com>
Cc:     <pbonzini@redhat.com>, <mst@redhat.com>,
        <shannon.zhaosl@gmail.com>, <peter.maydell@linaro.org>,
        <lersek@redhat.com>, <james.morse@arm.com>, <mtosatti@redhat.com>,
        <rth@twiddle.net>, <ehabkost@redhat.com>, <zhengxiang9@huawei.com>,
        <jonathan.cameron@huawei.com>, <xuwei5@huawei.com>,
        <kvm@vger.kernel.org>, <qemu-devel@nongnu.org>,
        <qemu-arm@nongnu.org>, <linuxarm@huawei.com>
Subject: Re: [PATCH v17 03/10] acpi: add build_append_ghes_notify() helper
 for Hardware Error Notification
Message-ID: <20190624132149.3c79fadc@redhat.com>
In-Reply-To: <1557832703-42620-4-git-send-email-gengdongjiu@huawei.com>
References: <1557832703-42620-1-git-send-email-gengdongjiu@huawei.com>
        <1557832703-42620-4-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.30]); Mon, 24 Jun 2019 11:22:01 +0000 (UTC)
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: DglOTBsoPutF

On Tue, 14 May 2019 04:18:16 -0700
Dongjiu Geng <gengdongjiu@huawei.com> wrote:

> It will help to add Hardware Error Notification to ACPI tables
> without using packed C structures and avoid endianness
> issues as API doesn't need explicit conversion.
> 
> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
> ---
>  hw/acpi/aml-build.c         | 22 ++++++++++++++++++++++
>  include/hw/acpi/aml-build.h |  8 ++++++++
>  2 files changed, 30 insertions(+)
> 
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index 555c24f..fb53f21 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -274,6 +274,28 @@ void build_append_gas(GArray *table, AmlAddressSpace as,
>      build_append_int_noprefix(table, address, 8);
>  }
>  
> +/* Hardware Error Notification
> + * ACPI 4.0: 17.3.2.7 Hardware Error Notification
> + */
> +void build_append_ghes_notify(GArray *table, const uint8_t type,
> +                              uint8_t length, uint16_t config_write_enable,
> +                              uint32_t poll_interval, uint32_t vector,
> +                              uint32_t polling_threshold_value,
> +                              uint32_t polling_threshold_window,
> +                              uint32_t error_threshold_value,
> +                              uint32_t error_threshold_window)
> +{
> +        build_append_int_noprefix(table, type, 1); /* type */
comment should be verbatim copy from spec, in this case /* Type */
also do the same for other fields below

other than that patch looks good to me

> +        build_append_int_noprefix(table, length, 1);
> +        build_append_int_noprefix(table, config_write_enable, 2);
> +        build_append_int_noprefix(table, poll_interval, 4);
> +        build_append_int_noprefix(table, vector, 4);
> +        build_append_int_noprefix(table, polling_threshold_value, 4);
> +        build_append_int_noprefix(table, polling_threshold_window, 4);
> +        build_append_int_noprefix(table, error_threshold_value, 4);
> +        build_append_int_noprefix(table, error_threshold_window, 4);
> +}
> +
>  /*
>   * Build NAME(XXXX, 0x00000000) where 0x00000000 is encoded as a dword,
>   * and return the offset to 0x00000000 for runtime patching.
> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
> index 1a563ad..90c8ef8 100644
> --- a/include/hw/acpi/aml-build.h
> +++ b/include/hw/acpi/aml-build.h
> @@ -411,6 +411,14 @@ build_append_gas_from_struct(GArray *table, const struct AcpiGenericAddress *s)
>                       s->access_width, s->address);
>  }
>  
> +void build_append_ghes_notify(GArray *table, const uint8_t type,
> +                              uint8_t length, uint16_t config_write_enable,
> +                              uint32_t poll_interval, uint32_t vector,
> +                              uint32_t polling_threshold_value,
> +                              uint32_t polling_threshold_window,
> +                              uint32_t error_threshold_value,
> +                              uint32_t error_threshold_window);
> +
>  void build_srat_memory(AcpiSratMemoryAffinity *numamem, uint64_t base,
>                         uint64_t len, int node, MemoryAffinityFlags flags);
>  
