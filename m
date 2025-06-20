Received: by 2002:a17:505:8ed0:b0:1be9:327d:8ee3 with SMTP id kh16csp789858njc;
        Fri, 20 Jun 2025 03:31:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWyFkE31st9agntpfbg6TpDu7+MFhget9FZn6fd6rBov4dEOe9f2Hx/xhGXUH4AKk7vBWvD5rYNnmCyYw==@linaro.org
X-Google-Smtp-Source: AGHT+IGnQDZq5jHBH8KMroCst01oFgFCE0W1DRcEJR2JgzZU8Pwzq/nrFWysGly3B1g7KCjCQ22b
X-Received: by 2002:a05:6000:2dc9:b0:3a5:281b:9fac with SMTP id ffacd0b85a97d-3a6d27d52ccmr1505574f8f.17.1750415501004;
        Fri, 20 Jun 2025 03:31:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1750415500; cv=none;
        d=google.com; s=arc-20240605;
        b=OOncUtUvuHMhsxxbvfPNpxbTu6FuMl3MDevuC3/HUXuANkCFqgJHEXwHi8jGTlo+4m
         1GPFRMglAkdLkDkJzHIdR6q/zkzzmoT5djDf5hvUT10sUkpEQjmUD/ZmL2q+NUQLJUIw
         /MzqTaG06Ya0t3IEY2ku25rRy51UMmQXjNXw5CiMRcemWU32A96Vf669FNGCytZBZ8ZF
         xK8ZJBCOUt7nUgjLHW4sSCqR+IeMeL8Rrd4OTheMoT6zT+/mDI3rWNDVyDdcug7S7HpE
         XrbQ7lgHomCe23TAv7s8uBv/zT0dZH4j7X8K7eHp7WpvTbwNQp7py6LS0WJFBHeMCpf9
         ipfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=ZNnXHQHlys0vlGdWsW+mmQ2ErjNGSrbmKD5uYD97CqY=;
        fh=De5j/+RFiHp5oysg/kfBHcT9O0ASuV5hpNukEk4skqM=;
        b=FtSEKFx+5xhRR8cM699BSFxkrtW766U6R1Sn+cyYt4M7DeIjRg/RRyrX3stSs7TeyL
         OWit8DsDXTgAAVGwM5oKgHeZqiDsQ05tDat8dgLVcOkbLMca6AD+HGPJNaFOLQS/AyOZ
         nCyciy8d4Un7EovbJRqvvFK68E4tWUR/1wJuZ060XcA9QAW+wYWg3tNY7CpXzpUCm2HA
         AzJjj6z4yhDWXq2WU0gP72uLiq2oYgotqBn+UJ4xZdOELjvozmLelR+hs5v9zYlU7KMu
         JyQ3ild/9m8+ih7nGBTIYqh5DyfOA/pj298rcO/M1mc6XP6YKzANvy66+gku49NQyMFU
         ILkw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a6d128bc2csi1044244f8f.602.2025.06.20.03.31.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Jun 2025 03:31:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bNtzp1BmVz6M4j7;
	Fri, 20 Jun 2025 18:31:02 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 127AF14027A;
	Fri, 20 Jun 2025 18:31:40 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 20 Jun
 2025 12:31:39 +0200
Date: Fri, 20 Jun 2025 11:31:38 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Eric Auger <eric.auger@redhat.com>
CC: <eric.auger.pro@gmail.com>, <qemu-devel@nongnu.org>,
	<qemu-arm@nongnu.org>, <peter.maydell@linaro.org>, <imammedo@redhat.com>,
	<gustavo.romero@linaro.org>, <anisinha@redhat.com>, <mst@redhat.com>,
	<shannon.zhaosl@gmail.com>, <pbonzini@redhat.com>, <philmd@linaro.org>,
	<alex.bennee@linaro.org>
Subject: Re: [PATCH v3 27/29] tests/qtest/bios-tables-test: Prepare for
 addition of acpi pci hp tests
Message-ID: <20250620113138.00007531@huawei.com>
In-Reply-To: <20250616094903.885753-28-eric.auger@redhat.com>
References: <20250616094903.885753-1-eric.auger@redhat.com>
	<20250616094903.885753-28-eric.auger@redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500010.china.huawei.com (7.191.174.240) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: Wtey81hYe0He

On Mon, 16 Jun 2025 11:46:56 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> From: Gustavo Romero <gustavo.romero@linaro.org>
> 
> Soon we will introduce a new test related to ACPI PCI hotplug that
> will use a new reference blob:
> 
> tests/data/acpi/aarch64/virt/DSDT.acpipcihp
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Gustavo Romero <gustavo.romero@linaro.org>

Unusual sign off chain.  Eric is signing off as handling Gustavo's patch?
I'd expect Eric's sign off to be second.  Looks good in the next patch fo
instance.  With that fixed.
 
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>

> ---
>  tests/qtest/bios-tables-test-allowed-diff.h | 1 +
>  tests/data/acpi/aarch64/virt/DSDT.acpipcihp | 0
>  2 files changed, 1 insertion(+)
>  create mode 100644 tests/data/acpi/aarch64/virt/DSDT.acpipcihp
> 
> diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
> index dfb8523c8b..dc3ab24d05 100644
> --- a/tests/qtest/bios-tables-test-allowed-diff.h
> +++ b/tests/qtest/bios-tables-test-allowed-diff.h
> @@ -1 +1,2 @@
>  /* List of comma-separated changed AML files to ignore */
> +"tests/data/acpi/aarch64/virt/DSDT.acpipcihp",
> diff --git a/tests/data/acpi/aarch64/virt/DSDT.acpipcihp b/tests/data/acpi/aarch64/virt/DSDT.acpipcihp
> new file mode 100644
> index 0000000000..e69de29bb2
