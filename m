Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp592127dyc;
        Thu, 3 Jul 2025 07:55:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW6UqkNib4JNJogS6lalWLyRUAjoQVuNVJergnBPh59JsKzBUOtg1BmkbsaLr4on8bhGu0HumGhJ3FeSw==@linaro.org
X-Google-Smtp-Source: AGHT+IG/Zts+N1VT98Q+nvSz8oG1UbV6VXcbiJ2APWhe0dgZngaNnA0a/F6xA3pvIs4PCK9ZZjof
X-Received: by 2002:a05:600c:3b8d:b0:43d:94:2d1e with SMTP id 5b1f17b1804b1-454b11fdf6cmr5523695e9.13.1751554539350;
        Thu, 03 Jul 2025 07:55:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751554539; cv=none;
        d=google.com; s=arc-20240605;
        b=J5wCpZA3Kgvqm98fvE1x2MWZz/SGdPRfrBOdgLdUrY+JGzgphFeiMkz5aqcVIngRfA
         2DnTCokmRvXMuFO2xgteYIq4pKtEt6RU1VG+KrfR4PymhrSh5qeI5EV6rlDHI7mAQa6m
         sfpG6DSwrxWmi0/4ZppizURKf6DaoaPOcUyTGjx0MVzxl51iHrkn1BEz72YlS3ekR6zt
         R2xzV0pm7kXNNNbx4XyO8Ml+40QxJQJVh3VoDADlx+C2Ny73EcQG0x3BZdRmVvZDZxJ6
         ld9pAHrG80ByEnrNrGnViS2fbqPwUE04zuqqreySH9usRABVaEuSGPmleb5uKsGPuMKH
         9OYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=4slXgz+kSSVD8aqVy1ITGEe96naCWVeBECEgVHq3qZw=;
        fh=De5j/+RFiHp5oysg/kfBHcT9O0ASuV5hpNukEk4skqM=;
        b=bEqTTFXP7+PJYr62lPm5X7R2mjNhnrIcBxPbh1GoozEDl79ZXEjx1Avk68x29AKOKG
         BgojMg3TvpdVYsd5P/ZCm7UXiBfB1z4H3/vNahocZtVE6y7B07YGPZqejY+gKLhh7nUO
         BHM00hZREyIAczDMW+GPdDxWK55Mvy/Gr7VzyJlWZ4gTFWYCOH6yPFBHfeQKJ/AyXcqq
         F4udOlmMZzVX2CNepd2kNQnG0nI0grEBF4ppJMcOE81zc5hbHBEYzjwbjQCJM4Rbm2Ri
         HrT2dUxGABEbZnFbPSiqwi8mczvrp8r6mrgvpTFHJHPmzfq7+vYCxc0QzcGy6Dqso6VH
         6VrQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a8a081000asi11690871f8f.636.2025.07.03.07.55.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Jul 2025 07:55:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bY0DY21vyz6L59g;
	Thu,  3 Jul 2025 22:55:09 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 9B184140447;
	Thu,  3 Jul 2025 22:55:38 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 3 Jul
 2025 16:55:38 +0200
Date: Thu, 3 Jul 2025 15:55:36 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Eric Auger <eric.auger@redhat.com>
CC: <eric.auger.pro@gmail.com>, <qemu-devel@nongnu.org>,
	<qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <imammedo@redhat.com>,
	<gustavo.romero@linaro.org>, <anisinha@redhat.com>, <mst@redhat.com>,
	<shannon.zhaosl@gmail.com>, <pbonzini@redhat.com>, <philmd@linaro.org>,
	<alex.bennee@linaro.org>
Subject: Re: [PATCH v5 28/36] hw/acpi/ged: Prepare the device to react to
 PCI hotplug events
Message-ID: <20250703155536.00000372@huawei.com>
In-Reply-To: <20250703123728.414386-29-eric.auger@redhat.com>
References: <20250703123728.414386-1-eric.auger@redhat.com>
	<20250703123728.414386-29-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500010.china.huawei.com (7.191.174.240) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: 9q+b31ku35nm

On Thu,  3 Jul 2025 14:35:28 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> QEMU will notify the OS about PCI hotplug/hotunplug events through
> GED interrupts. Let the GED device handle a new PCI hotplug event.
> On its occurrence it calls the \\_SB.PCI0.PCNT method with the BLCK
> mutex held.
> 
> The GED device uses a dedicated MMIO region that will be mapped
> by the machine code.
> 
> At this point the GED still does not support PCI device hotplug in
> its TYPE_HOTPLUG_HANDLER implementation. This will come in a
> subsequent patch.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
