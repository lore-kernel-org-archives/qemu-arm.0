Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp3131021njb;
        Tue, 22 Oct 2024 07:37:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUQjl8nNFdjdl9LZUhmJ8fAiGfXVfceXWa2IWBSIm05gCZYJzYtpQnMExQEmYb/XPNTVjo4b1s0XxXEjg==@linaro.org
X-Google-Smtp-Source: AGHT+IFxtuoJXWxCAFWZ7+6Yr69lwHtjMUYunaxV3JKSAgjcSk+xI6Ko+V4TH3K/s9RstxD/7A/p
X-Received: by 2002:a05:600c:4f92:b0:430:699b:7d22 with SMTP id 5b1f17b1804b1-4316168807cmr127391205e9.26.1729607872309;
        Tue, 22 Oct 2024 07:37:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729607872; cv=none;
        d=google.com; s=arc-20240605;
        b=dPv9EEizTEErV/pOfNCWTGxYmh2DMfjcCEk3sCP8YR3s0dJpbv9ZUsClaZpZHifib9
         NBEEJ38SduMydZaA/gyJO/MTFfLhE4Q69TfZyAGnY92eMjf5EAnZ78NSuHthW/YfyjMz
         cKOBpvF4sV0GjueCwOpG6lkkDonoWmQz3b/MQ9X7hcm07kx/PExm1Mpn3lCWmfa/0SxP
         V4tE6PdYTMmxPI+ESCs1LpDKRgHsy8kQP3OAREETamIhay15X7e89iGrsrqnAoBjGscG
         bGHcaAdIYO+lZyLI/k2JxqkW8MokqkMwk2hIJbRV/YZI9TM+rOHCnzIYro8ZmlHAgmz5
         Z9Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date;
        bh=kVXPvF76uo3iWT2ZO/GhQ+jylMdaTKWPJ5XMG1D4V68=;
        fh=3b9il47umKWjqKrof5lgN8HMBQZG2Z+dz652rXT+PHY=;
        b=Eyc1uQEcD2nTXz4QqvI670AOCvFTpEiGdjchoRe8i6OsRd0FnkQu3/Pb6mq6ZNz1pu
         wqPbhRWg26RdBMU/2wVulVDSbSt6cO64yM06XbIqNvnFBpV1gvrFVVTQF7gnQYEdVZeb
         cHbNKmF2GZR4ltGdARiCl+OyedfoJPBu3gxgo5ohVUYst4MlrkRvnp8Wc74+wjN3LA38
         6VeYJfePWqGVxB9/Mk62uJoEdMuQPyW+CGT4/nGHhECZY3ijOqzH2MqM110y5W9D7H1X
         jik8ZhkodMsKmM3xp3HzhejR9TIKqIKC0pWPYieEPRFPt+eSba8/zj7Cvl8hDbZq92jO
         uLtw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-37ee0a4a045si2686333f8f.225.2024.10.22.07.37.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Oct 2024 07:37:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XXvqW1NMbz67M7l;
	Tue, 22 Oct 2024 22:35:51 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 47BE51404F9;
	Tue, 22 Oct 2024 22:37:51 +0800 (CST)
Received: from localhost (10.203.177.66) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Tue, 22 Oct
 2024 16:37:50 +0200
Date: Tue, 22 Oct 2024 15:37:48 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Zhao Liu <zhao1.liu@intel.com>
CC: "Daniel P .\" =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>, Igor  Mammedov <imammedo@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, Marcel  Apfelbaum <marcel.apfelbaum@gmail.com>, Philippe =?ISO-8859-1?Q?Ma?=  =?ISO-8859-1?Q?thieu-Daud=E9?= <philmd@linaro.org>, Yanan Wang  <wangyanan55@huawei.com>,  Michael S.Tsirkin  <mst@redhat.com>, Paolo Bonzini  <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, Eric  Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>, Marcelo  Tosatti <mtosatti@redhat.com>, Alex =?ISO-8859-1?Q?Benn=E9e?=  <alex.bennee@linaro.org>, Peter Maydell <peter.maydell@linaro.org>, Sia Jee  Heng <jeeheng.sia@starfivetech.com>, Alireza Sanaee  <alireza.sanaee@huawei.com>, qemu-devel@nongnu.org, kvm@vger.kernel.org,  qemu-riscv@nongnu.org, qemu-arm@nongnu.org, Zhenyu Wang  <zhenyu.z.wang@intel.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>"@domain.invalid
Subject: Re: [PATCH v4 1/9] i386/cpu: Don't enumerate the "invalid" CPU
 topology level
Message-ID: <20241022153748.000007df@Huawei.com>
In-Reply-To: <20241022135151.2052198-2-zhao1.liu@intel.com>
References: <20241022135151.2052198-1-zhao1.liu@intel.com>
	<20241022135151.2052198-2-zhao1.liu@intel.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.203.177.66]
X-ClientProxiedBy: lhrpeml100004.china.huawei.com (7.191.162.219) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: NsUcp5FT0L3w

On Tue, 22 Oct 2024 21:51:43 +0800
Zhao Liu <zhao1.liu@intel.com> wrote:

> In the follow-up change, the CPU topology enumeration will be moved to
> QAPI. And considerring "invalid" should not be exposed to QAPI as an
> unsettable item, so, as a preparation for future changes, remove
> "invalid" level from the current CPU topology enumeration structure
> and define it by a macro instead.
> 
> Due to the removal of the enumeration of "invalid", bit 0 of
> CPUX86State.avail_cpu_topo bitmap will no longer correspond to "invalid"
> level, but will start at the SMT level. Therefore, to honor this change,
> update the encoding rule for CPUID[0x1F].
> 
> Signed-off-by: Zhao Liu <zhao1.liu@intel.com>

The drop of the invalid level == 0 seems reasonable to me
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
