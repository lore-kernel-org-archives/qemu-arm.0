Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1873515wrg;
        Thu, 20 Jun 2019 05:43:10 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxaLq5915Vk3G85f8FRcI0AV5xnwCIx1Z7t8Gu77GuCupyF33qt1Z8GYeNFz+uwKzyHDziH
X-Received: by 2002:a62:5252:: with SMTP id g79mr92604318pfb.18.1561034590387;
        Thu, 20 Jun 2019 05:43:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561034590; cv=none;
        d=google.com; s=arc-20160816;
        b=V7Mq0wmyoEaEnWxV4uDTivqbPlMNP31kWH9njaDAW8dLlsKRIm1d3b1KJ55bLKw1b7
         S6wrTD7XdPX32CM+EZ+9gmlKfg+bPnZPqBxVBCJ51vv9+j24gv7daVt+uLyOhnPmxZut
         U11MnKlXigDkVuV2dOU0mSjmZ/XO4/PhQg+mM2XSGSI5JvZ3H79EG/WuM2q89f14tK34
         IIvrWFqYleLf8Z0A+ekBYN9k7CGgHu59jNq+Dg/LFZi0dYPazmbdI6/m+XhVlueeHryt
         HanC0cQw3WHAJqK6BPeIFXYS94n0ZwLC/zfGqLli/4WxNAqD8jgZVO704KgvHnl77iZp
         Ejyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :references:in-reply-to:message-id:subject:cc:to:from:date;
        bh=Y9H7morZVRT9JYQIfm61beaY7If1iGUcvvpYqya1SLs=;
        b=tWjTMHB8IePrQAsb5wTsXf8HV3wXlq/3n700UtgnXAbvFtt1xQ16h42etxThYoe8nj
         tZuass+MUFT7TG9Xg77HmliB54SxF/uca1ggkeGjV2SIW6Wgmu4yrkfr+44bCcyCJeFX
         ZWmShUoU31571QMQZ6ogOwFdCjNy8q/9mD29lDR4BsQjoVGLgpC35gpTZZGY55zwq5La
         +LvZxVQDpWjdGG9zkzuRkNB9LI4ihGWDIgKSYeMSxpxddoELimC3s8GxRhTkAtEPdi2V
         NzX+1sCu9C81xk4Yq0giVrypa+aMosHaYT5PiXPUjWaOiwCRwdm3IuABr0sySbYtLm4f
         RCug==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id j5si4101082pjn.1.2019.06.20.05.43.10;
        Thu, 20 Jun 2019 05:43:10 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731831AbfFTMnJ (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 5 others); Thu, 20 Jun 2019 08:43:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48462 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726874AbfFTMnI (ORCPT <rfc822;kvm@vger.kernel.org>);
        Thu, 20 Jun 2019 08:43:08 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 87215307D866;
        Thu, 20 Jun 2019 12:43:07 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 470F95C205;
        Thu, 20 Jun 2019 12:43:02 +0000 (UTC)
Date:   Thu, 20 Jun 2019 14:42:57 +0200
From:   Igor Mammedov <imammedo@redhat.com>
To:     Dongjiu Geng <gengdongjiu@huawei.com>
Cc:     <pbonzini@redhat.com>, <mst@redhat.com>,
        <shannon.zhaosl@gmail.com>, <peter.maydell@linaro.org>,
        <lersek@redhat.com>, <james.morse@arm.com>, <mtosatti@redhat.com>,
        <rth@twiddle.net>, <ehabkost@redhat.com>, <zhengxiang9@huawei.com>,
        <jonathan.cameron@huawei.com>, <xuwei5@huawei.com>,
        <kvm@vger.kernel.org>, <qemu-devel@nongnu.org>,
        <qemu-arm@nongnu.org>, <linuxarm@huawei.com>
Subject: Re: [PATCH v17 05/10] acpi: add build_append_ghes_generic_status()
 helper for Generic Error Status Block
Message-ID: <20190620144257.7400b0a7@redhat.com>
In-Reply-To: <1557832703-42620-6-git-send-email-gengdongjiu@huawei.com>
References: <1557832703-42620-1-git-send-email-gengdongjiu@huawei.com>
        <1557832703-42620-6-git-send-email-gengdongjiu@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Thu, 20 Jun 2019 12:43:07 +0000 (UTC)
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: c+AqDUf7Yqjn

On Tue, 14 May 2019 04:18:18 -0700
Dongjiu Geng <gengdongjiu@huawei.com> wrote:

> It will help to add Generic Error Status Block to ACPI tables
> without using packed C structures and avoid endianness
> issues as API doesn't need explicit conversion.
> 
> Signed-off-by: Dongjiu Geng <gengdongjiu@huawei.com>
> ---
>  hw/acpi/aml-build.c         | 14 ++++++++++++++
>  include/hw/acpi/aml-build.h |  6 ++++++
>  2 files changed, 20 insertions(+)
> 
> diff --git a/hw/acpi/aml-build.c b/hw/acpi/aml-build.c
> index 102a288..ce90970 100644
> --- a/hw/acpi/aml-build.c
> +++ b/hw/acpi/aml-build.c
> @@ -296,6 +296,20 @@ void build_append_ghes_notify(GArray *table, const uint8_t type,
>          build_append_int_noprefix(table, error_threshold_window, 4);
>  }
>  
> +/* Generic Error Status Block
> + * ACPI 4.0: 17.3.2.6.1 Generic Error Data
> + */
> +void build_append_ghes_generic_status(GArray *table, uint32_t block_status,
maybe ..._generic_error_status???

> +                      uint32_t raw_data_offset, uint32_t raw_data_length,
> +                      uint32_t data_length, uint32_t error_severity)
see CODING_STYLE, 1.1 Multiline Indent

> +{
when describing filds from spec try to add 'verbatim' copy of the name from spec
so it would be esy to grep for it. Like:
       /* Block Status */
> +    build_append_int_noprefix(table, block_status, 4);
       /* Raw Data Offset */

note applies all other places where you compose ACPI tables

> +    build_append_int_noprefix(table, raw_data_offset, 4);
> +    build_append_int_noprefix(table, raw_data_length, 4);
> +    build_append_int_noprefix(table, data_length, 4);
> +    build_append_int_noprefix(table, error_severity, 4);
> +}
> +
>  /* Generic Error Data Entry
>   * ACPI 4.0: 17.3.2.6.1 Generic Error Data
>   */
> diff --git a/include/hw/acpi/aml-build.h b/include/hw/acpi/aml-build.h
> index a71db2f..1ec7e1b 100644
> --- a/include/hw/acpi/aml-build.h
> +++ b/include/hw/acpi/aml-build.h
> @@ -425,6 +425,12 @@ void build_append_ghes_generic_data(GArray *table, const char *section_type,
>                                      uint32_t error_data_length, uint8_t *fru_id,
>                                      uint8_t *fru_text, uint64_t time_stamp);
>  
> +void
> +build_append_ghes_generic_status(GArray *table, uint32_t block_status,
> +                                 uint32_t raw_data_offset,
> +                                 uint32_t raw_data_length,
> +                                 uint32_t data_length, uint32_t error_severity);
this and previous patch, it might be better to to move declaration
to its own header, for example to include/hw/acpi/acpi_ghes.h
that you are adding later in the series.
And maybe move helpers to hw/acpi/acpi_ghes.c
They are not really independent ACPI primitives that are shared
with other tables, aren't they?
.
> +
>  void build_srat_memory(AcpiSratMemoryAffinity *numamem, uint64_t base,
>                         uint64_t len, int node, MemoryAffinityFlags flags);
>  
