Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp746715njc;
        Fri, 20 Jun 2025 01:57:25 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW9ARox6wuRZPS/6E5yJQR1tGthyHLUSIugdrlOFEP3uvVZJ0+wJxQ3dtDfj47NWe1/CL7nYl8rI1S97A==@linaro.org
X-Google-Smtp-Source: AGHT+IEqw6gUb/xmDDz/IcJu7PmEg28idPFmBcGhghekNlnfn4DTK+/hE7JeiG3PJdbj5134Vnc+
X-Received: by 2002:a05:600c:3b1a:b0:43d:97ea:2f4 with SMTP id 5b1f17b1804b1-453653b043amr19885495e9.12.1750409845099;
        Fri, 20 Jun 2025 01:57:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750409845; cv=none;
        d=google.com; s=arc-20240605;
        b=W1mvhW1Kcw2zlZI51K5nlHNzvrqn1fwIamEDN3YBbHbbgDJxlm7BGXmAVlMKEKPbr0
         THzfeTaxvbclyVvNF6CO+4s8CXZQwm/jPVBCHjxAL0KHpZ15O6xRyTmpywZkIZKJevP1
         P81tpz1jxR/NTpaHihZhhRpe4NIbaeZuCKdj/QHXzR+E2OVRAqxXiesBNFYBKuDOBAT9
         hKWz26AHL9Z4gFfbzNptqg/Jkip1rzPB1xy3No8c/6oYWhv5OpUHh3pEpunowKbj+4bu
         dwuzoxnriRFwZrJVfHY70b3nTyKoEmPHRsWorzl2DULdM5w+wbOM7jXfmfrQSQtwwgLv
         YQOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=vTy2qxpPa/2x7Znyer5LCXxhneqXer6VflZgBbNSr1A=;
        fh=De5j/+RFiHp5oysg/kfBHcT9O0ASuV5hpNukEk4skqM=;
        b=EJp30mIqhxJ9RsOLhm/UrZIfllpT7PSc839NGZ7de0ZfRqh2MufZsnld0zTeGl+Ctz
         ALykWKUxt/hvxGMIDOjmm4kQ3mCuj50Sy8xJgy7v+kBU2EqbeFjEVkCPb1vunc0/Dy0h
         L8FDyWQCqwpGKq1+QfwAJuNDZf76QlwwmrVp3IsItB/JPq/GCLyS1A1ZWqTWLgFKVjxr
         /FOZ50xX3DtxCrkoRE3OXKX9AUJLjQzr/R2WrhXziBnTF0t4p16ecLINAATOqWvJnDFi
         vGUXDcV2lG2B/eA8RKYVpYMY1aZQz5nKSWUPI2aoX5dQi7qd0qZTOCtzhtzCQCD8s8pq
         NTJw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-4536470ff18si11504695e9.114.2025.06.20.01.57.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Jun 2025 01:57:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bNrpG06QFz6L64q;
	Fri, 20 Jun 2025 16:52:38 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 01B01140446;
	Fri, 20 Jun 2025 16:57:24 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 20 Jun
 2025 10:57:23 +0200
Date: Fri, 20 Jun 2025 09:57:21 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Eric Auger <eric.auger@redhat.com>
CC: <eric.auger.pro@gmail.com>, <qemu-devel@nongnu.org>,
	<qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <imammedo@redhat.com>,
	<gustavo.romero@linaro.org>, <anisinha@redhat.com>, <mst@redhat.com>,
	<shannon.zhaosl@gmail.com>, <pbonzini@redhat.com>, <philmd@linaro.org>,
	<alex.bennee@linaro.org>
Subject: Re: [PATCH v3 09/29] hw/pci-host/gpex-acpi: Use
 build_pci_host_bridge_osc_method
Message-ID: <20250620095721.00000eec@huawei.com>
In-Reply-To: <20250616094903.885753-10-eric.auger@redhat.com>
References: <20250616094903.885753-1-eric.auger@redhat.com>
	<20250616094903.885753-10-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100001.china.huawei.com (7.191.160.183) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: b3bt88Oc9dNu

On Mon, 16 Jun 2025 11:46:38 +0200
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
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
