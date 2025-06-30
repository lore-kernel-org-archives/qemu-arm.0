Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp2437025dye;
        Mon, 30 Jun 2025 05:33:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUsn2XtKds1ax3qkG87gnkdT8o0rEouSa5t9ecQZX9IrD154+j2dDGdc2XVKjhg6rAPte77xUo29+aCwg==@linaro.org
X-Google-Smtp-Source: AGHT+IGACI4vArQqt9adBKbmF9XEMHFFTLr8bWB5rkXL2UpTX5+Wi5VTIw7bGOvZgh6KpmKttNI8
X-Received: by 2002:adf:a21a:0:b0:3a5:88cf:479e with SMTP id ffacd0b85a97d-3a8fe79c8e3mr7769015f8f.48.1751286790573;
        Mon, 30 Jun 2025 05:33:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751286790; cv=none;
        d=google.com; s=arc-20240605;
        b=e34DaK3RFz4XXOVqQRiXNAI/70R0lPoJNCpbaQS7NrWS+a+feCpIYzw2TVL7a7I+TB
         y6JdEfdlRh/lFErQ5NZjOjUCPQ34HaVP/mUqS0Jnze0vZ4LtRqiZNci7QF3A6nVtLX9S
         rUHi/XqoE+ZQCZecEFMDSnskwzJWjMGkNLPcHby8pe/wEtqEDRvnJ/7pLO/MdIVno6RO
         88HQZUO2EK3wjO8oiID9ABGo/XSgHm9XCN3WW3i+3mhteUdY7zrJaaE5rRyxEknf74Pi
         NQczjW7+SIJqoFfPiz1UxgYYzwaMbyQyIaucHdqTLpZhYuXokbRXsaeY71IapQS61Dj4
         3Gxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=J3OAIRnI5WIPTFxnmd2njjE5ziEIK7N5gA8TQWt0/qo=;
        fh=De5j/+RFiHp5oysg/kfBHcT9O0ASuV5hpNukEk4skqM=;
        b=WbifLZgikP1bdAhs3+JvqupLEJU7nFi1Q9vmshhafNJWPQ4qtOcVejE0neW3DhkdNR
         K+4/WiiIrA/rYhugJNiWtfczqP34sNUXhjG6uOPI6LBl936M5VXZdJmOhgCdHu/M0N/V
         rjOY83hA759yqQk9jCLbJlPLqrepAxDrYFlu1phCLnFYk9nsJsY1AiqZGBN4Dxy2I1hd
         /QfXufrXwveFnvSfnONeLFnQwEI3Av05jH/oAIIPJ9vqLnG9VSjLSU4v1AFGtDkRoaWl
         GGJDRChMO+wk3fNSFKn5waik3swyt3ottngI/NKKu4rTbrE2We6Cr5cPdP/RH/HXyMd7
         d7dw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a8a0710478si5659314f8f.538.2025.06.30.05.33.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Jun 2025 05:33:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bW58t0hjZz6L5PK;
	Mon, 30 Jun 2025 20:30:22 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 878271402EC;
	Mon, 30 Jun 2025 20:33:09 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 30 Jun
 2025 14:33:08 +0200
Date: Mon, 30 Jun 2025 13:33:07 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Eric Auger <eric.auger@redhat.com>
CC: <eric.auger.pro@gmail.com>, <qemu-devel@nongnu.org>,
	<qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <imammedo@redhat.com>,
	<gustavo.romero@linaro.org>, <anisinha@redhat.com>, <mst@redhat.com>,
	<shannon.zhaosl@gmail.com>, <pbonzini@redhat.com>, <philmd@linaro.org>,
	<alex.bennee@linaro.org>
Subject: Re: [PATCH v4 20/32] hw/arm/virt-acpi-build: Modify the DSDT ACPI
 table to enable ACPI PCI hotplug
Message-ID: <20250630133307.00005cc2@huawei.com>
In-Reply-To: <20250627095620.3300028-21-eric.auger@redhat.com>
References: <20250627095620.3300028-1-eric.auger@redhat.com>
	<20250627095620.3300028-21-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100009.china.huawei.com (7.191.174.83) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: gXH2rPb1zRUe

On Fri, 27 Jun 2025 11:55:09 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> Modify the DSDT ACPI table to enable ACPI PCI hotplug.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
