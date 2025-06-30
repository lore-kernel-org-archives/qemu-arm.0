Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp2439432dye;
        Mon, 30 Jun 2025 05:37:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWuwMIhusOSKQs5IAOVdaqicowNncsiw0BCXmdqCnSa1VojXMb1w/bkv63wT9rT/Msi6k60vz6h+XuaLQ==@linaro.org
X-Google-Smtp-Source: AGHT+IG7BJWE4mkYr5ek3FBpoTtEcePv7Ft2AjMrpWpkvk1LsjqJ77st/XVOBmZGByZCbE6EttoI
X-Received: by 2002:a05:6000:400b:b0:3a5:5270:c38f with SMTP id ffacd0b85a97d-3a8ff8f52c3mr10808101f8f.0.1751287048809;
        Mon, 30 Jun 2025 05:37:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751287048; cv=none;
        d=google.com; s=arc-20240605;
        b=e9nJQBulu8tjCCbwKvu+tl3GRbbKnC6lFLYtQTEYMl5NmyzG7maI7p/RCdvwPzzG/V
         HINwUFvM7rlxaCeGFDlonSpeHdUxoNkL1s9/nlD+3XeP4TuBfZQsOsd1Xgw2laxdJVvP
         GFXtleXeFSDK1t4bhCNBY50tbfsgMA+ujkJZu3aHqL+mubBZyye51GcsA/wXhqLkWWzm
         B6D3C1U/HB2rtmFUS71jz2ztcy6JlV1g3tx6OrsPQ+QEuhIVyzO9grBvRaiAm7HUPHmt
         YXyWT28ElWp3NrMWY7qBHvY5kjwqS+pQvgI8wmZMfqIdlNWGKFoCMMAe4eulHeVOaj6Q
         jrjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=yJtlP0EXLmXubRHE1CGHA792gVx+8Yk8cTP6lCrzt/8=;
        fh=De5j/+RFiHp5oysg/kfBHcT9O0ASuV5hpNukEk4skqM=;
        b=W5FRHPMGogeFRS2CSpHJvr/pdt/6fcBeI5+px22nO6uOOdUl1V8+DUsfhOv+qf25qC
         PVaocEPn3X7O6VJ/XYF9mjIgh2C5HeT852yt+ujKK53FB/iMgwlfTiVbXbvrvnQhqBlY
         cRwyvDM/VHz1XjkbUsk0TpbRdiMPcp1gk3tjyHZu+6Wbf15FVttr1BuhofbRIAQDc9k/
         wXaQWSKa6wDTx3ucu9y6I2C9qj/UaJaMu5CGm0RfwhfuoKFYFsDZGlgrdoSLsnkvtlDU
         jvQvIMx0+G2i5xhuqFA+JbrbFtoL37hmyrP0PfOwg4caT8E+hTdiKSWI17RTo+jc+pI0
         H2KA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a8a081fb2asi5657160f8f.823.2025.06.30.05.37.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Jun 2025 05:37:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bW5Jh4NHCz6L5dv;
	Mon, 30 Jun 2025 20:37:08 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 0EB8F140417;
	Mon, 30 Jun 2025 20:37:28 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 30 Jun
 2025 14:37:16 +0200
Date: Mon, 30 Jun 2025 13:37:14 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Eric Auger <eric.auger@redhat.com>
CC: <eric.auger.pro@gmail.com>, <qemu-devel@nongnu.org>,
	<qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <imammedo@redhat.com>,
	<gustavo.romero@linaro.org>, <anisinha@redhat.com>, <mst@redhat.com>,
	<shannon.zhaosl@gmail.com>, <pbonzini@redhat.com>, <philmd@linaro.org>,
	<alex.bennee@linaro.org>
Subject: Re: [PATCH v4 24/32] hw/acpi/pcihp: Remove root arg in
 acpi_pcihp_init
Message-ID: <20250630133714.00000060@huawei.com>
In-Reply-To: <20250627095620.3300028-25-eric.auger@redhat.com>
References: <20250627095620.3300028-1-eric.auger@redhat.com>
	<20250627095620.3300028-25-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100009.china.huawei.com (7.191.174.83) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: EwUgj9bWI0l+

On Fri, 27 Jun 2025 11:55:13 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> Let pass the root bus to ich9 and piix4 through a property link
> instead of through an argument passed to acpi_pcihp_init().
> 
> Also make sure the root bus is set at the entry of acpi_pcihp_init().
> 
> The rationale of that change is to be consistent with the forecoming ARM
> implementation where the machine passes the root bus (steming from GPEX)
> to the GED device through a link property.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Suggested-by: Igor Mammedov <imammedo@redhat.com>

Seems reasonable to me.

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
