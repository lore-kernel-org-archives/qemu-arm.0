Received: by 2002:a05:6000:188:0:0:0:0 with SMTP id p8csp6083547wrx;
        Wed, 6 Mar 2019 08:21:07 -0800 (PST)
X-Google-Smtp-Source: APXvYqwOuTlo2kfJxm+CYW04phXVgucvajfFJ/jsPaHf4XB314hOOKZ0OvqJWAODoky67lUNOU5A
X-Received: by 2002:a81:6f8a:: with SMTP id k132mr6054441ywc.469.1551889267469;
        Wed, 06 Mar 2019 08:21:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1551889267; cv=none;
        d=google.com; s=arc-20160816;
        b=THk2sTi/yVCZsbpbt6mHuEVihr82Y0heGfVLQyBI7n/fz67C7z2AmA6o30d4r9rhXB
         wyDibod7W+5lmwdJpju6WKiMsa7bEG0nuyEM5x/zAVrdUhxsdIZD4790C2Nb0yXcZx3M
         XMYWBseNhSNJy7EGDP+apug7CO4d7v4KN4s2Yv0HfSi62KUgfP7m2g288akH/BTduToB
         sLZqWEf9Y2jVEyrpDhwt8adYBDVC0+78t8dV0yav32OwM/GymYb+uQpuhFmxJLQa16is
         dcKZ11YWHnYXdYqTPE7mUF3cPoXG0qGwe7V0dtpS4GmaObfdrO9YB7pLNxt075Outr1U
         YEMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:to:from:date;
        bh=Sequn7EhXzuRyFbs4Qw3zlhLIR5++L22FoGUUmWdEmc=;
        b=bRkIMR24RGQ+tyv8n4TA9k77tbHlGlq2q9LiKhez9ZK8X/I5GhnsZbAuthGx3KTpDI
         D97KhG1onYJWeYM4G3+fPb2kFfb7Nwgai4fembo0vR/YhCq+41ctudIA3MurTIc73Rdg
         bP5/vd+vWIHD1VMNwsRENr4z/TsXF7sheiTFQUku4B0qqC0A/taqXmGLEWr83laJxvv8
         wgemxN0z+zCFtN/FOnQDl1v+4SCdyOWLYc23mb9knjmWF7qxU+2CI0nOohEwlYhRQ7SL
         lJGelPKq+qpG3HAc2DPCt++zQBKG4R4EaAxagNN8T1yLoyfBUmi1ivxqXFATeZarIfZ8
         4qXQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j195si1071254ybj.369.2019.03.06.08.21.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 06 Mar 2019 08:21:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:35685 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h1ZI2-0001Pi-QZ
	for alex.bennee@linaro.org; Wed, 06 Mar 2019 11:21:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40521)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h1ZHw-0001PA-Bw
	for qemu-arm@nongnu.org; Wed, 06 Mar 2019 11:21:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1h1ZHu-0001ph-BW
	for qemu-arm@nongnu.org; Wed, 06 Mar 2019 11:21:00 -0500
Received: from mx1.redhat.com ([209.132.183.28]:60960)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1h1ZHq-0001m8-Jj; Wed, 06 Mar 2019 11:20:56 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EF29081107;
	Wed,  6 Mar 2019 16:20:52 +0000 (UTC)
Received: from Igors-MacBook-Pro.local (ovpn-112-17.ams2.redhat.com
	[10.36.112.17])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 76CE4600C5;
	Wed,  6 Mar 2019 16:20:47 +0000 (UTC)
Date: Wed, 6 Mar 2019 17:20:45 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Heyi Guo <guoheyi@huawei.com>
Message-ID: <20190306172045.14a58996@Igors-MacBook-Pro.local>
In-Reply-To: <b904272b-9eca-36e7-d24b-4c84b6c4f4af@huawei.com>
References: <1551823429-1440-1-git-send-email-guoheyi@huawei.com>
	<20190306113354.5a98654b@redhat.com>
	<b904272b-9eca-36e7-d24b-4c84b6c4f4af@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Wed, 06 Mar 2019 16:20:53 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 1/2] hw/arm/acpi: simplify
 AML bit and/or statement
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
	wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uIQA9GQ0ddaU

On Wed, 6 Mar 2019 21:09:11 +0800
Heyi Guo <guoheyi@huawei.com> wrote:

> Sorry, I didn't know the indention policy of qemu code. So we need to indent the 2nd line just after the parentheses it belongs to?

See "[PATCH v6 0/2] CODING_STYLE: trivial update" for clarification

> 
> Will change that and send next version.
> 
> Thanks,
> 
> Heyi
> 
> 
> On 2019/3/6 18:33, Igor Mammedov wrote:
> > On Wed, 6 Mar 2019 06:03:48 +0800
> > Heyi Guo <guoheyi@huawei.com> wrote:
> >
> >> The last argument of AML bit and/or statement is the target variable,
> >> so we don't need to use a NULL target and then an additional store
> >> operation; a single bit and/or statement is enough.
> >>
> >> Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
> >> Cc: Peter Maydell <peter.maydell@linaro.org>
> >> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> >> Cc: Igor Mammedov <imammedo@redhat.com>
> >> Suggested-by: Igor Mammedov <imammedo@redhat.com>
> >> Signed-off-by: Heyi Guo <guoheyi@huawei.com>
> >> ---
> >>   hw/arm/virt-acpi-build.c | 8 ++++----
> >>   1 file changed, 4 insertions(+), 4 deletions(-)
> >>
> >> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> >> index 04b62c7..1c84e87 100644
> >> --- a/hw/arm/virt-acpi-build.c
> >> +++ b/hw/arm/virt-acpi-build.c
> >> @@ -265,16 +265,16 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
> >>           aml_create_dword_field(aml_arg(3), aml_int(8), "CDW3"));
> >>       aml_append(ifctx, aml_store(aml_name("CDW2"), aml_name("SUPP")));
> >>       aml_append(ifctx, aml_store(aml_name("CDW3"), aml_name("CTRL")));
> >> -    aml_append(ifctx, aml_store(aml_and(aml_name("CTRL"), aml_int(0x1D), NULL),
> >> +    aml_append(ifctx, aml_and(aml_name("CTRL"), aml_int(0x1D),
> >>                                   aml_name("CTRL")));
> > pls fix indent in all such cases. I'd align it like this:
> >     aml_append(ifctx,
> >                aml_and(aml_name("CTRL"), aml_int(0x1D), aml_name("CTRL")));
> >
> > or
> >     aml_append(ifctx, aml_and(aml_name("CTRL"), aml_int(0x1D),
> >                               aml_name("CTRL")));
> >
> >
> > PS:
> > When making multi-patch series use --cover-letter git option
> >
> >>   
> >>       ifctx1 = aml_if(aml_lnot(aml_equal(aml_arg(1), aml_int(0x1))));
> >> -    aml_append(ifctx1, aml_store(aml_or(aml_name("CDW1"), aml_int(0x08), NULL),
> >> +    aml_append(ifctx1, aml_or(aml_name("CDW1"), aml_int(0x08),
> >>                                    aml_name("CDW1")));
> >>       aml_append(ifctx, ifctx1);
> >>   
> >>       ifctx1 = aml_if(aml_lnot(aml_equal(aml_name("CDW3"), aml_name("CTRL"))));
> >> -    aml_append(ifctx1, aml_store(aml_or(aml_name("CDW1"), aml_int(0x10), NULL),
> >> +    aml_append(ifctx1, aml_or(aml_name("CDW1"), aml_int(0x10),
> >>                                    aml_name("CDW1")));
> >>       aml_append(ifctx, ifctx1);
> >>   
> >> @@ -283,7 +283,7 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
> >>       aml_append(method, ifctx);
> >>   
> >>       elsectx = aml_else();
> >> -    aml_append(elsectx, aml_store(aml_or(aml_name("CDW1"), aml_int(4), NULL),
> >> +    aml_append(elsectx, aml_or(aml_name("CDW1"), aml_int(4),
> >>                                     aml_name("CDW1")));
> >>       aml_append(elsectx, aml_return(aml_arg(3)));
> >>       aml_append(method, elsectx);
> >
> > .
> >
> 
> 
> 

