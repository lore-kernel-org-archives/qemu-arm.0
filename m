Received: by 2002:a17:505:3f8c:b0:1be9:327d:8ee3 with SMTP id bm12csp232264njb;
        Wed, 31 Jul 2024 01:49:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXmPSxFi6/E05cDdhwdU0u04VORL6rNWWgHMzcPTljpe7Ey4V6F6IpGmOMT1s7MauiztF5+0XKENfECjM09KrWEkEDI8Tzw
X-Google-Smtp-Source: AGHT+IE8IYVJzEn9eEckLe0aN24eXvuB1++L8jldZtZvhBYLQZG3dIQ9p+QaEOy9j+eSD1Qs334A
X-Received: by 2002:a17:902:f68c:b0:1fd:8eaf:eaa0 with SMTP id d9443c01a7336-1ff048030c0mr123245565ad.38.1722415741537;
        Wed, 31 Jul 2024 01:49:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1722415741; cv=none;
        d=google.com; s=arc-20160816;
        b=jxIDzbYN1kfQN/cU3Au/rUreaEutNS7itGJ1oCrg+QFbYoUPp3cFZu7UEYHp3cuvGa
         BGYy2Gs/m84PNxPA9nWx2JKaOC2eINKHsaP3EragOk26CFetzktl1Ze+A9qjTK0qpMbz
         f3ExY67FkOmJuiEgRaOopcMHCOBqHmIrIt0PerP4y56QY8TOSBClC41x0ZlfF6+95ikL
         3w7nl9dg7LHu4jePbFR8ixIHVu4d5lvteIlH4mylkWCj9cViFa9BiANdruCMiyzcYaJ+
         qJj3Zit5ZNxb7n45ghs/CyH3AwM5lqafXAW13rxo1cMhrimBUdyrIYP1wjQF8BkTeHN1
         xzQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=ldM0kXNXSVTr7O4cy800WYy1TDbTcev7zfXrWu2A7bw=;
        fh=46UCTVQGtiLYA8JIz/TqR/vE6h2QEQKwlXFBQZAYOgY=;
        b=yuXtn5FtmNXgV1Wfp8MEu9t/jeS9o+SqViZ800d76ryCDyghvtDKCUJrg9nsdx/x5l
         2gyD/q8FsQP0I7dEMPYZ+F5EegPrwi2kD4dhf79GwkbW+75fwRjnzKR6in3dD3EDX3AP
         jDz8VoNhi119fQIPGLpj+/MVtFHY5s3wday/8Hmyk8GEng9FBQ8ZvyLIOucPYUpg87Lq
         1V9X2QWGafzuPDyIBmqgZHPARLYQZkMud6urM6N6lasLl7hI+eo3KS3gWLlucdZHsGAn
         v19Kr8mpSRH8znmxed6zEDN0pf13D9gCQ4Qv1OPjUYp89P/AjSL3e1UTyUZWf/2FZGGd
         yhlg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id d9443c01a7336-1fed7ee8240si149781795ad.216.2024.07.31.01.49.00
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 31 Jul 2024 01:49:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.216])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4WYm1G53Xwz6K8C8;
	Wed, 31 Jul 2024 16:46:58 +0800 (CST)
Received: from lhrpeml100003.china.huawei.com (unknown [7.191.160.210])
	by mail.maildlp.com (Postfix) with ESMTPS id 61257140CF4;
	Wed, 31 Jul 2024 16:48:56 +0800 (CST)
Received: from lhrpeml500001.china.huawei.com (7.191.163.213) by
 lhrpeml100003.china.huawei.com (7.191.160.210) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 31 Jul 2024 09:48:56 +0100
Received: from lhrpeml500001.china.huawei.com ([7.191.163.213]) by
 lhrpeml500001.china.huawei.com ([7.191.163.213]) with mapi id 15.01.2507.039;
 Wed, 31 Jul 2024 09:48:56 +0100
From: Salil Mehta <salil.mehta@huawei.com>
To: Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin"
	<mtsirkin@redhat.com>, "peter.maydell@linaro.org" <peter.maydell@linaro.org>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org"
	<qemu-arm@nongnu.org>, "mst@redhat.com" <mst@redhat.com>,
	"peter.maydell@linaro.org" <peter.maydell@linaro.org>, "maz@kernel.org"
	<maz@kernel.org>, "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>, "andrew.jones@linux.dev"
	<andrew.jones@linux.dev>, "david@redhat.com" <david@redhat.com>,
	"philmd@linaro.org" <philmd@linaro.org>, "eric.auger@redhat.com"
	<eric.auger@redhat.com>, "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "will@kernel.org"
	<will@kernel.org>, "gshan@redhat.com" <gshan@redhat.com>, "rafael@kernel.org"
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
	"npiggin@gmail.com" <npiggin@gmail.com>, "harshpb@linux.ibm.com"
	<harshpb@linux.ibm.com>, Linuxarm <linuxarm@huawei.com>
Subject: RE: [PATCH] accel/kvm/kvm-all: Fixes the missing break in vCPU unpark
 logic
Thread-Topic: [PATCH] accel/kvm/kvm-all: Fixes the missing break in vCPU
 unpark logic
Thread-Index: AQHa3qJBk0Exld31N0eXTFVI7pTjNrIIr9WAgAffXcA=
Date: Wed, 31 Jul 2024 08:48:55 +0000
Message-ID: <ae5fa879bb7d416b92face2dcf9045fd@huawei.com>
References: <20240725145132.99355-1-salil.mehta@huawei.com>
 <20240726113355.731e61fe@imammedo.users.ipa.redhat.com>
In-Reply-To: <20240726113355.731e61fe@imammedo.users.ipa.redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.48.153.133]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-TUID: ZSPk7gy/vtAj

Hello,

A quick check and a gentle reminder, has this patch been accepted?

Best regards
Salil.

>  From: Igor Mammedov <imammedo@redhat.com>
>  Sent: Friday, July 26, 2024 10:34 AM
>  To: Salil Mehta <salil.mehta@huawei.com>
> =20
>  On Thu, 25 Jul 2024 15:51:32 +0100
>  Salil Mehta <salil.mehta@huawei.com> wrote:
> =20
>  > Loop should exit prematurely on successfully finding out the parked
>  > vCPU (struct
>  > KVMParkedVcpu) in the 'struct KVMState' maintained
>  'kvm_parked_vcpus'
>  > list of parked vCPUs.
>  >
>  > Fixes: Coverity CID 1558552
>  > Fixes: 08c3286822 ("accel/kvm: Extract common KVM vCPU
>  > {creation,parking} code")
>  > Reported-by: Peter Maydell <peter.maydell@linaro.org>
>  > Suggested-by: Peter Maydell <peter.maydell@linaro.org>
>  > Message-ID:
>  > <CAFEAcA-3_d1c7XSXWkFubD-
>  LsW5c5i95e6xxV09r2C9yGtzcdA@mail.gmail.com>
>  > Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
> =20
>  Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> =20
>  > ---
>  >  accel/kvm/kvm-all.c | 1 +
>  >  1 file changed, 1 insertion(+)
>  >
>  > diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c index
>  > 0aa4b4624a..c181297f00 100644
>  > --- a/accel/kvm/kvm-all.c
>  > +++ b/accel/kvm/kvm-all.c
>  > @@ -362,6 +362,7 @@ int kvm_unpark_vcpu(KVMState *s, unsigned long
>  vcpu_id)
>  >              QLIST_REMOVE(cpu, node);
>  >              kvm_fd =3D cpu->kvm_fd;
>  >              g_free(cpu);
>  > +            break;
>  >          }
>  >      }
>  >
> =20
