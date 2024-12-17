Received: by 2002:a17:504:664e:b0:1be9:327d:8ee3 with SMTP id l14csp375308njk;
        Tue, 17 Dec 2024 09:22:04 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVe1Lqjdu5/y05c9aFQQIL/R6ehhlZmeZimY57msXq52mSFfuoXXFGkEgfGKs5PDg+A5RWNZs9rSOW2Bw==@linaro.org
X-Google-Smtp-Source: AGHT+IHrEqxpzXukStawIl06H1tmfjDSDlocJDrz1YjD9/2YLEs3htaY5bFxyFK9kuhQQIW51FbZ
X-Received: by 2002:a5d:5f87:0:b0:386:33e3:853c with SMTP id ffacd0b85a97d-38880ac5f48mr14582531f8f.12.1734456124454;
        Tue, 17 Dec 2024 09:22:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1734456124; cv=none;
        d=google.com; s=arc-20240605;
        b=gamQG++BNAVWbkpEuMgWk+g/1e4NSbsUlq8WjV+n3z+CGgBBDm+sSkAEyEm18KlLLw
         NMphwl74QX1NZAate/gBvfQe/xCsuynalm1G1f/zV/gNCS2xIsy9/RiUFYiJJU+OM/+V
         9jdmBmj60PYNcQ4Yp8f4aKFRUd6P7Gidp7Tbe1OysKMqEzCLqXHFJRflMXXch7kmh8Bh
         xgcc5W8veGyTW4gT+IRoSjntKzEyLZuBRTKxvo7tOCyeS1xibTQKge0/gZskrlPFrFD3
         fFVsjFr1QN5dSW4Bw9DQ52XekssiNvVlTAxrWiOGWpVP/oZao6dXInRuSH90w/S19EQ1
         f3Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date;
        bh=ilhChJsk3h3u9iD34ltAQKdQxNFSbWJkpKyytkfZ5CM=;
        fh=QbQwX7HoHn5xCVksrOC7YZVo1kOn2PuYYsZgwdc/EeU=;
        b=NzDsmXW49Lh2bTQCTo5s+Bgdsdvs4g6Ih2Y52dLgkEQyu0b6pdtA8sjZmbgVnpxvdm
         st358o+WX+huLWYjTj57y5F7jOs29xvAGRw+OAFTMjLeZTDw13Jo7sD1s/XSk2ZOZgc7
         xzJ48FnFAVlbQkJfImyMXDVOheR4hctUa1jMKXEZkjgR0hhs4uqerxJ7Ga3AHXlzepXk
         Sz8XE75X4ZWGi7+Kb0hABhC38vdlrDmHEWIef6cVd7CzsUSUVBmJm8+mzT3PaWS66yVe
         qyoWuOP+zAsur3+T0cYmKHAmerS58m9O+EAeY0ExQ+ZZxZ43VEHh/Iz2I7LcHYULEbf8
         gbrw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of alireza.sanaee@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=alireza.sanaee@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <alireza.sanaee@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-388c80613d8si5783955f8f.522.2024.12.17.09.22.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Dec 2024 09:22:04 -0800 (PST)
Received-SPF: pass (google.com: domain of alireza.sanaee@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of alireza.sanaee@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=alireza.sanaee@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YCNrC6rSnz6LDMB;
	Wed, 18 Dec 2024 01:20:59 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
	by mail.maildlp.com (Postfix) with ESMTPS id 76A6F140C98;
	Wed, 18 Dec 2024 01:22:03 +0800 (CST)
Received: from localhost (10.48.158.120) by frapeml500003.china.huawei.com
 (7.182.85.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 17 Dec
 2024 18:22:02 +0100
Date: Tue, 17 Dec 2024 17:21:56 +0000
From: Alireza Sanaee <alireza.sanaee@huawei.com>
To: Zhao Liu <zhao1.liu@intel.com>
CC: "Daniel P .\" =?UTF-8?Q?Berrang=EF=BF=BD?= <berrange@redhat.com>, Igor  Mammedov <imammedo@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, Marcel  Apfelbaum <marcel.apfelbaum@gmail.com>, Philippe =?UTF-8?Q?Mathieu?=  =?UTF-8?Q?-Daud=EF=BF=BD?= <philmd@linaro.org>, Yanan Wang  <wangyanan55@huawei.com>,  Michael S.Tsirkin  <mst@redhat.com>, Paolo Bonzini  <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, Eric  Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>, Marcelo  Tosatti <mtosatti@redhat.com>, Alex =?UTF-8?Q?Benn=EF=BF=BDe?=  <alex.bennee@linaro.org>, Peter Maydell <peter.maydell@linaro.org>, Jonathan  Cameron <Jonathan.Cameron@huawei.com>, Sia Jee Heng  <jeeheng.sia@starfivetech.com>, qemu-devel@nongnu.org, kvm@vger.kernel.org,  qemu-riscv@nongnu.org, qemu-arm@nongnu.org, Zhenyu Wang  <zhenyu.z.wang@intel.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>, Yongwei Ma  <yongwei.ma@intel.com>"@domain.invalid
Subject: Re: [PATCH v2 0/7] Introduce SMP Cache Topology
Message-ID: <20241217172156.00007173@huawei.com>
In-Reply-To: <Z2Gk5Ta43HJ9ChAT@intel.com>
References: <20240908125920.1160236-1-zhao1.liu@intel.com>
	<20241217142342.00007d96@huawei.com>
	<Z2Gk5Ta43HJ9ChAT@intel.com>
Organization: Huawei
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.158.120]
X-ClientProxiedBy: lhrpeml500005.china.huawei.com (7.191.163.240) To
 frapeml500003.china.huawei.com (7.182.85.28)
X-TUID: FhfXub65Wntb

On Wed, 18 Dec 2024 00:20:53 +0800
Zhao Liu <zhao1.liu@intel.com> wrote:

Hi Zhao,

> > Hi Zhao,
> > 
> > I wonder if this patch-set requires rebase for the new cycle?
> >  
> 
> Hi Alireza,
> 
> Yes, as some general patches are merged.
> 
> (Pls refer the
> v5: https://lore.kernel.org/qemu-devel/20241101083331.340178-1-zhao1.liu@intel.com/)

Oops! Thanks for the pointer.
> 
> I'll send a new version this week, to include the remaining patches
> (i386 path and your has_caches flag):

That's amazing ;) 
> 
> i386/cpu: Support thread and module level cache topology
> i386/cpu: Update cache topology with machine's configuration
> i386/pc: Support cache topology in -machine for PC machine
> i386/cpu: add has_caches flag to check smp_cache configuration
> 
> Regards,
> Zhao
> 
> 
