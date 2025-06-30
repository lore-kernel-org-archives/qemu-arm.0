Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp2432962dye;
        Mon, 30 Jun 2025 05:25:55 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUjxdSqN4NylxjoijZeb50jhRQX/UAfe11u8UXKtjJwjKRWHhbEgkgftYapeZOnpqh7Nm79VieuRsKK2A==@linaro.org
X-Google-Smtp-Source: AGHT+IHK9eIaif5rDir0VPTmNW2/XR26HOElu/QTLm3AUhnE2V3iZh6LYH3Qf7Nd/LscYX1AGJBu
X-Received: by 2002:a05:6a21:386:b0:21f:86de:354 with SMTP id adf61e73a8af0-220a16a2fa0mr18532582637.26.1751286355245;
        Mon, 30 Jun 2025 05:25:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751286355; cv=none;
        d=google.com; s=arc-20240605;
        b=bESwP9WDThB6F90eEV+Pcjt5z3SyJ5pu72ZjNb/uONOQQ/1raKl1oNwl1zt219TWM5
         ZPtf3R44rgcByvHNqfYNSVVSJzOTY8GS+q1GrnmCeeoAA6tAtgCpSZiXFCLxNjTRnVsZ
         jVU7Q5R6kZvA33kRo/PatGyXH4Q79Rnf+8D+dUQ0uqhhjn7oAfaQquODkgbH7MvG/A19
         z1YT4MLhUpZc2w+DNx3T2vi6Hcv1vLo9+qG5MdQg5WHhYnAUV9NjXGaOYZFckR9sjZoE
         eU9IFfNnC/ssLmaqGiSsMAMGYPAi8nvCVYDRfm/G7+H1MrXOWGoeJBDOOsw08o+oYGzF
         eqFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=Gzqqm4/pa4n6ZZNQxpXTUACx57/PkX1dxT2kQBo62VY=;
        fh=De5j/+RFiHp5oysg/kfBHcT9O0ASuV5hpNukEk4skqM=;
        b=FaQqPkR4BNofaCWOJhMpr9D4Vd4MGlzNxtCmE1LHOmyBN5tevfTzZU54bxfoynBN1G
         83td4Zb+QeATE4IsZkqu6Gc5+JYNVb3R8PS9hzwR/q2CmTqo5HS9O734VFkPIQ2WobPg
         b2sxahp2XBporACsqFw9dv53agmR0yDpnb6sqEiW3DdJLbN1Zl+WO2e+RD1it40gWmvF
         zGVyioY+1tCfXXtGQdKHICoP0K0g5IdTMDII3RHQXwqyqcKgIcEmYWRRo6oB6QcHQep5
         NclAL89S/uC6aREoUCZcJhBgx6iTp42ojotSrgVVuUN+TeGOjMYnpwufGCEfTPFwSYu9
         PI8Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id 41be03b00d2f7-b34e324f2dasi9426578a12.603.2025.06.30.05.25.54
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Jun 2025 05:25:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bW53H21J3z6L5bW;
	Mon, 30 Jun 2025 20:25:31 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id B16DD1402FC;
	Mon, 30 Jun 2025 20:25:50 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 30 Jun
 2025 14:25:50 +0200
Date: Mon, 30 Jun 2025 13:25:48 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Eric Auger <eric.auger@redhat.com>
CC: <eric.auger.pro@gmail.com>, <qemu-devel@nongnu.org>,
	<qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <imammedo@redhat.com>,
	<gustavo.romero@linaro.org>, <anisinha@redhat.com>, <mst@redhat.com>,
	<shannon.zhaosl@gmail.com>, <pbonzini@redhat.com>, <philmd@linaro.org>,
	<alex.bennee@linaro.org>
Subject: Re: [PATCH v4 16/32] hw/i386/acpi-build: Move aml_pci_edsm to a
 generic place
Message-ID: <20250630132548.00007323@huawei.com>
In-Reply-To: <20250627095620.3300028-17-eric.auger@redhat.com>
References: <20250627095620.3300028-1-eric.auger@redhat.com>
	<20250627095620.3300028-17-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100009.china.huawei.com (7.191.174.83) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: WA4MUEfAbS+d

On Fri, 27 Jun 2025 11:55:05 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> Move aml_pci_edsm to pci-bridge.c since we want to reuse that for
> ARM and acpi-index support. Also rename it into build_pci_bridge_edsm.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
