Received: by 2002:a17:505:4c56:b0:1be9:327d:8ee3 with SMTP id do22csp1225403njc;
        Mon, 25 Nov 2024 04:00:16 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCVo6i2Z4In2FAtdNfXc+PyYjmAbc8UHxIFeIbjxTdPNAtMiRzBinSLYheKZwnrj+66P4HlfO8suEg9zPA==@linaro.org
X-Google-Smtp-Source: AGHT+IHFvv83X5Xgw2tB4NUgMSzEZRwpqtCm4JrD17y2agS7WewYENKceSJM3g4dgSCHTroxjKMk
X-Received: by 2002:aa7:88cb:0:b0:71e:3b51:e850 with SMTP id d2e1a72fcca58-724df3c8256mr18580165b3a.2.1732536015723;
        Mon, 25 Nov 2024 04:00:15 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1732536015; cv=pass;
        d=google.com; s=arc-20240605;
        b=Cfu5lBIIi6YF+z39KxsZgyvtuQtIdujpvS+aKS6ocQCk6A4Gf5oII0iXu2YzL24Xeg
         XipMrYAcflc0RFY1WAkRszr15Dmod7eYodUWZ+zbarufnGPejFu5ImE3g10AOSxhedPx
         P1UeZaT6V1nNF60PCWnge5SwqYzXB2UmkMflGLpOv//9U51JcxPmBsj2l6X9sFgrawNN
         vAX+/8n/RRuEqspYzi0SB0HbwCIlBmNsg0aZjUmSbbJ6Tq8rCpAmtvOd+nvvueap//Id
         JYf+/U31Z3dIahE6u/kbwxryXcDS/ZxV5YoRR9Ob0hLlnAutlWHRIH5TrpcGYZoxYYIL
         F5rw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date;
        bh=M8oJ6xl7clU/GiFxIT656M+c+Pe7nNpf+ZPAZ/9B43w=;
        fh=c5SdJPmuZjLqL/yVd759G8+oVgaaCcPKba91GgsaS4c=;
        b=k5rQr5QW/D21ljMovIpZ4Fp0f6rLbPxQu6bh2d7s8T4wkf+3VbA5f3Q3i6fqQbAp5Q
         cgdoprprGvXSId8f1S38RMVXsK1VsfL2pDUXjIAMfAdUswZQ3bk+XnmGJ8KGaOxpDOkI
         hO/1XPkNLBfcjvvVJ9OFpXYwbEaU/zPRrmWoJalIPvpEkVnQ+GQopQqFZ33HyKDML0Gu
         nNgyPKUuprd7reNMcs0q5Ynbx3Go2oZCugOQK4YZRbU0+5M1j4V0uwPr9L23PiPgO7bt
         jnPVEcldUkyAP0cZN1mA2jwarwYxhZLdoldkjEW4UbWQQPMaVppuXjC/f1JpUWy0pN6l
         m5NQ==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=huawei.com dmarc=pass fromdomain=huawei.com);
       spf=pass (google.com: domain of linux-kernel+bounces-420972-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-420972-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <linux-kernel+bounces-420972-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [139.178.88.99])
        by mx.google.com with ESMTPS id 41be03b00d2f7-7fbcc22ab83si9178559a12.179.2024.11.25.04.00.15
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 04:00:15 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-420972-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) client-ip=139.178.88.99;
Authentication-Results: mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=huawei.com dmarc=pass fromdomain=huawei.com);
       spf=pass (google.com: domain of linux-kernel+bounces-420972-alex.bennee=linaro.org@vger.kernel.org designates 139.178.88.99 as permitted sender) smtp.mailfrom="linux-kernel+bounces-420972-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 491ED285072
	for <alex.bennee@linaro.org>; Mon, 25 Nov 2024 12:00:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 332F1199237;
	Mon, 25 Nov 2024 12:00:12 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F52216F851
	for <linux-kernel@vger.kernel.org>; Mon, 25 Nov 2024 12:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732536012; cv=none; b=Cut/vF7wPZNpfV+Cmpd9qP1eLgBiM1PhVdJjm/Mi0pcByrDMCgoZrrc81Grlv1JmN+BGeZJojOqo65BMbjLepdKVYIneqkGdCb5MDva9CIKTtY5ua7T4HgQtbN++zmmC5ssiXnsywp7j6i7vj0RZO57STBvirHkCKn9cGqNZBec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732536012; c=relaxed/simple;
	bh=IHleToAA6rnb5X+NVVZOmm4xFO5hSRXp4UtRpALfFuQ=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TuGykmoXfaU3fYazP9tm8ATJftowjMCPeycbmmU1LdobldfzCU4HmSgb/t4Wzfhesj09l+GJTQQ22dQo5BtSUKEA6awSV7SwplxvodgsphLbGkKcfe7R4gVkCwPcKf0c3OxpwRcvo0HF4w/7fklrC7JClSD9rBDfFjDLyHIQwpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Xxkgl27fpz6J72Z;
	Mon, 25 Nov 2024 19:56:19 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id F2D561400D9;
	Mon, 25 Nov 2024 20:00:05 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 25 Nov
 2024 13:00:05 +0100
Date: Mon, 25 Nov 2024 12:00:04 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC: Shiju Jose <shiju.jose@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	Ani Sinha <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>, Igor
 Mammedov <imammedo@redhat.com>, <linux-kernel@vger.kernel.org>,
	<qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>
Subject: Re: [PATCH v2 3/5] acpi/ghes: Use HEST table offsets when preparing
 GHES records
Message-ID: <20241125120004.000041f1@huawei.com>
In-Reply-To: <b1a43a91ea70d5972455318f6a00b6e0adb89202.1732281080.git.mchehab+huawei@kernel.org>
References: <cover.1732281080.git.mchehab+huawei@kernel.org>
	<b1a43a91ea70d5972455318f6a00b6e0adb89202.1732281080.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml100010.china.huawei.com (7.191.174.197) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: HJcLMhWsXR3Y

On Fri, 22 Nov 2024 14:14:13 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> There are two pointers that are needed during error injection:
> 
> 1. The start address of the CPER block to be stored;
> 2. The address of the ack, which needs a reset before next error.
> 
> It is preferable to calculate them from the HEST table.  This allows
> checking the source ID, the size of the table and the type of the
> HEST error block structures.
> 
> Yet, keep the old code, as this is needed for migration purposes.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
Just repeat of the comment I failed to explain properly on previous version
about comment style.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

>  hw/acpi/ghes.c | 98 ++++++++++++++++++++++++++++++++++++++++++++------
>  1 file changed, 88 insertions(+), 10 deletions(-)
> 
> diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> index 680cada0e487..b5e3e2891445 100644
> --- a/hw/acpi/ghes.c
> +++ b/hw/acpi/ghes.c
> @@ -61,6 +61,23 @@
>   */
>  #define ACPI_GHES_GESB_SIZE                 20
>  
> +/*
> + * Offsets with regards to the start of the HEST table stored at
> + * ags->hest_addr_le, according with the memory layout map at
> + * docs/specs/acpi_hest_ghes.rst.
> + */
> +
This was the bit I failed to explain in previous review.
I think for consistency it should be.

/*
 * ACPI 6.2: 18.3.2.8 Generic Hardware Error Source version 2
 * Table 18-382 Generic Hardware Error Source version 2 (GHESv2) Structure
 */
> +/* ACPI 6.2: 18.3.2.8 Generic Hardware Error Source version 2
> + * Table 18-382 Generic Hardware Error Source version 2 (GHESv2) Structure
> + */
> +#define HEST_GHES_V2_TABLE_SIZE  92
> +#define GHES_ACK_OFFSET          (64 + GAS_ADDR_OFFSET)
> +
> +/* ACPI 6.2: 18.3.2.7: Generic Hardware Error Source
Similar here.
> + * Table 18-380: 'Error Status Address' field
> + */
> +#define GHES_ERR_ST_ADDR_OFFSET  (20 + GAS_ADDR_OFFSET)
> +

