Received: by 2002:a17:505:a60a:b0:1be9:327d:8ee3 with SMTP id qv10csp3982601njc;
        Wed, 20 Nov 2024 06:29:42 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCVm5YQz+t2sDQNu6MB4L6bWLj/JsdgifNpWOj8dxhagQmTefvvgdLat+YyYcUuFSXIfH0IoaXFWKwR0JQ==@linaro.org
X-Google-Smtp-Source: AGHT+IG9fbVRPm8y5TGnhwRk08/sEScxg3aNMYnKpoprztVYuvAm6kaGuJhw8X+BHFL2Sh/9Go14
X-Received: by 2002:a17:902:eccd:b0:212:615f:c6 with SMTP id d9443c01a7336-2126a45450bmr26658845ad.50.1732112982318;
        Wed, 20 Nov 2024 06:29:42 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1732112982; cv=pass;
        d=google.com; s=arc-20240605;
        b=HpfYJEL8FRN1bzbwuAdPCt1XEnRmj6KqMOQE7lmLH9XfDj7uRL2G6y2zeC/gagsI9D
         Jzhb1DqF7gzaBjol8XaWjHcPQX32bTTjrqVykDQsdxiEtDAa4UHyhmDkDql20GShNgjH
         CLjV2B+x62dUewC4fVEJq0lAg0kbUIcM6Y8zobgOoCg/+fJe9wfZDcpMsPRo7yHM/Tg1
         xl1u4iU8a2Ja3xsyiMV4NyJByPBevD2nUVAHDNXJrUaOw6qklliHg7bsex8Kx2t3bwKU
         FBGYNeF8kg0YIUUrH2y4sEslBzNvzEWZ1HXAER1Bcgz6Qd8w29WF808/yXkfpz5vaTra
         t30Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date;
        bh=GUixWcw6CbEfxuu/9UUNjxew5JsL2MrnwEG0HBuwxcc=;
        fh=xorUoMC2IHZi14qbosopEp/1wCIif4VMRZ2S+Ueublk=;
        b=kpqHvXR2FFzCnlDmXnjEveGcL5EtwdnGeTAC7pzknAl67CjYrGWYxkzMRH/aDsgvxx
         ssOXL2I92rWvXspuQH6os8nazvNa4aMQ3+wpjmfss4taaZIH6L1pj5XpNjumP6ePiWxW
         b/aUoHQfOZHVNJBbnzkTi7SfjOMokQ4W2wvt9cTjlgPo5+mXpB323B3+oecGaj74vRnS
         H38dxP70LSrErRP7KAmO3hmwBdGcURIsH8HER3dW8kaw49uJKtwNu0O0vqadM98PMxYa
         Pe9VjAEDrjoKe+6NaR2kzBThogAKPtqS6HRfmXqfhmjQCkYNy4gx3WbuUP+pahJBBEQv
         ppcA==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=huawei.com dmarc=pass fromdomain=huawei.com);
       spf=pass (google.com: domain of linux-kernel+bounces-415884-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-415884-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=QUARANTINE) header.from=huawei.com
Return-Path: <linux-kernel+bounces-415884-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id 98e67ed59e1d1-2ead0343b55si1644199a91.36.2024.11.20.06.29.42
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Nov 2024 06:29:42 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-415884-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=huawei.com dmarc=pass fromdomain=huawei.com);
       spf=pass (google.com: domain of linux-kernel+bounces-415884-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-415884-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=QUARANTINE) header.from=huawei.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CB2EB2844B4
	for <alex.bennee@linaro.org>; Wed, 20 Nov 2024 14:29:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45E341AA781;
	Wed, 20 Nov 2024 14:29:38 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BF10174EDB
	for <linux-kernel@vger.kernel.org>; Wed, 20 Nov 2024 14:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732112978; cv=none; b=j4DpZD8poKpK9ZQEKt+oxvgizIv7FRSa6CJp5cAflsSBCWC6J4VYu5qfrI59xPgsylwdoAuCaZXFa93Q15DMGEqrGT+ZWpU73o0viFpzIkswYhz4BTEHrdc9sSwSAE3gquVDGLnbOWXziTADxEBwWFfLllkUtTwpWlQRSJRLVr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732112978; c=relaxed/simple;
	bh=AnbgXn1iRAyZ2Ce6MENFBQF1R+azdtndo1TcjGJg70s=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=szZHMqwNPjVUpu5KzOeeIXf9jYeF+phSflQL0REZSH+Gdyp2YitDMCcUXmN0By9KPdEMmbur/qP1CsuAPHOVg88V06Am027YpnpWNm0sXgjsA+NJAh3Rc3brPayfVSwfK6sRaOxfrAS/ftAi8Mjz6XhllIJ4IEGjwMrDAjEw/tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XtkDp1MCqz6J6nG;
	Wed, 20 Nov 2024 22:26:02 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id B0F6F140119;
	Wed, 20 Nov 2024 22:29:33 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 20 Nov
 2024 15:29:33 +0100
Date: Wed, 20 Nov 2024 14:29:31 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC: Igor Mammedov <imammedo@redhat.com>, Shiju Jose <shiju.jose@huawei.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <anisinha@redhat.com>,
	Dongjiu Geng <gengdongjiu1@gmail.com>, Peter Maydell
	<peter.maydell@linaro.org>, Shannon Zhao <shannon.zhaosl@gmail.com>,
	<linux-kernel@vger.kernel.org>, <qemu-arm@nongnu.org>,
	<qemu-devel@nongnu.org>
Subject: Re: [PATCH 1/6] acpi/ghes: Prepare to support multiple sources on
 ghes
Message-ID: <20241120142931.00006b63@huawei.com>
In-Reply-To: <3f6b7e8499bf5911de9b1533e4b2a4addc207536.1731486604.git.mchehab+huawei@kernel.org>
References: <cover.1731486604.git.mchehab+huawei@kernel.org>
	<3f6b7e8499bf5911de9b1533e4b2a4addc207536.1731486604.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml100012.china.huawei.com (7.191.174.184) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: OmHKXlXc6Lhv

On Wed, 13 Nov 2024 09:36:58 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> The current code is actually dependent on having just one
> error structure with a single source.

Trivial: Very short line wrap of the description. Maybe more
than 60 chars?

> 
> As the number of sources should be arch-dependent, as it
> will depend on what kind of synchronous/assynchronous
> notifications will exist, change the logic to dynamically
> build the table.
> 
> Yet, for a proper support, we need to get the number of
> sources by reading the number from the HEST table. However,
> bios currently doesn't store a pointer to it.
> 
> For now just change the logic at table build time, while
> enforcing that it will behave like before with a single
> source ID.
> 
> A future patch will add a HEST table bios pointer and
> change the logic at acpi_ghes_record_errors() to
> dynamically use the new size.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

Took a fresh look. One trivial comment.


> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index e059317b002e..40f66792570c 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -889,6 +889,10 @@ static void acpi_align_size(GArray *blob, unsigned align)
>      g_array_set_size(blob, ROUND_UP(acpi_data_len(blob), align));
>  }
>  
> +static const AcpiNotificationSourceId hest_ghes_notify[] = {
> +    {ACPI_HEST_SRC_ID_SYNC, ACPI_GHES_NOTIFY_SEA},

    { ACPI_HEST_SRC_ID_SYNC, ACPI_GHES_NOTIFY_SEA },
seems to be local style.

> +};
> +
>  static
>  void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>  {
> @@ -944,6 +948,7 @@ void virt_acpi_build(VirtMachineState *vms, AcpiBuildTables *tables)
>      if (vms->ras) {
>          acpi_add_table(table_offsets, tables_blob);
>          acpi_build_hest(tables_blob, tables->hardware_errors, tables->linker,
> +                        hest_ghes_notify, ARRAY_SIZE(hest_ghes_notify),
>                          vms->oem_id, vms->oem_table_id);
>      }

