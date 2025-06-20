Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp764379njc;
        Fri, 20 Jun 2025 02:37:22 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUw8Hp2Xkz3rRzIRtorrhyNxCtGySoF+drLCloFmj0h7U7V0Z48ujZFmCdWsgdnZV5gpxPpSaMhaikiYw==@linaro.org
X-Google-Smtp-Source: AGHT+IG9AWQGCn44rCOZOyO8/QC6agOu5SSIeENyLmcObhTDZ7CQvs19GmM13JBJL+cA+je6V1Dp
X-Received: by 2002:a05:6000:18a8:b0:391:3aaf:1d5f with SMTP id ffacd0b85a97d-3a6d12eb61amr1908381f8f.52.1750412242171;
        Fri, 20 Jun 2025 02:37:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750412242; cv=none;
        d=google.com; s=arc-20240605;
        b=cHgKKbGZ6xXWWODzF3N5UK5PxlKUGm2oxNEXNts3RuFr84x5Ed94si9V9Ii9HZQKMo
         BHjXJ/SJC0hsaP36+YpAIi013CMn+ueHaf5k8AQqCcmrM32w5Uqc+ivztjiPKCH4GadD
         RlAUtmNDxqu8y8QGn1g9rtMUi+25TxP4gKY76hGRU+0IFsyomvh6AJbgMJo3oEVhF2eL
         93DlZ8Xav/bqjHJYgVnQmUhEsNnPM5diRktlDib5pvwzIECAAgELAyBgQNyEFCdlCHwa
         Hg90w5bjqjs1foqYG9AW0z3ZVm6W4RiPH2DD7ecA37c7bTByizmPaYP2vgIG4uGDU8O2
         spig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=WW/2xU2dVnIekeb+IgZgKqyFkzh/BFQ+rJ62qJ+DQ5Q=;
        fh=De5j/+RFiHp5oysg/kfBHcT9O0ASuV5hpNukEk4skqM=;
        b=F3DVTss3ChxiDsN7yPqbgNRkfmKUjhRCIY+8paa2vK6vN2X+gyaq+hjOL1ofKOXqOa
         FG+wO4IYUtSTBIVLqtkVVjfPFtIdyltcADa8DUsFq7n2LPkfamgpF75DtrzjoQQHH1Mn
         IBoucpYK70UwiLXcD06lUiwFinvWZZTWp2ULQ1yUYdWTelvTW/TZqoA2askZFWfQBfOZ
         2qn/pAskhczHDgUIANf1bZ7Me4nxDMdZn7Sg2z96Dj3fakdd1KzmUCUhNFLWrYcczhLh
         eVfMJmsLPr9dVMg6xrrMwL7g36r/sfCU2mEuERkKC0AB84TdJH4dI7qlWJnqpETueiBz
         hSFg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a6d12b1e3fsi1038232f8f.831.2025.06.20.02.37.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Jun 2025 02:37:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bNsn72Grnz6M51K;
	Fri, 20 Jun 2025 17:36:43 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 3F535140432;
	Fri, 20 Jun 2025 17:37:21 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 20 Jun
 2025 11:37:20 +0200
Date: Fri, 20 Jun 2025 10:37:19 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Eric Auger <eric.auger@redhat.com>
CC: <eric.auger.pro@gmail.com>, <qemu-devel@nongnu.org>,
	<qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <imammedo@redhat.com>,
	<gustavo.romero@linaro.org>, <anisinha@redhat.com>, <mst@redhat.com>,
	<shannon.zhaosl@gmail.com>, <pbonzini@redhat.com>, <philmd@linaro.org>,
	<alex.bennee@linaro.org>
Subject: Re: [PATCH v3 18/29] hw/acpi/ged: Add a bus link property
Message-ID: <20250620103719.000034fe@huawei.com>
In-Reply-To: <20250616094903.885753-19-eric.auger@redhat.com>
References: <20250616094903.885753-1-eric.auger@redhat.com>
	<20250616094903.885753-19-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100009.china.huawei.com (7.191.174.83) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: PKzWM5HhGGHB

On Mon, 16 Jun 2025 11:46:47 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> This property will be set by the machine code on the object
> creation. It will be used by acpi pcihp hotplug code.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

