Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp176111njb;
        Thu, 17 Oct 2024 06:19:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWopA4GpIogHy9ypeXbi7FbH2W7zLTsMYCNbK1MZiL3Q/iK152o9GUgUhJJAEaqON7Zjan6dOxdO/knJQ==@linaro.org
X-Google-Smtp-Source: AGHT+IF68di5eHM+ArUeqUrae2BfMsbJpXLFTSpxGbRGa3kaDmvvrS4LSTzufLfYP7Ut/ZYZ5dVu
X-Received: by 2002:a17:902:e54a:b0:20c:9e9b:9614 with SMTP id d9443c01a7336-20d27e8be64mr109110515ad.15.1729171170829;
        Thu, 17 Oct 2024 06:19:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729171170; cv=none;
        d=google.com; s=arc-20240605;
        b=Ej2KU6zpDcp19YzKeJu9RMTYMgzD2mUKGYKbFfJ+berwjh2WmkL2FBqhe9TYg1Qs35
         yekIjzyaS6vUeP9pLbnYir7ZBfWTmJy7FQrkv947N4wHlOFPSq5Q32lpO5KlatXvm62+
         syZAxC7yZ+eZWggz3SuZb961Gi3mlJbAQmTFw7OIwwwJF+JpzXjOIEcoxPEhqJPO9yrB
         KU8JmhAI0AknQhvpcAIctz+oxcXBKIy5WFgrhiiv7kjQtuWfaMfgBzx4I2Jc6CeM9tDH
         P3EPa2k72EMU+UIZV+3qfBwdLQRXpgiEEY/N1MlL7fvlyN5aEt8bdrdLItWTzvokW10b
         yfiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date;
        bh=T8jb3xSQjAVNfgHLT3dnMSh05UPCoMcSmtPeaqXRDZ8=;
        fh=LPBeeAAheqr1015aaa2RBrvbo5b2UcjJD1ORJet6QLY=;
        b=fRNmxUdcOwKCwfODIIgv5saOuPxutdrf4ynvl++ZBmFi360dBN1/bS8B3+5CoEZ7dr
         cqKSAH82tXYsvC9SJBakeikdI1OGzaT4PPy0hblzTp4I+WhebNrUmrvjZfTdN0YasGnV
         yeecf3hfc+etFbIGmMmr2JALOuwOmfXhZkgeRJ0lbn+E96yHhS7iZvbDLcOdZkbrGVMx
         MbUCfOtEPFMj5zUUVataBWRvajgt2u5zVE0JchJxq/e+q/t09w9VHMS7uaDydr6BgaOq
         qPavlUUb+B4MNIJNiiIMydbzT19T/csEqwPx/E7izubqxlMN2wevQbEjYt5rYjim1I9a
         idCw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id 98e67ed59e1d1-2e3e093942asi1989205a91.103.2024.10.17.06.19.29
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Oct 2024 06:19:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XTpLt2DRqz6JBTK;
	Thu, 17 Oct 2024 21:18:46 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 99CE81400DB;
	Thu, 17 Oct 2024 21:19:26 +0800 (CST)
Received: from localhost (10.126.174.164) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 17 Oct
 2024 15:19:25 +0200
Date: Thu, 17 Oct 2024 14:19:23 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Zhao Liu <zhao1.liu@intel.com>
CC: "Daniel P =?ISO-8859-1?Q?Berrang=E9?=" <berrange@redhat.com>, "Igor
 Mammedov" <imammedo@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Philippe =?ISO-8859-1?Q?Ma?=
 =?ISO-8859-1?Q?thieu-Daud=E9?= <philmd@linaro.org>, Yanan Wang
	<wangyanan55@huawei.com>, "Michael S.Tsirkin " <mst@redhat.com>, "Paolo
 Bonzini" <pbonzini@redhat.com>, Richard Henderson
	<richard.henderson@linaro.org>, Eric Blake <eblake@redhat.com>, "Markus
 Armbruster" <armbru@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>, Alex
 =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>, Peter Maydell
	<peter.maydell@linaro.org>, Sia Jee Heng <jeeheng.sia@starfivetech.com>,
	Alireza Sanaee <alireza.sanaee@huawei.com>, <qemu-devel@nongnu.org>,
	<kvm@vger.kernel.org>, <qemu-riscv@nongnu.org>, <qemu-arm@nongnu.org>,
	"Zhenyu Wang" <zhenyu.z.wang@intel.com>, Dapeng Mi
	<dapeng1.mi@linux.intel.com>
Subject: Re: [PATCH v3 0/7] Introduce SMP Cache Topology
Message-ID: <20241017141923.00007f64@Huawei.com>
In-Reply-To: <20241012104429.1048908-1-zhao1.liu@intel.com>
References: <20241012104429.1048908-1-zhao1.liu@intel.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.126.174.164]
X-ClientProxiedBy: lhrpeml500002.china.huawei.com (7.191.160.78) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: BMnm2cZiUQQJ

RESEND (again, sorry) as didn't reach list.
Issue some stray " in various email addresses.

On Sat, 12 Oct 2024 18:44:22 +0800
Zhao Liu <zhao1.liu@intel.com> wrote:

> Hi all,
>=20
> Compared with v2 [1], the changes in v3 are quite minor, and most of
> patches (except for patch 1 and 7) have received Jonathan=E2=80=99s R/b (=
thanks
> Jonathan!).
>=20
> Meanwhile, ARM side has also worked a lot on the smp-cache based on
> this series [2], so I think we are very close to the final merge, to
> catch up with this cycle. :)

This would finally solve a long standing missing control for our
virtualization usecases (TCG and MPAM stuff is an added bonus),
so I'm very keen in this making 9.2 (and maybe even the ARM part
of things happen to move fast enough). Ali is out this week,
but should be back sometime next week. Looks like rebase of his
ARM patches on this should be simple!

I think this set mostly needs a QAPI review (perhaps from Markus?)

>=20
> This series is based on the commit 7e3b6d8063f2 ("Merge tag 'crypto-
> fixes-pull-request' of https://gitlab.com/berrange/qemu into staging").
>=20
> Background
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> The x86 and ARM (RISCV) need to allow user to configure cache properties
*laughs*. I definitely going to start emailing ARM folk with
ARM (RISCV) =20
:) =20


> (current only topology):
>  * For x86, the default cache topology model (of max/host CPU) does not
>    always match the Host's real physical cache topology. Performance can
>    increase when the configured virtual topology is closer to the
>    physical topology than a default topology would be.
>  * For ARM, QEMU can't get the cache topology information from the CPU
>    registers, then user configuration is necessary. Additionally, the
>    cache information is also needed for MPAM emulation (for TCG) to
>    build the right PPTT. (Originally from Jonathan)
