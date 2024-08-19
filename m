Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp2057059njf;
        Mon, 19 Aug 2024 05:51:57 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCW7K6kdO2zJawxqTO9lWCo0O0fzZlY3Q+6s/liZKTttd3uomlW3/K+ur5pSPE4E3D5DTFVRNFvCzNgPRkgKT5bui11LVYzo
X-Google-Smtp-Source: AGHT+IEJ6wE4cic1WYiMIr9wbEgbPMvZ1zgR7ukk+8ZfAFtOGCRC0i1U/3lUm4iRqyerd+o4Uc/+
X-Received: by 2002:a05:622a:259b:b0:453:7706:75a8 with SMTP id d75a77b69052e-453770689edmr140314671cf.13.1724071917126;
        Mon, 19 Aug 2024 05:51:57 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1724071917; cv=pass;
        d=google.com; s=arc-20160816;
        b=Ua/HEyUBKQvK7uiDCGZg82XfTv+v9RufaW1busO5ZWHCDQiCeA2K9i6SNTqVk+n/+n
         4gnTaRqshLxe5Ywl8Mi4ILd+CM7npKubZb6DFkEHFpaj9RzxB1orJAYKP7uu5x134q1s
         Pchfw1QEsrgU9CAWkwrPzZE6+z4kV5xuZqCTW2OhavBuvKXXNo2gRC3KDPGkIH3Se22x
         LESsHj9SUtQyo8/TQVZYWfiE31tjR8nUV2JUtw+bRehpnJ3aky9gC62tAFAi4ztXR8yT
         dVFlrzg82awsitOxFUrcdE7miv2bcuBS0JA1NsHE2bPyA248uDGdk4M5SVqif/UZeW7i
         4W2w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=by+QCFBT6MiEPhb9gf96i+Wtei4ibVP3WzqXMkTBrlg=;
        fh=5zhvEsYSO7dOqVfxXN7t/EgL9y5bu+TGrDyXQjsGWao=;
        b=ueQb1h5CI4iYcBBSDcxVYPRHnLlixf9Qj6o2G7TUpFYsBEcsxLlqSq10QAj//VAYt7
         NzgF7FHHUQoD+GVp7CgdqSP46sHIOVYT1aVI1c705D2frPSOC3t8AgzO5aryLuNApsoG
         2WajgcFMqKe+q5ukGw68rqCPV2QXCV6tRhpuD3hGdETB/g4sxyRNdwoluISt5OtdRjP8
         de3ul0vPhzbJrXveV8J4tT26A4SNHLIPRKQOpjkqUNIL/ld7pe7XBWGFjUxftou3bpEe
         bDEb9ZJe0LX8cyu9RK/B37TrVfQBVpwuaQ1WUPkgh1O2NGNrsFEgy6jZnAJKNGinNF2m
         jcVw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XLzdRlZi;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-292110-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-292110-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <linux-kernel+bounces-292110-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [2604:1380:45d1:ec00::1])
        by mx.google.com with ESMTPS id d75a77b69052e-4536a0dafe8si106811631cf.639.2024.08.19.05.51.57
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 05:51:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-292110-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) client-ip=2604:1380:45d1:ec00::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XLzdRlZi;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-292110-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45d1:ec00::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-292110-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C53D91C21AF2
	for <alex.bennee@linaro.org>; Mon, 19 Aug 2024 12:51:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6FE3A16A95B;
	Mon, 19 Aug 2024 12:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XLzdRlZi"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F92216849F
	for <linux-kernel@vger.kernel.org>; Mon, 19 Aug 2024 12:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724071904; cv=none; b=rRwXT3gfXJus2mTScTaGrFJLzrQVsrX03mT9DjMQOzDhBb6JeKpDQb0SDCwNhTDe2NuIGinBCSJFQwrfS7msj7YuFeP5GYSftONa+m4NLAuuK4at0a1SV1+6Fj2Uw2fXAE6lNBaikt54QbpPTl2Ljhjv7cxv3GIzkbnYqVJz8o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724071904; c=relaxed/simple;
	bh=Tp60tvpmXwimkntneg2cYy+EyA+zEdByTTCcBNV0cc8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MuaLK1c9gVOcVYZIZYA/7uzY4/oghJ64kqC9FQztXyJGreopjgA/XFrtO+2jpTIa5zlsK2ux7B24EFUZ3li6HW8989M2tac/nPXuAfkkDYzBz6QbnZlRLt/CNFQd/15J1fuAJOQb+Dq0c5Hr2NPHCUkzlmFYQB0Dye/xbOgkLtQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XLzdRlZi; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1724071901;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=by+QCFBT6MiEPhb9gf96i+Wtei4ibVP3WzqXMkTBrlg=;
	b=XLzdRlZi9DCwD9/uYOnLJnZMGK/ZjXbIsz00HChi1YyBN4WsurzYo6chmbeDxE3lnPYL7B
	kJUOX9iL24emjjjbOWmELAqSNmo4vOna04qtoFo4qXnz24WkSi9XL2rokXu7tQ5Zc0lprG
	4fvBX1aWZeSPZ6LJfI/P8OWje8NdtH8=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-410-S5sW4amVOSKHk7FpkiSAsw-1; Mon, 19 Aug 2024 08:51:40 -0400
X-MC-Unique: S5sW4amVOSKHk7FpkiSAsw-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-37193ed09b2so1700329f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 Aug 2024 05:51:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724071899; x=1724676699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=by+QCFBT6MiEPhb9gf96i+Wtei4ibVP3WzqXMkTBrlg=;
        b=TyShTrE/q4pxAcAxVMQOYtyZwGuIL7nzOu2awDXOcqGBAogJ4/WnzwdFZEwxZhu8Oc
         PCnWKiki3xFayjF2fNX4iBpmbc0qkaDgpEK/XKNIkTcLV3jAx4OkKIxh1GG7Hb/c3cC+
         snoiPYQ9rSYon0p4yawgSQUijZeMyvHzIUokzh10//YGWQ4zCAg+GD65aClsW/gkQ41S
         sOGjQE7kky2qSU/VUZ+Eh077OrfOXADckO2/DFWphqqwnjm+1UIox/7Z5raN0+lxqdni
         9Y6OtokPognCm9FEYrdPVF5FbNqhmfR9liX24VKZU903g2xbi1MjlLFuj25aRpvWRY79
         q5+A==
X-Forwarded-Encrypted: i=1; AJvYcCV1/9038aQ8a8CmCr8K7NmWZUjnXupAf1NJvFHUkKjgdIXyf/mmxPvST74LafzyTQOI63wZxj5MtGbL+chJPOSbsmTikHMUUePLjn5O
X-Gm-Message-State: AOJu0YymvkOPOYdPzECMn8L5GsfHg5eqxoT+FNbfEwUea+FwbdPAxZDh
	BwOXI494TpP0+74ZWnu+gqSaFrVDtg9TmY5PCccMfO0tldXRtZKfr12+pcBKcezO/3HZPbPJQ6L
	+MG+RZiT+OfHxsRZNKcstp+9ikba6mMDP8iJ+AHAPjBSjAtXAvPSOw31M7kY+Qw==
X-Received: by 2002:a05:600c:a4f:b0:426:67f9:a7d8 with SMTP id 5b1f17b1804b1-429ed9f844fmr70111975e9.9.1724071898914;
        Mon, 19 Aug 2024 05:51:38 -0700 (PDT)
X-Received: by 2002:a05:600c:a4f:b0:426:67f9:a7d8 with SMTP id 5b1f17b1804b1-429ed9f844fmr70111795e9.9.1724071898403;
        Mon, 19 Aug 2024 05:51:38 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429ed65072asm108393795e9.13.2024.08.19.05.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2024 05:51:37 -0700 (PDT)
Date: Mon, 19 Aug 2024 14:51:36 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Shiju Jose
 <shiju.jose@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha
 <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 linux-kernel@vger.kernel.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v8 06/13] acpi/ghes: add support for generic error
 injection via QAPI
Message-ID: <20240819145136.0452ff2b@imammedo.users.ipa.redhat.com>
In-Reply-To: <2c8970b5d54d17b601dc65d778cc8b5fb288984b.1723793768.git.mchehab+huawei@kernel.org>
References: <cover.1723793768.git.mchehab+huawei@kernel.org>
	<2c8970b5d54d17b601dc65d778cc8b5fb288984b.1723793768.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: K70UlrQV4BTO

On Fri, 16 Aug 2024 09:37:38 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Provide a generic interface for error injection via GHESv2.
> 
> This patch is co-authored:
>     - original ghes logic to inject a simple ARM record by Shiju Jose;
>     - generic logic to handle block addresses by Jonathan Cameron;
>     - generic GHESv2 error inject by Mauro Carvalho Chehab;
> 
> Co-authored-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Co-authored-by: Shiju Jose <shiju.jose@huawei.com>
> Co-authored-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Signed-off-by: Shiju Jose <shiju.jose@huawei.com>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  hw/acpi/ghes.c      | 57 +++++++++++++++++++++++++++++++++++++++++++++
>  hw/acpi/ghes_cper.c |  2 +-
>  2 files changed, 58 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> index 7870f51e2a9e..a3ae710dcf81 100644
> --- a/hw/acpi/ghes.c
> +++ b/hw/acpi/ghes.c
> @@ -500,6 +500,63 @@ int acpi_ghes_record_errors(enum AcpiGhesNotifyType notify,
>  NotifierList acpi_generic_error_notifiers =
>      NOTIFIER_LIST_INITIALIZER(error_device_notifiers);
>  
> +void ghes_record_cper_errors(uint8_t *cper, size_t len,
> +                             enum AcpiGhesNotifyType notify, Error **errp)
> +{
> +    uint64_t cper_addr, read_ack_start_addr;
> +    enum AcpiHestSourceId source;
> +    AcpiGedState *acpi_ged_state;
> +    AcpiGhesState *ags;
> +    uint64_t read_ack;
> +
> +    if (ghes_notify_to_source_id(notify, &source)) {
> +        error_setg(errp,
> +                   "GHES: Invalid error block/ack address(es) for notify %d",
> +                   notify);
> +        return;
> +    }
> +
> +    acpi_ged_state = ACPI_GED(object_resolve_path_type("", TYPE_ACPI_GED,
> +                                                       NULL));
> +    g_assert(acpi_ged_state);
> +    ags = &acpi_ged_state->ghes_state;
> +
> +    cper_addr = le64_to_cpu(ags->ghes_addr_le);
       ^^^ suggest to rename to error_block_address
       that way reader can easily match it with spec.

> +    cper_addr += ACPI_HEST_SRC_ID_COUNT * sizeof(uint64_t);
and it would be better to merge this with previous line to be more clear
 + to avoid shifting meaning of variable between lines.

> +    read_ack_start_addr = cper_addr + source * sizeof(uint64_t);

> +    cper_addr += ACPI_HEST_SRC_ID_COUNT * sizeof(uint64_t);
> +    cper_addr += source * ACPI_GHES_MAX_RAW_DATA_LENGTH;
I'd avoid changing meaning of variable, it adds up to confusion.
Anyway, what the point of of above math?  

> +
> +    cpu_physical_memory_read(read_ack_start_addr,
> +                             &read_ack, sizeof(uint64_t));
s/sizeof(uint64_t)/sizeof(read_ack)/
ditto elsewhere

> +
> +    /* zero means OSPM does not acknowledge the error */
> +    if (!read_ack) {
> +        error_setg(errp,
> +                   "Last CPER record was not acknowledged yet");

> +        read_ack = 1;
> +        cpu_physical_memory_write(read_ack_start_addr,
> +                                  &read_ack, (uint64_t));
we don't do this for SEV so, why are you setting it to 1 here?


> +        return;
> +    }
> +
> +    read_ack = cpu_to_le64(0);
> +    cpu_physical_memory_write(read_ack_start_addr,
> +                              &read_ack, sizeof(uint64_t));
> +
> +    /* Build CPER record */
> +
> +    if (len > ACPI_GHES_MAX_RAW_DATA_LENGTH) {
> +        error_setg(errp, "GHES CPER record is too big: %ld", len);
> +    }
move check at start of function?

> +
> +    /* Write the generic error data entry into guest memory */
> +    cpu_physical_memory_write(cper_addr, cper, len);
> +
> +    notifier_list_notify(&acpi_generic_error_notifiers, NULL);
> +}
> +
>  bool acpi_ghes_present(void)
>  {
>      AcpiGedState *acpi_ged_state;
> diff --git a/hw/acpi/ghes_cper.c b/hw/acpi/ghes_cper.c
> index 92ca84d738de..2328dbff7012 100644
> --- a/hw/acpi/ghes_cper.c
> +++ b/hw/acpi/ghes_cper.c
> @@ -29,5 +29,5 @@ void qmp_ghes_cper(const char *qmp_cper,
>          return;
>      }
>  
> -    /* TODO: call a function at ghes */
> +    ghes_record_cper_errors(cper, len, ACPI_GHES_NOTIFY_GPIO, errp);
>  }

