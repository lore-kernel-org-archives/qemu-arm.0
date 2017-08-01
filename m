Received: by 10.25.44.15 with SMTP id s15csp4297066lfs;
        Mon, 31 Jul 2017 19:06:04 -0700 (PDT)
X-Received: by 10.55.212.194 with SMTP id s63mr14718382qks.102.1501553164795;
        Mon, 31 Jul 2017 19:06:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501553164; cv=none;
        d=google.com; s=arc-20160816;
        b=Evu6ukMixsBNJjoAy7weMAWxhxXA0WhiB+X5epQMZ1g4ZBrlY/Jq9LaoYd4LcMva3K
         eCZL6BFIwG2iT1wqzQma8vShBzTbu82T9l2iADkkrOjbXmoRCI1mTUrywlafinLNZVSc
         EIoqu24/xMlkmPMz8Xq+m4wl62RKVNNvWp707EoyPXVCOL+4vvzRDrZQKK5/TuALs/JD
         0rd8J3mjs5I3bMaeXbkJxfKgqkEaSsm0ZF62o/Eqs9sEJf8fSZNAsuW2oruIFFuqB5u5
         KwNsGYgf0ClNHnvstti4tG+oSEhNQFdy/j8k908qVnaPQatMrG+JkrZv+V50FjizpUNZ
         xFFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:arc-authentication-results;
        bh=9paQLRxFOaqM4i1EJGtmv9wB/phjCBESOBTyqaB0Q24=;
        b=y7DHndYxlN7mxaPLtX+Rvnr8676DIFkUm8se/CzsA/j6VKaGcaD1f/1E+2IGssEGeW
         MPBvFRDPcddfi8PS/I17gdFdgH/f/7O6RTGegBTs6EZ84tneYhUvlcq22zsX8t1IZmeD
         ZNtFotFwDIs46zBik7SMI2ZJcUAgxO/9rt28JzCgIKKJeInxEqihU9xbgdg+2V+1qo8t
         e0Rz+RvgsI17IX/t0bQSvBKxnJRRJfrZD3VSXZ6bvzmVXdwacLNKbF8w9OAu1kUqgARE
         SqvSCNFQWA35RDuEl/wIH93eJtq7/TIW7LjPDtiizdjk86hkodHwq+GkYr5EaNOivyjT
         7WcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x10si7107404qta.192.2017.07.31.19.06.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 31 Jul 2017 19:06:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34079 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dcMZO-0004cV-2m
	for alex.bennee@linaro.org; Mon, 31 Jul 2017 22:06:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35165)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1dcMZI-0004cQ-PJ
	for qemu-arm@nongnu.org; Mon, 31 Jul 2017 22:05:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1dcMZF-0001zU-G6
	for qemu-arm@nongnu.org; Mon, 31 Jul 2017 22:05:56 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36102)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1dcMZF-0001xI-4L; Mon, 31 Jul 2017 22:05:53 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4DFD752073;
	Tue,  1 Aug 2017 02:05:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 4DFD752073
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx03.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=mst@redhat.com
Received: from redhat.com (ovpn-120-47.rdu2.redhat.com [10.10.120.47])
	by smtp.corp.redhat.com (Postfix) with SMTP id C589F60176;
	Tue,  1 Aug 2017 02:05:42 +0000 (UTC)
Date: Tue, 1 Aug 2017 05:05:42 +0300
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Diana Madalina Craciun <diana.craciun@nxp.com>
Message-ID: <20170801045857-mutt-send-email-mst@kernel.org>
References: <1495537965-4187-1-git-send-email-diana.craciun@nxp.com>
	<20170525011034-mutt-send-email-mst@kernel.org>
	<AM3PR04MB061619F6FDC53F7FD4C1DAE4FFF10@AM3PR04MB0616.eurprd04.prod.outlook.com>
	<20170706023845-mutt-send-email-mst@kernel.org>
	<AM3PR04MB0616507B6F0989360D582F37FFB20@AM3PR04MB0616.eurprd04.prod.outlook.com>
	<20170731170217-mutt-send-email-mst@kernel.org>
	<AM3PR04MB061656F255D688500AC8622BFFB20@AM3PR04MB0616.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM3PR04MB061656F255D688500AC8622BFFB20@AM3PR04MB0616.eurprd04.prod.outlook.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Tue, 01 Aug 2017 02:05:47 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH v2 0/2] Add global device ID in virt machine
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"eric.auger@redhat.com" <eric.auger@redhat.com>,
	Mike Caraman <mike.caraman@nxp.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"marcel@redhat.com" <marcel@redhat.com>,
	Bharat Bhushan <bharat.bhushan@nxp.com>,
	"christoffer.dall@linaro.org" <christoffer.dall@linaro.org>,
	Laurentiu Tudor <laurentiu.tudor@nxp.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dcDZntRmQite

On Mon, Jul 31, 2017 at 03:13:09PM +0000, Diana Madalina Craciun wrote:
> On 07/31/2017 05:06 PM, Michael S. Tsirkin wrote:
> > On Mon, Jul 31, 2017 at 01:22:45PM +0000, Diana Madalina Craciun wrote:
> >>>> If we are to use a value of 0 for the constant in case of PCI devices,
> >>>> what happens if we have multiple PCI controllers?
> >>> I guess we'd use the PCI Segment number for that?
> >>>
> >>>
> >> Yes, we can use the PCI segment for this scenario. But this would mean
> >> different solutions for the same problem. The main problem is that we
> >> can have multiple entities in the system that are using MSIs (for now
> >> PCI and NXP non-PCI bus infrastructure
> >> (https://emea01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flwn.net%2FArticles%2F635905%2F&data=01%7C01%7Cdiana.craciun%40nxp.com%7C6b0c6c879af64718a21908d4d81d534e%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0&sdata=bpYMMqajWzgzdbdQgy%2FUYR7y%2BswyvwE%2BqFzs7wdIkkA%3D&reserved=0). I guess that we may have other
> >> platform devices that are using MSIs in the future.
> >>
> >> Thanks,
> >> Diana
> >>
> >>
> > Don't have the time to explore NXP in depth, sorry - there's
> > a lot of complexity there.
> > Could you maybe stick some bits to specify bus type in there?
> > It just looks very wrong to push low level things like this
> > that users have no interest in up the stack.
> >
> Let's generalize the problem a little bit, the NXP details just does not
> matter much. The problem we have is the following:
> 
> The GIC-ITS, the ARM MSI controller is using deviceIDs in order to remap
> the interrupts. Each device which is expected to send MSIs has a
> deviceID associated with it. These deviceIDs are configured into devices
> by software/firmware. There is support in the device tree to specify the
> correlation between requesterID and deviceID:
> 
> "msi-map: Maps a Requester ID to an MSI controller and associated
>   msi-specifier data. The property is an arbitrary number of tuples of
>   (rid-base,msi-controller,msi-base,length)"
> (https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/pci/pci-msi.txt)
> 
> Our problem is that we have to allocate these deviceIDs in QEMU as well
> and we have to ensure that they are unique. Currently, for PCI, the
> assumption requesterID=deviceID is made which will no longer be true in
> case other devices are added. So we need a way (preferable a general
> one) to allocate these IDs to different devices in the system in a
> consistent way which will ensure that two devices do not share the same ID.

My question would be, do other types of devices that are there
right now have some kind of ID like the requester ID?
If so I would say just use that, and set high bits in the device ID
to specify the type (e.g. 00 for pci, etc).


IMHO if possible that is preferable to pushing this up to users.


> The reason I put this ID into the controller itself is because on real
> hardware is actually programmed into the controller. It is needed (for
> example) when the MSIs are sent.
> 
> Thanks,
> 
> Diana
> 

IIUC what happens on real hardware is controller maps each requester ID
(or presumably other source ID in the request) to the device ID,
and the mapping is internal to controller.
If you wanted a lot of flexibility then looks like you could pass this
mapping to controllers, but is it really necessary?
Why don't we build a mapping that's convenient for us?


-- 
MST
