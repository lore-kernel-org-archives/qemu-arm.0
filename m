Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp4216452lfg;
        Tue, 11 May 2021 10:51:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwr8DZ8KCcyaxnM3P7wlluUk22HI2DxCzTjC3qgtFJNQCUmTVBKVTBnEOTak2FfOm8K283D
X-Received: by 2002:a65:5c4a:: with SMTP id v10mr31715585pgr.73.1620755479525;
        Tue, 11 May 2021 10:51:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620755479; cv=none;
        d=google.com; s=arc-20160816;
        b=Z4l6e5CfZYX7DOiroVMUIaKJGef7AlbE8K2PBWVBFEBpCpT708dy3uu/e1fb6VNeYR
         3f4aWkICu7hSuYMoU+BSsX/loWLm8qqh7C9weHDtooNMhHh+VChwXPeLfFGXicQxSMkn
         MvPpzOq9RzC/vG6ABTzHv9fw3Vbgdsays63hDKQ96JclVi7SDpFUMISm4Lo9dQrfxkKf
         ziv2J4kV11fgjfrkJJL+Et3bQv1ON4mPaPi21ZPS4iRQ6zfx0MrtAIjTPR8weXUR9PAc
         qEwu8KOvPTygHBF0XudqXsN5Xq11c3LhzCSsfZri4syFUbWVdt8UUL224LRclefAboHc
         TJ6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:message-id:date:thread-index:thread-topic:subject
         :cc:to:from;
        bh=wbzce9OAjRTCZyTmKIcvFQ2gk5hOPTwPyyXPPnhqYwE=;
        b=KFfsxT7dCGjIJ7RkhDjku3dPIJrd4KKkEc3J/RuFVUrfuTTMHHRBWlhk+iBQZYsdQJ
         8hmSDyYEGJ3ZMmygp83Z9sU12OmuVc1KhObhooX7rCB/sQWJuhEzhHojkrk7te4fW6O6
         WVKmNLtRTgZQmAObVnB2LKMgJqQiRVhHcB6HzTUoE9HkfscCXCfNQkHAjbJ14xN0LH8e
         7Mv2VcJU+BNlLFRPR5+4ecaOxi1W9GDKl0Q7nTqSUVQhPe4aJZ/JLSx8Nm8ibQH4oCr8
         QIBwO2hJhA8OCiUeBzTJ96icOctoNYDPsq9MYKqAWld+6kj5Vbr5dBQzJb6y6S7dn4pp
         hEgg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of andrey.shinkevich@huawei.com designates 45.249.212.187 as permitted sender) smtp.mailfrom=andrey.shinkevich@huawei.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Return-Path: <andrey.shinkevich@huawei.com>
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com. [45.249.212.187])
        by mx.google.com with ESMTPS id e17si25132114pgv.491.2021.05.11.10.51.19
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 May 2021 10:51:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrey.shinkevich@huawei.com designates 45.249.212.187 as permitted sender) client-ip=45.249.212.187;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of andrey.shinkevich@huawei.com designates 45.249.212.187 as permitted sender) smtp.mailfrom=andrey.shinkevich@huawei.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from dggeml756-chm.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Ffljg1wjVzWhKk;
	Wed, 12 May 2021 01:47:03 +0800 (CST)
Received: from dggpemm100008.china.huawei.com (7.185.36.125) by
 dggeml756-chm.china.huawei.com (10.1.199.158) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Wed, 12 May 2021 01:51:17 +0800
Received: from dggpemm500011.china.huawei.com (7.185.36.110) by
 dggpemm100008.china.huawei.com (7.185.36.125) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 12 May 2021 01:51:17 +0800
Received: from dggpemm500011.china.huawei.com ([7.185.36.110]) by
 dggpemm500011.china.huawei.com ([7.185.36.110]) with mapi id 15.01.2176.012;
 Wed, 12 May 2021 01:51:17 +0800
From: Andrey Shinkevich <andrey.shinkevich@huawei.com>
To: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
CC: "Chengen (William, FixNet)" <chengen@huawei.com>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>, "drjones@redhat.com"
	<drjones@redhat.com>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>, "alex.bennee@linaro.org"
	<alex.bennee@linaro.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Subject: GICv3 for MTTCG
Thread-Topic: GICv3 for MTTCG
Thread-Index: AQHXRo49QQoDTg/5kkqOfm/tGkugzg==
Date: Tue, 11 May 2021 17:51:17 +0000
Message-ID: <1f157423cc544731beb743287a4be5cb@huawei.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.227.155.55]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-TUID: fMwMfUNkF/XC

Dear colleagues,=0A=
=0A=
I am looking for ways to accelerate the MTTCG for ARM guest on x86-64 host.=
=0A=
The maximum number of CPUs for MTTCG that uses GICv2 is limited by 8:=0A=
=0A=
include/hw/intc/arm_gic_common.h:#define GIC_NCPU 8=0A=
=0A=
The version 3 of the Generic Interrupt Controller (GICv3) is not=0A=
supported in QEMU for some reason unknown to me. It would allow to=0A=
increase the limit of CPUs and accelerate the MTTCG performance on a=0A=
multiple core hypervisor.=0A=
I have got an idea to implement the Interrupt Translation Service (ITS)=0A=
for using by MTTCG for ARM architecture.=0A=
=0A=
Do you find that idea useful and feasible?=0A=
If yes, how much time do you estimate for such a project to complete by=0A=
one developer?=0A=
If no, what are reasons for not implementing GICv3 for MTTCG in QEMU?=0A=
=0A=
Best regards,=0A=
Andrey Shinkevich=0A=
