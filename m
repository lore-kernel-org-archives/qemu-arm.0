Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp2184603nji;
        Mon, 15 Jul 2024 04:28:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVas/KhYvmwxV4LwNJi3nmJzA5OH1YLOYJaFUNjSEQTz1c6A23USdzXikgLXjuyfousxbuEGFHlMm6FaG+RliSITLVkS+pI
X-Google-Smtp-Source: AGHT+IFe8q1v2twbcuftQtrbLIgtMsR6WEHmuvGKhSCEYzXq+Txx3Ku/L8DqCrRy0fuqMoMByUh4
X-Received: by 2002:a17:903:184:b0:1fb:8e98:4468 with SMTP id d9443c01a7336-1fbb6d5fed5mr190094525ad.50.1721042884572;
        Mon, 15 Jul 2024 04:28:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721042884; cv=none;
        d=google.com; s=arc-20160816;
        b=JsBWmVKKjAUM0dP/zHwuAM09IZF2W2HxBWk3qqrj/X9vb8+TXk5MYg8iGseJw6WkaT
         arhj0PEb8FOYYcP7PgYrFNSVAo66gDBAP9ov5ns12K3+PwRJwMRyftSefxImvJ0mH1wF
         QbvtitEWkK7vL4hTF+sbFXP74tDg+Oj9hM/y2+PRYywFH7wtXq0eLwPirJloUdfhLhXl
         dCGZxLF4UMrL08UQEf86ikPzpQWiG0bJtRegOH4wPAccA1RkYpSgAjIayKzxf43RR9SR
         hsYMHodpNmHCv+/7ZdislMd1Tf7K/+lK4j2mTym8yV0o7o7rb2g0aYc+DAlRgSIt5iUL
         rsDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=wqz4rzxVKevKQpHccRfhZUiL+8Z7o2NgYKL0D6D1kro=;
        fh=e/p4l6TUMH7YGXJ0gBNhivDsdiW7c8MSCNMXlZjno3Q=;
        b=hUsIGhb/KBw0LO5/AQMuyAlUe50Ot80mvg+0TrNbn8SlnsC/JgemlfbRtAcMKlKLOb
         NjlFLIFZ9iax7NZrBw5oAz1kdvs2jwrBQpo+WaIMW8Efhrf1w80e1mbaz4bkcvvpD5PU
         Yd7/rflXl7zvrZ6abqbG6GTi9mJDv1HaXntWkI4TpcxVV6yDLebryY2sK46CYtBmdd2K
         DSfMI19ysQ7d3MkHRqx4IsayFGZ6nNIzmMsBKNWh4Ag6YOi1cbB8fstPSaOZyJylDkxu
         PoFi/J5dJFAJPyzeI3h1f5U7EnBCdzzdPjdazAg541/XbGUp4VE3ZcjgoY0NSO1wxApF
         4+xQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id d9443c01a7336-1fc0bc90535si45407065ad.222.2024.07.15.04.28.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 Jul 2024 04:28:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WN0K15s3dz6JBZm;
	Mon, 15 Jul 2024 19:26:45 +0800 (CST)
Received: from lhrpeml500002.china.huawei.com (unknown [7.191.160.78])
	by mail.maildlp.com (Postfix) with ESMTPS id 600011400E7;
	Mon, 15 Jul 2024 19:27:58 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml500002.china.huawei.com (7.191.160.78) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 15 Jul 2024 12:27:58 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.039;
 Mon, 15 Jul 2024 12:27:58 +0100
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
Thread-Index: AQHa1VIYzbBqk8ub30G0ZXbYzNwFGLH3lIWAgAAR4CA=
Date: Mon, 15 Jul 2024 11:27:57 +0000
Message-ID: <a43a5a1636c84896be5930570c538031@huawei.com>
References: <20240713182516.1457-1-salil.mehta@huawei.com>
 <20240715071232-mutt-send-email-mst@kernel.org>
In-Reply-To: <20240715071232-mutt-send-email-mst@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.126.170.92]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-TUID: yzNURVd5ZSg5

Hi Michael,

>  From: Michael S. Tsirkin <mst@redhat.com>
>  Sent: Monday, July 15, 2024 12:13 PM
>  To: Salil Mehta <salil.mehta@huawei.com>
> =20
>  On Sat, Jul 13, 2024 at 07:25:09PM +0100, Salil Mehta wrote:
>  > [Note: References are present at the last after the revision history]
> =20
>  Igor any comments before I merge this?

Hi Michael,

Assuming there are no last-minute surprises and If you decide to merge this
series, could I kindly request that you collect all the Tags (XXX-Bys) incl=
uding
the Igor's pending Reviewed/Acked-By Tag for the entire series, so that I w=
on't
have to churn out another version (V16)?

Many thanks!

Best regards
Salil


> =20
>  --
>  MST
> =20
