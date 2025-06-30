Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp2433498dye;
        Mon, 30 Jun 2025 05:27:00 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU3LrQeXUO50fq/svFfdd++odfeyshbFXSsZQrctmQiomN5jv/Qd8C5uvYvQbQvkTjxaWFIaDmC6SlyWw==@linaro.org
X-Google-Smtp-Source: AGHT+IFajJOLVSDeShGUqD/bTIkjjYy+w3vXtYrZXFD+2Fh6XI/4hPWMuUEXSag8SyYyEMlzYx2N
X-Received: by 2002:a17:902:ce8d:b0:224:26fd:82e5 with SMTP id d9443c01a7336-23ac463fad4mr199886375ad.48.1751286419872;
        Mon, 30 Jun 2025 05:26:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751286419; cv=none;
        d=google.com; s=arc-20240605;
        b=S6/KDawrizzNc1UL0tItIRfg/yh9miTgIMH2Oload112B5eWQw5UutTXCdoWGtGvg+
         1mZtq0U3KqNZDFOHmEiLap8wMMkwUPDgXXNsV+8onm4wKp/KoNFiQrcECQXK/DOgVqPm
         AVZY/p4smMZPgoZQQHPj+WJrFkcLmaicZy9CTQNwdkcGxebtVq6M/98xT2z0dDz15Gy9
         uevi2UTQM7vA+pRE5wA3PHzq+2i4JwB3I2fKTGDBsTaRmRn4TyZ0uE4ixn+R5+WjgVnJ
         C7CejPd1n6Q0cP7bq/anIcxHllQUFmdm4mP3vG5tCt+V8GkPhxfssS1vrtg2qhrKyw8S
         MlKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=lMKSiNpxqq4ki0IV3jIylK9v1etCBUo5xiI8tP8E97Q=;
        fh=De5j/+RFiHp5oysg/kfBHcT9O0ASuV5hpNukEk4skqM=;
        b=bODVVZY+9MGtzo1T2d6L/tEqmIDnNGgXNepMk/jvdFRIGn/CljpeCP3iax4/yQ+Hwa
         5udWCtUAQdfxJiBJkPG2Tn2iIRGWS9ZgOFOYBHYeX/jkiPg3MwmO64nmNPr7e3CDz2VI
         +d3+J3VK6355REylAZyWHhms+6sbwl8C15bpWxfqBS2eIrl3z/DU8kHyxgx1W5TdjcnO
         YfJqsnpdW+9AANwCs++7EDQ7kwt6JkdgfvU6mV0rT1LPrKsQ+a9d4WNff+SImarb6nd1
         lHFHqeBan0+fWUE+p5C7YyqW+h3pbEBR0zKDEbBT/Gs6IU3afXOCvO3tpoRkFl0SakHO
         uiCg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id d9443c01a7336-23acb3ed1f0si97831255ad.578.2025.06.30.05.26.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Jun 2025 05:26:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bW54W4Qc5z6L5Yt;
	Mon, 30 Jun 2025 20:26:35 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 0FD701402EC;
	Mon, 30 Jun 2025 20:26:55 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 30 Jun
 2025 14:26:54 +0200
Date: Mon, 30 Jun 2025 13:26:52 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Eric Auger <eric.auger@redhat.com>
CC: <eric.auger.pro@gmail.com>, <qemu-devel@nongnu.org>,
	<qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <imammedo@redhat.com>,
	<gustavo.romero@linaro.org>, <anisinha@redhat.com>, <mst@redhat.com>,
	<shannon.zhaosl@gmail.com>, <pbonzini@redhat.com>, <philmd@linaro.org>,
	<alex.bennee@linaro.org>
Subject: Re: [PATCH v4 17/32] tests/qtest/bios-tables-test: Prepare for
 changes in the arm virt DSDT table
Message-ID: <20250630132652.000035ca@huawei.com>
In-Reply-To: <20250627095620.3300028-18-eric.auger@redhat.com>
References: <20250627095620.3300028-1-eric.auger@redhat.com>
	<20250627095620.3300028-18-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100009.china.huawei.com (7.191.174.83) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: 18TPLmVowabp

On Fri, 27 Jun 2025 11:55:06 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> From: Gustavo Romero <gustavo.romero@linaro.org>
> 
> This commit adds DSDT blobs to the whilelist in the prospect to
> allow changes in the arm virt DSDT method.
> 
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
Always feels slightly silly to give tags to these, but for FWIW

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

> ---
> ---
>  tests/qtest/bios-tables-test-allowed-diff.h | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index dfb8523c8b..abe00ad4ee 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1 +1,6 @@
>  /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/aarch64/virt/DSDT",
> +"tests/data/acpi/aarch64/virt/DSDT.acpihmatvirt",
> +"tests/data/acpi/aarch64/virt/DSDT.memhp",
> +"tests/data/acpi/aarch64/virt/DSDT.pxb",
> +"tests/data/acpi/aarch64/virt/DSDT.topology",
