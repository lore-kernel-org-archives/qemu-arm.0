Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp787967wrx;
        Fri, 1 Mar 2019 08:04:59 -0800 (PST)
X-Google-Smtp-Source: APXvYqxYzCGMAsafbqJbZRWkMvMxw7BQiZz3LAla9IlhwV75iRomWqe2TlCOOza9hIGyrZvEOl+R
X-Received: by 2002:a25:5454:: with SMTP id i81mr4876322ybb.142.1551456299167;
        Fri, 01 Mar 2019 08:04:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551456299; cv=none;
        d=google.com; s=arc-20160816;
        b=q+QRly9ml0yEQ5WjNm2+pM7ZomcWoxTCXGGq63nwT93CA8/tOkbFk9Ck+KGPy+3b0I
         yhiOTi05IE5RLptXC3irCiHzT5PBBElsfHIJicnuofX4VgrHzsB4J356ymegI2hElf3A
         ITe1DpURa7KusCY4Ja8SOlVH/ycZnTcsK6YMWM5L+HfdlIpIwTtTDyH0OLrhMHQ51I18
         SGS1RZVWW1C550YREwza55rJtcPj9Q+YYvZbfp2+JW+LpX96agRAoPxWmbQrSOdQJy+Q
         Tkocbs8WlCl2fUah3V6hcdiONEUV2rMmssmjCwRopMYXumi4hWZp0vR55RB3tww0uaSV
         LUCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=FgNUNpSNqECBnjX3eThe0Snb6v6PuE5N9vzkpNhK7W0=;
        b=ZulBXZNvkX6z3yhwlGtJ/lHeC7J6OL6WT5te+ffXNP4o8RJXB1keO8X964XWPK4q8M
         zLxUuxC2+e6Fk8WsiNdkpikyk66i4SuXMYmLeDBFqvQH5uxsQ513hJIuPakgcAYPFRQ9
         xEVoO2s3NeT22uZ3R7qHPmeD0McVv0BLI2AVvyxdP6Z82xsEKI4q8KgzAM5a66GWvDZD
         s3DW/i7yMs5D4mVP7rZC7A+TxF+fh/YavjzXP4jDFdmbn5J5I+3v0uYkmj5xbuK6KEVw
         3P55txGnzOGqMQUW3NCbUXGTCLIP/MGacR5wzKAjhULx0+kviHHmu/QK5Gn/TSjs7u40
         l8Mg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r145si13183592ywe.178.2019.03.01.08.04.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 01 Mar 2019 08:04:59 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:39820 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gzkeg-0002ax-Kn
	for alex.bennee@linaro.org; Fri, 01 Mar 2019 11:04:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51830)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1gzkPw-0007MT-EC
	for qemu-arm@nongnu.org; Fri, 01 Mar 2019 10:49:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1gzkPv-0000qq-Ec
	for qemu-arm@nongnu.org; Fri, 01 Mar 2019 10:49:44 -0500
Received: from mail-qt1-f194.google.com ([209.85.160.194]:36674)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mst@redhat.com>) id 1gzkPv-0000pg-A6
	for qemu-arm@nongnu.org; Fri, 01 Mar 2019 10:49:43 -0500
Received: by mail-qt1-f194.google.com with SMTP id p25so28262942qtb.3
	for <qemu-arm@nongnu.org>; Fri, 01 Mar 2019 07:49:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to;
	bh=FgNUNpSNqECBnjX3eThe0Snb6v6PuE5N9vzkpNhK7W0=;
	b=Tiz6VzzF82fdN3jDh14AC0aPcb73qPK04xfEXH1YKhkOGyb652SG9z1EWTPghbL3Z0
	/Mp/55sm5cToUlPlw5qX27J0IYDiDIbzer+OOBD4okLBAR62a0QbQgB1QUyKQb37I66y
	LKKEku/waSlU2836mGr0uLz0NyItenzYDeBrOFBaVGmJg1KSK3RO/Y/le6qIfa5c9G3m
	tV6rlRCh3C+aXfLelXqjgBll54/0lukhyjpcRK33zHfruY7raafssj2w9apOEwJ17ISg
	rAv65kDNvxrzFmX9gRTw4GBeTvYB0r+WmcRfmedQN2VbTlvne8ixcOl2VkPCPOoalyRQ
	qnPQ==
X-Gm-Message-State: APjAAAX0zBZdDIsg1jAgnfmBgUEkQ9CSsyw332Idtp+AfKTrSK229IKF
	V/fFZRuHba47+2ZmlXyDoKB1lg==
X-Received: by 2002:a0c:8afc:: with SMTP id 57mr4162071qvw.99.1551455382716;
	Fri, 01 Mar 2019 07:49:42 -0800 (PST)
Received: from redhat.com (pool-173-76-246-42.bstnma.fios.verizon.net.
	[173.76.246.42]) by smtp.gmail.com with ESMTPSA id
	w20sm11130665qki.35.2019.03.01.07.49.41
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 01 Mar 2019 07:49:42 -0800 (PST)
Date: Fri, 1 Mar 2019 10:49:39 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Message-ID: <20190301104928-mutt-send-email-mst@kernel.org>
References: <1551407310-32413-1-git-send-email-guoheyi@huawei.com>
	<20190301084619-mutt-send-email-mst@kernel.org>
	<cc3c8e42-0632-0c90-41cc-27bfdcaef11d@huawei.com>
	<20190301091214-mutt-send-email-mst@kernel.org>
	<20190301153311.79c0d287@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190301153311.79c0d287@redhat.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.160.194
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
	Heyi Guo <guoheyi@huawei.com>, wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vsqc40R3htiA

On Fri, Mar 01, 2019 at 03:33:11PM +0100, Igor Mammedov wrote:
> On Fri, 1 Mar 2019 09:12:33 -0500
> "Michael S. Tsirkin" <mst@redhat.com> wrote:
> 
> > On Fri, Mar 01, 2019 at 10:04:38PM +0800, Heyi Guo wrote:
> > > 
> > > 
> > > On 2019/3/1 21:47, Michael S. Tsirkin wrote:  
> > > > On Fri, Mar 01, 2019 at 10:28:30AM +0800, Heyi Guo wrote:  
> > > > > After the introduction of generic PCIe root port and PCIe-PCI bridge,
> > > > > we will also have SHPC controller on ARM, so just enalbe SHPC native
> > > > > hot plug.
> > > > > 
> > > > > Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
> > > > > Cc: Peter Maydell <peter.maydell@linaro.org>
> > > > > Cc: "Michael S. Tsirkin" <mst@redhat.com>
> > > > > Cc: Igor Mammedov <imammedo@redhat.com>
> > > > > Signed-off-by: Heyi Guo <guoheyi@huawei.com>
> > > > > Signed-off-by: Heyi Guo <heyi.guo@linaro.org>  
> > > > 
> > > > So when OS enables SHPC, should we block ACPI hotplug events?  
> > > I supposed we don't support ACPI hotplug events on ARM virt; do we have any currently?
> > > 
> > > Thanks,
> > > Heyi  
> > 
> > Oh I didn't realise. That explains it sorry about the noise.
> And I thought we did not support them on PCIe completely (I mean q35/ich9).
> (Or did I miss something)?

True for PCIe.

> > 
> > > >   
> > > > > ---
> > > > >   hw/arm/virt-acpi-build.c | 7 ++++++-
> > > > >   1 file changed, 6 insertions(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> > > > > index 04b62c7..7849ec5 100644
> > > > > --- a/hw/arm/virt-acpi-build.c
> > > > > +++ b/hw/arm/virt-acpi-build.c
> > > > > @@ -265,7 +265,12 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
> > > > >           aml_create_dword_field(aml_arg(3), aml_int(8), "CDW3"));
> > > > >       aml_append(ifctx, aml_store(aml_name("CDW2"), aml_name("SUPP")));
> > > > >       aml_append(ifctx, aml_store(aml_name("CDW3"), aml_name("CTRL")));
> > > > > -    aml_append(ifctx, aml_store(aml_and(aml_name("CTRL"), aml_int(0x1D), NULL),
> > > > > +
> > > > > +    /*
> > > > > +     * Allow OS control for all 5 features:
> > > > > +     * PCIeHotplug SHPCHotplug PME AER PCIeCapability.
> > > > > +     */
> > > > > +    aml_append(ifctx, aml_store(aml_and(aml_name("CTRL"), aml_int(0x1F), NULL),
> > > > >                                   aml_name("CTRL")));
> > > > >       ifctx1 = aml_if(aml_lnot(aml_equal(aml_arg(1), aml_int(0x1))));
> > > > > -- 
> > > > > 1.8.3.1  
> > > > .
> > > >   
> > >   
