Received: by 2002:a17:907:8744:b0:9bd:85f7:2662 with SMTP id qo4csp858124ejc;
        Thu, 12 Oct 2023 07:38:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/tyUAHW+zyNkLKVU5NiHfW/6NZUQnwDFmMOBY31iQycaocurlnQn1Ez7OTvxdhe+uCBoY
X-Received: by 2002:a1c:f709:0:b0:405:3b1f:9691 with SMTP id v9-20020a1cf709000000b004053b1f9691mr22362055wmh.11.1697121525215;
        Thu, 12 Oct 2023 07:38:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1697121525; cv=none;
        d=google.com; s=arc-20160816;
        b=xNefiXyZabAyx57t3B97vrdioXmC/ivjBAX2DyUQm9bdoL3sCNM+HI/iS/jE5TdqDc
         FE/+/RN6XnP5NlbSPu6uSYe1UTcgfJCbR9LFS03kez0VsBjlaUQNkXrfD9isWxDRBzo1
         c9dxEzNNAhPQBVlnsLVo/dE2vOlVy1Me50/eX8Mfv+Kh5oRX6Jl5LaxisKof75I74H7i
         6M2+CzFYys0dmmI+fJEfQVBavclR8WwlAUiOoSY0Kg42ShwXD2IizICIM4hOGMOvFnfb
         isOjcEpASANFEWp9H5tQcDMt9tQgA1pM1toGuvWrJsEZqB8MjKYmznvdx+VXehJcpbpJ
         Fp7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=5MAhtmjDne9k+LppRZgCXRwIfhfvAQfztDYm5NPag8M=;
        fh=7ClhMSyX8VLsf+4fXGm2a1j5PzlUyMO+epTSYFeQdDs=;
        b=WHXxnfWdHsI8FLEAqTZOtBk3M3u6ofH2KQqvwZ+NGkmOZmEw4jAwqeacvFwfEoKsqs
         z6vyu72IyGXHoEpcGWiwFZNiro6wO/pJ9u3SesEuWTdGzK+6r2pTp5HXq/NKvzm4sPM/
         rlbnvtpC76j1ERhPE2j2mCK8teffEwhORFVhXvCFP0QD3uQTFRSOiDC50961l6t7rCf6
         PZaEec2FP9kXi4Q5QaNV4cSTaTtLvF23qbvXPpZKpLpQKHe7vthCMdlkOyDW4TG0qOd7
         8TaotdLPpoJL2PgjOP12b8SzIuH0rA4iNKf9dPbFn+Fb+8+seY8adnHHPMyyeILnbgvJ
         NrEA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id m22-20020a05600c4f5600b003fef8a55cb2si7478wmq.24.2023.10.12.07.38.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 Oct 2023 07:38:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from lhrpeml100005.china.huawei.com (unknown [172.18.147.200])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4S5sgx2QLVz6K98Z;
	Thu, 12 Oct 2023 22:38:21 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml100005.china.huawei.com (7.191.160.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Thu, 12 Oct 2023 15:38:43 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.031;
 Thu, 12 Oct 2023 15:38:43 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: Jonathan Cameron <jonathan.cameron@huawei.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org"
	<qemu-arm@nongnu.org>, "maz@kernel.org" <maz@kernel.org>,
	"jean-philippe@linaro.org" <jean-philippe@linaro.org>,
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>, "imammedo@redhat.com" <imammedo@redhat.com>,
	"andrew.jones@linux.dev" <andrew.jones@linux.dev>, "david@redhat.com"
	<david@redhat.com>, "philmd@linaro.org" <philmd@linaro.org>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>, "oliver.upton@linux.dev"
	<oliver.upton@linux.dev>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
	"mst@redhat.com" <mst@redhat.com>, "will@kernel.org" <will@kernel.org>,
	"gshan@redhat.com" <gshan@redhat.com>, "rafael@kernel.org"
	<rafael@kernel.org>, "alex.bennee@linaro.org" <alex.bennee@linaro.org>,
	"linux@armlinux.org.uk" <linux@armlinux.org.uk>,
	"darren@os.amperecomputing.com" <darren@os.amperecomputing.com>,
	"ilkka@os.amperecomputing.com" <ilkka@os.amperecomputing.com>,
	"vishnu@os.amperecomputing.com" <vishnu@os.amperecomputing.com>,
	"karl.heubaum@oracle.com" <karl.heubaum@oracle.com>, "miguel.luis@oracle.com"
	<miguel.luis@oracle.com>, "salil.mehta@opnsrc.net" <salil.mehta@opnsrc.net>,
	zhukeqian <zhukeqian1@huawei.com>, "wangxiongfeng (C)"
	<wangxiongfeng2@huawei.com>, "wangyanan (Y)" <wangyanan55@huawei.com>,
	"jiakernel2@gmail.com" <jiakernel2@gmail.com>, "maobibo@loongson.cn"
	<maobibo@loongson.cn>, "lixianglai@loongson.cn" <lixianglai@loongson.cn>,
	Linuxarm <linuxarm@huawei.com>
Subject: RE: [PATCH V5 1/9] accel/kvm: Extract common KVM vCPU
 {creation,parking} code
Thread-Topic: [PATCH V5 1/9] accel/kvm: Extract common KVM vCPU
 {creation,parking} code
Thread-Index: AQHZ/Htqi0mtwUJ3tUeBtR3e1ZMtXLBGKTmAgAARMcA=
Date: Thu, 12 Oct 2023 14:38:43 +0000
Message-ID: <ff06c2f8c85948b3be5a9855086dd5cd@huawei.com>
References: <20231011194355.15628-1-salil.mehta@huawei.com>
	<20231011194355.15628-2-salil.mehta@huawei.com>
 <20231012153625.00005025@Huawei.com>
In-Reply-To: <20231012153625.00005025@Huawei.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.195.35.158]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-TUID: u19kspJfybca

Hi Jonathan,

> From: Jonathan Cameron <jonathan.cameron@huawei.com>
> Sent: Thursday, October 12, 2023 3:36 PM
> To: Salil Mehta <salil.mehta@huawei.com>
> Cc: qemu-devel@nongnu.org; qemu-arm@nongnu.org; maz@kernel.org; jean-
> philippe@linaro.org; lpieralisi@kernel.org; peter.maydell@linaro.org;
> richard.henderson@linaro.org; imammedo@redhat.com; andrew.jones@linux.dev=
;
> david@redhat.com; philmd@linaro.org; eric.auger@redhat.com;
> oliver.upton@linux.dev; pbonzini@redhat.com; mst@redhat.com;
> will@kernel.org; gshan@redhat.com; rafael@kernel.org;
> alex.bennee@linaro.org; linux@armlinux.org.uk;
> darren@os.amperecomputing.com; ilkka@os.amperecomputing.com;
> vishnu@os.amperecomputing.com; karl.heubaum@oracle.com;
> miguel.luis@oracle.com; salil.mehta@opnsrc.net; zhukeqian
> <zhukeqian1@huawei.com>; wangxiongfeng (C) <wangxiongfeng2@huawei.com>;
> wangyanan (Y) <wangyanan55@huawei.com>; jiakernel2@gmail.com;
> maobibo@loongson.cn; lixianglai@loongson.cn; Linuxarm <linuxarm@huawei.co=
m>
> Subject: Re: [PATCH V5 1/9] accel/kvm: Extract common KVM vCPU
> {creation,parking} code
>=20
> On Wed, 11 Oct 2023 20:43:47 +0100
> Salil Mehta <salil.mehta@huawei.com> wrote:
>=20
> > KVM vCPU creation is done once during the initialization of the VM when
> Qemu
> > thread is spawned. This is common to all the architectures.
> >
> > Hot-unplug of vCPU results in destruction of the vCPU object in QOM but
> the
> > corresponding KVM vCPU object in the Host KVM is not destroyed and its
> > representative KVM vCPU object/context in Qemu is parked.
> >
> > Refactor common logic so that some APIs could be reused by vCPU Hotplug=
 code.
>=20
> If you are respinning I'd also call out that you added some trace points.

Ok. Will do.

Thanks

> > Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> > Reviewed-by: Gavin Shan <gshan@redhat.com>
> > Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
> Otherwise LGTM as it's a straight forward refactor.
>=20
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
>=20
