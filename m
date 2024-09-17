Received: by 2002:a17:504:1bc1:b0:1be9:327d:8ee3 with SMTP id v1csp48301njg;
        Tue, 17 Sep 2024 02:05:12 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVeERzzEXvK0TCHXRefLd7/g5K/ws8y0kVABg5CXAN9MCW9Qo5J+eM5e+gMnneP2Jw6GhYYQxl623BY6Q==@linaro.org
X-Google-Smtp-Source: AGHT+IEggGBZP9QyaGzWTWEEr5d0pLDJx626y/qo0h/nOEcwlaCzxxt3fMZH+UwEK5pj20GfThBM
X-Received: by 2002:adf:f608:0:b0:374:ca54:4065 with SMTP id ffacd0b85a97d-378c2d61fddmr9952192f8f.48.1726563912238;
        Tue, 17 Sep 2024 02:05:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726563912; cv=none;
        d=google.com; s=arc-20240605;
        b=Q8J7D1dUAOxJzHIxfiC6AiCSm0FN+Vihy4FNic/0XsH9+LQbTxgl0y/HDJUC/B1hfL
         1NUtebXt6cO9y99AQNd/2OSzJ8z0GeaDoe/HV2HV/DjFFDV54rrx3UcReg2b89zUmodC
         xVYGaTvCDg9Vf1y2GcqJhp5hDSyB59QHlXV+l6a/3eg49Gwa5R5OtgMWhy33f8GooJIb
         yK8wzAVJZZRYR0Zk5UdO3QdTewTu0gj7lQhHhVwxlkH68SYOBioIN9SAr9zTeG7FIFf2
         8v2RmqPJ8vVh50AJaPLd2QEaKFFaqOk4h5WqdcgzXylTyno0WsSz/DB6mS/XCuw2/eE0
         bFsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date;
        bh=Spd9v4XsgCzqRAlEQeYFvTCyguC6gFt3HSncWKVac+E=;
        fh=rz0whkzKUoIAfodBYJKNiVKk8Ex0Rrp+MqNzSzdvwN0=;
        b=X7ffpGTgMg5la+DrcsGkeYAUUl//i7RiO8CeXckvJgoHEAX6OOAe5JMN04inBb9/jg
         6gmwErUdOWTRePJffQcTC9EEJ5QuIgVF5pwp5q39sYPfRLPUfmOR2F8ByHI2WUfa+9So
         cqUv79lANhm2jjVGgWMAVBlKnJf0KpjCacMNeHp+gDgeu/9ODhapXqAYukh2HWYOt5go
         BB4y+/1H7Oi7MW2tFNIYjGaWD33uv50dCs2l3sIs2KVgTpNGME2XBuEwa53WPpnQ35eu
         2Fg+rhVsPVt7puVAQrrQxqbSyjI/8IHqUdWMMh7plnjbS0FfRtucL9iEGMfq6jKAfcJX
         IAsw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-378e78030c9si2992846f8f.332.2024.09.17.02.05.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Sep 2024 02:05:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4X7G3n3BfHz6D9H9;
	Tue, 17 Sep 2024 17:01:25 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 576F21400F4;
	Tue, 17 Sep 2024 17:05:11 +0800 (CST)
Received: from localhost (10.48.145.97) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 17 Sep
 2024 11:05:10 +0200
Date: Tue, 17 Sep 2024 10:05:08 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Zhao Liu <zhao1.liu@intel.com>
CC: "Daniel P .\" =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>, Igor  Mammedov <imammedo@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, Marcel  Apfelbaum <marcel.apfelbaum@gmail.com>, Philippe =?ISO-8859-1?Q?Ma?=  =?ISO-8859-1?Q?thieu-Daud=E9?= <philmd@linaro.org>, Yanan Wang  <wangyanan55@huawei.com>,  Michael S.Tsirkin  <mst@redhat.com>, Paolo Bonzini  <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, Eric  Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>, Marcelo  Tosatti <mtosatti@redhat.com>, Alex =?ISO-8859-1?Q?Benn=E9e?=  <alex.bennee@linaro.org>, Peter Maydell <peter.maydell@linaro.org>, Sia Jee  Heng <jeeheng.sia@starfivetech.com>, Alireza Sanaee  <alireza.sanaee@huawei.com>, qemu-devel@nongnu.org, kvm@vger.kernel.org,  qemu-riscv@nongnu.org, qemu-arm@nongnu.org, Zhenyu Wang  <zhenyu.z.wang@intel.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>, Yongwei Ma  <yongwei.ma@intel.com>"@domain.invalid
Subject: Re: [PATCH v2 5/7] i386/cpu: Support thread and module level cache
 topology
Message-ID: <20240917100508.00001907@Huawei.com>
In-Reply-To: <20240908125920.1160236-6-zhao1.liu@intel.com>
References: <20240908125920.1160236-1-zhao1.liu@intel.com>
	<20240908125920.1160236-6-zhao1.liu@intel.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.48.145.97]
X-ClientProxiedBy: lhrpeml500005.china.huawei.com (7.191.163.240) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: iPRPbmdaPqu0

On Sun,  8 Sep 2024 20:59:18 +0800
Zhao Liu <zhao1.liu@intel.com> wrote:

> Allow cache to be defined at the thread and module level. This
> increases flexibility for x86 users to customize their cache topology.
> 
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>
> Tested-by: Yongwei Ma <yongwei.ma@intel.com>
Will be interesting to see if anyone uses the thread level, but
no harm in supporting it.  I guess this would be a case of RDT
/ MPAM etc as I'm not sure I've seen an SMT processor with
private caches. Some old papers seems to suggest that it might
make sense for smt 8 and above.

Anyhow, patch is fine
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
