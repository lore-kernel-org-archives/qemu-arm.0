Received: by 2002:a17:505:790d:b0:1cc9:4ad0:aa2 with SMTP id xu13csp3660160njc;
        Thu, 12 Jun 2025 09:34:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV1JGhlAc21bYpLlgH4MSraHya1aUROXh4BqWe8lX7DKlfxfNT1FCndx87yYWCYK+zY3OUk7v/eSr8Ldg==@linaro.org
X-Google-Smtp-Source: AGHT+IE+AQnLVRgrS0uPfJ3NjvbDyIe9xAywNfzRc9FkCfR+ZAhfsocdVihga1kCvGx37BX6KtQ4
X-Received: by 2002:a05:6000:2c0c:b0:3a5:2cb5:63f8 with SMTP id ffacd0b85a97d-3a5679e423dmr563210f8f.29.1749746040800;
        Thu, 12 Jun 2025 09:34:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749746040; cv=none;
        d=google.com; s=arc-20240605;
        b=ffBaV/03gVKBOZBFsiO5KIXv36V3EkucatKHsJIae8LC9eSulu/uINWD5sEil37A7m
         mdATv2sgyl3ZwxIjEPof0GxvIYrWn6TVluFOUbkAzkB2wAbqrbDuj9tjmcf0/mrdI6It
         TB87zzMf7W562CMQrGtDVUJIZj5Ar7/kX7tgarcgKm6AJoKGpRo3NGMjBVyWqBliQVmH
         +QOkpFeoCeHQHybdfScWoJ48er3QjdztpzchKPZQfJanInSj4LLqChego9SpUub4IYdd
         nEyKOz+g1kJuRGxOtaDosS/RL8DPfw8sbHfKEm37V6xQ6gbYLU5gfzLPvxxUl8L84+Vw
         xjSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=dEvIZ3WzviwqOzkTjpOpCs5/WjFdz+xlUIILaYODMIg=;
        fh=oDLjFSOamsMv4A51Yf2lSFFkJGeFX4zTdFZqA2DwPmw=;
        b=Y0AbPmzt6fbqvPMgY3V3kXL2kAzu70s9tXrYxv8t1K0yTjEomsqwS3UB8nb5gArCMA
         J/fUaODrkoNslWZ4nZEFrmmNyB7ecMqsMBOJkCA5T61w9joHd2IehZIUmL3wcFx0rgQ4
         2bJSyc4GXRxsWDd8WGEwEHnehRITO8tGbud/zWw19v9eb65qcU8G/RhJh7RD01s/UZkz
         EM0hd6n98w2oltfaV5PKgnbysvPPdYhmL32f2BtvPibZIZsEiOmtcaSaq9rL/A6OWLyp
         n3QQe3XRZReY2+3m1GOpoIgagKMckDaOCpkUn/+3g4T0Y64mmywIfZhhAuKc2VjEdO7x
         b88g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-4532516028bsi37547335e9.48.2025.06.12.09.33.59
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 Jun 2025 09:34:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bJ7Pn1zlTz6M52S;
	Fri, 13 Jun 2025 00:33:33 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 4B09414038F;
	Fri, 13 Jun 2025 00:33:59 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 12 Jun
 2025 18:33:58 +0200
Date: Thu, 12 Jun 2025 17:33:57 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>
CC: <qemu-devel@nongnu.org>, Fan Ni <fan.ni@samsung.com>, <mst@redhat.com>,
	Zhijian Li <lizhijian@fujitsu.com>, Itaru Kitayama
	<itaru.kitayama@linux.dev>, <linuxarm@huawei.com>,
	<linux-cxl@vger.kernel.org>, <qemu-arm@nongnu.org>, Yuquan Wang
	<wangyuquan1236@phytium.com.cn>, Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?=
	<philmd@linaro.org>, Alireza Sanaee <alireza.sanaee@huawei.com>, Alex
 =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH v15 0/4] arm/virt: CXL support via pxb_cxl
Message-ID: <20250612173357.00002f31@huawei.com>
In-Reply-To: <CAFEAcA9CuQWL2b63+XCe+vZCGR7hRSx8SkTR0LDa+Ra1Z5ur7w@mail.gmail.com>
References: <20250612134338.1871023-1-Jonathan.Cameron@huawei.com>
	<CAFEAcA9CuQWL2b63+XCe+vZCGR7hRSx8SkTR0LDa+Ra1Z5ur7w@mail.gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml500006.china.huawei.com (7.191.161.198) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: 7hCoCo1aoPUG

On Thu, 12 Jun 2025 17:04:32 +0100
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Thu, 12 Jun 2025 at 14:43, Jonathan Cameron
> <Jonathan.Cameron@huawei.com> wrote:
> >
> > v15:
> >   - Split the address map calculations and mmio setup into separate
> >     functions in patch 2, allowing v14 patch 3 to be dropped as not
> >     x86 and arm make the same calls.  Note I felt this was a sufficient
> >     change to trigger dropping tags. (Zhijian Li)
> >   - A few other minor tweaks.
> >   - TLB issue mentioned in v14 now fixed upstream so dropped reference
> >     in this cover letter.
> >
> > Thanks to Itaru Kitayama and Zhijian Li for testing + reviews.  
> 
> Hi Jonathan -- I forget where we are on this. Do you think this
> series is OK to go upstream at this point, or is there still
> stuff you're iterating on here ?  (Put another way, should I
> review it and consider queueing it?)

Hi Peter,

Please do review + consider queuing it.  The recent changes have
just been tidying up based on reviews and before that it was just
the switch over to sysbus devices for the CXL Fixed Memory Windows.
That was mainly because I need that for other stuff and I think
you suggested it a few years back so I thought it might make you
happier with this :)

Thanks,

Jonathan

> 
> thanks
> -- PMM
