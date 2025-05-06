Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2798988njj;
        Mon, 5 May 2025 17:13:17 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXhI24u1aSH0pF1Vwmlog/pl6R3z0GTA6s+5MbXtfOZF3xHDchuRvzRJw6aH7Zv/EXIgD7Ezg5CMDJhOg==@linaro.org
X-Google-Smtp-Source: AGHT+IE66+8Z/oADh9iv/yKEdqcqWzKHnQ4pn/HEWGYvVGi/ibIQrf2jwGM9TvGy217WaHXpxtdV
X-Received: by 2002:a05:6214:5290:b0:6f5:dd5:a594 with SMTP id 6a1803df08f44-6f5353ce887mr25377726d6.5.1746490397729;
        Mon, 05 May 2025 17:13:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746490397; cv=none;
        d=google.com; s=arc-20240605;
        b=VZ2fVyEVbPJr62fgSlMz7EIvoiAGdqSqvXXvq837GRvgEYTPlQ1oAvjNwMpCTugi9c
         vZzrpIHt5tZinXUx80a2vMJzUJB/4mu5Qu34umn2Eb/Tf/rGgp2nWOSNXLa6GkRBTB6F
         wTvh1OFKx5kClwBP/1O27T+Eb/An2U4Hg5lMULFgpJgokWSDcybeaEnK7LyuZD8DR9z/
         ee5mqj0EeRM8VamW+b1Bcwfrw55aM+yjIscs7Q0GSFdy7+IjQFpyotNE69leaZ0PMe6O
         b99sYIjzD96Oy1YGvHsr3MRBorUDJJNpxgKrtvBW2SMwx6MmjNg8E4+Wnp0EDv/Dc9+t
         13HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:content-language:references:cc:to:subject:from
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=O5h+weRUpIyp3LtfV3HPJjNoq4ysHtbEcilsgOgzGAE=;
        fh=d53JAr+gULDP/DXc6rhwGJxKVnA8r4UvDMiZIPdRlb8=;
        b=jPPNU55Pce1FRoT7vBN9ADBIRZZvBrSrmfNR8TY7g7o9vEvNImppwVVG276h4XHr4j
         HF1TVfEPyJ9EBtGH//ZjVg5gHFLaKfXllCIKgmExRZG/9U+U9W82vG26apV7d3APWQmm
         /fV74fiu5Udg05xTrWHZ6PdRQCdzVMgtaRUIlBZIwrveC3cBdl+VFVY5nEG0/y+1u/Kx
         0VNDPvkz2YjblvDk6e9YGRE5MluX19L6YK/frJdjkHnTKUnKMcy3S57cE6Z4fVMI8Qjq
         qENRVqkTiF0JbuC20il5wrMUV2emidvl3uI+nsc9pEK+eFXjB5fllbLJkiGHTSvsW7Rw
         C1FA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dwA1s4lJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6f5372683easi4033256d6.94.2025.05.05.17.13.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 May 2025 17:13:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dwA1s4lJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uC5vs-0007L2-FZ; Mon, 05 May 2025 20:13:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uC5vq-0007JC-VZ
 for qemu-arm@nongnu.org; Mon, 05 May 2025 20:13:11 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gustavo.romero@linaro.org>)
 id 1uC5vp-0000Db-7X
 for qemu-arm@nongnu.org; Mon, 05 May 2025 20:13:10 -0400
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-3014678689aso3939749a91.0
 for <qemu-arm@nongnu.org>; Mon, 05 May 2025 17:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746490387; x=1747095187; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=O5h+weRUpIyp3LtfV3HPJjNoq4ysHtbEcilsgOgzGAE=;
 b=dwA1s4lJS1dHxFzqI42gg0knqdsuqKhA8AXlBE5xnj5/UUtR40byryGbKf4YSJUJN1
 W2egVifr29YXDTB+VuM8tJmC5eEzCZjpD2c6vzvY4YdoRCjudwC0eCtle1Puhzq55QiG
 /nUcAL7hf3gzwAx9HkswOJNJloUw978q2YbzEQxUKAtzdPwRxHG/i5ml2dsgsPUDaeGr
 ScIZeMpZB74Jq7hc9r/7UFloKJcJTo4wdTAy0VMeYjnYc7miTNWdOqNJXqFvr57uCo6g
 NFKBuZUyu4jke6dVoCBh+0eT7Uk4c3ieBEun1Q1wVtU+uu9WzHXt+yVWuAcOq68COGVe
 OltQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746490387; x=1747095187;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=O5h+weRUpIyp3LtfV3HPJjNoq4ysHtbEcilsgOgzGAE=;
 b=nQx792qLeakVPaeg8tiG8PUcZrqOLatqA8KEIDQ8QVOnaSWW18uFnIqa8anHTsCmWD
 TaSKPsVQyH6FcqAhP5wuMFdC+m6vXgTa0Fl9H+XXUUEzI3E6cjB9KZ/Lgua1IEJ2pI8S
 e/qKsfCiT3lEc9PvOW74DocLDvnsXm4WkcoDy3i3+8NBeeKaModofReYNn4qxSVRYnU5
 KsphZaT5H05QbUFMYE4ht/e4ZPpMxCQW8YZshGoOQ8s6lziG/ljFyyX+YHfESd6BljoU
 3FZQ5KwsiAPB+MJGrKh6NDeWQf40RBPiOB0G4rK2fNLqJ0Qu+17RZZNUyOzMW0esDX9+
 jXBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlBkdmDH7kZ6eC8/DBgf25xLtm5UeiIlWd4Asr3JVpixDS5VAK0d6sngUSX4/1gyp2EXWWC132MA==@nongnu.org
X-Gm-Message-State: AOJu0YzDYkx35j2bZTcVQM6X7XKsZ43WUtKRRTF1BVptBoIY+yfq23V3
 UKNIYWebBNE+/vuFPifuAPytWQgzFqrez0J81eW0KLhfIae9yCA2+LfKDd8Zojk=
X-Gm-Gg: ASbGncs/OoK7qlsMsj9kUSS8JRYHIpnVCM5TAzIe3nZPNYwCMOiWvzEfx5lwsK+iOUG
 nXDmIP4n6m9Ra9dLRzt87kgfIoHFrhrO7vMA41plqZA6buyk2n7VQCIbNOi+A9TEFIrw4WV/Fb3
 BdcUHDcOHkr+CMHjxBld0eNY3x6TYw8U11dT1umEe2RUmkXGMuTtUSXsvUcVIyd7odt9IOV+uxt
 jum3XLpfe5P5Kw/WDZ4A+wmpCF8PQq7zBPOpQnKdIbeZGfqW0YqMLpWoyp5VbIuJoMhkoipT7ee
 PKa5rCSNkloI48kthMRNO/UoebfnLcXPf2MLYErIcWBvMGYYi4JgraQmcfLeYwbzByc3z1q42Y3
 DnF2WdWRr9NW6kp3Vc2Z/GKSNey+92A==
X-Received: by 2002:a17:90b:1f8d:b0:308:2b5b:d67f with SMTP id
 98e67ed59e1d1-30a7c080700mr2205527a91.9.1746490387238; 
 Mon, 05 May 2025 17:13:07 -0700 (PDT)
Received: from ?IPV6:2804:7f0:b400:8604:71fc:f75a:e2f5:e7b5?
 ([2804:7f0:b400:8604:71fc:f75a:e2f5:e7b5])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22e152309e5sm61216735ad.235.2025.05.05.17.13.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 May 2025 17:13:06 -0700 (PDT)
Message-ID: <4bd4aa37-1edf-4660-b415-2b2c3c184e30@linaro.org>
Date: Mon, 5 May 2025 21:13:01 -0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Gustavo Romero <gustavo.romero@linaro.org>
Subject: Re: [RFC 07/24] hw/pci-host/gpex-acpi: Add native_pci_hotplug arg to
 acpi_dsdt_add_pci_osc
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 imammedo@redhat.com, anisinha@redhat.com, mst@redhat.com,
 shannon.zhaosl@gmail.com
Cc: pbonzini@redhat.com, Jonathan.Cameron@huawei.com
References: <20250428102628.378046-1-eric.auger@redhat.com>
 <20250428102628.378046-8-eric.auger@redhat.com>
Content-Language: en-US
In-Reply-To: <20250428102628.378046-8-eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=gustavo.romero@linaro.org; helo=mail-pj1-x102d.google.com
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
X-TUID: Euk+PQxYXlis

Hi Eric,

On 4/28/25 07:25, Eric Auger wrote:
> Add a new argument to acpi_dsdt_add_pci_osc to be able to disable
> native pci hotplug.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>   hw/pci-host/gpex-acpi.c | 11 ++++++-----
>   1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
> index e8b4c64c5f..4016089893 100644
> --- a/hw/pci-host/gpex-acpi.c
> +++ b/hw/pci-host/gpex-acpi.c
> @@ -50,7 +50,7 @@ static void acpi_dsdt_add_pci_route_table(Aml *dev, uint32_t irq,
>       }
>   }
>   
> -static void acpi_dsdt_add_pci_osc(Aml *dev)
> +static void acpi_dsdt_add_pci_osc(Aml *dev, bool enable_native_pcie_hotplug)
>   {
>       Aml *method, *UUID, *ifctx, *ifctx1, *elsectx, *buf;
>   
> @@ -80,8 +80,9 @@ static void acpi_dsdt_add_pci_osc(Aml *dev)
>        * Allow OS control for all 5 features:
>        * PCIeHotplug SHPCHotplug PME AER PCIeCapability.

This comment is no longer true for PCIeHotplug, which now can be
controlled by the platform, and so needs to be updated, although
it's going to go away in the series.
  
Otherwise:

Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>


Cheers,
Gustavo

>        */
> -    aml_append(ifctx, aml_and(aml_name("CTRL"), aml_int(0x1F),
> -                              aml_name("CTRL")));
> +    aml_append(ifctx, aml_and(aml_name("CTRL"),
> +               aml_int(0x1E | (enable_native_pcie_hotplug ? 0x1 : 0x0)),
> +               aml_name("CTRL")));
>   
>       ifctx1 = aml_if(aml_lnot(aml_equal(aml_arg(1), aml_int(0x1))));
>       aml_append(ifctx1, aml_or(aml_name("CDW1"), aml_int(0x08),
> @@ -192,7 +193,7 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
>               if (is_cxl) {
>                   build_cxl_osc_method(dev);
>               } else {
> -                acpi_dsdt_add_pci_osc(dev);
> +                acpi_dsdt_add_pci_osc(dev, true);
>               }
>   
>               aml_append(scope, dev);
> @@ -267,7 +268,7 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
>       }
>       aml_append(dev, aml_name_decl("_CRS", rbuf));
>   
> -    acpi_dsdt_add_pci_osc(dev);
> +    acpi_dsdt_add_pci_osc(dev, true);
>   
>       Aml *dev_res0 = aml_device("%s", "RES0");
>       aml_append(dev_res0, aml_name_decl("_HID", aml_string("PNP0C02")));

