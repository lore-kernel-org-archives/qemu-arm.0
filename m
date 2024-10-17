Received: by 2002:a17:505:18c3:b0:1be9:327d:8ee3 with SMTP id tt3csp172227njb;
        Thu, 17 Oct 2024 06:14:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV3IqTeQuo0T4uKcxNPcoRU9y/qqQklqZOBv0GSwUtVSB4B8iT0BMeAYhUz6vxs4m7zHi2ROl5oo2hl/w==@linaro.org
X-Google-Smtp-Source: AGHT+IGpjzB3sh6xHK5sXw+y3JbOX9xFG/6qeWZdRn2vvmJQwonHUyHgqkgQsQGybPysX2RwW/nh
X-Received: by 2002:a05:600c:3b8f:b0:431:547e:81d0 with SMTP id 5b1f17b1804b1-431547e84dfmr35004995e9.11.1729170846140;
        Thu, 17 Oct 2024 06:14:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729170846; cv=none;
        d=google.com; s=arc-20240605;
        b=jJvsKdnAUiYo73ebGw2KR4GEf5fq6AYVC12EssaKuG9l3OXjJfEWmE2PduvdoF2kLy
         nXtpzzsX6F0zHqa6QNB5ipQBd2HCquvHIb4pt3uhIEns3m+/kzWvs+Ft8NT9WGAJj+nC
         0uciRtuMuDFoREQokH4HGRsdhelXt7hQAIzeYOPhDEbumnht4KDcqhX6Ex51TElWzZz4
         18x5Ay62w/Ns6ydj1ELN5ReXMQotYj0GtiaU8jd0JHnlDRBO5vYZly5tekwKniU68YrS
         tPLhOlbzqhG3bwoAKebnKJDLK/y2hjDlpE+k/jmRfsu4pZhTOOAMQ3VQZzfqvuxqgx+Q
         6qAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date;
        bh=r0eFbrS0T0gmuRuLcCOU8+qT5cChGgkasIdNDfyaJlM=;
        fh=3b9il47umKWjqKrof5lgN8HMBQZG2Z+dz652rXT+PHY=;
        b=Bq5v/QaYyttRu7u7JAI96ETLNAg3+sa6n+YiJE3GLbx7P+NTgyB7QpFNG+/Dw5Mlc3
         9Yc/WdO1OGyVdJAZhwpa/7uyBf19lJ7d8ORQRvaDNHrQBIA3adBBQG6euQ0sdtfyYciA
         J5nFwdCOX+9ihDRfW+JbCP4TnHXMF/OWI+EqIi6Jy5A7ulopyQyl9sEy6HN/B5/6mj1R
         mM3kmY31rahAxELnnWmywwK5hN19aDgi6/PkmInSZ90XFqh+5bTmAcDmbiJgw3Xhv9Rt
         7M3HoZpGHPs445GvEk6NQ1ECMQvV9BSKkzrxPeysiP0uWd2+EgpWqprWJLoCZwoye54v
         uwLg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id 5b1f17b1804b1-43158c3c513si9340865e9.90.2024.10.17.06.14.05
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Oct 2024 06:14:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.31])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4XTpDj0G8jz6J9Zs;
	Thu, 17 Oct 2024 21:13:25 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id 53DD31400F4;
	Thu, 17 Oct 2024 21:14:05 +0800 (CST)
Received: from localhost (10.126.174.164) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Thu, 17 Oct
 2024 15:14:04 +0200
Date: Thu, 17 Oct 2024 14:14:02 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Zhao Liu <zhao1.liu@intel.com>
CC: "Daniel P .\" =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>, Igor  Mammedov <imammedo@redhat.com>, Eduardo Habkost <eduardo@habkost.net>, Marcel  Apfelbaum <marcel.apfelbaum@gmail.com>, Philippe =?ISO-8859-1?Q?Ma?=  =?ISO-8859-1?Q?thieu-Daud=E9?= <philmd@linaro.org>, Yanan Wang  <wangyanan55@huawei.com>,  Michael S.Tsirkin  <mst@redhat.com>, Paolo Bonzini  <pbonzini@redhat.com>, Richard Henderson <richard.henderson@linaro.org>, Eric  Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>, Marcelo  Tosatti <mtosatti@redhat.com>, Alex =?ISO-8859-1?Q?Benn=E9e?=  <alex.bennee@linaro.org>, Peter Maydell <peter.maydell@linaro.org>, Sia Jee  Heng <jeeheng.sia@starfivetech.com>, Alireza Sanaee  <alireza.sanaee@huawei.com>, qemu-devel@nongnu.org, kvm@vger.kernel.org,  qemu-riscv@nongnu.org, qemu-arm@nongnu.org, Zhenyu Wang  <zhenyu.z.wang@intel.com>, Dapeng Mi <dapeng1.mi@linux.intel.com>"@domain.invalid
Subject: Re: [PATCH v3 0/7] Introduce SMP Cache Topology
Message-ID: <20241017141402.0000135b@Huawei.com>
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
X-TUID: 2c8Orwd+nEu+


RESEND as some local email problems.  Sorry for the noise.

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
