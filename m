Received: by 2002:a17:505:3f8c:b0:1be9:327d:8ee3 with SMTP id bm12csp297635njb;
        Wed, 31 Jul 2024 04:39:28 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWryClInG/+NoPHPEw20NA58BApoFKPKPZzxzXfHwq6XMtJVZFsO81NaYmLt9lUNS/tjD9uVfRmNyxntKwNSDTQMVaKGHV+
X-Received: by 2002:a17:906:f58d:b0:a77:eb34:3b4b with SMTP id a640c23a62f3a-a7d3ffad76cmr1047609966b.11.1722425967829;
        Wed, 31 Jul 2024 04:39:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722425967; cv=none;
        d=google.com; s=arc-20160816;
        b=Z0XdbstPDdbjeocINmU046Bua3qgeDzHKxzcjt8+c6ZuK1/fJGVSIxMhQf4apLY18h
         bniL4iZ+XAprkJD0tEVVU0rkUD5l+JRARLkjc3NdWtyYW2LnOP9pAfdx0r3TrsW5DUQ4
         GQnwDRLZRN5IrsXmusLTEMHFRCagglrUpSSLwmGN6rUBV+xrp0uFiwqGUQbVmvBMhj7l
         Q5Gb1YyRo3AM+Jgl77mMw0uBaeEbMe6yuxydTEwcdKLLjWDHW7zPc/EZcC+rNTOb9hMX
         VR74G4M7c47Ska/BLhALzwRaekEkJXJa9rFDzjGWbuTQCJ5BRTbUw1Y+UH6sr174jMyg
         425Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=9aiq++bdNk44vu8pBxgjGzZR8HEkDbz3gF4BkYmxTlQ=;
        fh=PB8LkC3abRRRR+v94NNQEFlQcz0ENVOinCoz3S10suw=;
        b=icXXR50KW+lk+3HgaeAwLDGZ3REpAnpqpJpJb6fPNzUYwVBoWd8tWa/xhjGV2r3gec
         DK+3T/JFrpIJiPTGkrqxCvj6eSSFq3Dfz33fzdLYCqsMWA/v4pNKHP3ycqM51ssUQ+KV
         u+1fT5wPyFlmuou3auoPBvQupw7YwggC8Xk2Ty6176nLEhVoIF1PXUCJMoD7OPTAioif
         HLV54IRSRjvvTv50yr7q+MeWVoN0a8rK6nogrI8WuBG5vAZ5uObIGDkhBsCgfymmHmy8
         b0eEtE9UZweorpGqS0+lGs4Z4XBjVhIu2Ws1hsLrYjiwzHeDY6RqXEBl5hP30OKUrtzZ
         4ubw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pdlfdlLM;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id a640c23a62f3a-a7acb3eebdesor291323466b.16.2024.07.31.04.39.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 31 Jul 2024 04:39:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=pdlfdlLM;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1722425967; x=1723030767; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9aiq++bdNk44vu8pBxgjGzZR8HEkDbz3gF4BkYmxTlQ=;
        b=pdlfdlLMgiHEpZ63TBsSDSN6Y1+Xl1SkwZjbSHwFFoPOxJMDdrE1gIkyO9WLTko+4v
         ryN7TadqZjjVDElXIMel28sb9TsiGFpWGEHCnZdLrSMItPXyIZgkPHxp5L0h/3+SneqA
         T7dw9SLGbjEQzvYYwkAZVXAof4FuPQAHp9n7KEZqmBbCm2s+jEz72s3Qc29SuCz+Hf/y
         V8/GCMDt6vTls2dsxvNjPfAj6SLJvboaJNUBKCx361zcTmo9BYVTrukuivFi0QxdZkYK
         mbcsI2uDZavUH6b05c51fzRIPbbImZ+JgoWx5WI1srQXRKTxaoqkE64bsbnbR11OMEGI
         W5Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722425967; x=1723030767;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9aiq++bdNk44vu8pBxgjGzZR8HEkDbz3gF4BkYmxTlQ=;
        b=QcH5MNOkanmvRkbKFbOcW7wPwd0qXduazdbag6qZCkrO7AGN4pzmeT3dWPwMdvimqi
         a7xBTIHhy6Inrg2ZCznmSHgi4iD6z1eje/8ABOKsX0lLmutPWGzbY14nglktkCHU+ENB
         wHHp2807N8Epwa+FG+UHQbIqmKuOWmA5+Wr/n0LhRKLbVGoiwl9cNdJzWQ1X1U96fmDj
         idaawGlFm1P5n0RaKZFWL8nSrpQR1UOndtRWfrz07Q/I2CdHpHgyFHqlCBQxzEqgpAQA
         7+gFFkr2B4jjxvGlA5kzlwwAYwVALSskuj25GX/cLGhIhKwjALBl6KZZCHjD/1ShmAbh
         xW0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWsLbJ2Su8YJEfC5rApmDtDR5fGxOcTLs/2QYvMe1VKnGLo7ReGWXnUhdjNGbN1Ebpy/uOFnvltdvo84jYSylfPWktgkS1Q
X-Gm-Message-State: AOJu0YyqSnqt6jc4hRScKcGCrNx2510s/kHhk1CpYYPfdauqvE5w5+Xc
	YGeheTGXaprC9ZuFxjVX9StFo/a7p2e4uQKg1Sxh+HEGJnL5diIKkNl8UjG2h3f76GXQciNibGe
	lSz4223ZKt6wyMaxsRJBKDqPsaK+gztBnrEi2GwZA
X-Google-Smtp-Source: AGHT+IEhk2KY9TqI5RY6PcdaXLOZvwu1zuWW3/ZTj9B6nsvrnnlDIrMnFYwUw3MYrxvmYUzHFBSKil8jAhJhJ+c524c=
X-Received: by 2002:a50:9e6b:0:b0:5a3:b866:eaef with SMTP id
 4fb4d7f45d1cf-5b0223da231mr7630727a12.31.1722425967297; Wed, 31 Jul 2024
 04:39:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240725145132.99355-1-salil.mehta@huawei.com>
 <20240726113355.731e61fe@imammedo.users.ipa.redhat.com> <ae5fa879bb7d416b92face2dcf9045fd@huawei.com>
In-Reply-To: <ae5fa879bb7d416b92face2dcf9045fd@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 31 Jul 2024 12:39:16 +0100
Message-ID: <CAFEAcA-MrfFiJcrKabz2MYiu6VHju6+yUAeeLB7MBrT-0tAWCw@mail.gmail.com>
Subject: Re: [PATCH] accel/kvm/kvm-all: Fixes the missing break in vCPU unpark logic
To: Salil Mehta <salil.mehta@huawei.com>
Cc: Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mtsirkin@redhat.com>, 
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, 
	"mst@redhat.com" <mst@redhat.com>, "maz@kernel.org" <maz@kernel.org>, 
	"jean-philippe@linaro.org" <jean-philippe@linaro.org>, Jonathan Cameron <jonathan.cameron@huawei.com>, 
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, 
	"richard.henderson@linaro.org" <richard.henderson@linaro.org>, 
	"andrew.jones@linux.dev" <andrew.jones@linux.dev>, "david@redhat.com" <david@redhat.com>, 
	"philmd@linaro.org" <philmd@linaro.org>, "eric.auger@redhat.com" <eric.auger@redhat.com>, 
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, "pbonzini@redhat.com" <pbonzini@redhat.com>, 
	"will@kernel.org" <will@kernel.org>, "gshan@redhat.com" <gshan@redhat.com>, 
	"rafael@kernel.org" <rafael@kernel.org>, "alex.bennee@linaro.org" <alex.bennee@linaro.org>, 
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>, 
	"darren@os.amperecomputing.com" <darren@os.amperecomputing.com>, 
	"ilkka@os.amperecomputing.com" <ilkka@os.amperecomputing.com>, 
	"vishnu@os.amperecomputing.com" <vishnu@os.amperecomputing.com>, 
	"karl.heubaum@oracle.com" <karl.heubaum@oracle.com>, "miguel.luis@oracle.com" <miguel.luis@oracle.com>, 
	"salil.mehta@opnsrc.net" <salil.mehta@opnsrc.net>, zhukeqian <zhukeqian1@huawei.com>, 
	"wangxiongfeng (C)" <wangxiongfeng2@huawei.com>, "wangyanan (Y)" <wangyanan55@huawei.com>, 
	"jiakernel2@gmail.com" <jiakernel2@gmail.com>, "maobibo@loongson.cn" <maobibo@loongson.cn>, 
	"lixianglai@loongson.cn" <lixianglai@loongson.cn>, "npiggin@gmail.com" <npiggin@gmail.com>, 
	"harshpb@linux.ibm.com" <harshpb@linux.ibm.com>, Linuxarm <linuxarm@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: 5cpVplWItT07

On Wed, 31 Jul 2024 at 09:49, Salil Mehta <salil.mehta@huawei.com> wrote:
>
> Hello,
>
> A quick check and a gentle reminder, has this patch been accepted?

Thanks for the ping. I'm doing a target-arm pullreq tomorrow
so I'll take it via my queue.

-- PMM
