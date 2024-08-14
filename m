Received: by 2002:a17:504:9188:b0:1be9:327d:8ee3 with SMTP id i8csp489012njf;
        Wed, 14 Aug 2024 06:53:33 -0700 (PDT)
X-Forwarded-Encrypted: i=3; AJvYcCVj1d9eL3GlKirKUamFZxqoiXFM0b2WvH3bdvVUZ+KPMsEHWE2ZHK/s5R0mja6hpytmBqCsYHSNDCLBs7POLq36qqTA5PH4
X-Google-Smtp-Source: AGHT+IE9Yl6NVsGwhDs+lpbDDrsANjWGBbfJL1/5BBAHzNAow6LwDJl6V3U+z0GZIxaG9gokwMLP
X-Received: by 2002:a05:690c:7208:b0:64a:f40d:5fd2 with SMTP id 00721157ae682-6ac97b0f1f6mr40714667b3.12.1723643612817;
        Wed, 14 Aug 2024 06:53:32 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1723643612; cv=pass;
        d=google.com; s=arc-20160816;
        b=RyNaUVnnfX/t8fhJBLYu0OlH/g9cawEadErvOnB9tdnh9HOWmwxILpA3ClSdsWpF5M
         LT0s2Hp08Uhv6r4Mx9wjfyOBcdfdUgHG/pJKPctnNwpmnf835Xrf9XEJQxmW8FF5yWvi
         UqQpYR/jwHgpTXXAvWsCi14STlT8tsJP/xwAQPGRiA+EgQ45188EwwqosD2UjgxPogJu
         0Y6G5/hpAMQtwUFV43dCZ0MafzHJqL29s6Pd52yb4zlgw5yI+dqEYkI460GJyd+fIdWm
         54RCB/TgT4uABqNsqkDNFYLpvLbzWULcvldizk4wLIlzcaQkwUQY6aiTmhknLT/s+gk8
         2WNA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date;
        bh=JiafyHA1I2SHAJ1bmEvkGRb7J0KIJDyOZElPcrsXVbU=;
        fh=ErPUviK2DCjVwVqdFIMqzzTdbuAYPXVUrcKSm5WVsxU=;
        b=Tffty0Me7ue/RcqJb5a/WKhVPvRyJ0vqR0iFHA/3BHYNrrWp2EBxhp/KjjpSdUKIga
         Du12lSuLXcMWfin3kRMEmqAy8l3nuPd3+gEgIe0Vlfsf/fEnlZOIYEu7Te7fJygO49Nl
         mZnmKdXKSG8LvbOAVoqz/IOrGNimvmXWLa3ZAlwuKvmI/ivUHX7q1On6gmdvjbCKB5HF
         rPFCnUV7Hi3MqgiUpB4CSNK5udeVEblHjblVOEEsnz9CPBsy1tNeh6wCFhQ334uDm934
         5pa8Yl18dhZFXdc2y5yzztp2YLnrpGkfEMJmiCTpuxw0kkzH0j2FQK5jUXAzAqsaFbkp
         nnuw==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=huawei.com dmarc=pass fromdomain=huawei.com);
       spf=pass (google.com: domain of linux-kernel+bounces-286542-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="linux-kernel+bounces-286542-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=QUARANTINE) header.from=huawei.com
Return-Path: <linux-kernel+bounces-286542-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [147.75.199.223])
        by mx.google.com with ESMTPS id 6a1803df08f44-6bd82c60949si24133956d6.55.2024.08.14.06.53.32
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2024 06:53:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-286542-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) client-ip=147.75.199.223;
Authentication-Results: mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=huawei.com dmarc=pass fromdomain=huawei.com);
       spf=pass (google.com: domain of linux-kernel+bounces-286542-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="linux-kernel+bounces-286542-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=QUARANTINE) header.from=huawei.com
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D7041C22DE4
	for <alex.bennee@linaro.org>; Wed, 14 Aug 2024 13:53:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 910DD186A;
	Wed, 14 Aug 2024 13:53:30 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D53881B0126
	for <linux-kernel@vger.kernel.org>; Wed, 14 Aug 2024 13:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723643610; cv=none; b=CpyhbAFP0onR33BA5m8fshnhlQaIOYmmSMiq9LRMZlrfIhLwGsJApA+5jqyVBs8bYm40Pq7p7RIu9pvVDflNm6Po0KZ6CfAs+UPe3qcYnBzpL3+1LO5kp9ZV+7vQN4h9JTaTEhxbdLhp11HgzDCytdCbEL4loudGxTDdCXbZerg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723643610; c=relaxed/simple;
	bh=4nLAUq5Wbs/w8LUTj/K9xp3NXFMBG/xWFnlIk9pIwnU=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CG2OnFv0tzeFYm/2TNyoZzmGs1eeQxrrw94bJfm49EdIOuIZY5a+9Z6HVo7/by0iB18NFNNkBfrZmyKCPOdtjhLfKOr8QGfadOcumERlENnc6Vn4HVZ7OoDoA7TWHHNwiL18OdGFcv9T92z3vCOpo+99pp+iyN5Hg9AiqKXbG+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=Huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WkV5L2JYbz6JBCj;
	Wed, 14 Aug 2024 21:50:46 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 99BFE140B33;
	Wed, 14 Aug 2024 21:53:24 +0800 (CST)
Received: from localhost (10.203.177.66) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 14 Aug
 2024 14:53:24 +0100
Date: Wed, 14 Aug 2024 14:53:22 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC: Shiju Jose <shiju.jose@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	Ani Sinha <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>, Eric
 Blake <eblake@redhat.com>, Igor Mammedov <imammedo@redhat.com>, Markus
 Armbruster <armbru@redhat.com>, Michael Roth <michael.roth@amd.com>, Paolo
 Bonzini <pbonzini@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
	<linux-kernel@vger.kernel.org>, <qemu-arm@nongnu.org>,
	<qemu-devel@nongnu.org>
Subject: Re: [PATCH v7 04/10] qapi/acpi-hest: add an interface to do generic
 CPER error injection
Message-ID: <20240814145322.00002dcb@Huawei.com>
In-Reply-To: <c44e6c39e6cf95a738999b721cdf71e4887258a9.1723591201.git.mchehab+huawei@kernel.org>
References: <cover.1723591201.git.mchehab+huawei@kernel.org>
	<c44e6c39e6cf95a738999b721cdf71e4887258a9.1723591201.git.mchehab+huawei@kernel.org>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml100001.china.huawei.com (7.191.160.183) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-TUID: Wa3mWtNFcCiZ

On Wed, 14 Aug 2024 01:23:26 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Creates a QMP command to be used for generic ACPI APEI hardware error
> injection (HEST) via GHESv2.
> 
> The actual GHES code will be added at the followup patch.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> Signed-off-by: Shiju Jose <shiju.jose@huawei.com>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

A few trivial things from a quick glance at this
(to remind myself of how this fits together).

> diff --git a/hw/acpi/Kconfig b/hw/acpi/Kconfig
> index e07d3204eb36..73ffbb82c150 100644
> --- a/hw/acpi/Kconfig
> +++ b/hw/acpi/Kconfig
> @@ -51,6 +51,11 @@ config ACPI_APEI
>      bool
>      depends on ACPI
>  
> +config GHES_CPER
> +    bool
> +    depends on ACPI_APEI
> +    default y
> +
>  config ACPI_PCI
>      bool
>      depends on ACPI && PCI
> diff --git a/hw/acpi/ghes_cper.c b/hw/acpi/ghes_cper.c
> new file mode 100644
> index 000000000000..92ca84d738de
> --- /dev/null
> +++ b/hw/acpi/ghes_cper.c
> @@ -0,0 +1,33 @@

> +#include "qapi/qapi-commands-acpi-hest.h"
> +#include "hw/acpi/ghes.h"
> +
> +void qmp_ghes_cper(const char *qmp_cper,
> +                   Error **errp)
That's a very short line wrap.

> +{
> +
> +    uint8_t *cper;
> +    size_t  len;
> +
> +    cper = qbase64_decode(qmp_cper, -1, &len, errp);
> +    if (!cper) {
> +        error_setg(errp, "missing GHES CPER payload");
> +        return;
> +    }
> +
> +    /* TODO: call a function at ghes */
> +}

> diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
> index 419a97d5cbd9..99d12d69c864 100644
> --- a/include/hw/acpi/ghes.h
> +++ b/include/hw/acpi/ghes.h
> @@ -23,6 +23,7 @@
>  #define ACPI_GHES_H
>  
>  #include "hw/acpi/bios-linker-loader.h"
> +#include "qapi/error.h"
Odd to have an include added with no other changes in file?
Wrong patch maybe?  Or should it be included by a c file instead?
>  #include "qemu/notify.h"
>  
>  extern NotifierList acpi_generic_error_notifiers;
> diff --git a/qapi/acpi-hest.json b/qapi/acpi-hest.json


