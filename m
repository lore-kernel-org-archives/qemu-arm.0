Received: by 10.223.197.9 with SMTP id q9csp763201wrf;
        Wed, 11 Oct 2017 09:09:29 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QAko/TxpIpJP98TOzDc9kEf06burntMRQs04gfGzt2b0/kD4wKIagbOA2oUWrKh9ODv5j1O
X-Received: by 10.237.49.162 with SMTP id 31mr223656qth.240.1507738169641;
        Wed, 11 Oct 2017 09:09:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507738169; cv=none;
        d=google.com; s=arc-20160816;
        b=H9JP55/+k9a3p8gDhP4GNweV4mAf+x7cqmM97PWgOTyyheaii7REuegNIHLMz58o7l
         XRWiQxPVrk3vZcwrrJvh5tHRlWE0B+rGbn+j5be6f85HEbUCmZugTudALzyu8w4aodtr
         Z9pU3iNOB7Rzw8n29K5iEGinnFYvm/yNVnbXa9YI4U44i4hoJk/tPsdhVn4A11lVWY6y
         +fzEX/6l+VA6T56DrWZdaDn2PAeKULHwyPaXaSjh8ZStHUK4sOCPno0o5cqR/D/yPddt
         Ly85VQbcMAM9Ey82q7Rq2saG/B9W60nR3KlNl449h+B4dxiS6H0H21ci3Cjtxe9URzNQ
         UC2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:dmarc-filter
         :arc-authentication-results;
        bh=R6n44n1z9PK9HzxOC2NjQNSc4U8wsqqmdeGO1QYqO0Y=;
        b=X+ovl579NqTPrmpZRChcRWBm4F06eHYDxboex/mgoooA/nRaO3fSHWM0zrOCgKqODZ
         8AQazJvLRnOa9pJjGS6Xx3kpNrYy+Uz0dGeqqdK5jEh2WNzoyvaV/4cRNLczPIOpJBdc
         WHoXQQ/iZRPGeY5kmCEmFh3jCtCaGc+s6uv3nWVlWM4pIYmyHoq4FEfnf7aXV2RV4E9A
         mMyaSj7tOShx/Fkh3lkBRvyfr/bnNOmwtNOnSH8iP9Jbsw98spMwu5AjEOC+S9J1pNX7
         4N3n9hgmTsWpUzpM5tn+NZiYkIBw4TC3FOmWxgYr+hYb9pON/H4YODefPR1wTqyENYiB
         slUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m9si1267448qke.204.2017.10.11.09.09.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 11 Oct 2017 09:09:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41718 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e2JZX-0007jP-DD
	for alex.bennee@linaro.org; Wed, 11 Oct 2017 12:09:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47981)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1e2JZO-0007ii-7C
	for qemu-arm@nongnu.org; Wed, 11 Oct 2017 12:09:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1e2JZL-0004RT-1J
	for qemu-arm@nongnu.org; Wed, 11 Oct 2017 12:09:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41168)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1e2JZK-0004RE-RG; Wed, 11 Oct 2017 12:09:14 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E321F7D0CF;
	Wed, 11 Oct 2017 16:09:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com E321F7D0CF
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=eric.auger@redhat.com
Received: from localhost.localdomain (ovpn-117-172.ams2.redhat.com
	[10.36.117.172])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6032163BAA;
	Wed, 11 Oct 2017 16:09:00 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <1505807208-9063-1-git-send-email-eric.auger@redhat.com>
	<CAFEAcA-0MK18DakmNPRXCNYbDpBvzE0h12nNjg7zr+F_m0EnDw@mail.gmail.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <f3a263b7-27e6-26df-592d-a34902bab6fe@redhat.com>
Date: Wed, 11 Oct 2017 18:08:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-0MK18DakmNPRXCNYbDpBvzE0h12nNjg7zr+F_m0EnDw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Wed, 11 Oct 2017 16:09:14 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [RFC v4 00/16] VIRTIO-IOMMU device
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
Cc: "Tian, Kevin" <kevin.tian@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>,
	jean-philippe.brucker@arm.com, Tomasz Nowicki <tn@semihalf.com>,
	Will Deacon <will.deacon@arm.com>,
	Andrew Jones <drjones@redhat.com>, Peter Xu <peterx@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Marc Zyngier <marc.zyngier@arm.com>,
	Alex Williamson <alex.williamson@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, linuc.decode@gmail.com,
	Bharat Bhushan <bharat.bhushan@nxp.com>,
	Christoffer Dall <christoffer.dall@linaro.org>, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gm2+tRf9lRFS

Hi Peter,

On 11/10/2017 16:56, Peter Maydell wrote:
> On 19 September 2017 at 08:46, Eric Auger <eric.auger@redhat.com> wrote:
>> This series implements the virtio-iommu device.
>>
>> This v4 is an upgrade to v0.4 spec [1] and applies on QEMU v2.10.0.
>> - probe request support although no reserved region is returned at
>>   the moment
>> - unmap semantics less strict, as specified in v0.4
>> - device registration, attach/detach revisited
>> - split into smaller patches to ease review
>> - propose a way to inform the IOMMU mr about the page_size_mask
>>   of underlying HW IOMMU, if any
>> - remove warning associated with the translation of the MSI doorbell
>>
>> The device gets instantiated using the "-device virtio-iommu-device"
>> option. It currently works with ARM virt machine only, as the machine
>> must handle the dt binding between the virtio-mmio "iommu" node and
>> the PCI host bridge node.
> 
> Could this work on x86, or is it inherently arm-only?

Yes this is the goal. At the moment the ACPI probing is not yet properly
specified but a Q35 prototype was developed in the Red Hat Virt team.
This will be presented at the KVM forum.

Thanks

Eric
> 
> thanks
> -- PMM
> 
