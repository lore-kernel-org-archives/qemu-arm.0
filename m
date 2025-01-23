Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp102850njk;
        Thu, 23 Jan 2025 04:10:18 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCXOTwOZI/eHSlrVv9pS3Y/JRmfWq1kHwNl4yxvHMnrarYCS8lkG+K7hfcX3m03A7BmZEuWvhuKDaMBr6g==@linaro.org
X-Google-Smtp-Source: AGHT+IGZF3jZFblGhylTfSmaE3iYyJnRU3EYrj7UM2jSq+CT90RsTao6m2xDryAXySzW4hHl3FFB
X-Received: by 2002:a05:6122:3651:b0:51d:e6f6:deba with SMTP id 71dfb90a1353d-51de6f6e276mr16114603e0c.5.1737634218277;
        Thu, 23 Jan 2025 04:10:18 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1737634218; cv=pass;
        d=google.com; s=arc-20240605;
        b=VykjlNLq+A68BYacZCON/OVuZouyoH256RAnITgSvzuTQ7iVNCrEgFTkWwgSwgIZDY
         TfPcb/ng6Y80iKFA37qfUOfnqjiTSfv0LrjbA2gmWH0+PwGypC4FtavXop1icf2upW0S
         8eB/goMdKm+UT37ruN2CTwzqobNz3y6Tx2Huu4C+I0eu8w+8PAlvEm9iQM9SBG8vmgmB
         M/rPofuFm8fYGo3df3vClDorxbzFH8WxOV/zDWp1wWGxEpiVhwss+yyLlfjReIq1X/kQ
         nXbz2PfucbsGuSH8U6Yf2i3nW3A9PNSMztP2XcvJw9KwnFRAf+i3FwpdCz7B6tkpD12+
         yOlg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date;
        bh=oeSz/DFCnpsAy5TT/3mG8sYV5sQZoMm9cGeKypOcrNU=;
        fh=bTxaO08wtvbJXRrHkcGdgejP+oTHP3V5Nlsfit6+Mc8=;
        b=A5dupWzsUpV7CzLFGczZ53+ZnSvsxve3lDgcP8kTiyyFYCKvPJNUID3kkTxWU8ojVv
         dnbXw8OtdR1ySp54ftjhCR5jiHsIYEbqcoK+t7H+m237UgKoWC/AnKQXj+Wne/wHLD1W
         LeV1WNlhDAHwPEK6w7SWWgCvny1g7aQMTdGQBsajNMT+jkhYo/8finCYftN5KPQcBS/V
         DL65hNYDKXCj/EAmt6RyzUuyvmXaTA4jOL4WHL1pXKZ+U7sWhQF7hTIOgGfNje140lZn
         O7pZ3LytoDynTsjFFzwotCHwGDifAHdBy191taVjmcimOx03r/LlU06+Y8pTAjo0HkJc
         Fmjg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=huawei.com dmarc=pass fromdomain=huawei.com);
       spf=pass (google.com: domain of linux-kernel+bounces-486672-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="linux-kernel+bounces-486672-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <linux-kernel+bounces-486672-alex.bennee=linaro.org@vger.kernel.org>
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org. [147.75.199.223])
        by mx.google.com with ESMTPS id 71dfb90a1353d-51cf57d9ef2si4448673e0c.247.2025.01.23.04.10.18
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 04:10:18 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-486672-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) client-ip=147.75.199.223;
Authentication-Results: mx.google.com;
       arc=pass (i=1 spf=pass spfdomain=huawei.com dmarc=pass fromdomain=huawei.com);
       spf=pass (google.com: domain of linux-kernel+bounces-486672-alex.bennee=linaro.org@vger.kernel.org designates 147.75.199.223 as permitted sender) smtp.mailfrom="linux-kernel+bounces-486672-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=fail (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1616E167933
	for <alex.bennee@linaro.org>; Thu, 23 Jan 2025 12:10:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D64220E306;
	Thu, 23 Jan 2025 12:10:14 +0000 (UTC)
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com [185.176.79.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38E920DD72
	for <linux-kernel@vger.kernel.org>; Thu, 23 Jan 2025 12:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.176.79.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737634214; cv=none; b=bQG5ds2kbqT70I7OlWyK671BXMOd7GeazwpgBktxI2gPrisfj0I+oSmEclIKQdjh0T/FMiURCNw9SVH6XBAqaSjQWSA1CNOaW9WkYfV4gdjiSOpEmOjnmnFYm9d3lGDmhjsbo7t5yZLZ0j57P4fYsKlbfv2p6AwHD6fH3JRNHc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737634214; c=relaxed/simple;
	bh=Y9WZK2n6eorD0QmKnltHoU9Ghnt+w337b9VMn6xL95U=;
	h=Date:From:To:CC:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=AoL4IOXG7BDH2p6Xgq2qYIUVAuvVQEj5XwQjxvePhblDBAjwBlitpQmY8fOMdZVsyZnsFM90wQOw4dMY4M+iNlM60NPvEeUzFXx4dh33e2tihMXZWKkcHQnYyQWJJS+mNSlIFswHArSxzZszA3xZW+nWK9dNbuw7A81MlE7aBMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=185.176.79.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Yf0B65SKVz6JB7w;
	Thu, 23 Jan 2025 20:09:50 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 617D7140119;
	Thu, 23 Jan 2025 20:10:09 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 23 Jan
 2025 13:10:08 +0100
Date: Thu, 23 Jan 2025 12:10:07 +0000
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC: Igor Mammedov <imammedo@redhat.com>, "Michael S . Tsirkin"
	<mst@redhat.com>, Shiju Jose <shiju.jose@huawei.com>, <qemu-arm@nongnu.org>,
	<qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>, John Snow
	<jsnow@redhat.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 11/11] scripts/ghes_inject: add a script to generate
 GHES error inject
Message-ID: <20250123121007.000008a0@huawei.com>
In-Reply-To: <8c1f7e8e85f98aae26811ab88f8a85a3a51ff1f9.1737560101.git.mchehab+huawei@kernel.org>
References: <cover.1737560101.git.mchehab+huawei@kernel.org>
	<8c1f7e8e85f98aae26811ab88f8a85a3a51ff1f9.1737560101.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: lhrpeml500003.china.huawei.com (7.191.162.67) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: SCscaJVtT6Jc

On Wed, 22 Jan 2025 16:46:28 +0100
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Using the QMP GHESv2 API requires preparing a raw data array
> containing a CPER record.
> 
> Add a helper script with subcommands to prepare such data.
> 
> Currently, only ARM Processor error CPER record is supported.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
My Python is poor at best, so take that into account!

Some usage examples might be good to have as well.
Either in explicit docs or the patch description.

Jonathan


> ---
>  MAINTAINERS                    |   3 +
>  scripts/arm_processor_error.py | 377 ++++++++++++++++++
>  scripts/ghes_inject.py         |  51 +++
>  scripts/qmp_helper.py          | 702 +++++++++++++++++++++++++++++++++
>  4 files changed, 1133 insertions(+)
>  create mode 100644 scripts/arm_processor_error.py
>  create mode 100755 scripts/ghes_inject.py
>  create mode 100644 scripts/qmp_helper.py
> 

> diff --git a/scripts/qmp_helper.py b/scripts/qmp_helper.py
> new file mode 100644
> index 000000000000..357ebc6e8359
> --- /dev/null
> +++ b/scripts/qmp_helper.py



> +    def send_cper(self, notif_type, payload):
> +        """Send commands to QEMU though QMP TCP socket"""
> +
> +        # Fill CPER record header
> +
> +        # NOTE: bits 4 to 13 of block status contain the number of
> +        # data entries in the data section. This is currently unsupported.

Not controllable, so always set to 0 or 1?  Or not set?

...


> +        self.send_cper_raw(cper_data)
> +

Trivial but maybe can improve consistency on spacing.  1 or 2 lines
between functions. I don't care which.

> +
> +    def search_qom(self, path, prop, regex):

> +class cper_guid:
> +    """
> +    Contains CPER GUID, as per:
> +    https://uefi.org/specs/UEFI/2.10/Apx_N_Common_Platform_Error_Record.html
> +    """

> +
> +    CPER_PROC_X86 = guid(0xDC3EA0B0, 0xA144, 0x4797,

Maybe follow the spec naming as IA32_X64?

> +                         [0xB9, 0x5B, 0x53, 0xFA,
> +                          0x24, 0x2B, 0x6E, 0x1D])
> +
> +    CPER_PROC_ITANIUM = guid(0xe429faf1, 0x3cb7, 0x11d4,
> +                             [0xbc, 0xa7, 0x00, 0x80,

To stop people falling down a hole, maybe call out that this
is not the format in the spec which is weird for this one case.

> +                              0xc7, 0x3c, 0x88, 0x81])
> +

> +

> +
> +    CPER_PLATFORM_MEM2 = guid(0x61EC04FC, 0x48E6, 0xD813,
> +                              [0x25, 0xC9, 0x8D, 0xAA,
> +                               0x44, 0x75, 0x0B, 0x12])
Huh. they missed this one in the big spec table but is
there in N.2.6



> +    CPER_PCI_DEV = guid(0xEB5E4685, 0xCA66, 0x4769,
CPER_PCI_COMPONENT would match N.2.9 naming.
If I recall PCI terminology right, component covers a bunch
of things that Device doesn't.


> +                        [0xB6, 0xA2, 0x26, 0x06,
> +                         0x8B, 0x00, 0x13, 0x26])
> +
> +    CPER_FW_ERROR = guid(0x81212A96, 0x09ED, 0x4996,
Another one oddly missing from the big table but not the broken
out sections.  Not our problem but this chunk of the
spec could do with tidying up!

> +                         [0x94, 0x71, 0x8D, 0x72,
> +                          0x9C, 0x8E, 0x69, 0xED])
> +
> +    CPER_DMA_GENERIC = guid(0x5B51FEF7, 0xC79D, 0x4434,
CPER_DMAR
Nothing to do with DMA in general.  All about x86 IOMMUs I think.

> +                            [0x8F, 0x1B, 0xAA, 0x62,
> +                             0xDE, 0x3E, 0x2C, 0x64])
> +

> +
> +    CPER_CXL_PROT_ERR = guid(0x80B9EFB4, 0x52B5, 0x4DE3,
> +                             [0xA7, 0x77, 0x68, 0x78,
> +                              0x4B, 0x77, 0x10, 0x48])

Maybe add the one for FRU Memory poison from the new 2.11 UEFI spec.
This will constantly need updating with new specs so no problem
if you'd rather stick to 2.10 only for now.
 


