Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp744096njc;
        Fri, 20 Jun 2025 01:49:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUjN8SFCL/woXDZ5/6koJOZ26ntnDY98tzJkc5a/mJc/MRMrUh19fChsU1kxUqZWWj2f9hZnUImj/AWhA==@linaro.org
X-Google-Smtp-Source: AGHT+IHMDGuQju8jCirj9IDwfXhsTqTrrLs0EkHJGlaiE+iAC4m61MSbD0MVBjix3YUrF7ioMWdT
X-Received: by 2002:a05:600c:871b:b0:43c:f6c6:578c with SMTP id 5b1f17b1804b1-453659d0a9bmr18727395e9.15.1750409375382;
        Fri, 20 Jun 2025 01:49:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750409375; cv=none;
        d=google.com; s=arc-20240605;
        b=XSFPufgTGd8j4TU95vbjq+GBd5SPBUZrBpnnk0ZlSyduxV9lcyUFQvz4KhkvNxjOMJ
         kCAsTacA27/idDV+a7ucF2CgxNo+CYf4Sr4S/wKVDrjHhSoWd6JA1ZTXdmAGQpCogs+X
         t8uNvF1VNVzFLCxUBbexuI2Abac7OYFn3UtN9OPtSTcm9l6jWyTEmF48mzzSDBFz4V9A
         H12lUBvTWpB2OLlYcRLWZlBpulrPpXsIkmAjNto64wrvSN9R+57gQv2gfVP8b8PtA+Ii
         mksCOJdveRa7y+AubkQ04bsQYsdFgjyN1mu6fX3Pr6cQ6XKxbUVJSQj/OaDRyNoFqgMo
         8VZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=jO4blAAaVZWHjamEZwCYLO+DJuz/qbmP6I+PBuFEXLk=;
        fh=De5j/+RFiHp5oysg/kfBHcT9O0ASuV5hpNukEk4skqM=;
        b=L6K4yK7l3GVFssbEaB3m2krmX/WtF4JrY72TPVXJVebIQtJMQmg0qmKSiaAoi7XpKw
         dARTo4F8N/2Z7b94DZvDXP27XXv+NiQVYaiUPVTgBuYHEubvLqpHbUeryY+0Yqi4Ao6P
         7sz4pV7bR69rrQEU27WUxbfhHPgoMoxM+/2fAENuYAKVp7rEBdsR63NY9xFAIjWjIjfB
         +mEYGoedIp9vHyZ5J5l+Jcyj9Eh9Jv/VEyMroaPZn45nM1jrassNWfS8FK2qm3qzjlnc
         eoYfgHBRwgLlnnJvQw54I29tb6d1wHGj7pU2perYP/vjZnw3B7NXuefOgpKC2f0rTlWP
         O/5w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-453646cfd43si11133375e9.16.2025.06.20.01.49.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Jun 2025 01:49:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bNrdD4G8qz6L5JX;
	Fri, 20 Jun 2025 16:44:48 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 8C75314033C;
	Fri, 20 Jun 2025 16:49:34 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 20 Jun
 2025 10:49:33 +0200
Date: Fri, 20 Jun 2025 09:49:32 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Eric Auger <eric.auger@redhat.com>
CC: <eric.auger.pro@gmail.com>, <qemu-devel@nongnu.org>,
	<qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <imammedo@redhat.com>,
	<gustavo.romero@linaro.org>, <anisinha@redhat.com>, <mst@redhat.com>,
	<shannon.zhaosl@gmail.com>, <pbonzini@redhat.com>, <philmd@linaro.org>,
	<alex.bennee@linaro.org>
Subject: Re: [PATCH v3 05/29] tests/qtest/bios-tables-test: Prepare for
 changes in the DSDT table
Message-ID: <20250620094932.00000b74@huawei.com>
In-Reply-To: <20250616094903.885753-6-eric.auger@redhat.com>
References: <20250616094903.885753-1-eric.auger@redhat.com>
	<20250616094903.885753-6-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100001.china.huawei.com (7.191.160.183) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: YX+yALVrnOy9

On Mon, 16 Jun 2025 11:46:34 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> From: Gustavo Romero <gustavo.romero@linaro.org>
> 
> This commit adds DSDT blobs to the whilelist in the prospect to
> allow changes in the GPEX _OSC method.
> 
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>

FWIW given what this is and the involvement of foxes ;)

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
> 
> ---
> 
> v2 -> v3:
> - fox for microvm

An excellent addition to any microvm.



> ---
>  tests/qtest/bios-tables-test-allowed-diff.h | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index dfb8523c8b..75f057767e 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1 +1,7 @@
>  /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/aarch64/virt/DSDT",
> +"tests/data/acpi/aarch64/virt/DSDT.acpihmatvirt",
> +"tests/data/acpi/aarch64/virt/DSDT.memhp",
> +"tests/data/acpi/aarch64/virt/DSDT.pxb",
> +"tests/data/acpi/aarch64/virt/DSDT.topology",
> +"tests/data/acpi/x86/microvm/DSDT.pcie",
