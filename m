Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp3133734njb;
        Tue, 22 Oct 2024 07:41:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWqN9RYOuUUV6FjJGXUggoCLskU2553nJ+NCOo22WNS3xmQ1SQlXM2bsJqFC0Jth23IdS7NIPj4ASf5dA==@linaro.org
X-Google-Smtp-Source: AGHT+IHP5LeDSgO1ABkv0gRRcxTRxF5rGuce5hoO+R2If5OLx5OUBSaIXH2IouW+VH85QuFjx3Te
X-Received: by 2002:a05:600c:c89:b0:431:5c1c:250b with SMTP id 5b1f17b1804b1-43161633321mr130997795e9.1.1729608111045;
        Tue, 22 Oct 2024 07:41:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729608111; cv=none;
        d=google.com; s=arc-20240605;
        b=hJ2f+VnywzpTSeFR030F7sywrytqov+v0Maai1NT3vig8aJ1aaBrRpslHNYByPkx4X
         odwBzfXg9cyCHO66EElwfQLAkU+SJJByUWilTya3f2WQSO9EpITfNDJ/lF61SQTiF/Uj
         zGoBZAEDGB1jJjQVIZFCekSpg+fcHq/yry9hDcnidfY0PlQVHikxCIOV0GI7Tgz1k/kA
         vaqj4NS3inCVSAuRAdAmuy9icbTMzagNHyibTEv5sO9RX52y9eIlhJmpfOol4+fc7Soo
         20tr32Au0m+YzM/7O6J0DbW/RBjA/GbNzQLgD6ssVlu74BTVGkSMoaqaTRSsKcD7Fg/b
         1cBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date;
        bh=ld1XmpmiCAMpsEA3KgkgNbMCOeJKLO1YHV0KRhTPGws=;
        fh=3b9il47umKWjqKrof5lgN8HMBQZG2Z+dz652rXT+PHY=;
        b=SRmtHpC6nrQFcZaRiW270kfAae8z8UdKapU2Iq5FWDAcfuoRdw72qemMMw7gyC62zl
         NnCUKKAh17YRMuoCg6DRP7Lq/UvoAzlQMcp56mGB6Qot6LLFJPxQDLG0ucL2Rv9WmnXe
         /aQs/7PXVIFQc9dSu4SxL9MyrVtbL8EVxrYzcSy2+l51SQ18guypFAX6WT+CGCdJPZo2
         5OSvNeIoylbAkoMhQg7Ttv+V57ImWjUdPPN4Kl+9B0QPKzhM4GOzwr+svbMNEOhexBq1
         xEAx01ahv/a4c5+i61LjCe54+UUIKxnpCAvAdPoJXRjpDW4KACJXaaRCVxLWgP2pIGSa
         9ugg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-37ee0ba77f3si2656483f8f.733.2024.10.22.07.41.50
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Oct 2024 07:41:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XXvs31GkDz6L7DX;
	Tue, 22 Oct 2024 22:37:11 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 18FFC1403A1;
	Tue, 22 Oct 2024 22:41:50 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 22 Oct
 2024 16:41:49 +0200
Date: Tue, 22 Oct 2024 15:41:47 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Zhao Liu <zhao1.liu@intel.com>
CC: "Daniel P .\" =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>, Igor  Mammedov <imammedo@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, Marcel  Apfelbaum <marcel.apfelbaum@gmail.com>, Philippe =?ISO-8859-1?Q?Ma?=  =?ISO-8859-1?Q?thieu-Daud=E9?= <philmd@linaro.org>, Yanan Wang  <wangyanan55@huawei.com>,  Michael S.Tsirkin  <mst@redhat.com>, Paolo Bonzini  <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, Eric  Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>, Marcelo  Tosatti <mtosatti@redhat.com>, Alex =?ISO-8859-1?Q?Benn=E9e?=  <alex.bennee@linaro.org>, Peter Maydell <peter.maydell@linaro.org>, Sia Jee  Heng <jeeheng.sia@starfivetech.com>, Alireza Sanaee  <alireza.sanaee@huawei.com>, qemu-devel@nongnu.org, kvm@vger.kernel.org,  qemu-riscv@nongnu.org, qemu-arm@nongnu.org, Zhenyu Wang  <zhenyu.z.wang@intel.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>"@domain.invalid
Subject: Re: [PATCH v4 5/9] hw/core: Add a helper to check the cache
 topology level
Message-ID: <20241022154147.00000fa1@Huawei.com>
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
X-TUID: ngjT20pURYa7

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


