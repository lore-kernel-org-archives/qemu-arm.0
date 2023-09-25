Received: by 2002:a17:907:d504:b0:9b2:89ee:1eb8 with SMTP id wb4csp641461ejc;
        Mon, 25 Sep 2023 13:21:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8leTkS7+OJv0k0I4xaYCdagv+6FsYWkd4Czb07gPXUF5QAllkzWVYzBC4Q0rgdnOBqm3J
X-Received: by 2002:a05:600c:1d1b:b0:405:7b92:4558 with SMTP id l27-20020a05600c1d1b00b004057b924558mr4469291wms.38.1695673305906;
        Mon, 25 Sep 2023 13:21:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1695673305; cv=none;
        d=google.com; s=arc-20160816;
        b=QKUVY5IGAdDi+DIw3tEsThMc/xCV31ySZ3OmFZqtHjgwDhqPA+yRajdqj6MwiaWFs1
         K1XyYhXgMdE5M6DNPbYchTK7KFN9foVr/OG9z+4/m8eBIPOJwh0RcsGQ06BJQRHeTEyQ
         7hnqFs6DP06kicRB9+G/KEGLfDny2rlMdaXUBQfAW/D9iRgr6qJMI8zsytXaAk2LZ3qk
         ufc6hqaDb3hjzMQWr7ZW5vxOV3Fz9hut0rYaP0J/rOtHw03Ly5TIvP31d3acdCqLdZSE
         8D9lUYyBjJ15IT7iK1QTuTe/SpxTIkyvnrZMCqGb3/rZfgjcxJyPnDrCfKNDAGYDm4RL
         nUsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=R9lp6Fd2eeobEbnlfp7ic+tQsgF3i3TUxqw9HU3jofg=;
        fh=M91zLNxihfxnEmPnnbMEQ6nsyb31uylxdPRXIYzNZIA=;
        b=r729rXa2IuBGgrx5YwIrA/mvYmMQ3+VFq8n4zyYBKAwZxcuFn4gxX09ipzkSocb8Wc
         9F4gcBzZhrd7qAHAjN4vxxYILVu46xmAdfU9rYTLXqENu7a6Vm41wIH9S+kArtdcLjar
         93k5eI+ZrEdLl4dbNR+rnNgadrC8TPohuSSYpGtNuDctfsUyY8rTA7sOHEZHK+g+NOGJ
         H5/Dpj3y5qyfrkQQzb+98YD+4G9Nja5yJsSB9j7MoYK/FnCbHZ7yKNhneHqn8KgXjN2z
         A9bm4tKSZPKCKozJfk23o3/6vQ0ARscWE0Ickr+ge2QjzMGaB3h+9NH2GTtoAZ0cOnst
         KUeA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id cs17-20020a056000089100b003232ef52529si890763wrb.461.2023.09.25.13.21.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 25 Sep 2023 13:21:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml500001.china.huawei.com (unknown [172.18.147.207])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4RvZ4c3xQpz6KBS7;
	Tue, 26 Sep 2023 04:20:32 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml500001.china.huawei.com (7.191.163.213) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Mon, 25 Sep 2023 21:21:43 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.031;
 Mon, 25 Sep 2023 21:21:43 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: Russell King <linux@armlinux.org.uk>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org"
	<qemu-arm@nongnu.org>, "maz@kernel.org" <maz@kernel.org>,
	"james.morse@arm.com" <james.morse@arm.com>, "jean-philippe@linaro.org"
	<jean-philippe@linaro.org>, Jonathan Cameron <jonathan.cameron@huawei.com>,
	"lorenzo.pieralisi@linaro.com" <lorenzo.pieralisi@linaro.com>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>, "imammedo@redhat.com" <imammedo@redhat.com>,
	"andrew.jones@linux.dev" <andrew.jones@linux.dev>, "david@redhat.com"
	<david@redhat.com>, "philmd@linaro.org" <philmd@linaro.org>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>, "will@kernel.org"
	<will@kernel.org>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
	"ardb@kernel.org" <ardb@kernel.org>, "justin.he@arm.com" <justin.he@arm.com>,
	"oliver.upton@linux.dev" <oliver.upton@linux.dev>, "pbonzini@redhat.com"
	<pbonzini@redhat.com>, "mst@redhat.com" <mst@redhat.com>, "gshan@redhat.com"
	<gshan@redhat.com>, "rafael@kernel.org" <rafael@kernel.org>,
	"borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>,
	"alex.bennee@linaro.org" <alex.bennee@linaro.org>,
	"darren@os.amperecomputing.com" <darren@os.amperecomputing.com>,
	"ilkka@os.amperecomputing.com" <ilkka@os.amperecomputing.com>,
	"vishnu@os.amperecomputing.com" <vishnu@os.amperecomputing.com>,
	"karl.heubaum@oracle.com" <karl.heubaum@oracle.com>, "miguel.luis@oracle.com"
	<miguel.luis@oracle.com>, "sudeep.holla@arm.com" <sudeep.holla@arm.com>,
	"salil.mehta@opnsrc.net" <salil.mehta@opnsrc.net>, zhukeqian
	<zhukeqian1@huawei.com>, "wangxiongfeng (C)" <wangxiongfeng2@huawei.com>,
	"wangyanan (Y)" <wangyanan55@huawei.com>, "jiakernel2@gmail.com"
	<jiakernel2@gmail.com>, "maobibo@loongson.cn" <maobibo@loongson.cn>,
	"lixianglai@loongson.cn" <lixianglai@loongson.cn>
Subject: RE: [PATCH RFC V2 00/37] Support of Virtual CPU Hotplug for ARMv8
 Arch
Thread-Topic: [PATCH RFC V2 00/37] Support of Virtual CPU Hotplug for ARMv8
 Arch
Thread-Index: AQHZ7+i7tN7TN6a6DkKo79sQc15MlrAr9QQQ///zwoCAABEDYA==
Date: Mon, 25 Sep 2023 20:21:43 +0000
Message-ID: <a4f5b9370c2c45c7a09fe55f4a7b1a62@huawei.com>
References: <20230925194333.18244-1-salil.mehta@huawei.com>
	<1ba2e69bf0a94c1498ab5863b365559b@huawei.com>
 <ZRHpyxCe8ybsxKck@shell.armlinux.org.uk>
In-Reply-To: <ZRHpyxCe8ybsxKck@shell.armlinux.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.48.153.112]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-TUID: s9B8YfaXfoYI

Hi Russell,

> From: Russell King <linux@armlinux.org.uk>
> Sent: Monday, September 25, 2023 9:13 PM
> To: Salil Mehta <salil.mehta@huawei.com>
> Cc: qemu-devel@nongnu.org; qemu-arm@nongnu.org; maz@kernel.org;
> james.morse@arm.com; jean-philippe@linaro.org; Jonathan Cameron
> <jonathan.cameron@huawei.com>; lorenzo.pieralisi@linaro.com;
> lpieralisi@kernel.org; peter.maydell@linaro.org;
> richard.henderson@linaro.org; imammedo@redhat.com; andrew.jones@linux.dev=
;
> david@redhat.com; philmd@linaro.org; eric.auger@redhat.com;
> will@kernel.org; catalin.marinas@arm.com; ardb@kernel.org;
> justin.he@arm.com; oliver.upton@linux.dev; pbonzini@redhat.com;
> mst@redhat.com; gshan@redhat.com; rafael@kernel.org;
> borntraeger@linux.ibm.com; alex.bennee@linaro.org;
> darren@os.amperecomputing.com; ilkka@os.amperecomputing.com;
> vishnu@os.amperecomputing.com; karl.heubaum@oracle.com;
> miguel.luis@oracle.com; sudeep.holla@arm.com; salil.mehta@opnsrc.net;
> zhukeqian <zhukeqian1@huawei.com>; wangxiongfeng (C)
> <wangxiongfeng2@huawei.com>; wangyanan (Y) <wangyanan55@huawei.com>;
> jiakernel2@gmail.com; maobibo@loongson.cn; lixianglai@loongson.cn
> Subject: Re: [PATCH RFC V2 00/37] Support of Virtual CPU Hotplug for ARMv=
8
> Arch
>=20
> On Mon, Sep 25, 2023 at 08:03:56PM +0000, Salil Mehta wrote:
> > Looks like some problem with Huawei's mail server server. No patches
> > except the cover letter are reaching the qemu-devel mailing-list.
>=20
> I haven't seen any of the actual patches - just the cover letters.
> Was that intentional?

No. all the patches are either getting held either by the server or
Some other problem. This has happened for both the instances of the
patch-set I had pushed to the mailing list within 2 hours.=20

I am not sure how to sort it out without the help of IT. China is
asleep now.

Any suggestions welcome to debug this. Or Should I wait till tomorrow?

Many thanks
Salil.
