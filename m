Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp508048lft;
        Fri, 24 Jun 2022 10:59:28 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s31nNbAzBHJsnlmfsRCSjXZ+Fih9byICXovpQewSFYAEXq8v3KCuP1M795tmWvp7e3Wbz8
X-Received: by 2002:a05:6402:b48:b0:435:728c:d127 with SMTP id bx8-20020a0564020b4800b00435728cd127mr372689edb.392.1656093568862;
        Fri, 24 Jun 2022 10:59:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656093568; cv=none;
        d=google.com; s=arc-20160816;
        b=RpANlUz8uhtTyJMk4eAhDmcy42c3IKCFX+rXUMG5Osbpe/9qoMgFk3ru3exu4kFfBR
         vWTNJrvey8VgLHDcoUGFQOpj83LEFNaUN7g5w8cjwPz2XEOvFryazEWQlzOUW5jpKsI1
         PdGjHlWyhiOV5P7vJtvsKV5lffp5wCxohq39Dz97gkPukBdWHaTgkgYkvhcvME3opmf4
         rkt1BhDs03Fe8ry9IajXATGpuz++pRjlEd9KwNftja1RfFdxbh6n6jOiqzITKh9tv/Ir
         iN2A006BULO3gQMfwJNg8LWnt/UTlIr+CLdIieBKCO+Fyub761nsggFuzYV2BncuqUbc
         wfqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:from:date;
        bh=Nd/BmmETaVcSg2ov3HHacrZk4KpmK4mgA3BRwmN+XGc=;
        b=RUFxe1glaV/rxZ81ETBfUGcNcFvLzrxdu7jZxU5XiE1hjqOVAIBidRQBr2x3JO2QzN
         R0hE6wLsAdPwKESLjgNSG6eevWvGdpG6hUfOKxXyEHr+aExRwrenrS9WzyhgDsbXyaph
         OQTfa7LtP+0Cmmt3fkgcUlciy+guo2iigmyhOj4A06xreeHj4dEYAI27Cw7J5u/CYfEu
         9SUGzrBHZ+PTL+m/18+MVDNvZUaVcw6czSUb7qDCjPokVd/NxQhd/rLMSastPNc6Yxqh
         0kaWgV+rA3FZ3UylAtZd/SR1zKDv6FQJQi7tXi1Hcl/oqZV/wAUZg89VFP1/iCgZkNvg
         iY8A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Return-Path: <jonathan.cameron@huawei.com>
Received: from frasgout.his.huawei.com (frasgout.his.huawei.com. [185.176.79.56])
        by mx.google.com with ESMTPS id gj4-20020a170906e10400b00722e85dcd8fsi209495ejb.210.2022.06.24.10.59.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 24 Jun 2022 10:59:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) client-ip=185.176.79.56;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of jonathan.cameron@huawei.com designates 185.176.79.56 as permitted sender) smtp.mailfrom=jonathan.cameron@huawei.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=huawei.com
Received: from fraeml737-chm.china.huawei.com (unknown [172.18.147.206])
	by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4LV4Zp3MCxz67xW6;
	Sat, 25 Jun 2022 01:57:22 +0800 (CST)
Received: from lhreml710-chm.china.huawei.com (10.201.108.61) by
 fraeml737-chm.china.huawei.com (10.206.15.218) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Fri, 24 Jun 2022 19:59:27 +0200
Received: from localhost (10.81.207.131) by lhreml710-chm.china.huawei.com
 (10.201.108.61) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Fri, 24 Jun
 2022 18:59:26 +0100
Date: Fri, 24 Jun 2022 18:59:22 +0100
From: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
To: Peter Maydell <peter.maydell@linaro.org>
CC: <qemu-devel@nongnu.org>, <alex.bennee@linaro.org>, <qemu-arm@nongnu.org>,
	"Michael S . Tsirkin" <mst@redhat.com>, Ben Widawsky <bwidawsk@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>, <linux-cxl@vger.kernel.org>,
	<linuxarm@huawei.com>, Marcel Apfelbaum <marcel@redhat.com>, Igor Mammedov
	<imammedo@redhat.com>, Markus Armbruster <armbru@redhat.com>, "Mark
 Cave-Ayland" <mark.cave-ayland@ilande.co.uk>, Adam Manzanares
	<a.manzanares@samsung.com>, Tong Zhang <ztong0001@gmail.com>, "Shameerali
 Kolothum Thodi" <shameerali.kolothum.thodi@huawei.com>
Subject: Re: [PATCH v11 2/2] qtest/cxl: Add aarch64 virt test for CXL
Message-ID: <20220624185922.0000458f@Huawei.com>
In-Reply-To: <CAFEAcA_tck3fG67qO=4QiTHY2ST3jvy7-w156XkMKMv38-aN9g@mail.gmail.com>
References: <20220616141950.23374-1-Jonathan.Cameron@huawei.com>
	<20220616141950.23374-3-Jonathan.Cameron@huawei.com>
	<CAFEAcA_tck3fG67qO=4QiTHY2ST3jvy7-w156XkMKMv38-aN9g@mail.gmail.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; i686-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.81.207.131]
X-ClientProxiedBy: lhreml735-chm.china.huawei.com (10.201.108.86) To
 lhreml710-chm.china.huawei.com (10.201.108.61)
X-CFilter-Loop: Reflected
X-TUID: waNMNbsvzvAU

On Fri, 24 Jun 2022 17:12:25 +0100
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Thu, 16 Jun 2022 at 15:20, Jonathan Cameron
> <Jonathan.Cameron@huawei.com> wrote:
> >
> > Add a single complex case for aarch64 virt machine.
> >
> > Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> > ---
> >  tests/qtest/cxl-test.c  | 48 +++++++++++++++++++++++++++++++++--------
> >  tests/qtest/meson.build |  1 +
> >  2 files changed, 40 insertions(+), 9 deletions(-)
> >
> > diff --git a/tests/qtest/cxl-test.c b/tests/qtest/cxl-test.c
> > index 2133e973f4..1015d0e7c2 100644
> > --- a/tests/qtest/cxl-test.c
> > +++ b/tests/qtest/cxl-test.c
> > @@ -17,6 +17,11 @@
> >                        "-device pxb-cxl,id=cxl.1,bus=pcie.0,bus_nr=53 " \
> >                        "-M cxl-fmw.0.targets.0=cxl.0,cxl-fmw.0.targets.1=cxl.1,cxl-fmw.0.size=4G "
> >
> > +#define QEMU_VIRT_2PXB_CMD "-machine virt,cxl=on "                      \
> > +                      "-device pxb-cxl,id=cxl.0,bus=pcie.0,bus_nr=52 "  \
> > +                      "-device pxb-cxl,id=cxl.1,bus=pcie.0,bus_nr=53 "  \
> > +                      "-M cxl-fmw.0.targets.0=cxl.0,cxl-fmw.0.targets.1=cxl.1,cxl-fmw.0.size=4G "
> > +  
> 
> If CXL requires booting via UEFI, what does this test case do?
> It doesn't seem to be passing in a BIOS image.

Not a lot beyond checking device creation is valid etc and the machine boots.

There is a bios tables test that checks we pass the right tables to the BIOS image.
I didn't duplicate that for ARM on the basis it's more or less identical, but
perhaps that is worth adding.

To do any useful functional testing will require a mass of complex OS
handling after booting. That testing is definitely something I'd like to
add, but the userspace tooling isn't all in place yet. Final kernel series that's
needed to get to the point where you can use the non volatile memory had
a new version posted yesterday.

Jonathan

> 
> thanks
> -- PMM
