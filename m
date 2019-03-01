Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp699979wrx;
        Fri, 1 Mar 2019 06:40:06 -0800 (PST)
X-Google-Smtp-Source: APXvYqzaSmQR1jSPoxup7lQIy2zGXOXdWK+7Z5WmMvxY644w8X6kZE11lIaIEm9vtoXrch0oNbn+
X-Received: by 2002:a81:9a8d:: with SMTP id r135mr3804170ywg.188.1551451205993;
        Fri, 01 Mar 2019 06:40:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551451205; cv=none;
        d=google.com; s=arc-20160816;
        b=ct8+zt8y7rAK3VXLEzSFDku5zkDhKTHfy5STCzyG8r8xxSvEqUo65WEit9whk+X4+c
         ynCW7KWa7zxk3nvlel8+DJu+s554bLnzs7hI9Unqr/3IyNI2NRm4aZVN3kVgg8yGrHFd
         Y3enQFD6q0RH3+2v32EAIhM0sItyAkTFdexbR13M3GT3CQ9rZVSqAr/DxXFeSyAiokcq
         RnyHmnHEDIc116dFzrVlk1cX7navmDTHBYP3zPV7HXmJHzShvdka6UN9gXuJyH3zypYN
         US6jMn1hIxdc50BUUOHvM7c0tPAlBBLl/dH92R/CR6ydITS8mNc2RI0E84VOZOX+f3Fy
         1Ydw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=4vDl0ddbKyULzNEV031ijfPVVYPebEIlAmz8HyMt3oY=;
        b=zw7qxCLFdYkzFiF3MKLW6t3cuL9dEh9yLy23gqCTNzoWMMoBzl3+PL4k5XBaz7kC7x
         sem4okegQK9yblKZZvFG0oWmTQHGhegbLDMLwQ6ozxt4DAFnSj3mOpObBk62+S+tOFzw
         TUEyrj1UDr74VinnLVDvKZesi0hrAzIBvTMTcMK6pfkc+cLu9nF6mBCu//S8uFHc/BWo
         ZiLYLJmOk2LIrMYi+o+Mnu3UsUoFO8XAL7HK9P8aTly45T93sxwoa+6c8HFfhn80DtNC
         /ieQG9wbM324eoeEcCfPjyMtjOrSQmJPoZLlQTWv6xzLG04HzLCjlNeYklOcO8gI+Lt5
         19fA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z128si12605967ywf.445.2019.03.01.06.40.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Mar 2019 06:40:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:38843 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gzjKX-0004Oe-Dc
	for alex.bennee@linaro.org; Fri, 01 Mar 2019 09:40:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39456)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gzjE2-0007do-6K
	for qemu-devel@nongnu.org; Fri, 01 Mar 2019 09:33:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1gzjE1-0004WN-96
	for qemu-devel@nongnu.org; Fri, 01 Mar 2019 09:33:22 -0500
Received: from mx1.redhat.com ([209.132.183.28]:32854)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1gzjDw-0004Ob-92; Fri, 01 Mar 2019 09:33:16 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5BF0C9090D;
	Fri,  1 Mar 2019 14:33:14 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BAE0A1001DF7;
	Fri,  1 Mar 2019 14:33:12 +0000 (UTC)
Date: Fri, 1 Mar 2019 15:33:11 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20190301153311.79c0d287@redhat.com>
In-Reply-To: <20190301091214-mutt-send-email-mst@kernel.org>
References: <1551407310-32413-1-git-send-email-guoheyi@huawei.com>
	<20190301084619-mutt-send-email-mst@kernel.org>
	<cc3c8e42-0632-0c90-41cc-27bfdcaef11d@huawei.com>
	<20190301091214-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 01 Mar 2019 14:33:14 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] hw/arm/acpi: enable SHPC native hot plug
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	Heyi Guo <heyi.guo@linaro.org>, qemu-arm@nongnu.org,
	Heyi Guo <guoheyi@huawei.com>, wanghaibin.wang@huawei.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: M0aiMsUdFooi

On Fri, 1 Mar 2019 09:12:33 -0500
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Fri, Mar 01, 2019 at 10:04:38PM +0800, Heyi Guo wrote:
> > 
> > 
> > On 2019/3/1 21:47, Michael S. Tsirkin wrote:  
> > > On Fri, Mar 01, 2019 at 10:28:30AM +0800, Heyi Guo wrote:  
> > > > After the introduction of generic PCIe root port and PCIe-PCI bridge,
> > > > we will also have SHPC controller on ARM, so just enalbe SHPC native
> > > > hot plug.
> > > > 
> > > > Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
> > > > Cc: Peter Maydell <peter.maydell@linaro.org>
> > > > Cc: "Michael S. Tsirkin" <mst@redhat.com>
> > > > Cc: Igor Mammedov <imammedo@redhat.com>
> > > > Signed-off-by: Heyi Guo <guoheyi@huawei.com>
> > > > Signed-off-by: Heyi Guo <heyi.guo@linaro.org>  
> > > 
> > > So when OS enables SHPC, should we block ACPI hotplug events?  
> > I supposed we don't support ACPI hotplug events on ARM virt; do we have any currently?
> > 
> > Thanks,
> > Heyi  
> 
> Oh I didn't realise. That explains it sorry about the noise.
And I thought we did not support them on PCIe completely (I mean q35/ich9).
(Or did I miss something)?

> 
> > >   
> > > > ---
> > > >   hw/arm/virt-acpi-build.c | 7 ++++++-
> > > >   1 file changed, 6 insertions(+), 1 deletion(-)
> > > > 
> > > > diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> > > > index 04b62c7..7849ec5 100644
> > > > --- a/hw/arm/virt-acpi-build.c
> > > > +++ b/hw/arm/virt-acpi-build.c
> > > > @@ -265,7 +265,12 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
> > > >           aml_create_dword_field(aml_arg(3), aml_int(8), "CDW3"));
> > > >       aml_append(ifctx, aml_store(aml_name("CDW2"), aml_name("SUPP")));
> > > >       aml_append(ifctx, aml_store(aml_name("CDW3"), aml_name("CTRL")));
> > > > -    aml_append(ifctx, aml_store(aml_and(aml_name("CTRL"), aml_int(0x1D), NULL),
> > > > +
> > > > +    /*
> > > > +     * Allow OS control for all 5 features:
> > > > +     * PCIeHotplug SHPCHotplug PME AER PCIeCapability.
> > > > +     */
> > > > +    aml_append(ifctx, aml_store(aml_and(aml_name("CTRL"), aml_int(0x1F), NULL),
> > > >                                   aml_name("CTRL")));
> > > >       ifctx1 = aml_if(aml_lnot(aml_equal(aml_arg(1), aml_int(0x1))));
> > > > -- 
> > > > 1.8.3.1  
> > > .
> > >   
> >   

