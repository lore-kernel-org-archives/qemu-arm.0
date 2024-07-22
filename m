Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp1880488njc;
        Mon, 22 Jul 2024 05:25:56 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXyRCbAEYpzVV5uq0BOIxmf4XQ8S9Gu/3S4M5W0UBwHl1z8YozWwV4DlFchY+z/5uJQQN6rAAOxfJTmHbvN+rYntpzVwZRh
X-Google-Smtp-Source: AGHT+IHTrNl1qOETVatMaxcs6x8KvnzVxXFPPDbi3qOlgDcbwoQEop++a3UNBKecGOzU9ay1XZ73
X-Received: by 2002:a05:600c:1550:b0:426:5cdf:2674 with SMTP id 5b1f17b1804b1-427dc51a073mr44400065e9.4.1721651156299;
        Mon, 22 Jul 2024 05:25:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721651156; cv=none;
        d=google.com; s=arc-20160816;
        b=h+tIUlbGj+d9RixXDukiA6AptbTWTzJDhpxNj31IHKIzBqn0swgF2jX9oqdXkHfopb
         /zeN2P5tjmuIZzrNdj/GGJjEYHbWyvgCgwNy5NsCCLI3UfKc5ZYNJQBLMHlW+tULxXws
         LJV/pzKls+WEjSEInfE2JyzbpYoWF1LpDVcu2bYl0MiKOwHuEbDIbZSiLwTPHvBBMPCs
         r9rG6+5LyLOTklMFzf+KQst9zWcDfAg+bG8grTmL9fBnpJI77Cf47MwPWwnZR0+P5pCy
         1SmHilbG2A30Tfw6OfRaJrRAbXFWT4OA0j/MaU2x8bxL7ssrDYfdBjBGq7GA/Z3mvU/L
         QMfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date;
        bh=pWaKKyDINsNqMlaw7mkagWyYq9P2vhuyTRtEiaU2bUI=;
        fh=jt4Zy3NzMmUgST0sEyRdQDVF0OT2XWa8Qtc4C5tGS+A=;
        b=e3I7YaoX0M02CIQLtcqCaPumF3SMxBO0oeOvApnBC06fGQAD9Ph/5a70Sxaso5iIvr
         P/BlC/uBszYCrAbdk0H05CtA79RYTt23OUz9oO9ds+jIwyGpNqc5w/n9x6LOxX4kbQyp
         vnCSLSjqgYH6IQnVh7+sVgA2IHLRM6LnTbLxmK+8H3HnDQexbsbGiB9jVrjz59s3QJ8x
         u1i3bL/TnPzjpkJ81W+h8W4vpc1V8IGvzzlErH65pTiQt9g2163q3QU/XaxvC++s1pfS
         dveNxKFyh76T/YGCSxPTcDJKpSMvqdQGPZM/3PftbCHzjLwrj+OtQPFMPKbTlaRk+ElB
         Pp/A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-427d2a652basi38601525e9.70.2024.07.22.05.25.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jul 2024 05:25:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WSKFg5lVpz6K5sp;
	Mon, 22 Jul 2024 20:23:51 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
	by mail.maildlp.com (Postfix) with ESMTPS id 44279140B55;
	Mon, 22 Jul 2024 20:25:55 +0800 (CST)
Received: from localhost (10.203.174.77) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Mon, 22 Jul
 2024 13:25:54 +0100
Date: Mon, 22 Jul 2024 13:25:53 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Zhao Liu <zhao1.liu@intel.com>
CC: "Daniel P .\" =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>, Eduardo  Habkost <eduardo@habkost.net>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,  Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>, Yanan Wang  <wangyanan55@huawei.com>,  Michael S.Tsirkin  <mst@redhat.com>, Paolo Bonzini  <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, Eric  Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>, Marcelo  Tosatti <mtosatti@redhat.com>, Alex =?ISO-8859-1?Q?Benn=E9e?=  <alex.bennee@linaro.org>, Peter Maydell <peter.maydell@linaro.org>, Sia Jee  Heng <jeeheng.sia@starfivetech.com>, qemu-devel@nongnu.org,  kvm@vger.kernel.org, qemu-riscv@nongnu.org, qemu-arm@nongnu.org, Zhenyu Wang  <zhenyu.z.wang@intel.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>, Yongwei Ma  <yongwei.ma@intel.com>"@domain.invalid
Subject: Re: [PATCH 1/8] hw/core: Make CPU topology enumeration
 arch-agnostic
Message-ID: <20240722132553.00001fa7@Huawei.com>
In-Reply-To: <20240704031603.1744546-2-zhao1.liu@intel.com>
References: <20240704031603.1744546-1-zhao1.liu@intel.com>
	<20240704031603.1744546-2-zhao1.liu@intel.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.174.77]
X-ClientProxiedBy: lhrpeml100004.china.huawei.com (7.191.162.219) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-TUID: Agdx5QVoq54W

On Thu,  4 Jul 2024 11:15:56 +0800
Zhao Liu <zhao1.liu@intel.com> wrote:

> Cache topology needs to be defined based on CPU topology levels. Thus,
> define CPU topology enumeration in qapi/machine.json to make it generic
> for all architectures.
> 
> To match the general topology naming style, rename CPU_TOPO_LEVEL_SMT
> and CPU_TOPO_LEVEL_PACKAGE to CPU_TOPO_LEVEL_THREAD and
> CPU_TOPO_LEVEL_SOCKET.
> 
> Also, enumerate additional topology levels for non-i386 arches, and add
> a CPU_TOPO_LEVEL_DEFAULT to help future smp-cache object de-compatibilize
> arch-specific cache topology settings.
> 
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>

LGTM and bringing more consistent naming is always good.

Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
