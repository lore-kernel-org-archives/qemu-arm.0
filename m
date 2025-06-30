Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp2404684dye;
        Mon, 30 Jun 2025 04:33:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU5FVBTEy+YYS/VKUwksNAhSG2XEV9Sz8Dsc4q6LYmn7R2vwLMNMPFzrfLPB6I78+2CSxczpeHLY1UOdQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHn8dNJF3O+vHlQcEgvtGAaOTrVAaKRZpUW2apXbBs/rFUoHG+QbEu9Koc7i2PKJEn4KPLB
X-Received: by 2002:a05:600c:1e24:b0:43d:94:2d1e with SMTP id 5b1f17b1804b1-4538ee595f6mr124214475e9.13.1751283210333;
        Mon, 30 Jun 2025 04:33:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751283210; cv=none;
        d=google.com; s=arc-20240605;
        b=B1QUqfdcimwC4ykxQ3DB1xhuPU6dzykbDL50TUSatjuyjY9ox3ekOB7TOSoCqaXib6
         /84Q/0fYCynwKUi8Q3hbrSAzrzc6ykQmbjkJPxv+K08UQlt3blOj5tEaivsV728d1qMI
         VC6fMUr7B2f9jXXae67D3jgyVuGKDT0A93r7dPLUuoOD2G0EjLhFU1T6BtpLGKYOXqoV
         a5Nuo+YvklVTTxcsvl3fT3i5XIIb/b250iGi6V529DIa/pRzMgcloL1PctGNC6ryqJQS
         yOMUrfKPiQkiRPuCch4kjwhRzHzhKBmwYgcB6qX5xxzTHCWb4rhNhdZqOx6u37FzN6Jw
         nzDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=8X8b1xo3MKC+1EifizBm/y5/vuRrSZ5QnTTrW+T/h7Y=;
        fh=De5j/+RFiHp5oysg/kfBHcT9O0ASuV5hpNukEk4skqM=;
        b=HMaxaNPETh5w8oxzPvawJ+jCaqN1Q248VlhjAgs3O5QHWSPmyeipIc530cWSuPIxt1
         ZxnzFazTMyFThEMXv4NMsZiTy+PM3BqdGF6Y9DCCjWx3hA1GLq9Vr0nQRRv6AOQR7icl
         4gXIqlfMPEdzFUrXsERROoR+YI2FOGDK/ix7u9M5SFGvU0PZMoJVxD6p7WE7f/pumpLs
         uD6NrYxkLo9kGYeRZzMj8sHWQFdL/ZIF559G+48LRYx/ceK2wHzQx3dHYlyHYHJ+uy9z
         kzMRec5UUYsvGx8KARPDtIuIEuRsfixkLZECH4UEm3ifAzJwSf6xSGpAF2NAOophqHCf
         Co8g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a8a07106c7si5734074f8f.547.2025.06.30.04.33.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Jun 2025 04:33:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bW3r20kYdz6L5MR;
	Mon, 30 Jun 2025 19:30:42 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 7B2B01404C4;
	Mon, 30 Jun 2025 19:33:29 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 30 Jun
 2025 13:33:28 +0200
Date: Mon, 30 Jun 2025 12:33:27 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Eric Auger <eric.auger@redhat.com>
CC: <eric.auger.pro@gmail.com>, <qemu-devel@nongnu.org>,
	<qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <imammedo@redhat.com>,
	<gustavo.romero@linaro.org>, <anisinha@redhat.com>, <mst@redhat.com>,
	<shannon.zhaosl@gmail.com>, <pbonzini@redhat.com>, <philmd@linaro.org>,
	<alex.bennee@linaro.org>
Subject: Re: [PATCH v4 07/32] hw/pci-host/gpex-acpi: Use GED acpi pcihp
 property
Message-ID: <20250630123327.00004dcf@huawei.com>
In-Reply-To: <20250627095620.3300028-8-eric.auger@redhat.com>
References: <20250627095620.3300028-1-eric.auger@redhat.com>
	<20250627095620.3300028-8-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500004.china.huawei.com (7.191.163.9) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: aGHchZ5WppKF

On Fri, 27 Jun 2025 11:54:56 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> Retrieve the acpi pcihp property value from the ged. In case this latter
> is not set, PCI native hotplug is used on pci0. For expander bridges we
> keep pci native hotplug, as done on x86 q35.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
