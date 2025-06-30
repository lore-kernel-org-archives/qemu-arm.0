Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp2405826dye;
        Mon, 30 Jun 2025 04:35:43 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXDDDTqH/SzzuDxDSMTAWWU7oIAp4MvrvHUudfyV9qqC3GYgI4BM5b8lwjqRwqp5WkPLk9VmOR8m02urw==@linaro.org
X-Google-Smtp-Source: AGHT+IF60At3ijuEVwSr2f+/vM+U9Ut9uMIRKUFsM3WUrihBYyFqBLdPNI2dOvz5PRQZIxfLSSh9
X-Received: by 2002:a05:600c:19cb:b0:43d:8ea:8d7a with SMTP id 5b1f17b1804b1-4538ee71251mr114217385e9.28.1751283343246;
        Mon, 30 Jun 2025 04:35:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751283343; cv=none;
        d=google.com; s=arc-20240605;
        b=hPB5j3U8RJiCoQMp0QooXktbltVlaDKJkNJ21NSAZ7SZj8/3nknoxr5jz7/KA9oRti
         A7g8+p3Ibm9srKZWFzyud5n5pN8E/hRGXb+T/aSeLS59kFY3V/aJs7GBVDs069+4Sd6u
         b7Y9ZffgovxHoByzfvP751+J9r0P01YIBt7NW7Ca+2OSahxPGE+iyPtbimDtxk2bLNzA
         3F+/QziLFPcksjxdLHsIvDS2nPjlFikDPENFYMjR1jXxN/6AAXWiPYLzLyrZ343oEuZy
         Rhfcev+Gumm9QXSuWROZTNU5O/T1kjM7yOnoYuS24oMWK7dEGw/gNS1RceHSN3KZQFC7
         rMgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=aMNjDoeVRk6RTg6e0n+4eZUB3tjQVLqhMPKJQPHRu94=;
        fh=De5j/+RFiHp5oysg/kfBHcT9O0ASuV5hpNukEk4skqM=;
        b=ZMvhf8H5vht/cVf/HcYxKihM6O4gvQWSnn2RvGRLSmeaWRX/Z9zKZ8l3tVi2ScyNzo
         ZOD3Zkjs5CbMSDlRX5ppRcWyp2bgEocLqqGVnlzD4SoHK0RHZRr+2kGxvh+IhqczoJ/a
         ONg2h7zwR3cSBvmeXH8SQD9v9u6Ali4q7YNuqZTSjGMRA7d8ZKBPydXpZYSqpsaippCF
         VFIMzCMPYj0cTqACOFB5LilsbffKoXW/byC6N0Vkfq7QEVZ/LGXkeg1dmzhATpnn77B/
         MYYyXI5YPHqiHIdIUI+XHhe/JVWkfoR098FE1r4X4d6wsYnBDf2SAPBF9a/bdYAU4+cr
         ZE2g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-453900b8abesi59754895e9.14.2025.06.30.04.35.42
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Jun 2025 04:35:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bW3wn61nTz6M54G;
	Mon, 30 Jun 2025 19:34:49 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 613A31404C4;
	Mon, 30 Jun 2025 19:35:42 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 30 Jun
 2025 13:35:41 +0200
Date: Mon, 30 Jun 2025 12:35:40 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Eric Auger <eric.auger@redhat.com>
CC: <eric.auger.pro@gmail.com>, <qemu-devel@nongnu.org>,
	<qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <imammedo@redhat.com>,
	<gustavo.romero@linaro.org>, <anisinha@redhat.com>, <mst@redhat.com>,
	<shannon.zhaosl@gmail.com>, <pbonzini@redhat.com>, <philmd@linaro.org>,
	<alex.bennee@linaro.org>
Subject: Re: [PATCH v4 10/32] tests/qtest/bios-tables-test: Update DSDT
 blobs after GPEX _OSC change
Message-ID: <20250630123540.00005f9a@huawei.com>
In-Reply-To: <20250627095620.3300028-11-eric.auger@redhat.com>
References: <20250627095620.3300028-1-eric.auger@redhat.com>
	<20250627095620.3300028-11-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500004.china.huawei.com (7.191.163.9) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: 2SfnC6HSpIVP

On Fri, 27 Jun 2025 11:54:59 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> Update the reference DSDT blobs after GPEX _OSC change. The _OSC change
> affects the aarch64 'virt' and the x86 'microvm' machines.
> 
> DSDT diff is the same for all the machines/tests:
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
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
