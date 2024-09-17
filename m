Received: by 2002:a17:504:1bc1:b0:1be9:327d:8ee3 with SMTP id v1csp49013njg;
        Tue, 17 Sep 2024 02:06:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV65jE8Vt6hWOy0TU7I+itWCgP0Oln8QrukbkGaFlpUOR7qqWvx+qYzqjWhJz7bqoYRz8C4fTKJssxhbA==@linaro.org
X-Google-Smtp-Source: AGHT+IExx+QYwLMfJ2Sj2y/NGbDPBhbpHKXFc7I8tYq5EsotxdFKFBCVbM6kpa+aTZ958vsOLsER
X-Received: by 2002:adf:a39b:0:b0:368:3f6a:1dea with SMTP id ffacd0b85a97d-378d61d4f40mr13141215f8f.6.1726564007363;
        Tue, 17 Sep 2024 02:06:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726564007; cv=none;
        d=google.com; s=arc-20240605;
        b=gMUC8ybZ10fmzSdH0pdrhgmTH7RgPYgXfRpbEhE7eG5EoiilM46o/8TApLYFRfZ83m
         lvZU+oCWBUNMsG19hOIm9CJMjrNZJfS5n8PXTy1hfJljPtyjRG/1TGZjiDIcyPU4q22x
         pQ0bjPBlPmpNNZNyI94cbhtj0vPOIsC0LN0qAE2cJlDEeDYSVqD8uhJZmWJJzFy56TVF
         oWADi7BRC4L2OFQEZk4oVrWbxNO8YCqaKPtkG8dACg3RHgudBXSDP+ABhYw6MdcicWrZ
         sNsV/u5NnbkrDdzIwP9Afsoyg8ZQXvHHD/gKY40lF9zCREf3WMbmImwYYF2yokArN+ZX
         Os4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date;
        bh=/4534uX10Au1WOdCwFeTBMNlo9BDMgvHi5/Eo0mJ9zw=;
        fh=rz0whkzKUoIAfodBYJKNiVKk8Ex0Rrp+MqNzSzdvwN0=;
        b=X3oUg2gDdz23TJeQifT3uXBv+FucG40escvJ5kViiRJ4hxRRhRxiUX1L/Mfu6ibMI+
         lg8u0KgKNfrr8YK1xM3Ucute4z4IVTuT1hJXEucNs1va80SuHk6L/R/HZYYkBs4ssUQ5
         RGH8abhNyNufZfDFicEtpwGXeMwiSlyWONz/iZu5LqgxwY8r2MijxrBx9fU8Lu/jo+Ts
         x1lYLdALMUxaXEvQVmMt8J+wdTkkcZO4Ibf4CxgleqVabmjUtrji8Y0Fiv913nnjih8b
         0ka4YUcnJ4kFqtiU6MQrHqFmuZpVybqcKpK459EzjoQzbyOzobnk50HLKoR9atclWWjT
         Z48w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-378e73dff45si2988954f8f.50.2024.09.17.02.06.47
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Sep 2024 02:06:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4X7G5b1nKSz6D9Jt;
	Tue, 17 Sep 2024 17:02:59 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 35B66140B55;
	Tue, 17 Sep 2024 17:06:45 +0800 (CST)
Received: from localhost (10.48.145.97) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 17 Sep
 2024 11:06:43 +0200
Date: Tue, 17 Sep 2024 10:06:41 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Zhao Liu <zhao1.liu@intel.com>
CC: "Daniel P .\" =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>, Igor  Mammedov <imammedo@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, Marcel  Apfelbaum <marcel.apfelbaum@gmail.com>, Philippe =?ISO-8859-1?Q?Ma?=  =?ISO-8859-1?Q?thieu-Daud=E9?= <philmd@linaro.org>, Yanan Wang  <wangyanan55@huawei.com>,  Michael S.Tsirkin  <mst@redhat.com>, Paolo Bonzini  <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, Eric  Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>, Marcelo  Tosatti <mtosatti@redhat.com>, Alex =?ISO-8859-1?Q?Benn=E9e?=  <alex.bennee@linaro.org>, Peter Maydell <peter.maydell@linaro.org>, Sia Jee  Heng <jeeheng.sia@starfivetech.com>, Alireza Sanaee  <alireza.sanaee@huawei.com>, qemu-devel@nongnu.org, kvm@vger.kernel.org,  qemu-riscv@nongnu.org, qemu-arm@nongnu.org, Zhenyu Wang  <zhenyu.z.wang@intel.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>, Yongwei Ma  <yongwei.ma@intel.com>"@domain.invalid
Subject: Re: [PATCH v2 6/7] i386/cpu: Update cache topology with machine's
 configuration
Message-ID: <20240917100641.000050a8@Huawei.com>
In-Reply-To: <20240908125920.1160236-7-zhao1.liu@intel.com>
References: <20240908125920.1160236-1-zhao1.liu@intel.com>
	<20240908125920.1160236-7-zhao1.liu@intel.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.145.97]
X-ClientProxiedBy: lhrpeml500005.china.huawei.com (7.191.163.240) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: kecwr+hwDYZx

On Sun,  8 Sep 2024 20:59:19 +0800
Zhao Liu <zhao1.liu@intel.com> wrote:

> User will configure smp cache topology via -machine smp-cache.
> 
> For this case, update the x86 CPUs' cache topology with user's
> configuration in MachineState.
> 
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> Tested-by: Yongwei Ma <yongwei.ma@intel.com>
Seems simple enough.
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
