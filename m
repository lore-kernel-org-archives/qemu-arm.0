Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp404873njc;
        Fri, 13 Jun 2025 10:17:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU3LsF4TtNLA2sBMzIiFPewk6/eXTrryswCRedQxm4CoPMpGSZn6DDuoRWdIsiTpgYfxtEDDQk20UsxTQ==@linaro.org
X-Google-Smtp-Source: AGHT+IF6QW8jm1QP/cUP6XXMEpYTesZHdrSW1U+hpcg1guZ034+DBQdf8R8fFgV1P7P6UxLiRJNH
X-Received: by 2002:a05:6000:2c12:b0:3a4:ebc4:45a9 with SMTP id ffacd0b85a97d-3a57237478emr677963f8f.19.1749835058986;
        Fri, 13 Jun 2025 10:17:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749835058; cv=none;
        d=google.com; s=arc-20240605;
        b=PKStx4G8sbgJfC1j9Lh2IZGZy9x69dkEdgmCb+AOR8KG1ikfRAjiVlhlde+QEX5Z/E
         QImrCs/nUUrqbVhlwwweBXOr4BKecSvnxEVN6fl+pMNeQsB9RQXG7NlR8vtkoaSff9KG
         y5AZ++iMWllVhTSrVIvw1LlOe4w5jDRnflF/fEzSwTwMnuFbXrL50omijqwdBv6tQReA
         /I6Ptsg4lC5NChyk8oon0om6uexQ2XSYbT0F1Ns4/di1mzSYAEpFdzaXX/DTXBroCf0m
         u26N5ReSrlhKSQMm23tqtLS7jgaHjpSJW5lDFd0b3yinIxrXrlHdb0oH3YK9BPQEmOtc
         ZdMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=h+qDIiRNw1c+5vptitg4k+6Db6gG778J01n7BHTFt6Q=;
        fh=oDLjFSOamsMv4A51Yf2lSFFkJGeFX4zTdFZqA2DwPmw=;
        b=IyAfxcA00BLwGTh6yGLGI9ad7EgxDaQ2/GZAqJOmLuzTeGbz3LreC8P8qEb8hpb/uJ
         9hRH4+//nJYxlt41zOxyzLCmTf6sTcpfr2gprhrptHRuBqg4GLhxYSzF7/GZYMt0nYk1
         Diq+/ex04IrunJ5KMjcTr2Tbk8/xpTjiSoehnxjCgaopcJ+ycAvh9u5G64iko/BnJOok
         gDMIJWx2kdWoq8IS8CpyQ5udN5/FVlGpiXJwK8hEhTWn24urNhf75PBt83TCZJpnt29D
         VMw+OCzF1Med4b5GHqjJhIWZTga9+9KOXWTY6UOMbSyxT8ZLc0zntm6smep89SBDvbf5
         R3HA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a568b0b061si1813337f8f.234.2025.06.13.10.17.38
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Jun 2025 10:17:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bJmKf5XBnz6M4sr;
	Sat, 14 Jun 2025 01:17:10 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 439BC140277;
	Sat, 14 Jun 2025 01:17:38 +0800 (CST)
Received: from localhost (10.122.19.247) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 13 Jun
 2025 19:17:37 +0200
Date: Fri, 13 Jun 2025 18:17:36 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>
CC: <qemu-devel@nongnu.org>, Fan Ni <fan.ni@samsung.com>, <mst@redhat.com>,
	Zhijian Li <lizhijian@fujitsu.com>, Itaru Kitayama
	<itaru.kitayama@linux.dev>, <linuxarm@huawei.com>,
	<linux-cxl@vger.kernel.org>, <qemu-arm@nongnu.org>, Yuquan Wang
	<wangyuquan1236@phytium.com.cn>, Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?=
	<philmd@linaro.org>, Alireza Sanaee <alireza.sanaee@huawei.com>, Alex
 =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH v15 2/4] hw/cxl: Make the CXL fixed memory windows
 devices.
Message-ID: <20250613181736.000063e5@huawei.com>
In-Reply-To: <CAFEAcA_ZbAnUS4Ufa+jsOgj6aeRS5JHJP=scw6d0qXd3NNtqdA@mail.gmail.com>
References: <20250612134338.1871023-1-Jonathan.Cameron@huawei.com>
	<20250612134338.1871023-3-Jonathan.Cameron@huawei.com>
	<CAFEAcA8eC9TpGyrMARRUWs4q1o7LACD03zLAwPnTRU+m98LrWQ@mail.gmail.com>
	<20250613140954.000013f5@huawei.com>
	<CAFEAcA_ZbAnUS4Ufa+jsOgj6aeRS5JHJP=scw6d0qXd3NNtqdA@mail.gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.122.19.247]
X-ClientProxiedBy: lhrpeml100006.china.huawei.com (7.191.160.224) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: 9QXHKmBNj6KK

On Fri, 13 Jun 2025 17:08:28 +0100
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Fri, 13 Jun 2025 at 14:10, Jonathan Cameron
> <Jonathan.Cameron@huawei.com> wrote:
> > For these specific devices (the fixed memory windows) there isn't
> > any state as they are representing fixed configuration of the system.
> > The state is all in the host bridges and beyond. I'll add
> > a comment as you suggest.
> >
> > Currently CXL emulation is completely broken wrt to migration and
> > there are some known issues for reset as well. Both are on the list
> > of things to fix. Migration is less important as the only current use
> > for this stuff is running software stack test cases and for that
> > migration isn't currently of interest - that will change for some
> > of the virtualization related work that is just getting started.  
> 
> That's OK as long as something somewhere is registering a
> migration-blocker so there's a useful error message if the
> user ever tries it.
:(

Michael asked for us to fix that a while back and I forgot.

Will sort that out shortly.

J
> 
> -- PMM
