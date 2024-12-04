Received: by 2002:a17:504:d692:b0:1be9:327d:8ee3 with SMTP id na18csp338988njb;
        Wed, 4 Dec 2024 08:38:21 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCUDR+8yPRSoFNZpsosEF8GrZo/UPNp7HpZ26SSdozdRPmIaCZHUeXz3K+nZ1peddrTqjGg05nxD9Wjstw==@linaro.org
X-Google-Smtp-Source: AGHT+IENbDTMfElazQ4KNZZ+Izk48rellmGLrF1YkXdxsaNZU9Ex7Ql9YiFl6NEMce7Sd1APi23V
X-Received: by 2002:a17:90b:3891:b0:2ee:ead6:6213 with SMTP id 98e67ed59e1d1-2ef1ce96270mr7053054a91.19.1733330301672;
        Wed, 04 Dec 2024 08:38:21 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1733330301; cv=pass;
        d=google.com; s=arc-20240605;
        b=RymxWwxqnc1/vC98+L/pegBaEBKgccBs29hVd3UmHrC8ks11AAs4QHC4+fJ/MGXlho
         zzEB0dU/jJGfkR3JqTiyM3oH5on8GEA1zhq2V7vZbsUbNY4HXq6KzOej7X9713H32Svd
         Hl8zxdNArFYtMqVwJ4PbYTZs4oYOgERnedoQO/K+c88xcgAChclia24f8Dks7xBIrlSA
         Aog3Z5Vza12uateOkbplGzs4M6jBb3E7bX+6QNCOLjcX6kY9ObY6V6//cft+QpZSgeLZ
         u4csSm1beqelpDP7DLFdXc6LkzzUfJqkz7Vq8B5lYCPz/AlBMGNJZ1hXU53f5xKjkMVp
         Wxnw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=I56T0jef1B9MebW55HaogqObbHI0foL5BjBnDVvFKBY=;
        fh=m2ZBOMbs1qPdFz3LS/scKPGBg9+JS8HnFRr6ycs7lks=;
        b=f9FT+eiOxZ2brJ+E4QCxeSNLNip7L8jK5bsQNP1RQdQVc8KzU1UmQcV5s5vnyvFX7V
         gnMqxVq4C0JplLA1wLaNm7yPZUkzXuNWLwCdSHFDPeU1/pv11nfRayODSKn20z9ZyuKB
         JAqq0blGUNadIwxiVIFBVYUwAJQ0icosqZPcciNMjkVEz5Qo6mBHxhvCHFzRUy1AEu1T
         wTkcAtUM7Flz3tI85JbBFmgKKTWw8W4LAgEj6U5ZHaHextMUzb4PBPrT73wS8lVo8+g2
         WNekm3wwTTXqPeyzaIrefnmzrc0N1CDA8kpVoSAg+cK3nFIrovgE/H96b48syQA9TZW7
         x5UQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TehPCWTl;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-431642-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-431642-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <linux-kernel+bounces-431642-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id 98e67ed59e1d1-2ef2703e5d9si2169243a91.72.2024.12.04.08.38.21
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 08:38:21 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-431642-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=TehPCWTl;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-431642-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-431642-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3522B280DC0
	for <alex.bennee@linaro.org>; Wed,  4 Dec 2024 16:38:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E5CC20CCCC;
	Wed,  4 Dec 2024 16:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TehPCWTl"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7B315B10D
	for <linux-kernel@vger.kernel.org>; Wed,  4 Dec 2024 16:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733330288; cv=none; b=qF0f8SiWe7EVCkxGZe2fNnloFDPghYAE40FLmTojUVfFDS0KPXAPnySuCiiFxts9lXT/BM5MjPUgamt12N4qL18qZmYA0H/BxDMqkVBFfw27OnuL9fwjZgiBc9gZjGY1XOp0595Y9Lnq/AI/0Or3Zcp+YcN3ubcdCwDXQZAe6iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733330288; c=relaxed/simple;
	bh=UsrhK2O8qYZAWeAQ04dz0BfyqgWPFxCcwLNHHtKiaJU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fXCxz+ZqdIi9k7gCzwOf7LOZ7qSCTOP0MRBZ+uQ9sLWei0PCtvPlkv/nSD7JYgMkgLU9Ku+NA74j9sjZFLL6HKJ7Mz4L6nbri8xtykkc1dPm2BwqelXtCLEyjAfYQL/nU8m6AkHl9GXtMdcGQTIxSUph2iIA+UcaKOkaiBcNbQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TehPCWTl; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733330285;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I56T0jef1B9MebW55HaogqObbHI0foL5BjBnDVvFKBY=;
	b=TehPCWTlgalxcB4ar/jXRaT2yzdBHRr9082RU0DVjZ7U8BXb9hdGXB8TSRlwOLKUf6dHy+
	Ta902By3WFpu5dhDKBgI18/opLYoNWZ1wdjVXEtD36q/GkxsEmgUD03e2TqCWEHFGHXtP6
	Om912VPDO1rQxCJXVxT6YB6gJ6MlxK8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-77-GyTXbKblPjG71s5WZX8qMg-1; Wed, 04 Dec 2024 11:38:04 -0500
X-MC-Unique: GyTXbKblPjG71s5WZX8qMg-1
X-Mimecast-MFC-AGG-ID: GyTXbKblPjG71s5WZX8qMg
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-434a9861222so57159515e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Dec 2024 08:38:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733330282; x=1733935082;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I56T0jef1B9MebW55HaogqObbHI0foL5BjBnDVvFKBY=;
        b=q+2KMd1k8rovIgLd/9fmu8T5/PLbRbvHzUoJA8tNYaieF/3TvCmHt+MlNJthpjW3Yj
         fLpXsps15gpdIej5/dhXtCOKbEIZXrtYaDVP9h9e193Bgi2RQdl3qzxj4Zn8SLTAjF8C
         27daMxOSB4teLboMQM1CSUIltflh1eNcswuaV4k0zXxSAph4H6YBYlEfObdishKPl2cB
         dSnYE5lhTH9tyG5bPzIHs8SOFZh7JdoJGQ4ERXrOPjrixwJ8moToMyYkyFtQeDjlVCfD
         pumk0Jl3lkIdwkYeIdksak/KcOVdEE6F4iSe1T4MO4My0Uk5kl2njTNtnoewnF2WNFk+
         xIJg==
X-Forwarded-Encrypted: i=1; AJvYcCVHa1OVXg9nWIg7SAB3zlV6A7PL8VnMDYBdbCssco1x0ZKzeAR+8i4XsPg2dtaQt9CXyPbi30BC3XmbUDY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQ5mSXVjq8sKqgqYqOC8EOu7EUUq4sXAsaMKCAXYbMcSdkTsxb
	UxCNEhMhkgaEdpTONiUkgQPiBvfdtj278lgw/AbBNhZAv1OdQTq+xp2mx04RaTwlIHuDlyaBgVW
	Z4gRhJy0NsZxpXJ/1V1cpJuWQfwnA0jVD2kERZBRNkDanmH7Yfk3dr0kRKni0eaNXz50pZw==
X-Gm-Gg: ASbGncstVagPnU6wIYQx34e6NpKKbiMR7j888STRUDD+fbQ58UbaAVrkjtYgcZAFsFf
	HNa6DkNBUGnK/wT452HI9u8bWg4/3hgT94VnwA5ZNwAWMaZw31RWd0ALhvjSh4XNWtz29wDqHmX
	MimH135U9uPgUFhLigao0Ji3Oiyh2jEdch/d8BYyXHxGIKgMcDp7p4foMfFvPbY5YOOy65mra+4
	mtZYG2rPsfQbK20j3aDJXMSl4clbFbXM8ok1hJ8kFqj4N25zFIqZu9xEUaQcPMf1cHi2nXygpYU
	g/tI/2+ArjF2m4NfD0vlpw==
X-Received: by 2002:a05:600c:19d1:b0:434:a765:7f9c with SMTP id 5b1f17b1804b1-434d09acf91mr64226155e9.6.1733330282486;
        Wed, 04 Dec 2024 08:38:02 -0800 (PST)
X-Received: by 2002:a05:600c:19d1:b0:434:a765:7f9c with SMTP id 5b1f17b1804b1-434d09acf91mr64225985e9.6.1733330282132;
        Wed, 04 Dec 2024 08:38:02 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d5280120sm29353435e9.20.2024.12.04.08.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 08:38:01 -0800 (PST)
Date: Wed, 4 Dec 2024 17:37:59 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Shiju Jose
 <shiju.jose@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha
 <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 linux-kernel@vger.kernel.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v5 13/16] acpi/ghes: better name the offset of the
 hardware error firmware
Message-ID: <20241204173759.6f02561a@imammedo.users.ipa.redhat.com>
In-Reply-To: <20b003136d8c008fd54e8d40c806f13867336e13.1733297707.git.mchehab+huawei@kernel.org>
References: <cover.1733297707.git.mchehab+huawei@kernel.org>
	<20b003136d8c008fd54e8d40c806f13867336e13.1733297707.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: Es97O8jjbVQv

On Wed,  4 Dec 2024 08:41:21 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> The hardware error firmware is where HEST error structures are
      ^^^^^^^^^^^^^^^^^^^^^^^ I can't parse this, suspect you've meant something else here

> stored. Those can be GHESv2, but they can also be other types.
> 
> Better name the location of the hardware error.
> 
> No functional changes.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  hw/acpi/generic_event_device.c | 4 ++--
>  hw/acpi/ghes.c                 | 4 ++--
>  include/hw/acpi/ghes.h         | 2 +-
>  3 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
> index 663d9cb09380..17baf36132a8 100644
> --- a/hw/acpi/generic_event_device.c
> +++ b/hw/acpi/generic_event_device.c
> @@ -364,7 +364,7 @@ static const VMStateDescription vmstate_ghes = {
>      .version_id = 1,
>      .minimum_version_id = 1,
>      .fields = (const VMStateField[]) {
> -        VMSTATE_UINT64(ghes_addr_le, AcpiGhesState),
> +        VMSTATE_UINT64(hw_error_le, AcpiGhesState),
>          VMSTATE_END_OF_LIST()
>      },
>  };
> @@ -372,7 +372,7 @@ static const VMStateDescription vmstate_ghes = {
>  static bool ghes_needed(void *opaque)
>  {
>      AcpiGedState *s = opaque;
> -    return s->ghes_state.ghes_addr_le;
> +    return s->ghes_state.hw_error_le;
>  }
>  
>  static const VMStateDescription vmstate_ghes_state = {
> diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> index 52c2b69d3664..90d76b9c2d8c 100644
> --- a/hw/acpi/ghes.c
> +++ b/hw/acpi/ghes.c
> @@ -359,7 +359,7 @@ void acpi_ghes_add_fw_cfg(AcpiGhesState *ags, FWCfgState *s,
>  
>      /* Create a read-write fw_cfg file for Address */
>      fw_cfg_add_file_callback(s, ACPI_HW_ERROR_ADDR_FW_CFG_FILE, NULL, NULL,
> -        NULL, &(ags->ghes_addr_le), sizeof(ags->ghes_addr_le), false);
> +        NULL, &(ags->hw_error_le), sizeof(ags->hw_error_le), false);
>  
>      ags->present = true;
>  }
> @@ -385,7 +385,7 @@ void ghes_record_cper_errors(const void *cper, size_t len,
>      }
>      ags = &acpi_ged_state->ghes_state;
>  
> -    start_addr = le64_to_cpu(ags->ghes_addr_le);
> +    start_addr = le64_to_cpu(ags->hw_error_le);
>  
>      start_addr += source_id * sizeof(uint64_t);
>  
> diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
> index 21666a4bcc8b..39619a2457cb 100644
> --- a/include/hw/acpi/ghes.h
> +++ b/include/hw/acpi/ghes.h
> @@ -65,7 +65,7 @@ enum {
>  };
>  
>  typedef struct AcpiGhesState {
> -    uint64_t ghes_addr_le;
> +    uint64_t hw_error_le;
>      bool present; /* True if GHES is present at all on this board */
>  } AcpiGhesState;
>  

