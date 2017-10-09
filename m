Received: by 10.223.197.9 with SMTP id q9csp2698961wrf;
        Mon, 9 Oct 2017 10:50:59 -0700 (PDT)
X-Received: by 10.237.42.167 with SMTP id t36mr1942995qtd.320.1507571459502;
        Mon, 09 Oct 2017 10:50:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507571459; cv=none;
        d=google.com; s=arc-20160816;
        b=Rzr3VdwRov7ZkV6eBRm1MC/iFYR9YoLdEPkjIFT1SapkXsDTSZ8OQNGJPA/BP7kRRD
         CTedlW7mUwaLb7JcuO57BgvSrXN/GU/DomSjUslEQ54O+Vrupg4+oiN3tNjWc+O282vR
         ueiPqzbM5paYhOfW3nfmhI6aBb5vpf4UIlz7BpLd6OglcLuuQq1PH9IEWbg65CXEJqYK
         9QmHvRDp7TdBGzgXB3+8SM0LN8LJyTcThJVKYOguET+Wev77mBzwOopJsp8byAhce02m
         2t/zBR1h8x+R+Jk5kUwQoqYbVXTcvVlA01m+2rSXojHgXd/xN4+0wGC2FevCYuvGlOYg
         pEDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=044jgSd/tSH93ldwJqYmsaGulja4XlBr8zR4ngjUtuQ=;
        b=sL4yzpegnuwnxwf1TbpTRF6qPkY56bd4vhmmZpQ9poFUA6TXsLPUSo/cvWaeKVSN41
         2cGhFsr8I8S/lBKVosuU31VBL6jnV1t2eywzgV1zaOLf4+8QQP0Ls6H1Z9ztfY9+U7Dq
         2V6s/hAcY90cl1UAtRGQIElVucG0s62GDupcuoGd3x5ictbDf3O6UHv81yCpqyPaAc0p
         Aj47SzpmEzp1kacBi1rr/D9bvQkQnLRWKd32qfNiGZZ6f4SJZ14E3e06HC/m8xzSbeTY
         FyWUGHTYlwGvZtIT3yfhrUNPYhEnwWqjbbbGy2UyAhrCWmGUE8WcH2PMxQ7dcwRpqHsB
         y5Zg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UoIHBYBl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p11si2823487qtb.373.2017.10.09.10.50.59
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Oct 2017 10:50:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UoIHBYBl;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59128 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e1cCh-0000MU-2H
	for alex.bennee@linaro.org; Mon, 09 Oct 2017 13:50:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57698)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e1cBO-0007zV-Vj
	for qemu-arm@nongnu.org; Mon, 09 Oct 2017 13:49:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e1cBO-0006n5-41
	for qemu-arm@nongnu.org; Mon, 09 Oct 2017 13:49:39 -0400
Received: from mail-wm0-x234.google.com ([2a00:1450:400c:c09::234]:53146)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e1cBN-0006mh-TK
	for qemu-arm@nongnu.org; Mon, 09 Oct 2017 13:49:38 -0400
Received: by mail-wm0-x234.google.com with SMTP id k4so25637583wmc.1
	for <qemu-arm@nongnu.org>; Mon, 09 Oct 2017 10:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=044jgSd/tSH93ldwJqYmsaGulja4XlBr8zR4ngjUtuQ=;
	b=UoIHBYBl6iZB6bvaI852cu71awy/bVu7gja6s+t0w51o6ZnrNa8SNM8CSd+IeDMHuj
	30gmV22flbTNDMFG4M9TPLDuXFdnQIj7VqijyVSQplIHV3R4Y1BbBp+cZPY7LP3neNy8
	Xny//cwhrqj5GdhKTSWQnV5edX7tVGR+DDohA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=044jgSd/tSH93ldwJqYmsaGulja4XlBr8zR4ngjUtuQ=;
	b=Ql6A+wUajrm589Q/+YbOlb1z6gfyOnoB9fsPoidfG+uw5JRwUjcPQCPYRGE3YKQ4B1
	hKtd6bc0GH05y0qfmSDYBMoD92Ni2RNTiBZnZpuhWr/+c0nFM0xB0T+0KjmkvOscUPQl
	SsqzQTPMhv6ankeaPjetYkREk06KQ5fi6JGHz0pDGv1U0qruXF5ZLgEdk95d2OMvaXx4
	4CDy4w6RlkXVlZqCvuWEoxiZyudsjwpedbRV86sxji5tr5avbeTwZ1ciL002GOkhn9Tv
	8cvoyKwsp4k0H7yAaux+ieLCUdG7MKEKuCa+dtNRlpbMq1ETjQeAcdzWrLIvUj6S201V
	3TPQ==
X-Gm-Message-State: AMCzsaVu8ZSDR0XKr1aVTU7xbOVTvlIA3hyBc2Y21GexQcduw+K5qTud
	Fy81vII8jFieHnC8cpUUyLueROWGvemRCaff9yQOQA==
X-Google-Smtp-Source: AOwi7QD8w/aqAkUz5+Y0PEONmVsMgZutLNYvhyvknpI+cK2yyXa1NmMAurvV0PfVvPxNGQSBgPAvyBnj1nb8piiPOro=
X-Received: by 10.28.23.3 with SMTP id 3mr8533609wmx.62.1507571376669; Mon, 09
	Oct 2017 10:49:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.128.207 with HTTP; Mon, 9 Oct 2017 10:49:16 -0700 (PDT)
In-Reply-To: <1504286483-23327-21-git-send-email-eric.auger@redhat.com>
References: <1504286483-23327-1-git-send-email-eric.auger@redhat.com>
	<1504286483-23327-21-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Oct 2017 18:49:16 +0100
Message-ID: <CAFEAcA_bApUy+B5TnZrot0x5okOZyt2F8qhCodHkvgOPhUhMgg@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::234
Subject: Re: [Qemu-arm] [PATCH v7 20/20] hw/arm/smmuv3: [not for upstream]
 Add caching-mode option
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
Cc: Radha Mohan <mohun106@gmail.com>, Andrew Jones <drjones@redhat.com>,
	Trey Cain <tcain@qti.qualcomm.com>,
	Radha.Chintakuntla@cavium.com, Sunil.Goutham@cavium.com,
	"Michael S. Tsirkin" <mst@redhat.com>,
	jean-philippe.brucker@arm.com, Tomasz Nowicki <tn@semihalf.com>,
	Will Deacon <will.deacon@arm.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Peter Xu <peterx@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>,
	robin.murphy@arm.com, wtownsen@redhat.com,
	Bharat Bhushan <bharat.bhushan@nxp.com>,
	Prem Mallappa <prem.mallappa@gmail.com>, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AVaYpQHki1a8

On 1 September 2017 at 18:21, Eric Auger <eric.auger@redhat.com> wrote:
> In VFIO use cases, the virtual smmu translates IOVA->IPA (stage 1)
> whereas the physical SMMU translates IPA -> host PA (stage 2).
>
> The 2 stages of the physical SMMU are currently not used.
> Instead both stage 1 and stage2 mappings are combined together
> and programmed in a single stage (S1) in the physical SMMU.
>
> The drawback of this approach is each time the IOVA->IPA mapping
> is changed by the guest, the host must be notified to re-program
> the physical SMMU with the combined stages.
>
> So we need to trap into the QEMU device each time the guest alters
> the configuration or TLB data. Unfortunately the SMMU does not
> expose any caching mode as the Intel IOMMU. On Intel, this caching
> mode HW bit informs the OS that each time it updates the remapping
> structures (even on map) it must invalidate the caches. Those
> invalidate commands are used to notify the host that it must
> recompute S1+S2 mappings and reprogram the HW.
>
> As we don't have the HW bit on ARM, we currently rely on a
> a FW quirk on guest smmuv3 driver side. When this FW quirk is
> applied the driver performs TLB invalidations on map and
> sends SMMU_CMD_TLBI_NH_VA_AM commands.
>
> Those TLB invalidations are used to trap changes in the
> translation tables.
>
> We introduced a new implemented defined SMMU_CMD_TLBI_NH_VA_AM
> command since it allows to inavlidate a whole range instead
> of invalidating a single page (native SMMU_CMD_TLBI_NH_VA command).
>
> As a consequence anybody wanting to use virtual smmuv3 in VFIO
> use case must add
> -device smmuv3,caching-mode
> to the option line.

Even more of a NACK on this one. We shouldn't need to do
weird things to be able to use the SMMU in a VM. We need
to figure out how the spec expects us (and the kernel)
to be using the SMMU, and do that.

thanks
-- PMM
