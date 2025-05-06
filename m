Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2798371njj;
        Mon, 5 May 2025 17:11:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVq0W1M+DGfQsNovzwPyrhF1N6ALyTEne6q3eZwk4b2k5WIqg6PYl1SwfjTc4RwAaxwOaAZFuhi6Exc8A==@linaro.org
X-Google-Smtp-Source: AGHT+IEvri8R8Vco9aNxbXMzLQgljyEhURsc7rfTCDnNYJ7B2J1p0cOHbSOepik/lPliZvdTz3bo
X-Received: by 2002:a05:620a:2552:b0:7c5:4463:29a3 with SMTP id af79cd13be357-7caf11381a1mr161777385a.25.1746490314125;
        Mon, 05 May 2025 17:11:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746490314; cv=none;
        d=google.com; s=arc-20240605;
        b=bVXdmT5ByrMmIcmkKlY1NASlPhwGINFTgP1CEQMcdkm89ePaEkwE9ZEIKloaJ2zwKS
         OaE/Nk6sOM9M2F9IPQk9Ws+BxnncOQBEyzNaMSvzooM3K/6tARNA+EBQFI/IoQfi4wT0
         JF2p6+3dfFjDTQEnbsnJkHzd/rbGEi7pT6B/XzNcR4EVdVll5ipPnG9drV4dYba8/Bm3
         7aTpvNwPqrI4f3YXiQmfgU1MzJcRcO9CgBts0/YPv5UX2nHrviU+sPDY3J2b6DSKyy0S
         iVLsUVmzHcIUWNUtmI8/hpWfmn2Lr1Ii7yKGs+rY9LLsDnFhLYIpXmMNqsqVLGhongfc
         j1xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:content-language:references:cc:to:subject:from
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=a3YXeIUESEjfnloi8gualHdIywIy1WnTpQLCZFfcuFY=;
        fh=/9ct7/f7V/KObOkZRCrfWx0SmWx0P0CkN8g8TeOKPyQ=;
        b=d/27UZ5MIpLX+eAZx0wuzUyV/VdzeZKHfUFUXLuMLlvb5ydhkb1BBxgY+nNRlH5fd/
         poWu0coITvNjww54ewlPbPYRARyzJUDMgkoXxaPvhA4iPpsrT2LLq19l0uZRVhvsIyfo
         zjx6a0y+/16n1Tewg++XmePo6utO0/UqRlMsfUKrl8OswasFHE3RDxgOIIWxotgprJ71
         GQ39MczqkTuPsZWVv1UkootxzNyUqpiAYFokZkPRHsfeA+6+6D7LMvZYPTgwMa/2l08B
         Gd4O4xoMJ0b1WflqvwvHfYqQVgMSeTIhx5hGY/bOrrTMvgh2o8iET+aOKpqwebh3qwG7
         xOFw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="qLKrtn/Y";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7cad241ffbesi970370485a.298.2025.05.05.17.11.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 May 2025 17:11:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="qLKrtn/Y";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uC5uA-0004a8-9G; Mon, 05 May 2025 20:11:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uC5u8-0004Zi-95
 for qemu-arm@nongnu.org; Mon, 05 May 2025 20:11:24 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uC5u6-00008f-L3
 for qemu-arm@nongnu.org; Mon, 05 May 2025 20:11:24 -0400
Received: by mail-pf1-x429.google.com with SMTP id
 d2e1a72fcca58-739be717eddso4083178b3a.2
 for <qemu-arm@nongnu.org>; Mon, 05 May 2025 17:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746490281; x=1747095081; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=a3YXeIUESEjfnloi8gualHdIywIy1WnTpQLCZFfcuFY=;
 b=qLKrtn/YjHS3fTEIJeEVRcxsWYGommvCblTqBSn3VIXNsumui0eSHpZhfEvKNSQzva
 hsCK17SAzTqSeG/FunnOLnj/Vxn/0mAOe7wrgP/mdixV0rL5cFU03Fo2+lhXuNAp7W5d
 B8MbnbbAcxZxZn0pyaSkyc6LtirwyydwX4wmVdXL+ab93ksncmqS9WJbfI39IGOguE6x
 sD+CbMkVuTuAj2z1NerdfYTXxXyzCU3HmrC5Qw3V42u9ZTO12KNGxNsrDHu7tHlZExEH
 ETRjk6xa6m2UYNFcp3P6948GSE8Jb2vFJQlhLiIXI+DJYpNRGWheVDhgG/QknwjXo2IV
 M39w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746490281; x=1747095081;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a3YXeIUESEjfnloi8gualHdIywIy1WnTpQLCZFfcuFY=;
 b=JYbZZou96yZL8wVmCt2b+X/6Toaen4ujLkmKbZ+B1z753xmpMG+5s5JLYWFLqckuC5
 eUJ7z/i2K2qHhO/4sQ2zFIqumGwFV5WtsSY0Y4DGyTL74WStlPaVSOHtj3XtTZYRNAGP
 TfQVhAWaUE4CbzUrdLBCxCvA/5b44nSdICSncBXIrk3SMY8hMhDaudy6xtcIA3EY344S
 PBKCwavntNe0Iy/RYgkqX8PbmX97qCPLd5/PpS/QkjzU7IQQtxIugG1vh0jT4JBQ7UWU
 9/0k8PU6NxbHVxZ1dHLX19TmrevFWW3TbR6zQ/XQ1OLgeRahTZIddy3ivHF48hgpuENN
 1ewQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVieQHqNTOr019LANbuNo6Sygh/WcsaePJkJNL4st82FICEyspRSIHxdXp3k3QmO7DpbA42SRnu8Q==@nongnu.org
X-Gm-Message-State: AOJu0YyDuE0z1ztwcXoW5+kanljqubjUKTsmvKU60sAajkTv8SxSDj/R
 8m91K9DsK/QxuMHL1WKTcYg80ct1HhyFoyai1IchqU7RzJuPtRmH6RV8EzIMpQBx2SUb7Nk4Fg6
 Wpoo=
X-Gm-Gg: ASbGnctx0ac3Bn1ofMqcDVwckLRXGbD+sjqgB91cx+V/ITB8cST6OC5H6k8ABq+AlQf
 5XfUvJ9dDla1wpPLRvr1J1b3XYgIDtWrCIjhGUiyrrWprtmS8qb69edyp/shMa+JCnplYq0Yqgx
 KJUJSV9yfKOQUhNPJFNqJfvYNp6dRKlmLaP08DKJcR7Etj4ZN/VlQhM8UARJJHyOvVEDvHjmF7d
 GejZAJZSkbVL6+cV7LITc1OD8l66EVaqcFjKb/iDP8H0kO0bK67pkydgLONsZ6M4/LvvLD2Io/a
 yUaem9M0WNjh9pdwqX9UwjLS/kqURHBb4gk24cyuhXgMFrXUfUVAtlx7tgLK3t9NrVoxus1Vctc
 oSkUgpbLhFM1l79dRvHM=
X-Received: by 2002:a05:6a00:8d87:b0:73e:2dc5:a93c with SMTP id
 d2e1a72fcca58-74091a3c859mr1448028b3a.11.1746490281258; 
 Mon, 05 May 2025 17:11:21 -0700 (PDT)
Received: from ?IPV6:2804:7f0:b400:8604:71fc:f75a:e2f5:e7b5?
 ([2804:7f0:b400:8604:71fc:f75a:e2f5:e7b5])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74059020dedsm7781314b3a.91.2025.05.05.17.11.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 May 2025 17:11:20 -0700 (PDT)
Message-ID: <0213a059-48bd-4c90-96be-afb25ae46341@linaro.org>
Date: Mon, 5 May 2025 21:11:17 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Gustavo Romero <gustavo.romero@linaro.org>
Subject: Re: [RFC 02/24] hw/acpi/ged: Fix wrong identation
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 imammedo@redhat.com, anisinha@redhat.com, mst@redhat.com,
 shannon.zhaosl@gmail.com
Cc: pbonzini@redhat.com, Jonathan.Cameron@huawei.com
References: <20250428102628.378046-1-eric.auger@redhat.com>
 <20250428102628.378046-3-eric.auger@redhat.com>
Content-Language: en-US
In-Reply-To: <20250428102628.378046-3-eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pf1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: AQzCH6KIw5PF

Hi Eric,

On 4/28/25 07:25, Eric Auger wrote:
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>   hw/acpi/generic_event_device.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
> index c85d97ca37..7b2d582fff 100644
> --- a/hw/acpi/generic_event_device.c
> +++ b/hw/acpi/generic_event_device.c
> @@ -458,11 +458,11 @@ static void acpi_ged_initfn(Object *obj)
>        * container for memory hotplug IO and expose it as GED sysbus
>        * MMIO so that boards can map it separately.
>        */
> -     memory_region_init(&s->container_memhp, OBJECT(dev), "memhp container",
> -                        MEMORY_HOTPLUG_IO_LEN);
> -     sysbus_init_mmio(sbd, &s->container_memhp);
> -     acpi_memory_hotplug_init(&s->container_memhp, OBJECT(dev),
> -                              &s->memhp_state, 0);
> +    memory_region_init(&s->container_memhp, OBJECT(dev), "memhp container",
> +                       MEMORY_HOTPLUG_IO_LEN);
> +    sysbus_init_mmio(sbd, &s->container_memhp);
> +    acpi_memory_hotplug_init(&s->container_memhp, OBJECT(dev),
> +                             &s->memhp_state, 0);
>   
>       memory_region_init_io(&ged_st->regs, obj, &ged_regs_ops, ged_st,
>                             TYPE_ACPI_GED "-regs", ACPI_GED_REG_COUNT);

Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>


Cheers,
Gustavo
