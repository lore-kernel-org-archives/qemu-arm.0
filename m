Received: by 10.25.227.6 with SMTP id a6csp1534587lfh;
        Tue, 27 Jun 2017 01:47:01 -0700 (PDT)
X-Received: by 10.55.41.14 with SMTP id p14mr4731589qkh.209.1498553221543;
        Tue, 27 Jun 2017 01:47:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1498553221; cv=none;
        d=google.com; s=arc-20160816;
        b=yg2P4/1xrT4/5FRbkw9m0QbjrgmKKlziGDtTLzu0PbzIT1HSb4+lBEOaEmegND80wD
         QC5/f3TrmnSGY0AtG03SVWoJLSzFaTwsRlmVxDIUE5UrpEwkOrJNj7mfR1jW7dpymvTz
         HN32Eowh/Fih6NuetDrKBte10Pp6JBaTIWR3mzLtZ2SjpF9JCBBpCIeN0xClfMDeWpma
         WHAooNPFfcpo56c9zNsEn1JoybqN4w5ipvop8AvdFJyMs+75UjVQ+tD3+kjOxBPKGnZL
         QiOhS4uZXP3w4ibS4ikEQ1YYOUdFuZ/zSIGIwKrf9DnT2C8gb+g1uMlUvSHGxprqUsGL
         2t5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=dGTYrvzsgn2+OPFxVc8HqmOtIsXaecB30ZzHzcXlUK0=;
        b=C61j1RKSgPMPtIM15bFAb20XJcNKRBKjiuqlKn2DgOPH8uF20QCgcGdn9m1znKhANF
         fzu2U2EHcjEjDged/aQvSSwD7k/aNJU9d3Zytfj0Ug8Najxq1EgS1SU5fWLJg2GVLm+o
         OaW/bsVglsvNDyyYK0lSxA+SP6ucbKO/j6gyoGE1jqGH8LEzGQ5+cT/n4XUrDdWhMeX7
         D3LTfZ9Sa/wPXQBBAx+6s1FBwdfmzmyjz+mSyTsulQ3oloD/95E6pZmO586nquaB/y9C
         hbUUqg0oqbw7cErSCGxQTd+p3KaX96Mg1PUFdhasJ637PODJi9A/VJr+Dhufx5i3LD08
         7GTw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r8si2242290qtb.29.2017.06.27.01.47.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Jun 2017 01:47:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51296 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dPm9C-0005p7-PU
	for alex.bennee@linaro.org; Tue, 27 Jun 2017 04:46:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48046)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <will.deacon@arm.com>) id 1dPm93-0005nB-62
	for qemu-arm@nongnu.org; Tue, 27 Jun 2017 04:46:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <will.deacon@arm.com>) id 1dPm90-0008Gj-3j
	for qemu-arm@nongnu.org; Tue, 27 Jun 2017 04:46:49 -0400
Received: from foss.arm.com ([217.140.101.70]:60932)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <will.deacon@arm.com>)
	id 1dPm8z-0008ES-Qu; Tue, 27 Jun 2017 04:46:46 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DE2922B;
	Tue, 27 Jun 2017 01:46:42 -0700 (PDT)
Received: from edgewater-inn.cambridge.arm.com
	(usa-sjc-imap-foss1.foss.arm.com [10.72.51.249])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AF79C3F581; 
	Tue, 27 Jun 2017 01:46:42 -0700 (PDT)
Received: by edgewater-inn.cambridge.arm.com (Postfix, from userid 1000)
	id 5A58C1AE0BC3; Tue, 27 Jun 2017 09:46:42 +0100 (BST)
Date: Tue, 27 Jun 2017 09:46:42 +0100
From: Will Deacon <will.deacon@arm.com>
To: Auger Eric <eric.auger@redhat.com>
Message-ID: <20170627084641.GC5759@arm.com>
References: <1496851287-9428-1-git-send-email-eric.auger@redhat.com>
	<AM5PR0401MB2545AFD256A96420ACC44CD89ACE0@AM5PR0401MB2545.eurprd04.prod.outlook.com>
	<14c83c14-1e7e-f142-77b0-fa8c873e2d41@redhat.com>
	<AM5PR0401MB2545C0E76C4BE6F82FE376D09ACE0@AM5PR0401MB2545.eurprd04.prod.outlook.com>
	<6f22079e-4b4b-6476-77be-51ec83104c0d@redhat.com>
	<AM5PR0401MB25459FDAA8C9AFA52503AAE99AC40@AM5PR0401MB2545.eurprd04.prod.outlook.com>
	<589f1642-775c-4805-74ac-bf67eb504733@arm.com>
	<5f47e723-1d3e-433b-cdaf-a56d16ba377e@redhat.com>
	<d4277d93-d29d-7150-7962-bdfdd1c2a275@arm.com>
	<6070f02d-20d3-98fb-e31a-e7dbf5010419@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6070f02d-20d3-98fb-e31a-e7dbf5010419@redhat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 217.140.101.70
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
	"mst@redhat.com" <mst@redhat.com>,
	Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
	"tn@semihalf.com" <tn@semihalf.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"marc.zyngier@arm.com" <marc.zyngier@arm.com>,
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	Bharat Bhushan <bharat.bhushan@nxp.com>,
	"christoffer.dall@linaro.org" <christoffer.dall@linaro.org>,
	"eric.auger.pro@gmail.com" <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: agmHBl+OXOW8

Hi Eric,

On Tue, Jun 27, 2017 at 08:38:48AM +0200, Auger Eric wrote:
> On 26/06/2017 18:13, Jean-Philippe Brucker wrote:
> > On 26/06/17 09:22, Auger Eric wrote:
> >> On 19/06/2017 12:15, Jean-Philippe Brucker wrote:
> >>> On 19/06/17 08:54, Bharat Bhushan wrote:
> >>>> I started added replay in virtio-iommu and came across how MSI interrupts with work with VFIO. 
> >>>> I understand that on intel this works differently but vsmmu will have same requirement. 
> >>>> kvm-msi-irq-route are added using the msi-address to be translated by viommu and not the final translated address.
> >>>> While currently the irqfd framework does not know about emulated iommus (virtio-iommu, vsmmuv3/vintel-iommu).
> >>>> So in my view we have following options:
> >>>> - Programming with translated address when setting up kvm-msi-irq-route
> >>>> - Route the interrupts via QEMU, which is bad from performance
> >>>> - vhost-virtio-iommu may solve the problem in long term
> >>>>
> >>>> Is there any other better option I am missing?
> >>>
> >>> Since we're on the topic of MSIs... I'm currently trying to figure out how
> >>> we'll handle MSIs in the nested translation mode, where the guest manages
> >>> S1 page tables and the host doesn't know about GVA->GPA translation.
> >>
> >> I have a question about the "nested translation mode" terminology. Do
> >> you mean in that case you use stage 1 + stage 2 of the physical IOMMU
> >> (which the ARM spec normally advises or was meant for) or do you mean
> >> stage 1 implemented in vIOMMU and stage 2 implemented in pIOMMU. At the
> >> moment my understanding is for VFIO integration the pIOMMU uses a single
> >> stage combining both the stage 1 and stage2 mappings but the host is not
> >> aware of those 2 stages.
> > 
> > Yes at the moment the VMM merges stage-1 (GVA->GPA) from the guest with
> > its stage-2 mappings (GPA->HPA) and creates a stage-2 mapping (GVA->HPA)
> > in the pIOMMU via VFIO_IOMMU_MAP_DMA. stage-1 is disabled in the pIOMMU.
> > 
> > What I mean by "nested mode" is stage 1 + stage 2 in the physical IOMMU.
> > I'm referring to the "Page Table Sharing" bit of the Future Work in the
> > initial RFC for virtio-iommu [1], and also PASID table binding [2] in the
> > case of vSMMU. In that mode, stage-1 page tables in the pIOMMU are managed
> > by the guest, and the VMM only maps GPA->HPA.
> 
> OK I need to read that part more thoroughly. I was told in the past
> handling nested stages at pIOMMU was considered too complex and
> difficult to maintain. But definitively The SMMU architecture is devised
> for that. Michael asked why we did not use that already for vsmmu
> (nested stages are used on AMD IOMMU I think).

Curious -- but what gave you that idea? I worry that something I might have
said wasn't clear or has been misunderstood.

Will
