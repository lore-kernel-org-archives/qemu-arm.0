Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp718524njc;
        Tue, 20 May 2025 11:58:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWWCqA4a7vo4ZEaQoG9GYVxedJtq5XGT9twnbg8U2K2fPyqr4ZVSY442uiv+b1OTB1+oSQuOn4YaBIxoQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGcZA2IouKgyiTvEfZtoHiOmYWcnjp5VW/LHtrKafUoRwIHPpvElx0sSiJjvRrrD6rA+Lyd
X-Received: by 2002:a05:6214:2a8e:b0:6f8:afad:4fde with SMTP id 6a1803df08f44-6f8b2cec4a0mr277845436d6.11.1747767520709;
        Tue, 20 May 2025 11:58:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747767520; cv=none;
        d=google.com; s=arc-20240605;
        b=BQSdDxteloMj9+LPHq+8ylHaxVw1rINTyU0G6g2MCDiRJrsLlaRAwXNZ2IupqDEe8c
         Fq8iNKOVp8lcmJ4YF/9Ub+jmpldmtmqYyDRW3FrYaB+ZlF0iQBh/wow5hiAXkifZ+JWS
         cBb+TrYE9D7lb6rA7lC3r/DGcJA17DigSkpy7FspCjIlAkUgeoLZP4PsHfH/Zc8mXTP5
         Luur3pzF2tdGuKGDqIUSHpKksVZgqJK9DNvaSLQG7q+XBMbrsu/QwpT1WwkXMs+Q2GI+
         CnZPXwdN6nXWPzH5TY57EKSGa2hsH1pHNJhzlmvwRGbZP0QtM1eCukyrqOYHMbQlZU7H
         ERQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=+Ue0VZQscjx8uhCq0onSbkcHY4DNhqmljR6iVQYURFg=;
        fh=/YyaqcSTMkk2ga64ctn9i4snNETVp9zelUelpIPc09I=;
        b=DwKkJ0y7wsRG2u9nPFFoG4k1Q820fwGWyoWGKKl/BrvDC/MBeWPZEmp/cedwOQP0/e
         GvD+Xr1OcLXwbtHlQukF/sS6aQy2TeEOo9fXpLcwuuBoJnJWhfzgmNTHpsJfnNOjGFrL
         9x9VQtL1cOw6EonwmKQYwia/sE1yTRKqBedw396Qj7tjPAD5g7pb4dnqVyzjTGWeSvMI
         ewM9qY5AtQL8bvfwOauo894NG8YB11ZSyldDpBy4sgmhj1UmkuQ08hYPUjB9B4uM5zDb
         nwYyCBRc6bfJM/WlTJkfINGOkikrQD6H59dV/Yy21nzTEWqW8c8hPTgdXTTY6i81TUk6
         wJOQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Jj60f3RK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f8b3cadcaesi102423366d6.304.2025.05.20.11.58.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 May 2025 11:58:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Jj60f3RK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uHSAa-0007OR-Sj; Tue, 20 May 2025 14:58:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uHSAL-0007NS-PM
 for qemu-arm@nongnu.org; Tue, 20 May 2025 14:58:18 -0400
Received: from mail-ua1-x92c.google.com ([2607:f8b0:4864:20::92c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uHSAF-0006s4-II
 for qemu-arm@nongnu.org; Tue, 20 May 2025 14:58:17 -0400
Received: by mail-ua1-x92c.google.com with SMTP id
 a1e0cc1a2514c-87be9d1fe01so1510411241.0
 for <qemu-arm@nongnu.org>; Tue, 20 May 2025 11:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1747767489; x=1748372289; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+Ue0VZQscjx8uhCq0onSbkcHY4DNhqmljR6iVQYURFg=;
 b=Jj60f3RKdAQFCQGawML++/LfuguKiAjJz0dHQa1ZcoTpF5w5TIpRmfIvArM5IJ4nBj
 A4tciUYWZ22HAazSTWTNAo95GPnlT1WHKu1Hqxci7W4yGYxYuEooHwBxBizEd46kzAwU
 eHrNIuL7SEETBdEXkR6ZBRMQHhGwb1iSOnbxyFYB7m+DragU29gGiN/UzzyOU820qD1S
 9M/uXk0EwXwdrrDwEymhxtCuiHZCLcJ7UYmytFjGFoEypujxLL1zBUSjY4J2lruYQKag
 GuA1roxbiThK1Ecofsy+lCVhHPiyLepF1pz6OBk9B8n///eizcoIy2xmVa2bHEhZ/dvF
 h42g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747767489; x=1748372289;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+Ue0VZQscjx8uhCq0onSbkcHY4DNhqmljR6iVQYURFg=;
 b=aKs8Wrk6TccJtfSFBIT/Y3/DczoXwGCINls+Uuc2fVEdABmqgPpESF24NJ/E9sEVpJ
 bSx0tqbH2VeWGER4Y1ATqZG8bM1r3aFz79Izh8ZWtvA89XYdkTUwoIpjsJ0QycE/Avc6
 0RIwrjlAi25hGH3174m7DAvRUFcTP7arx1nybFAWZMmUE2cWxefxnRFRiy71j1zvf0ov
 YFUkMUs9w0FPOJcE+3cIJq8Rj+ULbdWibRTIuFxwI0X+XbHFS32cBqfhZZziz+O2fV1/
 olF0vjltkhKaH1ndpy5uR+7a6a4yRnabyLFlaUBMc0d4zAS9tx2U26WQZLlzmvjc/Dq+
 fjXw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKb/JXJE6ej6TKT2lXJZ3tDi/PcwbsCm1IM+Pmakia3L9t27f83chuy62RgpXVNkjLspS6elvyxg==@nongnu.org
X-Gm-Message-State: AOJu0YyB/TXszZD40ofYLkU0eIPLk9zc/FWYF/jpOl6BozUp46HXcn8q
 6sk7ujrovRLsrH3ZhpXx7KkpYHyDrdFhsyptdAiQd/mD+qDho+n90+giaO+/bu3+TK4=
X-Gm-Gg: ASbGncsdczb8F+BRXSAONKjcxnejoJn5wzNgrDY2lbNHYY0Sls2OEFXRJYBSWpL1a0s
 TeoUfNxubQ5eRzJ3DfysIRQQJcNYeWQLuFd9+XMJpfa/pbkIowsAbsIPcBWPM3gNfBvNf2HGLv+
 I3n8bCU5OYPiekmemVUStzf+oCgPGvJnc6dRG5B4qJ8LE0mkQSlix6e6yHSET338IhWgiShQ9w4
 6wPFQqjM3KgnGg663tiY03lMYrEWUUt4Oz4D6BQR2npK5qP/1liG7IFR0GfoZK6ASKGiwF4FXyT
 IrSoqn8bWFvfYBWcrPdfEZ1zZlSbllYNAevMqUphPo9Jegn3JejqpbS+bcl4IhFuMRGhAe1c1uc
 +xEWARFC8H+KrFStymelTV+QrJ/tEww==
X-Received: by 2002:a05:6102:3a11:b0:4de:c7fe:34b3 with SMTP id
 ada2fe7eead31-4e0415565bemr16740595137.0.1747767488722; 
 Tue, 20 May 2025 11:58:08 -0700 (PDT)
Received: from ?IPV6:2804:7f0:b401:d47f:6989:b93e:2caa:f174?
 ([2804:7f0:b401:d47f:6989:b93e:2caa:f174])
 by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-4dfa66bcfdesm8450619137.11.2025.05.20.11.58.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 May 2025 11:58:08 -0700 (PDT)
Message-ID: <7fca6021-8dc9-422f-850e-227df3ccf6aa@linaro.org>
Date: Tue, 20 May 2025 15:57:55 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/22] hw/i386/acpi-build: Introduce
 build_append_pcihp_resources() helper
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 imammedo@redhat.com, anisinha@redhat.com, mst@redhat.com,
 shannon.zhaosl@gmail.com
Cc: pbonzini@redhat.com, Jonathan.Cameron@huawei.com, philmd@linaro.org
References: <20250514170431.2786231-1-eric.auger@redhat.com>
 <20250514170431.2786231-10-eric.auger@redhat.com>
Content-Language: en-US
From: Gustavo Romero <gustavo.romero@linaro.org>
In-Reply-To: <20250514170431.2786231-10-eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::92c;
 envelope-from=gustavo.romero@linaro.org; helo=mail-ua1-x92c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: fJFxNxv8m7vQ

Hi Eric,

On 5/14/25 14:00, Eric Auger wrote:
> Extract the code that reserves resources for ACPI PCI hotplug
> into a new helper named build_append_pcihp_resources() and
> move it to pcihp.c. We will reuse it on ARM.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>   include/hw/acpi/pcihp.h |  2 ++
>   hw/acpi/pcihp.c         | 20 ++++++++++++++++++++
>   hw/i386/acpi-build.c    | 15 ++-------------
>   3 files changed, 24 insertions(+), 13 deletions(-)

Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>


Cheers,
Gustavo

> diff --git a/include/hw/acpi/pcihp.h b/include/hw/acpi/pcihp.h
> index 95efe9a804..ec9b010e4a 100644
> --- a/include/hw/acpi/pcihp.h
> +++ b/include/hw/acpi/pcihp.h
> @@ -75,6 +75,8 @@ void acpi_pcihp_device_unplug_request_cb(HotplugHandler *hotplug_dev,
>   
>   void build_acpi_pci_hotplug(Aml *table, uint64_t pcihp_addr);
>   void build_append_pci_dsm_func0_common(Aml *ctx, Aml *retvar);
> +void build_append_pcihp_resources(Aml *table,
> +                                  uint64_t io_addr, uint64_t io_len);
>   
>   /* Called on reset */
>   void acpi_pcihp_reset(AcpiPciHpState *s);
> diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> index e0260f67e6..fb54c31f77 100644
> --- a/hw/acpi/pcihp.c
> +++ b/hw/acpi/pcihp.c
> @@ -685,6 +685,26 @@ void build_acpi_pci_hotplug(Aml *table, uint64_t pcihp_addr)
>       aml_append(table, scope);
>   }
>   
> +/* Reserve PCIHP resources */
> +void build_append_pcihp_resources(Aml *scope /* \\_SB.PCI0 */,
> +                                  uint64_t io_addr, uint64_t io_len)
> +{
> +    Aml *dev, *crs;
> +
> +    dev = aml_device("PHPR");
> +    aml_append(dev, aml_name_decl("_HID", aml_string("PNP0A06")));
> +    aml_append(dev,
> +               aml_name_decl("_UID", aml_string("PCI Hotplug resources")));
> +    /* device present, functioning, decoding, not shown in UI */
> +    aml_append(dev, aml_name_decl("_STA", aml_int(0xB)));
> +    crs = aml_resource_template();
> +    aml_append(crs,
> +        aml_io(AML_DECODE16, io_addr, io_addr, 1, io_len)
> +    );
> +    aml_append(dev, aml_name_decl("_CRS", crs));
> +    aml_append(scope, dev);
> +}
> +
>   const VMStateDescription vmstate_acpi_pcihp_pci_status = {
>       .name = "acpi_pcihp_pci_status",
>       .version_id = 1,
> diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
> index 41fde88b22..ca59185aac 100644
> --- a/hw/i386/acpi-build.c
> +++ b/hw/i386/acpi-build.c
> @@ -1432,19 +1432,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
>   
>       /* reserve PCIHP resources */
>       if (pm->pcihp_io_len && (pm->pcihp_bridge_en || pm->pcihp_root_en)) {
> -        dev = aml_device("PHPR");
> -        aml_append(dev, aml_name_decl("_HID", aml_string("PNP0A06")));
> -        aml_append(dev,
> -            aml_name_decl("_UID", aml_string("PCI Hotplug resources")));
> -        /* device present, functioning, decoding, not shown in UI */
> -        aml_append(dev, aml_name_decl("_STA", aml_int(0xB)));
> -        crs = aml_resource_template();
> -        aml_append(crs,
> -            aml_io(AML_DECODE16, pm->pcihp_io_base, pm->pcihp_io_base, 1,
> -                   pm->pcihp_io_len)
> -        );
> -        aml_append(dev, aml_name_decl("_CRS", crs));
> -        aml_append(scope, dev);
> +        build_append_pcihp_resources(scope,
> +                                      pm->pcihp_io_base, pm->pcihp_io_len);
>       }
>       aml_append(dsdt, scope);
>   

