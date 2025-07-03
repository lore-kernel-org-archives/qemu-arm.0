Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp591019dyc;
        Thu, 3 Jul 2025 07:53:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXAM255DLfcuZiSzQazt4Jx05SaCjWx5oS3AOivHc/CE6rDEdJwahPFhhkxUfoYOcbW3N2Dm0h1SRqu0A==@linaro.org
X-Google-Smtp-Source: AGHT+IHHs+7cG3yBqbP2CUYMMFkJqHnI9q0x2e6VQzTHj/t691+iGy2Z8oKDSP/jdL3ZdxfCIMNM
X-Received: by 2002:a05:600c:3ba2:b0:454:aec9:1db5 with SMTP id 5b1f17b1804b1-454af62e63cmr21873315e9.16.1751554398640;
        Thu, 03 Jul 2025 07:53:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751554398; cv=none;
        d=google.com; s=arc-20240605;
        b=T2Yrl77H6v54kNClq+ND1WzVy83DqmZY6c1waLvVuGwYNDfCwshDHS6MAu/HtEw1uw
         eAISSgBo1lDU+P/aX/1EISq7J3+Q6RbmwUQ21n80VhBtkuqsdo727/OHsai2WEAoQhzN
         0/kJJqYA1JeLSjTzLtPU4DP0RP1waGJp6KpU6X/ft+kSmt8IJYfYtY3XEbt124uatpbo
         ixT9Z9Wz/EUWuF6kkypNdNs7GD9A3uhYJm8isZAmng4Zd9wCO9E9OyFNyqTW6ydaQT55
         yujLuldD7pspGSWYfKr7ZyMFvoWEbv7M7ImDLey7VBairTmvZWifiJuhJMlLwwGqHPhd
         Xg1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=vVqLo1qJo34I9Z5Qh3uy5Nbf94ODxvyeSAyWmES8VQQ=;
        fh=De5j/+RFiHp5oysg/kfBHcT9O0ASuV5hpNukEk4skqM=;
        b=Gpb5+vdzZNFkxg7IFqJpkK2fGBiKhQs7vd1lkWPluiCQGEjYdENxcx2dxpqRYjdn44
         CFLnqxwY2yVdv4qfg0JM++dvEeqmT68RVEQ8VRdWnFD8ZgaboWdGQNiZIm/gZkLchhHd
         if6IxsRgOimBcF1SYGKDwglHf5ArorIV/14Z0ggnbYAxtfXUDgqicS2rQTXmvNjvoG2g
         Wmfo4IyczHCuc4q+7wA4Vx70dABzoyv0bWUNgQvH1eJ473cgexSL3+rPG4RcUdCXESoC
         KeE8lrXf2BYKAz8ieAef4lpTDDMrT93VSzIDG3LBO5Myw3QVIeWODJGX0IGdaDNQH/uN
         PNSQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-454a9999899si19851065e9.113.2025.07.03.07.53.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Jul 2025 07:53:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bY09J4GKRz6M4gH;
	Thu,  3 Jul 2025 22:52:20 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id CBE16140447;
	Thu,  3 Jul 2025 22:53:17 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 3 Jul
 2025 16:53:17 +0200
Date: Thu, 3 Jul 2025 15:53:16 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Eric Auger <eric.auger@redhat.com>
CC: <eric.auger.pro@gmail.com>, <qemu-devel@nongnu.org>,
	<qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <imammedo@redhat.com>,
	<gustavo.romero@linaro.org>, <anisinha@redhat.com>, <mst@redhat.com>,
	<shannon.zhaosl@gmail.com>, <pbonzini@redhat.com>, <philmd@linaro.org>,
	<alex.bennee@linaro.org>
Subject: Re: [PATCH v5 22/36] tests/qtest/bios-tables-test: Update ARM DSDT
 reference blobs
Message-ID: <20250703155316.00006a06@huawei.com>
In-Reply-To: <20250703123728.414386-23-eric.auger@redhat.com>
References: <20250703123728.414386-1-eric.auger@redhat.com>
	<20250703123728.414386-23-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500010.china.huawei.com (7.191.174.240) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: b/mIj1zIVl79

On Thu,  3 Jul 2025 14:35:22 +0200
Eric Auger <eric.auger@redhat.com> wrote:

>     Changes relate to the introduction of pieces related to
>     acpi-index static support along with root ports with no hotplug.
> 
> +
> +    Scope (\_SB.PCI0)
> +    {
> +        Method (EDSM, 5, Serialized)
> +        {
> +            If ((Arg2 == Zero))
> +            {
> +                Local0 = Buffer (One)
> +                    {
> +                         0x00                                             // .
> +                    }
> +                If ((Arg0 != ToUUID ("e5c937d0-3553-4d7a-9117-ea4d19c3434d") /* Device Labeling Interface */))
> +                {
> +                    Return (Local0)
> +                }
> +
> +                If ((Arg1 < 0x02))
> +                {
> +                    Return (Local0)
> +                }
> +
> +                Local0 [Zero] = 0x81
> +                Return (Local0)
> +            }
> +
> +            If ((Arg2 == 0x07))
> +            {
> +                Local0 = Package (0x02)
> +                    {
> +                        Zero,
> +                        ""
> +                    }
> +                Local1 = DerefOf (Arg4 [Zero])
> +                Local0 [Zero] = Local1
> +                Return (Local0)
> +            }
> +        }
> +
> +        Device (S00)
> +        {
> +            Name (_ADR, Zero)  // _ADR: Address
> +        }
> +
> +        Device (S08)
> +        {
> +            Name (_ADR, 0x00010000)  // _ADR: Address
> +        }
> +
> +        Device (S10)
> +        {
> +            Name (_ADR, 0x00020000)  // _ADR: Address
> +        }
> +    }
>  }
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
