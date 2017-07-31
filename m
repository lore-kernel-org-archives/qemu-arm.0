Received: by 10.25.44.15 with SMTP id s15csp3651968lfs;
        Mon, 31 Jul 2017 07:06:31 -0700 (PDT)
X-Received: by 10.55.134.132 with SMTP id i126mr20252583qkd.5.1501509991086;
        Mon, 31 Jul 2017 07:06:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1501509991; cv=none;
        d=google.com; s=arc-20160816;
        b=fs40IoHCBEfztuy36zVHfZ6zYsxor3Gi7e1euuN4Kx4FyDIE0Rbbx9QSQYn0NaVSId
         4aTDOe3T7OH31jTjI1F6fsHSAsHLfJbOlQ7xgd89ebLD3SidtOZiCzSzoESTgoGeV9vg
         bXzSpjpVvlmN/stXFHJoI++O2U0pT6xoh6PNUxwiBsDP9g0rKXaDZ8lST2eVXuSUocpe
         QHEtivL5+/ofEN07Cc0DJs7vRBnl3QwMVK8PUP1pijkFxxZnekGyRXdApLZrses2bo/8
         UGzcGtlCRTgMFUMUnSsMSqqoNcKjXggEHA4o3SsKEPBIfrnbTnCN4VicHaI61oLKK24z
         4NHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dmarc-filter:arc-authentication-results;
        bh=SFnm0EyLPEIv1+y+Sicz7WhVQEKNy4TJITgkqVLwXBI=;
        b=ntzQixEHHV6TS5hSvTKYNNVXin9jaW9jwY4yEfcRcDJJMpWOsclbRZZD8Q4ClMKYCe
         NrQBesfjJd8xdclK6ALJbrqpfOq9v2FMNDNi3dKlj2zO/sZRse+STaJ6NlRzcOwAGUoo
         scAd62XJIBxA+Clr5Wr3vfV+J2Y9vyun3bzCUVX8H6fWUfX3bbu1ZV+Eo1PmLB/0PCzf
         yWaT2ZvTZ/GcwEIkzrxiHQgSVEVWHy32hnHRP0I0s3rHHarwKyCzEKPqDB8FE0SONViV
         h60MJ4QRPFEbjTBWQIUIMx43qTrMQQfRAkFlbntEmwSZgW8ou/b3mY30dOmYdoC5Fpxg
         ssRg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t50si9800226qte.102.2017.07.31.07.06.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 31 Jul 2017 07:06:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:59782 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dcBL2-0007n1-9U
	for alex.bennee@linaro.org; Mon, 31 Jul 2017 10:06:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57147)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1dcBKz-0007mu-BW
	for qemu-arm@nongnu.org; Mon, 31 Jul 2017 10:06:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1dcBKw-0005DN-7C
	for qemu-arm@nongnu.org; Mon, 31 Jul 2017 10:06:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43816)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1dcBKw-0005Bo-12; Mon, 31 Jul 2017 10:06:22 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D0225FEF1C;
	Mon, 31 Jul 2017 14:06:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com D0225FEF1C
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx09.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=mst@redhat.com
Received: from redhat.com (ovpn-124-89.rdu2.redhat.com [10.10.124.89])
	by smtp.corp.redhat.com (Postfix) with SMTP id 1546417DEA;
	Mon, 31 Jul 2017 14:06:12 +0000 (UTC)
Date: Mon, 31 Jul 2017 17:06:11 +0300
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Diana Madalina Craciun <diana.craciun@nxp.com>
Message-ID: <20170731170217-mutt-send-email-mst@kernel.org>
References: <1495537965-4187-1-git-send-email-diana.craciun@nxp.com>
	<20170525011034-mutt-send-email-mst@kernel.org>
	<AM3PR04MB061619F6FDC53F7FD4C1DAE4FFF10@AM3PR04MB0616.eurprd04.prod.outlook.com>
	<20170706023845-mutt-send-email-mst@kernel.org>
	<AM3PR04MB0616507B6F0989360D582F37FFB20@AM3PR04MB0616.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM3PR04MB0616507B6F0989360D582F37FFB20@AM3PR04MB0616.eurprd04.prod.outlook.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.38]);
	Mon, 31 Jul 2017 14:06:21 +0000 (UTC)
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
X-TUID: xmjXpMmZQuDp

On Mon, Jul 31, 2017 at 01:22:45PM +0000, Diana Madalina Craciun wrote:
> >> If we are to use a value of 0 for the constant in case of PCI devices,
> >> what happens if we have multiple PCI controllers?
> > I guess we'd use the PCI Segment number for that?
> >
> >
> 
> Yes, we can use the PCI segment for this scenario. But this would mean
> different solutions for the same problem. The main problem is that we
> can have multiple entities in the system that are using MSIs (for now
> PCI and NXP non-PCI bus infrastructure
> (https://lwn.net/Articles/635905/). I guess that we may have other
> platform devices that are using MSIs in the future.
> 
> Thanks,
> Diana
> 
> 

Don't have the time to explore NXP in depth, sorry - there's
a lot of complexity there.
Could you maybe stick some bits to specify bus type in there?
It just looks very wrong to push low level things like this
that users have no interest in up the stack.

-- 
MST
