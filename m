Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2799329njj;
        Mon, 5 May 2025 17:13:54 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV2zL33KEjJESKd1kxXKXJP6Ln2IGUTtCGGwjZvVkCbcp/B5sI6YQwlVP/ZPwBz/BCr8ayjtljBcD2aSQ==@linaro.org
X-Google-Smtp-Source: AGHT+IF1PO9beZnufvC+mHafRR5svmUl6Pwo/nTA/tZfCMFtfgXlav8mzOH3fogRAP6ucpyCYq9t
X-Received: by 2002:a05:620a:6883:b0:7c5:562d:ccf8 with SMTP id af79cd13be357-7caf110d324mr171917085a.8.1746490434240;
        Mon, 05 May 2025 17:13:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746490434; cv=none;
        d=google.com; s=arc-20240605;
        b=GlgEmUoO60R0MCbo3yHcl5L3g3ZiEb3EUbqfYi4SuRBlBVeszNcPZRq/UHFpl5elID
         txkYd2liPfQGc0OsCZugyGdumMqaBP335nfj/VTPK6WGlyyGqxfxB18FsWGTmwUBH78j
         wC0SJpsuW1faYegv6k/1h3/6z32LF0NI5ec05KVlZCv/HzOuzBLrHIHr5Yb5mgCPb3Zi
         sCoL0az4JK56mGvVkphbXHH0jTX4j/zY7jA5KOixqdRxRxYWO/hpPaixWElGeDtprrk2
         lVFxqd+C5umVW5mjsqBUvPgYelh0UqlEWyTaJZtvJ1k8cJAOBqT56/Df09bp2Efqr4rD
         zVAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:content-language:references:cc:to:subject:from
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=7tMzkpLpD5LRZmab/4DzH4SXMTJDCn4ory0YOGcHN3M=;
        fh=qdKw9yHxgyCyLAYaesGc3rOx3YMWHZftQzSWSPSUxY0=;
        b=HjttwTJ1bjxVlOwYHpFvT0xqqEMe10gonksU0rUEG9WozN/HdHadcC0VHHZ8E9ou7b
         AuVaM0HpM+5yNv2yvvIPu6WPpvpB9kRosH4mkOZzoWqUsj+8vWMWTKSwQyUvQ5fWqUUv
         zpWfztQLFm6Ah1uMX3BPLewh7YFCYXaTNCR58c34fs8NVeg+LToH9ftwiVSWPMpottRa
         SolX9LTY8Aunsd9dbdW1YLioS+mR9Rof1uE2/VI9M/G0hnI91SChTRBqZd6C8u+853+N
         jGch9N5NERsY2+Im0UlGvNF0gI+4UpwdyhMXIAI67DrJVYVNJ82kkVS6EBbTyq4lV6vf
         4Yaw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wm70vdWs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7cad2446887si968751285a.520.2025.05.05.17.13.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 May 2025 17:13:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wm70vdWs;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uC5wS-0008Tm-Ns; Mon, 05 May 2025 20:13:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uC5wP-0008PV-TJ
 for qemu-arm@nongnu.org; Mon, 05 May 2025 20:13:46 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uC5wN-0000FU-NR
 for qemu-arm@nongnu.org; Mon, 05 May 2025 20:13:45 -0400
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-739b3fe7ce8so4586540b3a.0
 for <qemu-arm@nongnu.org>; Mon, 05 May 2025 17:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746490421; x=1747095221; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=7tMzkpLpD5LRZmab/4DzH4SXMTJDCn4ory0YOGcHN3M=;
 b=wm70vdWsHdMHjR7Jrtw8e6wZ0hnn+9YNtKNDp4JFyWxYReAmZUZktMgNpDHWqXvbE4
 MeW1a/Rtd/GLjwP5NWnyLG4qhAf/RTF5rVGuefzdgtQrWvSm80jyMLWNvP1iZoG3z+c4
 RUan0108VcV/Ots1ID3BhWhVMWxOUaXfwCRPJecURriX3zf8j8Vsk5Nexw2GqOocgJsh
 QIrLNIFItY6B1KQ2BZkCm0HH6ZnEwKH3y4UW+tz/iN/1T4ZoTsCrKN0Snd4AW0hSwsfz
 gVGN0RBUusZoJ/HpunzkoEoXy9Evq9gWRcVDyEC9pbMZrdkXCxatvaii3LVb4Fh9meHm
 UpUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746490421; x=1747095221;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7tMzkpLpD5LRZmab/4DzH4SXMTJDCn4ory0YOGcHN3M=;
 b=RYr/5B/b0LM8tRNWvvHRjVPi0PDt0N3vyJIiRHFI8bH9yK2l2WgnrRgw7A1ZVJBLtL
 QTyUTWN7uG/YGxzDYyyG0Ge7pfx2eDE3PH7HiRG/P3br6AiNTYB2NwX4ZWAYfgJ23rOP
 QQ7ofaTdWvrySMHgITzl0Hk4/bFCryxYW++2Pzi4oFhkJuwTGzfFy/mdOiKdLX3XrokJ
 GkQG6ofzLASMOIrY/Lnm8mjyITncR6bxZg8b7AYdzkSJPOHMWVhhUgQ2PU6X+SRM8n7V
 /r6k7MB6IUl6QYCzVQ+v1hMYeBUb6pb8PxJNt7Oc8V5VsoakYywYL1+w6e/yw1Ks/NQW
 GttA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWd3BC6jmydFzlG/pHM7p+anlK4w+X3YejT0Fb17sazMcMR5Ldwu1eDAokrEgXLa+8Ts8VWwP7WCQ==@nongnu.org
X-Gm-Message-State: AOJu0YyF4b3Kk24A+c60mmycrgbW+8NSjriSrqpMdTJB9rnr8s5EZKWF
 BioaHPbj15qhkiDqVJYcLWwE5xjCg86n4vZajowyzZYNXK95SET4xf6+NcPIQ6c=
X-Gm-Gg: ASbGncveAdOEZXrGyhcHURPQH5GaKwdftAX9wnsG15UtzhWEDIUquxZjQAX6CTyprP1
 Xkuj/+YiCJPyjVyIy5ng84wp6jYrTo4bYFZdWZtwDyoGXQq2nOGasNVgZIJ9mR5e7PzxTLhXVEe
 0YM2Sj+bLtEgD9ejrzpZPthF57rG6fRcMpGTebfSkYtgpOkkYnUHaNhXTUiwPJUKkFyHr2mz6SC
 n8r2nsg7PIGbD9J8TFg6oUdTlqdWpV6VK65DiLKx4kSfGP/Qb37BExDWiJvN7nmIl22Ro6jlXAY
 jcYIxEfe0JdSvjhvcvvqvupEKp3fqJTSCfnrpA2YvQM3nFl41DKFy3oqcSn1pI05ZOUAOm7BrID
 rK+QACiBzMau/iIoUhqU=
X-Received: by 2002:a05:6a00:6314:b0:740:91e4:8107 with SMTP id
 d2e1a72fcca58-74091e481e1mr970010b3a.0.1746490421122; 
 Mon, 05 May 2025 17:13:41 -0700 (PDT)
Received: from ?IPV6:2804:7f0:b400:8604:71fc:f75a:e2f5:e7b5?
 ([2804:7f0:b400:8604:71fc:f75a:e2f5:e7b5])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74059020faesm7805760b3a.95.2025.05.05.17.13.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 May 2025 17:13:40 -0700 (PDT)
Message-ID: <1b19582a-3587-486b-9794-b60d70b12a1f@linaro.org>
Date: Mon, 5 May 2025 21:13:35 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Gustavo Romero <gustavo.romero@linaro.org>
Subject: Re: [RFC 09/24] hw/pci-host/gpex-acpi: Propagate hotplug type info
 from virt machine downto gpex
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 imammedo@redhat.com, anisinha@redhat.com, mst@redhat.com,
 shannon.zhaosl@gmail.com
Cc: pbonzini@redhat.com, Jonathan.Cameron@huawei.com
References: <20250428102628.378046-1-eric.auger@redhat.com>
 <20250428102628.378046-10-eric.auger@redhat.com>
Content-Language: en-US
In-Reply-To: <20250428102628.378046-10-eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pf1-x42c.google.com
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
X-TUID: aCG7f3m9fOog

Hi Eric,

On 4/28/25 07:25, Eric Auger wrote:
> Propagate the type of pci hotplug mode downto the gpex
> acpi code. In case machine acpi_pcihp is unset we configure
> pci native hotplug on pci0. For expander bridges we keep
> legacy pci native hotplug, as done on x86 q35.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>   include/hw/pci-host/gpex.h | 1 +
>   hw/arm/virt-acpi-build.c   | 1 +
>   hw/pci-host/gpex-acpi.c    | 3 ++-
>   3 files changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/include/hw/pci-host/gpex.h b/include/hw/pci-host/gpex.h
> index 84471533af..feaf827474 100644
> --- a/include/hw/pci-host/gpex.h
> +++ b/include/hw/pci-host/gpex.h
> @@ -45,6 +45,7 @@ struct GPEXConfig {
>       MemMapEntry pio;
>       int         irq;
>       PCIBus      *bus;
> +    bool        pci_native_hotplug;
>   };
>   
>   typedef struct GPEXIrq GPEXIrq;
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 3ac8f8e178..46c5a43d27 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -129,6 +129,7 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
>           .ecam   = memmap[ecam_id],
>           .irq    = irq,
>           .bus    = vms->bus,
> +        .pci_native_hotplug = !vms->acpi_pcihp,
>       };
>   
>       if (vms->highmem_mmio) {
> diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
> index 9d9f5ed7c6..9a521145bd 100644
> --- a/hw/pci-host/gpex-acpi.c
> +++ b/hw/pci-host/gpex-acpi.c
> @@ -204,6 +204,7 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
>               if (is_cxl) {
>                   build_cxl_osc_method(dev);
>               } else {
> +                /* pxb bridges do not have ACPI PCI Hot-plug enabled */
>                   acpi_dsdt_add_host_bridge_methods(dev, true);
>               }
>   
> @@ -279,7 +280,7 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
>       }
>       aml_append(dev, aml_name_decl("_CRS", rbuf));
>   
> -    acpi_dsdt_add_host_bridge_methods(dev, true);
> +    acpi_dsdt_add_host_bridge_methods(dev, cfg->pci_native_hotplug);
>   
>       Aml *dev_res0 = aml_device("%s", "RES0");
>       aml_append(dev_res0, aml_name_decl("_HID", aml_string("PNP0C02")));

Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>


Cheers,
Gustavo
