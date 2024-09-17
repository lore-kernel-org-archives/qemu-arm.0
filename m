Received: by 2002:a17:504:1bc1:b0:1be9:327d:8ee3 with SMTP id v1csp38687njg;
        Tue, 17 Sep 2024 01:38:59 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXNQS/NKBl1kuC8QlxsCoNFabPZ890D4995QtC5EE8rQNYYVp+onN8pVTT12APbUWNP8UkZ7Ff1LLr7Gw==@linaro.org
X-Google-Smtp-Source: AGHT+IGx0XosrqrxPyTKQlp6jZrvh+2CA23zmvTEO0zXZWH9FEefrC7rr6TiaHqmcLAGUNyImgJH
X-Received: by 2002:a05:600c:1c04:b0:426:6308:e2f0 with SMTP id 5b1f17b1804b1-42d964d8558mr95337915e9.26.1726562339285;
        Tue, 17 Sep 2024 01:38:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726562339; cv=none;
        d=google.com; s=arc-20240605;
        b=EyZ/cqN/yVV7Mk3786dqKxTLeiBMmm6xuwYZllyoWR3zN34DKS3VC5Fprel/FVoZgR
         nfpwkWy6s0RMz2jYREVPzhS1lRJm/l0C3yCkwSvtfUJ/t8ntqkD+zRVOcrqSouxjErUl
         JE5xNOR0eLVGkwMJRg3csG9TWq+v/tiC4rJS2znRudpUQOuk3jtXBMXljD3apX+2Blxl
         icr7wPdE/5wqNyU9CgcG3o88qlMkVuiNscI+hfhJoEa4o2HhWiosvIgCWQv1SaUwyjDB
         IbIUHNeXxMIF/kzWifaYW93+JmpPb9cbJzhgOZgXC4Kau2suBVuDnibS457twoae7DlO
         CH5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date;
        bh=aPbGXfW5Kbc4t/YdoDedtmxDFeGw7XyuKzj6XeGN4uA=;
        fh=rz0whkzKUoIAfodBYJKNiVKk8Ex0Rrp+MqNzSzdvwN0=;
        b=J7W2h49o7ALw8diXM7hWYdG6g1QGUZUItsC+3E+bXcfG7xtJXyus/TUKZ3yfHUNZAI
         +uXGNI4OhALIKQWR+IM6v/32EinpunlPYZQRmvHnT9rKxCjbmoqvX0f3baYn0OW5TvGM
         qbUJH1YQndzsdZlKdkqiQqwGWZwbDgpp64vNgnlQxbV56w3nZgD9znDVjPMhInlTnapQ
         LipiogWrgl5hSxKNrepo92vBgwguUE0SnlKEPSslH7f+lRiJIj7kGz/s7XgWtc1k8s2n
         QRmt2XB8X+2Q7z+gy1oOPFdpB7iS274LqXvYnnUvHuDp+pDCBXsMH6tU2BZcnPFDkfJ5
         Kysw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-42da2438c0asi33112545e9.130.2024.09.17.01.38.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Sep 2024 01:38:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4X7FTX3spvz6D9JF;
	Tue, 17 Sep 2024 16:35:12 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 761F0140B55;
	Tue, 17 Sep 2024 16:38:58 +0800 (CST)
Received: from localhost (10.48.145.97) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 17 Sep
 2024 10:38:57 +0200
Date: Tue, 17 Sep 2024 09:38:55 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Zhao Liu <zhao1.liu@intel.com>
CC: "Daniel P .\" =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>, Igor  Mammedov <imammedo@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, Marcel  Apfelbaum <marcel.apfelbaum@gmail.com>, Philippe =?ISO-8859-1?Q?Ma?=  =?ISO-8859-1?Q?thieu-Daud=E9?= <philmd@linaro.org>, Yanan Wang  <wangyanan55@huawei.com>,  Michael S.Tsirkin  <mst@redhat.com>, Paolo Bonzini  <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, Eric  Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>, Marcelo  Tosatti <mtosatti@redhat.com>, Alex =?ISO-8859-1?Q?Benn=E9e?=  <alex.bennee@linaro.org>, Peter Maydell <peter.maydell@linaro.org>, Sia Jee  Heng <jeeheng.sia@starfivetech.com>, Alireza Sanaee  <alireza.sanaee@huawei.com>, qemu-devel@nongnu.org, kvm@vger.kernel.org,  qemu-riscv@nongnu.org, qemu-arm@nongnu.org, Zhenyu Wang  <zhenyu.z.wang@intel.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>, Yongwei Ma  <yongwei.ma@intel.com>"@domain.invalid
Subject: Re: [PATCH v2 1/7] hw/core: Make CPU topology enumeration
 arch-agnostic
Message-ID: <20240917093855.00004745@Huawei.com>
In-Reply-To: <20240908125920.1160236-2-zhao1.liu@intel.com>
References: <20240908125920.1160236-1-zhao1.liu@intel.com>
	<20240908125920.1160236-2-zhao1.liu@intel.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.145.97]
X-ClientProxiedBy: lhrpeml100002.china.huawei.com (7.191.160.241) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: NSxPRgB7SbY8

On Sun,  8 Sep 2024 20:59:14 +0800
Zhao Liu <zhao1.liu@intel.com> wrote:

> Cache topology needs to be defined based on CPU topology levels. Thus,
> define CPU topology enumeration in qapi/machine.json to make it generic
> for all architectures.
> 
> To match the general topology naming style, rename CPU_TOPO_LEVEL_* to
> CPU_TOPOLOGY_LEVEL_*, and rename SMT and package levels to thread and
> socket.
> 
> Also, enumerate additional topology levels for non-i386 arches, and add
> a CPU_TOPOLOGY_LEVEL_DEFAULT to help future smp-cache object to work
> with compatibility requirement of arch-specific cache topology models.
> 
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> Tested-by: Yongwei Ma <yongwei.ma@intel.com>

LGTM
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
