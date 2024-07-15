Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp2188454nji;
        Mon, 15 Jul 2024 04:35:47 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXjdrlK2SOLkSB1y5Ei11fqyH97kNUhJ3/CniEYR1idDnKJHc5B/kqR9eGOGNU7sCgQB4mhipfcbOArnnQdK4eh/sTZO1oi
X-Google-Smtp-Source: AGHT+IGiUHCL7Kj01xUCD5VAv0BOZpIMiQ831a7Lyikmr/v4awCGmv1AxRLvXbaOL/zfeSaYiB8n
X-Received: by 2002:a5d:5f48:0:b0:35f:1161:e1a3 with SMTP id ffacd0b85a97d-367cea46c6fmr15958057f8f.5.1721043347055;
        Mon, 15 Jul 2024 04:35:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721043347; cv=none;
        d=google.com; s=arc-20160816;
        b=DjuuWHugicjWqfzTawFiYevbKgJ2QDv2VKzvdpoW7JN4itdjiDhNF4RvTxvmyWaNsq
         Mn1ZA6OK97tMm2gGR0ZTe3m2wnysoJqFYmLpPEAfqVU7p28F3KWjZWzhVlrO6DaxR/do
         lwIOG8JaFsArFLbiqKtSlSc+FZ40NKE/rp3XSS9oLQmal+oNbqEJM22RwSgyL0KWjvc5
         cj1sn78NrqBNLbhVbbBqDPBNVSX4tLV7PWqKNoEIj2McCuFEQWmQH6m3P37F4ut8BEQS
         ikqtsHufjPDj7a9g8CdyJnfieNkovMrZsDbDt889dp/JkuIcFfij1+vk8AhQY+GAkfLH
         L5zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=GOWvPIUT0ICcroHPKz2bXDpoeclip753ENY9RNN7GtU=;
        fh=e/p4l6TUMH7YGXJ0gBNhivDsdiW7c8MSCNMXlZjno3Q=;
        b=yLHyJmhl2PbDw8UVeYEdOdbVOma046AmWGYibLuz/5zc+fMbDEvzafQeNr80kfwjdM
         N8yrk+eSHjOD8cNJerf/0ObV1hRU1U+kLNSdX5M3P7aIrfTf4XwbE6wnHpXhwCmMj78w
         k7lhEWJcdy7ItOIPrvoKU7LnnLtDsliE4xHGcY7vl7nHqdW+XaRQ7NKr4T6aBjcGaVYr
         zEARrGmb6lKkjhn7eCD+4uen3D6s2ihuwHaOOjznXj1CrxeM7v/y0dFbvxIKpsL9wlOM
         xmkVIJvb/eGRA5j4rC+cGnSTvzINWi70UWs9oLgLywqg7BTvF8Q8TSEMvoqgCZ3L1mLp
         9jug==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3680db01cb8si2896570f8f.657.2024.07.15.04.35.46
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 Jul 2024 04:35:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WN0V131K7z6JBb2;
	Mon, 15 Jul 2024 19:34:33 +0800 (CST)
Received: from lhrpeml500002.china.huawei.com (unknown [7.191.160.78])
	by mail.maildlp.com (Postfix) with ESMTPS id F12FE140B39;
	Mon, 15 Jul 2024 19:35:45 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml500002.china.huawei.com (7.191.160.78) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 15 Jul 2024 12:35:45 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.039;
 Mon, 15 Jul 2024 12:35:45 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org"
	<qemu-arm@nongnu.org>, "maz@kernel.org" <maz@kernel.org>,
	"jean-philippe@linaro.org" <jean-philippe@linaro.org>, Jonathan Cameron
	<jonathan.cameron@huawei.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>, "imammedo@redhat.com" <imammedo@redhat.com>,
	"andrew.jones@linux.dev" <andrew.jones@linux.dev>, "david@redhat.com"
	<david@redhat.com>, "philmd@linaro.org" <philmd@linaro.org>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>, "oliver.upton@linux.dev"
	<oliver.upton@linux.dev>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
	"will@kernel.org" <will@kernel.org>, "gshan@redhat.com" <gshan@redhat.com>,
	"rafael@kernel.org" <rafael@kernel.org>, "alex.bennee@linaro.org"
	<alex.bennee@linaro.org>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"darren@os.amperecomputing.com" <darren@os.amperecomputing.com>,
	"ilkka@os.amperecomputing.com" <ilkka@os.amperecomputing.com>,
	"vishnu@os.amperecomputing.com" <vishnu@os.amperecomputing.com>,
	"karl.heubaum@oracle.com" <karl.heubaum@oracle.com>, "miguel.luis@oracle.com"
	<miguel.luis@oracle.com>, "salil.mehta@opnsrc.net" <salil.mehta@opnsrc.net>,
	zhukeqian <zhukeqian1@huawei.com>, "wangxiongfeng (C)"
	<wangxiongfeng2@huawei.com>, "wangyanan (Y)" <wangyanan55@huawei.com>,
	"jiakernel2@gmail.com" <jiakernel2@gmail.com>, "maobibo@loongson.cn"
	<maobibo@loongson.cn>, "lixianglai@loongson.cn" <lixianglai@loongson.cn>,
	"npiggin@gmail.com" <npiggin@gmail.com>, "harshpb@linux.ibm.com"
	<harshpb@linux.ibm.com>, Linuxarm <linuxarm@huawei.com>
Subject: RE: [PATCH V15 0/7] Add architecture agnostic code to support vCPU
 Hotplug
Thread-Topic: [PATCH V15 0/7] Add architecture agnostic code to support vCPU
 Hotplug
Thread-Index: AQHa1VIYzbBqk8ub30G0ZXbYzNwFGLH3lIWAgAAR4CD///PKgIAAEQsA
Date: Mon, 15 Jul 2024 11:35:45 +0000
Message-ID: <724eea7ed1134e019f1f9515d45cb75e@huawei.com>
References: <20240713182516.1457-1-salil.mehta@huawei.com>
	<20240715071232-mutt-send-email-mst@kernel.org>
	<a43a5a1636c84896be5930570c538031@huawei.com>
 <20240715073301-mutt-send-email-mst@kernel.org>
In-Reply-To: <20240715073301-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.126.170.92]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-TUID: 7RmqMLIVQ53x

>  From: Michael S. Tsirkin <mst@redhat.com>
>  Sent: Monday, July 15, 2024 12:33 PM
>  To: Salil Mehta <salil.mehta@huawei.com>
> =20
>  On Mon, Jul 15, 2024 at 11:27:57AM +0000, Salil Mehta wrote:
>  > Hi Michael,
>  >
>  > >  From: Michael S. Tsirkin <mst@redhat.com>
>  > >  Sent: Monday, July 15, 2024 12:13 PM
>  > >  To: Salil Mehta <salil.mehta@huawei.com>
>  > >
>  > >  On Sat, Jul 13, 2024 at 07:25:09PM +0100, Salil Mehta wrote:
>  > >  > [Note: References are present at the last after the revision
>  > > history]
>  > >
>  > >  Igor any comments before I merge this?
>  >
>  > Hi Michael,
>  >
>  > Assuming there are no last-minute surprises and If you decide to merge
>  > this series, could I kindly request that you collect all the Tags
>  > (XXX-Bys) including the Igor's pending Reviewed/Acked-By Tag for the
>  > entire series, so that I won't have to churn out another version (V16)=
?
>  >
>  > Many thanks!
>  >
>  > Best regards
>  > Salil
> =20
> =20
>  Yes, there's no need to resend just to add acks, I collect them automati=
cally.


Brilliant. Many thanks!


Best regards
Salil.

>  > >  --
>  > >  MST
>  > >
> =20
