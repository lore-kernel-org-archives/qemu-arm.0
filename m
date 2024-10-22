Received: by 2002:a17:504:4a21:b0:1be9:327d:8ee3 with SMTP id wq1csp50239njb;
        Tue, 22 Oct 2024 16:02:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUBBBrSxpM+30KmB5BsFruRCFzwnB/dEnZaTLlb5ZJwewA5leu1NtLz6QzFGFtZ/v5EgFTtu13KI0my6Q==@linaro.org
X-Google-Smtp-Source: AGHT+IEQAo4jp/F6fUCPVKZhGGTX6cnFBcsA3wj7Do11+c/RsEcDL7m97ZcV5DvdZFT74AOCTZlv
X-Received: by 2002:a5d:4536:0:b0:37d:5436:4a1 with SMTP id ffacd0b85a97d-37efcf0521bmr297844f8f.3.1729638161308;
        Tue, 22 Oct 2024 16:02:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729638161; cv=none;
        d=google.com; s=arc-20240605;
        b=NpBBz25vccKWxXkjBlDUPvLKyMwuFUFHzyB+6SxhzvoLqrtaa+1AdmTh2UNzlXuT5W
         NUFxNG4EuL/U3ERt6lt/LEIiszDyEoUa/NW2ViIE9YRxJWfjnfYJ/beB65vKNaH1bPn2
         Bl/hd2fAC9MDyLrPzYk+wraIPxDv4OW1+JafQ0E02hYqXmJ7SnJKlAnJF8s10Oo52c1O
         HLiCetShdBEx2lsQlowt/r59SM49OJVYtfd/8QfRwV5KQyOn+IxA4I4Ebk0J2FwIaT1V
         WOawOz/Mw8KC10LSM4m5ARloA54rg4FwztwfFrapfr0imLMjhC55E4s3eEUZbB9MmaiM
         Cx2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:cc:to:from;
        bh=cNZNm0NmJ9EpgAAVZC0RQ3ovxQjYKqseBZzO1y6sMqs=;
        fh=b/SX6GG71f9+bLfLBvQcX6oLBcOeE4ofRqFQKBOtBxw=;
        b=JgLe4eU3K7ya9+LB5IrUuznez+a9+Aq73w6GDiAsor0gsNCd/xMuFKYPO3gcfy72ud
         bd5Hoges9XZS+U6xE08xmt3YP4Bg/2vIxyyAh7gh302lTKGEwfOSVVq1sH0ZisbSEq1P
         8OQZkJeDYkpbvZnUbJicLthoLqMvYPfILdZjEQ5S6ulnsWKgd6pjQRvEKD2biH+Lpa98
         V07N2i0DElD2q8yDDicYrDCaJN7tEfv99rm9PFATrgmgRZWL+C+c6lyJ0R78R5h8KWdu
         7u7e1KpgnyBfDHYXIZIIEv1/NGaT+GKQzYC1USsV5ENCh8GCx24qRoM9EV5gTFnudnzi
         mgPw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <salil.mehta@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-37ee0a3bd36si2979457f8f.205.2024.10.22.16.02.40
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 22 Oct 2024 16:02:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of salil.mehta@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=salil.mehta@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XY6yw4m7pz6LD9d;
	Wed, 23 Oct 2024 06:58:00 +0800 (CST)
Received: from frapeml500006.china.huawei.com (unknown [7.182.85.219])
	by mail.maildlp.com (Postfix) with ESMTPS id 2E7E01400F4;
	Wed, 23 Oct 2024 07:02:40 +0800 (CST)
Received: from frapeml500007.china.huawei.com (7.182.85.172) by
 frapeml500006.china.huawei.com (7.182.85.219) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 23 Oct 2024 01:02:39 +0200
Received: from frapeml500007.china.huawei.com ([7.182.85.172]) by
 frapeml500007.china.huawei.com ([7.182.85.172]) with mapi id 15.01.2507.039;
 Wed, 23 Oct 2024 01:02:39 +0200
From: Salil Mehta <salil.mehta@huawei.com>
To: Igor Mammedov <imammedo@redhat.com>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, "qemu-arm@nongnu.org"
	<qemu-arm@nongnu.org>, "mst@redhat.com" <mst@redhat.com>, "maz@kernel.org"
	<maz@kernel.org>, "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>, "lpieralisi@kernel.org"
	<lpieralisi@kernel.org>, "peter.maydell@linaro.org"
	<peter.maydell@linaro.org>, "richard.henderson@linaro.org"
	<richard.henderson@linaro.org>, "andrew.jones@linux.dev"
	<andrew.jones@linux.dev>, "david@redhat.com" <david@redhat.com>,
	"philmd@linaro.org" <philmd@linaro.org>, "eric.auger@redhat.com"
	<eric.auger@redhat.com>, "will@kernel.org" <will@kernel.org>,
	"ardb@kernel.org" <ardb@kernel.org>, "oliver.upton@linux.dev"
	<oliver.upton@linux.dev>, "pbonzini@redhat.com" <pbonzini@redhat.com>,
	"gshan@redhat.com" <gshan@redhat.com>, "rafael@kernel.org"
	<rafael@kernel.org>, "borntraeger@linux.ibm.com" <borntraeger@linux.ibm.com>,
	"alex.bennee@linaro.org" <alex.bennee@linaro.org>, "npiggin@gmail.com"
	<npiggin@gmail.com>, "harshpb@linux.ibm.com" <harshpb@linux.ibm.com>,
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
	"shahuang@redhat.com" <shahuang@redhat.com>, "zhao1.liu@intel.com"
	<zhao1.liu@intel.com>, Linuxarm <linuxarm@huawei.com>,
	"gustavo.romero@linaro.org" <gustavo.romero@linaro.org>
Subject: RE: [PATCH V1 2/4] hw/acpi: Update ACPI CPU Status `is_{present,
 enabled}` during vCPU hot(un)plug
Thread-Topic: [PATCH V1 2/4] hw/acpi: Update ACPI CPU Status `is_{present,
 enabled}` during vCPU hot(un)plug
Thread-Index: AQHbHm6LVfm++ex4ak2XyzXHJrqBZLKMcruAgAb57AA=
Date: Tue, 22 Oct 2024 23:02:39 +0000
Message-ID: <b31151bc8f4e48ccafb9707543363db3@huawei.com>
References: <20241014192205.253479-1-salil.mehta@huawei.com>
	<20241014192205.253479-3-salil.mehta@huawei.com>
 <20241018161811.4a88c7b7@imammedo.users.ipa.redhat.com>
In-Reply-To: <20241018161811.4a88c7b7@imammedo.users.ipa.redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-originating-ip: [10.48.148.112]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-TUID: 1UA9gpsSW2qm

Hi Igor,

>  From: Igor Mammedov <imammedo@redhat.com>
>  Sent: Friday, October 18, 2024 3:18 PM
>  To: Salil Mehta <salil.mehta@huawei.com>
> =20
>  On Mon, 14 Oct 2024 20:22:03 +0100
>  Salil Mehta <salil.mehta@huawei.com> wrote:
> =20
>  > Update the `AcpiCpuStatus` for `is_enabled` and `is_present`
>  > accordingly when vCPUs are hot-plugged or hot-unplugged, taking into
>  > account the *persistence* of the vCPUs.
>  >
>  > Signed-off-by: Salil Mehta <salil.mehta@huawei.com>
>  > ---
>  >  hw/acpi/cpu.c | 7 +++++++
>  >  1 file changed, 7 insertions(+)
>  >
>  > diff --git a/hw/acpi/cpu.c b/hw/acpi/cpu.c index
>  > 083c4010c2..700aa855e9 100644
>  > --- a/hw/acpi/cpu.c
>  > +++ b/hw/acpi/cpu.c
>  > @@ -291,6 +291,8 @@ void acpi_cpu_plug_cb(HotplugHandler
>  *hotplug_dev,
>  >      }
>  >
>  >      cdev->cpu =3D CPU(dev);
>  > +    cdev->is_present =3D true;
>  > +    cdev->is_enabled =3D true;
> =20
>  hmm, if cpu is always present, then these fields are redundant since
>    (!cdev->cpu) =3D=3D present
>  and
>    then is_enabled could be fetched from cdev->cpu directly


I believe you are assuming, that all the QOM possible vCPUs objects will
exists (and hence realized) for the entire life time of the VM? If yes, the=
n
we need to first debate on that as we cannot let presence of all the possib=
le
vCPUs affect  the boot time. This is one of the key requirement from this
feature.


> =20
>  >      if (dev->hotplugged) {
>  >          cdev->is_inserting =3D true;
>  >          acpi_send_event(DEVICE(hotplug_dev),
>  > ACPI_CPU_HOTPLUG_STATUS); @@ -322,6 +324,11 @@ void
>  acpi_cpu_unplug_cb(CPUHotplugState *cpu_st,
>  >          return;
>  >      }
>  >
>  > +    cdev->is_enabled =3D false;
>  > +    if (!acpi_persistent_cpu(CPU(dev))) {
>  > +        cdev->is_present =3D false;
>  > +    }
> =20
>  and other way around works as well.
> =20
>  then we don't have to carry around extra state and making sure that it's=
 in
>  sync/migrated.
> =20
>  > +
>  >      cdev->cpu =3D NULL;
>  >  }
>  >
> =20
