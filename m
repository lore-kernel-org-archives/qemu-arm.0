Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp1040874wrq;
        Fri, 15 Jun 2018 09:22:08 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKZGQNMcjg9f+wfc08WketnUaDdjMm3HLcM3pX6IpCHIE7xk0zZ05soBYhxg+CvElTzhvPb
X-Received: by 2002:ac8:1944:: with SMTP id g4-v6mr1993134qtk.395.1529079728576;
        Fri, 15 Jun 2018 09:22:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529079728; cv=none;
        d=google.com; s=arc-20160816;
        b=kIJsUiBOfD4eUL3dRhdO2eQw9a6k7OnCHr115hRsyrJnGrFtTqQwWZOx36OJzh04Pj
         p5JAqtXx9CGOQjeRNNtuvTR/1TlWGsI1cKM0vNClX93eIJAxPizqrrfJ624KmYQnjHbO
         OI1WIvYTB9mOEFZk2JagBC8HDS8BwjhGqAaR9QPkIAR+dbnwhhZs9DUJZLhMgN42SXqv
         6xYBN+LWZ5mNkJ50zrNBEmy4uOaJYivA7f4JAboXeJcHCj57MeRrw4ShwRKxd8c5UA1H
         FS2AObOsubHst9gCnt3uKc7csCf9HgrhrcRYL9YPXdzS3ugl2FtbsNYpYhBAxU2+xro6
         HdEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :arc-authentication-results;
        bh=HdbQyAbsN94uTd/LYhmWcy8mS0tlY5rVrD92EUTQz5w=;
        b=btmcpSFECwoUCtWQjRaZ6uwTfrKiiLcTnemh6ihT3w2skWCvoKNbqBUahUbiEGYrNR
         IxhN/9ZerK7HYKx4pNFMcMJWxsq3ElLRr7mBdnJJ3waMqLdQE44zxhuhMJ4Q+aJGef9c
         VbVcGInBbWE29R1RTtqGXOjTMc8srkAkpcu1vEHYEydzp4VQGGrMSZ/0rjd4fJBFVsw3
         yY8y1CigYj/MO6esnmgHUE6Xzx0scgN73FhfwxZMkkf3eYLllBSrHYzMDk7qCYB+I67o
         O1xgHp7Ab2T938Emh1fQ0cLIs158TVhlYpJFMGsNFu0No65Hzi1/F5W6xS3xN5ogl7dt
         gZrg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 68-v6si3479765qkc.114.2018.06.15.09.22.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 15 Jun 2018 09:22:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47968 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fTrUG-0000KI-22
	for alex.bennee@linaro.org; Fri, 15 Jun 2018 12:22:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57306)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1fTquE-0003OV-58
	for qemu-arm@nongnu.org; Fri, 15 Jun 2018 11:44:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1fTquB-0002cL-2U
	for qemu-arm@nongnu.org; Fri, 15 Jun 2018 11:44:54 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:53022 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1fTquA-0002bb-Hd; Fri, 15 Jun 2018 11:44:50 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0718280125D6;
	Fri, 15 Jun 2018 15:44:50 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 171376352F;
	Fri, 15 Jun 2018 15:44:43 +0000 (UTC)
Date: Fri, 15 Jun 2018 17:44:41 +0200
From: Andrew Jones <drjones@redhat.com>
To: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Message-ID: <20180615154441.4rr5mtcnran5cf3s@kamzik.brq.redhat.com>
References: <20180516152026.2920-1-shameerali.kolothum.thodi@huawei.com>
	<20180516152026.2920-7-shameerali.kolothum.thodi@huawei.com>
	<bd67ed40-81d6-58dc-ccaf-efd8a40ca96f@redhat.com>
	<5FC3163CFD30C246ABAA99954A238FA8386F6E04@FRAEML521-MBX.china.huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5FC3163CFD30C246ABAA99954A238FA8386F6E04@FRAEML521-MBX.china.huawei.com>
User-Agent: NeoMutt/20180512
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.8]);
	Fri, 15 Jun 2018 15:44:50 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]);
	Fri, 15 Jun 2018 15:44:50 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'drjones@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v2 6/6] hw/arm: Populate
 non-contiguous memory regions
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
	Zhaoshenglong <zhaoshenglong@huawei.com>, Linuxarm <linuxarm@huawei.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Auger Eric <eric.auger@redhat.com>,
	"alex.williamson@redhat.com" <alex.williamson@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	"imammedo@redhat.com" <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8HsFD2JCRODq

On Tue, Jun 05, 2018 at 07:49:44AM +0000, Shameerali Kolothum Thodi wrote:
> > > On 05/16/2018 05:20 PM, Shameer Kolothum wrote:
> > > > In case valid iova regions are non-contiguous, split the
> > > > RAM mem into a 1GB non-pluggable dimm and remaining as a
> > > > single pc-dimm mem.
> > >
> > > Please can you explain where does this split come from? Currently we
> > > have 254 GB non pluggable RAM. I read the discussion started with Drew
> > > on RFC v1 where he explained we cannot change the RAM base without
> > > crashing the FW. However we should at least document this  1GB split.
> > 
> > The comments were mainly to use the pc-dimm model instead of "mem alias"
> > method used on RFC v1 as this will help to add the mem hot-plug support
> > in future.
> > 
> > I am not sure about the motive behind Drew's idea of splitting the first
> > 1GB as non-plug and remaining as a pc-dimm(cold). May it is to attempt a
> > best effort scenario, but as I mentioned in reply to 0/6, the current solution
> > will end up changing the base address if the 0x4000000 falls under a reserved
> > region.
> > 
> > Again, not sure whether we should enforce a strict check on base address
> > start or just warn the user that it will fail on Guest with UEFI boot[1].
> > 
> > Hi Drew,
> > 
> > Please let me know your thoughts on this.
> 
> Could you please take a look at the above discussion and let us
> know your thoughts on the split of mem regions as 1GB non-pluggable
> and rest as pc-dimm.
> 

Hi Shameer,

Sorry for the slow reply - I've been slowly catching back up after
vacation. There are two reasons to have one non-pluggable memory region
and the rest of memory in a single pluggable pc-dimm.

1) For mach-virt we must have the base of memory at the 1G boundary,
   both because otherwise we'll break ArmVirt UEFI and because that's
   a guarantee that Peter has stated he'd like to keep for mach-virt.

2) Memory split in this way already has precedent in the x86 PC
   machine models.

It's debatable how much memory we should allocate to the non-pluggable
region. It doesn't need to be 1G, it could be smaller. The default
memory size allocated to a mach-virt guest that doesn't provide '-m'
on the command line is 128M. Maybe we should use that size?

If 0x40000000 falls into a reserved address region on some host, then
I'm afraid the mach-virt model won't work with those devices unless the
guest doesn't use UEFI and Peter is open to providing a machine property
that one can enable in order to move the base address of memory.

I know Eric is looking at this problem too. I hope you guys are
coordinating your efforts.

Thanks,
drew
