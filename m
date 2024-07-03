Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp2412255njm;
        Wed, 3 Jul 2024 00:09:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFel9WZ3sRO1zxbDZdLYhuwDvFIaXLWDKEgP1y1YwW4WiL/i2uZNiff9s7XuT2n4cCKWjWf
X-Received: by 2002:a05:6358:9392:b0:19f:5a42:d2bd with SMTP id e5c5f4694b2df-1a6ace9a783mr1171123255d.22.1719990548765;
        Wed, 03 Jul 2024 00:09:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719990548; cv=none;
        d=google.com; s=arc-20160816;
        b=x2sfaX7GIbb+oq63LrUro3yK0TCQfnfnlrQbuxt7z0XQUzMs4Q2200xsWBi35ujTvT
         2l24w57o1dNNmcLnqmHFizjujA62Bv0GPlam5htFXD+A1USmEKIGd1klchz+j6+Cd7vM
         mNd+9qt8wkM2PRhyHaOeIdiJRXERNXCrLs7RJkPDf+8bOrqWwc0czd3tJyMB1nJ4Co8d
         iRMKP7JYdJjtvbwKXYLNq7lWaQ3LCdJfsC3Lz9ygfBckirSV3PadibilE8BDRIt577yB
         R9GIG8YbbfFh+DAR9DvC+OwStGDnXfzPfsMAYry9infh3NZrWQOW+jllttT+hnf4XCYS
         3Kuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=CWNkbWcXoxyNn/UtVSDDGY2VdNw9NgTw1ymoLQO/QjU=;
        fh=uxDmzs7ATx5Fkyweo4GPuDuXVd3pEvbw+mh8hZ67x9s=;
        b=W4JA/9+ntdC0kNmdYPRYHbKMVMenzcciLwUeqcmmMMeY42APX59yTiPtOQB9Plvk1J
         xH7ZTP8RRtGsVVi4OllgJ6yvcxoWSwU5G4OCQigty8V/4hczeStBHhY1WP+cuxoxMz2b
         P1PQJIEvOSCQTHMctxc538EF1wCaToMrbx8YdWgZk9z9Wxp0clLZED7RooJ8k4WPKJzi
         rEzIXykIQJs6FrcJwvMbruwAffDlAGTZ7+lyrwxJLASWvoV1b0nQi+oUJ/evOzImlfZ0
         Wqz8Gs683pAavbdaz9W8jxtZfZjf8ZvPKxzJ/nvnxftyjx3JYnXVV6g/AeM8eMcOGUqr
         xysQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of yuzenghui@huawei.com designates 45.249.212.35 as permitted sender) smtp.mailfrom=yuzenghui@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <yuzenghui@huawei.com>
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com. [45.249.212.35])
        by mx.google.com with ESMTPS id 41be03b00d2f7-72c6d41615fsi13063476a12.462.2024.07.03.00.09.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jul 2024 00:09:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of yuzenghui@huawei.com designates 45.249.212.35 as permitted sender) client-ip=45.249.212.35;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of yuzenghui@huawei.com designates 45.249.212.35 as permitted sender) smtp.mailfrom=yuzenghui@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4WDW4X5hdXz1X4RM;
	Wed,  3 Jul 2024 15:05:00 +0800 (CST)
Received: from kwepemm600007.china.huawei.com (unknown [7.193.23.208])
	by mail.maildlp.com (Postfix) with ESMTPS id 3736114037E;
	Wed,  3 Jul 2024 15:09:07 +0800 (CST)
Received: from [10.174.185.179] (10.174.185.179) by
 kwepemm600007.china.huawei.com (7.193.23.208) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 3 Jul 2024 15:09:05 +0800
Subject: Re: [kvm-unit-tests PATCH v1 1/2] arm/pmu: skip the PMU introspection
 test if missing
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
CC: <pbonzini@redhat.com>, <thuth@redhat.com>, <kvm@vger.kernel.org>,
	<qemu-arm@nongnu.org>, <linux-arm-kernel@lists.infradead.org>,
	<christoffer.dall@arm.com>, <maz@kernel.org>, Anders Roxell
	<anders.roxell@linaro.org>, Andrew Jones <andrew.jones@linux.dev>, Alexandru
 Elisei <alexandru.elisei@arm.com>, Eric Auger <eric.auger@redhat.com>, "open
 list:ARM" <kvmarm@lists.linux.dev>
References: <20240702163515.1964784-1-alex.bennee@linaro.org>
 <20240702163515.1964784-2-alex.bennee@linaro.org>
From: Zenghui Yu <yuzenghui@huawei.com>
Message-ID: <8c11996c-b36d-e560-cdeb-e543ee478a54@huawei.com>
Date: Wed, 3 Jul 2024 15:09:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20240702163515.1964784-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.185.179]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600007.china.huawei.com (7.193.23.208)
X-TUID: QzkmbCnHIZkZ

On 2024/7/3 0:35, Alex Bennée wrote:
> The test for number of events is not a substitute for properly
> checking the feature register. Fix the define and skip if PMUv3 is not
> available on the system. This includes emulator such as QEMU which
> don't implement PMU counters as a matter of policy.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Anders Roxell <anders.roxell@linaro.org>
> ---
>  arm/pmu.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/arm/pmu.c b/arm/pmu.c
> index 9ff7a301..66163a40 100644
> --- a/arm/pmu.c
> +++ b/arm/pmu.c
> @@ -200,7 +200,7 @@ static void test_overflow_interrupt(bool overflow_at_64bits) {}
>  #define ID_AA64DFR0_PERFMON_MASK  0xf
>  
>  #define ID_DFR0_PMU_NOTIMPL	0b0000
> -#define ID_DFR0_PMU_V3		0b0001
> +#define ID_DFR0_PMU_V3		0b0011

Why? This is a macro used for AArch64 and DDI0487J.a (D19.2.59, the
description of the PMUVer field) says that

"0b0001	Performance Monitors Extension, PMUv3 implemented."

while 0b0011 is a reserved value.

Thanks,
Zenghui
