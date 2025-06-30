Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp2447672dye;
        Mon, 30 Jun 2025 05:53:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW4MwrCrbfh2pkMzIGSyi1bq5c32Smnaj6Nmi9fT2sn3g8xEqQw9qq3rIf/8x80mmR7F87JTOGDgfCLCw==@linaro.org
X-Google-Smtp-Source: AGHT+IEWT9hxGS1EEnVj/rXNPgDC6XqWO0prjOLSqbG5tj7abYQ4ddA0ilyoGDx54djctF/+mBxh
X-Received: by 2002:a05:600c:4750:b0:43b:ca39:6c7d with SMTP id 5b1f17b1804b1-4538ee30effmr157898765e9.3.1751288033195;
        Mon, 30 Jun 2025 05:53:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751288033; cv=none;
        d=google.com; s=arc-20240605;
        b=TxoxMkwlqWRRB09V580JlTmQz5yPZE27aEKU2GO13/6HDpy1Flo00HHfkpjq2hkP6e
         UG0/mqjQMEA3c1vdbosQ3MifeAQKTxpdFyJBnJtOjxjQ9sQxKVNBpxGLV5cXwG1mx2f3
         BLtUBMiAurAORPaU9aRMww+3l7dmWkD4ZeBrd1NLrkYTVqd4bNvA+T2VNUJurB2KceiF
         caljw0XUUpJV1GJ1cHgsqcEp37n/dooWYIqHt0z2lDiQeOUXpmVKZ2426x4oUH7WVwwE
         NiEDMz9mCoqTqne/fihYSjJUhj96PtqgpHJuj0Bxs/xLCwF3wAu1WOswGJ9V9KrezVBX
         Hjhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=2eWXvx8GOV8d3uJnAR+Q8Jl0vPrz7KaZVTYFQfh7Jfg=;
        fh=De5j/+RFiHp5oysg/kfBHcT9O0ASuV5hpNukEk4skqM=;
        b=DTIjkIo2WioYtpd7G8kr6LCLtl2Uz6q/rfuq1R+jhJkuHMg5NicyWkeBoMabsxRf9I
         lbXrDgeL9VaUsZgpxgD5ngZBXQCk3NKLaetkh2kTNBgWAZMQ1tJuSt4WBfkuPuBDdiTQ
         uZDhb6zOUgtIYgCOFOJ4YASA4CxDvE61oba007zBGV5gWgrSP6/A0fqklzva6gZ7lj5S
         3MJVbpk2B2v6PxqO42gcUGXFpHXveMY2oVJ7mYG0rjXNWyqyv3aZ7G9TGJRN05MuwD6m
         L0VytrOQqDNWXgcUhN2vKAyG3DRdBdd6KPAlId0nDextme4/M1seAVGYPlPZA9DoGjR9
         BwFg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-4538a421a65si81271605e9.103.2025.06.30.05.53.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Jun 2025 05:53:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bW5gd0HBwz6L5K3;
	Mon, 30 Jun 2025 20:53:33 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 84F6D1402F1;
	Mon, 30 Jun 2025 20:53:52 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 30 Jun
 2025 14:53:51 +0200
Date: Mon, 30 Jun 2025 13:53:50 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Eric Auger <eric.auger@redhat.com>
CC: <eric.auger.pro@gmail.com>, <qemu-devel@nongnu.org>,
	<qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <imammedo@redhat.com>,
	<gustavo.romero@linaro.org>, <anisinha@redhat.com>, <mst@redhat.com>,
	<shannon.zhaosl@gmail.com>, <pbonzini@redhat.com>, <philmd@linaro.org>,
	<alex.bennee@linaro.org>
Subject: Re: [PATCH v4 30/32] tests/qtest/bios-tables-test: Prepare for
 addition of acpi pci hp tests
Message-ID: <20250630135350.000007fd@huawei.com>
In-Reply-To: <20250627095620.3300028-31-eric.auger@redhat.com>
References: <20250627095620.3300028-1-eric.auger@redhat.com>
	<20250627095620.3300028-31-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500003.china.huawei.com (7.191.162.67) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: dolcXATOHa0K

On Fri, 27 Jun 2025 11:55:19 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> From: Gustavo Romero <gustavo.romero@linaro.org>
> 
> Soon we will introduce new tests related to ACPI PCI hotplug and
> acpi-index that will use a new reference blob:
> 
> tests/data/acpi/aarch64/virt/DSDT.acpipcihp
> tests/data/acpi/aarch64/virt/DSDT.hpoffacpiindex
> 
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
