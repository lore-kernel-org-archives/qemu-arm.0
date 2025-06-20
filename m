Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp744394njc;
        Fri, 20 Jun 2025 01:50:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXKlRgZYci7aHRiv8501W7LcMJHOFBxWjLWeb3Tb0DL7c2U9YyWf+2OHBiBvIIbBcCc8Hh8Uv/v/xZ4+g==@linaro.org
X-Google-Smtp-Source: AGHT+IE9F+et4yosCwFyB6TNshwQQqgD9B0ruA0+RLn7DVldKx14aHmUIXxf4aOmy/WA7/LAb+yY
X-Received: by 2002:a05:6000:4614:b0:3a5:287b:da02 with SMTP id ffacd0b85a97d-3a6d12e5cfcmr1514505f8f.40.1750409429898;
        Fri, 20 Jun 2025 01:50:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750409429; cv=none;
        d=google.com; s=arc-20240605;
        b=X7XjUqqMnWncSf4upLw5HrjYOUBKlbLDiLqCuyZ0NdcEgzGbOeUmWeSGtI3Hnqabet
         W53JekIcqODgrsFh/hGLLBHM9LSe/sfpuCEFFD4INO018qpg7i8z5p9/L29w4gAkqNN8
         ItM6PNy/bppA74lQ41wZ9OY44SU6GF0dwolLt7+wshhtq17QtwNs8D5KPnlDbK4H69jC
         W1sD3he0OYLTEqRGzbOSi7AHUx4HV4a5Go4OR/xs/nMpijd6KfmUVqs1sfVG9XHV/+M7
         aojE1zaoS/ImU5Ngq+zaQEmcp+GVUlkLGSaiRy4EsLYxH4p2nNiHGuhl3zmt194DaKpY
         19cQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=N9ZHrJq7I2GIXM+fE0CP51JNdiuP0hffu3uTUKKwuRA=;
        fh=De5j/+RFiHp5oysg/kfBHcT9O0ASuV5hpNukEk4skqM=;
        b=inaqXcg82Jt+lI1uNpRjpDqj3n2bJAAgB+8HDnXObHubWF6W2saih7qj1b6aSSU6Tp
         o7hZjmS6GOx6AI80rWXTOvm+EF9vkMtX0HKcPudepp/TiJXoPDxk74XyNIy44ehd1dSo
         5hKJT07q16usr/jBALV/Sx2Gx7iAfy4tsPEXkTCVviseNZ9Qn6Xr1OJ9DgmlSxQOdQWM
         oR0UaKwBpaY3DesF7BodR2proYomXkS0NLd9lPPT/huVi9KVUmRQfS70OKCL28qU3Rgp
         zJSvXO67mdBrwMvR9NWEa5YCHhnSS4MoFWPU+zRX6rw2VtmZyvAW/UUahOg/9RqbFWKD
         lQkg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a6d12a3580si939335f8f.696.2025.06.20.01.50.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Jun 2025 01:50:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bNrj66xdDz6L6GP;
	Fri, 20 Jun 2025 16:48:10 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 1D8C41402FE;
	Fri, 20 Jun 2025 16:50:29 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 20 Jun
 2025 10:50:28 +0200
Date: Fri, 20 Jun 2025 09:50:27 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Eric Auger <eric.auger@redhat.com>
CC: <eric.auger.pro@gmail.com>, <qemu-devel@nongnu.org>,
	<qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <imammedo@redhat.com>,
	<gustavo.romero@linaro.org>, <anisinha@redhat.com>, <mst@redhat.com>,
	<shannon.zhaosl@gmail.com>, <pbonzini@redhat.com>, <philmd@linaro.org>,
	<alex.bennee@linaro.org>
Subject: Re: [PATCH v3 06/29] hw/pci-host/gpex-acpi: Split host bridge OSC
 and DSM generation
Message-ID: <20250620095027.00005cfc@huawei.com>
In-Reply-To: <20250616094903.885753-7-eric.auger@redhat.com>
References: <20250616094903.885753-1-eric.auger@redhat.com>
	<20250616094903.885753-7-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100001.china.huawei.com (7.191.160.183) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: Ex0C05AAuxqg

On Mon, 16 Jun 2025 11:46:35 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> acpi_dsdt_add_pci_osc() name is confusing as it gives the impression
> it appends the _OSC method but in fact it also appends the _DSM method
> for the host bridge. Let's split the function into two separate ones
> and let them return the method Aml pointer instead. This matches the
> way it is done on x86 (build_q35_osc_method). In a subsequent patch
> we will replace the gpex method by the q35 implementation that will
> become shared between ARM and x86.
> 
> acpi_dsdt_add_host_bridge_methods is a new top helper that generates
> both the _OSC and _DSM methods.
> 
> We take the opportunity to move SUPP and CTRL in the _osc method
> that use them.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
