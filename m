Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp584138lfb;
        Wed, 20 May 2020 06:33:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7tsUmJqyZi8aQXTv8XVzl63lQ8OrybgUrFg7MtSC1F7j704SqEpaBS+0oKeD1UHu3qWjx
X-Received: by 2002:a05:620a:4fb:: with SMTP id b27mr4496352qkh.433.1589981582566;
        Wed, 20 May 2020 06:33:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589981582; cv=none;
        d=google.com; s=arc-20160816;
        b=NoJw66GAVj5XR4XJ7pN0AMHTgAedI8/KKsSawO4y2+AOfpJaBm3IsvfYDrGOhdi6kR
         0MBn8NCcEhIVLitXL0/gJMCGXoc+Bt4v6xDZr90GW4ta4EqVb5I/E5P7rvJ3tJA4gzr1
         M/gWGd9UgUXCQxksok7fqRFXXxCgaUa7teokjvKXrTMG3GzODmX3ZtBTq2HcDpg/PLiW
         Ejq6qTJ16FHluH3rLATJYIUC154GUbEhjRA9K+OZSmJoBZEun72fpnJo1niCvdbsKXmJ
         57MPCbz4Vac9qnqf8UI8b0GNoH+f+0zrD+0kSqcqphDTh1hWEGsX8RxQyS+Asn8lvg+J
         EjTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=fCyAzxAOvggDxdNU7q6XGwmnRFKgfQxhx2IQxbS8bgw=;
        b=SyaLlP67YcYOG/zp9n0vd1rfro9MOB9bXi578+Om5MLO3OibyUZa/ckH8nVRdtyhj5
         LOpAqQC84r0Z2rW14kxcVwjZ8WfiQQ6vTHuaofI62XMPfUQk1dq7ZL8eLHYX4w9tt/nt
         QHpc8Ui3qiZcPDkAYsyvnXLxAZv5bRD/9vYmcGXyrYfFYm8JyG+6rodYglIlQYj839f0
         goOuHw3T+W7byUer83EZ+dkQmjYLsYgY+TNfCMmhsv0skhOnYtlOKaZkZEKtXDH5SrW8
         YBZUGF8bJrLvV7rwSb9Rrogc3TP1oJ8cpAnWtn6na8rYd7PjJWLHgpf9wsPYllYqgK2P
         +mPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=i45+ELX7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f3si1654023qkm.77.2020.05.20.06.33.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 20 May 2020 06:33:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=i45+ELX7;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jbOqD-0002iv-UG
	for alex.bennee@linaro.org; Wed, 20 May 2020 09:33:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jbOpU-0000sw-1j
 for qemu-arm@nongnu.org; Wed, 20 May 2020 09:32:16 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:46452
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jbOpT-0002an-0Z
 for qemu-arm@nongnu.org; Wed, 20 May 2020 09:32:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589981533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fCyAzxAOvggDxdNU7q6XGwmnRFKgfQxhx2IQxbS8bgw=;
 b=i45+ELX7ImRee668ir3gqWSy4rDtkpG2pF9M2HiJPjYk2w8yYwlr4Yu5V6MyAAVm79Nrct
 onnyhIvLjTmxUtJy2w1815y75//EF8JjQKOXwdhTIHuwYMj7YXRmhW4XLRRszTba6+TO/R
 VkgLWlmAVBO4jQzUOfvRpU6QmuxiVaM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-403-IzlzoPuAMOepNZ9NghrSBg-1; Wed, 20 May 2020 09:32:12 -0400
X-MC-Unique: IzlzoPuAMOepNZ9NghrSBg-1
Received: by mail-wr1-f72.google.com with SMTP id i9so1431325wrx.0
 for <qemu-arm@nongnu.org>; Wed, 20 May 2020 06:32:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fCyAzxAOvggDxdNU7q6XGwmnRFKgfQxhx2IQxbS8bgw=;
 b=E7kvjwIRBgWMqRc9k+mxDuVZXahPdO8gnNJcN5+fNFDVdMcOFVp0QVyRaHiliqMr2X
 pk93rU+m70p6IhNMNTOb9HN8k2ypr6L61TpxJsqBCdvEKuPlAz9vl/PdIXffl9GDLZjn
 +iNwQGfKrD164v38VIY2RtBL/jyXKEmzDawgmwQkXdvp5DmemJov1IrR0AOg1gI3Dqvy
 vrD+RqqSypeB3vmM9Tq4DyeHrx7lLv6PUv26Ku0r4u0EfNIMcZ+wGYEDe/P7truwNJa5
 K0usU1T6is1QBUi58Qu3ZL6WRsTTbQmGYFLu4xE8Ns93rfKiU5SQRf5cLToX9pQ2fY/j
 OvOw==
X-Gm-Message-State: AOAM532SXt+ZOiumh3pvafqj9DJAdrL/2OtKR/aLgPLLdxdkuFUJv4fI
 NMfC7InPLAVyLMV5zqgqDmQJQVWpXPLvVWv89XH7aMoL11fz1Q7cXdnMxOZsl5fRwOUrb+r03KQ
 9BXrY3MQWf67R
X-Received: by 2002:adf:8403:: with SMTP id 3mr4046972wrf.186.1589981530861;
 Wed, 20 May 2020 06:32:10 -0700 (PDT)
X-Received: by 2002:adf:8403:: with SMTP id 3mr4046948wrf.186.1589981530614;
 Wed, 20 May 2020 06:32:10 -0700 (PDT)
Received: from [192.168.1.38] (17.red-88-21-202.staticip.rima-tde.net.
 [88.21.202.17])
 by smtp.gmail.com with ESMTPSA id d6sm3207283wra.63.2020.05.20.06.32.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 May 2020 06:32:09 -0700 (PDT)
Subject: Re: [PATCH v3 12/22] acpi: move acpi_dsdt_add_power_button() to ged
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20200520132003.9492-1-kraxel@redhat.com>
 <20200520132003.9492-13-kraxel@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <93396c96-32a1-b10c-be24-64b79466b420@redhat.com>
Date: Wed, 20 May 2020 15:32:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200520132003.9492-13-kraxel@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/20 04:09:34
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: UsnShvDq6YVg

On 5/20/20 3:19 PM, Gerd Hoffmann wrote:
> Allow reuse for microvm.
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>   include/hw/acpi/generic_event_device.h | 1 +
>   hw/acpi/generic_event_device.c         | 8 ++++++++
>   hw/arm/virt-acpi-build.c               | 8 --------
>   3 files changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/include/hw/acpi/generic_event_device.h b/include/hw/acpi/generic_event_device.h
> index 9687cb524258..ebed1ffe4231 100644
> --- a/include/hw/acpi/generic_event_device.h
> +++ b/include/hw/acpi/generic_event_device.h
> @@ -113,5 +113,6 @@ typedef struct AcpiGedState {
>   
>   void build_ged_aml(Aml *table, const char* name, HotplugHandler *hotplug_dev,
>                      uint32_t ged_irq, AmlRegionSpace rs, hwaddr ged_base);
> +void acpi_dsdt_add_power_button(Aml *scope);
>   
>   #endif
> diff --git a/hw/acpi/generic_event_device.c b/hw/acpi/generic_event_device.c
> index 3072fb4ab32b..cde50da5b3ca 100644
> --- a/hw/acpi/generic_event_device.c
> +++ b/hw/acpi/generic_event_device.c
> @@ -142,6 +142,14 @@ void build_ged_aml(Aml *table, const char *name, HotplugHandler *hotplug_dev,
>       aml_append(table, dev);
>   }
>   
> +void acpi_dsdt_add_power_button(Aml *scope)
> +{
> +    Aml *dev = aml_device(ACPI_POWER_BUTTON_DEVICE);
> +    aml_append(dev, aml_name_decl("_HID", aml_string("PNP0C0C")));
> +    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
> +    aml_append(scope, dev);
> +}
> +
>   /* Memory read by the GED _EVT AML dynamic method */
>   static uint64_t ged_evt_read(void *opaque, hwaddr addr, unsigned size)
>   {
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 1b0a584c7b62..49eacc622219 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -354,14 +354,6 @@ static void acpi_dsdt_add_gpio(Aml *scope, const MemMapEntry *gpio_memmap,
>       aml_append(scope, dev);
>   }
>   
> -static void acpi_dsdt_add_power_button(Aml *scope)
> -{
> -    Aml *dev = aml_device(ACPI_POWER_BUTTON_DEVICE);
> -    aml_append(dev, aml_name_decl("_HID", aml_string("PNP0C0C")));
> -    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
> -    aml_append(scope, dev);
> -}
> -
>   static void
>   build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>   {
> 

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

