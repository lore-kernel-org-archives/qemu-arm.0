Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp404184njc;
        Fri, 13 Jun 2025 10:16:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVahKJFOdDI6nufH1pQ2tqE7MnhbIa7PR4vrRBhXmQ3U55tq4PQyPKzM5He+qSF7QVEcI7Ov9n+7+t7cA==@linaro.org
X-Google-Smtp-Source: AGHT+IEcGmZnGvtsW2xjOV3172tBugGJ5JPIEUVZR9lvehiuvplHkXK7L46jBYyDFhPc/rRSrDiv
X-Received: by 2002:a05:6000:240e:b0:3a4:ef00:a7ac with SMTP id ffacd0b85a97d-3a5723af86fmr564771f8f.45.1749834994612;
        Fri, 13 Jun 2025 10:16:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749834994; cv=none;
        d=google.com; s=arc-20240605;
        b=fzeImY2oiLTHrH7y+HIve2txAaU4KGBnFFm3Am2OB2rS2Ipl8g5K0ilQjdTYu8+RcO
         n7/VutFVE3N8RrO2qIQwAybut+xEKakQ+YSNe34sRkDEsjpiy7/CxFZbl1KARaGvJ1YS
         2bUCzWMXcGGRrHDtbciHYjVdHT0nOrxU8do3j3YyX1GA1A7HNkzlXqOtgeLV1HjnNeIK
         TY2SWE0ZMe3KCvPRxhB9MOycKKv40hAlbf+3Gm1V9wiTnN740JLa1v6l64d+eq/ZNjKD
         isvOgRuewcsoaRf58GVPAVM+5n4s+6wd4oJ/PtLDjY7ytIMSt89TjLjRcsd4Bdxb+5MB
         tmiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date;
        bh=/SgS+T3y0/FTe5j6a5efTfYTbDfPx80rlbyNL1TCr3I=;
        fh=oDLjFSOamsMv4A51Yf2lSFFkJGeFX4zTdFZqA2DwPmw=;
        b=gzrIGItN1GTsWjPr9DnjG0C8BdspMUDjPbfjLE5eE37Bj6wo0SNalBo4r2Yw5l7ML9
         MLAnu6dRoDUY2yi48JfqkUOpQyblj6ktWxcuqfsqEnFyHpoFISiquJ+W+40tb+UObbPg
         AId3VJsnNKWmZhlIzcccBrs53aBGIHL+7dN6vEcOk6+Bv/vJIecMbhrlGzATdWUkn0sI
         RWCX76H2ExOfKzcGrzisFEI0nx3IJb+UaoHE3ZWxGv9T0Sp1G3Nbki96MySFOPW9jsLH
         8w2uvLEzzyHZl8UqSCxeSLgdWQ5afZsAhjZfmedrR/zMtGNmXQmvCq1b5oinUjTobkE5
         RLTg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id ffacd0b85a97d-3a568b49113si1768801f8f.539.2025.06.13.10.16.34
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Jun 2025 10:16:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from mail.maildlp.com (unknown [172.18.186.231])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bJmJQ0rC8z6M4sr;
	Sat, 14 Jun 2025 01:16:06 +0800 (CST)
Received: from frapeml500008.china.huawei.com (unknown [7.182.85.71])
	by mail.maildlp.com (Postfix) with ESMTPS id A47B2140371;
	Sat, 14 Jun 2025 01:16:33 +0800 (CST)
Received: from localhost (10.122.19.247) by frapeml500008.china.huawei.com
 (7.182.85.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Fri, 13 Jun
 2025 19:16:33 +0200
Date: Fri, 13 Jun 2025 18:16:31 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>
CC: <qemu-devel@nongnu.org>, Fan Ni <fan.ni@samsung.com>, <mst@redhat.com>,
	Zhijian Li <lizhijian@fujitsu.com>, Itaru Kitayama
	<itaru.kitayama@linux.dev>, <linuxarm@huawei.com>,
	<linux-cxl@vger.kernel.org>, <qemu-arm@nongnu.org>, Yuquan Wang
	<wangyuquan1236@phytium.com.cn>, Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?=
	<philmd@linaro.org>, Alireza Sanaee <alireza.sanaee@huawei.com>, Alex
 =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Subject: Re: [PATCH v15 4/4] qtest/cxl: Add aarch64 virt test for CXL
Message-ID: <20250613181631.00000336@huawei.com>
In-Reply-To: <CAFEAcA8xVQUnReg-3jYENLmOMG_PeJ-ACLQa0dRoLBzxQ+9Svg@mail.gmail.com>
References: <20250612134338.1871023-1-Jonathan.Cameron@huawei.com>
	<20250612134338.1871023-5-Jonathan.Cameron@huawei.com>
	<CAFEAcA8xVQUnReg-3jYENLmOMG_PeJ-ACLQa0dRoLBzxQ+9Svg@mail.gmail.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.122.19.247]
X-ClientProxiedBy: lhrpeml100006.china.huawei.com (7.191.160.224) To
 frapeml500008.china.huawei.com (7.182.85.71)
X-TUID: x14Akq9KWFcj

On Fri, 13 Jun 2025 13:32:03 +0100
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Thu, 12 Jun 2025 at 14:45, Jonathan Cameron
> <Jonathan.Cameron@huawei.com> wrote:
> >
> > Add a single complex case for aarch64 virt machine.
> > Given existing much more comprehensive tests for x86 cover the
> > common functionality, a single test should be enough to verify
> > that the aarch64 part continue to work.
> >
> > Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> >
> > ---
> > v15: Dropped tags due to changes in patches 2 and 3.
> > ---
> >  tests/qtest/cxl-test.c  | 59 ++++++++++++++++++++++++++++++++---------
> >  tests/qtest/meson.build |  1 +
> >  2 files changed, 47 insertions(+), 13 deletions(-)
> >
> > diff --git a/tests/qtest/cxl-test.c b/tests/qtest/cxl-test.c
> > index a600331843..c7189d6222 100644
> > --- a/tests/qtest/cxl-test.c
> > +++ b/tests/qtest/cxl-test.c
> > @@ -19,6 +19,12 @@
> >      "-device pxb-cxl,id=cxl.1,bus=pcie.0,bus_nr=53 " \
> >      "-M cxl-fmw.0.targets.0=cxl.0,cxl-fmw.0.targets.1=cxl.1,cxl-fmw.0.size=4G "
> >
> > +#define QEMU_VIRT_2PXB_CMD \
> > +    "-machine virt,cxl=on -cpu max " \
> > +    "-device pxb-cxl,id=cxl.0,bus=pcie.0,bus_nr=52 " \
> > +    "-device pxb-cxl,id=cxl.1,bus=pcie.0,bus_nr=53 " \
> > +    "-M cxl-fmw.0.targets.0=cxl.0,cxl-fmw.0.targets.1=cxl.1,cxl-fmw.0.size=4G "
> > +
> >  #define QEMU_RP \
> >      "-device cxl-rp,id=rp0,bus=cxl.0,chassis=0,slot=0 "
> >
> > @@ -197,25 +203,52 @@ static void cxl_2pxb_4rp_4t3d(void)
> >      qtest_end();
> >      rmdir(tmpfs);
> >  }
> > +
> > +static void cxl_virt_2pxb_4rp_4t3d(void)
> > +{
> > +    g_autoptr(GString) cmdline = g_string_new(NULL);
> > +    char template[] = "/tmp/cxl-test-XXXXXX";
> > +    const char *tmpfs;
> > +
> > +    tmpfs = mkdtemp(template);  
> 
> We prefer g_mkdtemp() or g_dir_make_temp() over raw mkdtemp(),
> I think. Other tests in this file use g_dir_make_tmp().

Ah. I'd failed to update this when various people cleaned up the other
tests.  Your comments reflect that earlier cleanup so I'll update
this to match the other tests.

> 
> Also you aren't checking whether it failed.
> 
> > +
> > +    g_string_printf(cmdline, QEMU_VIRT_2PXB_CMD QEMU_4RP QEMU_4T3D,
> > +                    tmpfs, tmpfs, tmpfs, tmpfs, tmpfs, tmpfs,
> > +                    tmpfs, tmpfs);
> > +
> > +    qtest_start(cmdline->str);  
> 
> We never change the GString and only use its C representation,
> so I think it's simpler to use
>   g_autofree char *cmdline = NULL;
>   ...
>   cmdline = g_strdup_printf(...);
> 
> But I see all the other tests in this file are written this
> way, so I'm ok with staying consistent to that here.

I'll stick to matching the others.

> 
> -- PMM
