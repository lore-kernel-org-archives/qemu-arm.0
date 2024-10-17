Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp53801njb;
        Thu, 17 Oct 2024 02:12:09 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUbsF9Llrk1UAf3aesYmCPZTmkbYmYbTQpMbSFTxBZQwP1i0St/aIh3uFpqgQq3nOr4IwedAy8mdXOFgg==@linaro.org
X-Google-Smtp-Source: AGHT+IEyh58jnNTBY1Pb6Vs0x5gOUFL4vdusNT+oH893NN6kfCbNriYG0Bmj5qt8ndjvkn3QNPgd
X-Received: by 2002:a05:600c:1e0d:b0:431:5d89:646e with SMTP id 5b1f17b1804b1-4315d8967ebmr6299035e9.32.1729156329230;
        Thu, 17 Oct 2024 02:12:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729156329; cv=none;
        d=google.com; s=arc-20240605;
        b=JabJBC2Bb+ugbYII8Ns8LNt9NBPIelY5kDO444ArRzgUmZ/QrOSuRKAdcQdGAEIKj/
         e0HHA9z873FfbzIWC0Wp8AsENnWhDMh7hwLe3WMxhTiC2V6DBVBIVrsuL9oFmf4heZeB
         q4q9X679dDxwIbeCcWTaxkQmxXQsGJhKDxpdSN09h/HkyGn+8zSVNpj6HmytmPtRSd5D
         Nx9aaeU7MMKZHLHjR5tjfetx5pFzfxmeeTrn+//D9FEwmWaG1D7rUCRRAnKmUJ2SaNLA
         t6wZ0Z3UjzBszrgiQtd+Sv+7WsnC4VjByRv1hOgEe4ZfoXwC5nbGPZHvnHC8CbU0COvn
         lAIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date;
        bh=iMXq0QLkOAfUKEbZFAL+cbqwL6+rtfp2QDAO6XDVUAo=;
        fh=3b9il47umKWjqKrof5lgN8HMBQZG2Z+dz652rXT+PHY=;
        b=iUE9i5N4NbmyPkkelReTTzyeIw5zjOE1MN2WKVm5c5FEFay+o/Lvegd6Wgl13UHxrR
         DBiWnhqDG9ZQmD6Ho3v4T0zc9m3Pa+06FZA7USKx6Mq6ZnmDs/VnCKVGR6FDmyYeuqDg
         Nf2VGUT6ejjkgY+jEmpS6HkzFsM8QKh0xlEkwyDtk82fDJVSglHnMMeOwJNGBbqhIvWN
         2Xn/+hbyz/lqm12c9jR29BrsdrKhRohBMNKkOe+xZGRlTaMfYqJ8kMNO86wCe1Fcz6XP
         /0Dp6R+9lsx6QVVLy7cS0XRsIKQva7ZbQK9Pzm5TEf5RkShmh2NPqn8UX68s5KhqxUy2
         XlzQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-37d7fbedc7fsi2758667f8f.64.2024.10.17.02.12.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Oct 2024 02:12:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XThn50TJ2z6LD9g;
	Thu, 17 Oct 2024 17:07:37 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 66C021404F4;
	Thu, 17 Oct 2024 17:12:08 +0800 (CST)
Received: from localhost (10.126.174.164) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 17 Oct
 2024 11:12:07 +0200
Date: Thu, 17 Oct 2024 10:12:05 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Zhao Liu <zhao1.liu@intel.com>
CC: "Daniel P .\" =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>, Igor  Mammedov <imammedo@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, Marcel  Apfelbaum <marcel.apfelbaum@gmail.com>, Philippe =?ISO-8859-1?Q?Ma?=  =?ISO-8859-1?Q?thieu-Daud=E9?= <philmd@linaro.org>, Yanan Wang  <wangyanan55@huawei.com>,  Michael S.Tsirkin  <mst@redhat.com>, Paolo Bonzini  <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, Eric  Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>, Marcelo  Tosatti <mtosatti@redhat.com>, Alex =?ISO-8859-1?Q?Benn=E9e?=  <alex.bennee@linaro.org>, Peter Maydell <peter.maydell@linaro.org>, Sia Jee  Heng <jeeheng.sia@starfivetech.com>, Alireza Sanaee  <alireza.sanaee@huawei.com>, qemu-devel@nongnu.org, kvm@vger.kernel.org,  qemu-riscv@nongnu.org, qemu-arm@nongnu.org, Zhenyu Wang  <zhenyu.z.wang@intel.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>"@domain.invalid
Subject: Re: [PATCH v3 0/7] Introduce SMP Cache Topology
Message-ID: <20241017101205.00007c87@Huawei.com>
In-Reply-To: <20241012104429.1048908-1-zhao1.liu@intel.com>
References: <20241012104429.1048908-1-zhao1.liu@intel.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.126.174.164]
X-ClientProxiedBy: lhrpeml500004.china.huawei.com (7.191.163.9) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: oGAgV+mBnhQ6

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
