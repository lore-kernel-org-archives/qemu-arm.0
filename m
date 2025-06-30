Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp2446790dye;
        Mon, 30 Jun 2025 05:51:50 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW7fo6HFuvmrXY2YCN4c4NUrXQmLt5mBOmjJfQjpSrbonVYSS5/EGaXQEpQ1KwYkOmjZCUZk4cqf9+1hw==@linaro.org
X-Google-Smtp-Source: AGHT+IG3u5XcR7ue7VlhOomDs6g+DGAq/85Hh/xZhTNh7/6mifYTIom5Opq7lw/Mr0sOsOGGlcch
X-Received: by 2002:a5d:634f:0:b0:3a4:f7af:db9c with SMTP id ffacd0b85a97d-3a91893b647mr10163372f8f.59.1751287910056;
        Mon, 30 Jun 2025 05:51:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751287910; cv=none;
        d=google.com; s=arc-20240605;
        b=kdx53DTKuXrcL04SEmS2qSzhvKO0kT5MP8TITEgo6emw9DDCwoFWpUVw7juPiSJulX
         gGitQzKC5eLiHzxScbJ7/aoMAcPKL/rm9TasCrT3iwokKOyELnCoYzXeoe6KjF/7chCG
         88rAxjXqxGKnzLezDqZs5l3TmEVkGaEWuoYTPjty57Q0ESnjcAwxXTEU5Phid2+HYAJA
         gs4sXLcrDGkj6w4TwPpzE1BVs5uVDfmowyd7ESWCzbUb4DB9S/G7WtmqWVHYbudfREfv
         G7iltAP8NZp8K8Wo9aj/E2C48JPwaRBRGiXUSxSN7oCo6I1+V22111WFgBs/UzHGvzXU
         Qsdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=y1eiIPCNpCrIQOefKusuMtCX+i1M76r/ed1/ImbYDuc=;
        fh=De5j/+RFiHp5oysg/kfBHcT9O0ASuV5hpNukEk4skqM=;
        b=JawmB3gDSEcmDPr+01FPiMQZpXRrW1x6aX3BHtvBP6cs6f/X+Qx+ymlW0V+8OAF6zi
         GnoG+sn55IBytRIyCx/vXNitEgyVR+xV/FzT4qM+n8zzMISnYKEK3mzyFlNTFy9Gc7OK
         Y1KOXm6++TXOoG43JdhzC+dSgKSwdM88+8FcBza+4LrblUAwHnksQNtVoHwNGS16AaaS
         nUp+btg6z9DhXYsdUW3cvXvlBsRtxiHWcLe7hKNHoxTRb8gm5y3uBc8oZ2xP8TyqvOP/
         MzPRwP02HmFnN8KRRl0aALkM46AIpwaX/3GDjVwxaQu+VmB+2w6cu07aL4IVzw4+dJdQ
         fF3g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a892e415b6si5748851f8f.135.2025.06.30.05.51.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Jun 2025 05:51:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bW5cc60Rnz6M56N;
	Mon, 30 Jun 2025 20:50:56 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 72967140122;
	Mon, 30 Jun 2025 20:51:49 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 30 Jun
 2025 14:51:48 +0200
Date: Mon, 30 Jun 2025 13:51:47 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Eric Auger <eric.auger@redhat.com>
CC: <eric.auger.pro@gmail.com>, <qemu-devel@nongnu.org>,
	<qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <imammedo@redhat.com>,
	<gustavo.romero@linaro.org>, <anisinha@redhat.com>, <mst@redhat.com>,
	<shannon.zhaosl@gmail.com>, <pbonzini@redhat.com>, <philmd@linaro.org>,
	<alex.bennee@linaro.org>
Subject: Re: [PATCH v4 28/32] hw/arm/virt: Minor code reshuffling in
 create_acpi_ged
Message-ID: <20250630135147.00005910@huawei.com>
In-Reply-To: <20250627095620.3300028-29-eric.auger@redhat.com>
References: <20250627095620.3300028-1-eric.auger@redhat.com>
	<20250627095620.3300028-29-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500003.china.huawei.com (7.191.162.67) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: G0Glv9/gr8qw

On Fri, 27 Jun 2025 11:55:17 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> Use a local SysBusDevice handle. Also use the newly introduced
> sysbus_mmio_map_name which brings better readability about the region
> being mapped. GED device has regions which exist depending on some
> external properties and it becomes difficult to guess the index of
> a region. Better refer to a region by its name.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
