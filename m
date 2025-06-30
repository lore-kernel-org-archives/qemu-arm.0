Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp2434426dye;
        Mon, 30 Jun 2025 05:28:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVUadWC+EgZUoghoj824lLR/8eaCOuvRHIEihxjh6VhM7OZHVij2aJq1CVWybADOnzBHQQ366nTTYbB5g==@linaro.org
X-Google-Smtp-Source: AGHT+IHpa8gPn9JPbnREErCCvc/p5qXyo/BrBdgxPRnnWo9iaZOq3zrQmh1W95QF39upfPx2c9E2
X-Received: by 2002:a05:6000:410c:b0:3a3:621a:d3c5 with SMTP id ffacd0b85a97d-3a8fe0e92d3mr7541209f8f.19.1751286532710;
        Mon, 30 Jun 2025 05:28:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751286532; cv=none;
        d=google.com; s=arc-20240605;
        b=E6s0eEYg/X6Tc1uBYlFyvCuv2CPYpqnZyrJjomYEGZ8yW2id145jaTRk18Ukmza5tG
         NoK36JmcVCbRrw/dnoZ0JVEkrQ+i01invgZ3qQNVPtWLI+wOOl8TPaG+S+/ToMZRKhue
         GZ9ZmdfNv5oqeQyzaCKs6y/5T1Oa4fAdEnVxPTnLJ+am1+kx/6iJ24MoL+rIejBFuf5Y
         hXqFGR8NPnwC4gjixx+cM4AOvngsmwWa7V2fnfsSys9/DNSQ9W3OtISoBaxu+RYSW4+P
         f7iB5nnRDmtMGZJj7ywEnN3W5o+6s1Iz+986hXXz2MOT0xpSEfNz7usIJXSbfKcKfkYh
         kOyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=1t54SNu5z7BjEGDmmy6vr5vAOAPEGR+XE+RLwkDQ2R4=;
        fh=De5j/+RFiHp5oysg/kfBHcT9O0ASuV5hpNukEk4skqM=;
        b=ldjm4oYMbMz2WJY9X42AcWtZnQQj7+D6DMpJNYk+yDkVd4OL6uwVQ1t3VPCTFvQDWT
         YxRMJVeOCJy/g8IqcgiLBseJqdGP8bnUW3CKwAGOyBvKh39x/mi7UDHVGkwhmCwRYhp4
         9temJDcMFqwihKC14dkR99gs+NRURgm9zv5JYNimx5Aug2CL/5gb8C/KqgHla9lB3e1t
         gb24zvsYd+umohhItrG+VZmNEg/xcVQGzQjMRAGAnuLdFKgfaCjHk7OTVyy5aH1ABExQ
         GHqCTgZLUfO/0PB/K27Ve3osU2p6DJhhnED9sWrtSRFIM3g+P1eP/qtnm42Jw/BL8GGL
         GlNA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a8a081a55csi5867914f8f.792.2025.06.30.05.28.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Jun 2025 05:28:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bW53w2yW8z6L5Pn;
	Mon, 30 Jun 2025 20:26:04 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id E07571402F1;
	Mon, 30 Jun 2025 20:28:51 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 30 Jun
 2025 14:28:51 +0200
Date: Mon, 30 Jun 2025 13:28:50 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Eric Auger <eric.auger@redhat.com>
CC: <eric.auger.pro@gmail.com>, <qemu-devel@nongnu.org>,
	<qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <imammedo@redhat.com>,
	<gustavo.romero@linaro.org>, <anisinha@redhat.com>, <mst@redhat.com>,
	<shannon.zhaosl@gmail.com>, <pbonzini@redhat.com>, <philmd@linaro.org>,
	<alex.bennee@linaro.org>
Subject: Re: [PATCH v4 18/32] hw/arm/virt-acpi-build: Let non hotplug ports
 support static acpi-index
Message-ID: <20250630132850.00006da9@huawei.com>
In-Reply-To: <20250627095620.3300028-19-eric.auger@redhat.com>
References: <20250627095620.3300028-1-eric.auger@redhat.com>
	<20250627095620.3300028-19-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100009.china.huawei.com (7.191.174.83) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: 8tE6N0M1W3up

On Fri, 27 Jun 2025 11:55:07 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> hw/arm/virt-acpi-build: Let non hotplug ports support static acpi-index
> 
> Add the requested ACPI bits requested to support static acpi-index
> for non hotplug ports.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
Matches up with the i386 code so LGTM
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
