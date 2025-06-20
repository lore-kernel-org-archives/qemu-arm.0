Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp779121njc;
        Fri, 20 Jun 2025 03:09:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVP3Ei3aQ7/Vp8OZbu3lWQ+B+JLRG96gCuwS0HnXXPdGH64WOy8UWhoedbmIJPQ9t29UtWOSz8L7P8VUA==@linaro.org
X-Google-Smtp-Source: AGHT+IET20exx+YQ4zJdL+pvKBqh7PUA0ILuPxDAy9iOeJn7G+0nZSnGl66liI2AxzQ8QLx1SIUA
X-Received: by 2002:a05:6000:4912:b0:3a6:cfca:efee with SMTP id ffacd0b85a97d-3a6d12a15e6mr1498350f8f.17.1750414189968;
        Fri, 20 Jun 2025 03:09:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750414189; cv=none;
        d=google.com; s=arc-20240605;
        b=iyI1aQyVxL+WqbfEf1IuYn8zyKGb2U1tTonSukaq2/B6T90ow4RsfMCJDm+S113n9O
         heA0R2pmsE0Oz0YzfB3hVqv1mwUjo7Yq5pWCXPRDGgRuqRRx1s8fLhEr0qqmjtTjWnx9
         VV/pEUlFuCypJPsYGW5NN2d4oK4Zjtt9gcbeZ9jg1BVWEGGVpvQ3PJT824t6ZwWHLeP2
         9AC+srGdK7JXouep9P6w3UiCe2ocpnTYvNNYeOTMBtaXEpAolgFhirwOnHBpsXJVot6Y
         T16VAmIa6+QR7fhIWo740e5e1sOc6kEQllmYlLn8AIxva9bVzbQaELx2/BmD+OBqedFG
         yTaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=FsDdxdx8rrae/qCQcls7DB3FT/FtNe+li09thX/CQjg=;
        fh=De5j/+RFiHp5oysg/kfBHcT9O0ASuV5hpNukEk4skqM=;
        b=YpUtvM8xjMyfzKZz6wD3iCiGoF0smQaHwGSRvID8mp5fBOiVCyuNoJH+VTOOBI023L
         4OeE6tNB/jofPNOwym/iQuBgixFMrauzJrXraaHk71PDnZxUdiWC7jtW6ZegsGYfwn6x
         MEVih/RMZvn6pe3eWeuIRmHSaqLfUGZGskE6e0/xRYr1rEUhq2aElRe0qeVN6pP/VUQm
         ENNis1L7jLwmDW5r8UvWEXzHR08sGP0zeMqWw42V8AefIrQGu/yWfJXowhD/7Ru3dwyn
         2P1qACtn4pE2d4/ejoyjSjA1xbMcRai9vE+8vOcj6wfBqT+CewqRCJkxG/331jp9u5LG
         gsLA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a6d12b43c2si1053007f8f.868.2025.06.20.03.09.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Jun 2025 03:09:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bNtPp2vBLz6L68F;
	Fri, 20 Jun 2025 18:05:02 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 88B51140447;
	Fri, 20 Jun 2025 18:09:48 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 20 Jun
 2025 12:09:47 +0200
Date: Fri, 20 Jun 2025 11:09:46 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Eric Auger <eric.auger@redhat.com>
CC: <eric.auger.pro@gmail.com>, <qemu-devel@nongnu.org>,
	<qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <imammedo@redhat.com>,
	<gustavo.romero@linaro.org>, <anisinha@redhat.com>, <mst@redhat.com>,
	<shannon.zhaosl@gmail.com>, <pbonzini@redhat.com>, <philmd@linaro.org>,
	<alex.bennee@linaro.org>
Subject: Re: [PATCH v3 21/29] hw/acpi/ged: Call pcihp plug callbacks in
 hotplug handler implementation
Message-ID: <20250620110946.00007d64@huawei.com>
In-Reply-To: <20250616094903.885753-22-eric.auger@redhat.com>
References: <20250616094903.885753-1-eric.auger@redhat.com>
	<20250616094903.885753-22-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500002.china.huawei.com (7.191.160.78) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: GR9BpjjmmYXL

On Mon, 16 Jun 2025 11:46:50 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> Add PCI device related code in the TYPE_HOTPLUG_HANDLER
> implementation.
> 
> For a PCI device hotplug/hotunplug event, the code routes to
> acpi_pcihp_device callbacks (pre_plug_cb, plug_cb, unplug_request_cb,
> unplug_cb).
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
