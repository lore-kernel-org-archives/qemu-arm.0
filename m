Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp783554njc;
        Fri, 20 Jun 2025 03:18:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVGgNfCuGjc0CtkooU5EwKmJhGdB+1j917GetSX/kpjuB+mx9Vxangvqs4nYX4rhFxkg+742peCZNmLWQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEGn5RKkugH2M5Po7iEETdglRoYvbFvtyN0nAKOihzKI1bKz/+O3kzrLLUyyU7PeG7Sc+oZ
X-Received: by 2002:a5d:5f02:0:b0:3a6:d2ae:82a with SMTP id ffacd0b85a97d-3a6d2ae0a72mr1309267f8f.34.1750414731063;
        Fri, 20 Jun 2025 03:18:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750414731; cv=none;
        d=google.com; s=arc-20240605;
        b=C6FXPlq6cayLumWob9Y4qzzgb/XjcnBYQUtykSWN763T05teOfautDTWvOuIxJwkDT
         /8KQufgiiOTN+7alH9CXpF2o9PXn99e5WjRSOiKJdDJfnIENP/8Wj3Wjc++02maF16oP
         YEJJ5u6r951Bb6QLBuMhU3Wy/wCGQFrnIfQzcd4UA21kE7jjQdN46F9TMIIx7tgEVh5A
         9t1IM7XIK2cgqe9W3QhrUlF41zkOpt9GIstpPwqBL6kSiu/CNhn/ciozARQDfVEvGGoG
         Yed/oJEGiNdqNa0nWmpg2v2ot0NgELoD9TGWnS1oG3Wl/UJNOYYri5AE3Df2nrZoIXdH
         jFnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=BmuD5eB4TqFS6omEbj0LtKoFrHBsVQxcoWODTywOU18=;
        fh=De5j/+RFiHp5oysg/kfBHcT9O0ASuV5hpNukEk4skqM=;
        b=MNwpJFAKdXgEeq6Cg1GlBL3O+7pHxJlngkvlrQnf3CPZzSQd97xG+U5jWRK0N5UXeD
         QbaFgqg3q/VQGmothOqphij5ZRmqdMbOxt754hdll7928uJNO07l0li0SGV+FqsrYTiC
         OgYjNzFLMG72x3rZMnaIdI/5aZG3sjAEye9EXydWU7cyL6yygo8zNU1NqUOOHEpE38NL
         D+d70AppxCiySZsYNBRb/yqr4GOisNGzhsv53RInodWbZnbAFIUsV+NtYpZZoQqRx6zo
         y+scRQyik7VxSuwtHUBQXu/tIZhRfNYqvSZGZbJgYh+7q7XTycUcMlNQDofF1AyN6OAH
         QvMg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a6d117e800si1068954f8f.352.2025.06.20.03.18.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Jun 2025 03:18:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bNtcD1FjZz6L5B8;
	Fri, 20 Jun 2025 18:14:04 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 5509F14027A;
	Fri, 20 Jun 2025 18:18:50 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 20 Jun
 2025 12:18:49 +0200
Date: Fri, 20 Jun 2025 11:18:48 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Eric Auger <eric.auger@redhat.com>
CC: <eric.auger.pro@gmail.com>, <qemu-devel@nongnu.org>,
	<qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <imammedo@redhat.com>,
	<gustavo.romero@linaro.org>, <anisinha@redhat.com>, <mst@redhat.com>,
	<shannon.zhaosl@gmail.com>, <pbonzini@redhat.com>, <philmd@linaro.org>,
	<alex.bennee@linaro.org>
Subject: Re: [PATCH v3 24/29] hw/arm/virt: Use a SysBusDevice variable in
 create_acpi_ged()
Message-ID: <20250620111848.00004156@huawei.com>
In-Reply-To: <20250616094903.885753-25-eric.auger@redhat.com>
References: <20250616094903.885753-1-eric.auger@redhat.com>
	<20250616094903.885753-25-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500002.china.huawei.com (7.191.160.78) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: OIBCy7kRHb85

On Mon, 16 Jun 2025 11:46:53 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> Use an intermediate SysBusDevice variable in create_acpi_ged().
> This allows to get rid of multiple SYS_BUS_DEVICE() casts.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
