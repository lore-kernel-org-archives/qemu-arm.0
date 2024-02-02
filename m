Received: by 2002:a17:907:7006:b0:a35:eedd:80b0 with SMTP id wr6csp1057423ejb;
        Fri, 2 Feb 2024 09:31:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+BlEPTWYWuEBngjh4dOuzHESHaAwomjxlQZkv/QOniyAnoyz04TjbZften3i8KDL7QsiV
X-Received: by 2002:a05:6214:aca:b0:68c:36bf:29f1 with SMTP id g10-20020a0562140aca00b0068c36bf29f1mr7644811qvi.12.1706895081516;
        Fri, 02 Feb 2024 09:31:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706895081; cv=none;
        d=google.com; s=arc-20160816;
        b=hQQoD2A16kDF0DFv0LMk5N7/wvadQGvgF5Vexdyma0Xbv7rDKQEPMg2qW/5OVWRu3f
         qmIQABc7IpaD6FxG7zjltKHw6AOV8RXqXyGyKP2vC7Q6HbehweJrm1kAvpLDgfiUaUXK
         hq9rSGhc2vgX+8wODRVQjXJySDqzjDc2ZoLmHL1yUFwibHoUuv4hLrDBCDhojZkReETh
         IR3qWEKXxqXsx+TqXrMiQ0JyAgt0kr7uFINPzqWGEoHzwiv0i73rXOwtvyQuvexSOHxG
         pLy6u8wJETHKV95hU5+PHbPyvJmEnUz21EEpLoLnO+6G+Bc0wHtAqiw6/5NDejUDRcpV
         A62Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:organization:references
         :in-reply-to:message-id:subject:cc:to:date;
        bh=tDdcJL3OxbOGX1sXxP9ZaYAtmpHb7W3q2P8XK2fGEy4=;
        fh=1sjzkcs2IgZu4YGuOqSBoigtIHO4idZmjrHafbJsepg=;
        b=DkZvzKCntDC9eCLMdR9QFievkcbJD80SP+vzz2TDi/Ncc268ccRBzF5+IyLSqwVokn
         /eXWhnck02XCeYaxGtzr3T5+AQ5CXHiQDwCr2wcCOJqOMK9F0l3GWgz4X+xOSks+Payy
         feccTKyXY2UdY8NZKtZkMp8UaVwyt+tG50VSNUY0O+JJP1WMVT1bul2BIKE0E7js73ie
         NjxV3l5Wot+j7iFyMoiWIsBSYRyEkJEirqLlwWVQQk5c7t6vwiJ/I0Vt7E2zn5iNwVWr
         GxQsN02J2q9BF4lSC+OANlvwCUsoRPOkaBszletdi36rRDbSNGmfAjHW6U/uCb6Ho7uX
         nImw==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
X-Forwarded-Encrypted: i=0; AJvYcCV4W7A9pGETQK3rqU5BNQ2WJg2WBTSzyM3mfdNB3OJqxcTmuFfRThb02B6oVB9bSTZEhErnWEic94scfzz32vI1x0U6RH1o
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w7-20020a0cf707000000b0068c79038276si2452424qvn.1.2024.02.02.09.31.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Feb 2024 09:31:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rVxNZ-0001l3-0s; Fri, 02 Feb 2024 12:31:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1rVxNT-0001kg-66; Fri, 02 Feb 2024 12:31:01 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1rVxNQ-0007p6-Ig; Fri, 02 Feb 2024 12:30:58 -0500
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4TRN5F4lDlz6K647;
 Sat,  3 Feb 2024 01:27:45 +0800 (CST)
Received: from lhrpeml500005.china.huawei.com (unknown [7.191.163.240])
 by mail.maildlp.com (Postfix) with ESMTPS id BC1471400D4;
 Sat,  3 Feb 2024 01:30:48 +0800 (CST)
Received: from localhost (10.202.227.76) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35; Fri, 2 Feb
 2024 17:30:48 +0000
Date: Fri, 2 Feb 2024 17:30:47 +0000
To: Peter Maydell <peter.maydell@linaro.org>
CC: Sia Jee Heng <jeeheng.sia@starfivetech.com>, <qemu-devel@nongnu.org>,
 <qemu-arm@nongnu.org>, <qemu-riscv@nongnu.org>, <mst@redhat.com>,
 <imammedo@redhat.com>, <anisinha@redhat.com>, <shannon.zhaosl@gmail.com>,
 <sunilvl@ventanamicro.com>, <palmer@dabbelt.com>, <alistair.francis@wdc.com>, 
 <bin.meng@windriver.com>, <liwei1518@gmail.com>, <dbarboza@ventanamicro.com>, 
 <zhiwei_liu@linux.alibaba.com>
Subject: Re: [RFC v1 3/3] hw/arm/virt-acpi-build.c: Enable CPU cache topology
Message-ID: <20240202173047.000053e9@Huawei.com>
In-Reply-To: <CAFEAcA80VjwM=uKEXfwtg9SVzX947of1Go2c0ph-r0DeyKbpMA@mail.gmail.com>
References: <20240129081423.116615-1-jeeheng.sia@starfivetech.com>
 <20240129081423.116615-4-jeeheng.sia@starfivetech.com>
 <20240129110823.000076df@Huawei.com>
 <CAFEAcA80VjwM=uKEXfwtg9SVzX947of1Go2c0ph-r0DeyKbpMA@mail.gmail.com>
Organization: Huawei Technologies Research and Development (UK) Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.33; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.202.227.76]
X-ClientProxiedBy: lhrpeml500003.china.huawei.com (7.191.162.67) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-to:  Jonathan Cameron <Jonathan.Cameron@Huawei.com>
From:  Jonathan Cameron via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: zdill2KBpbpL

On Thu, 1 Feb 2024 16:06:55 +0000
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Mon, 29 Jan 2024 at 11:08, Jonathan Cameron
> <Jonathan.Cameron@huawei.com> wrote:
> >
> > On Mon, 29 Jan 2024 00:14:23 -0800
> > Sia Jee Heng <jeeheng.sia@starfivetech.com> wrote:
> >  
> > > Introduced a 3-layer cache for the ARM virtual machine.
> > >
> > > Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>  
> >
> > There are a bunch of CPU registers that also need updating to reflect the
> > described cache.
> > https://lore.kernel.org/qemu-devel/20230808115713.2613-3-Jonathan.Cameron@huawei.com/
> > It's called HACK for a reason ;)
> > But there is some discussion about this issue in the thread.
> >
> > The l1 etc also needs to reflect the CPU model.  This stuff needs to match.
> > Wrong information being passed to a VM is probably worse than no information.  
> 
> Yes. The ACPI table information, if we provide it, should be
> being generated from the CPU cache ID registers.

That + some additional information I think.

> 
> But I'm a bit confused about why the ACPI table has the cache
> topology in it -- can't the guest read the cache ID registers
> and figure it out for itself?

That's a philosophy question for the ARM architects :)

The registers focus on correctness (so what you need to flush etc,
where the point of coherence is and other fun)
not all the info needed for performance tuning. There is some stuff
on the cache type that I guess is more perf tuning related (sets etc)


They probably could have expanded the CPU registers to provide a lot
more information (which is what x86 effectively does). IIRC what is
there today for ARM is pretty much useless for anything placement
decision related (scheduling etc)  You can't tell what shares a cache
(or more fun cluster topology structures). 

It is hard in registers to define a nice flexible graph where
all sorts of fun topology of the system can be described.
PPTT provides that opportunity for a richer description.
Sure you could squirt out the equivalent table via registers,
but what's the point given we have firmware tables for this
sort of thing..

Jonathan


 

> 
> thanks
> -- PMM

