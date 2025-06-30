Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp2405490dye;
        Mon, 30 Jun 2025 04:35:05 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWisyKHP/5SvfwT5tW993fbwe/KZaUZg6d695hH1UAEh1HPs2woesi6JH/7cGu3u281qKldqI84ENsP3A==@linaro.org
X-Google-Smtp-Source: AGHT+IH2bwwKCACKZK+NK5G5aMXkAs9tNNGpj6SS046e5C4XpxtAFqaJdCHTH3ML7vOBrBH8fcov
X-Received: by 2002:a05:6000:2013:b0:3a4:f7dc:8a62 with SMTP id ffacd0b85a97d-3a8f2f34f7cmr10868940f8f.0.1751283305157;
        Mon, 30 Jun 2025 04:35:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751283305; cv=none;
        d=google.com; s=arc-20240605;
        b=gIz+2ZRcZ02pJyLKeLE924297AamtDaxmk/9cTLrKVI5c+I9OyqUemVj4Npo2UhnW4
         FodFMIRf6w4CWR15Aj6IqdRxWFys1/KVQR14mxetPfVjcj1JixNtnC8Hy3XDChTqpi5e
         2BlLfQJ4Qr+LT3xK4r4Y5vDeiMsdpj1cFXvYA7O5jGV5wG95TRyulB8a8vMCJUg5fuP3
         8RZr77SUUZyz9q6H7occ0ykIs49QebjCeagI/BWhGcR+rXo925dPnpCPJI6vOMM/sIGM
         Nr1eTrXyOl7hrqKGArymikjZUYXYjPg3gi64164DGysw0bMvsOwJL0mjDnp9O3ErVC2J
         OOPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=d1Azmfu1H2xKrhLIa/ux9ELHrZtdgu8L6yT/Aesm/eI=;
        fh=De5j/+RFiHp5oysg/kfBHcT9O0ASuV5hpNukEk4skqM=;
        b=jSUtgKHdZZRA7XTGrpHW+G5yjeEY+v1WyXVA8MGU9opz3qkgjY9OgRGGRAad3Urfc0
         2e7dXZ125ftXOJGvI1Tv4+N4i11C9eSHwCTo0NSY5e3ezfsmFdaZmae2A1potE/FyFyT
         lKCiTRCi6N1Xc9xk8p6tHQJYNF75tnppmjd+irVFeakmmBWRhFgRng9MVmdwByd9fk+l
         kB798aUgDLE7+kmRspPeL/X9gXbXZHiji+DN6WO+3SaWgtLbp+pykcPmgaHegOJnvhRb
         Q8JmRmdhljNDfeXTG3vP8wMfhE0q2d5nRSn13GNxRir321HMsIjkA5ewCBxN6XIbM0Vt
         GRCg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a892e436b1si5707383f8f.51.2025.06.30.04.35.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Jun 2025 04:35:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bW3sr5hDPz6L5MP;
	Mon, 30 Jun 2025 19:32:16 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 2CD97140446;
	Mon, 30 Jun 2025 19:35:04 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 30 Jun
 2025 13:35:03 +0200
Date: Mon, 30 Jun 2025 12:35:02 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Eric Auger <eric.auger@redhat.com>
CC: <eric.auger.pro@gmail.com>, <qemu-devel@nongnu.org>,
	<qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <imammedo@redhat.com>,
	<gustavo.romero@linaro.org>, <anisinha@redhat.com>, <mst@redhat.com>,
	<shannon.zhaosl@gmail.com>, <pbonzini@redhat.com>, <philmd@linaro.org>,
	<alex.bennee@linaro.org>
Subject: Re: [PATCH v4 09/32] hw/pci-host/gpex-acpi: Use
 build_pci_host_bridge_osc_method
Message-ID: <20250630123502.00004d70@huawei.com>
In-Reply-To: <20250627095620.3300028-10-eric.auger@redhat.com>
References: <20250627095620.3300028-1-eric.auger@redhat.com>
	<20250627095620.3300028-10-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500004.china.huawei.com (7.191.163.9) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: Yb7vohZrgGQu

On Fri, 27 Jun 2025 11:54:58 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> gpex build_host_bridge_osc() and x86 originated
> build_pci_host_bridge_osc_method() are mostly identical.
> 
> In GPEX, SUPP is set to CDW2 but is not further used. CTRL
> is same as Local0.
> 
> So let gpex code reuse build_pci_host_bridge_osc_method()
> and remove build_host_bridge_osc().
> 
> Also add an imply ACPI_PCI clause along with
> PCI_EXPRESS_GENERIC_BRIDGE to compile hw/acpi/pci.c
> when its dependency is resolved (ie. CONFIG_ACPI_PCI).
> This is requested to link qemu-system-mips64el.
> 
> The disassembled DSDT difference is given below:
> 
>   * Original Table Header:
>   *     Signature        "DSDT"
> - *     Length           0x00001A4F (6735)
> + *     Length           0x00001A35 (6709)
>   *     Revision         0x02
> - *     Checksum         0xBF
> + *     Checksum         0xDD
>   *     OEM ID           "BOCHS "
>   *     OEM Table ID     "BXPC    "
>   *     OEM Revision     0x00000001 (1)
> @@ -1849,27 +1849,26 @@ DefinitionBlock ("", "DSDT", 2, "BOCHS ", "BXPC    ", 0x00000001)
>                  {
>                      CreateDWordField (Arg3, 0x04, CDW2)
>                      CreateDWordField (Arg3, 0x08, CDW3)
> -                    SUPP = CDW2 /* \_SB_.PCI0._OSC.CDW2 */
> -                    CTRL = CDW3 /* \_SB_.PCI0._OSC.CDW3 */
> -                    CTRL &= 0x1F
> +                    Local0 = CDW3 /* \_SB_.PCI0._OSC.CDW3 */
> +                    Local0 &= 0x1F
>                      If ((Arg1 != One))
>                      {
>                          CDW1 |= 0x08
>                      }
> 
> -                    If ((CDW3 != CTRL))
> +                    If ((CDW3 != Local0))
>                      {
>                          CDW1 |= 0x10
>                      }
> 
> -                    CDW3 = CTRL /* \_SB_.PCI0.CTRL */
> -                    Return (Arg3)
> +                    CDW3 = Local0
>                  }
>                  Else
>                  {
>                      CDW1 |= 0x04
> -                    Return (Arg3)
>                  }
> +
> +                Return (Arg3)
>              }
> 
>              Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> 
> ---
> 
> v3 -> v3:

v3->v4?

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
