Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp4760325lfg;
        Wed, 12 May 2021 01:03:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyt6nGOUQbNnBui8EgF5ljaWjBArE7xYIC0iYSuLc6KkvTSZ81ajrW3A2VkwBBfZwaRXR4w
X-Received: by 2002:a1f:1d4a:: with SMTP id d71mr26946187vkd.0.1620806614949;
        Wed, 12 May 2021 01:03:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620806614; cv=none;
        d=google.com; s=arc-20160816;
        b=qf5VDAALbr9w2UiNgcVXgP+8HtaynQx7O9qHyLf9bfKk3J+Ad+/o+OnDZBsn0hFoQb
         KNbB04rRUfv5cXrxI+iAcxZ7sX2k5taaG2J4xBbNsUa0pghy4Yqb3kYbCpHJH9Hb5ZB+
         3luPOfIMCbx0DjM1LIcKK7sM3wTKIQkGwo+ukiBYrMjNOWsld58ns59H0TJfjvD47/bf
         h+u0NEiGtQPcNaZZNwdD1WeDK7OQWYXQlEFqLuO1CbwyEN6m2hXHZVMFcyNmZ8NMYRWF
         Bhoec+TKuQJwCIQbLWQubZklIilA9iSqBp3RU1YL0YTNUDSM6oVca7P8kk/8Fg/0ECYI
         O0Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=JePiNTF3b0qDirEWU/u5+nL5bO95RuC/8ONEXQps24A=;
        b=eJxEZBWQvntVhYg7qV6KdQGMuC96VzkE+L24pDUOFavA9L+dBUz5ppUCzfHO2W1wW+
         r39vYEq7X1YfVNX+hKGJxnmtNL6jedDfjHc5Ot2b6l12JpxZiW06dwzc8ubuvT+nmPqY
         enG25IvkqtmWCev+ddEuG84NKaCwbxUVc250EzfjN1F83QIXKB3S+p7h69RNlOgjSaYf
         9sZUp0wkuxesUZfmmVWhgmqzVy8/QiC5YTLBV0rjHbYzWw1ndrWIuu0HF+nTZjsNnZM1
         e+mPQVh2MVTWmbnVVT8dhts9uqh0OdsggcrIJTeCbpfRalLajZ/FvOdL9muK5tad9gQD
         QLog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=baA0Y0f2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t7si3628846vsh.173.2021.05.12.01.03.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 May 2021 01:03:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=baA0Y0f2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lgjqA-0005he-60
	for alex.bennee@linaro.org; Wed, 12 May 2021 04:03:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59966)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgjp8-0004JU-3E
 for qemu-arm@nongnu.org; Wed, 12 May 2021 04:02:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgjox-00041l-8I
 for qemu-arm@nongnu.org; Wed, 12 May 2021 04:02:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620806538;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JePiNTF3b0qDirEWU/u5+nL5bO95RuC/8ONEXQps24A=;
 b=baA0Y0f2+h3sCCGpyUao0iaobVIcaTFmab4MEGM5xoCT7XSPOWQZCqOPN/lcWAtPYItcLi
 VD+CHLNHgMUqkApmGN66UUxkvNHNdETKcVL0gFHf5odUUZ6JLL/WD4RK/pVMBoW03kh0i2
 qklV/LD5zsgAqrUUWgcdI7eyyRMXrBw=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-eDQMIfe5MSiELMT6XYaRng-1; Wed, 12 May 2021 04:02:16 -0400
X-MC-Unique: eDQMIfe5MSiELMT6XYaRng-1
Received: by mail-ej1-f71.google.com with SMTP id
 zo1-20020a170906ff41b02903973107d7b5so6814450ejb.21
 for <qemu-arm@nongnu.org>; Wed, 12 May 2021 01:02:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JePiNTF3b0qDirEWU/u5+nL5bO95RuC/8ONEXQps24A=;
 b=N8K5G9vEeCUJxRxYm34ViIrWPlElYwr4kkAeah5BYTtajO8T3D+I7kEHozc8j0k6G8
 22iGS0eBlRaet3lmj6lPePSWYxE8lF/GLth+LwAXaZxO9G5irCIvblv52vsoSNe2S2nW
 s+l+iiMcpOazbt63MLZ69HUMZS0Ut3ltT1mgivo7I2Fofa1lW6ABOVd5fuuPh2pvpB6Y
 aeWSaOzTcZBpXeVrrwGtRGWVuQseYAqxXQR/hf7qX3L8wCNJjyKIWckRTMa65ymmzx0r
 tgJE74Tn+GB//5HsIMPqRu9X11/I1LQuqn8WJ1NPv7zygktB0nvviwcTg1VFjG7Sdgm8
 cM8A==
X-Gm-Message-State: AOAM531boqd+Ms9ju7UBUvs260Yy7aP5sxOyZ3+fZBvy/S8QfjIwJ90i
 7d6gtn4zB9nnelHtqPew6IoiC6XvXOZL8BHg184NIw/lqn3iTZggBytlECM0krcoi7FTgw5mln8
 ubXCAgsO0yoIv
X-Received: by 2002:a17:906:5814:: with SMTP id
 m20mr35028029ejq.152.1620806535546; 
 Wed, 12 May 2021 01:02:15 -0700 (PDT)
X-Received: by 2002:a17:906:5814:: with SMTP id
 m20mr35027987ejq.152.1620806535312; 
 Wed, 12 May 2021 01:02:15 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id da25sm17473662edb.38.2021.05.12.01.02.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 May 2021 01:02:14 -0700 (PDT)
Subject: Re: [RFC PATCH 1/5] hw/mem/nvdimm: Use Kconfig 'imply' instead of
 'depends on'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210511155354.3069141-1-philmd@redhat.com>
 <20210511155354.3069141-2-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <2dd5f261-658d-a13e-b34c-c5c70e19e77c@redhat.com>
Date: Wed, 12 May 2021 10:02:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210511155354.3069141-2-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>, qemu-ppc@nongnu.org,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Igor Mammedov <imammedo@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IH4/qj5Kvwt9

On 11/05/21 17:53, Philippe Mathieu-Daudé wrote:
> Per the kconfig.rst:
> 
>    A device should be listed [...] ``imply`` if (depending on
>    the QEMU command line) the board may or  may not be started
>    without it.
> 
> This is the case with the NVDIMM device, so use the 'imply'
> weak reverse dependency to select the symbol.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Unrelated to the rest, so I've queued this one.

Paolo

> ---
>   default-configs/devices/ppc64-softmmu.mak | 1 -
>   hw/arm/Kconfig                            | 1 +
>   hw/i386/Kconfig                           | 1 +
>   hw/mem/Kconfig                            | 2 --
>   hw/ppc/Kconfig                            | 1 +
>   5 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/default-configs/devices/ppc64-softmmu.mak b/default-configs/devices/ppc64-softmmu.mak
> index ae0841fa3a1..cca52665d90 100644
> --- a/default-configs/devices/ppc64-softmmu.mak
> +++ b/default-configs/devices/ppc64-softmmu.mak
> @@ -8,4 +8,3 @@ CONFIG_POWERNV=y
>   
>   # For pSeries
>   CONFIG_PSERIES=y
> -CONFIG_NVDIMM=y
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index b887f6a5b17..67723d9ea6a 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -6,6 +6,7 @@ config ARM_VIRT
>       imply VFIO_PLATFORM
>       imply VFIO_XGMAC
>       imply TPM_TIS_SYSBUS
> +    imply NVDIMM
>       select ARM_GIC
>       select ACPI
>       select ARM_SMMUV3
> diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
> index 7f91f30877f..66838fa397b 100644
> --- a/hw/i386/Kconfig
> +++ b/hw/i386/Kconfig
> @@ -23,6 +23,7 @@ config PC
>       imply TPM_TIS_ISA
>       imply VGA_PCI
>       imply VIRTIO_VGA
> +    imply NVDIMM
>       select FDC
>       select I8259
>       select I8254
> diff --git a/hw/mem/Kconfig b/hw/mem/Kconfig
> index a0ef2cf648e..8b19fdc49f1 100644
> --- a/hw/mem/Kconfig
> +++ b/hw/mem/Kconfig
> @@ -7,6 +7,4 @@ config MEM_DEVICE
>   
>   config NVDIMM
>       bool
> -    default y
> -    depends on (PC || PSERIES || ARM_VIRT)
>       select MEM_DEVICE
> diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
> index e51e0e5e5ac..66e0b15d9ef 100644
> --- a/hw/ppc/Kconfig
> +++ b/hw/ppc/Kconfig
> @@ -3,6 +3,7 @@ config PSERIES
>       imply PCI_DEVICES
>       imply TEST_DEVICES
>       imply VIRTIO_VGA
> +    imply NVDIMM
>       select DIMM
>       select PCI
>       select SPAPR_VSCSI
> 

