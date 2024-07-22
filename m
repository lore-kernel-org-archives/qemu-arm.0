Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp1894465njc;
        Mon, 22 Jul 2024 05:54:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXC1FMSiaDC9dNm49BXtXBYEvVv9WtYROUTcJmZ9cFmRi415bRHNrUQV0FlMDfIJigsTHwP5G9KckTS/imP3hRe5uADW8zu
X-Google-Smtp-Source: AGHT+IH+V03Pl3buNLDb2IqMO9jXfbVE0gIHbna4/YbK+RTEn8QZPMBQF1rpn9EUFBj4ymvnvHWA
X-Received: by 2002:a05:6830:6004:b0:703:63d3:9ef7 with SMTP id 46e09a7af769-70900929a0bmr9584163a34.14.1721652888034;
        Mon, 22 Jul 2024 05:54:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721652887; cv=none;
        d=google.com; s=arc-20160816;
        b=SynK9+U2Mj1BMjKTWOSFGOfqGjBBGgGuuS1VZp1rCUCHh+nx8MvDqJn8Q2j5HZVo7m
         4X+W/57EVxeVoMvQyzUMhkG1NKOuzeoFl9coeq7HXUqf8zi7kOOlFATzkSqRYf949WJw
         8b2b9I892ZfSdQmgZNhkgZppO2L4e3uj4t7hF7iRhB3jxAzIPuvcfrf28wGtmHD6OZJ4
         +qtIO8ROapeevmTryrvDyCRzwBJgfjFKIxzloD7axNJARAobd3Gkqd24jJexq3Dp6cbL
         ryri7GkAZn+LWEsylVN0oLTyFiXRZ1kJiXfSbLtXS3QK5CTqN68g2DlmZBpB/ANLEuuc
         xvXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date;
        bh=RKyyz3DsoO81TcNXCjEd3nhdD3vy3jemnF6h5QjOSVs=;
        fh=jt4Zy3NzMmUgST0sEyRdQDVF0OT2XWa8Qtc4C5tGS+A=;
        b=pepo5OJVNlPZt9FRSwVXFLgB4mLrat1+x+5TzawxVYoSKvp9A+NRl+sqzMRPASq9w3
         UzD76x0yeGgPhBP/kWWa7s7BwiOTic6NsbDtYtrrcKW36Egkkv1gcwhgc6HzolxDSubZ
         QqHSoSV1BWHBs9WaFhfpNwhtvO5r6n+hZvXviLYubVbfSFeLaWSRSAwUAH8EEAgTwFx+
         86sjyOE5VmSr1Hjehp/qzc3S+uAHlHj2mqprQwtvQp8OYy0Pg/FhATDTSYvxqcnrck6F
         5zBLu9++zUTEDA0GKHUL2ZVB2Bx5ajpqZ1SPEDmwRc7hkgY21TPRyMDXsKdjKU4EoTal
         8mYQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id 41be03b00d2f7-7a1de0ea145si3016847a12.808.2024.07.22.05.54.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jul 2024 05:54:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WSKtv6yHtz6K61X;
	Mon, 22 Jul 2024 20:52:39 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 798FC140D1A;
	Mon, 22 Jul 2024 20:54:43 +0800 (CST)
Received: from localhost (10.203.174.77) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 22 Jul
 2024 13:54:42 +0100
Date: Mon, 22 Jul 2024 13:54:42 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Zhao Liu <zhao1.liu@intel.com>
CC: "Daniel P .\" =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>, Eduardo  Habkost <eduardo@habkost.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,  Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>, Yanan Wang  <wangyanan55@huawei.com>,  Michael S.Tsirkin  <mst@redhat.com>, Paolo Bonzini  <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, Eric  Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>, Marcelo  Tosatti <mtosatti@redhat.com>, Alex =?ISO-8859-1?Q?Benn=E9e?=  <alex.bennee@linaro.org>, Peter Maydell <peter.maydell@linaro.org>, Sia Jee  Heng <jeeheng.sia@starfivetech.com>, qemu-devel@nongnu.org,  kvm@vger.kernel.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org, Zhenyu Wang  <zhenyu.z.wang@intel.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>, Yongwei Ma  <yongwei.ma@intel.com>"@domain.invalid
Subject: Re: [PATCH 0/8] Introduce SMP Cache Topology
Message-ID: <20240722135442.000003de@Huawei.com>
In-Reply-To: <20240704031603.1744546-1-zhao1.liu@intel.com>
References: <20240704031603.1744546-1-zhao1.liu@intel.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.174.77]
X-ClientProxiedBy: lhrpeml500002.china.huawei.com (7.191.160.78) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-TUID: kH9VjGLafxsp

On Thu,  4 Jul 2024 11:15:55 +0800
Zhao Liu <zhao1.liu@intel.com> wrote:

> Hi all,
> 
> Since the previous RFC v2, I've reimplemented smp-cache object based on
> Daniel's comment (thanks Daniel!), which is both flexible to support
> current cache topology requirements and extensible.
> 
> So, I officially convert the RFC to PATCH.
> 
> Background on smp cache topology can be found in the previous RFC v2
> cover letter:
> 
> https://lore.kernel.org/qemu-devel/20240530101539.768484-1-zhao1.liu@intel.com/
> 
> The following content focuses on this series implementation of the
> smp-cache object.
>
Hi Zhao Liu

I've not commented on most of the x86 specific corners, but we are
working on arm64 / PPTT support combining the info form CPU registers with
the 'where' description this provides.  Should have a series on top of
your work to post soon. 

To me the interface looks fairly clean so I hope this object approach works
for everyone!

Jonathan


