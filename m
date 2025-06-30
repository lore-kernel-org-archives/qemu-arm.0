Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp2448255dye;
        Mon, 30 Jun 2025 05:55:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXvhwWY809uhs380buQiQNl3MhR6BYi65fEYTWQhhrj2gfbCQPpnD9K+6KZgLlhVs4/O0U/ma6LmEekMg==@linaro.org
X-Google-Smtp-Source: AGHT+IGvJUn7C7bqHSF2fO88Wjvb/f9LBDCsbnlewHLvOfCrGkunOPxN4mvlKkqTkU2tZHU5cFqU
X-Received: by 2002:a05:600c:8b8b:b0:453:b1c:442a with SMTP id 5b1f17b1804b1-4538ee70f31mr125378455e9.27.1751288111954;
        Mon, 30 Jun 2025 05:55:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751288111; cv=none;
        d=google.com; s=arc-20240605;
        b=LFVjoAfHklSSD5J0G7DEDZz/TgSNT0kmeDde3AmGDYIjOx8va8G5W9fYE9JsMu8bma
         V9fj3BMtkIgLpqCNkXylIqcx1k9F9dBeCsk3rGQTA9CjUjg9nEht8WZn/+SV3mgKxNbt
         zSCb+HoviZ03/lsQnUrnz0vyyxR4y0htkxMMkCXsaWGCGlcRR8MXSK55TN4+J/rRt99y
         yOXRBS8Bg9q0M9iOCh5rqaiZhpSvg2nUR/GJwVXukcYhhFxZPGzZhw8XtVIF0+wVUkm6
         vWEHuiClO/LzYgA7+MMXyjBJ1YeiQkUw02lxOVZN7t9pTbgwi2Plw5M/XUCi56cxShJi
         o1HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=v/KsQIWEyKXu0Gm6cxvw1U66tBmRAMyMVAMLMHdJk+A=;
        fh=De5j/+RFiHp5oysg/kfBHcT9O0ASuV5hpNukEk4skqM=;
        b=fc5N/ZZMxEV3hgpwAnT81NEvCaTcG0KWZ7LKoM8FdJWikc51rm9e5HFHuHwMHszsLo
         bfjl9X8PNrRiO8dWKB+EzGHIy7ETT60ZWJ5e+ydvAp3YVBt5l3ysYuKRMqxE2a7olnMO
         IG299v4nAukRbTPVjswkbfwtUHPnenixIeGNgnD3yOG0KWje23Zyf2ptKcOIFO17qGhb
         6wNsSljorHdlxJGBcYLOTzrBY4ZIBDFbs1Mn4aIMHBOPgYTz5lVficPKfqN28rBAW3ls
         z+CxWj0oQeqCFzKOjWJG44IaPkmAxuRoLfw2Lm1hRanbZYl1o8K9zoOe3xrOgjya3T3O
         yOeQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a8a07105fesi5728828f8f.543.2025.06.30.05.55.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Jun 2025 05:55:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bW5j71RxQz6L5PH;
	Mon, 30 Jun 2025 20:54:51 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id AACFF140122;
	Mon, 30 Jun 2025 20:55:10 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 30 Jun
 2025 14:55:10 +0200
Date: Mon, 30 Jun 2025 13:55:08 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Eric Auger <eric.auger@redhat.com>
CC: <eric.auger.pro@gmail.com>, <qemu-devel@nongnu.org>,
	<qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <imammedo@redhat.com>,
	<gustavo.romero@linaro.org>, <anisinha@redhat.com>, <mst@redhat.com>,
	<shannon.zhaosl@gmail.com>, <pbonzini@redhat.com>, <philmd@linaro.org>,
	<alex.bennee@linaro.org>
Subject: Re: [PATCH v4 31/32] tests/qtest/bios-tables-test: Add aarch64 ACPI
 PCI hotplug test
Message-ID: <20250630135508.00006892@huawei.com>
In-Reply-To: <20250627095620.3300028-32-eric.auger@redhat.com>
References: <20250627095620.3300028-1-eric.auger@redhat.com>
	<20250627095620.3300028-32-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500003.china.huawei.com (7.191.162.67) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: l/tkjJ1Y+J9J

On Fri, 27 Jun 2025 11:55:20 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> From: Gustavo Romero <gustavo.romero@linaro.org>
> 
> Add 2 new tests:
> - test_acpi_aarch64_virt_acpi_pci_hotplug tests the acpi pci hotplug
>   using -global acpi-ged.acpi-pci-hotplug-with-bridge-support=on
> - test_acpi_aarch64_virt_pcie_root_port_hpoff tests static-acpi index
>   on a root port with disabled hotplug
> 
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
