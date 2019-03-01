Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp670386wrx;
        Fri, 1 Mar 2019 06:12:51 -0800 (PST)
X-Google-Smtp-Source: APXvYqxh9UBM3pVEDVzQ1v8/OrRXSL6FD4Uoz1a0CxL+Bu3DaBWX8exujevKifNP4U5IuH4ZBFTN
X-Received: by 2002:a81:3a81:: with SMTP id h123mr3835016ywa.412.1551449571184;
        Fri, 01 Mar 2019 06:12:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551449571; cv=none;
        d=google.com; s=arc-20160816;
        b=qssr/ZRnaPMNjCo/s9Be68a6ZDuR9ayE+NcjqQzzC03GZQobBEwXKaOPi1GQ+psEwd
         1n/oInj0Hwy4UgqG2baCseDl4/NViz5+y3VKislLSSEvF0Wf/wOVkRJxK4RROKghQZFd
         sm1kpUkp2ZOeclJC9NTJFrmwLMevWY6/Z1hftNLhQ4OkocbmRR04sONgBaM6y3nIYQfx
         wFv8OtUKXrzNbvh8yoKC1XkJP8+iBJ3cS7KG3G7iD18lX2Oqjw3kICCgjxNkHHs4Bgbv
         nt+OzN7XpqR4m6jRPUVQmQm+j0iu2jqax+zoSzFU+ZqVTbteqEvBJ6q4MjfjlM/VlkUg
         6LKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=+dMiCPWxmaW/0jFq3Yp75rEbIM/jC8QMIxErXKhg7Pc=;
        b=cWCPFm6TZ8cqkvN6l8BhSPtfZ7t6BnTV9xmTe1MCMOqIzyzSEPfM1uHgU8Ybi/fasd
         wXazE+A7UPeaWCwsviwyoi5Ki/ZJoQURMv70BY9KmpmTZnO1tadzA6vTt3D0hYbdbX+t
         KGnR91C0IMmDvaQo8LuzHDGWuZ85soT2L177Wlc3xkIFsN2mVNRq2/u5vtRsxnIePyts
         z3eI7HXZ3lUHcZxbyTUDp0OEDD7fWTHXjC0RpvL/nwhdoVpKJJXNZGWp5mtp0hIEAb0u
         sbNpmP5hep4Ss0H4zmQ+1abcC5CRYVJ0RLYiCHdK2O64mh+Adw8Ng68wMleaPQA72uSI
         fovg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w5si12524761ybp.383.2019.03.01.06.12.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Mar 2019 06:12:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:38545 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gziuA-0003r9-M3
	for alex.bennee@linaro.org; Fri, 01 Mar 2019 09:12:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36405)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1gziu3-0003qn-5M
	for qemu-arm@nongnu.org; Fri, 01 Mar 2019 09:12:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1gzity-0000iM-KA
	for qemu-arm@nongnu.org; Fri, 01 Mar 2019 09:12:40 -0500
Received: from mail-qt1-f196.google.com ([209.85.160.196]:39335)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mst@redhat.com>) id 1gzity-0000eQ-FM
	for qemu-arm@nongnu.org; Fri, 01 Mar 2019 09:12:38 -0500
Received: by mail-qt1-f196.google.com with SMTP id o6so27834482qtk.6
	for <qemu-arm@nongnu.org>; Fri, 01 Mar 2019 06:12:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=+dMiCPWxmaW/0jFq3Yp75rEbIM/jC8QMIxErXKhg7Pc=;
	b=ZPxoPdpUAscVkIjrgOhM10AN7Vnat0OB8sOd848oE7psBE+OON5M3ztG1zd/c68ERS
	udrDXbmV1/6LHtzG4oxa1RYfRupCKmeEy+B1Knoy6Phl+2xtOhf9tN0yKkUO0fCBa1tf
	Ow0r3urNNZD6QeaMLMGJbAUfHyxeAqfyxcpxYzzseTwmy75N3rYEYpo/Khq3UyVAQxRZ
	SVzOzsQjUyAEj3xAOrssFwKJjdj9O6DQPitiOdQPpY44kbtSpuanC59u5croibWH3YR5
	gL8XedAUI12gbwu2jUKYwqqUlplgDZWe7ISpUOlHDqmjxgZSY8JOpvFAWGWyoVonyL36
	nMyw==
X-Gm-Message-State: APjAAAUjitxK0W5tYJQU8ogcXtE3oYM8euelEKOWrYd74ZuJDWsCWafI
	RZ2uGjyQF4psNgYvEHUryddU+g==
X-Received: by 2002:ac8:1b6b:: with SMTP id p40mr3915332qtk.155.1551449556163; 
	Fri, 01 Mar 2019 06:12:36 -0800 (PST)
Received: from redhat.com (pool-173-76-246-42.bstnma.fios.verizon.net.
	[173.76.246.42]) by smtp.gmail.com with ESMTPSA id
	t38sm17869045qtc.12.2019.03.01.06.12.34
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 01 Mar 2019 06:12:35 -0800 (PST)
Date: Fri, 1 Mar 2019 09:12:33 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Heyi Guo <guoheyi@huawei.com>
Message-ID: <20190301091214-mutt-send-email-mst@kernel.org>
References: <1551407310-32413-1-git-send-email-guoheyi@huawei.com>
	<20190301084619-mutt-send-email-mst@kernel.org>
	<cc3c8e42-0632-0c90-41cc-27bfdcaef11d@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc3c8e42-0632-0c90-41cc-27bfdcaef11d@huawei.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.160.196
Subject: Re: [Qemu-arm] [PATCH] hw/arm/acpi: enable SHPC native hot plug
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	Heyi Guo <heyi.guo@linaro.org>, qemu-arm@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>, wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bh1LbL3lrRPx

On Fri, Mar 01, 2019 at 10:04:38PM +0800, Heyi Guo wrote:
> 
> 
> On 2019/3/1 21:47, Michael S. Tsirkin wrote:
> > On Fri, Mar 01, 2019 at 10:28:30AM +0800, Heyi Guo wrote:
> > > After the introduction of generic PCIe root port and PCIe-PCI bridge,
> > > we will also have SHPC controller on ARM, so just enalbe SHPC native
> > > hot plug.
> > > 
> > > Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
> > > Cc: Peter Maydell <peter.maydell@linaro.org>
> > > Cc: "Michael S. Tsirkin" <mst@redhat.com>
> > > Cc: Igor Mammedov <imammedo@redhat.com>
> > > Signed-off-by: Heyi Guo <guoheyi@huawei.com>
> > > Signed-off-by: Heyi Guo <heyi.guo@linaro.org>
> > 
> > So when OS enables SHPC, should we block ACPI hotplug events?
> I supposed we don't support ACPI hotplug events on ARM virt; do we have any currently?
> 
> Thanks,
> Heyi

Oh I didn't realise. That explains it sorry about the noise.

> > 
> > > ---
> > >   hw/arm/virt-acpi-build.c | 7 ++++++-
> > >   1 file changed, 6 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> > > index 04b62c7..7849ec5 100644
> > > --- a/hw/arm/virt-acpi-build.c
> > > +++ b/hw/arm/virt-acpi-build.c
> > > @@ -265,7 +265,12 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
> > >           aml_create_dword_field(aml_arg(3), aml_int(8), "CDW3"));
> > >       aml_append(ifctx, aml_store(aml_name("CDW2"), aml_name("SUPP")));
> > >       aml_append(ifctx, aml_store(aml_name("CDW3"), aml_name("CTRL")));
> > > -    aml_append(ifctx, aml_store(aml_and(aml_name("CTRL"), aml_int(0x1D), NULL),
> > > +
> > > +    /*
> > > +     * Allow OS control for all 5 features:
> > > +     * PCIeHotplug SHPCHotplug PME AER PCIeCapability.
> > > +     */
> > > +    aml_append(ifctx, aml_store(aml_and(aml_name("CTRL"), aml_int(0x1F), NULL),
> > >                                   aml_name("CTRL")));
> > >       ifctx1 = aml_if(aml_lnot(aml_equal(aml_arg(1), aml_int(0x1))));
> > > -- 
> > > 1.8.3.1
> > .
> > 
> 
