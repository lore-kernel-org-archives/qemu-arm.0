Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp856410njb;
        Fri, 18 Oct 2024 07:31:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWOum0srfd3b9q51Cwb2AVTVahQ4794WXqhhL/g4cj1nBV1TnVIDXvdLNiPmPsXeS1DG0XlZ6nBzXWGog==@linaro.org
X-Google-Smtp-Source: AGHT+IF1DdPM/updxoAfX42CeaoFDzVCoBID59QU1+r/3YxPpZrPoHKRsON9ovO4pSioS+hrSxgy
X-Received: by 2002:a05:690c:6c0c:b0:6e3:1fbe:9aa8 with SMTP id 00721157ae682-6e5bf9a11damr28730157b3.15.1729261884366;
        Fri, 18 Oct 2024 07:31:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729261884; cv=none;
        d=google.com; s=arc-20240605;
        b=gFjfHWoyP7nL3QDrQOiP7m2swMh3udAd9T2qlBcnPGodRf0LLR8N4P79W7JFNUtWT+
         txX2McvivyOGxXb1BUZBYGAEuU2A4zu/oWHjrNOLH6fVWsQ+upKnK+LlDOk1W5C+ZEt5
         YOgVg/OrlNwOqrOvmxTLmJ7caMyf3goHh0xWlJyeXnefvcRe4nSgc8sqFE21zIcsw+NA
         4fBYGaYq668YWIsG2EI0ns6Dys2ILU7iw0jFOcxQ51EhZKd/KwYHeHz3SVnBthpvjUw1
         XxmKhVJ0e/vyFnM4/Br7sxq8clarhKKQhPa3cG2MYzUuo8Oz5pD3qxNxNQRHpZSeU5Tg
         s82g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=3+ji3MmBbUmUohvZsWgk1CYJA2ndOfLEAFkTnf9i+v4=;
        fh=OlWpmpR6Wk/7umpPKS9Dksw4yuLYodUVWeTE5tUI5vs=;
        b=VCOhEVOtvx1NlsS6A0I1Y76adifLWswHAvz2eCxPNm8K6R3dkclnWZS4wZmI2YRAWX
         UXylngUveW/fZlTsgPf4jbBOgwvzTXmftlWUY3WaN4LcLmxLVdmRgNwN93pB/52d0FYA
         ZHNg453EtfniI0sXoGHjC0eG7uUDKFTxR73E9VuV8P/4aZ6rRfjw9i6YNwABxLXwMbMu
         TvG9Zoloou8DSR8FIZmQ5x5L3VFS4mbP/PnZPQg2uNnNuEHixSSY0s6Nlb8bG36rRhKp
         tQqyeD6ruW7oKN8Sagiw2D6YlVqV04NOSV18idcRglPXHQnziSikncIlmQ/rDec236+4
         GYoQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=N3c45qzX;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 00721157ae682-6e5c02076c0si10543777b3.197.2024.10.18.07.31.24
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 07:31:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=N3c45qzX;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729261884;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3+ji3MmBbUmUohvZsWgk1CYJA2ndOfLEAFkTnf9i+v4=;
	b=N3c45qzXEGx6Pr5+8XhmhcicRer2a1qSjlFAWeonlE3HCydIovjv/oEPneHoUCMjr6GgaO
	dbIy5csMOLjN4xQyaG9Y3xQdDr99Hf2rz19/ZPMaT9NUkWdjva7NFFRK4jj9qDXpyft3lT
	D8Ak0/mIkiKa8L1xB78jYc6HQqeT4wA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-518-rqxQLuIkOViv56x3Dr84qw-1; Fri, 18 Oct 2024 10:31:22 -0400
X-MC-Unique: rqxQLuIkOViv56x3Dr84qw-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43163a40ee0so4385595e9.0
        for <alex.bennee@linaro.org>; Fri, 18 Oct 2024 07:31:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729261881; x=1729866681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3+ji3MmBbUmUohvZsWgk1CYJA2ndOfLEAFkTnf9i+v4=;
        b=LlJpukWBCsiG2rZ+OaU3lcRvdpBqbNw8DqbWfXQ8tpj0e8XMds1fxW4MbzXk1YNaPX
         pZ9qdOORQLfGifTe5hwl/n7p6MNGcMgR7znHgltUHWfOrS5pWbgGDsvQFsSt8UU9KNBI
         q0SqGYn68cB8tdFtB0WjmdYEWabczuI+AmtuMivcBCGgD26A78hl+rDfbQ1OfueDFtpF
         0JYlx/O3+ndr1iW0prMbFYyB/swFPsp5Vcvd2ZCGBzGylb4SjVuWpWRiXScy22CwJTiI
         HsTIzgTaeZ2h9/CDllt/SXTsl7bbZfDqq0oCjGDD3LxEKmgc+4iwydNLuuNpL0tGRX10
         yX4Q==
X-Forwarded-Encrypted: i=1; AJvYcCV+x0+BN/bI3EjyFZN2+W1enjkjWDSlyfVG8ChITas4zBvuJu5+cvYfZg7h2tWPIAAh0jrRUspIj7r2Pg==@linaro.org
X-Gm-Message-State: AOJu0Yx0g8TtCW8ZhwMKPLKv3bXtwj1ayuhGEajGpSWbRZtDshl3sM+0
	keCBOBszW5XMVIXiLbt5p6sIXbiJgXHX+Cu0O5mpgUtslayTAzu6jNZxEYJqoqwg5IhpyZT6qaq
	spOF3R9ettM6ePFtRhdkR9mrGGh2au3Xeo98c+YodjbWReJ5vhAlvTA==
X-Received: by 2002:a05:600c:8719:b0:42c:ba83:3f0e with SMTP id 5b1f17b1804b1-431616331ddmr19890125e9.7.1729261881442;
        Fri, 18 Oct 2024 07:31:21 -0700 (PDT)
X-Received: by 2002:a05:600c:8719:b0:42c:ba83:3f0e with SMTP id 5b1f17b1804b1-431616331ddmr19889575e9.7.1729261880931;
        Fri, 18 Oct 2024 07:31:20 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ecf133885sm2085251f8f.108.2024.10.18.07.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 07:31:20 -0700 (PDT)
Date: Fri, 18 Oct 2024 16:31:18 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Salil Mehta <salil.mehta@huawei.com>
Cc: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <mst@redhat.com>,
 <maz@kernel.org>, <jean-philippe@linaro.org>,
 <jonathan.cameron@huawei.com>, <lpieralisi@kernel.org>,
 <peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
 <andrew.jones@linux.dev>, <david@redhat.com>, <philmd@linaro.org>,
 <eric.auger@redhat.com>, <will@kernel.org>, <ardb@kernel.org>,
 <oliver.upton@linux.dev>, <pbonzini@redhat.com>, <gshan@redhat.com>,
 <rafael@kernel.org>, <borntraeger@linux.ibm.com>, <alex.bennee@linaro.org>,
 <npiggin@gmail.com>, <harshpb@linux.ibm.com>, <linux@armlinux.org.uk>,
 <darren@os.amperecomputing.com>, <ilkka@os.amperecomputing.com>,
 <vishnu@os.amperecomputing.com>, <karl.heubaum@oracle.com>,
 <miguel.luis@oracle.com>, <salil.mehta@opnsrc.net>,
 <zhukeqian1@huawei.com>, <wangxiongfeng2@huawei.com>,
 <wangyanan55@huawei.com>, <jiakernel2@gmail.com>, <maobibo@loongson.cn>,
 <lixianglai@loongson.cn>, <shahuang@redhat.com>, <zhao1.liu@intel.com>,
 <linuxarm@huawei.com>, <gustavo.romero@linaro.org>
Subject: Re: [PATCH V1 4/4] hw/acpi: Populate vCPU Hotplug VMSD to migrate
 `is_{present,enabled}` states
Message-ID: <20241018163118.0ae01a84@imammedo.users.ipa.redhat.com>
In-Reply-To: <20241014192205.253479-5-salil.mehta@huawei.com>
References: <20241014192205.253479-1-salil.mehta@huawei.com>
	<20241014192205.253479-5-salil.mehta@huawei.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: xym3mxqr3QSb

On Mon, 14 Oct 2024 20:22:05 +0100
Salil Mehta <salil.mehta@huawei.com> wrote:

> The ACPI CPU hotplug states `is_{present, enabled}` must be migrated alongside
> other vCPU hotplug states to the destination VM. Therefore, they should be
> integrated into the existing CPU Hotplug VM State Description (VMSD) table.
> Depending on the architecture and its implementation of CPU hotplug events
> (such as ACPI GED, etc.), the CPU hotplug states should be populated
> appropriately within their corresponding subsections of the VMSD table.
> 
>     "acpi-ged (16)": {
>         "ged_state": {
>             "sel": "0x00000000"
>         },
>         [...]
>         "acpi-ged/cpuhp": {
>             "cpuhp_state": {
>                 "selector": "0x00000005",
>                 "command": "0x00",
>                 "devs": [
>                     {
>                         "is_inserting": false,
>                         "is_removing": false,
>                         "is_present": true,
>                         "is_enabled": true,
>                         "ost_event": "0x00000000",
>                         "ost_status": "0x00000000"
>                     },
>                     {
>                         "is_inserting": false,
>                         "is_removing": false,
>                         "is_present": true,
>                         "is_enabled": true,
>                         "ost_event": "0x00000000",
>                         "ost_status": "0x00000000"
>                     },
>                     {
>                         "is_inserting": false,
>                         "is_removing": false,
>                         "is_present": true,
>                         "is_enabled": true,
>                         "ost_event": "0x00000000",
>                         "ost_status": "0x00000000"
>                     },
>                     {
>                         "is_inserting": false,
>                         "is_removing": false,
>                         "is_present": true,
>                         "is_enabled": true,
>                         "ost_event": "0x00000000",
>                         "ost_status": "0x00000000"
>                     },
>                     {
>                         "is_inserting": false,
>                         "is_removing": false,
>                         "is_present": true,
>                         "is_enabled": false,
>                         "ost_event": "0x00000000",
>                         "ost_status": "0x00000000"
>                     },
>                     {
>                         "is_inserting": false,
>                         "is_removing": false,
>                         "is_present": true,
>                         "is_enabled": false,
>                         "ost_event": "0x00000000",
>                         "ost_status": "0x00000000"
>                     }
>                 ]
>             }
>         }
>     },
> 
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> ---
>  hw/acpi/cpu.c                  |  2 ++
>  hw/acpi/generic_event_device.c | 11 +++++++++++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c
> index 23ea2b9c70..d34c1e601e 100644
> --- a/hw/acpi/cpu.c
> +++ b/hw/acpi/cpu.c
> @@ -340,6 +340,8 @@ static const VMStateDescription vmstate_cpuhp_sts = {
>      .fields = (const VMStateField[]) {
>          VMSTATE_BOOL(is_inserting, AcpiCpuStatus),
>          VMSTATE_BOOL(is_removing, AcpiCpuStatus),
> +        VMSTATE_BOOL(is_present, AcpiCpuStatus),
> +        VMSTATE_BOOL(is_enabled, AcpiCpuStatus),

that's likely will break x86 migration,
but before bothering peterx, maybe we won't need this hunk if
is_enabled is migrated as part of vCPU state.

>          VMSTATE_UINT32(ost_event, AcpiCpuStatus),
>          VMSTATE_UINT32(ost_status, AcpiCpuStatus),
>          VMSTATE_END_OF_LIST()
> diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
> index 15b4c3ebbf..a4d78a534c 100644
> --- a/hw/acpi/generic_event_device.c
> +++ b/hw/acpi/generic_event_device.c
> @@ -331,6 +331,16 @@ static const VMStateDescription vmstate_memhp_state = {
>      }
>  };
>  
> +static const VMStateDescription vmstate_cpuhp_state = {
> +    .name = "acpi-ged/cpuhp",
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .fields      = (VMStateField[]) {
> +        VMSTATE_CPU_HOTPLUG(cpuhp_state, AcpiGedState),
> +        VMSTATE_END_OF_LIST()
> +    }
> +};

this subsection likely needs is_needed hook to avoid breaking
case where target doesn't have cpuhp support (older QEMU)

> +
>  static const VMStateDescription vmstate_ged_state = {
>      .name = "acpi-ged-state",
>      .version_id = 1,
> @@ -379,6 +389,7 @@ static const VMStateDescription vmstate_acpi_ged = {
>      },
>      .subsections = (const VMStateDescription * const []) {
>          &vmstate_memhp_state,
> +        &vmstate_cpuhp_state,
>          &vmstate_ghes_state,
>          NULL
>      }
