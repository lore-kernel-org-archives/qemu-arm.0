Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp3811396njk;
        Wed, 29 Jan 2025 06:46:34 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCXCAxC/igvvga8uiCuco8wRcjMhu1MGwp2KybsGHei/vyFNCzfiruGg7l3NfLd8PRdntEyrXW9ESxjPdg==@linaro.org
X-Google-Smtp-Source: AGHT+IH5djfTbtHMZGWyIZOzyGNNj4rakWp1LI7TNgDyeqJGIMFhWxKCUILZTgGK8CwAIa5TYpUe
X-Received: by 2002:a05:6402:1e93:b0:5db:f5e9:6745 with SMTP id 4fb4d7f45d1cf-5dc5e6ce200mr3427703a12.0.1738161993808;
        Wed, 29 Jan 2025 06:46:33 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1738161993; cv=pass;
        d=google.com; s=arc-20240605;
        b=RfFvd376+0IGEovMB05ozdW++KwaZtCYcclc8aaxDKMpIYpsb7B5Fg/h4fBCwTLOrK
         KdG4KeuVBAMd1JntJBV+xuf0xkxooP19eh1Qw9HX80i7tjs8DWTxi+k5gGes+gYTgy8z
         9WuQ2boQPD+8Qs1WTzaBQ0Qmuo3Y1lXoGfseGCGxEK5csuMPPiYndaI4wCIWVxdBX7RM
         ffR8D85SVlxAri2MLcOcb0wQtJZo7m+D3E7TJSq/ywdfRqNUIti3aXHsxijXtd2XhriD
         k30UsnZUrda90nhdwnADHkzV05Ls4/jf/KIS49alXjD1rxNMESvlioiEsgHQaQyHDcpK
         qPrg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=zps/3j71AxRB3VSHFiDs10+H/k3K8T/PTeJbzfow478=;
        fh=k/S2YS1QLJT8WPJeT94nJQrytXhnEu6CR3AbsBnV0cE=;
        b=Hl+dW9rHpbn8+m2BR9ZooTGjgv/yFCaJVotYKWbwdXLmDNwfKaAjC0OgssTm0N/7g1
         ZmkMUfARsI4oIKA2Qh1HUBqN1DPLNWo+Y85uXwA294B9q5p4mvQ2H8yyuI3cjIw/EW2g
         RYB1xkyB0ha+WBIjHUeHflYLtVKdhikngKLHLXPZqNhILog5SR4OWOC2Y5oWUv8hY0oc
         FSPyVAUDkL+eZdlim6yw84sT4OZ9vg6NEPwZMABbrTY7vCh1eWfu24/7f8Qw+FB7f4OJ
         6wUZD5+ZPJmPvLsESg/kZleOU+0bAre3aOsRmkvvUHyX6Bzco5VtBendFd4V/3T7Kla3
         6biw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=I0AYQirC;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-492625-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="linux-kernel+bounces-492625-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <linux-kernel+bounces-492625-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [2604:1380:4601:e00::3])
        by mx.google.com with ESMTPS id 4fb4d7f45d1cf-5dc5692e5d1si2388530a12.236.2025.01.29.06.46.33
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 06:46:33 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-492625-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) client-ip=2604:1380:4601:e00::3;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=I0AYQirC;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-492625-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:4601:e00::3 as permitted sender) smtp.mailfrom="linux-kernel+bounces-492625-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F41951884701
	for <alex.bennee@linaro.org>; Wed, 29 Jan 2025 14:46:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54719199B8;
	Wed, 29 Jan 2025 14:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="I0AYQirC"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33EEADDCD
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 14:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738161988; cv=none; b=rrTuNxgwFqJqPz+SoU+DRkZst0mL6g0fyBgXu+JdnjDTq53JdsuyGh/wskbGw0wckDoZ/IZ5uOkwZschfQ9EmxyenVB/QCIKxXxmdoz0JEHRAaRht+tZPmEzIOg4F6fOfCCTAg2eYoLpSOuvjlgj0z7dmoB+KGcoS8dhvIEuupg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738161988; c=relaxed/simple;
	bh=GltMKWMlWcBvuMqrRkYm1w3VoerHE9AJPd5Y387+ERo=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=imWgg3J8TsCfddYfxQ60YClvu5E7uIrCBFNSITY1uoXLhzO03Tx1bF9U4mYgwKo5M1IXtpxaWhu0Wpx/5LjhGdLGtpcD+/tpg+qg4datydXO1xULFMTTyUKp6v3gz5EZVIpxwE+VwfUNzmO7k97KsavdDHCABh3gysZjUetI/1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=I0AYQirC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738161984;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zps/3j71AxRB3VSHFiDs10+H/k3K8T/PTeJbzfow478=;
	b=I0AYQirCbTBEN3iC4C4Zc+Bl8DLYjx/7O9OS1OVgwQn3hAxrxi6Ze7EZCuZ4QRFFCdNKft
	ouFDBmlkWPfVsRa6ChiQg6IwGqmE/dJFYKPIUWt2geTjKhbt/ZkGALzcBusb+IleclsHdQ
	qcjR4GYI4tIkmBGAoQu73cdWSoCyuuA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-8wppynxoMVe61P_lcILCdA-1; Wed, 29 Jan 2025 09:46:23 -0500
X-MC-Unique: 8wppynxoMVe61P_lcILCdA-1
X-Mimecast-MFC-AGG-ID: 8wppynxoMVe61P_lcILCdA
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-385e03f54d0so2796656f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 06:46:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738161982; x=1738766782;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zps/3j71AxRB3VSHFiDs10+H/k3K8T/PTeJbzfow478=;
        b=FXSu1X7/JIeWHkvG6HmbR+0CSwZ0RfoHkKLzrUUFsbbLEcDuf5+8O0GR19T7b4fiwq
         +Ab+iZnlvcNkpAxwmg7rAgJtebuwFjEfiIJ/IHwZSlEcoLj2iO+H5/qzB3Ls0xFFj2//
         rVZTiemwPpGTHskupjF+6brkMakbt1tn3YBnSPKR94yUOa0/X3L7fLGhQAtFbErXwude
         vieTY/EPQQQbHWmBcodGrf5JPoAxCs+jel/5mhh9l8rrZPKWC9JTGhfRKNefAt2v+q42
         KGjzBgEPXKbWbcrZM1T837YrooD5FWMWHO5NzxUhIl0A9L8Xo+KuDRA5Jwtl3r4/BVji
         ziIg==
X-Forwarded-Encrypted: i=1; AJvYcCVgwC+27TmcR8lgA4QVj7Y6kTWSxpec+XWlAy7PYphdh+3YqAE0xvKBPMvAEd6dQx+UKRzEND6m/U67Cos=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTHR4XF3QXFMKkQjdPdiLBt5aIcP+xF0JFnDq43yiajLHexZ71
	6uQiQp+mFts2RZ6S9AuzmGyMB8P8Dv/1sgIQzA71y1nSwuru2lV/qOuphlKVKPlTWopq/92NPXn
	zJhTK6KRYnGIaeN+dPYTlaXysYBYd00qMKu0ouHGzADISywFCd64sZz8/2NB8EA==
X-Gm-Gg: ASbGncs95vcn4PqiZjKw4WzKBVycZ1xrTBiJNadg6Wi5BzYMUoWxpS3kyJBk9LmNN3/
	RuKxQCxmMoIubyndPCVwhfb6DvYxgMSBjvdu03ZkiZ2zuNb3e92kwgpr4oFKbAu+iz03zBEvp01
	hMckJLAGesrxDofAayDf+6FmpekRXFoVOdCDqcnIgSvuMCNddssQDgeUdVAXOEWZxkwG9XlNr1q
	neKUw8R0Xmgh2w7FqZ0Mf5zkM0mvSYDkXkLu1QL0GILQgLVG5PRAxWcqQzxrOI3KfLzWQTKvAtW
	g0lT1xK39bI4eEgiZhW9wKbtMuz2EB5KO5X4UwLI67jSWC5WUTi7
X-Received: by 2002:a5d:4528:0:b0:386:3803:bbd5 with SMTP id ffacd0b85a97d-38c520aef99mr2090040f8f.45.1738161982387;
        Wed, 29 Jan 2025 06:46:22 -0800 (PST)
X-Received: by 2002:a5d:4528:0:b0:386:3803:bbd5 with SMTP id ffacd0b85a97d-38c520aef99mr2090015f8f.45.1738161981922;
        Wed, 29 Jan 2025 06:46:21 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc81a39sm24823285e9.35.2025.01.29.06.46.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 06:46:21 -0800 (PST)
Date: Wed, 29 Jan 2025 15:46:20 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, Shiju Jose <shiju.jose@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Philippe =?UTF-8?B?TWF0aGll?=
 =?UTF-8?B?dS1EYXVkw6k=?= <philmd@linaro.org>, Ani Sinha
 <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>, Eduardo
 Habkost <eduardo@habkost.net>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, Yanan Wang
 <wangyanan55@huawei.com>, Zhao Liu <zhao1.liu@intel.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 06/13] acpi/generic_event_device: add logic to detect
 if HEST addr is available
Message-ID: <20250129154620.4f7ac01c@imammedo.users.ipa.redhat.com>
In-Reply-To: <2c18343e6f8dd84f734329396a789a3a314519ff.1738137123.git.mchehab+huawei@kernel.org>
References: <cover.1738137123.git.mchehab+huawei@kernel.org>
	<2c18343e6f8dd84f734329396a789a3a314519ff.1738137123.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: ONSQBe2cPfSe

On Wed, 29 Jan 2025 09:04:12 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Create a new property (x-has-hest-addr) and use it to detect if
> the GHES table offsets can be calculated from the HEST address
> (qemu 10.0 and upper) or via the legacy way via an offset obtained
                                              ^^^
s/via/where/

> from the hardware_errors firmware file.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
>  hw/acpi/generic_event_device.c |  1 +
>  hw/acpi/ghes.c                 | 20 +++++++++++++-------
>  hw/arm/virt-acpi-build.c       | 30 ++++++++++++++++++++++++++----
>  hw/core/machine.c              |  2 ++
>  include/hw/acpi/ghes.h         |  4 +++-
>  5 files changed, 45 insertions(+), 12 deletions(-)
> 
> diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
> index 5346cae573b7..70729b6238a5 100644
> --- a/hw/acpi/generic_event_device.c
> +++ b/hw/acpi/generic_event_device.c
> @@ -318,6 +318,7 @@ static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
>  
>  static const Property acpi_ged_properties[] = {
>      DEFINE_PROP_UINT32("ged-event", AcpiGedState, ged_event_bitmap, 0),
> +    DEFINE_PROP_BOOL("x-has-hest-addr", AcpiGedState, ghes_state.use_hest_addr, true),
>  };
>  
>  static const VMStateDescription vmstate_memhp_state = {
> diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> index adf80945c6db..736287766989 100644
> --- a/hw/acpi/ghes.c
> +++ b/hw/acpi/ghes.c
> @@ -353,7 +353,8 @@ static void build_ghes_v2_entry(GArray *table_data,
>  }
>  
>  /* Build Hardware Error Source Table */
> -void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
> +void acpi_build_hest(AcpiGhesState *ags, GArray *table_data,
> +                     GArray *hardware_errors,
>                       BIOSLinker *linker,
>                       const AcpiNotificationSourceId *notif_source,
>                       int num_sources,
> @@ -382,10 +383,13 @@ void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
>       * Tell firmware to write into GPA the address of HEST via fw_cfg,
>       * once initialized.
>       */
> -    bios_linker_loader_write_pointer(linker,
> -                                     ACPI_HEST_ADDR_FW_CFG_FILE, 0,
> -                                     sizeof(uint64_t),
> -                                     ACPI_BUILD_TABLE_FILE, hest_offset);
> +
> +    if (ags->use_hest_addr) {
> +        bios_linker_loader_write_pointer(linker,
> +                                         ACPI_HEST_ADDR_FW_CFG_FILE, 0,
> +                                         sizeof(uint64_t),
> +                                         ACPI_BUILD_TABLE_FILE, hest_offset);
> +    }

if ags->use_hest_addr is true, then we can safely exclude
 hardware_errors_addr fw_cfg
it shouldn't be used when use_hest_addr == true,
something along lines:

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index 7362877669..a30f65f9f5 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -272,6 +272,7 @@ static void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker,
                                        i * ACPI_GHES_MAX_RAW_DATA_LENGTH);
     }
 
+if (!ags->use_hest_addr) {
     /*
      * Tell firmware to write hardware_errors GPA into
      * hardware_errors_addr fw_cfg, once the former has been initialized.
@@ -280,6 +281,7 @@ static void build_ghes_error_table(GArray *hardware_errors, BIOSLinker *linker,
                                      sizeof(uint64_t),
                                      ACPI_HW_ERROR_FW_CFG_FILE, 0);
 }
+}
 
 /* Build Generic Hardware Error Source version 2 (GHESv2) */
 static void build_ghes_v2_entry(GArray *table_data,
@@ -399,13 +401,13 @@ void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
     fw_cfg_add_file(s, ACPI_HW_ERROR_FW_CFG_FILE, hardware_error->data,
                     hardware_error->len);
 
-    /* Create a read-write fw_cfg file for Address */
-    fw_cfg_add_file_callback(s, ACPI_HW_ERROR_ADDR_FW_CFG_FILE, NULL, NULL,
-        NULL, &(ags->hw_error_le), sizeof(ags->hw_error_le), false);
-
     if (ags->use_hest_addr) {
         fw_cfg_add_file_callback(s, ACPI_HEST_ADDR_FW_CFG_FILE, NULL, NULL,
             NULL, &(ags->hest_addr_le), sizeof(ags->hest_addr_le), false);
+    } else {
+        /* Create a read-write fw_cfg file for Address */
+        fw_cfg_add_file_callback(s, ACPI_HW_ERROR_ADDR_FW_CFG_FILE, NULL, NULL,
+           NULL, &(ags->hw_error_le), sizeof(ags->hw_error_le), false);
     }
 
     ags->present = true;


>  }
>  
>  void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
> @@ -399,8 +403,10 @@ void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
>      fw_cfg_add_file_callback(s, ACPI_HW_ERROR_ADDR_FW_CFG_FILE, NULL, NULL,
>          NULL, &(ags->hw_error_le), sizeof(ags->hw_error_le), false);
>  
> -    fw_cfg_add_file_callback(s, ACPI_HEST_ADDR_FW_CFG_FILE, NULL, NULL,
> -        NULL, &(ags->hest_addr_le), sizeof(ags->hest_addr_le), false);
> +    if (ags->use_hest_addr) {
> +        fw_cfg_add_file_callback(s, ACPI_HEST_ADDR_FW_CFG_FILE, NULL, NULL,
> +            NULL, &(ags->hest_addr_le), sizeof(ags->hest_addr_le), false);
> +    }
>  
>      ags->present = true;
>  }
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 3d411787fc37..be1e51e0bb29 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -897,6 +897,10 @@ static const AcpiNotificationSourceId hest_ghes_notify[] = {
>      { ACPI_HEST_SRC_ID_SYNC, ACPI_GHES_NOTIFY_SEA },
>  };
>  
> +static const AcpiNotificationSourceId hest_ghes_notify_9_2[] = {
> +    { ACPI_HEST_SRC_ID_SYNC, ACPI_GHES_NOTIFY_SEA },
> +};
> +
>  static
>  void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>  {
> @@ -950,10 +954,28 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>      build_dbg2(tables_blob, tables->linker, vms);
>  
>      if (vms->ras) {
> -        acpi_add_table(table_offsets, tables_blob);
> -        acpi_build_hest(tables_blob, tables->hardware_errors, tables->linker,
> -                        hest_ghes_notify, ARRAY_SIZE(hest_ghes_notify),
> -                        vms->oem_id, vms->oem_table_id);
> +        AcpiGhesState *ags;
> +        AcpiGedState *acpi_ged_state;

I'd do something like this, instead of calling acpi_build_hest() twice

           notify = hest_ghes_notify_9_2
           notify_sz = ...

> +
> +        acpi_ged_state = ACPI_GED(object_resolve_path_type("", TYPE_ACPI_GED,
> +                                                       NULL));
> +        if (acpi_ged_state) {
> +            ags = &acpi_ged_state->ghes_state;
> +
> +            acpi_add_table(table_offsets, tables_blob);
> +
> +            if (!ags->use_hest_addr) {

                   notify = hest_ghes_notify
                   notify_sz = 

> +            }
               acpi_build_hest(ags, tables_blob, tables->hardware_errors,
                               tables->linker, notify,
                               notify_sz,
                               vms->oem_id, vms->oem_table_id);
> +        }
>      }
>  
>      if (ms->numa_state->num_nodes > 0) {
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index c23b39949649..0d0cde481954 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -34,10 +34,12 @@
>  #include "hw/virtio/virtio-pci.h"
>  #include "hw/virtio/virtio-net.h"
>  #include "hw/virtio/virtio-iommu.h"
> +#include "hw/acpi/generic_event_device.h"
>  #include "audio/audio.h"
>  
>  GlobalProperty hw_compat_9_2[] = {
>      {"arm-cpu", "backcompat-pauth-default-use-qarma5", "true"},
> +    { TYPE_ACPI_GED, "x-has-hest-addr", "false" },
>  };
>  const size_t hw_compat_9_2_len = G_N_ELEMENTS(hw_compat_9_2);
>  
> diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
> index 237721fec0a2..bfc8fd851648 100644
> --- a/include/hw/acpi/ghes.h
> +++ b/include/hw/acpi/ghes.h
> @@ -61,6 +61,7 @@ typedef struct AcpiGhesState {
>      uint64_t hest_addr_le;
>      uint64_t hw_error_le;
>      bool present; /* True if GHES is present at all on this board */
> +    bool use_hest_addr; /* True if HEST address is present */
>  } AcpiGhesState;
>  
>  /*
> @@ -75,7 +76,8 @@ typedef struct AcpiNotificationSourceId {
>      enum AcpiGhesNotifyType notify;
>  } AcpiNotificationSourceId;
>  
> -void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
> +void acpi_build_hest(AcpiGhesState *ags, GArray *table_data,
> +                     GArray *hardware_errors,
>                       BIOSLinker *linker,
>                       const AcpiNotificationSourceId * const notif_source,
>                       int num_sources,

