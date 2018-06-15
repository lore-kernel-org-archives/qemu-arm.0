Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp1072371wrq;
        Fri, 15 Jun 2018 09:53:47 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKK8PHaizbv9Y0GghMs337JaPcu6ssP8Jrl/kT+0ydm9vaJtt4nD3VWxhlFIil1YE3UmTtDN
X-Received: by 2002:aed:3a24:: with SMTP id n33-v6mr2287071qte.348.1529081627886;
        Fri, 15 Jun 2018 09:53:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529081627; cv=none;
        d=google.com; s=arc-20160816;
        b=B1E+8VgqRKvm63bynxPdXIebg8xF3LWqEOZU/Wvdep3eS+xhKerNDcN6L/SDonJcEo
         LVpYSCnAPv/OUiid2UxQvZbyrl7mVp7H+5EBkBlM6DY8W9Sd18ZtUa7QWh47SoILEc6q
         /La3u5wT+ctG8qlzm3t6eYP+BAdwa6na14epaEswXJVqJjnLXav53Vl8NnSVX3TkiPvZ
         FxP1gqt4nKmExooTe2mG5ZLLaaPA12XO8V4ihgkXhgo5R00fUkZ5ZALlHyGaqYZ4CVQt
         ixluemH/kTUSS43UPAUNfku8evegGja9sd5d6bOzqEuKX0hmgwpaEFt7sEIAI0h29h33
         aKYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=B3/+B5SzyAggeXoYdKP+XioBd6LL9PJEKzN/DmntP84=;
        b=yzCU1/NHcpE9A1rBzeB3tPOwra3W5b7zq7QIHiNU7gcV/xZKTJQ9GzVBfGoAPqmMuD
         GiR/t+urXPa7CZTUY6xzFUu/ovScginLsswb+81D+1/5/IqacdHhoZ7y5vAnkpvRQ2jm
         AyXTOgfgyooW/sK8pul/UvnxdzMbgfvsyl9DD8XlnqxTfVUPTDky/rdPFyyteZOcQCPa
         QV66bPfIE2Zg/wR4M2cTqJoAxP3KMbvYXAgFZpdd/d9vXuravxDhEmqeIPNkhNX3bBgj
         0bAsUif2DoU7Z0kOX/IZ5N5R/V3T8LBmuL1COWlmxWJQO7CVD7yyoeKzXCmNPKitsun1
         IPfA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QvqizkTv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l89-v6si1435915qva.3.2018.06.15.09.53.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Jun 2018 09:53:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QvqizkTv;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48295 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fTryt-0001AD-Bp
	for alex.bennee@linaro.org; Fri, 15 Jun 2018 12:53:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41953)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fTrf9-0001NW-Ix
	for qemu-devel@nongnu.org; Fri, 15 Jun 2018 12:33:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fTrf8-00064e-Ph
	for qemu-devel@nongnu.org; Fri, 15 Jun 2018 12:33:23 -0400
Received: from mail-ot0-x229.google.com ([2607:f8b0:4003:c0f::229]:34049)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fTrf8-00064I-Kk
	for qemu-devel@nongnu.org; Fri, 15 Jun 2018 12:33:22 -0400
Received: by mail-ot0-x229.google.com with SMTP id r18-v6so11660503otk.1
	for <qemu-devel@nongnu.org>; Fri, 15 Jun 2018 09:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=B3/+B5SzyAggeXoYdKP+XioBd6LL9PJEKzN/DmntP84=;
	b=QvqizkTvpyVar2JSjAvVgMbMS/dpgiEP8YD8SAWJFMBhYxnEeMKOej/dNmxGFPsRRY
	0VNHhIB1YrRSWWFPH0Plnc37oBNTmkNQwDN27CQYKQmIT7JdfGc4htrzek5MCf6X447q
	gX/ZLNnrK6OHhe/MSe2anTDSdE5bBqzntK0/A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=B3/+B5SzyAggeXoYdKP+XioBd6LL9PJEKzN/DmntP84=;
	b=G+Zi772TmPxaVHC5YTGBv0l73nbyAUf06XF7KahRqeSrJGZWnELmZdcPVut0Kdky/C
	0aTstoCwcvxVEnVLdMkgiYLttZPfIHlmARJfCy2cX8JDL6EJRhBT/sufVlR/fm70r/VU
	KUb5ANXdueK63nbjrIHcS/swaGAI1muYsyrN+UOiYpbMbsrIL64LH9TgPVuDR1fgH21N
	qntcSnrT8BRc3u5vIREXBwgezd+9rY796v+oD9ekO4KCxUJEdulBkexdxkX2uldSRp9z
	0RCaDPvbzBUtBHxgwRtY4gXmWolfP8FIYyrXExoGYJT2du1CmXhgGElpfwOVCW6zQchX
	WBAA==
X-Gm-Message-State: APt69E0Aw0GlABgxSGPzKrbhYC2f+jYUXpG+QRsrJtgYs7u6vL45KpTt
	IUP5wCokoL+VZjiL5pxbQWlAoKn6Ea7adCfy4T0UOA==
X-Received: by 2002:a9d:2371:: with SMTP id
	k46-v6mr1557385otd.210.1529080401966; 
	Fri, 15 Jun 2018 09:33:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40d3:0:0:0:0:0 with HTTP; Fri, 15 Jun 2018 09:33:01
	-0700 (PDT)
In-Reply-To: <333cd485-dc75-d295-16fd-98a1108e1e15@redhat.com>
References: <20180516152026.2920-1-shameerali.kolothum.thodi@huawei.com>
	<20180516152026.2920-7-shameerali.kolothum.thodi@huawei.com>
	<bd67ed40-81d6-58dc-ccaf-efd8a40ca96f@redhat.com>
	<5FC3163CFD30C246ABAA99954A238FA8386F6E04@FRAEML521-MBX.china.huawei.com>
	<20180615154441.4rr5mtcnran5cf3s@kamzik.brq.redhat.com>
	<CAFEAcA-nG4Xv=PmxzW3tzs-TStziMDHMFxYi6_teSe1GhLH=hw@mail.gmail.com>
	<333cd485-dc75-d295-16fd-98a1108e1e15@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 15 Jun 2018 17:33:01 +0100
Message-ID: <CAFEAcA-+Xp6B_g_a89-7wP_DN1ftGrKTON=P6wH_6ESq9GPKKQ@mail.gmail.com>
To: Auger Eric <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::229
Subject: Re: [Qemu-devel] [RFC v2 6/6] hw/arm: Populate non-contiguous
 memory regions
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
Cc: Andrew Jones <drjones@redhat.com>, Zhaoshenglong <zhaoshenglong@huawei.com>,
	Linuxarm <linuxarm@huawei.com>,
	Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	"imammedo@redhat.com" <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8Rm1BXddOIJg

On 15 June 2018 at 17:13, Auger Eric <eric.auger@redhat.com> wrote:
> On 06/15/2018 05:54 PM, Peter Maydell wrote:
>> Why should the VM ever care about where the address regions in the
>> host happen to be when it comes to where it's putting its RAM
>> in the VM's address layout? I feel like I'm missing something here...

> The VM cannot use RAM GPA that matches assigned device reserved IOVA
> regions. When you assign a device, the whole VM RAM is mapped in the
> physical IOMMU and IOVA corresponds to GPA. but sometimes some IOVA
> cannot be used due to the host specificities and especially iommu
> peculiarities. Some IOVAs may be simply "bypassed" by the iommu, like on
> x86 and also with some ARM SMMU integration. In such a case the DMA
> accesses have no chance to reach the guest RAM as expected. Hope it
> clarifies.

Hmm. We don't want to have the address layout of
the VM have to cope with all the various oddities that host
systems might have. Is this kind of thing common, or rare?
I'd much rather just say "we don't support device passthrough
on that sort of system".

thanks
-- PMM
