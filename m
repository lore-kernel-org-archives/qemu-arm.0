Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp709054njk;
        Fri, 24 Jan 2025 02:23:58 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCXNfYsw4oHNzupPuNUAuhxTvq0ceiDc5GTF6XE1tmjopa1Rr9cR7g05NUdAr/UWYPntzqMEWEOpyfdh8g==@linaro.org
X-Google-Smtp-Source: AGHT+IFfUuPBFxt1FziABJZ3Yiw5EDaYDVDkAedcwq0YJAYB2XvidedSDaSF0hUk51tMot84mxR5
X-Received: by 2002:a05:6a00:181f:b0:727:3cd0:1167 with SMTP id d2e1a72fcca58-72dafba0247mr44099478b3a.21.1737714238449;
        Fri, 24 Jan 2025 02:23:58 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1737714238; cv=pass;
        d=google.com; s=arc-20240605;
        b=hWqa/95RP1kf6Kt1kA0GOwcyi7Ova22OWeD1Rsdggm9kG2TpaEb25hM4cZuFm8H16t
         9g3+yugvqjkX3isi5ft3R2+Pblxtu7sHuqECSICF9/ppdEUhTbiMidtPjGYvA5026lJE
         hjW6W3fvCJ6nfTnyn6Wt2o6p9aHgH9IQ+6fngN3Hgdtft6Z5VSkFHdnKV5rjYf06kouw
         I3ayNXsE78NGJPITWeC7v/Zn2p7rSwKcCFgchB0KEpoLnbX4otIuOEoTArNPqM8TpNGV
         VWXuLDRJ6Hnnsvk9BSS33IeuCRDOFL4cRhf6zTGHrccjcZRQEtsxZ30PCLLAYICXimA3
         Q4OA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=yogd2baK2JpydtbwIC4SeYAk7cUX5QbpD8U1/0bM2LY=;
        fh=WdpGF36OaqK70Svi/ebXSF5RYa49qpQzHbAJJ7HrOS8=;
        b=c6zTBGAYVTjBaMCuts00YNJrey017GiZ3cV6ASa2v10EOtRK33HQX+nrypVcY8zKC+
         s4QNJal6hP0N4uHTKCE8oe3F8GuOAyZ3dpDEZwjZF1QV+Wo79dotXz7I+PtaQMrV/vi4
         0aliPKfVCCRDfbYgFp0zdRf/SYL+p+zcEP7djE2vf3Vmyv9tmwbDNeXTkMvb14+TeiKN
         cwGZ/OZN4Ac38b6dY6KfBWbyUnqXIHI6dCnlAewD+/cMXRv6Q0itxk6eA5MHrEm4qhZL
         6GgEX+S8vtlOW4q2JcInXY6ngivnpcMVSrNOHukPG22EQASG9k9PAo/o9R5GSttAkLPA
         tJ4Q==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ijMoVBqw;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-487795-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-487795-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <linux-kernel+bounces-487795-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id d2e1a72fcca58-72f8a75a2d3si2345787b3a.181.2025.01.24.02.23.58
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 02:23:58 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-487795-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ijMoVBqw;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-487795-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-487795-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D95FA3AB81F
	for <alex.bennee@linaro.org>; Fri, 24 Jan 2025 10:23:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1F721DB138;
	Fri, 24 Jan 2025 10:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ijMoVBqw"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9BB13D520
	for <linux-kernel@vger.kernel.org>; Fri, 24 Jan 2025 10:23:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737714234; cv=none; b=NwL5rstzQXGhNzH+sRlqzrwtnhKby443zBRR5HQm8kd8y8yU+YBHWdyo18Msr+7hRCqCVax3UI4UjLqRycX2SC6p0Ui8vvDgIMVt9altMAii15Viyq64bbMWwT+7TVfqHVhooHS5LwAjuyZVWofFtVsjDBLd7F6oHyvFsgscsss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737714234; c=relaxed/simple;
	bh=7C81FvMepQGkaadzWj+5a624VqS3KqQMLsYaCYNJDuc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SjOmY9aueRzha/gBe0k96kSt5wqeo3Mv8OuQKQVDClCrpbijerZuYAGk2EjRVVYUEcZFNFimYyZSVgyOYqAQjLAXyFRvY3qYmMTecy2pjbptfU2fchefOWcu8A0PtKnC9ROdd7yX+F8cLLhJTxglaloEVNmGxXJGZgdZAM2RG0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ijMoVBqw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737714231;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yogd2baK2JpydtbwIC4SeYAk7cUX5QbpD8U1/0bM2LY=;
	b=ijMoVBqwIZWw9rDVvMZWP93CDyl+pCfYUwfp6J/FakOWozm6kf55O270Lk0hL2oKCeFjQ6
	xl4dfe0PLXUs4yX9G6fwJTRewtC9RM7xOoAvkj5zfFdPzuLY62J4pEp52Kq/92wDMQ5vM2
	fV1QKHU49a9HLdkw9iTApCOFk4mCQCI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-295-FTfx8t41N5SloBba1K7IDA-1; Fri, 24 Jan 2025 05:23:49 -0500
X-MC-Unique: FTfx8t41N5SloBba1K7IDA-1
X-Mimecast-MFC-AGG-ID: FTfx8t41N5SloBba1K7IDA
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-38a684a096eso907313f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 24 Jan 2025 02:23:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737714228; x=1738319028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yogd2baK2JpydtbwIC4SeYAk7cUX5QbpD8U1/0bM2LY=;
        b=kkGyB02kUlqvFrZuek7/G3SVpUVVuPj+WFaJyjAaFcanFGU86b+VnhCBSEOg1h+1gF
         d0+VNVsVkzx83bmwzC1jlQJxTn0W5+xh9KHrzFGGG11qwUflf4FaQuiZoJm9m3DllNKC
         1YhRrBT9Dw/IEuRr6Ysn3GsvkHhRfM7Fao37lGw1RwXcLfzaP+oHvQb5Yf6Pmq0+9mqo
         B//TDraowc5q5vfRFJ6Qr56DConwtb4OwOP38VXIRRuViz3bhItUcIUaTzK6kk3K2yq+
         j9IRPsJSUrybs9gSlIgqiHpSpC7FCdoZw+n+ng139szhA7yXYGGgnwsLSCZYKcml+TG0
         H3Nw==
X-Forwarded-Encrypted: i=1; AJvYcCX/gOjs1uISBcEFKLgqSJgceXblJmMXB3hRzcVnFk0M4/jmIvZumX/kZPAmBSD/fIs9mCJbYGkgjeRb8+4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPUeP1c9h7yV52yNv7ygICxHCgP21cz6gVQH1EeePMmXa0U30U
	xvENDRaOhPtzqhOqL24TWET6iI96FT9vagGKCzZabpabwsJWXC/ZS+EByoZWVqvP9lDIiwpQjeO
	i6cJmrAj3Xv0LLQhJDs1xQiSZqTKW7RFgdYoHcLSLiwFpGmPJfeOrSFPxAkDjog==
X-Gm-Gg: ASbGnctEBzzVZG7ifzXc5AURkR4rBNe6j4wsmm+zABO8UU4TObzQGHWCR5X7WfwT263
	yfGduSzEIje6gSESqAzRDVecwJBMN2KQnN6AY0dvZNX7N4gyQ+UqDjycBrlUJrDzSwnoA0pJmXB
	sU4UeHRWWqbOET9z7tNoKxhxcISAuj00u9E8FMWaSltY4G/E4rjBHlwmqrgi3hqSGiS+FSAyAxe
	rwfMflJ0Ktfx6Z+j7ZBd+qsj/iFnyUFk/XAoefy86DxRciKwDGFit2pmTkl96npnYcRqozKBYOC
	ozbTvXKXKEGvnqrT/uN6i+b7RdCCztWjpWeJe1wo4w==
X-Received: by 2002:a05:6000:4025:b0:38a:36a5:ff81 with SMTP id ffacd0b85a97d-38bf59e254bmr27981092f8f.40.1737714228326;
        Fri, 24 Jan 2025 02:23:48 -0800 (PST)
X-Received: by 2002:a05:6000:4025:b0:38a:36a5:ff81 with SMTP id ffacd0b85a97d-38bf59e254bmr27981045f8f.40.1737714227874;
        Fri, 24 Jan 2025 02:23:47 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1c4006sm2268914f8f.94.2025.01.24.02.23.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 02:23:47 -0800 (PST)
Date: Fri, 24 Jan 2025 11:23:46 +0100
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
Subject: Re: [PATCH 05/11] acpi/generic_event_device: add logic to detect if
 HEST addr is available
Message-ID: <20250124112346.4751ccf2@imammedo.users.ipa.redhat.com>
In-Reply-To: <556c19c1f3fa907c6cc13b62e060f6baa6faf2cf.1737560101.git.mchehab+huawei@kernel.org>
References: <cover.1737560101.git.mchehab+huawei@kernel.org>
	<556c19c1f3fa907c6cc13b62e060f6baa6faf2cf.1737560101.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: ZE0VdqQCprL9

On Wed, 22 Jan 2025 16:46:22 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Create a new property (x-has-hest-addr) and use it to detect if
> the GHES table offsets can be calculated from the HEST address
> (qemu 9.2 and upper) or via the legacy way via an offset obtained

10.0 by now

> from the hardware_errors firmware file.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  hw/acpi/generic_event_device.c |  1 +
>  hw/acpi/ghes.c                 | 28 +++++++++++++++++++++-------
>  hw/arm/virt-acpi-build.c       | 30 ++++++++++++++++++++++++++----
>  hw/core/machine.c              |  2 ++
>  include/hw/acpi/ghes.h         |  1 +
>  5 files changed, 51 insertions(+), 11 deletions(-)
> 
> diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
> index 5346cae573b7..fe537ed05c66 100644
> --- a/hw/acpi/generic_event_device.c
> +++ b/hw/acpi/generic_event_device.c
> @@ -318,6 +318,7 @@ static void acpi_ged_send_event(AcpiDeviceIf *adev, AcpiEventStatusBits ev)
>  
>  static const Property acpi_ged_properties[] = {
>      DEFINE_PROP_UINT32("ged-event", AcpiGedState, ged_event_bitmap, 0),
> +    DEFINE_PROP_BOOL("x-has-hest-addr", AcpiGedState, ghes_state.hest_lookup, true),

s/hest_lookup/use_hest_addr/

>  };
>  
>  static const VMStateDescription vmstate_memhp_state = {
> diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> index b46b563bcaf8..86c97f60d6a0 100644
> --- a/hw/acpi/ghes.c
> +++ b/hw/acpi/ghes.c
> @@ -359,6 +359,8 @@ void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
>  {
>      AcpiTable table = { .sig = "HEST", .rev = 1,
>                          .oem_id = oem_id, .oem_table_id = oem_table_id };
> +    AcpiGedState *acpi_ged_state;
> +    AcpiGhesState *ags = NULL;
>      int i;
>  
>      build_ghes_error_table(hardware_errors, linker, num_sources);
> @@ -379,10 +381,20 @@ void acpi_build_hest(GArray *table_data, GArray *hardware_errors,
>       * tell firmware to write into GPA the address of HEST via fw_cfg,
>       * once initialized.
>       */
> -    bios_linker_loader_write_pointer(linker,
> -                                     ACPI_HEST_ADDR_FW_CFG_FILE, 0,
> -                                     sizeof(uint64_t),
> -                                     ACPI_BUILD_TABLE_FILE, hest_offset);
> +
> +    acpi_ged_state = ACPI_GED(object_resolve_path_type("", TYPE_ACPI_GED,
> +                                                       NULL));

the caller, already did lookup,
just pass hest_lookup as an argument and use it here

> +    if (!acpi_ged_state) {
> +        return;
> +    }
> +
> +    ags = &acpi_ged_state->ghes_state;
> +    if (ags->hest_lookup) {
> +        bios_linker_loader_write_pointer(linker,
> +                                         ACPI_HEST_ADDR_FW_CFG_FILE, 0,
> +                                         sizeof(uint64_t),
> +                                         ACPI_BUILD_TABLE_FILE, hest_offset);
> +    }
>  }
>  
>  void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
> @@ -396,8 +408,10 @@ void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
>      fw_cfg_add_file_callback(s, ACPI_HW_ERROR_ADDR_FW_CFG_FILE, NULL, NULL,
>          NULL, &(ags->hw_error_le), sizeof(ags->hw_error_le), false);

btw shouldn't we disable hw_error_le if hest_lookup is active?
>  
> -    fw_cfg_add_file_callback(s, ACPI_HEST_ADDR_FW_CFG_FILE, NULL, NULL,
> -        NULL, &(ags->hest_addr_le), sizeof(ags->hest_addr_le), false);
> +    if (ags && ags->hest_lookup) {

why bother with 'ags &&' if we don't do it hw_error_le?


> +        fw_cfg_add_file_callback(s, ACPI_HEST_ADDR_FW_CFG_FILE, NULL, NULL,
> +            NULL, &(ags->hest_addr_le), sizeof(ags->hest_addr_le), false);
> +    }
>  
>      ags->present = true;
>  }
> @@ -512,7 +526,7 @@ void ghes_record_cper_errors(const void *cper, size_t len,
>      }
>      ags = &acpi_ged_state->ghes_state;
>  
> -    if (!ags->hest_addr_le) {
> +    if (!ags->hest_lookup) {
why? !ags->hest_addr_le is sufficient

>          get_hw_error_offsets(le64_to_cpu(ags->hw_error_le),
>                               &cper_addr, &read_ack_register_addr);
>      } else {
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 3d411787fc37..ada5d08cfbe7 100644
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
> +
> +        acpi_ged_state = ACPI_GED(object_resolve_path_type("", TYPE_ACPI_GED,
> +                                                       NULL));
> +        if (acpi_ged_state) {
> +            ags = &acpi_ged_state->ghes_state;
> +
> +            acpi_add_table(table_offsets, tables_blob);
> +
> +            if (!ags->hest_lookup) {
> +                acpi_build_hest(tables_blob, tables->hardware_errors,
> +                                tables->linker, hest_ghes_notify_9_2,
> +                                ARRAY_SIZE(hest_ghes_notify_9_2),
> +                                vms->oem_id, vms->oem_table_id);
> +            } else {
> +                acpi_build_hest(tables_blob, tables->hardware_errors,
> +                                tables->linker, hest_ghes_notify,
> +                                ARRAY_SIZE(hest_ghes_notify),
> +                                vms->oem_id, vms->oem_table_id);
> +            }
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
> index 237721fec0a2..164ed8b0f9a3 100644
> --- a/include/hw/acpi/ghes.h
> +++ b/include/hw/acpi/ghes.h
> @@ -61,6 +61,7 @@ typedef struct AcpiGhesState {
>      uint64_t hest_addr_le;
>      uint64_t hw_error_le;
>      bool present; /* True if GHES is present at all on this board */
                        and perhaps reformulate this as well

> +    bool hest_lookup; /* True if HEST address is present */
                                 if device should use HEST addr for error source lookup 

>  } AcpiGhesState;
>  
>  /*

