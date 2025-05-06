Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2798214njj;
        Mon, 5 May 2025 17:11:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWmCkn8p6J9OTlk7BEXtXviqZzp+vHKAyGNuEqVffH9RruxBjH1NThB73dJFUQergx39IJVWKbc87/r0Q==@linaro.org
X-Google-Smtp-Source: AGHT+IF257aFk5KQTFrF/LNiPT2RPjgJ3fcaRXgk1p0x1PxYk4rs5iDkb+oAmRsB/PgSXBqDlz6E
X-Received: by 2002:a05:622a:5913:b0:476:8d3d:adb6 with SMTP id d75a77b69052e-48dffdbf5dbmr169175641cf.23.1746490291307;
        Mon, 05 May 2025 17:11:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746490291; cv=none;
        d=google.com; s=arc-20240605;
        b=TnQKto/FoOTApshkzxbPhuIwu3mxe50a4XKg9/Tpg8YXvsgnXFzs5ZrJowQGdNaECH
         S26wh1plfRxIA6s2Q/c771SyovwC0HaMSi1WecydG7+0QrPF5T0sZBNuys87lv+ugDCS
         Tox0Tnjrr1hYNkkzTOJ6KSSQqJADRkSfW08uguWK09HQkjhNvcrWAyrveoZs7iqxF3pt
         niyDbo3Fea2jCyjZ2q3tK+b7EryAxbS1A6UI+U+dU+zJgc02tJ8Aq6SUq3srSUrvzVUN
         Srw2XoYpR57SbFAz0LtHS7lg1oFhlxHVjOKlPcY435ykCMnZgw6rW2NXSN7uuXR2Syiu
         meHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:content-language:references:cc:to:subject:from
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=rMlrkoDSa1JV/ScygbYcd3JhEPUBHPR5an3220OLAoU=;
        fh=WPwYnUrQO7ts7bLn4Jvz8MEFSGTI9DEBKFYRW/abp8g=;
        b=CG+JyJS5xCioSyaD85K1U6Yz2+M+Q3xfNshb88ie00b0lA1F+oVA1h4TpjwXFER8ng
         UR6gvaH0DNxIB4AO4IOxU9dTiJw8QtyKsaEhGcraYb1lgQhBHGadxU3H0mL5kzwLt2sO
         YZFshXnTdOkK/j73c1DXiASs+fUs8LYT+9N2I8ep+w0TgSzFfhI49vlwoeaGeuJycFlX
         /R/VEr4OXNPu6igRcBnVHdu9yeBWar/8dSBgk8DWkJobE/Y2RUlkzQFsscqXISOj72i2
         rPp3N55E2K3NqISh1nDALpDO0n5gv0IRlI5l386Os4RwF+kzxcWiaWZ6MYM6s+QByYWH
         gk8w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hrv+oGIY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-48b960ce20asi98940651cf.110.2025.05.05.17.11.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 May 2025 17:11:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hrv+oGIY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uC5tv-0004Yg-VS; Mon, 05 May 2025 20:11:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uC5tu-0004YL-RM
 for qemu-arm@nongnu.org; Mon, 05 May 2025 20:11:10 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uC5ts-00008D-D1
 for qemu-arm@nongnu.org; Mon, 05 May 2025 20:11:10 -0400
Received: by mail-pl1-x62d.google.com with SMTP id
 d9443c01a7336-22c3407a87aso74990965ad.3
 for <qemu-arm@nongnu.org>; Mon, 05 May 2025 17:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746490265; x=1747095065; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=rMlrkoDSa1JV/ScygbYcd3JhEPUBHPR5an3220OLAoU=;
 b=hrv+oGIYinvIpSi250ODmaWhDPpA0HIenKAeQpy1xtCLG17jv5qqrrVjkdKw21oKuD
 i7dQxAbjfy2q06MvpKCSQIs7DLX1Byl75V0AKcuutiEPLrnVEM2hxccXBaOEHZ2YFh9U
 e7je1bDKqYHgXlR6YP0XEoLayqrM+SLQKGIR1nq93pmztZnaiuDN8HC+fgOcDdMJBn8h
 TcKlc92/KDZNoTRDDt0lsgRqjbLHf8RfCW8FM+uHZUTTLPs5wWkbQ1Tu4odiMNMSzAa+
 1m3Ozr0Nw3alCRwDlEfJ3rA8wQFd1eaTcjagummB72EiXCb4R4+QFGfL6MmbduYSiGp9
 K67Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746490265; x=1747095065;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rMlrkoDSa1JV/ScygbYcd3JhEPUBHPR5an3220OLAoU=;
 b=iHFOTlkNQ4ax0l5qyUGdGB0K+yKL8anyJ5noLQODEFPVOdl9aiWuI0yD4Hh4Gv0u5p
 GpwWBd6iKrS3WfvmMxTuZ1bZNekKJ7Gq9nDDh02W/wrKnQye0Uh9ABAi2b/wBmGTiynj
 QV5mBV7W6lJOtL+OAE+ADgiVlq3CqC0AUCX3hbaH0UgECqVr5RVU+6DvMB+gF1IH3oUt
 Nz481Ug/nDmQcp4NeicEq3AKdCb0GR5TOFKFZEDjICeUU7PIoecExRNDY/LI8K0rslmG
 Yoze5sxmdAJdfQV3lp2IzvTM5xwa71k45uA8FZ5p1NKcUhwCXZC5OG/072vhkfmtrAsw
 Wzww==
X-Forwarded-Encrypted: i=1;
 AJvYcCXM7vjPTNMetbNG2wUWg6DcA1deVakeKTnFTzmAmuFEdNSumLJBzODjf6By8tV/UlLQjHnLGDxbWg==@nongnu.org
X-Gm-Message-State: AOJu0Ywq/ChwTQGmtxRMECxrEd0mCDBzkuEDoPP7UyVPOZ/whNWN76Ef
 jpNS6wSTiybk09lf7toql+c4fxCnQqg9YTO0Og1GgytS8qxzYZE4ArO4smUDzgc=
X-Gm-Gg: ASbGnctabK+13MjDtkwPER2+BrtIVNVWcjU7NR0Bea19sK8jtOINsaqOBe32eyQRdqV
 gdFFixCOAwjhXeQt5k9wsBUOp9d+F2Z4iHshvpzfntqlZwHVJ7RXqjE013EYP9CKsWMlwq9RHOb
 oD4DlIcdhCkjjzSserwWbO/oRUi9W9dNpJ8WBN7DmqfO+SVnKtMDS23lzLaO7FJawN3DfWoIJNB
 4Ubk+47hYpkdb9U7cht6BLD9yBtWv2f7jZvQJR5eFZ6QWSg6wIMvhvXz/m5xx53D3MkmZHIfwA0
 olje3E/cwurLLNYn7/G7/mxW9Ee5EnaEVDqXiaRXISlydMB0B/BjmeeDquql2df/kArlmnSX6c8
 +36tTurJscGVv1TdvEE0=
X-Received: by 2002:a17:902:ce02:b0:223:536d:f67b with SMTP id
 d9443c01a7336-22e1eaaf8ccmr172686835ad.38.1746490265450; 
 Mon, 05 May 2025 17:11:05 -0700 (PDT)
Received: from ?IPV6:2804:7f0:b400:8604:71fc:f75a:e2f5:e7b5?
 ([2804:7f0:b400:8604:71fc:f75a:e2f5:e7b5])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22e151e9f39sm61573215ad.84.2025.05.05.17.11.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 May 2025 17:11:05 -0700 (PDT)
Message-ID: <9d4514ad-5b23-44a9-9b3e-77fce9066092@linaro.org>
Date: Mon, 5 May 2025 21:11:00 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Gustavo Romero <gustavo.romero@linaro.org>
Subject: Re: [RFC 01/24] hw/pci/pcie_port: Fix pcie_slot_is_hotpluggbale_bus
 typo
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 imammedo@redhat.com, anisinha@redhat.com, mst@redhat.com,
 shannon.zhaosl@gmail.com
Cc: pbonzini@redhat.com, Jonathan.Cameron@huawei.com
References: <20250428102628.378046-1-eric.auger@redhat.com>
 <20250428102628.378046-2-eric.auger@redhat.com>
Content-Language: en-US
In-Reply-To: <20250428102628.378046-2-eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pl1-x62d.google.com
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
X-TUID: HeMNVG8+3Sjz

Hi Eric,

On 4/28/25 07:25, Eric Auger wrote:
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>   hw/pci/pcie_port.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/pci/pcie_port.c b/hw/pci/pcie_port.c
> index c73db30e98..072500ed34 100644
> --- a/hw/pci/pcie_port.c
> +++ b/hw/pci/pcie_port.c
> @@ -188,7 +188,7 @@ int pcie_count_ds_ports(PCIBus *bus)
>       return dsp_count;
>   }
>   
> -static bool pcie_slot_is_hotpluggbale_bus(HotplugHandler *plug_handler,
> +static bool pcie_slot_is_hotpluggable_bus(HotplugHandler *plug_handler,
>                                             BusState *bus)
>   {
>       PCIESlot *s = PCIE_SLOT(bus->parent);
> @@ -221,7 +221,7 @@ static void pcie_slot_class_init(ObjectClass *oc, void *data)
>       hc->plug = pcie_cap_slot_plug_cb;
>       hc->unplug = pcie_cap_slot_unplug_cb;
>       hc->unplug_request = pcie_cap_slot_unplug_request_cb;
> -    hc->is_hotpluggable_bus = pcie_slot_is_hotpluggbale_bus;
> +    hc->is_hotpluggable_bus = pcie_slot_is_hotpluggable_bus;
>   }
>   
>   static const TypeInfo pcie_slot_type_info = {

Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>


Cheers,
Gustavo
