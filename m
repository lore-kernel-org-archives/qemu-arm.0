Received: by 2002:a05:693c:2909:b0:17e:9665:bf4c with SMTP id rk9csp592979dyc;
        Thu, 3 Jul 2025 07:57:23 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVymoK7jQvZqRv0zsH4CC03huofYDgiL9BFIOGCJHIicUSUSycgDYHjrANNOf7nELKY/F9wcrjHVKEsCQ==@linaro.org
X-Google-Smtp-Source: AGHT+IE7a76SxYZDa+90AGu0flfq1DD/xLtumYlHCRhb/XXfvM3M4n5PW2CDksuhNAS+bbc6Ip7+
X-Received: by 2002:a05:600c:638e:b0:43c:f44c:72a6 with SMTP id 5b1f17b1804b1-454a36d8b1bmr74181285e9.2.1751554642895;
        Thu, 03 Jul 2025 07:57:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751554642; cv=none;
        d=google.com; s=arc-20240605;
        b=F01tA0juRK/3R3UDtDsFAmY0q5boguPatifC83CfAgKU8O8vjrar0zELsTt4oofwKr
         BR1BlG9o2yDH3ETiGqaL0mwcSUmVbCLOzNJLPaujvPDmpRnNm5HxDl0xjru5VYUncPZ0
         C9s/H1JL3hxTB7Z5cwsYTjhnikLeZRTywbowQQNSB6WAK35CuN/pmlB5ydp7SlDKFChQ
         YXPZjvEp8zXveikbsPSwTxIkMaNh+lAlxKUooL1hKUB4EURNZ2xyAdzmW58G9iD0UEjf
         VRfTUNWAMV0HDwwUagzBFCpUqTra7N36CXnTPve8KO/7pZZfd8GPkL+yunaHY/Vrx0R2
         HIBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=incfpg2vySlUsqx9c+NgtdogmjIQ/XVmht9agCcYqI0=;
        fh=De5j/+RFiHp5oysg/kfBHcT9O0ASuV5hpNukEk4skqM=;
        b=KisOizCUAFT+96k02IlH534QaIsX65wdut/m9BxqwNj4XlZwxgc3aK7W6BkStfiuqH
         r51N7BdFW2gZbJKO2k4UaXPTxUMSCeCIH3RH0mz3F4cdTJyVQsSaqzPJ5Wtd7DQMmzgT
         aC+ynFRHOJhCQLgZbXNr4dcKrfO9OncknVtct2fO0yfjXdhxb/E6ikI6fStL9AL8b05V
         5oH+WNlXLAQBCf9toGzisvsDFlGdfx0f35R38wJKcZY4XpEDydHSgmTqMtymFb4vZQNE
         QSrlhrvUHnlxLgywHwlaCEaCWwKuRXRvmNZ/u93vrN5Or+Z/16nFBLcrS+hxjzMV1j7J
         O7OQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-454b16110cfsi111135e9.13.2025.07.03.07.57.22
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Jul 2025 07:57:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bY0Cj5cxlz6L52H;
	Thu,  3 Jul 2025 22:54:25 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 1D58C1402F7;
	Thu,  3 Jul 2025 22:57:22 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 3 Jul
 2025 16:57:21 +0200
Date: Thu, 3 Jul 2025 15:57:20 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Eric Auger <eric.auger@redhat.com>
CC: <eric.auger.pro@gmail.com>, <qemu-devel@nongnu.org>,
	<qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <imammedo@redhat.com>,
	<gustavo.romero@linaro.org>, <anisinha@redhat.com>, <mst@redhat.com>,
	<shannon.zhaosl@gmail.com>, <pbonzini@redhat.com>, <philmd@linaro.org>,
	<alex.bennee@linaro.org>
Subject: Re: [PATCH v5 32/36] hw/arm/virt: Let virt support pci
 hotplug/unplug GED event
Message-ID: <20250703155720.0000355d@huawei.com>
In-Reply-To: <20250703123728.414386-33-eric.auger@redhat.com>
References: <20250703123728.414386-1-eric.auger@redhat.com>
	<20250703123728.414386-33-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500010.china.huawei.com (7.191.174.240) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: zuPad5Y6SpMB

On Thu,  3 Jul 2025 14:35:32 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> Set up the IO registers used to communicate between QEMU
> and ACPI.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
