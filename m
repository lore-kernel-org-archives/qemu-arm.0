Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp2018681njb;
        Mon, 3 Feb 2025 02:51:54 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCV1knmMwrd2iDrvES3qKpe821OEZhB4EmIrHfujsb+J9K1IXYsVf5qKIvCzSEDjMHx9bL0wF3nFBbiG0g==@linaro.org
X-Google-Smtp-Source: AGHT+IF9j2OnHD3HUAge8qlnxsqN6rAdj6qiyCFqe0PNhl0TAcjeIGGU0uX8R3Z77b/Ia+lP70w1
X-Received: by 2002:a17:902:ecce:b0:216:386e:dd8 with SMTP id d9443c01a7336-21dd7c65abamr315608145ad.17.1738579913710;
        Mon, 03 Feb 2025 02:51:53 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1738579913; cv=pass;
        d=google.com; s=arc-20240605;
        b=hs8TZiC0HBQIK70U1nOEDygLQlYMhe7Gafu2Zw1sMwaE2m7RmQQdAxgNVtrixjTzs5
         QBlSWo08niRpd7Q8HxvZYgWvVVTBfXVbPFNWcLae4URtC5BQDz4FhdzH3jHu04Yj1FLr
         EF3sOVwxYD9W91Tt9rVAd6WICvOt6xm5/2tGx73tj5SB8iUdpzPLhIyMlDY6O32F+Cyc
         ih3bNRH+rqkRjGLFA4J72AsMmuRJvlC/quW589qfYzM5OLJPtUiYPVMf5+fQgfR+8qIo
         HaRrOndCTEiNFfbkzFNDuFcI5I2083zo/iDf6GdmVuTbAy5q4vOLvRaeW2uLCE7OLa0o
         4H2A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date;
        bh=b3j4A62wbmBlGTT2i5UOLghRk3TCORo9oqhlLD5+Ic8=;
        fh=GElvAtW5krGxQdrJKAP/tnSiBEfXCwHwTSAoO/mYfiU=;
        b=VTRmIYHkaZGoQmnhotUF32FDeH7akvzaXxgR5vjxJFVm2mZl7oVeIXYqGWHTdl5tpJ
         1tH+DjhWrqTjK7058A/Q64r0r3zX+beO4FZGeQMZilbsvvzoHQgxcI+4LMYBvXmF+89e
         FcKomaVcrSxRtm5WJRUUQi1lHi6Z/XG9/GQ74y60lV50ZsZWTPZ6mvim28pVDda3IzNG
         DJ9UFBty31s1JzI/AZHx8IRnkoJ7ivOUvn1X5QQFtt6Ajb3kXpkfMyI/aVxwLqNrFgM4
         J/V0TxnAozrPowduSZPryeNxc6H9Q1p5dtsinF3CS3iFHVYZKnEgjLnn82tFvEl9+Fku
         fxjA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=huawei.com dmarc=pass fromdomain=huawei.com);
       spf=pass (google.com: domain of kvm+bounces-37123-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="kvm+bounces-37123-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=QUARANTINE) header.from=huawei.com
Return-Path: <kvm+bounces-37123-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id d9443c01a7336-21de5e2e48csi113261955ad.47.2025.02.03.02.51.53
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 02:51:53 -0800 (PST)
Received-SPF: pass (google.com: domain of kvm+bounces-37123-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=huawei.com dmarc=pass fromdomain=huawei.com);
       spf=pass (google.com: domain of kvm+bounces-37123-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="kvm+bounces-37123-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=QUARANTINE) header.from=huawei.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2D3DD3A7FE7
	for <alex.bennee@linaro.org>; Mon,  3 Feb 2025 10:51:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCF4320126B;
	Mon,  3 Feb 2025 10:51:38 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B113F201260;
	Mon,  3 Feb 2025 10:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738579898; cv=none; b=aoZMd9qoLYDU8YjehGxx3Xiex7VBD4QWJQ40Zb/+ls6ZyomLxGgEG+8oRhW8iWMm3o3it43dMBNMhubCj0S15Dfvv0jsl8SFuSS1912GSjYu+0V4H3FzU0CHml7K90baXHh8swTkyPCg4rIhYGiYWUgyqA2rs+PzI7VTwvt6kPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738579898; c=relaxed/simple;
	bh=Tcm1tgf+wFlL9ZR/08nbApxKjd0Y4nSMbFU82/geICs=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SJAROv+3KWnXemLuaubelurIFXz56CYYnzVtJVT5euwBWX0U213WvjJ7x6xCzh+hLtaHXfyweOOIqOcOl+RUKjx5GYscNAvHmk8JzeKy9XCoBbsEqIdgCZjxxepnBKofRb82jMFwvFy5oEZDt2701ABpZOSJKwUVlun+h/sdRi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Ymjsp2pBRz6L4wL;
	Mon,  3 Feb 2025 18:49:02 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 181E1140A34;
	Mon,  3 Feb 2025 18:51:34 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 3 Feb
 2025 11:51:33 +0100
Date: Mon, 3 Feb 2025 10:51:32 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC: Igor Mammedov <imammedo@redhat.com>, "Michael S . Tsirkin"
	<mst@redhat.com>, Shiju Jose <shiju.jose@huawei.com>, <qemu-arm@nongnu.org>,
	<qemu-devel@nongnu.org>, Ani Sinha <anisinha@redhat.com>, Dongjiu Geng
	<gengdongjiu1@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>, "Peter
 Maydell" <peter.maydell@linaro.org>, <kvm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 08/14] acpi/ghes: Cleanup the code which gets ghes
 ged state
Message-ID: <20250203105132.00007af7@huawei.com>
In-Reply-To: <46ef959f50967b6e65310f81b795c60e6ff97be3.1738345063.git.mchehab+huawei@kernel.org>
References: <cover.1738345063.git.mchehab+huawei@kernel.org>
	<46ef959f50967b6e65310f81b795c60e6ff97be3.1738345063.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: kvm@vger.kernel.org
List-Id: <kvm.vger.kernel.org>
List-Subscribe: <mailto:kvm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:kvm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml500002.china.huawei.com (7.191.160.78) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: 9ZTuq9V4Wome

On Fri, 31 Jan 2025 18:42:49 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Move the check logic into a common function and simplify the
> code which checks if GHES is enabled and was properly setup.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by:  Igor Mammedov <imammedo@redhat.com>

One minor comment inline on a change I think should be in an earlier
patch.

> -void ghes_record_cper_errors(const void *cper, size_t len,
> +void ghes_record_cper_errors(AcpiGhesState *ags, const void *cper, size_t len,
>                               uint16_t source_id, Error **errp)
>  {
>      uint64_t cper_addr = 0, read_ack_register_addr = 0, read_ack_register;
> -    AcpiGedState *acpi_ged_state;
> -    AcpiGhesState *ags;
>  
>      if (len > ACPI_GHES_MAX_RAW_DATA_LENGTH) {
>          error_setg(errp, "GHES CPER record is too big: %zd", len);
>          return;
>      }
>  
> -    acpi_ged_state = ACPI_GED(object_resolve_path_type("", TYPE_ACPI_GED,
> -                                                       NULL));
> -    if (!acpi_ged_state) {
> -        error_setg(errp, "Can't find ACPI_GED object");
> -        return;
> -    }
> -    ags = &acpi_ged_state->ghes_state;
> -
> -    if (!ags->hest_addr_le) {
> +    if (!ags->use_hest_addr) {

Should this change be moved back to patch 3?  use_hest_addr was available
at that point and it would reduce churn a tiny bit.

>          get_hw_error_offsets(le64_to_cpu(ags->hw_error_le),
>                               &cper_addr, &read_ack_register_addr);
>      } else {
> @@ -547,11 +531,6 @@ void ghes_record_cper_errors(const void *cper, size_t len,
>                                  &cper_addr, &read_ack_register_addr, errp);
>      }
>  
> -    if (!cper_addr) {
> -        error_setg(errp, "can not find Generic Error Status Block");
> -        return;
> -    }
> -
>      cpu_physical_memory_read(read_ack_register_addr,
>                               &read_ack_register, sizeof(read_ack_register));
>  
