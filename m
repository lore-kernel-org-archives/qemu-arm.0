Received: by 2002:a17:504:4644:b0:1be9:327d:8ee3 with SMTP id d4csp998737njg;
        Wed, 26 Feb 2025 07:59:05 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXCHhkaL7hfkRgcBldLU9+3zflXEM404TveN5GnHESd+bxNZV2k8WAd8LmUt2Q/tdFIQUYpFq+xh0VIdA==@linaro.org
X-Google-Smtp-Source: AGHT+IGw6rMcqxDK8B+2sVBzoWv5H9EhXhP7sNOf/+NcZsEkmV3EGQyMfbM1nNcV/ymMrv7R1RFa
X-Received: by 2002:a05:6214:301b:b0:6e6:5bb2:c1a8 with SMTP id 6a1803df08f44-6e8868fad38mr61380616d6.34.1740585544952;
        Wed, 26 Feb 2025 07:59:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740585544; cv=none;
        d=google.com; s=arc-20240605;
        b=jCWBZJfC5kxbPE0yL9Vk1RrRVe0Q/Ru3Q1MMVLv+3H99laQxE5hi4iZP6nFtpxoTeJ
         mkIOnmLwLsTiLYTa09d9fRz/wiFyWxo2uEQT4aJaMenAx1BbsKpz2zDzNgPyiZl4gMvU
         Lgwpfn9n1H6inLR4gBoe/0e0auUcwwhHh9pcTuJRkcek+9vRwQTfXqbhQJSZAy3q6gkR
         vKqvTwZOXFH1KsgD7uMBJ/LG+frMNKtSnjYGYEQJ9xmVXmoDdxMyk+cZ+87oG1VWq/wE
         KkPn/0a6zDj6BZ5GbnucdO6q2AVC5W/5I9B6yOBWyrnLkDynqV8F03a8ZFJoNNmVurHZ
         0Xjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=6q+MfJiIaN0i87TpsuTV4ud4MXgYfN/GlXWJvHggK/I=;
        fh=B9+CWBiWqDI/h2ooaHDPnJY/BCqRtVf/f0qA33SH17I=;
        b=GAFo/UH0u7wvNfTqscmXOKzwK7O3FJoh4FEEMSvNwvwg9ZbZ35JpBemQKcXKMouvDk
         qWcEk8IbPT1DfXMWOoTBVc0fVby/w6NjD8L4dwYTF7guoG1Y9vBhGS9BQhPUgsx43+n3
         NpT9v3S2lxGcOZDK7Aus1BOVuNJSNvPrNjdhpDDnZa3aBDjI8sNltgOYwrfz5wI/jpiq
         ozBlWXuBKie/C703CMeDd60bj5X722TvMMQXYZ92yG5XyHReSLTEGoVOXP6BMmFQWhSa
         MlhUQo4ieil6+qNYrBhQ/pt8K6CqLFAOs+RHXJ1CoxF3ihbtW90GoqHa+6LeU3oOYwjf
         gd1w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=id88J2lj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e87b0c4fbbsi37453186d6.225.2025.02.26.07.59.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 26 Feb 2025 07:59:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=id88J2lj;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tnJnt-0005DY-Kl; Wed, 26 Feb 2025 10:58:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1tnJns-0005D9-Fz
 for qemu-arm@nongnu.org; Wed, 26 Feb 2025 10:58:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1tnJnp-0004uy-M8
 for qemu-arm@nongnu.org; Wed, 26 Feb 2025 10:58:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1740585509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6q+MfJiIaN0i87TpsuTV4ud4MXgYfN/GlXWJvHggK/I=;
 b=id88J2ljcAb9y4m2NBN9jw2NBwXu2Pn9yoB4sgN4bUREBQzqILCw4Ik6pJqtJHK/s7Akie
 LBVNlZ8TQe4/aTNmAmfuof3IS7bi+IBgf4uqIo6ITOfhibEgpYkjW2BBMo2Qu+hr4RddQL
 LA7lnTbIL9EpcVMkw42viiZirHDfKI0=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-322-y3DugEIFObudWT9djgdwvA-1; Wed, 26 Feb 2025 10:58:26 -0500
X-MC-Unique: y3DugEIFObudWT9djgdwvA-1
X-Mimecast-MFC-AGG-ID: y3DugEIFObudWT9djgdwvA_1740585505
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-38f338525e1so2886393f8f.3
 for <qemu-arm@nongnu.org>; Wed, 26 Feb 2025 07:58:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740585505; x=1741190305;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6q+MfJiIaN0i87TpsuTV4ud4MXgYfN/GlXWJvHggK/I=;
 b=DdydbnkiApB/Ui8MpcMnnUd8d2y4TZ+6HaOGsRo+HscdciP4EHFZsQfeQiiwwrTNep
 iZuK4DbmvJ6XYDdGXQYf+WjJvTgmW7QIug8p5NvPVxXLYnlNxGllycxNT/A05lK5T2sR
 3WHM0X7fcb8H1kPRH3csiFl5V1QQMOsje415h8TYnUcwc0ZM3LkicAcWYaLZdSopFV6i
 IsHhaLBEydqt4V72fQJZ6FcCJT1Mhwfv+OCUBfFbQWgx0StE7r9rLHk868JYST6p6XAE
 /Mr7VIJDuMxJn4EHjfi/bZVMhEFf+Lx0RDEUretQZBCviT8IG7Txc/cf2tEnGMymBFse
 mFpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcEmnBimB9uGVh0oqWwSltyZM2jH5Z9y4FdN26+GPB1HE95zhQ8y+uUhOM/Btau9wK4FX80j/OKg==@nongnu.org
X-Gm-Message-State: AOJu0YwHqAJPmp2GCRY3Cf1vY5J2ApB9V1iZNehz0ogUcK4Vu0E3c2ZC
 bEwvXf9RPvPD5FQJej994AwEOZoApr/QQFSSpP8EtW/3SZUD3YsdGjoEgwNm+hwBre0evOdOZJl
 OkFTZplMIQtQJfsQM7/E2qU9PWrpAq/bwSv9xpGdjEcGCJeCpBg==
X-Gm-Gg: ASbGncs28kkXSKwq9nkjf8Fzv1nPcRYyNKs25pt8OMlkdi1zPjcS/S8yHOjpXsvcBai
 GoU8MUhqEgL5LsCu166cZc0zD19x+TkCya3qGHlJXgr9YUqNTRtZRxNlHXZOZbcQMJivFRay0Zx
 2TkycfqDIwuc36U11Y7bj9TCNklRtPIPaenah6QXanAu01wSwL93Hf6BUtaaTtPDpGdN6eo0aew
 HSVBntDBEk/OD+ZkYBHCp0YQyrtYu5VOdVgTlYA8j996QLbGeJcxltKnPEjYeUsoEFDfSSrzdCd
 /d3478zVugpztMdbVZwqp+12WdkEPitlVyMICKA/7yfQ8UcJ3xnyfHj48Vcl5B0=
X-Received: by 2002:a05:6000:18a9:b0:38f:28a1:503f with SMTP id
 ffacd0b85a97d-38f707728e5mr18043413f8f.11.1740585504678; 
 Wed, 26 Feb 2025 07:58:24 -0800 (PST)
X-Received: by 2002:a05:6000:18a9:b0:38f:28a1:503f with SMTP id
 ffacd0b85a97d-38f707728e5mr18043389f8f.11.1740585504271; 
 Wed, 26 Feb 2025 07:58:24 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390cd86ca9csm6036028f8f.22.2025.02.26.07.58.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Feb 2025 07:58:23 -0800 (PST)
Date: Wed, 26 Feb 2025 16:58:23 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, Shiju Jose <shiju.jose@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Ani Sinha
 <anisinha@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, Shannon
 Zhao <shannon.zhaosl@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 11/14] arm/virt: Wire up a GED error device for ACPI
 / GHES
Message-ID: <20250226165823.14f08232@imammedo.users.ipa.redhat.com>
In-Reply-To: <87cb9cc850fb728f11d88a83c05b288baca556df.1740148260.git.mchehab+huawei@kernel.org>
References: <cover.1740148260.git.mchehab+huawei@kernel.org>
 <87cb9cc850fb728f11d88a83c05b288baca556df.1740148260.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qT2_ZUlJL4IoTMAwyyflq41gOit87dr9GOsHeTAos2A_1740585505
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.44,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: R628MIiRivyp

On Fri, 21 Feb 2025 15:35:20 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Adds support to ARM virtualization to allow handling
> generic error ACPI Event via GED & error source device.
> 
> It is aligned with Linux Kernel patch:
> https://lore.kernel.org/lkml/1272350481-27951-8-git-send-email-ying.huang@intel.com/
> 
> Co-authored-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Co-authored-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Acked-by: Igor Mammedov <imammedo@redhat.com>
> 
> ---
> 
> Changes from v8:
> 
> - Added a call to the function that produces GHES generic
>   records, as this is now added earlier in this series.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  hw/acpi/generic_event_device.c |  2 +-
>  hw/arm/virt-acpi-build.c       |  1 +
>  hw/arm/virt.c                  | 12 +++++++++++-
>  include/hw/arm/virt.h          |  1 +
>  4 files changed, 14 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
> index 180eebbce1cd..f5e899155d34 100644
> --- a/hw/acpi/generic_event_device.c
> +++ b/hw/acpi/generic_event_device.c
> @@ -331,7 +331,7 @@ static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
>  
>  static const Property acpi_ged_properties[] = {
>      DEFINE_PROP_UINT32("ged-event", AcpiGedState, ged_event_bitmap, 0),
> -    DEFINE_PROP_BOOL("x-has-hest-addr", AcpiGedState, ghes_state.use_hest_addr, false),
> +    DEFINE_PROP_BOOL("x-has-hest-addr", AcpiGedState, ghes_state.use_hest_addr, true),
irrelevant to this patch, see comment in 8/14

>  };
>  
>  static const VMStateDescription vmstate_memhp_state = {
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 9de51105a513..4f174795ed60 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -861,6 +861,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      }
>  
>      acpi_dsdt_add_power_button(scope);
> +    aml_append(scope, aml_error_device());
>  #ifdef CONFIG_TPM
>      acpi_dsdt_add_tpm(scope, vms);
>  #endif
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 4a5a9666e916..3faf32f900b5 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -678,7 +678,7 @@ static inline DeviceState *create_acpi_ged(VirtMachineState *vms)
>      DeviceState *dev;
>      MachineState *ms = MACHINE(vms);
>      int irq = vms->irqmap[VIRT_ACPI_GED];
> -    uint32_t event = ACPI_GED_PWR_DOWN_EVT;
> +    uint32_t event = ACPI_GED_PWR_DOWN_EVT | ACPI_GED_ERROR_EVT;
>  
>      if (ms->ram_slots) {
>          event |= ACPI_GED_MEM_HOTPLUG_EVT;
> @@ -1010,6 +1010,13 @@ static void virt_powerdown_req(Notifier *n, void *opaque)
>      }
>  }
>  
> +static void virt_generic_error_req(Notifier *n, void *opaque)
> +{
> +    VirtMachineState *s = container_of(n, VirtMachineState, generic_error_notifier);
> +
> +    acpi_send_event(s->acpi_dev, ACPI_GENERIC_ERROR);
> +}
> +
>  static void create_gpio_keys(char *fdt, DeviceState *pl061_dev,
>                               uint32_t phandle)
>  {
> @@ -2404,6 +2411,9 @@ static void machvirt_init(MachineState *machine)
>  
>      if (has_ged && aarch64 && firmware_loaded && virt_is_acpi_enabled(vms)) {
>          vms->acpi_dev = create_acpi_ged(vms);
> +        vms->generic_error_notifier.notify = virt_generic_error_req;
> +        notifier_list_add(&acpi_generic_error_notifiers,
> +                          &vms->generic_error_notifier);
>      } else {
>          create_gpio_devices(vms, VIRT_GPIO, sysmem);
>      }
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index c8e94e6aedc9..f3cf28436770 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -176,6 +176,7 @@ struct VirtMachineState {
>      DeviceState *gic;
>      DeviceState *acpi_dev;
>      Notifier powerdown_notifier;
> +    Notifier generic_error_notifier;
>      PCIBus *bus;
>      char *oem_id;
>      char *oem_table_id;

