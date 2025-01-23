Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp57142njk;
        Thu, 23 Jan 2025 02:31:52 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCXri6NZTw+Sk1j0/3vJ6Ypnuhs2aQKOqQ3A+Yw+NPojR4zXNryPNMZYgKzrEc33ps3DfAIe4jYpAaPsZg==@linaro.org
X-Google-Smtp-Source: AGHT+IG++cRENrF80FQUpSguIjCvCm6o5ysZB/riBofQRHFDhMVvBwEb5nuuiWV+x4QnuoMvteco
X-Received: by 2002:ac8:58c2:0:b0:46c:7657:5ab5 with SMTP id d75a77b69052e-46e12a58bb2mr366431591cf.20.1737628312559;
        Thu, 23 Jan 2025 02:31:52 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1737628312; cv=pass;
        d=google.com; s=arc-20240605;
        b=XJxlyXI89KT9HgLN0QsCIWXEUhCMTBSxDsY2lQcgjfifJlb5unaeHK3eYKkuvmiqD2
         MRJjocwGBZN9SJp98Wm+rW+fpYQmysIynYMDl/6TFJY6grqq3MRoBXIYNmITvrZizwFt
         N9DOaBCoHgeb4KZM0JTNUsJSzNYMbjfmUFVlUDBqHZjhKYotuActb5y04U4xm76fjs/c
         GYvkh1bALcLZAzPldzNc8G2fAxo2aAvJDW7g95jOPdHuJGm6WFiUjAX7mx2x2LwTdWg7
         9oz1EGWcFyJh7AYvYi2LUrJzg6yTE2dJLRqOfpMed6PP79IHosM3zkld7+wIA+R7XHJN
         8EdQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date;
        bh=Ct91hHCPwmNPvRhKwQWzXt65+6OciXY3xVDtAmFrEEI=;
        fh=t/xybFWV2B884dK2bO1HGz5LnOWlFKzKgenI2zgFzYc=;
        b=MwJ9UJ4bpx7EVDriMGVQ2/KRmuWgtDb8AONi4xJuiFq58mataTJifX5MXErEY1A3do
         32KQoIa20CIzZCF0TzvK8Zk3W50O1as4eRNJV9IRQl42bOVA5vUFzH9hMwQ8UNXcMYIR
         2tPacMUeVrIgOBvkEbdh1ntUvWyPS3mpCRXEGViGADnIeluE+ii6fLc6qoY6PbmEYLvZ
         sRwHzlhXTyiYkrquBMU7vC96FP0irKDWSy2Zmg070s82smCZDcaKUEYx04Ef8iIwt4KH
         sBqFQrPQQFB7Fl7uiccSuCxu+qnJcXg/Q5y/LXX80lVkFZuUMCSXP3zuwOoqLsXh7WDg
         gewQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=huawei.com dmarc=pass fromdomain=huawei.com);
       spf=pass (google.com: domain of linux-kernel+bounces-486520-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="linux-kernel+bounces-486520-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <linux-kernel+bounces-486520-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [147.75.199.223])
        by mx.google.com with ESMTPS id d75a77b69052e-46e104b5d3bsi179014271cf.607.2025.01.23.02.31.52
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 02:31:52 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-486520-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) client-ip=147.75.199.223;
Authentication-Results: mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=huawei.com dmarc=pass fromdomain=huawei.com);
       spf=pass (google.com: domain of linux-kernel+bounces-486520-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="linux-kernel+bounces-486520-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AF7C11611CB
	for <alex.bennee@linaro.org>; Thu, 23 Jan 2025 10:31:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CF331C5F14;
	Thu, 23 Jan 2025 10:31:38 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F022E186A
	for <linux-kernel@vger.kernel.org>; Thu, 23 Jan 2025 10:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737628298; cv=none; b=IcmBaZHvX1RVNlxCVk3tlo3yipQhATRMICk/T+BEcQpzCJdUKUPNz8on3Z+8WpS1wRzSHc1DJEEhwb5M41W8948D40c06Z0TKKDl4BfwbxLmxIneD4+F5GC2yfg1r7W3b1u3z7D7sbdukX3UKr2CtwOKkuriyxIgC8wOhXOKlh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737628298; c=relaxed/simple;
	bh=U6DBOySvHngcaHeHU+AI4jyFcENbFVszbM2S4h8LRtc=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZM8fmggS06e5ZH7PnrRnDdAFcWOSPqCI+HcuPddZ0OTmtzit4tpWKwT1audt5GJSk41Fs/0rYFzDU/DQEoHWN1BlAHlAxp6nZ9CbQFETw2QgnzDYfW9UJPy25izvyi6jbqsttFA2DCGgir5I0ghJr4Iy6xYsfzrk+QL8gxK7G1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YdxyS5SV4z6M4NF;
	Thu, 23 Jan 2025 18:29:36 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id B1A92140519;
	Thu, 23 Jan 2025 18:31:33 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 23 Jan
 2025 11:31:33 +0100
Date: Thu, 23 Jan 2025 10:31:31 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC: Igor Mammedov <imammedo@redhat.com>, "Michael S . Tsirkin"
	<mst@redhat.com>, Shiju Jose <shiju.jose@huawei.com>, <qemu-arm@nongnu.org>,
	<qemu-devel@nongnu.org>, Ani Sinha <anisinha@redhat.com>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 04/11] acpi/generic_event_device: Update GHES migration
 to cover hest addr
Message-ID: <20250123103131.0000393d@huawei.com>
In-Reply-To: <6b79da0dbd8d735e93c15c4673bf2af61e8c34a2.1737560101.git.mchehab+huawei@kernel.org>
References: <cover.1737560101.git.mchehab+huawei@kernel.org>
	<6b79da0dbd8d735e93c15c4673bf2af61e8c34a2.1737560101.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml500001.china.huawei.com (7.191.163.213) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: jaGEgihJyKB5

On Wed, 22 Jan 2025 16:46:21 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> The GHES migration logic at GED should now support HEST table
> location too.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

I'm not an expert on migration logic, but with that in mind, this looks fine to me.
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

> ---
>  hw/acpi/generic_event_device.c | 29 +++++++++++++++++++++++++++++
>  1 file changed, 29 insertions(+)
> 
> diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
> index c85d97ca3776..5346cae573b7 100644
> --- a/hw/acpi/generic_event_device.c
> +++ b/hw/acpi/generic_event_device.c
> @@ -386,6 +386,34 @@ static const VMStateDescription vmstate_ghes_state = {
>      }
>  };
>  
> +static const VMStateDescription vmstate_hest = {
> +    .name = "acpi-hest",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields = (const VMStateField[]) {
> +        VMSTATE_UINT64(hest_addr_le, AcpiGhesState),
> +        VMSTATE_END_OF_LIST()
> +    },
> +};
> +
> +static bool hest_needed(void *opaque)
> +{
> +    AcpiGedState *s = opaque;
> +    return s->ghes_state.hest_addr_le;
> +}
> +
> +static const VMStateDescription vmstate_hest_state = {
> +    .name = "acpi-ged/hest",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .needed = hest_needed,
> +    .fields = (const VMStateField[]) {
> +        VMSTATE_STRUCT(ghes_state, AcpiGedState, 1,
> +                       vmstate_hest, AcpiGhesState),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};
> +
>  static const VMStateDescription vmstate_acpi_ged = {
>      .name = "acpi-ged",
>      .version_id = 1,
> @@ -398,6 +426,7 @@ static const VMStateDescription vmstate_acpi_ged = {
>          &vmstate_memhp_state,
>          &vmstate_cpuhp_state,
>          &vmstate_ghes_state,
> +        &vmstate_hest_state,
>          NULL
>      }
>  };

