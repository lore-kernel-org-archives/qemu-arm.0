Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp3135527njb;
        Tue, 22 Oct 2024 07:44:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCURYddZmcmKmzVjXzT8/JIkQDc9PebqYb3C0qd4E5SJmuqL4k5h9ICXy4w31u6eWLezIjaUyQm4Yfx5Cg==@linaro.org
X-Google-Smtp-Source: AGHT+IGVY5w0rrFZHmv/EtxGBtTyIgxS8ZLDIm4TnKYW2bd3iC+5QZ843T9ZSjlN+rgD5y8mNqsn
X-Received: by 2002:a05:6902:1028:b0:e2b:d860:db2a with SMTP id 3f1490d57ef6-e2bd860e78emr9025043276.28.1729608280391;
        Tue, 22 Oct 2024 07:44:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729608280; cv=none;
        d=google.com; s=arc-20240605;
        b=AYt+xE95ix48dFoJh8KhMstRHvGJKdLuIZudVe23S39suqMUzP/H0bWwvD2hENdD8E
         sVZ61TPnfP0uNY+w5GCBDXoBIPRRA34o69u/PtBB8uVuQP3N9uyczkI4/Tj54vGOrdzt
         TUAkFHSMqSvgFQObV1NFSO+/jECorFuU8083FPxeoMeldYWnCEBulx4wXWme+DzNPSq1
         vFdLcXeJecleYMB/UY441J3b1VmBdHVT7aoLOxw+SBYCe3X1YSRYmTexE3p62Q+el4iP
         rBJOvjwPa+uPqJzO6dIJz59fa53Vg5L7kiWEvk4JDDWjELoXwG7l8dddV/6eX/cjyT/Y
         W/Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date;
        bh=hWbcNIMawRZ0/VI4Yl1G2UQLDJAejpiflKVH7EgThc8=;
        fh=f8PQoj5k0nkL1XHbOpHpY0tDf+Gu7U93HspXETo9OP4=;
        b=axetnvYIWgDtN6aKSXYDnLm2Gg0f4bD5c2qJBYpqeupj+znW/3KtAx2AaShRMYaXC7
         jtldz/yYebsbZy2bxOJOC2R6GMERVPZJQfpHcSFollQf+GjHURBUW++CgGUIPl063Vvn
         5Z8+OedBv4PZQhJDmQWaVQelfrBTahs5LU1mPoGkBrKRT70hpmRVFN60AZ0QTTV/fpcS
         5b1ZfBYseODr3/21AWKml1cx4jrfWGiWWmlaLEZ8hVMyaLxphjrU4oogevEqHADo6qFB
         1iKsuUHlODQLf0WKu9DnsxE+sOHcMCYfOucsrtGIIroKjE5Icq47Ej6NZER4H6hNLBoP
         hHOQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id 3f1490d57ef6-e2bdc9ae947si3682301276.205.2024.10.22.07.44.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Oct 2024 07:44:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XXw0b2ftvz6JBBn;
	Tue, 22 Oct 2024 22:43:43 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id BD65B1400DB;
	Tue, 22 Oct 2024 22:44:38 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 22 Oct
 2024 16:44:37 +0200
Date: Tue, 22 Oct 2024 15:44:36 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Zhao Liu <zhao1.liu@intel.com>
CC: "Daniel P . =?ISO-8859-1?Q?Berrang=E9?=" <berrange@redhat.com>, "Igor
 Mammedov" <imammedo@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Philippe =?ISO-8859-1?Q?Ma?=
 =?ISO-8859-1?Q?thieu-Daud=E9?= <philmd@linaro.org>, Yanan Wang
	<wangyanan55@huawei.com>, "Michael S.Tsirkin " <mst@redhat.com>, "Paolo
 Bonzini" <pbonzini@redhat.com>, Richard Henderson
	<richard.henderson@linaro.org>, Eric Blake <eblake@redhat.com>, "Markus
 Armbruster" <armbru@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>, Alex
 =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, Peter Maydell
	<peter.maydell@linaro.org>, Sia Jee Heng <jeeheng.sia@starfivetech.com>,
	Alireza Sanaee <alireza.sanaee@huawei.com>, <qemu-devel@nongnu.org>,
	<kvm@vger.kernel.org>, <qemu-riscv@nongnu.org>, <qemu-arm@nongnu.org>,
	"Zhenyu Wang" <zhenyu.z.wang@intel.com>, Dapeng Mi
	<dapeng1.mi@linux.intel.com>
Subject: Re: [PATCH v4 5/9] hw/core: Add a helper to check the cache
 topology level
Message-ID: <20241022154436.000028af@Huawei.com>
In-Reply-To: <20241022135151.2052198-6-zhao1.liu@intel.com>
References: <20241022135151.2052198-1-zhao1.liu@intel.com>
 <20241022135151.2052198-6-zhao1.liu@intel.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100004.china.huawei.com (7.191.162.219) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: Rjx94OUWk7sr

Resend. Claws-mail is still chewing up the to list for unknown reasons
and I forgot to fix it by hand.

On Tue, 22 Oct 2024 21:51:47 +0800
Zhao Liu <zhao1.liu@intel.com> wrote:

> Currently, we have no way to expose the arch-specific default cache
> model because the cache model is sometimes related to the CPU model
> (e.g., i386).
> 
> Since the user might configure "default" level, any comparison with
> "default" is meaningless before the machine knows the specific level
> that "default" refers to.
> 
> We can only check the correctness of the cache topology after the arch
> loads the user-configured cache model from MachineState.smp_cache and
> consumes the special "default" level by replacing it with the specific
> level.
> 
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
Looks like useful sanity check code to me.
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>


