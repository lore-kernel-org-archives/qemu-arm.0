Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp67732njk;
        Thu, 23 Jan 2025 03:00:43 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCU76dSgl2vuMUKjd4IUKQWqwwfpYbYAKbWafY5pRe78HVx72e2QZhKu6iPyxZWPEPd76xnFOQGukRwa1A==@linaro.org
X-Google-Smtp-Source: AGHT+IF+gs0yiUeTfqL2LD+m8ksB41DA7tYP83h99vpCIl4jGxrWX/DKuu+RP825b1e+MKmn8g4A
X-Received: by 2002:a05:6402:27c9:b0:5d3:cff5:635e with SMTP id 4fb4d7f45d1cf-5db7db0787cmr47961088a12.26.1737630043737;
        Thu, 23 Jan 2025 03:00:43 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1737630043; cv=pass;
        d=google.com; s=arc-20240605;
        b=h5bvnBjVsYa2v0nKCxLEYy62T8OqSJ++OedgOQ+jF+gloh5V2N5FK9OO1NsiYYxf6Z
         NHmCSNT9/MJxQM6EineGc3rd3ZTpuX8F6QFDW9pU5731ToIMuMqvyuyKok2yWk4/2QRT
         piwhvML/c51DEncKzBskeEe8ufWmm1YzzP6YBOz9WWlIfaCd4DF5bmyWbRZhlWYOSeli
         vl8FeDclFM5SVoRj7bk2S1TqbqjGeOQSlg2NHuOkmVXzL2OhWtMB4Yhgt5SzQ3GPd7qB
         mxto2H2dRn4IQp15gJlFZgx+cFTFxsj1c+rag5NHxAkviMp2NvE5oM1i7KCg3RNeN6QB
         NFKg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date;
        bh=PDZ9DV8uN20IDQ5PkvXcuzZJCV0I3nbbFDxCn9817XA=;
        fh=x6SPUvpsvGFZbQtxFiLTVvUyzmjHjQyaGsttOPkS3ow=;
        b=TG3QbyPx3eOrLtHfgPWynma3vLMY5PaiwN7Ne7jit+jSWKm4hlq9aKjThEJ9qucXUp
         Hz7j8+mE5DLNO3X5FO5G0lQbbbqtAe5uBWTYlC/9Tnpv0yt4s58+wVNSNRB8++dbAp/o
         4wdz2laW4QE1WPDjW9hwBA2rzjJjIpBp51pE9s10h0BiO41yMGX2RQ9h7pPWrj8D9/dT
         ZxbSdCTaFqJFbk11VGFLyouXGA66KSfuLvYufQYQgbTCzJpNxQ8gCmWKs+8mF33QYygO
         f+zQDlRgsNgyJabcVn/zoLMT3p2NjTSjxMFrdCBq+DbzJtYxrobg8k56bCkAooJ6w7S/
         ohuw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=huawei.com dmarc=pass fromdomain=huawei.com);
       spf=pass (google.com: domain of linux-kernel+bounces-486561-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="linux-kernel+bounces-486561-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=QUARANTINE) header.from=huawei.com
Return-Path: <linux-kernel+bounces-486561-alex.bennee=linaro.org@vger.kernel.org>
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org. [147.75.80.249])
        by mx.google.com with ESMTPS id 4fb4d7f45d1cf-5db73e5a331si10611212a12.181.2025.01.23.03.00.43
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 03:00:43 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-486561-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) client-ip=147.75.80.249;
Authentication-Results: mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=huawei.com dmarc=pass fromdomain=huawei.com);
       spf=pass (google.com: domain of linux-kernel+bounces-486561-alex.bennee=linaro.org@vger.kernel.org designates 147.75.80.249 as permitted sender) smtp.mailfrom="linux-kernel+bounces-486561-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=QUARANTINE) header.from=huawei.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 997511884FAE
	for <alex.bennee@linaro.org>; Thu, 23 Jan 2025 11:00:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBE6C20CCE3;
	Thu, 23 Jan 2025 11:00:38 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B5E1BC3F
	for <linux-kernel@vger.kernel.org>; Thu, 23 Jan 2025 11:00:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737630038; cv=none; b=vBCXVUjZGXoHtZFT/b5xlmZU+ui14ZhJDAxgye3tg+kVw0a24qo80UaBWapz71woh/ZLXg59AxeKhwsbXCW0m4JM4IGISiekLBYwu0jNl89WOmLoDdHaRKXilKVe7eTrx3hJ2X7NSwp4YNJ7Q04dIeBMGQZ2Rc/bQi/mAg4Z3Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737630038; c=relaxed/simple;
	bh=7ToR91lB4RyNv0w+g/DTk8met4d5DnC+kzTh9bOrceA=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jR19DWb8HDtzTQJWsIV+Wp2b5zXL+dpknQtQjaAxoorptJoBXtUFfSEzI7j7YQORt18B6l2JxSW6n2sHvNYaxifBYWWmrrQe2a1lnRVyLTi/6KKiP/XDEzx4PwKeM8HWc6DvnjY5VjS5J5KIu8bYc3O+O/XMQd5DugkpkqxAS+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Ydybx5zzHz6M4Nk;
	Thu, 23 Jan 2025 18:58:37 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id C9CD3140A70;
	Thu, 23 Jan 2025 19:00:34 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 23 Jan
 2025 12:00:34 +0100
Date: Thu, 23 Jan 2025 11:00:32 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC: Igor Mammedov <imammedo@redhat.com>, "Michael S . Tsirkin"
	<mst@redhat.com>, Shiju Jose <shiju.jose@huawei.com>, <qemu-arm@nongnu.org>,
	<qemu-devel@nongnu.org>, Ani Sinha <anisinha@redhat.com>, Dongjiu Geng
	<gengdongjiu1@gmail.com>, Eric Blake <eblake@redhat.com>, Markus Armbruster
	<armbru@redhat.com>, Michael Roth <michael.roth@amd.com>, Paolo Bonzini
	<pbonzini@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, "Shannon
 Zhao" <shannon.zhaosl@gmail.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 10/11] qapi/acpi-hest: add an interface to do generic
 CPER error injection
Message-ID: <20250123110032.000052d4@huawei.com>
In-Reply-To: <769b68a3192cc921fec4c0e5e925552920fdbe71.1737560101.git.mchehab+huawei@kernel.org>
References: <cover.1737560101.git.mchehab+huawei@kernel.org>
	<769b68a3192cc921fec4c0e5e925552920fdbe71.1737560101.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml500010.china.huawei.com (7.191.174.240) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: mkbS0xbUAwH8

On Wed, 22 Jan 2025 16:46:27 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Creates a QMP command to be used for generic ACPI APEI hardware error
> injection (HEST) via GHESv2, and add support for it for ARM guests.
> 
> Error injection uses ACPI_HEST_SRC_ID_QMP source ID to be platform
> independent. This is mapped at arch virt bindings, depending on the
> types supported by QEMU and by the BIOS. So, on ARM, this is supported
> via ACPI_GHES_NOTIFY_GPIO notification type.
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
> 
> ---
> 
> Changes since v9:
> - ARM source IDs renamed to reflect SYNC/ASYNC;
> - command name changed to better reflect what it does;
> - some improvements at JSON documentation;
> - add a check for QMP source at the notification logic.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Another bonus.

Few trivial formatting comments, otherwise looks fine to me.

Jonathan

> diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
> index 5d29db3918dd..cf83c959b5ef 100644
> --- a/hw/acpi/ghes.c
> +++ b/hw/acpi/ghes.c
> @@ -547,7 +547,7 @@ void ghes_record_cper_errors(const void *cper, size_t len,
>      /* Write the generic error data entry into guest memory */
>      cpu_physical_memory_write(cper_addr, cper, len);
>  
> -    notifier_list_notify(&acpi_generic_error_notifiers, NULL);
> +    notifier_list_notify(&acpi_generic_error_notifiers, &source_id);
>  }
>  
>  int acpi_ghes_memory_errors(uint16_t source_id, uint64_t physical_address)
> diff --git a/hw/acpi/ghes_cper.c b/hw/acpi/ghes_cper.c
> new file mode 100644
> index 000000000000..02c47b41b990
> --- /dev/null
> +++ b/hw/acpi/ghes_cper.c
> @@ -0,0 +1,32 @@
> +/*
> + * CPER payload parser for error injection
> + *
> + * Copyright(C) 2024 Huawei LTD.
> + *
> + * This code is licensed under the GPL version 2 or later. See the
> + * COPYING file in the top-level directory.
> + *
> + */
> +
> +#include "qemu/osdep.h"
> +
> +#include "qemu/base64.h"
> +#include "qemu/error-report.h"
> +#include "qemu/uuid.h"
> +#include "qapi/qapi-commands-acpi-hest.h"
> +#include "hw/acpi/ghes.h"
> +
> +void qmp_inject_ghes_error(const char *qmp_cper, Error **errp)
> +{
> +
Odd blank line that can go.

> +    uint8_t *cper;
> +    size_t  len;
> +
> +    cper = qbase64_decode(qmp_cper, -1, &len, errp);
> +    if (!cper) {
> +        error_setg(errp, "missing GHES CPER payload");
> +        return;
> +    }
> +
> +    ghes_record_cper_errors(cper, len, ACPI_HEST_SRC_ID_QMP, errp);
> +}
> diff --git a/hw/acpi/ghes_cper_stub.c b/hw/acpi/ghes_cper_stub.c
> new file mode 100644
> index 000000000000..8782e2c02fa8
> --- /dev/null
> +++ b/hw/acpi/ghes_cper_stub.c
> @@ -0,0 +1,19 @@
> +/*
> + * Stub interface for CPER payload parser for error injection
> + *
> + * Copyright(C) 2024 Huawei LTD.
> + *
> + * This code is licensed under the GPL version 2 or later. See the
> + * COPYING file in the top-level directory.
> + *
Trivial but I'd drop these trailing blank lines as they don't add
anything other than making people scroll further.

> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "qapi/qapi-commands-acpi-hest.h"
> +#include "hw/acpi/ghes.h"

Trivial but doe we need ghes.h?

> +
> +void qmp_inject_ghes_error(const char *cper, Error **errp)
> +{
> +    error_setg(errp, "GHES QMP error inject is not compiled in");
> +}

