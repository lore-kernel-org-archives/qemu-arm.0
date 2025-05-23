Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp2539582njc;
        Fri, 23 May 2025 06:23:07 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVxNZQWrlvvNiqQrnF2KnBvwkQy8JrQ9XcDfq/IFvAi1Agd2H1H1nKTtRRCFdj4aajwKNlzKlaSemdYvQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFVDWKZFblOcICo43wVX5y/WJM7evSXGFFCs/4c0nSouYwP26gR7kr77lAFojm2SWHj40N6
X-Received: by 2002:a5d:588b:0:b0:3a1:f5c7:ceef with SMTP id ffacd0b85a97d-3a4c150077amr3720009f8f.12.1748006587268;
        Fri, 23 May 2025 06:23:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748006587; cv=none;
        d=google.com; s=arc-20240605;
        b=cm73LbcHaaY+XJPSLTDkHD4yrOefwUL1SX9zjiP/RgdHjqIECo+2f6TMXsbHL4tVUj
         Wo2IMa9C+sp+NkY8O1+xIB4AhFStFKfbaxiBIFnNzW/TKChz/oVYvq0j9anAwJAQM67z
         mV3Z9uvYf6zdj/3sk7tj7nTUtu4B7OGk8yk5m/PNdfPbh2IFwtPBAnfQGMYIA265TAsm
         P2GSscS32nxwIxT2hgEP/kMqB/Xluk8xkJubc0wCoBcPEgPzof5hYt/VNAuMV55CoDyp
         ILVluMstYjAvgQAiUaip6q/ApnT4z/W2Y0nIebhNdO9Wqg7bddj3KClQ9Ky6oHiYHG6v
         4iAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=i8C/Qtv6T/rSgXyJMiuG+oIIx9+mS/VG+rL0G0zrYUY=;
        fh=rx6U8xDRIQCLCYSEaMUM6JxzflCE8tIJYYv5Xp9MH70=;
        b=RhVVbhAHoUAzYAS33rWjVWXPNKqaY3CllJOAWq7reMHItB7RxEA7oX3gOJQa72QEVZ
         tHJ+iasXCYONG/o+/+q1+/d5NA6QJ+fOiiN9DLmAb3Pj350Za+MCT00b12zptiKYCbeE
         n/8X+abUu7D0Iz/UjDe4W/HSwpq2SEMH4IqCSEll6pEX4dz0hZMYiO3oM/BaGpQyyZid
         +k6GjwMCMFas3isX6/Po1/iI7quBFtLwYiA/cvi7dBNWDat6n0f9Llp7ocq3lQ4RczKS
         2XLwBWlDQ667/Arhlyu4/friAg4w2JJnH8uSbLtsRCpPD/RGUwssR1777ujt+wFWkLjf
         2zlg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of shameerali.kolothum.thodi@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=shameerali.kolothum.thodi@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <shameerali.kolothum.thodi@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a35ca4c11fsi13362098f8f.25.2025.05.23.06.23.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 May 2025 06:23:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of shameerali.kolothum.thodi@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of shameerali.kolothum.thodi@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=shameerali.kolothum.thodi@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4b3m3S4PkDz6L5Yb;
	Fri, 23 May 2025 21:19:48 +0800 (CST)
Received: from frapeml100008.china.huawei.com (unknown [7.182.85.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 6907214020A;
	Fri, 23 May 2025 21:23:06 +0800 (CST)
Received: from frapeml500008.china.huawei.com (7.182.85.71) by
 frapeml100008.china.huawei.com (7.182.85.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 23 May 2025 15:23:06 +0200
Received: from frapeml500008.china.huawei.com ([7.182.85.71]) by
 frapeml500008.china.huawei.com ([7.182.85.71]) with mapi id 15.01.2507.039;
 Fri, 23 May 2025 15:23:06 +0200
From: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
To: Cornelia Huck <cohuck@redhat.com>, "eric.auger.pro@gmail.com"
	<eric.auger.pro@gmail.com>, "eric.auger@redhat.com" <eric.auger@redhat.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org"
	<qemu-arm@nongnu.org>, "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"richard.henderson@linaro.org" <richard.henderson@linaro.org>,
	"alex.bennee@linaro.org" <alex.bennee@linaro.org>, "maz@kernel.org"
	<maz@kernel.org>, "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	"sebott@redhat.com" <sebott@redhat.com>, "armbru@redhat.com"
	<armbru@redhat.com>, "berrange@redhat.com" <berrange@redhat.com>,
	"abologna@redhat.com" <abologna@redhat.com>, "jdenemar@redhat.com"
	<jdenemar@redhat.com>
CC: "agraf@csgraf.de" <agraf@csgraf.de>, "shahuang@redhat.com"
	<shahuang@redhat.com>, "mark.rutland@arm.com" <mark.rutland@arm.com>,
	"philmd@linaro.org" <philmd@linaro.org>, "pbonzini@redhat.com"
	<pbonzini@redhat.com>
Subject: RE: [PATCH v3 00/10] kvm/arm: Introduce a customizable aarch64 KVM
 host model
Thread-Topic: [PATCH v3 00/10] kvm/arm: Introduce a customizable aarch64 KVM
 host model
Thread-Index: AQHbrVvRKlWe4qTsaku+jGkyYZoxlrPgb1/Q
Date: Fri, 23 May 2025 13:23:06 +0000
Message-ID: <de7db6bc22ad4f0a8ac1fac718c810a1@huawei.com>
References: <20250414163849.321857-1-cohuck@redhat.com>
In-Reply-To: <20250414163849.321857-1-cohuck@redhat.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.203.177.241]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-TUID: b/92Yh1tUq27

Hi,

> -----Original Message-----
> From: Cornelia Huck <cohuck@redhat.com>
> Sent: Monday, April 14, 2025 5:39 PM
> To: eric.auger.pro@gmail.com; eric.auger@redhat.com; qemu-
> devel@nongnu.org; qemu-arm@nongnu.org; kvmarm@lists.linux.dev;
> peter.maydell@linaro.org; richard.henderson@linaro.org;
> alex.bennee@linaro.org; maz@kernel.org; oliver.upton@linux.dev;
> sebott@redhat.com; Shameerali Kolothum Thodi
> <shameerali.kolothum.thodi@huawei.com>; armbru@redhat.com;
> berrange@redhat.com; abologna@redhat.com; jdenemar@redhat.com
> Cc: agraf@csgraf.de; shahuang@redhat.com; mark.rutland@arm.com;
> philmd@linaro.org; pbonzini@redhat.com; Cornelia Huck
> <cohuck@redhat.com>
> Subject: [PATCH v3 00/10] kvm/arm: Introduce a customizable aarch64 KVM
> host model

[..]

)
>=20
> Code also available at
> https://gitlab.com/cohuck/qemu/-/tree/arm-cpu-model-
> rfcv3?ref_type=3Dheads

I had a spin with the above branch, but Qemu boot fails,

ERROR:../target/arm/cpu64.c:57:get_sysreg_idx: code should not be reached
Bail out! ERROR:../target/arm/cpu64.c:57:get_sysreg_idx: code should not be=
 reached

From a quick debug, it looks like the below path results in an invalid ID i=
dx.

kvm_arm_expose_idreg_properties()
 kvm_idx_to_idregs_idx(0)
  get_sysreg_idx(0xc000)  --> id_register seems to start at 0xc008

Haven't debugged further.

I am running against a 6.15-rc1 kernel after updating the Qemu branch by,
./update-aarch64-sysreg-code.sh  path_to_6.15-rc1

Not sure I am  missing anything. Please check and let me know.

Thanks,
Shameer

=20
