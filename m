Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B116C83F1A
	for <qemu-arm@archiver.kernel.org>; Thu, 10 Jul 2025 06:56:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uZlCl-0000XG-Je; Thu, 10 Jul 2025 02:56:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1uZlBB-00007c-VP
 for qemu-arm@nongnu.org; Thu, 10 Jul 2025 02:54:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ppandit@redhat.com>)
 id 1uZlB9-0000Dg-Ec
 for qemu-arm@nongnu.org; Thu, 10 Jul 2025 02:54:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1752130485;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HeFcInUI5ka0CvZOXfIu+qHWVLjUClVhVKEoR5iDrsY=;
 b=JZeFCY+eIyLUgCu9mwjHIqVxVJph/8iZhRAWRRsXw6u4FThBvNdUtHVaDoAsRONTzWFWJU
 6PqrEL/utDwwiJz6bJvs3HiT/aVA11JphZ3TXQLfTqfhlD+B/18qIgOXESnwZ5PJS3+Cu9
 KjwoAQEfonOMRc6oTfM0tuvvn+U68Rk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-527-dzk3-gRcMkukuFJLHvsX_w-1; Thu, 10 Jul 2025 02:53:31 -0400
X-MC-Unique: dzk3-gRcMkukuFJLHvsX_w-1
X-Mimecast-MFC-AGG-ID: dzk3-gRcMkukuFJLHvsX_w_1752130411
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-450eaae2934so4288365e9.2
 for <qemu-arm@nongnu.org>; Wed, 09 Jul 2025 23:53:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752130411; x=1752735211;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HeFcInUI5ka0CvZOXfIu+qHWVLjUClVhVKEoR5iDrsY=;
 b=G6QzcKwmUm7AdcRxCHVVkqCCBzXQzgSQXQPktEUeIIL1TYRn/YfMG9le4O2/G0R9xk
 b07oAvhRED+mcDzfrHSR4AFjk5eCnM4QUTQQI6AupzDfsaq2oQ47dIYP2fUvD0BMzwxC
 TykPUA9aVmixtzhmhf/DiWQ5a6P1KPIxhqbXhU4BXu6OeUn/t7S899FO0NOVremvxlWP
 ZQSI4KFa3ejIECGB3IB8pCe0V4zmvbthUeEx2CWAXqqlXlRsxKaBg9CGDCSzQwy56OtI
 nR5VQVNWPx+bssj6vnqfow/ADtMRWTU7+YcsFjKZyw767gJwGKNqlds8Lyyq2KFVq6dU
 qfuQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWc+WTId3RgZFqC11lM0pfEpvIQ4Df+rtMdzaITvvrHs7Qv+kRhqVa56OTQnYDW/CDkMu7hhC/J+w==@nongnu.org
X-Gm-Message-State: AOJu0Yy1Cu95OdkQoOdBBHMbF2Oi2UATTdnIRcwAJaqBuruuHDng3Z9D
 qvDRTRavQL6/x8Yu/YT14+qdOCQh1aqIruYFlBwhM+Y7Bt9RMPuK4k2zvZRsaAtEiRmPLL5dqr9
 8nD0pCcQaJ/IslRv1baqRCpVkGUUx/wno9Cm463/H/djom6lRRBfR3o1R170RUazqJqMMQtHToo
 Zm2+su0uHeCXeVmuSffqJeuMfu3ii8
X-Gm-Gg: ASbGncuJjqlugjLIArmnbvPgzFcv7UqGocFHysHg0WenzNIlhfr5/Ckr/C4nSNfU+Dx
 DlEqNIQUD6f8wDoawA4KnsQyQNskvp7B+ttja6GNfyDo2CGGGneLxoaImaXcBTSTDgF72dQxjbG
 vQHVY=
X-Received: by 2002:a05:600c:c096:b0:453:2066:4a26 with SMTP id
 5b1f17b1804b1-454dbeedc20mr15666855e9.16.1752130410631; 
 Wed, 09 Jul 2025 23:53:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEhnImP8Q70Q0w1LjnHuDlIsLT0M84Kny6zX4oKMYvef3KtL9KF1P2bBzp8VDrgsaMHxtJn7H7FeZXu1LnCYhs=
X-Received: by 2002:a05:600c:c096:b0:453:2066:4a26 with SMTP id
 5b1f17b1804b1-454dbeedc20mr15666605e9.16.1752130410201; Wed, 09 Jul 2025
 23:53:30 -0700 (PDT)
MIME-Version: 1.0
References: <20250708142437.1344644-1-eric.auger@redhat.com>
 <20250708142437.1344644-30-eric.auger@redhat.com>
In-Reply-To: <20250708142437.1344644-30-eric.auger@redhat.com>
From: Prasad Pandit <ppandit@redhat.com>
Date: Thu, 10 Jul 2025 12:23:13 +0530
X-Gm-Features: Ac12FXzJXisYKS89qRYBBHCXA-7ntE-ZIX2V8SwrtZjuBps4mqRzU4huj4Qd-Ck
Message-ID: <CAE8KmOyDTMQPiRD5HoAqfd8jgRem7PuiWooNvN+9vjFm++W7oA@mail.gmail.com>
Subject: Re: [PATCH v6 29/36] hw/acpi/ged: Support migration of AcpiPciHpState
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 peter.maydell@linaro.org, imammedo@redhat.com, Jonathan.Cameron@huawei.com, 
 gustavo.romero@linaro.org, anisinha@redhat.com, mst@redhat.com, 
 shannon.zhaosl@gmail.com, pbonzini@redhat.com, philmd@linaro.org, 
 alex.bennee@linaro.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: _7dypSWCGJjrAAhsvve4vPoOSg8dP7vp7R4xc7Oor9w_1752130411
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ppandit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Wed, 9 Jul 2025 at 01:30, Eric Auger <eric.auger@redhat.com> wrote:
> Add a subsection to migrate the AcpiPciHpState state.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> ---
>  hw/acpi/generic_event_device.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
> index 7535d07737..95682b79a2 100644
> --- a/hw/acpi/generic_event_device.c
> +++ b/hw/acpi/generic_event_device.c
> @@ -417,6 +417,25 @@ static const VMStateDescription vmstate_ghes_state = {
>      }
>  };
>
> +static bool pcihp_needed(void *opaque)
> +{
> +    AcpiGedState *s = opaque;
> +    return s->pcihp_state.use_acpi_hotplug_bridge;
> +}
> +
> +static const VMStateDescription vmstate_pcihp_state = {
> +    .name = "acpi-ged/pcihp",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = pcihp_needed,
> +    .fields = (const VMStateField[]) {
> +        VMSTATE_PCI_HOTPLUG(pcihp_state,
> +                            AcpiGedState,
> +                            NULL, NULL),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>  static const VMStateDescription vmstate_acpi_ged = {
>      .name = "acpi-ged",
>      .version_id = 1,
> @@ -429,6 +448,7 @@ static const VMStateDescription vmstate_acpi_ged = {
>          &vmstate_memhp_state,
>          &vmstate_cpuhp_state,
>          &vmstate_ghes_state,
> +        &vmstate_pcihp_state,
>          NULL
>      }
>  };
> --

Looks okay.
Reviewed-by: Prasad Pandit <pjp@fedoraproject.org>

Thank you.
---
  - Prasad


