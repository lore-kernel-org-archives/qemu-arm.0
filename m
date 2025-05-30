Received: by 2002:a17:504:1b46:b0:1be9:327d:8ee3 with SMTP id t6csp1034414njh;
        Fri, 30 May 2025 03:18:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUulIrYwaKjv+KjC2OgMdGHm9A+qWTHQj3SHwPCAKFLwzhTuO9pnTR6VajqQUiDMAp6J7148SaEuZtuOw==@linaro.org
X-Google-Smtp-Source: AGHT+IH5cvEdUzs5rqOSMQp0dK/UVg668FMveH+Tlt4huS+DZeY7ndThf42KTZBXBLcdcdstfX9k
X-Received: by 2002:a05:6000:2303:b0:3a4:da87:3a73 with SMTP id ffacd0b85a97d-3a4f89dcc3amr1159523f8f.42.1748600314311;
        Fri, 30 May 2025 03:18:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748600314; cv=none;
        d=google.com; s=arc-20240605;
        b=VQvGZGO0qf29eG2lozobOKcq8M5DQJu8UUwxjDEcaw0KbVU/5aSL5d2znX6A7Gft7u
         0qh2+1aqL3DiR9WeJ38Q/9iPkCEzYI0xHBwT/48gNr/qkHxgpsyAnTbPDeHYGPzKNlz4
         LLTexytyoT2j0qgEjyypRtkEG/+bhD+MGCK+3Ab85GqiTDuQBV/g0Rm4SlXJKvzXvXqh
         +bLwy7Gq9Plol/Ryq8NbeqZK8l5kGXGFtXX5BwZ1Z+aGBJjtGPfwpeDf9NqI6A5BsyHz
         RwzMof+ozLG9QkUCQENIXl4wQBRZA2ETU3/vf97TIJGZFWpNscI8QsVwUx+a/D+h2aNg
         wxTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=Hv88Gk26Rw/Fsh9KdcO2RilNQMJUnr9c6vPvcl3FA2c=;
        fh=De5j/+RFiHp5oysg/kfBHcT9O0ASuV5hpNukEk4skqM=;
        b=QoDM3nkCfLmuQs71H/I0jZOQx6OLz4Ul0qr2h/efydIIacXYk7MpeI/+Y9NgN3Yrif
         CfZfM+hBLccrqlaviKc8x17sHSqFS/OO4f4iP09N6126nXAdNi6cz1X7MV9yN0Ndd/Ax
         fc61NoCKZGR4SF007LcYSWdJQB5U/461DI+wvsdLw1I6+G69nZl2myWcsZdqDne6bDtc
         qDfHykq94kWpbAI4G0IMEBZOwlXvGicEnscaTMGDQUJtE7m+vHVDJVavPFfm45N/oYkd
         Rnqsx2ncBYd3+edHYyVa3u3ijxPK9VnC6yVKLkvptHZSuol/oPmnWekEI17+uL6UYtz/
         6Y3A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a4efe57a7dsi2624033f8f.126.2025.05.30.03.18.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 May 2025 03:18:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4b7zgb4Fk5z6L57H;
	Fri, 30 May 2025 18:17:15 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id A7A831402FC;
	Fri, 30 May 2025 18:18:33 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 30 May
 2025 12:18:33 +0200
Date: Fri, 30 May 2025 11:18:31 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Eric Auger <eric.auger@redhat.com>
CC: <eric.auger.pro@gmail.com>, <qemu-devel@nongnu.org>,
	<qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <imammedo@redhat.com>,
	<gustavo.romero@linaro.org>, <anisinha@redhat.com>, <mst@redhat.com>,
	<shannon.zhaosl@gmail.com>, <pbonzini@redhat.com>, <philmd@linaro.org>,
	<alex.bennee@linaro.org>
Subject: Re: [PATCH v2 12/25] hw/acpi/pcihp: Add an AmlRegionSpace arg to
 build_acpi_pci_hotplug
Message-ID: <20250530111831.000004e1@huawei.com>
In-Reply-To: <20250527074224.1197793-13-eric.auger@redhat.com>
References: <20250527074224.1197793-1-eric.auger@redhat.com>
	<20250527074224.1197793-13-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100006.china.huawei.com (7.191.160.224) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: DX+HltDNu8ns

On Tue, 27 May 2025 09:40:14 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> On ARM we will put the operation regions in AML_SYSTEM_MEMORY.
> So let's allow this configuration.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
