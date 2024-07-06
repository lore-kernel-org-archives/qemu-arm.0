Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp1793956njb;
        Sat, 6 Jul 2024 07:45:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUt/+0x8rse+3WnEGsqP6T+FUxEy53/9OqVVny6B3ynQvItBLSaJyTGFja04fEtNVOo4OcjZmz7phF/4iW1ZU0SCZszSFdu
X-Google-Smtp-Source: AGHT+IEjdul7Neys8VmLqHeHIIrAZG8MoxN9Qjuav/3IiLi91v1nVhlMGJ2gKwxfStWzQu8HeFEW
X-Received: by 2002:ac8:5981:0:b0:440:57ca:5b6b with SMTP id d75a77b69052e-447ccf01443mr109160301cf.18.1720277129024;
        Sat, 06 Jul 2024 07:45:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720277129; cv=none;
        d=google.com; s=arc-20160816;
        b=flKogzGmu2xancHS7d/wViB7ZrSWzNMBrT7Rgzw2PobeCefjhyY2FKCQJMMtclLXAp
         IrlSbmEU7ofKfdcTFVz9/LcA4BodxlBqAS0dJY2XscSzFEWJ6sZdhjd9STbYeemAtHaq
         F11TS6mUNKcZzaO8O6euZy789Xy83GH86a/DT90E7zqVq9VMQBt4qFVbXf4Viu6NV7sm
         KETh2eQIcITp4f9Uyxr4KEBNlBE2Y9bGWBHA2p5MKBpSawuAixPfOzU60jx+DGkXZhlJ
         JIgctZ9qqXAmmjhchGRZfiatUCd6vbh7xCCYk4W5DnT1y/wOqnG2aGfJZVMnEAPED5zV
         XZ3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:dkim-signature;
        bh=L4tvMObqlL1U6xxTy8ydc44Gi7WeEEijdbo+Zb+UT1k=;
        fh=Lzg3UWZ9SJt7a6Mth4L+K3ZhYf4t3VsppkdPpufp5yA=;
        b=cdMZkX0xLNPEuAw3pdAic0t8A8heb1jPjoTo80FgmJ1OEhuwekswsMZl//8jMMS4Uf
         kX76q2omBV5NCTlUNoAZvQeVJSPFfFP8sM5f0dqcILXGvu5qnulgLf/uI3bkHEUbhMLJ
         I3WC8JD6i3BuAHNH9ufjn28X4wl8yCPvtfi9wqlHWfQ6HN8cZoyj1+RPQQeFN+bNlX5S
         99EMlwBnWapRnpJ8hv11omANQG1s7Ssq15QI839rL64klZsiqykHZYIfOa5w9w7DZAiC
         7/HsePQ52jt7bO+68MBo8WvP2EeOV3zGR9+/yjDoe2Pvwupllm6737tHc4sctQoOmH12
         BSrQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ItIo0zLr;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <imammedo@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-447e04761fdsi15835761cf.685.2024.07.06.07.45.28
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jul 2024 07:45:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ItIo0zLr;
       spf=pass (google.com: domain of imammedo@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=imammedo@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720277128;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=L4tvMObqlL1U6xxTy8ydc44Gi7WeEEijdbo+Zb+UT1k=;
	b=ItIo0zLrr8NsPVfCowewHpIi6puP2+cCNJqEZD85xZMDoV8MpKFK7q6ylBtFRxiTpIeEcR
	obG/Tur66+xdl9KwW+AopTaVITjmrWFBGY2cqFqg5N5w7hwDGSKlnBiokke1rSAk1sw0qr
	WxFjkv+esiih+yWJMHgcWvhdh9OUYLs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-Zlfdue40MaejZgZZogNPbA-1; Sat, 06 Jul 2024 10:45:22 -0400
X-MC-Unique: Zlfdue40MaejZgZZogNPbA-1
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4265e9de046so4393415e9.2
        for <alex.bennee@linaro.org>; Sat, 06 Jul 2024 07:45:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720277121; x=1720881921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L4tvMObqlL1U6xxTy8ydc44Gi7WeEEijdbo+Zb+UT1k=;
        b=AdW9jwDOFL57a7Us24SV2N+pwjR9NxKSiQ3OESg26YsSiGSDf1f4eWvG3EAgK2Hefk
         xyX24prPWuk8bmq33LwhucNLDpxtf22A2zkXwkRTyOIVnDyZjxv24Y1Mg901mzH+dl1W
         AlLIkZDs90wcVUWr2TrbiKEz5B9lPkUOt8bGHUUTphzGRQ5t396v+mc0VY17TLyieyyU
         4BTg0c4DT5Avi2YsOZSk5LvS+YZaR6fmWHRKHTIGFe47YtEVxj/H7XfStl43laaNT3b4
         0a7frtlNl3KhALeCmwe1IAet3oSojlJDFxOO9VD8HZqybPxeRJIDlbKOFS/jox9nTfnN
         y6RQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOz2XmVU90oJTiWOJtWCqTkvbSpissYD812Kh+jV2gZc7G+D9B9/IVtsJtRNi/rb4Gas7XZGWoBpLVxQapYdF1Ph94Cf8O
X-Gm-Message-State: AOJu0Yxi1t1DzHhUZeseUdkF7hDKAh54nCXwVvksSmMbsVpBCCQ/UkMK
	YNLMvNCPfcy2UL1mmX/6LfKfuhpgb5HNRqUZ2iwCxJEhmw6R8u3u7TrTTAXHxAalYaZQOuEKF95
	qc6M375z9ZW6hEOnx8J4BnRqUavRv+7PReJEaZQhmg3JDupqD+qQ5GQ==
X-Received: by 2002:a05:600c:6d06:b0:425:1331:9b3e with SMTP id 5b1f17b1804b1-4264a456fe9mr45483775e9.41.1720277121591;
        Sat, 06 Jul 2024 07:45:21 -0700 (PDT)
X-Received: by 2002:a05:600c:6d06:b0:425:1331:9b3e with SMTP id 5b1f17b1804b1-4264a456fe9mr45483355e9.41.1720277121206;
        Sat, 06 Jul 2024 07:45:21 -0700 (PDT)
Return-Path: <imammedo@redhat.com>
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com. [213.175.37.10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a2519a4sm97675175e9.35.2024.07.06.07.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jul 2024 07:45:20 -0700 (PDT)
Date: Sat, 6 Jul 2024 16:45:19 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Salil Mehta <salil.mehta@huawei.com>
Cc: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <maz@kernel.org>,
 <jean-philippe@linaro.org>, <jonathan.cameron@huawei.com>,
 <lpieralisi@kernel.org>, <peter.maydell@linaro.org>,
 <richard.henderson@linaro.org>, <andrew.jones@linux.dev>,
 <david@redhat.com>, <philmd@linaro.org>, <eric.auger@redhat.com>,
 <oliver.upton@linux.dev>, <pbonzini@redhat.com>, <mst@redhat.com>,
 <will@kernel.org>, <gshan@redhat.com>, <rafael@kernel.org>,
 <alex.bennee@linaro.org>, <linux@armlinux.org.uk>,
 <darren@os.amperecomputing.com>, <ilkka@os.amperecomputing.com>,
 <vishnu@os.amperecomputing.com>, <karl.heubaum@oracle.com>,
 <miguel.luis@oracle.com>, <salil.mehta@opnsrc.net>,
 <zhukeqian1@huawei.com>, <wangxiongfeng2@huawei.com>,
 <wangyanan55@huawei.com>, <jiakernel2@gmail.com>, <maobibo@loongson.cn>,
 <lixianglai@loongson.cn>, <npiggin@gmail.com>, <harshpb@linux.ibm.com>,
 <linuxarm@huawei.com>, Zhao Liu <zhao1.liu@intel.com>
Subject: Re: [PATCH V13 8/8] docs/specs/acpi_hw_reduced_hotplug: Add the CPU
 Hotplug Event Bit
Message-ID: <20240706164519.06c53d77@imammedo.users.ipa.redhat.com>
In-Reply-To: <20240607115649.214622-9-salil.mehta@huawei.com>
References: <20240607115649.214622-1-salil.mehta@huawei.com>
	<20240607115649.214622-9-salil.mehta@huawei.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.42; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TUID: uah/ompVKVMD

On Fri, 7 Jun 2024 12:56:49 +0100
Salil Mehta <salil.mehta@huawei.com> wrote:

> GED interface is used by many hotplug events like memory hotplug, NVDIMM hotplug
> and non-hotplug events like system power down event. Each of these can be
> selected using a bit in the 32 bit GED IO interface. A bit has been reserved for
> the CPU hotplug event.
> 
> Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Tested-by: Zhao Liu <zhao1.liu@intel.com>

suggest to squash this into the patch that introduces this bit [3/8]


> ---
>  docs/specs/acpi_hw_reduced_hotplug.rst | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/docs/specs/acpi_hw_reduced_hotplug.rst b/docs/specs/acpi_hw_reduced_hotplug.rst
> index 0bd3f9399f..3acd6fcd8b 100644
> --- a/docs/specs/acpi_hw_reduced_hotplug.rst
> +++ b/docs/specs/acpi_hw_reduced_hotplug.rst
> @@ -64,7 +64,8 @@ GED IO interface (4 byte access)
>         0: Memory hotplug event
>         1: System power down event
>         2: NVDIMM hotplug event
> -    3-31: Reserved
> +       3: CPU hotplug event
> +    4-31: Reserved
>  
>  **write_access:**
>  

:
