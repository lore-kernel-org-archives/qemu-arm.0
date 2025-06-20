Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp745883njc;
        Fri, 20 Jun 2025 01:54:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWe3BKBkx4fcleV8ZAgXbBy9fOukKN2UFHhiKnm1aqe2AaNiVxWu4RHZtIB9QJDQ+zMFSMCz8ERK8EPHg==@linaro.org
X-Google-Smtp-Source: AGHT+IGySq6w6R8d6TPhredY5emRaIwaGJGf0hpt/ZzoKlk+pENV3VHYRd1xjMvJNYzRJws39UA/
X-Received: by 2002:a05:600c:b8a:b0:450:d4a6:799e with SMTP id 5b1f17b1804b1-453658bac1fmr13626755e9.20.1750409690135;
        Fri, 20 Jun 2025 01:54:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750409690; cv=none;
        d=google.com; s=arc-20240605;
        b=Er44RE+/RVldpI6DszAHCvEp/oqjues5TxnpZ4sYwat1Y9MweXUJYQmgwXFf5fMyc4
         IHfWYkZLCfpP0me6aGS0jvodUcemRVBUvdUXpCsfqUHK6GSsFLfS7YUdcBtqfbquGpAK
         FeFpKhwggNgvJ1qddyWmdrtIc663vSWSS0ZFsbK7zHK8JNgr2zgszoUH3eKSwMP4kQVC
         1m3frBk07olJAlo0myIK2/Cn7okFoCG1IF9Leal9P2zSIT+hK3rQfPhL2lN5aCm/9Mfb
         cNTk1qy1kjt083vjz8ZwlTOnXKnPK+HH0463wnNF8DAVxcmfWXbwj2fNShWgyI5mCvf1
         wCaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=+mJNBU7QNBLdvsz4aUFBLf1cox6A/ndPGjjAnlc4zvo=;
        fh=De5j/+RFiHp5oysg/kfBHcT9O0ASuV5hpNukEk4skqM=;
        b=EqiWvdodCUJjaetCtVsWRSIM+Qu9cC/L92n1GWtEDbDa/zX1HFjx78JKrkCovFuxIP
         d9SDZRrgXxl9NOP59GBEVolaypm7rDwNpV+0NqZXt6vgBPjK3xGsceisEpM+kMwoYu3l
         Eu2Gg9fET+WOw6hjpp7Wd2l5nol81XgYBJmw65bCU49ulEMkmWgdCUl0Dt9mULXEUw+7
         3be7UHHbOkR/+fi6fAiUQQ9k2jUwVxbmSfLVIwnysKpU28+Vc8CNMXyOa7tuDqxfVyR0
         lwjcHb7tZGu2gXIBmrhB/3MfPT3bxI6wgj1OmMpU9pcrxNS2iWskBnr6e04tHcN0e/hZ
         vBAQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a6d117ef1asi1044942f8f.234.2025.06.20.01.54.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Jun 2025 01:54:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bNrr326Khz6M60P;
	Fri, 20 Jun 2025 16:54:11 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 2DC8314027A;
	Fri, 20 Jun 2025 16:54:49 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 20 Jun
 2025 10:54:48 +0200
Date: Fri, 20 Jun 2025 09:54:47 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Eric Auger <eric.auger@redhat.com>
CC: <eric.auger.pro@gmail.com>, <qemu-devel@nongnu.org>,
	<qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <imammedo@redhat.com>,
	<gustavo.romero@linaro.org>, <anisinha@redhat.com>, <mst@redhat.com>,
	<shannon.zhaosl@gmail.com>, <pbonzini@redhat.com>, <philmd@linaro.org>,
	<alex.bennee@linaro.org>
Subject: Re: [PATCH v3 08/29] hw/i386/acpi-build: Turn build_q35_osc_method
 into a generic method
Message-ID: <20250620095447.000062b8@huawei.com>
In-Reply-To: <20250616094903.885753-9-eric.auger@redhat.com>
References: <20250616094903.885753-1-eric.auger@redhat.com>
	<20250616094903.885753-9-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100001.china.huawei.com (7.191.160.183) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: qtGCUZ1SJgB2

On Mon, 16 Jun 2025 11:46:37 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> GPEX acpi_dsdt_add_pci_osc() does basically the same as
> build_q35_osc_method().
> 
> Rename build_q35_osc_method() into build_pci_host_bridge_osc_method()
> and move it into hw/acpi/pci.c. In a subsequent patch we will
> use this later in place of acpi_dsdt_add_pci_osc().
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
New location makes sense.
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
