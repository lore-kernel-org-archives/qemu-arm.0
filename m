Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FDD7CAC592
	for <qemu-arm@archiver.kernel.org>; Mon, 22 Sep 2025 19:54:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v0mc1-0006j5-Tl; Mon, 22 Sep 2025 15:54:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1v0mc1-0006iT-Bv
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 15:54:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1v0mbt-0007lg-8H
 for qemu-arm@nongnu.org; Mon, 22 Sep 2025 15:54:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1758570841;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q0Yqg8gEbvJo/CoFFTxRv8DSp1CKYcYqQm7EktP6gkM=;
 b=VBrwV7hxuiOUGB+N3uqXTmfT3V/Gs7EU/mSDbRMmIFRRjl6H3ceJT2qbUVQyeCTEeJ4X7B
 Po6B83ZtG8FxURssa4bXs+0YbVvUYaQQGf1iRuutNChiKHl/CD7QfSl+TYntAEqIGSXm0U
 R5NL6GSW83MnCb46vSS5t5HirU41k80=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-494-W6RjirquPeeFhqmvLxh81Q-1; Mon, 22 Sep 2025 15:54:00 -0400
X-MC-Unique: W6RjirquPeeFhqmvLxh81Q-1
X-Mimecast-MFC-AGG-ID: W6RjirquPeeFhqmvLxh81Q_1758570839
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3f42b54d159so2373625f8f.2
 for <qemu-arm@nongnu.org>; Mon, 22 Sep 2025 12:53:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758570839; x=1759175639;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q0Yqg8gEbvJo/CoFFTxRv8DSp1CKYcYqQm7EktP6gkM=;
 b=lSZqAeGA39H4+Pc2I/VYHm86fPJwToRyoMpscaAHXRstZluwdfnngbSraVjXleVkPB
 IbFqccBDp5RgrNIOFYtNxYYEL/olu0+Ri6DSbbsug996rpN7+dK6wXFPpDIv3MmZAmt+
 5PUe1LsiKXR5RCa4u29n8kZkRL+ADhVFR7ZAaMf6dbGhFGkaTwl2tRrc1PzW0Wsjcg2f
 Fu7kBWN25IXSEHlf+DYfRcFfJHGqAUpdhVg4OiCVqGNyTjyXiyKy+miTWdOKTPRJ+s3U
 cNWAT4yAxdZTaxL17WEMXZCzRCvda5f2KRVxvfwBj7v9eT/b43BtpGawu42It2y4AO22
 tnwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbyTtbkG/5Wi0mE/e9BErlFhfVASGqNmgQGyuIJNUSZ5sQarGHkp45IIPIi0T4l8rnb6T3cK+Pcw==@nongnu.org
X-Gm-Message-State: AOJu0YwpoBAu5zBu9ZdR30A97BbRdjmzwxhOYUdHtfcBEDn/QSmB/fi3
 V2rvdZQKnWG0ASoaP8mx9zOnJ0Kpq/dbPQX0W49G+Y0EWOBnKhMbYRTKG9gV0dOBKOCra4RyIIz
 29Tb9H5Z2OtE3DwmRZq3AyFS4TTm2thmPIYITR+7BX+1nZxXWAXbdpQ==
X-Gm-Gg: ASbGncs8/JCUCLiT5T4PtcgNxUlMlEMbQ+BmA9NPRzxTvt2JvvukJPM72vldcj9BgoC
 f3hEYA7TYDpYXcWPJlLpdTITxG3HRJuNWWKeeYRFcaVr/PD9xs8LZA3Nv+tP49LztGeMgX9e5+k
 xudfaX25mTaUxfAPI8fovuFtxz12yK2A4INdhDH9+60l1DatU84RCA//WcvL3BbNLbItUjvJg0o
 8w3YbhQ4CCHHRVsoW7II90S6YZll5vIVGlmHGH6Z9QY7+UQ71p/TOwDvQZ0MK9RLk0RjiADiuMH
 GsusHmCwW+IM9TkfLXeVXvB2S2QmQEMBxgs=
X-Received: by 2002:a05:6000:144f:b0:3dc:ca9d:e3d7 with SMTP id
 ffacd0b85a97d-3ee7c92548amr10579652f8f.8.1758570838861; 
 Mon, 22 Sep 2025 12:53:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHp8THkRNhPscjEqQIO4If5x2KjyP8dZD4dQVet5lrqUeRiHNoBL7mMlbSonlrCt+D9jHyOLw==
X-Received: by 2002:a05:6000:144f:b0:3dc:ca9d:e3d7 with SMTP id
 ffacd0b85a97d-3ee7c92548amr10579640f8f.8.1758570838450; 
 Mon, 22 Sep 2025 12:53:58 -0700 (PDT)
Received: from redhat.com ([2a06:c701:73ea:f900:52ee:df2b:4811:77e0])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-467fc818e00sm177847365e9.0.2025.09.22.12.53.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Sep 2025 12:53:57 -0700 (PDT)
Date: Mon, 22 Sep 2025 15:53:54 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Igor Mammedov <imammedo@redhat.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Shiju Jose <shiju.jose@huawei.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Ani Sinha <anisinha@redhat.com>,
 Dongjiu Geng <gengdongjiu1@gmail.com>
Subject: Re: [PATCH v11 07/17] acpi/ghes: add a notifier to notify when error
 data is ready
Message-ID: <20250922155111-mutt-send-email-mst@kernel.org>
References: <cover.1757084668.git.mchehab+huawei@kernel.org>
 <ef3f17b5ca97c6e2774bba346f830cce6e0c3dc1.1757084668.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
In-Reply-To: <ef3f17b5ca97c6e2774bba346f830cce6e0c3dc1.1757084668.git.mchehab+huawei@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xHH5Cxp0L9AE-lC6u0vNBaA1QYpstXcIfAonFvUdDJw_1758570839
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.442,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Fri, Sep 05, 2025 at 05:09:14PM +0200, Mauro Carvalho Chehab wrote:
> Some error injection notify methods are async, like GPIO
> notify. Add a notifier to be used when the error record is
> ready to be sent to the guest OS.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Acked-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  hw/acpi/ghes.c         | 5 ++++-
>  include/hw/acpi/ghes.h | 3 +++
>  2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> index f49d0d628fc4..0135ac844bcf 100644
> --- a/hw/acpi/ghes.c
> +++ b/hw/acpi/ghes.c
> @@ -510,6 +510,9 @@ static void get_ghes_source_offsets(uint16_t source_id,
>      *read_ack_start_addr = le64_to_cpu(*read_ack_start_addr);
>  }
>  
> +NotifierList acpi_generic_error_notifiers =
> +    NOTIFIER_LIST_INITIALIZER(error_device_notifiers);
> +

I don't get where is "error_device_notifiers" defined.

I think it is not, and it works because the parameter is unused right now.

But it still should be:


NotifierList acpi_generic_error_notifiers =
    NOTIFIER_LIST_INITIALIZER(acpi_generic_error_notifiers);

Same as all other initializers.



>  void ghes_record_cper_errors(AcpiGhesState *ags, const void *cper, size_t len,
>                               uint16_t source_id, Error **errp)
>  {
> @@ -550,7 +553,7 @@ void ghes_record_cper_errors(AcpiGhesState *ags, const void *cper, size_t len,
>      /* Write the generic error data entry into guest memory */
>      cpu_physical_memory_write(cper_addr, cper, len);
>  
> -    return;
> +    notifier_list_notify(&acpi_generic_error_notifiers, NULL);
>  }
>  
>  int acpi_ghes_memory_errors(AcpiGhesState *ags, uint16_t source_id,
> diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
> index 8c4b08433760..390943e46d99 100644
> --- a/include/hw/acpi/ghes.h
> +++ b/include/hw/acpi/ghes.h
> @@ -24,6 +24,9 @@
>  
>  #include "hw/acpi/bios-linker-loader.h"
>  #include "qapi/error.h"
> +#include "qemu/notify.h"
> +
> +extern NotifierList acpi_generic_error_notifiers;
>  
>  /*
>   * Values for Hardware Error Notification Type field
> -- 
> 2.51.0


