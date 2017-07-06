Received: by 10.25.44.15 with SMTP id s15csp2646817lfs;
        Thu, 6 Jul 2017 16:30:14 -0700 (PDT)
X-Received: by 10.200.46.253 with SMTP id i58mr67110250qta.89.1499383814812;
        Thu, 06 Jul 2017 16:30:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499383814; cv=none;
        d=google.com; s=arc-20160816;
        b=kXszcPgMxdDHJdA+0CIJ0vY97xHRwig/gf1mTDFGHpDznTaoHDg0BgGSFTucsHK0Vz
         79IZ3+d3MNhL9I17phAz2MS8kLHOj9ST8HkXd2Q1gYPlzmZoYVA6BiiDGnL5x3occKER
         pVrvPa/dyMefMVrVFPsuEXWmE75W2QYfvISsNv4859x+KjJLAFtvy9pLiCKKIXGWeRRU
         KMGzBfzWdYaTGMwitr5pVffcmBL13u+StwuHkI1oTjBEICKdJpLhQU/8q5g2yo6CrBkH
         sfXnT6zfacP5ldfSJA/2IZ68Evve0JiGJl59mJ+XEctha1qYA0hXXVzNJOnodv3K24PW
         q9CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-filter:dmarc-filter:arc-authentication-results;
        bh=JQ1GeNxb3TKi45tHAXA4ax2fYWl9/zygwCEeFH+frwQ=;
        b=nz49pPqgvKEQD6iVeOMpZmNWuy+LB4ProFMjeUQ3ygphY7mAAXWWJFqnncYpM0nti6
         KbbYuxNkmBaPzoMdfsXqp1TJlYDHUf3qzchS12FJx3UVqBJwOtlhgUgcfzLntG9KaAfW
         KSfwEVx4E/qmwTgJ3x9PRagPJi8t14hnFt+djHKiqiywMKroDMRSlu+7Kn/P8APGUrGw
         79egs8Lll1i0Dx7cb0+6wwRPYWXP+Fz5cz1BcLXjBHsqCmmGqo+cf4aUOaPn8gsTwWxt
         8iaPGh9HC5QjFnDcETd0OSqOB8G9zf5JRX82TyteNjZYLx7G2WkC+YtP4QvDfFDpTwmG
         eYlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d191si1419867qkb.226.2017.07.06.16.30.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 06 Jul 2017 16:30:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53641 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dTGDs-0004zu-16
	for alex.bennee@linaro.org; Thu, 06 Jul 2017 19:30:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56710)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1dTGDk-0004yn-0d
	for qemu-arm@nongnu.org; Thu, 06 Jul 2017 19:30:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1dTGDg-0003W2-U1
	for qemu-arm@nongnu.org; Thu, 06 Jul 2017 19:30:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55884)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1dTGDg-0003VQ-NO; Thu, 06 Jul 2017 19:30:00 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id C15A28553D;
	Thu,  6 Jul 2017 23:29:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com C15A28553D
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=mst@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com C15A28553D
Received: from redhat.com (ovpn-123-33.rdu2.redhat.com [10.10.123.33])
	by smtp.corp.redhat.com (Postfix) with SMTP id 770A560F8A;
	Thu,  6 Jul 2017 23:29:51 +0000 (UTC)
Date: Fri, 7 Jul 2017 02:29:51 +0300
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Kalra, Ashish" <Ashish.Kalra@cavium.com>
Message-ID: <20170707022732-mutt-send-email-mst@kernel.org>
References: <6f22079e-4b4b-6476-77be-51ec83104c0d@redhat.com>
	<AM5PR0401MB25459FDAA8C9AFA52503AAE99AC40@AM5PR0401MB2545.eurprd04.prod.outlook.com>
	<c80977c4-1955-4e9d-3fc8-4d884562fd28@redhat.com>
	<HE1PR0401MB2556D19D91F25DCE96FE7B199AD40@HE1PR0401MB2556.eurprd04.prod.outlook.com>
	<8a7fb667-e6c0-2412-6dca-a8233dd27836@redhat.com>
	<HE1PR0401MB255696A487DFEB2B8972980F9AD40@HE1PR0401MB2556.eurprd04.prod.outlook.com>
	<e9ea564a-f02b-0ed5-e700-b7b1dfd89722@arm.com>
	<AM5PR0401MB25459345E9533FFC3BBE00289AD50@AM5PR0401MB2545.eurprd04.prod.outlook.com>
	<15b631c8-5708-1426-90a2-9be51a796614@redhat.com>
	<BN4PR07MB2161B5CCE84496804B848326E3D50@BN4PR07MB2161.namprd07.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN4PR07MB2161B5CCE84496804B848326E3D50@BN4PR07MB2161.namprd07.prod.outlook.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 06 Jul 2017 23:29:59 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v2 0/8] VIRTIO-IOMMU device
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"kevin.tian@intel.com" <kevin.tian@intel.com>,
	"drjones@redhat.com" <drjones@redhat.com>,
	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	"tn@semihalf.com" <tn@semihalf.com>,
	"will.deacon@arm.com" <will.deacon@arm.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Auger Eric <eric.auger@redhat.com>,
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"marc.zyngier@arm.com" <marc.zyngier@arm.com>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	Bharat Bhushan <bharat.bhushan@nxp.com>,
	"christoffer.dall@linaro.org" <christoffer.dall@linaro.org>,
	"eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VRt7zVl6oYej

On Thu, Jul 06, 2017 at 11:23:41PM +0000, Kalra, Ashish wrote:
> I have a generic question on vIOMMU support, is there any proposal/plan to add ATS/PRI extension support to vIOMMUs and allow
> handling for end to end (v)IOMMU Page faults (w/t the device side implementation on Vhost) ?
> 
> Again, the motivation will be to do DMA on paged guest memory and potentially avoiding the requirement of pinned/locked
> guest physical memory for DMA.
> 
> Thanks,
> Ashish

If that's your goal, first step would be support in VFIO.
End to end would only be helpful when running userspace
drivers within guest, or nested virt.

-- 
MST
