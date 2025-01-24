Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp775876njk;
        Fri, 24 Jan 2025 04:39:02 -0800 (PST)
X-Forwarded-Encrypted: i=3; AJvYcCWpyz1ShmQST4cK4VPn7XfECR1mAgJ1Zt8rpLQm7oIIacVlDmCd4qdYLg4hBQzZudTbotcnxdGw4Kq/Qg==@linaro.org
X-Google-Smtp-Source: AGHT+IH45ZzwQ5wzPn+2msD7tQYNci09U5U2PjMjT9lKrMSIIjYlloYVEIzOPo8TpJquRAu64qjH
X-Received: by 2002:a05:6a20:6a27:b0:1db:ec0f:5cf4 with SMTP id adf61e73a8af0-1eb215ec940mr42109720637.39.1737722342148;
        Fri, 24 Jan 2025 04:39:02 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1737722342; cv=pass;
        d=google.com; s=arc-20240605;
        b=hUuMHNev02Lsj3X5AkBBxDgtCDeEr361Z+2kX8ab1Qs0AvCM3qT6kcaCNF9gM82apb
         znI+T2KiQ9O5XFC9Pm/TH4nURDYDYDQZPIkzHoGKQRSAxirQg70dJCcAjQJ//MTfh1rA
         i9UwORIP1nijfd0EiJVQpsvNg6zulcLm7lrHlWHJVoV/17HV3BYVmxO0xWn29Unt6Vfo
         HjtFDYP8CdaeIDTidxdRC6E4OWvYlWdeQyLDQvgmM0jxCYjPWwO9GLGWORLE9Iw8hv2d
         nU6D+fr/e8KkLlE1uTRpwcvoPoOIQjMALkc8TEFrsiRysSPRLOvQN5rilXfQz8PbLWWN
         zfBg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:list-unsubscribe
         :list-subscribe:list-id:precedence:references:in-reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=/u9uz5233xcg3BDclrAoelnIrDNjGp/yo1G75N/4Gkc=;
        fh=JXr6pDePrZ+Kf73QNiDaW4uzQNLGYNPlf5vWeM6yCcs=;
        b=lzuyqNF1R6wmRT/fhBEtj6hlg6vY/LmiR5nqJDyliHftXSKlKGLMGdLYqewxdvcAOs
         fqk/LOGXSycIt+MQgiHUZqLnOaeGY7cL5DKTy0wIzygfG5ZRMB3loOrweKYCJhx9dHa0
         a8vMrSKNWZM0rlhRPf9I3O44uv7c0x7VJ8X9SPhySAOwmYuhxgOvVPQeXwi4MXsd860/
         lC9oocNSCqx4Xu/XlHJYg65Ohimq6gnYncqa6Zojd17q8mH7yARHei1Yi6ZwuD2fibxe
         nrqpPy/UgwNTnFqJHUx1cw9Uu2x4qIkCBz9OJqxKH+/VHuLhyUkEVgcdX4ID8XRACygE
         XNAg==;
        dara=google.com
ARC-Authentication-Results: i=2; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hB2w0fKt;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-487915-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-487915-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <linux-kernel+bounces-487915-alex.bennee=linaro.org@vger.kernel.org>
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org. [2604:1380:45e3:2400::1])
        by mx.google.com with ESMTPS id 41be03b00d2f7-ac497272e07si2616056a12.388.2025.01.24.04.39.01
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 04:39:02 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-kernel+bounces-487915-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) client-ip=2604:1380:45e3:2400::1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=hB2w0fKt;
       arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com dmarc=pass fromdomain=redhat.com);
       spf=pass (google.com: domain of linux-kernel+bounces-487915-alex.bennee=linaro.org@vger.kernel.org designates 2604:1380:45e3:2400::1 as permitted sender) smtp.mailfrom="linux-kernel+bounces-487915-alex.bennee=linaro.org@vger.kernel.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 968673AAFE2
	for <alex.bennee@linaro.org>; Fri, 24 Jan 2025 12:38:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3DB4721B199;
	Fri, 24 Jan 2025 12:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hB2w0fKt"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A7E21B1A7
	for <linux-kernel@vger.kernel.org>; Fri, 24 Jan 2025 12:38:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737722331; cv=none; b=qJuNoIvTmIgqz/DVHeZrXVsjCtxvdeaue8OwsPyQapnQDJCzOvMLzMSYCAyYsfKrADDqtDtkhcVvFEL+pLLZ12BlIfa0QZZ7ZHIozCv+EL/IBC+PtqpepZj3cKPO0cEUGcEBBUPFq2xX4wxa5lFjKDTOwprbBWC15qB0ABwHJqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737722331; c=relaxed/simple;
	bh=noe0YF+VyY5KpD/ukE1vGnyc3cyBj0IEbFgfte3WqjY=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BSei+S0Cl3sgBaRwTDKNeI/ZjE9P0pbE4hqcK7v8/6r3NQyYgY7H5TY1ShtW/Mrt3lxkYY9l3gQL5cBPoeOhSQ+CbzxCVMQKniJ1ivz3solzFGEypCYFxyMFMQf8PqxSsEYhH4LpHsbUmFlNfuek/GuWW00D30BA3etXp5HRWPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hB2w0fKt; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737722328;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/u9uz5233xcg3BDclrAoelnIrDNjGp/yo1G75N/4Gkc=;
	b=hB2w0fKtlM3VYOx7kAohGBCNb+TnT909otjT+G7Mh+vcJXDHtarc00hQ+FJFQXybv/wtJr
	ntTmmLh3ZPXRPLnXjdnHRjr9z1GncN19cBk9QMy9jaq7J398EHDLE5XC8jeOwon01SFN3U
	pAyySFPb1h0U3pjUThDFCUgtlRdz3vE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-425-lSxRKNx0Mf2hFImOydfXSw-1; Fri, 24 Jan 2025 07:38:47 -0500
X-MC-Unique: lSxRKNx0Mf2hFImOydfXSw-1
X-Mimecast-MFC-AGG-ID: lSxRKNx0Mf2hFImOydfXSw
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-38639b4f19cso1396308f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 24 Jan 2025 04:38:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737722326; x=1738327126;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/u9uz5233xcg3BDclrAoelnIrDNjGp/yo1G75N/4Gkc=;
        b=nc8T5aacdJBBZg51xcRboU1FK+QVFpYvA+FK5J/kJbYTWkdZYUh4pFeX9IboEYRInH
         lV1fCxafqYxviRy7RHGMVQs3fVUJKeGgZxSAbPvRL3IUdqIhwwXAjCKUgIPHxZi6B6oS
         0NfQY653YRqkdc+nYvb48ANW4E5sMbPCDv8DqVAbIGpfapbBmiMe6haQlRHDr5E8ysEK
         8a0sOfeGUJtEJijx16JMwoGcGWQB0E+FAUyZVlfHT/pGZ42rTUXSGDHH6550VGqGA0O8
         fzpEr53r/TVR5w9fu4U5D4tYuq2MzJYMM1n5+CwSxoS9su7F6Aln4T8gpPCMeuEVXp40
         MIRQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrC9B8Bi8HFwO1zxie+tKsYxBX8BM8X7Sfupffyhwq+Mo3RB1ddJVrsreciGErCID4VsMaIiIopyVWJUs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfBC+NpcaMXl9wYKZRMteg8NAuvbfJhoLJft+E4FoCRiaucvdt
	OtUJtSPSpjE/uOI4Fg1H9a3MwcnXjkd3uwqrUslPHNeP8NcNQJz4Lc6y9oXda8QPbRsKSYq7sMM
	SDuEMOR33iSBqChAsHxB1w/NN3G8tnWqhvVZ5sRcfPN5U6vLkxaBlRcgPuLz4ZA==
X-Gm-Gg: ASbGnctCObfhdVe2cQLwz64M2w/FBTqF3Y10BAWNRW6nBfvSkD5FEQ/S+5u4cWfvrWD
	rpYoMTocYtJxPNFYaMj4Em5CAXoHbst2hrwe8HY0wx+uyAOfaQMsfNs8fNbIVC4wRo56TN48NKe
	cbN5qWgGQ+SqNWuJeT5i/6ECqPRr6HB0bUvEgWy1nkc5HSUP/hedLjBCik7Vh21rF1116erOoR1
	g761vGZZRFuOzk6XhNRWxg2CzA/qLwLMh58Zy9ML/yozKuOo3aBGPReVwohFrTzmff6Z8MuAOmm
	sy8XXFxfWNhroH0pSoy41weXEA86smJisC4b/EanTw==
X-Received: by 2002:adf:cd82:0:b0:385:ee3f:5cbf with SMTP id ffacd0b85a97d-38bf565a596mr22190029f8f.20.1737722325898;
        Fri, 24 Jan 2025 04:38:45 -0800 (PST)
X-Received: by 2002:adf:cd82:0:b0:385:ee3f:5cbf with SMTP id ffacd0b85a97d-38bf565a596mr22190010f8f.20.1737722325491;
        Fri, 24 Jan 2025 04:38:45 -0800 (PST)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1bb0c9sm2591242f8f.78.2025.01.24.04.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 04:38:44 -0800 (PST)
Date: Fri, 24 Jan 2025 13:38:44 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jonathan Cameron
 <Jonathan.Cameron@huawei.com>, Shiju Jose <shiju.jose@huawei.com>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, Ani Sinha
 <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>, Eric Blake
 <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>, Michael Roth
 <michael.roth@amd.com>, Paolo Bonzini <pbonzini@redhat.com>, Peter Maydell
 <peter.maydell@linaro.org>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/11] qapi/acpi-hest: add an interface to do generic
 CPER error injection
Message-ID: <20250124133844.463a99c9@imammedo.users.ipa.redhat.com>
In-Reply-To: <769b68a3192cc921fec4c0e5e925552920fdbe71.1737560101.git.mchehab+huawei@kernel.org>
References: <cover.1737560101.git.mchehab+huawei@kernel.org>
	<769b68a3192cc921fec4c0e5e925552920fdbe71.1737560101.git.mchehab+huawei@kernel.org>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: FTxIgiRZB3JX

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

QMP is not my area, so just a cursory review

with nits below fixed up
  Acked-by: Igor Mammedov <imammedo@redhat.com>

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
> ---
>  MAINTAINERS              |  7 +++++++
>  hw/acpi/Kconfig          |  5 +++++
>  hw/acpi/ghes.c           |  2 +-
>  hw/acpi/ghes_cper.c      | 32 ++++++++++++++++++++++++++++++++
>  hw/acpi/ghes_cper_stub.c | 19 +++++++++++++++++++
>  hw/acpi/meson.build      |  2 ++
>  hw/arm/virt-acpi-build.c |  1 +
>  hw/arm/virt.c            |  7 +++++++
>  include/hw/acpi/ghes.h   |  1 +
>  include/hw/arm/virt.h    |  1 +
>  qapi/acpi-hest.json      | 35 +++++++++++++++++++++++++++++++++++
>  qapi/meson.build         |  1 +
>  qapi/qapi-schema.json    |  1 +
>  13 files changed, 113 insertions(+), 1 deletion(-)
>  create mode 100644 hw/acpi/ghes_cper.c
>  create mode 100644 hw/acpi/ghes_cper_stub.c
>  create mode 100644 qapi/acpi-hest.json
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 846b81e3ec03..8e1f662fa0e0 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2075,6 +2075,13 @@ F: hw/acpi/ghes.c
>  F: include/hw/acpi/ghes.h
>  F: docs/specs/acpi_hest_ghes.rst
>  
> +ACPI/HEST/GHES/ARM processor CPER
> +R: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> +S: Maintained
> +F: hw/arm/ghes_cper.c
> +F: hw/acpi/ghes_cper_stub.c
> +F: qapi/acpi-hest.json
> +
>  ppc4xx
>  L: qemu-ppc@nongnu.org
>  S: Orphan
> diff --git a/hw/acpi/Kconfig b/hw/acpi/Kconfig
> index 1d4e9f0845c0..daabbe6cd11e 100644
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
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "qapi/qapi-commands-acpi-hest.h"
> +#include "hw/acpi/ghes.h"
> +
> +void qmp_inject_ghes_error(const char *cper, Error **errp)
> +{
> +    error_setg(errp, "GHES QMP error inject is not compiled in");
> +}
> diff --git a/hw/acpi/meson.build b/hw/acpi/meson.build
> index 73f02b96912b..56b5d1ec9691 100644
> --- a/hw/acpi/meson.build
> +++ b/hw/acpi/meson.build
> @@ -34,4 +34,6 @@ endif
>  system_ss.add(when: 'CONFIG_ACPI', if_false: files('acpi-stub.c', 'aml-build-stub.c', 'ghes-stub.c', 'acpi_interface.c'))
>  system_ss.add(when: 'CONFIG_ACPI_PCI_BRIDGE', if_false: files('pci-bridge-stub.c'))
>  system_ss.add_all(when: 'CONFIG_ACPI', if_true: acpi_ss)
> +system_ss.add(when: 'CONFIG_GHES_CPER', if_true: files('ghes_cper.c'))
> +system_ss.add(when: 'CONFIG_GHES_CPER', if_false: files('ghes_cper_stub.c'))
>  system_ss.add(files('acpi-qmp-cmds.c'))
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index ae60268bdcc2..d094212ce584 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -896,6 +896,7 @@ static void acpi_align_size(GArray *blob, unsigned align)
>  
>  static const AcpiNotificationSourceId hest_ghes_notify[] = {
>      { ACPI_HEST_SRC_ID_SYNC, ACPI_GHES_NOTIFY_SEA },
> +    { ACPI_HEST_SRC_ID_QMP, ACPI_GHES_NOTIFY_GPIO },
>  };
>  
>  static const AcpiNotificationSourceId hest_ghes_notify_9_2[] = {
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index e272b35ea114..9074a540197d 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -1012,6 +1012,13 @@ static void virt_powerdown_req(Notifier *n, void *opaque)
>  
>  static void virt_generic_error_req(Notifier *n, void *opaque)
>  {
> +    uint16_t *source_id = opaque;
> +
> +    /* Currently, only QMP source ID is async */
> +    if (*source_id != ACPI_HEST_SRC_ID_QMP) {
> +        return;
> +    }
> +
>      VirtMachineState *s = container_of(n, VirtMachineState, generic_error_notifier);
>  
>      acpi_send_event(s->acpi_dev, ACPI_GENERIC_ERROR);
> diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
> index 64fe2b5bea65..078d78666f91 100644
> --- a/include/hw/acpi/ghes.h
> +++ b/include/hw/acpi/ghes.h
> @@ -72,6 +72,7 @@ typedef struct AcpiGhesState {
>   */
>  enum AcpiGhesSourceID {
>      ACPI_HEST_SRC_ID_SYNC,
> +    ACPI_HEST_SRC_ID_QMP,       /* Use it only for QMP injected errors */
>  };
>  
>  typedef struct AcpiNotificationSourceId {
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index f3cf28436770..56f270f61cf5 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -33,6 +33,7 @@
>  #include "exec/hwaddr.h"
>  #include "qemu/notify.h"
>  #include "hw/boards.h"
> +#include "hw/acpi/ghes.h"
>  #include "hw/arm/boot.h"
>  #include "hw/arm/bsa.h"
>  #include "hw/block/flash.h"
> diff --git a/qapi/acpi-hest.json b/qapi/acpi-hest.json
> new file mode 100644
> index 000000000000..d58fba485180
> --- /dev/null
> +++ b/qapi/acpi-hest.json
> @@ -0,0 +1,35 @@
> +# -*- Mode: Python -*-
> +# vim: filetype=python
> +
> +##
> +# == GHESv2 CPER Error Injection
> +#
> +# Defined since ACPI Specification 6.1,
> +# section 18.3.2.8 Generic Hardware Error Source version 2. See:
> +#
> +# https://uefi.org/sites/default/files/resources/ACPI_6_1.pdf
> +##
> +
> +
> +##
> +# @inject-ghes-error:
> +#
> +# Inject an error with additional ACPI 6.1 GHESv2 error information
> +#
> +# @cper: contains a base64 encoded string with raw data for a single
> +#     CPER record with Generic Error Status Block, Generic Error Data
> +#     Entry and generic error data payload, as described at
> +#     https://uefi.org/specs/UEFI/2.10/Apx_N_Common_Platform_Error_Record.html#format
> +#
> +# Features:
> +#
> +# @unstable: This command is experimental.
> +#
> +# Since: 9.2

10.0

> +##
> +{ 'command': 'inject-ghes-error',

s/ghes/ghes-v2/


> +  'data': {
> +    'cper': 'str'
> +  },
> +  'features': [ 'unstable' ]
> +}
> diff --git a/qapi/meson.build b/qapi/meson.build
> index e7bc54e5d047..35cea6147262 100644
> --- a/qapi/meson.build
> +++ b/qapi/meson.build
> @@ -59,6 +59,7 @@ qapi_all_modules = [
>  if have_system
>    qapi_all_modules += [
>      'acpi',
> +    'acpi-hest',
>      'audio',
>      'cryptodev',
>      'qdev',
> diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json
> index b1581988e4eb..baf19ab73afe 100644
> --- a/qapi/qapi-schema.json
> +++ b/qapi/qapi-schema.json
> @@ -75,6 +75,7 @@
>  { 'include': 'misc-target.json' }
>  { 'include': 'audio.json' }
>  { 'include': 'acpi.json' }
> +{ 'include': 'acpi-hest.json' }
>  { 'include': 'pci.json' }
>  { 'include': 'stats.json' }
>  { 'include': 'virtio.json' }

