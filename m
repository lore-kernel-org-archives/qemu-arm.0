Received: by 2002:a17:504:1b46:b0:1be9:327d:8ee3 with SMTP id t6csp999157njh;
        Fri, 30 May 2025 01:58:16 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXlATuW6bIyrAhqbG6/ltGIVf7v+9qFqTKGjHNylidMLMMQmrm6uw0kIe0S//vNuZjteShhQCwWSiVKZg==@linaro.org
X-Google-Smtp-Source: AGHT+IHcau95NQAwkrXkYwIVEF/hJErurzVku4XeSVusQ6zFIQRjNIOLzRWQf8r+STBj3pPMTMrD
X-Received: by 2002:a05:600c:4e0b:b0:442:f4d4:53a with SMTP id 5b1f17b1804b1-450d64c322amr30906505e9.2.1748595495951;
        Fri, 30 May 2025 01:58:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748595495; cv=none;
        d=google.com; s=arc-20240605;
        b=IhXx8teyEYffsQSTNbBAc/Quk19U/opwJdQVp9bN0zwli5ANEzCyB95I832PoSmoSm
         vaj0CveQIK2YOvH2HGuzZt+c9cHQL3C3UDTA76r1cSh94oz//U6OfRBxNB2X9s0asTTf
         VpgVKS0MWPvvkC/J/r/ENCCV5LREKpuaXKdT07VdSKPKdKKTL4A7eIYbANM7nY5X4D+m
         KDcFqohr9KCjhmXo4+PadB/wnU9LOlECglBH4k47JSF+3KMli75hpGIto/KR1aDLRP09
         7tHYnSU3tF/LOT5hT5VSzqYAb0ibfDqPOTmtZvXznObaoajkQSk5ksAJsMhoqMkSqxtz
         C9eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=hWbKdcKCBfmVqQhgaJLYN6t8SZ4pjLljLmFISVOYqjY=;
        fh=De5j/+RFiHp5oysg/kfBHcT9O0ASuV5hpNukEk4skqM=;
        b=VXTh+d+Fu8ci/dY5tsHIvQIAXzlWi37OOqkXvKXyBSapNhER2XlaghLB5/Nbklw/Hc
         VsNw7frlzKH/E0bBYttnomkXF5uYJR88kqC299EIlyuwjs28vHJM9E1TC/AvBioDmkFF
         EbrICfF+K6LtFKMzkdDyizzS6uGTa45D/myQvjmyTRiXOm0WZlFAmNrAhx41IQm3ah5U
         byVaX7s6matsn39DRoSqcR3Ggm6UF1vTcp2bE8n727g5Y1RK1MXSRnmDi9deGT8Ttx+i
         MfwiPRD521vEnmGzBRPrC78oSdBO7GntwOQ3OxbrPj7pVxTOLx2WfSU+qKhcfRgRcLlx
         Gp7w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a4efe57ae3si2550496f8f.75.2025.05.30.01.58.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 May 2025 01:58:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4b7xtx1pS6z6L54t;
	Fri, 30 May 2025 16:56:57 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 2D5A21404FC;
	Fri, 30 May 2025 16:58:15 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 30 May
 2025 10:58:14 +0200
Date: Fri, 30 May 2025 09:58:13 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Eric Auger <eric.auger@redhat.com>
CC: <eric.auger.pro@gmail.com>, <qemu-devel@nongnu.org>,
	<qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <imammedo@redhat.com>,
	<gustavo.romero@linaro.org>, <anisinha@redhat.com>, <mst@redhat.com>,
	<shannon.zhaosl@gmail.com>, <pbonzini@redhat.com>, <philmd@linaro.org>,
	<alex.bennee@linaro.org>
Subject: Re: [PATCH v2 02/25] hw/arm/virt: Introduce machine state acpi
 pcihp flags and props
Message-ID: <20250530095813.00004984@huawei.com>
In-Reply-To: <20250527074224.1197793-3-eric.auger@redhat.com>
References: <20250527074224.1197793-1-eric.auger@redhat.com>
	<20250527074224.1197793-3-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500003.china.huawei.com (7.191.162.67) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: stLZK299dtzc

On Tue, 27 May 2025 09:40:04 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> acpi_pcihp VirtMachineClass state flag will allow
> to opt in for acpi pci hotplug. This is guarded by a
> class no_acpi_pcihp flag to manage compats (<= 10.0
> machine types will not support ACPI PCI hotplug).
> 
> Machine state acpi_pcihp flag must be set before the creation
> of the GED device which will use it.
> 
> Currently the ACPI PCI HP is turned off by default. This will
> change later on for 10.1 machine type.
> 
> We also introduce properties to allow disabling it.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>

Seems fine though I'm not sure on the default for 10.1
I don't feel that strongly about it though.

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
