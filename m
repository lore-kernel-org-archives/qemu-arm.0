Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp334464njb;
        Wed, 3 Jul 2024 20:03:26 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCViEuX0BJ25KQGkam2aOYkAdap0kSRhxBZatXuvBoEHB+e1uFWm50EU+9j6/bvCPNqvAGGFb22TAQMI43cBjCwmwPExKy/A
X-Received: by 2002:a05:6a21:6816:b0:1c0:c7ac:d1b6 with SMTP id adf61e73a8af0-1c0cc8bab57mr270081637.48.1720062206387;
        Wed, 03 Jul 2024 20:03:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720062206; cv=none;
        d=google.com; s=arc-20160816;
        b=Upeyza1MDJ+KhVAL/5BeECL1lkKcaAy76xTzpmr9djT9qHmchPLZ1EkL2eSMFLoqXJ
         071R6zwxQGA5XHlp6dNyTLzsetgzv2MdnZKzlRRI/sr/djWEaynw3h1bxfhR8gsR7pNb
         6+C+yztfEsCPN3P/o0tKMH5nk4jA/9JP/gWE+LFrSWqKr+I69/CcSA9NyZpUtRPi+wLz
         cb1/6km3TAlocxJXbzPafEwWLOnKlxRBKkc6xsmR9nuQnCXp2iHNDT7thCn5P8nN5zRz
         narAyNi26lDHAEuhSk64y8OIJbRoIgkQqFGzqUgVD9iXZKS6e5qFJBBzb1y8+hO87p0L
         dzhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:dkim-signature;
        bh=0L4DTuwrRPNNcVaHsMvS0IOC/2oVL/yrsV/EJOufk5g=;
        fh=LwAZv7FOoYunPFFksWt+RgZfYj/bH32NbSlrfxpK9Mk=;
        b=fb8EnWwc/lJ4fS7RJgSiKG/7QHWNfvmQhY68ZeypITVw/sYxUH4RT2tQce+eGvtGBs
         nZ0EhCOuHlaW9aBp6HdowUK1RF8CczgmLzHVoD9aNt7DIgz+D9mkzO5/ErqOTHRkTz05
         DAIFy78IvmE9imW/BLjhkY9DMCK6Lw1oKJO0DusTKKsJtHliPolraDjjnhpKPCzON+dG
         uUp6WH2U7GyaC/aZXpPfriKJKBkWlOCudwA88bYJuPP8wYsFsTtN4u9xpVPuZrJphkLY
         tzZtFBYoSfoLJSA9C/aQDHWYE2xqppcJSUB1eK9EGbPxYaBXMy5CIpkVdn5mloXr61TE
         gnVQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=B7YmZZOc;
       spf=pass (google.com: domain of npiggin@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=npiggin@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <npiggin@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 98e67ed59e1d1-2c8ffb14f27sor5677455a91.7.2024.07.03.20.03.26
        (Google Transport Security);
        Wed, 03 Jul 2024 20:03:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of npiggin@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b=B7YmZZOc;
       spf=pass (google.com: domain of npiggin@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=npiggin@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720062206; x=1720667006; darn=linaro.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0L4DTuwrRPNNcVaHsMvS0IOC/2oVL/yrsV/EJOufk5g=;
        b=B7YmZZOcRkQ2sPfOeeyOw6vcFcDZWSipLKU3BV5zhUnVR7R6SJ41FSmpfaLOvyHZsC
         iuYCKon73+EH+qyg1TItSLw0srlcFFsm7Fkzyit2Hrb1e9aw1cSoM6RU2jbo5HF1zaHx
         yRmByBXF2/LBiHXLwbMNxfHx8YM1XQd4q402hy9so8CjiIrEg4EW0bs0/E5eUqWHpafx
         ri757YfUKxXJ1eMXlP1TFTObgSK0q4gppZZNUog689+Hoz7OiLHGPWiOPE3svtsZ5c3J
         npfDe8+KWp8MmDrkSnN5vWgonZFPsPJHsgN88uz4WynrUGbl81Yr6zlDkOcpM965vpCp
         ssWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720062206; x=1720667006;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=0L4DTuwrRPNNcVaHsMvS0IOC/2oVL/yrsV/EJOufk5g=;
        b=MAfQqi7927ozFaNwSj6MEKdCYUnn1clEXACznJzqWGu6VZxf8X9P4vtD83P5KYm+y1
         b5tcEiuj/2U6jeYWEHkNfxD5BLndtBMX1eAimEHvD0l9nilQjTxL/2vyJ/iW0dA0D93Z
         o6yPi6Cg1wgpTUtvqiMaMVZjX6bs1vkHBMP0HOYoaQtjJcxJeP4HAMOdiINIEbuSk1hi
         SV2zXRY6hP1z9tbEaYYNPz9HQQ1lhQTQXUcUJTPwcGiE0XGNOkm/Ip4CX+YHoamqJpKS
         0n0GInXmKzKxE7VQ5ygXFKvN5KafDOYMFA+npJclDZBr+Mj1Nqp52780PO8eYJzHoKvW
         dzsg==
X-Forwarded-Encrypted: i=1; AJvYcCXQfvnfyG/IYxy8OD1kp/F5nnADq2/ZwU/F1f/3w6KbLj6U+iYZ/LNRouPblLVqRwnbys8siSKu/bjP8VFRHzB1JEHBILqt3ItW/xcIdwHD26oA1p/SV1FIePb0NIhIT3NI0lm/ymqOjwC/2AkbmcL7nfzI+WF+EVKc6SoVkwayjTx+UIqIBJKaAiBWrtRbMVn+iECvKPh/RjMFjCbWKnitWBu49OUFTM32pVw=
X-Gm-Message-State: AOJu0YxWDka+rfRCH/j5ZPNDtoKPqawbLR3EbVT4jqk4To/MsFgnGJD7
	CWm3XxNN0z2lsL4kP3SOca/1LMTDdofZK4WR7LG6ETyichQTSvQA
X-Google-Smtp-Source: AGHT+IFmipRhJvngOTgwJS6aikwhR7/qCPUyk5CyGHIhEqWOSVtFTiSBsbIzKZ7FQyDFbiMg7JV7EQ==
X-Received: by 2002:a17:90a:f184:b0:2c9:75c6:32dc with SMTP id 98e67ed59e1d1-2c99c52aab3mr289097a91.1.1720062205745;
        Wed, 03 Jul 2024 20:03:25 -0700 (PDT)
Return-Path: <npiggin@gmail.com>
Received: from localhost ([1.146.95.80])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c999e22c50sm175174a91.1.2024.07.03.20.03.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Jul 2024 20:03:25 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 04 Jul 2024 13:03:07 +1000
Message-Id: <D2GF5O8SP4Q8.38I35G35K74OG@gmail.com>
Cc: <maz@kernel.org>, <jean-philippe@linaro.org>,
 <jonathan.cameron@huawei.com>, <lpieralisi@kernel.org>,
 <peter.maydell@linaro.org>, <richard.henderson@linaro.org>,
 <imammedo@redhat.com>, <andrew.jones@linux.dev>, <david@redhat.com>,
 <philmd@linaro.org>, <eric.auger@redhat.com>, <oliver.upton@linux.dev>,
 <pbonzini@redhat.com>, <mst@redhat.com>, <will@kernel.org>,
 <gshan@redhat.com>, <rafael@kernel.org>, <alex.bennee@linaro.org>,
 <linux@armlinux.org.uk>, <darren@os.amperecomputing.com>,
 <ilkka@os.amperecomputing.com>, <vishnu@os.amperecomputing.com>,
 <karl.heubaum@oracle.com>, <miguel.luis@oracle.com>,
 <salil.mehta@opnsrc.net>, <zhukeqian1@huawei.com>,
 <wangxiongfeng2@huawei.com>, <wangyanan55@huawei.com>,
 <jiakernel2@gmail.com>, <maobibo@loongson.cn>, <lixianglai@loongson.cn>,
 <harshpb@linux.ibm.com>, <linuxarm@huawei.com>, "Jonathan Cameron"
 <Jonathan.Cameron@huawei.com>, "Shaoqin Huang" <shahuang@redhat.com>, "Zhao
 Liu" <zhao1.liu@intel.com>
Subject: Re: [PATCH V13 3/8] hw/acpi: Update ACPI GED framework to support
 vCPU Hotplug
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Salil Mehta" <salil.mehta@huawei.com>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>
X-Mailer: aerc 0.17.0
References: <20240607115649.214622-1-salil.mehta@huawei.com>
 <20240607115649.214622-4-salil.mehta@huawei.com>
In-Reply-To: <20240607115649.214622-4-salil.mehta@huawei.com>
X-TUID: LAWuPyOpUXm8

On Fri Jun 7, 2024 at 9:56 PM AEST, Salil Mehta wrote:
> @@ -400,6 +411,12 @@ static void acpi_ged_initfn(Object *obj)
>      memory_region_init_io(&ged_st->regs, obj, &ged_regs_ops, ged_st,
>                            TYPE_ACPI_GED "-regs", ACPI_GED_REG_COUNT);
>      sysbus_init_mmio(sbd, &ged_st->regs);
> +
> +    memory_region_init(&s->container_cpuhp, OBJECT(dev), "cpuhp containe=
r",
> +                       ACPI_CPU_HOTPLUG_REG_LEN);
> +    sysbus_init_mmio(sbd, &s->container_cpuhp);
> +    cpu_hotplug_hw_init(&s->container_cpuhp, OBJECT(dev),
> +                        &s->cpuhp_state, 0);
>  }

Could the ACPI persistent presence ARM requires be a property of
the ACPI device?

Thanks,
Nick
